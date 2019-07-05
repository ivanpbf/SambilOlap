import ssl
import sys
import random
import time
import psycopg2
import paho.mqtt.client
import paho.mqtt.publish
import datetime
import numpy as np
import json

conAccesos = psycopg2.connect(host = 'localhost', user= 'postgres',password ='pass123', dbname= 'SambilAccesos')

def on_connect(client, userdata, flags, rc):
	print('connected')

def main():
	client = paho.mqtt.client.Client("Sambil", False)
	client.on_connect = on_connect
	client.qos = 0 			
	client.connect(host='localhost')
	cur = conAccesos.cursor()

	start_dt = datetime.date.today().replace(day=1, month=1).toordinal()
	end_dt = datetime.date.today().toordinal()
	random_day = datetime.date.fromordinal(random.randint(start_dt, end_dt))	
	dia = random_day.day
	mes = random_day.month

	fechaI = datetime.datetime.now().replace(month=mes,day=dia) #la hora entrante, falta el dia
	while(True):
		entrante = int(np.random.uniform(1,21)) #Pueden entrar cualquier cantidad de personas por comodidad pongamos que sea de 1 a 20

		for i in range(entrante):					# Genera los datos para las "n" personas que entraron [0,n]

			acceso = int(np.random.uniform(1,4))  #camara de acceso o puerta
			horaAccesoE = fechaI.replace(hour=int(np.random.uniform(8,18)),minute=int(np.random.uniform(0,60)), second=int(np.random.uniform(0,60)))
			auxHoraultima = horaAccesoE #esta la usare para marcar la ultima actividad

			#creamos la cedula para la persona
			cedula = int(np.random.uniform(1,251)) #limite de 250 usuarios que pueden existir
			cur.execute('SELECT * FROM "rasgos" WHERE "cedula" = %s', [cedula])
			persona = cur.fetchone()
			seEncontro = False
			if persona is None:
				detectoRasgos =  np.random.rand()		# Random para ver si la camara pudo detectar los rasgos de la persona (edad,sexo)
				if(detectoRasgos > 0.6):
					sexoAux = int(np.random.uniform(0,2))
					edad = int(np.random.uniform(12,81))
					if sexoAux == 0:
						sexo = "F"
					else:
						sexo = "M"
					payloadR = {
						"cedula": cedula,
						"edad": edad,
						"sexo": sexo 	
					}
					client.publish('Sambil/rasgos',json.dumps(payloadR), qos=0)
				else:
					payloadNR = {
						"cedula": cedula
					}
					client.publish('Sambil/rasgos',json.dumps(payloadNR), qos = 0) #publica los rasgos que consiguio, cedula siempre se "consigue"
			else:
				seEncontro = True
				cur.execute('SELECT edad FROM "rasgos" WHERE "cedula" = %s', [cedula])
				edadr = cur.fetchone()
				if edadr is None:
					detectoRasgos =  np.random.rand()		# Random para ver si la camara pudo detectar los rasgos de la persona, ya que ha pasado antes, incrementa el chance
					if(detectoRasgos > 0.5):
						sexoAux = int(np.random.uniform(0,2))
						edad = int(np.random.uniform(12,61))	
						if sexoAux == 0:
							sexo = "F"
						else:
							sexo = "M"
						#update de los datos que se encontraron ahora si
						cur.execute('UPDATE rasgos SET "edad" = %s, "sexo" = %s WHERE "cedula" = %s;', (edad, sexo, cedula))
			tieneMAC = None
			if seEncontro:
				cur.execute('SELECT mac FROM "usuario" WHERE "cedula" = %s', [cedula])
				macaux = cur.fetchone()
				if macaux is None:
					tieneTelefono = np.random.rand()		#tal vez ahora tendra un telefono
					if(tieneTelefono > 0.4):
						mac = int(np.random.uniform(0,9999999))
						tieneMAC = True
						#pupdate
						cur.execute('UPDATE usuario SET "mac" = %s WHERE "cedula" = %s;', (mac, cedula))
				else:
					mac = macaux[0]
					tieneMAC = True
			else:
				tieneTelefono = np.random.rand()		#Random para ver si la persona tiene telefono
				if(tieneTelefono > 0.3):
					mac = int(np.random.uniform(0,9999999))
					tieneMAC = True
					payloadU = {
						"mac": mac,
						"cedula": cedula
					}
					client.publish('Sambil/usuario',json.dumps(payloadU), qos=0)
			
			#los metodos de compra y tiendas
			entroTienda = np.random.rand()
			if(entroTienda > 0.5):
				for j in range(int(np.random.uniform(1,11))):
					idTienda = int(np.random.uniform(1,11))
					dateEntrada = auxHoraultima + datetime.timedelta(hours=np.random.uniform(int(np.random.uniform(auxHoraultima.hour)),1), minutes=np.random.uniform(auxHoraultima.minute,60), seconds=np.random.uniform(0,60))
					dateSalida = dateEntrada + datetime.timedelta(minutes=np.random.uniform(2,31))
					auxHoraultima = dateSalida
					if tieneMAC == True:
						payloadT = {
							"idtienda": idTienda,
							"hentrada": str(dateEntrada),
							"hsalida": str(dateSalida),
							"mac": mac
						}
						client.publish('Sambil/torniquete',json.dumps(payloadT), qos=0)
					else:
						payloadT = {
							"idtienda": idTienda,
							"hentrada": str(dateEntrada),
							"hsalida": str(dateSalida)
						}
						client.publish('Sambil/torniquete',json.dumps(payloadT), qos=0)					

					compro = np.random.rand()
					if(compro > 0.4):
						monto = int(np.random.uniform(1,1000))
						fechacompra = dateEntrada.date()
						if tieneMAC == True:
							payloadV = {
								"monto": monto,
								"idtienda": idTienda,
								"cedula": cedula,
								"mac": mac,
								"fecha": str(fechacompra)
							}
							client.publish('Sambil/venta',json.dumps(payloadV), qos=0)
						else:
							payloadV = {
								"monto": monto,
								"idtienda": idTienda,
								"cedula": cedula,
								"fecha": str(fechacompra)
							}
							client.publish('Sambil/venta',json.dumps(payloadV), qos=0)
			
			#vamos a la feria
			fueFeria = np.random.rand()
			if(fueFeria > 0.5):
				idmesa = int(np.random.uniform(1,11))
				fechaOcupada = auxHoraultima + datetime.timedelta(hours=np.random.uniform(int(np.random.uniform(auxHoraultima.hour)),1), minutes=np.random.uniform(auxHoraultima.minute,60), seconds=np.random.uniform(0,60))
				fechaDesocupada = fechaOcupada + datetime.timedelta(minutes=np.random.uniform(2,60))
				auxHoraultima = fechaDesocupada

				if(tieneMAC):
					payloadM = {
						"nmesa": idmesa,
						"fechaocupada": str(fechaOcupada),
						"fechadesocupada": str(fechaDesocupada),
						"mac": mac
					}
					client.publish('Sambil/mesa',json.dumps(payloadM), qos=0)
				else:
					payloadMU = {
						"nmesa": idmesa,
						"fechaocupada": str(fechaOcupada),
						"fechadesocupada": str(fechaDesocupada)
					}	
					client.publish('Sambil/mesa',json.dumps(payloadMU), qos=0)

			horaAccesoS = auxHoraultima + datetime.timedelta(hours=np.random.uniform(int(np.random.uniform(auxHoraultima.hour)),18), minutes=np.random.uniform(auxHoraultima.minute,60), seconds=np.random.uniform(0,60))
			salida = int(np.random.uniform(1,4)) #lo mismo que la entrada
			payloadA = {
				"entrada": acceso,
				"salida": salida,
				"horaacceso": str(horaAccesoE),
				"horasalida": str(horaAccesoS),
				"cedula": cedula
			}
			client.publish('Sambil/acceso',json.dumps(payloadA), qos=0)
			time.sleep(1)

		fechaI += datetime.timedelta(days = 1)
	
if __name__ == '__main__':
	main()