PGDMP         0                w            Proyecto2BD    11.2    11.2      !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            $           1262    41208    Proyecto2BD    DATABASE     �   CREATE DATABASE "Proyecto2BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
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
       public       postgres    false    197            %           0    0    accesos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.accesos_id_seq OWNED BY public.accesos.id;
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
       public       postgres    false    199            &           0    0    mesas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.mesas_id_seq OWNED BY public.mesas.id;
            public       postgres    false    198            �            1259    41252    torniquetes    TABLE     6  CREATE TABLE public.torniquetes (
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
       public       postgres    false    201            '           0    0    torniquetes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.torniquetes_id_seq OWNED BY public.torniquetes.id;
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
       public       postgres    false    203            (           0    0    ventas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ventas.id;
            public       postgres    false    202            �
           2604    41225 
   accesos id    DEFAULT     h   ALTER TABLE ONLY public.accesos ALTER COLUMN id SET DEFAULT nextval('public.accesos_id_seq'::regclass);
 9   ALTER TABLE public.accesos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    41244    mesas id    DEFAULT     d   ALTER TABLE ONLY public.mesas ALTER COLUMN id SET DEFAULT nextval('public.mesas_id_seq'::regclass);
 7   ALTER TABLE public.mesas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    41255    torniquetes id    DEFAULT     p   ALTER TABLE ONLY public.torniquetes ALTER COLUMN id SET DEFAULT nextval('public.torniquetes_id_seq'::regclass);
 =   ALTER TABLE public.torniquetes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    41266 	   ventas id    DEFAULT     f   ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);
 8   ALTER TABLE public.ventas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203                      0    41222    accesos 
   TABLE DATA               T   COPY public.accesos (id, cedula, mac, sexo, edad, entrada, salida, dia) FROM stdin;
    public       postgres    false    197   �"                 0    41241    mesas 
   TABLE DATA               b   COPY public.mesas (id, mac, cedula, sexo, edad, nmesa, fechaocupada, fechadesocupada) FROM stdin;
    public       postgres    false    199   �"                 0    41252    torniquetes 
   TABLE DATA               q   COPY public.torniquetes (id, idtienda, nombre, catalogo, cedula, mac, edad, sexo, hentrada, hsalida) FROM stdin;
    public       postgres    false    201   �"                 0    41263    ventas 
   TABLE DATA               r   COPY public.ventas (id, cedula, mac, edad, sexo, idtienda, nombre, catalogo, monto, descuento, fecha) FROM stdin;
    public       postgres    false    203   �"       )           0    0    accesos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.accesos_id_seq', 2630, true);
            public       postgres    false    196            *           0    0    mesas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.mesas_id_seq', 106, true);
            public       postgres    false    198            +           0    0    torniquetes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.torniquetes_id_seq', 4992, true);
            public       postgres    false    200            ,           0    0    ventas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ventas_id_seq', 1, false);
            public       postgres    false    202            �
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
           2606    41260    torniquetes torniquetes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.torniquetes
    ADD CONSTRAINT torniquetes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.torniquetes DROP CONSTRAINT torniquetes_pkey;
       public         postgres    false    201            �
           2606    41271    ventas ventas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public         postgres    false    203                  x������ � �            x������ � �            x������ � �            x������ � �     