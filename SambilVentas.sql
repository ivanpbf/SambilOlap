PGDMP         ,                w            SambilVentas    11.2    11.2     
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    33001    SambilVentas    DATABASE     �   CREATE DATABASE "SambilVentas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "SambilVentas";
             postgres    false            �            1255    33022    validardescuento()    FUNCTION     �  CREATE FUNCTION public.validardescuento() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE
cont INT4;
BEGIN
	
	IF (new.monto <400) THEN
	   new.descuento = 0;
	   return new;

	ELSIF  (new.monto >=400 AND new.monto <600) THEN
	   new.descuento = new.monto * 0.05;
	   return new;

	ELSIF (new.monto >=600 AND new.monto <800) THEN
	   new.descuento = new.monto * 0.10;
	   return new;
	
	ELSIF (new.monto >=800) THEN
	   new.descuento = new.monto * 0.12;
	   return new;
		
	END IF;

End;
$$;
 )   DROP FUNCTION public.validardescuento();
       public       postgres    false            �            1259    33005    venta    TABLE     �   CREATE TABLE public.venta (
    "idVenta" integer NOT NULL,
    idtienda integer NOT NULL,
    monto integer NOT NULL,
    cedula integer NOT NULL,
    descuento integer,
    mac integer
);
    DROP TABLE public.venta;
       public         postgres    false            �            1259    33003    Venta_idVenta_seq    SEQUENCE     �   CREATE SEQUENCE public."Venta_idVenta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Venta_idVenta_seq";
       public       postgres    false    197                       0    0    Venta_idVenta_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Venta_idVenta_seq" OWNED BY public.venta."idVenta";
            public       postgres    false    196            �            1259    33013    tienda    TABLE     �   CREATE TABLE public.tienda (
    idtienda integer NOT NULL,
    nombre character varying NOT NULL,
    catalogo character varying NOT NULL
);
    DROP TABLE public.tienda;
       public         postgres    false            �            1259    33011    tienda_idtienda_seq    SEQUENCE     �   CREATE SEQUENCE public.tienda_idtienda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tienda_idtienda_seq;
       public       postgres    false    199                       0    0    tienda_idtienda_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tienda_idtienda_seq OWNED BY public.tienda.idtienda;
            public       postgres    false    198            �
           2604    33016    tienda idtienda    DEFAULT     r   ALTER TABLE ONLY public.tienda ALTER COLUMN idtienda SET DEFAULT nextval('public.tienda_idtienda_seq'::regclass);
 >   ALTER TABLE public.tienda ALTER COLUMN idtienda DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    33008    venta idVenta    DEFAULT     r   ALTER TABLE ONLY public.venta ALTER COLUMN "idVenta" SET DEFAULT nextval('public."Venta_idVenta_seq"'::regclass);
 >   ALTER TABLE public.venta ALTER COLUMN "idVenta" DROP DEFAULT;
       public       postgres    false    196    197    197                      0    33013    tienda 
   TABLE DATA               <   COPY public.tienda (idtienda, nombre, catalogo) FROM stdin;
    public       postgres    false    199   �                 0    33005    venta 
   TABLE DATA               S   COPY public.venta ("idVenta", idtienda, monto, cedula, descuento, mac) FROM stdin;
    public       postgres    false    197   �                  0    0    Venta_idVenta_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Venta_idVenta_seq"', 1, true);
            public       postgres    false    196                       0    0    tienda_idtienda_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tienda_idtienda_seq', 1, false);
            public       postgres    false    198            �
           2606    33010    venta Venta_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT "Venta_pkey" PRIMARY KEY ("idVenta");
 <   ALTER TABLE ONLY public.venta DROP CONSTRAINT "Venta_pkey";
       public         postgres    false    197            �
           2606    33021    tienda tienda_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tienda
    ADD CONSTRAINT tienda_pkey PRIMARY KEY (idtienda);
 <   ALTER TABLE ONLY public.tienda DROP CONSTRAINT tienda_pkey;
       public         postgres    false    199               �   x�5��
�0Dד�	ַ��P-.�M�^K�MJ�o��Ü�w5�d{T��5��DM���[�l�SM*�j��Z�v�F
�?٠5j��[H^r�q%�N�a;	I^�α=d�v�p<�9�.ѫƐ�J�)8o�W�@���'�Y|q��G9�            x������ � �     