PGDMP                         w            Proyecto2BD    11.2    11.2     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    32997    Proyecto2BD    DATABASE     �   CREATE DATABASE "Proyecto2BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "Proyecto2BD";
             postgres    false            �            1259    41197    ventas    TABLE     *  CREATE TABLE public.ventas (
    id integer NOT NULL,
    cedula integer NOT NULL,
    mac integer,
    idtienda integer NOT NULL,
    nombre character varying NOT NULL,
    catalogo character varying NOT NULL,
    monto integer NOT NULL,
    descuento integer NOT NULL,
    fecha date NOT NULL
);
    DROP TABLE public.ventas;
       public         postgres    false            �            1259    41195    ventas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ventas_id_seq;
       public       postgres    false    197                       0    0    ventas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ventas.id;
            public       postgres    false    196            ~
           2604    41200 	   ventas id    DEFAULT     f   ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);
 8   ALTER TABLE public.ventas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
          0    41197    ventas 
   TABLE DATA               f   COPY public.ventas (id, cedula, mac, idtienda, nombre, catalogo, monto, descuento, fecha) FROM stdin;
    public       postgres    false    197   "                  0    0    ventas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ventas_id_seq', 1, false);
            public       postgres    false    196            �
           2606    41205    ventas ventas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public         postgres    false    197            �
      x������ � �     