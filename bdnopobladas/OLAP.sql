PGDMP     &    3        	        w            Proyecto2BD    11.2    11.2 <    M           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            N           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            O           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            P           1262    41208    Proyecto2BD    DATABASE     �   CREATE DATABASE "Proyecto2BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "Proyecto2BD";
             postgres    false            �            1259    41222    accesos    TABLE     �   CREATE TABLE public.accesos (
    id integer NOT NULL,
    cedula integer NOT NULL,
    mac integer,
    sexo "char",
    edad integer,
    entrada integer NOT NULL,
    salida integer NOT NULL,
    dia date NOT NULL
);
    DROP TABLE public.accesos;
       public         postgres    false            �            1259    41220    accesos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accesos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.accesos_id_seq;
       public       postgres    false    197            Q           0    0    accesos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.accesos_id_seq OWNED BY public.accesos.id;
            public       postgres    false    196            �            1259    41241    mesas    TABLE     �   CREATE TABLE public.mesas (
    id integer NOT NULL,
    mac integer,
    cedula integer,
    sexo character varying,
    edad integer,
    nmesa integer NOT NULL,
    fechaocupada date NOT NULL,
    fechadesocupada date NOT NULL
);
    DROP TABLE public.mesas;
       public         postgres    false            �            1259    41239    mesas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mesas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.mesas_id_seq;
       public       postgres    false    199            R           0    0    mesas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.mesas_id_seq OWNED BY public.mesas.id;
            public       postgres    false    198            �            1259    41394    mesasdiarias    TABLE     �   CREATE TABLE public.mesasdiarias (
    id integer NOT NULL,
    nmesa integer NOT NULL,
    dia integer NOT NULL,
    minutos integer NOT NULL
);
     DROP TABLE public.mesasdiarias;
       public         postgres    false            �            1259    41392    mesasdiarias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mesasdiarias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.mesasdiarias_id_seq;
       public       postgres    false    211            S           0    0    mesasdiarias_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.mesasdiarias_id_seq OWNED BY public.mesasdiarias.id;
            public       postgres    false    210            �            1259    41386    mesasmes    TABLE     �   CREATE TABLE public.mesasmes (
    id integer NOT NULL,
    nmesa integer NOT NULL,
    mes integer NOT NULL,
    minutos integer NOT NULL
);
    DROP TABLE public.mesasmes;
       public         postgres    false            �            1259    41384    mesasmes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mesasmes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.mesasmes_id_seq;
       public       postgres    false    209            T           0    0    mesasmes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.mesasmes_id_seq OWNED BY public.mesasmes.id;
            public       postgres    false    208            �            1259    41252    torniquetes    TABLE     6  CREATE TABLE public.torniquetes (
    id integer NOT NULL,
    idtienda integer NOT NULL,
    nombre character varying NOT NULL,
    catalogo character varying NOT NULL,
    cedula integer,
    mac integer,
    edad integer,
    sexo character varying,
    hentrada date NOT NULL,
    hsalida date NOT NULL
);
    DROP TABLE public.torniquetes;
       public         postgres    false            �            1259    41250    torniquetes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.torniquetes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.torniquetes_id_seq;
       public       postgres    false    201            U           0    0    torniquetes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.torniquetes_id_seq OWNED BY public.torniquetes.id;
            public       postgres    false    200            �            1259    41263    ventas    TABLE     X  CREATE TABLE public.ventas (
    id integer NOT NULL,
    cedula integer NOT NULL,
    mac integer,
    edad integer,
    sexo character varying,
    idtienda integer NOT NULL,
    nombre character varying NOT NULL,
    catalogo character varying NOT NULL,
    monto integer NOT NULL,
    descuento integer NOT NULL,
    fecha date NOT NULL
);
    DROP TABLE public.ventas;
       public         postgres    false            �            1259    41261    ventas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ventas_id_seq;
       public       postgres    false    203            V           0    0    ventas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ventas.id;
            public       postgres    false    202            �            1259    41378    ventasdiarias    TABLE     �   CREATE TABLE public.ventasdiarias (
    id integer NOT NULL,
    idtienda integer NOT NULL,
    mes integer NOT NULL,
    dia integer NOT NULL,
    monto integer NOT NULL,
    descuento integer NOT NULL
);
 !   DROP TABLE public.ventasdiarias;
       public         postgres    false            �            1259    41376    ventasdiarias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventasdiarias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ventasdiarias_id_seq;
       public       postgres    false    207            W           0    0    ventasdiarias_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ventasdiarias_id_seq OWNED BY public.ventasdiarias.id;
            public       postgres    false    206            �            1259    41366 	   ventasmes    TABLE     �   CREATE TABLE public.ventasmes (
    id integer NOT NULL,
    idtienda integer NOT NULL,
    mes integer NOT NULL,
    monto integer NOT NULL,
    descuento integer NOT NULL
);
    DROP TABLE public.ventasmes;
       public         postgres    false            �            1259    41364    ventasmes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventasmes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.ventasmes_id_seq;
       public       postgres    false    205            X           0    0    ventasmes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.ventasmes_id_seq OWNED BY public.ventasmes.id;
            public       postgres    false    204            �
           2604    41225 
   accesos id    DEFAULT     h   ALTER TABLE ONLY public.accesos ALTER COLUMN id SET DEFAULT nextval('public.accesos_id_seq'::regclass);
 9   ALTER TABLE public.accesos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    41244    mesas id    DEFAULT     d   ALTER TABLE ONLY public.mesas ALTER COLUMN id SET DEFAULT nextval('public.mesas_id_seq'::regclass);
 7   ALTER TABLE public.mesas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    41397    mesasdiarias id    DEFAULT     r   ALTER TABLE ONLY public.mesasdiarias ALTER COLUMN id SET DEFAULT nextval('public.mesasdiarias_id_seq'::regclass);
 >   ALTER TABLE public.mesasdiarias ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    211    211            �
           2604    41389    mesasmes id    DEFAULT     j   ALTER TABLE ONLY public.mesasmes ALTER COLUMN id SET DEFAULT nextval('public.mesasmes_id_seq'::regclass);
 :   ALTER TABLE public.mesasmes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    209    209            �
           2604    41255    torniquetes id    DEFAULT     p   ALTER TABLE ONLY public.torniquetes ALTER COLUMN id SET DEFAULT nextval('public.torniquetes_id_seq'::regclass);
 =   ALTER TABLE public.torniquetes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    41266 	   ventas id    DEFAULT     f   ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);
 8   ALTER TABLE public.ventas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    41381    ventasdiarias id    DEFAULT     t   ALTER TABLE ONLY public.ventasdiarias ALTER COLUMN id SET DEFAULT nextval('public.ventasdiarias_id_seq'::regclass);
 ?   ALTER TABLE public.ventasdiarias ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206    207            �
           2604    41369    ventasmes id    DEFAULT     l   ALTER TABLE ONLY public.ventasmes ALTER COLUMN id SET DEFAULT nextval('public.ventasmes_id_seq'::regclass);
 ;   ALTER TABLE public.ventasmes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    205    205            <          0    41222    accesos 
   TABLE DATA               T   COPY public.accesos (id, cedula, mac, sexo, edad, entrada, salida, dia) FROM stdin;
    public       postgres    false    197   �@       >          0    41241    mesas 
   TABLE DATA               b   COPY public.mesas (id, mac, cedula, sexo, edad, nmesa, fechaocupada, fechadesocupada) FROM stdin;
    public       postgres    false    199   �@       J          0    41394    mesasdiarias 
   TABLE DATA               ?   COPY public.mesasdiarias (id, nmesa, dia, minutos) FROM stdin;
    public       postgres    false    211   �@       H          0    41386    mesasmes 
   TABLE DATA               ;   COPY public.mesasmes (id, nmesa, mes, minutos) FROM stdin;
    public       postgres    false    209   A       @          0    41252    torniquetes 
   TABLE DATA               q   COPY public.torniquetes (id, idtienda, nombre, catalogo, cedula, mac, edad, sexo, hentrada, hsalida) FROM stdin;
    public       postgres    false    201   $A       B          0    41263    ventas 
   TABLE DATA               r   COPY public.ventas (id, cedula, mac, edad, sexo, idtienda, nombre, catalogo, monto, descuento, fecha) FROM stdin;
    public       postgres    false    203   AA       F          0    41378    ventasdiarias 
   TABLE DATA               Q   COPY public.ventasdiarias (id, idtienda, mes, dia, monto, descuento) FROM stdin;
    public       postgres    false    207   ^A       D          0    41366 	   ventasmes 
   TABLE DATA               H   COPY public.ventasmes (id, idtienda, mes, monto, descuento) FROM stdin;
    public       postgres    false    205   {A       Y           0    0    accesos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.accesos_id_seq', 3419, true);
            public       postgres    false    196            Z           0    0    mesas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.mesas_id_seq', 424, true);
            public       postgres    false    198            [           0    0    mesasdiarias_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.mesasdiarias_id_seq', 53, true);
            public       postgres    false    210            \           0    0    mesasmes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.mesasmes_id_seq', 20, true);
            public       postgres    false    208            ]           0    0    torniquetes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.torniquetes_id_seq', 6876, true);
            public       postgres    false    200            ^           0    0    ventas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ventas_id_seq', 376, true);
            public       postgres    false    202            _           0    0    ventasdiarias_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ventasdiarias_id_seq', 376, true);
            public       postgres    false    206            `           0    0    ventasmes_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ventasmes_id_seq', 100, true);
            public       postgres    false    204            �
           2606    41227    accesos accesos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.accesos
    ADD CONSTRAINT accesos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.accesos DROP CONSTRAINT accesos_pkey;
       public         postgres    false    197            �
           2606    41249    mesas mesas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.mesas
    ADD CONSTRAINT mesas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.mesas DROP CONSTRAINT mesas_pkey;
       public         postgres    false    199            �
           2606    41399    mesasdiarias mesasdiarias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.mesasdiarias
    ADD CONSTRAINT mesasdiarias_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.mesasdiarias DROP CONSTRAINT mesasdiarias_pkey;
       public         postgres    false    211            �
           2606    41391    mesasmes mesasmes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.mesasmes
    ADD CONSTRAINT mesasmes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.mesasmes DROP CONSTRAINT mesasmes_pkey;
       public         postgres    false    209            �
           2606    41260    torniquetes torniquetes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.torniquetes
    ADD CONSTRAINT torniquetes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.torniquetes DROP CONSTRAINT torniquetes_pkey;
       public         postgres    false    201            �
           2606    41271    ventas ventas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public         postgres    false    203            �
           2606    41383     ventasdiarias ventasdiarias_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ventasdiarias
    ADD CONSTRAINT ventasdiarias_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ventasdiarias DROP CONSTRAINT ventasdiarias_pkey;
       public         postgres    false    207            �
           2606    41371    ventasmes ventasmes_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ventasmes
    ADD CONSTRAINT ventasmes_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ventasmes DROP CONSTRAINT ventasmes_pkey;
       public         postgres    false    205            <      x������ � �      >      x������ � �      J      x������ � �      H      x������ � �      @      x������ � �      B      x������ � �      F      x������ � �      D      x������ � �     