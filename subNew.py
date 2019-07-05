import ssl
import sys
import psycopg2
import paho.mqtt.client
import json
import time
import datetime
import numpy as np

#estos son los mios
conAccesos = psycopg2.connect(host = 'localhost', user= 'postgres',password ='pass123', dbname= 'SambilAccesos')
conVentas = psycopg2.connect(host = 'localhost', user= 'postgres',password ='pass123', dbname= 'SambilVentas')
conMesas = psycopg2.connect(host = 'localhost', user= 'postgres',password ='pass123', dbname= 'SambilMesas')

def insertarRasgos(r):
    cur = conAccesos.cursor()
    if r.get('edad') is None:
        cur.execute("INSERT INTO rasgos (cedula) VALUES (%s)", (r["cedula"],)) #INSERTAR EN LA TABLA rasgos
    else:
        cur.execute("INSERT INTO rasgos (cedula, edad, sexo) VALUES (%s, %s, %s);", (r["cedula"], r["edad"], r["sexo"])) #INSERTAR EN LA TABLA rasgos
    conAccesos.commit()

def insertarUsuario(u):
    cur = conAccesos.cursor()
    cur.execute("INSERT INTO usuario (mac, cedula) VALUES (%s,%s);", (u["mac"],u["cedula"])) #INSERTAR EN LA TABLA usuario
    conAccesos.commit()

def insertarTorniquete(t):
    cur = conAccesos.cursor()
    if t.get('mac') is None:
        cur.execute("INSERT INTO torniquete (idtienda, hentrada, hsalida) VALUES (%s,%s,%s);", (t["idtienda"],t["hentrada"], t["hsalida"])) #INSERTAR EN LA TABLA torniquete
    else:
        cur.execute("INSERT INTO torniquete (idtienda, hentrada, hsalida, mac) VALUES (%s,%s,%s, %s);", (t["idtienda"],t["hentrada"], t["hsalida"], t["mac"])) #INSERTAR EN LA TABLA torniquete
    conAccesos.commit()

def insertarVenta(v):
    cur = conVentas.cursor()
    if v.get('mac') is None:
        cur.execute("INSERT INTO venta (monto, idtienda, cedula, fecha) VALUES (%s,%s,%s,%s);", (v["monto"], v["idtienda"], v["cedula"], v["fecha"])) #INSERTAR EN LA TABLA venta
    else:
        cur.execute("INSERT INTO venta (monto, idtienda, cedula, mac, fecha) VALUES (%s,%s,%s,%s,%s);", (v["monto"], v["idtienda"], v["cedula"], v["mac"], v["fecha"])) #INSERTAR EN LA TABLA venta
    conVentas.commit()

def insertarMesa(m):
    cur = conMesas.cursor()
    if m.get('mac') is None:
        cur.execute("INSERT INTO mesa (nmesa, fechaocupada, fechadesocupada) VALUES (%s,%s,%s);", (m["nmesa"], m["fechaocupada"], m["fechadesocupada"])) #INSERTAR EN LA TABLA mesa
    else:
        cur.execute("INSERT INTO mesa (nmesa, fechaocupada, fechadesocupada, mac) VALUES (%s,%s,%s,%s);", (m["nmesa"], m["fechaocupada"], m["fechadesocupada"], m["mac"])) #INSERTAR EN LA TABLA mesa
    conMesas.commit()

def insertarAcceso(a):
    cur = conAccesos.cursor()
    cur.execute("INSERT INTO acceso (entrada, salida, horaacceso, horasalida, cedula) VALUES (%s,%s,%s,%s,%s);", (a["entrada"], a["salida"], a["horaacceso"], a["horasalida"], a["cedula"])) #INSERTAR EN LA TABLA acceso
    conAccesos.commit()

def on_connect(client, userdata, flags, rc):    
    print('Conectado ID (%s)' % client._client_id)
    client.subscribe(topic='Sambil/#', qos=0)    

def on_message(client, userdata, message):   
    r = json.loads(message.payload.decode('utf-8'))
    print(r)  
    print('------------------------------')     
    insertarRasgos(r)

def on_message3(client, userdata, message):   
    u = json.loads(message.payload.decode('utf-8'))
    print(u) 
    print('------------------------------')     
    insertarUsuario(u)

def on_message4(client, userdata, message):   
    t = json.loads(message.payload.decode('utf-8'))
    print(t) 
    print('------------------------------')     
    insertarTorniquete(t)

def on_message5(client, userdata, message):   
    v = json.loads(message.payload.decode('utf-8'))
    print(v) 
    print('------------------------------')     
    insertarVenta(v)

def on_message7(client, userdata, message):   
    m = json.loads(message.payload.decode('utf-8'))
    print(m) 
    print('------------------------------')     
    insertarMesa(m)

def on_message9(client, userdata, message):   
    a = json.loads(message.payload.decode('utf-8'))
    print(a) 
    print('------------------------------')     
    insertarAcceso(a)

def main():	
    client = paho.mqtt.client.Client()
    client.on_connect = on_connect
    client.message_callback_add('Sambil/rasgos',  on_message)
    client.message_callback_add('Sambil/usuario', on_message3)
    client.message_callback_add('Sambil/torniquete', on_message4)
    client.message_callback_add('Sambil/venta', on_message5)
    client.message_callback_add('Sambil/mesa', on_message7)
    client.message_callback_add('Sambil/acceso', on_message9)
    client.connect(host='localhost') 
    client.loop_forever()

if __name__ == '__main__':
    main()
    sys.exit(0)

