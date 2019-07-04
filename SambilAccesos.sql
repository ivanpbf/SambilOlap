PGDMP     ;    !                w            SambilAccesos    11.2    11.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    33066    SambilAccesos    DATABASE     �   CREATE DATABASE "SambilAccesos" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "SambilAccesos";
             postgres    false            �            1255    33067 
   validmac()    FUNCTION       CREATE FUNCTION public.validmac() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
cont INT4;
BEGIN

	cont := (SELECT COUNT(mac) FROM  usuario WHERE mac = new.mac );
	
	IF (cont = 0) THEN
	   return new;
	END IF;
	
	IF (cont > 0) THEN
	   return null;
	END IF;

End;
$$;
 !   DROP FUNCTION public.validmac();
       public       postgres    false            �            1259    33068    acceso    TABLE        CREATE TABLE public.acceso (
    idacceso integer NOT NULL,
    entrada integer NOT NULL,
    salida integer NOT NULL,
    cedula integer NOT NULL,
    horaacceso timestamp without time zone NOT NULL,
    horasalida timestamp without time zone NOT NULL
);
    DROP TABLE public.acceso;
       public         postgres    false            �            1259    33071    acceso_idacceso_seq    SEQUENCE     �   CREATE SEQUENCE public.acceso_idacceso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.acceso_idacceso_seq;
       public       postgres    false    196                       0    0    acceso_idacceso_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.acceso_idacceso_seq OWNED BY public.acceso.idacceso;
            public       postgres    false    197            �            1259    33073    rasgos    TABLE     _   CREATE TABLE public.rasgos (
    cedula integer NOT NULL,
    edad integer,
    sexo "char"
);
    DROP TABLE public.rasgos;
       public         postgres    false            �            1259    33076 
   torniquete    TABLE     �   CREATE TABLE public.torniquete (
    id integer NOT NULL,
    idtienda integer NOT NULL,
    hentrada timestamp without time zone NOT NULL,
    hsalida timestamp without time zone NOT NULL
);
    DROP TABLE public.torniquete;
       public         postgres    false            �            1259    33079    torniquete_id_seq    SEQUENCE     �   CREATE SEQUENCE public.torniquete_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.torniquete_id_seq;
       public       postgres    false    199                       0    0    torniquete_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.torniquete_id_seq OWNED BY public.torniquete.id;
            public       postgres    false    200            �            1259    33081    usuario    TABLE     W   CREATE TABLE public.usuario (
    mac integer NOT NULL,
    cedula integer NOT NULL
);
    DROP TABLE public.usuario;
       public         postgres    false            �
           2604    33084    acceso idacceso    DEFAULT     r   ALTER TABLE ONLY public.acceso ALTER COLUMN idacceso SET DEFAULT nextval('public.acceso_idacceso_seq'::regclass);
 >   ALTER TABLE public.acceso ALTER COLUMN idacceso DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    33085    torniquete id    DEFAULT     n   ALTER TABLE ONLY public.torniquete ALTER COLUMN id SET DEFAULT nextval('public.torniquete_id_seq'::regclass);
 <   ALTER TABLE public.torniquete ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199                      0    33068    acceso 
   TABLE DATA               [   COPY public.acceso (idacceso, entrada, salida, cedula, horaacceso, horasalida) FROM stdin;
    public       postgres    false    196   K                 0    33073    rasgos 
   TABLE DATA               4   COPY public.rasgos (cedula, edad, sexo) FROM stdin;
    public       postgres    false    198   h                 0    33076 
   torniquete 
   TABLE DATA               E   COPY public.torniquete (id, idtienda, hentrada, hsalida) FROM stdin;
    public       postgres    false    199   �                 0    33081    usuario 
   TABLE DATA               .   COPY public.usuario (mac, cedula) FROM stdin;
    public       postgres    false    201   �                  0    0    acceso_idacceso_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.acceso_idacceso_seq', 1, false);
            public       postgres    false    197                       0    0    torniquete_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.torniquete_id_seq', 1, false);
            public       postgres    false    200            �
           2606    33087    acceso acceso_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.acceso
    ADD CONSTRAINT acceso_pkey PRIMARY KEY (idacceso);
 <   ALTER TABLE ONLY public.acceso DROP CONSTRAINT acceso_pkey;
       public         postgres    false    196            �
           2606    33089    rasgos rasgos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.rasgos
    ADD CONSTRAINT rasgos_pkey PRIMARY KEY (cedula);
 <   ALTER TABLE ONLY public.rasgos DROP CONSTRAINT rasgos_pkey;
       public         postgres    false    198            �
           2606    33091    torniquete torniquete_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.torniquete
    ADD CONSTRAINT torniquete_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.torniquete DROP CONSTRAINT torniquete_pkey;
       public         postgres    false    199            �
           2606    33093    usuario usuario_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (mac);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    201            �
           2620    33094    usuario tr_validmac    TRIGGER     m   CREATE TRIGGER tr_validmac BEFORE INSERT ON public.usuario FOR EACH ROW EXECUTE PROCEDURE public.validmac();
 ,   DROP TRIGGER tr_validmac ON public.usuario;
       public       postgres    false    201    202                  x������ � �            x������ � �            x������ � �            x�3�440�2�4�1z\\\ WU     