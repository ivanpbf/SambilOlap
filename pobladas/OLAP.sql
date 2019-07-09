PGDMP         #        	        w            Proyecto2BD    11.2    11.2 <    M           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public       postgres    false    199   &T       J          0    41394    mesasdiarias 
   TABLE DATA               ?   COPY public.mesasdiarias (id, nmesa, dia, minutos) FROM stdin;
    public       postgres    false    211   �\       H          0    41386    mesasmes 
   TABLE DATA               ;   COPY public.mesasmes (id, nmesa, mes, minutos) FROM stdin;
    public       postgres    false    209   �]       @          0    41252    torniquetes 
   TABLE DATA               q   COPY public.torniquetes (id, idtienda, nombre, catalogo, cedula, mac, edad, sexo, hentrada, hsalida) FROM stdin;
    public       postgres    false    201   g^       B          0    41263    ventas 
   TABLE DATA               r   COPY public.ventas (id, cedula, mac, edad, sexo, idtienda, nombre, catalogo, monto, descuento, fecha) FROM stdin;
    public       postgres    false    203   �       F          0    41378    ventasdiarias 
   TABLE DATA               Q   COPY public.ventasdiarias (id, idtienda, mes, dia, monto, descuento) FROM stdin;
    public       postgres    false    207   ��       D          0    41366 	   ventasmes 
   TABLE DATA               H   COPY public.ventasmes (id, idtienda, mes, monto, descuento) FROM stdin;
    public       postgres    false    205   ��       Y           0    0    accesos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.accesos_id_seq', 3419, true);
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
       public         postgres    false    205            <      x���K�$)��^w��@�Ԯ�}�s��Q��ݵ�),x�-M�%)_&=�"ן��%�7e�'�$���r�~i�-�|��/��+/"�r.W�"��*�tQQQ��S2X�"�W�re3+6�6�QU��]R�E�/E�>;4�;��קg��t}��V�]9uHr�.O��t	�=�����a�*���Ͼ,��-2��z)�ؗJ�j�7�����&�^�����c%�NW+�R3�$y�~�e lUS�r�n�
&F?k���C�SK[�����t��D�b��`�ڲZA��8ԁ����4�\/��0U�v��)*W������p�V{M��],\46J��E����]���͔�lSlW�m�r���s����u�ºͩ}.+]y�n��5�Ò�),f�	����:��#�հ�iTS3'Lp�.��E�.ͯ�t9�ѯvs����%�I��*��b����D�J���g�RA��iMĎ�3E0%zc�J�N�ݺ]� ۨ��nr9��6�����������;�:���z��S0����^*E�(n���oM��l?/��}�Ur�<�e�絢����}��E�eML�p�Y���}Z���~Ω,�r�s�ʱx�pЍ���V�m������p8ð>[�v2�Ta;��ea��;00*ʵTx.Lw���ߊeѻ�qZ8S���R���@XE%0U�-��&6�!�W�y�o�X�X��l�$O�`���a��rH��4U���n�AF7��rGw4U�QV����c���LK�t5b��4���w�]�僗�M�T��u:ܮ�Of��0l���ܓ���$p��=�T1��M�Z̭��Lχa�3���Ǟ�a�oka��4��C�	��o��[wp`~vg/��1Y��ڎ+~��w���B ��uȃg�.l.O�4�+MM����$�cW�tf���a�/����w�ϖ�r��ȟ��Af|�q�"�����Bxx�%+����ٿ�Z�?;����m�Z���q�E��qL� �U��p�u�t����';D՛up�f�����1���CT,k�<|�3�Q���~/G#p4C�����٪��M�[�<S
�M����@���v����8��0�qZ�Sŕ�]�iK���8U<���Ӧ����;�vҧg�'��~1<���G��M��t;�6c�j�gGi/;�vװ}3����%&�Ne����N�S��6�D�[[�Ӛ*Ρα�>_5�S:!���iT��<�[��"����1�|��U^���۔�J��3��/�r������ޜ����4��(�96Q�m�)�����uOQ�KD���s�����#}e�]jM	��7'v�����*��CeQ[B��L���֏�?)�| ʃW�*i���"[N�|/G�����1��y�U��BׇJ�L��ɥ.}f�w��J�~��֝z;���/+�0��u���d�e���.N����5m�����a��NK���e��i�v���:�����y�Q4OPqaޚi��%7k���pu�.���b&���o��y�f4�w���*������lf������q&��|��[<�.o<+����������~cz�,�Ȟ��_����"����(�G�^X��3Eg�����sqU9t�.�V��Á�.n<_��8� �u�޷�e�b��������`�
Ӹ�5�<��y�ru�Zߪ���Ѕa�����&��ֻ�[[��~�6w�����ޚ�v�ѹ��*�rk(�צ��a5e�xةS#��E��`g�V���N�=I͛�e�r��ˏ]g�����t�{sX�+
=��{b��%e���[e�%�wKͧ�A�:�ٔ�*�&�R��+�[ESsr{M��|�K�cR����`�v�S�#��I���?E�b���)�Z\#���5���TٖgmC��:->wԋ�J���al���8�Z�z�)���Y^�caMÄ)��c�n5�i����l�J���oÙ�qx�N����~������6/�|x�X5�^����|��[q�^�JH���߮�p;��m �F��t�G�����(|i�����|<�|�Uv?An#��9[��J�73�y�!k��G/;Ea̏������=?ԭ7�礵9�W��؞:Վ���껷�Ec�7e���S�Jz:��n����Ҙ�V4�5�/�r=nYTe{��MS�LW,�d�wz�j��^{��#H7�x�Lf����E4x�!F���4��b ��m*�D � \�������E���-h�6^k`Hq�P}����V�.3Z�qBs�����Ȣ��#�[$�a���S:�*.��>f4�B̈D�>�E���]����=#5���_�1#�`Ƙ�%�fd����1�1#d>fd�69$�{%cF��.Čl��E��1��0#�W�牜�%ƌ�w�fd������=�Ȱ�c��f�`F&�Ō�sbF�˄32�OfdӸf��x���x�0#��1fd2b���;�/?<���#����<�k�Ō��e`F��32���1�1#C6aF�\�Ì�sǘ���&��sfd|70#cN`FƔ.���x�S�]��x�E���3��~�Nl3���3ocF>cFF3��B�Ȗ�nŌ��]�_��Ȱ�#�ȸ�B�Ș݅�����fD>�E��a����P��+ƌ�u3�;G�_�<̈Osfd}�c�zJ(3Č�^��|�{ƌ����Vv��N�`F����}P�ǌlҘfdL�"���#]��:32��y���32���<������8с+�c�~��1�Ȱ���L~��|��0#�CT�bF�j"�Ȭ��|U��d1]��^�ibVaFP�3�JB��ӛ��`q1#j�A������c��bF��!�O1fU1#��Ō �3�����r+G�o2b�����tĘTcF�����Ӛ���^��W�3�hc�Zh� 3��E�Ѽi�0#��A`f�P;y��s�A$f�_�ATB̈�A�A�<���X��3B�Ř�&��Ϙ�s�A#f�z��K�AS=���ÌP�]��cFP������һ<ǘTbFi�ATb̈A�!��,<�� 3�����ÌPn.f�	�#����!f�����# *!f����53Bq�0#hx18����`F���h������A�ĘT뷒֮3R�f��cFPu3�`ĘTbF�Gd3� {��%ƌ��=��[S%��1fU�1#�z�A4b�*�0#M��1#�I�A%f���D%�9�����aF(�!f�1#�N!�ZU�B�0#���uf�ӂ>f�s=cF(/1fUu1#e��`F���3R��f�<��Hɞ�49ƌ�3Rz�3R�8��r=�Hy����ǘ�������`F��N`F�3R^[z��������Yf�|M	0#�EM�)O�3Rn�3��b�HYO�A�#�H�y�cFP3R��;��[L�(M`F��7����3Rn�3R�0f�y�b��)��"�HIL��@���4�5�"�H�-"���bFl��R���H	ل��r�f���2���:��ςAT�1#eB��)�����I+��u�!�K!f�| 
1#�3�{Dj����)�5�1#��7S��cFPu3b�cF�z3Rx�M�!i�+�3�Hc�H��TnNUu1#e_�1#�3��1#���)��3Ҍ��3Bq�1#�3��1#�붃��Ę�21#卜�i�/믵3B��9��"җfU1#��3f�b�0#�v������bFʻ43By1#傊0#�R	0#��C�Hy�4�aFʛ�3R&�fQ1#�Z�)�� 3R��f���}
r�0#�v�0#�=J�)��3RNϘ��w�m�dz"�H�\#��aF*Kf'k93�3�*{��%��b�)��3�N/Č�lG����\��|�A�mTir0#�`�)W��A�f�ܸf�25%����9 �f����$�:mf�<P���bF*��|ƌ�Aa����E���aFʐ�Ì �f���ǌ�Y[b��ϴϘ�Ot`^[�?� a  `FPi�AT��cFP�3������37C5�aF*��
0#�r�A"1f$��B�H�bbF�/���D���	� 3�������b����{F��0,v0#��̈�1#��ǌd>���B�H��#�H��ZsQ!�{ƌdB�f$��]���3�qZ�{{5ƌd��W>H�������f$�B�H��8��#3�!�aF2��g�H0E!f$���H�M�3BI�	C�	s>3�t@�W�H1Z3�$?���,��))� 3bF�L����Y^�)����B_����vfċ�3�,f���J����Hs�1#e.aF�G�3R��!f���0#e��aF�����ĥ�!61#�obF�7���h�1#%laF*g���gf�5bF�3�H���1#�cF�8�Ìt�rf��~+i�J�1#��U�g�H�)!f�%������0#e&aF�l�Ì����i�?������:�t.����:Č�	]�)�"�H�ۅ��2.	0#ef�`FZ�0#E^aF:�]`F�1�0#�'��d.f�#�'F���1#, 3���3Ҷ�c:�����f�q߸���kuf�|��0#n�3��<xƌ�\�)��B̈K�Ō��ى��z�)/�<�H��=cF:Y�3R>�9��2s0#�;]�)�B�H��I��h
菟1#e�aF��-�QQ��������VbF��-Č�4ƌ�F��Z�1#%�bF������?��`FCL�fqf��'Č
��3*�@���QI�Ō��Ŕ 3*D0#̨���@��Y頂D 
3�3*9��QAp�bF�+�Ì�|��0��%aFe��fT��V�	��!aq0�����ׯ�D<0?      >   �  x���Yn9D�Kw��LnП���9&Rus��� .�Cl2w>�rjן���%)�_���2=~��#]�����+����s
t���]^t���:=B'�n�_�[65m5Cg�N�G�
���Nߛ���v��"mz�n�Ǵ�tt�� t؟�H��OV��"�:l�O�Э���z�?Z�7)�n��TR�"�v��Ӈuz�n��x8������H�ƋJ���MW�>=K-���r/<\�5�>�
Wc+�Ps����4���!��X�ʽ]�����[7�uԤ!er�6�E�|��u���Nf�/V�j�'O�^=w��y�}Y_,���`�4��.mS���KcM���eӞ+�+�ڻ��ulΙ��kWn(�M��o'�(d�@]T�
�ⱏ�tp��܃����r���t������\���>זu��Xp�<��p!F>/�e��W8Z����-^��.ؠv����S ������ ��G��)"�!��ѡ��Qp��s����\����,��i��H�-Bj�,#;�<#Rk�Kժr�����g¬���Nu��W�2���5�L�����l4$��Ս�T�)�l=_�]VJJ����O�����m��*�:ء�Z�v,�Vn5Q�J��]C���
MCD�j�w�����c��b��Z
�e��X�ܰW�F��L�Mm�w
s������.W����/��P]�5����S�a�R�Tzu��� �X���	���� �k8��Kw8r ������(^S�g�ި	]�=օ{���K�#�T�0k�M������z��
U+�د��Z�ԗ�j��[nla}�ܠ�#���|���4���#�(�ES�c�4��q��K޺�HW�9�ؖ�ڨ��j�l��'�:�QyMyS�e	���R�7��MΖM����I��A��j�}��b�Qĸ)B�{M8Ř���ּ��3��m`ꩵlط���\;.�k�>T�Z|lk��u�n�s�+:�6P�p{��(��LGӔ|�������-���~4��z p׆�+�Eg���dkG�l>C�m��.��>TUb�w���9�Pp���%��k�泲��6:\A�@be�|CA�|?�cn41�C��|�>zOn6�������DTH6J5z�(I�Ze�$���DTH6J��(IO%�h��=�:u�<�B�Q��
�FI"*$%���l�$�B�Q���l�$�B�Q��
�FI"*$%�h�l�$�i�[ϱA��
��H"�#"�u-ҭ�=�m��Ս��עH�}����u&�p����0�K�ċ;I�M��O�|�f���੐w[�
�S�
���$o�4�4�RP!C���pCS!��S!�-��B�#K�����^�S!���B�x�TH0V�TH0G�TH��THp�ᩐ8
��� �y*$-�TE��BҔ�Bn�殃�#,g ,�2@S!qBS!qBS!qBS!���.����i*$���THz�.�<� 4�+<O��AI��)I��бTH���TH���THP�y*����
	b��B�K6M����B�j@S!uBR!u�R!E:�TH�S<�ӥe�w��"y*���x*��a�
i<R��B�4i*�(\4R��
)��S!Ema������y��S!���|�n�>کܿ۳�Z�(I�Zu�$R���0�ܿ�s�/|�g5�FI"ڣrO�N�z+���n�$�B��=��]7JQ!�(ID�t�$a�(ID�t�$R��Y���=�?6J�F�[ϱA��
����,�Z�nϮ�H�ƋY���͂7{����͞��[�f��:#�������1$R!$RLY4Ң<R4�
���TH���T諙�TH���T7�TH��NS!�w��DT��HS!uTBS!���
i-4R��X*��=�B��,�:x*�e�
�噦BG<R� ,��
���
)nR<���S!E@�TH۠����� �`�3M��K��kA�
��
��
�#�
)�	O�V�
i����
��<B)੐:����:�
���
�S�
�C�
�3�
y��T�Rz@�c�*d �
���B���S!�hh*dNBH*d�AX*d�<�4P!��P&�t݁�B�4婐y����ah䩐y*�T��0y*�2�S!���B��*�Y�2؇�B&�W��p�
�
A��
������?��      J   
  x�Q��1:K1��h����_�B��@4sP7���L�np0F_�b��Mו��*�r��r��,�/���8Tk��E�zF�-�6��2qCy*]��HYD)��Z�7��t|��#Q�����b�D.g�[]P�oZ�m��Bi5�N�o��S�g�^YAO����n�y�?p��������/���7���[h?�ץj��ۉ��x��B��#��+oo5�I��7ރ���=c���>&������x���O�����MY      H   t   x���D!�I1���h/��:6�� �p ����\��L�Ը��r��ch���N��54��PNΦ���IEnUSQv� +�ze�c�F7(W��(׌�{M����'�9Gز��G��%�      @      x���O����������\�$�#��f,M���H��_q^�ryX�}�׀cاȾ�w�u����Z�����_��|�y����w�?=}����yse�r�m�m�n���w����?ȿ���obk�
�??��S��	���c��,F^�������]�z��Yj���CvA>�Ro?�p��7i�w�,[�~�1�40�[��x�gW{s�n�$�|�|��ab�N ����&���͟=���������2a���cCT�a�jÅ��0:'�������O��Lի@���69��v&�y�)�)M�`����XK����[M-�r:�%�~�gW�����'���K�pR�Z� ��&�>�[��伥p��&�.�-�⅕�Y�?�����Dч���J�E�$�	�LP"ȏZ�ܷ7v�����7v�I��\�C-O�"ưy�c�@���؊Cě?{�J���"��˄�^��&��m5���Y��)�t�gW/,ҊzFT۹Q~ˮ��/'1l$����ca�V�&�YjݚR�R����M"+7�&�f�z�D����'��JKx����ΐ����^{��0Y,[9I�'�xt�͟]m�h�?E8`R.N���Nc�LJ�MN�d��b���S��Uۜ����ǰ�G>��&KSrj��0F��4?!���~�ׇ��O�=X:4����ܽ�$�K� �]^J�C�$_���-�q(��'�	�-��@"����u#��?9����-����&0KY�}�U�l������%����H��r�FB���>ci5W){�ldC��-��eu:�f	��S}��û���ȇ %{窤���+# �W,�Hܚ�����Q/��3�22B��R�)N:H#�a+�i%u_��u�ٚ"�����K��Ek��0Qx��"9K��l=%}��~TI�|�M~�RW������3	�
��1���T����%�%�`{��B�H�šF$Z�j��O���@�5nj���_,%��[���M����v�Y�P$#�}	��%�kv;�$PB$	� R�������(
GL�2"S���9��k;^�6�(���Wń� ň��m������J���g��ӹs.&	��Kv�P_�$�ؘd#�{u~g��n��>>o�x�����nv�]�.�͟]�Q�&`C�x�+��*#�+�D8ZQ'aAź��Az�����d#�I�MKG�ړJ�{c�҅�}5U�>��C�I*�� B��=��%wd��i�WTN-�:C�^ �U'?��D������	 ��M҉ �~�KX� {�"��&�Ď���A��N5x���WI6�\� �F��i�P:�C���FFe϶i�GL�����Y��&~�s(g�]<'")�	 ��D�S'����Ҝ{�z�?̈��:sE�'j(Q�(*"��u�s�]S��K6P�g�Tq��jN3l����_�.������u�X�T+��c�"3�_����ui��ޮ���{ս�ei������}훽�����K�v=}���1�Eaj��Ɋ��3�6�n�m�1���X)K��u�<�����ǽ$CR�}r�G֝TG�H���j�dH�7HJn�H�m
�&�k6��7i6����F��4}��L��4Ű�T���P�m6Y��U���[�'�w��y�[.�累b�Щ_�d����N�Vc�t��>�n��ǰ�T�:��`һ&�n���6���J�T�+T*r�J�Sտ�f��z+��-���,��S��H�wc%S*rEs��袽�q�M��8�M'�m$�K�+��ӽ_D�6�Q*��I~[η��0���.����v��<0�"�����`�f�|��Iֈ�p��ᐧV����r�њ�qg`
qTd��ۇ��9�m>�R���q�����q�0Ҷ��}�z{��OVy;�w�GhF�.�ᨱZEa�*������`D�&������ʗ�(HQ鍊8�+(�-�>6Ұ��K;hZ��&�%�x̆�h�}�p�	4�ЌV٧���u4�RԍB���0���*~��vO��Ă����{D}vW��bX[�	T&�)*�o͘X�V�ϙ5H	=X]���|
�l{��ʣh���璖�������8!;����##����=n�szAXl%؜����0Ā���ƪ�����d�>���i6��Ve�	j�/U��aF_1x������W`��X��)�a�@�iA�h���5��$3���3��T��Jb��4H����M� �y��|�ݷ���~|���/b����5Y���*�F7���j�����Fm��eV����Ԃ����tU�!�ق�Em�(�WEn��у��)�0��5��ؾ�@�~>�etq��-]��ɂ��R�.�d�P#˾\Tkx�G �1Fn�NCL�bjp�[E���b��X��^#�|�S~4kc����*]���өk�����+5�,�R�v�9x5u�����M|h�,V(Vj3��4�(���`K���[���H�FӁyD��rO����*����K8D���>&�Յ�mE��2��5��]�!Ҩ��1D.g)B�2U8��5���`�\��|�8��¤QE�א4��SxBR�b���E���0���X3��y�O??���Q��E�ɐ4��p �j�2=������|>��lo?�{x�t����Y!ح�Wo��ݐ�(d��`{�K&yd�2�
�ra�:jؖ_��`.Ͳ�X���"7ʾ�G\x̂����P�e%�B��/���Q<(J�pޥ^� .l�5T��>�<oepA�b�>��<���Wڊ��۶CZx�[��P\�]V�`va�
m?�]�E����/�y�칾d�AH�A!��R�_�< �ݭZ�:�v6�������_��4�(�S@��Dܸ��'�Р}_��%GQ��J@�mǽ]:���+G�� 3:���jN�YE��~Y��4��?Y7/��TY"�Jd6ȶ�DD����O-�N�g8Aʹ萶2z��I�I��
٤���C��m���O�<>��W_��{�Q�85 �v	�� j��Zoζc�F�C�#�[9��S��m�0B�;BY�P[��3����=�'F�?�'�����u�1�30�o'a �@�X��:�h Hvgc4�;x�	F0 \�`��b<Z��
)�JD�� m����G��c�nL~������eY2�^�� FX��5�cU�� �u�1���.2��)Z?�[�I������NՂ��q���i���G�o>�?w�:���5�%<�վj�>��<JkU|죪����Z�<U���@�Zk�e_�����j�z����� W+ϱ=�X�X�^�E�6�u�9Ԯ0�Z�9rt���P�q���L�XK��ȣnc[&o�`�Gqk�_>zx��������w���>}� ���]�|���r�e���A�êbk�O$��\��x�"���+(ʽ}�͆���:ػ&i��\�H'�m:�-�i�e� ��&����v�P:��eo�߻��p6���f�0�>�ܻ�Kx�ܦ��'��AQn�I�m2�!%g�����L�3�6��w���T/�6��� [�K�������D�Yv�=��M0�� �5�'��1%_C�� ����S8H����R8X��S�RXy�i��2{�[
6�T�^���:�>Ia�GE�£"_�q�G�G�y�m��T������m �'�S\Y�[)��GE��"�mɳ��h�_�}��X$�r)c�>�P��� K��]~�6�ܽ�D�>�I~�%��)����&s{������_~�����ˀ]N���]Ӊ��tੳ�u���$E�Qì;0�7�4s\R��͉�3�2�?���s��P����
K��(
OdC=�)�%��(HѓV�R�"�)@Q:%�)(�gm����>0�����N�LM� *��&�����B�_����(zE��*E�������2E���5E�\^7��i��ȝ���*�|�ִ,@/��u,D�c!B����v�QU��S bw��]#��)�w6���B���;�X�P� DY�w"Ӷ��/�l6B��i�`D�ѳS8"[�ٱ�NKF��Na�l}g��0�BՂ�M    N�#�����it�Ә"�e�
R�X�������?=���΀���gq�F��Eu0'��1)1�8=I�1��Fכ壺G��RK��ó���H> ��E��6�<�ȗ��`b�N`t�9��Gs�`c�>�����^��&��7a���9�4�W��5AM)��	�}�9��BT���q帄 ��M٧�s\J���&��ʊefTr3z�&�l�.'E�ž9�@��"紀��6qTգ���$���9�<�1L i�l*���d��|�K�/A���!g��iE�#����p���$�	��]�
T�0�G��l�H>c��A�Hn���ΐ��|r1Y$���e�G�\��um�I�K��ͤi�0���Mv9s��G>��&��	�b��:ZɅ~{����_�~{�O$�ut�{�n]�	��j8
%��P�|(�o�tC��\s-�C���_/�+7����~M�`�\�27���$\�a<	RK�H(� �p�md�>�9������F>�!������^�숈q�դ�u��P�GFXX��Mq�A![����$�뒶,qgk��.�lMQ$����a��]�,m(���d��.����w��r{��,�T��K�_%������%�%ȃ��?[HI�8Ԉ� y�	2.՗/>�_,%�S��p����,1K{_�"U���bt�%I%D�@	��>�^�u.����.��a��%�a��[��!.��,������v�x��$�z�t�%&�K�d�ld�v�%V��Pض����������>?�Ǘ��@�&`C�����b�.R�1�V�H�*�Ŗ�Pz��lIyҒ��ҿ7V::Ԓ�$5�]��˒&~ȧDK���C�I*�� B�{F���&��䉡�Qg�������G�D���9�@��y_�e"�����PYhRM������/
@d��	 j�9��I�2����2��t{�-?�st�N��[AK� ���Jd E5D�E\�SW���T�{�z�?ԈD֙+�:QèQ�(*"��u�s�ճ4.�@%�8NP�q��9Ͱ-��&N��xd�d�:�&V�M���;�ˤ�x��J�gj��U�'hxi������}훽�����K�uU���1��}�O�_�C-gF�Q�h���� oŠ7VV!c�:P����ί�GCR]�On�H���l�'��y\�$�m )��"#�6�d�z�DڛTo�h�,G�Q�%�b�d�G�Vo��~%(��d�l��L��{����rY��(t�1��$�u������Y�M'æS-�Pn�I��S��m2氒3�
��<�T���WVoE��z+��-�5�,R���Xɔ��F�<ݦFG��T��#�t���})i���|zM�H��F�|�PMXڻpG3�7�,�C,R9����o��W�A�d�xM\r�i�*oσ��[�M&�R����L�|絴9�m>�� i�q���ɚ��L�9Ys����������>Y�-��\/h��.d������B?
�h-F�o"�xY�F%}���JrKo-��N)������ 7v�lq�	�P�.h<��\~��~T0�`�MqV����?n�g�Db�4�	�G��vQ�0Ű���L�STf��0�����"1j�z��6XO_�����ӕG�4*�O¶�\�R��a;�mN��e�q��)>��+G���DXle%�Bڣ�3Ġ�^�^�5�	��ԝ�h��j��&�	�f�R�!�Ì�%b��35���Ǳ9`��X�195����.H��<�x��1�p��1��.���(���z3i��#5��M�&��|$���8�ew��ltS썭�&�j�Q+.�<�Z���0\FE�z�����+v[�^`��уI��}��6��66�j�4�.|�d-jx�_
i�P��ž��E/��5���R.�W�B.z�h�]ԸX�jd��v��qE?��M
U���C[�S��[RSy�nKj�"�j��|hKj92�і4.a֘`�j�aG[�2��)B5אn�e
�<ܖ��{`���P皚-kH��}�d-C���hY]�؎r�V�k�ћ�Ţ����+\�Q�e�L`��";|�?;*���e+E�QŚТ1E�ӪJ�E�U�(zl�����F{⪱E���*W-)B�-�V���v���eZ=�gW�#�^���<~z�����A+�img����!���I�=���g���pe��<�ˣ���5�/β��zQj_jZ#�o��y��M(JwY	���V���2P�Ȑ�%��`�E�/h �u*B��>�u���dp�\L�:���4jKW",��kQ-�O%�B��+J��$���5�]��DY�G��hp⚵y���`�
�:!�Bn�ν�2��uyE/\Bn�a�:�r6K�Ƣ9���hN�ɬ	��(�%����;�O���>Q�K��L�����a�*N������#��hE�.hXPsZ�*���ˢ�4B�?��: �;\FtX�P�\�Bj?h��T�r�T�'���V���e�`R�Gä��E��!Q)������O�<>��W_�d[���ȗ�H��P+,��R�Nv %�[� �#{=�#S"c����i�[@m^Ђ3���:���l-���}�!��� ?A�v0	�N��X �&���^O�"(���+��v%��Z	ж��J�|�>��V?r��0��b�sq/�o#��?��OK �<�=V��EV�Y�L��ni�?�;�1��ةZpq� ��`,h����X"X�.m�����L�`�G=~*����K'��Z��#�8��
��n��jGC���Pk-��V$��*Z�f��� ;g�9�'+�H�.���SH���
s�]a�s�v��o�_� ���,z�:��;gPǝX��_&o�`��~����ϟ�~x���a��ݻ��O��8E����ɔs-ۗ �B�9����&R/Ld�]��\�@A.�Ƽ�f�ξ��I��;Y��6��N��߅k^y��P�&����c؀�7t���?�hS�P&!%`��)�%�Pn�Iw�]\̠(���6����$�&5�Iz6���ss?Km�2Pn�H����t`��d9��p���>����ܦ����8��#�^bdG��@��E�;SMb��8�{q��<N-�z����+�q���
��|�GE�£"�y$���� X�� �`�&7�KH�o	��\�w�J~T�(��F�;9+�o��2�;���OtKM��@����A���w=���Pר��Y��&����MnR������>��y�󗟿<~��+�z%}\ӕ��J���6��=̮��F��s���uO���V�`][ 猺H���5� �*�*�&�),��)<�}q�qjLQ����-_���M~E�S��t,J�SP�N���������~�˖l�j�A��LM�N�H]G�"�;*)):�EG�39�^�_�Q�H�QK��[HB���f*�%7�iS�j	�4� �
>t��{"Ա���u,D��V3���ܨ�S b7v{���6��g����F;��X�P� � -Z"Ӷ���6�NA���>(������<2�	�w���]Ԓk}TX";�>*<-��P��f��H��m��0E]5�Hw飂/���=������_OT�����m�}��B-cQ��	�#�J��M�'1��F���>�;��.u��l[[���;������M�O՜��Y	ab�N`t�>��eIC��Z��0D���61\��	#���٤Q�
T�q�j�CJmgBv;�/k��6���Xb	A4��D�}Xٗ�t8�m�>�/&��r_L
��/&��kv%�	$�H��8*jGU��$�>��<�1L i�Wm*ɗI{��c�\�~	#,d�٩ՅEzV�5Qm�F�i�a#���ma�V�&���^�d�|Tڷ�z��Q훝!�w�H�E��-���#x���<��-�L�]Ұ�L�C��d�3�v��ǰ�$�r�a�I:��1���}�����{����#�[�@.J��w#a]^�H��q�p>�h߂���P�n� e��P(���Kn�nĂ�W��̒k\�� ( �  q�f���H�C
>p#�l��;PYd#�Q�"	��B�ȇ�n"ԍ��^1xD�8�
ua��;� `�BaM`��⤃4B����$�뒲.9[S�Fpgk�,�����aC<CB���Er�����J�?*n�p�g L.7�3	������s?�DH����y�9���D���C�H�ρ� �R}y1�WK	��xH���+��dĂ�/�*@�	,F�,㺄H(��Cq ��!�b��!0�^;d�"�[tE8"Av�C�l�6KC9�mg9�b�`=����/y�qlL��޽��^
�l�����᷇�O�)dA�H��m��TuGy޴H5 X��QE�X� =h����qҒ�� v���C���潋�{����g�>��C�m"I�UD��!b�Zm��ܿ���>�Qz��R�V��h�(R?#0�m�yU��I'����h���@���98�)(��j�+ �M��O Q#�	�<*�;�?����i]9��>G��z+h�'���9:")�	 �H��&���8:���ݜ{�z�?ԈD֙*j!뒊�x�k��Z��9/�[=���X�G�q�*�T�i�mF?qB�=�ʤ�X�6�NJ��I5�Bەfj��U4�T������}훽�����K�u1��!F4c�/����Z1�rft1dSΞ[e��b�+��|Kׁ�&�H���|4$1���6��;��Ƒ~�1F�ǅ �@�����,Rr�B��'5��k`�IL6���r�}���}Q�a{�ɵ1�h�_	�m(�6[L6��k[b��d�\ƴF�$?�S���إ<�s]�7p!8�l��ǰ�T�:��`һ&c��T�r�̅9��LE�B�"��$;U�0�gee�V�(�[Nc�Y�+~���)��"y�M,6�t�)G����$})+����"� �6�䛁b=��ޅf��X��qƺH%��z�~�]�X�$m����c��Xv?o�6�仑b=*2Y�����$��do8����_��2�6$%�\�	I[�޾z�����'���._���0�2�AC��V��0����B����Gdo"$��*è�8J�
�JrKo�I�R����Gͦ����-N{%�CM[׸�ЌVYl,~��~��X&���89`�i v���������e� &����U!��'G�����[t� �*L���)��k����O�lO�+��)TNW��KZ��]U@��x� ����p���$���V��[�@	���(���c��+��	��b
��d�Z)2�5�Ќ^JR��!fL1c��)E\m�=�)��J��)�a�@�iA�h���D��D~�0�����٤��ZI�7�	a=RJ@۴�ɖ�7�~���o�?��˯/g�������(H6�)��VkJUQ��ڔ��V��ѩ%)�/
�U�W��g�AS�o�MR��r�����p���m�I�Sel�+)kt\8x���~](��a��b_��{��+���m�k�^1
5�譢�htQ�j`-���E>ڙ����g*4] �*]��ҩ|uUSy�n�j�"�JU�K�4���b5	5��:\lՀ��L���r,�~�qk�"T�k��F}��@�.ܓ~����놦�!������v�=��!ۊNMe��k�ѻ��N�6zƼs9Kj����=�]�l��V��웗.
5�H��w�)����D�{��Ŏ�4������X3���y���7�B�-�M��R��هC���L��o���"�ϫ7ۛ�O��?<�5�,')�Vvm��v��`�.˿�kFK����+#�`��>X5l�/��}q��ԋRCW��h��(��Ue PXC��c�"2�jr`��w�pa{��:���#_G�+)��&j ������1޾�F��ݶ�#�B���\Fw�#�j0��G��Gc�#.Bd�W�݅�0��=ל�v/uN
��ɯ_^B���9ū�Lg���qN��L�2��|�hNQ4�K�q�p^+����[re��D��p�uQ��}���`��涮),�9-f`���i��%^�!�4�`yBm��UAD����L-�N�	h�谶��LL*�h�T�&e���������O�<>��W_��{�=ߩط��Z� j���jζsm��|�]�@o�̽����6@��!,|��ZpF���=�'7�?�'������v��`��A���I�$�:w��e7 $��e7�;x�	F0 \�`��b<Z��Rڕ�Z+�V#X	���,�X�[���5�8����~��^�� FX��5�cU.� �u����M.�8?Ek��uK�3�#x>�7�]Ў.�x�8vgr����c�(o-��u.�@�~�f�x�s�}��}��+� ����cU-a�<���ѐ��j��}5K	��h-������F�\���؞l	o�E/�ZdY�\�
s�]a�s�>�iw�h��}�%�ԑ��D�:���ɛ"䱟�� m���Oo?<~|��}�����ӧ��R��'��Ƀ)�Z�/A��=����{L$_��x����[�@Q^��`o6����`ls�d�N��t�[�K�e� �lJ�D�6�|P��N�6���aSJ�lV���ϥ,�N��t��ޒ]��m<)�M&�"�Rl0��L�3���_�ۛ7K��r�GF^���t`��d	w9�"�}��5'�M#%_#q�dGr;|�ّ}�P��8y����Y��^��#{[i6�T�^ϴ��8�i+<*��
������_�Ajd�D�v�\���K��$���r=�a��J~T�(��F�<r��6�w:0ȁ�a�����Y���J~Y�u�u?���P���� K���;X��M
Ur����ӿ��?����g��2���+�K�tQ�I�h��+����\�k��Yw�oԒ4�ߗ�Ԏ�3�<�m]�
A��U�+�&�z�%�=�����W�2Ž��z)z�
V�W�� E�X�P��D�]����o
Ol��25����LM�N�H]G�"�*)):��Y)z&'P#E�������2E���5E�T^רPC>\���L��b��,���M,D�c!B�Ռ�;�8nT�)��k�Hb�5�Yul;�X�@�Y�P� D�<]��i[��e6�NA���Y���׬pDv�kf)B���h3���v-
O��E�jA�&'ԑL��,
S��-S��,
R�����o�~���      B      x���[��ǟg���t����!�rLb�����F`KF+���>�=]U�����mߪ�>'lq�������_>}�������>������O[Ly;6:�:�+J;����q�h����~��a�G�=�F&n�q%y��o���*~�����羔Ъ���T�޼��>~z���ǭ��]Ǳ���󧇟�?~��a��ݻǧ���c�y!�s4,G���j�����:h�ŸB�\G�=�м��������|��gM�Ɔa,��>��i���߿<~~|��V�O�ƷT�/i\v�8�K����X��cɡ��c"3>�τŅa7y�+و<^��в�}���7��?���4`�c�Ŕ\����v@��~y��ǧ������ݘE�x<:�dpL9�ɁdN�ՕWD�D�����i���_���Fx'����\����ȶ#o\Մ�#�NJ�0�׾��}�΀Jϻ�Tơf��F�]Dj9:���n�fLU�uǻ�V�KS�7޶�9V�����E���n2��4�4y<�H��/�ԄԬ�s�:.\IiL�X)��,J�"V�*�V�r��o�e������ՋjI�׸C�Y`�82T�`�����H�&��"��R��gy��V�b��p�)�aePָ�Z9%X��V�UM=���)�5&�6h��q����o�Ziq�dK�G�5:ld����\���4�@m�VҞ�F�.���N�A_\,\����L�nAC�j��W�d�ZƜT���C�{-����8��*�?�*G,��Kw��,֢Դ��#��678yW/H�sq��ʨ���:��Y5������0}�	X�����Q�QfLe1c!��!U�Fj�؉�c��!�<a-k��
�!k!i���:x��`JjTh��n��<h���:�^ԓ�{��v�B�G�c,���e�[��|WNfSKl��&�h@�{L���{�T��#,��#�.���HE��9t�?͆���H%�L��
ڟ�8V]E��� �b����.����P  Eܑ�
oGU|{�xm�E��D<ԍ�_�*�jB �˫jɬ��Rr���8�O���/k|mo�>�Pl*��d`p�-��4������ P���I�a;CH�RƑYX;!Y�娐�/������ݥ*<�Q��'0�[H�(�W�i73�������ԑ�-���X���Xv�Fǒ�pR�W��ۯ� q<	���đc���d<�Q}���i"�^<>��D�Xq�ss�CډD�=�J+���%e���v⯸v@�>�$��\ᝌ�	��)�����ZsV�h�����grC�&xr5�N�J�d���hu�A���(��n��#�hq��.�L�5��G9�Mb��Ѓy<�s��t��Z�d���Sv��Rb8�_�:�*�O@�#��+^T͚��ѹ�bs��!���p(�_�|��۬̄0�3�[��V���8�xs���p�6�3��h�.�г0����v֊�W�|F�C�z�����]�����s����el�LVDRig@�E_��%wG,
cjh��y�T��2�S��5T��K�H�^�KՎ���[x�w�/C��a����r�ɧK�J�A�3��7e�C���pK�$axMv��=8�]���a�I���)l���=D�?ؕ�4C[���^b�q�DsO�>��#�+��ڣ0�ym�$PC#�7]��R��q�����$���,$R�RI�v�B����@�%R�bb�
�y'��濫	\Wʗ�-r�ZE]U�^�:&�	���1Y՚�--�_%���N��Gx��َ] Ll�SR��ES-N�Ȯ5�jR��;Sha5��;������A)xz�{$jV遀����&����.�P��4��N5�( ��Lh�Lq��4$q2m1� �攑�q���{z]+*��S<��$(��Z�U/���� ��y�>I�J�b���L����*)�ɘx�G؈?�HQ�t�5��k�¿G�R���y��1mL�ΕS�w�V����i��ֱ�aO�'���x�&��,x�9��+�J��"���i�<��;N\�E����ء�w���U��9��iA�F'i5� ����|�x�㫗.�:9�EG�mh���KA���x2�
�y�v���;�V�L�K��4�'%r��r����LR�s��)����+N��N�9'�fB��I��"5�{��^do�ۯ�0)��q��x��B,�h�X�Ŏ�)m��P"�_���j��".YZGRM|[\*TZ��^H�&<���H[��P��3Mp#;c��%�8�t/�\UO��BcC�3�'���T�R���YlS�ZG*Չ���IYh�e9s�<���-)�w:�Ӭ6�V����^_yq�8�gQ���z͢�:F��h���t�I���Ҹ���x+��4VT� �P8��!-���g�ƞ�K/�Q?����zu���CD0�&�r�:^V�ўԂ+y���ézh��T�yR��Cu@ȴ����A��%�6�yYO,M u�W��߲���|g�Ht:"�G��$�X�)��S�D�)�t̓�Eu2){�wD�i&!i�MR_�G���"���H:j�����#���g2�>ה��Z/�UN7��S��5���Z �f�<��9�X���([�70�t����)��ឥ���x!�!i�=��*z�y���D5�^�|q�dꩍռ��	�,��fJ�tO㮁�d��"���NJZw�Խnm�L��d)�6�Й8Mrz�|]�a�I��ق3��n�LgңCC���+f�Ȕf��(��k�3<�e�O�!���,3�d*�M9�g��J3Z��d�}�u���vp�S����kH˒����N^[<]m�%���e׀�ĳ^6O�y�@}y#.���ϱ�K)������y�#.�b�Mu��k�[�)���3q��* ��%3URS��a2��d��b]�ҝ��=q����1 �U��I�E-=	t��3=f�}�<�-2C���{?ɾ�5�VS�*B����h�ȩ�Ѧ�u��;���-�ăB��D��ҹC�nǘ�<؏�$kl]���j�3.R��.a���~��7'1����^�"R�s�m�nM�5H��w�L��_������.���\d���#Js��	�p.�/��/h6S%�c�p��(��Ӹ�kR���*�b�̟�w�J2,�d�k�z�ڐ+*N^���MӚhI��eY�!9�a�o�,�{+_m��{e��ce�%�p���1���Z6�D�SJB��}�}�Qŏ�C�߆l_G�uH�/G���H���GTM��R�U@рV:�=�b:%\OT L����HE��*K +c=|�=f�=�T��ٻٿg,hlR�:,ҝ�>ط(�j�/�Pr��p7AV�#ǩ�(�/O�I,0�~@�X�,�#��m*�զmxw`-�|��׋ngq���Ğ���4���ԋ�	4Id�q�b�O���� �	�ٛ��'�7z�)���� �h�Je�b/-[t��O�d�3�Y7SE�L%��	�ϛ�D��)!�i�w�����^w��d��P� x���(��h�U!Ã�h�v�Ox�%iL66���|�����v��Ŀ�2��s��Yv7K�T2~}�0ZZ�ø�Q>�>��[x��Ch��)�V�%�|ԭ�� ��]�\�df$G\RLG�Y/��!4,���ϑD���ulK���$jd��ǼTS��K�UD�D�S�T�T�L�5��>�(�8|��}��9���Ͳ�L�z�3�0�=�b��j���]4R�<��8��F��°���C���1#���'l얋����餮����'v/8���
Q�����SdgU/�zP��@v��#�tWKs�,��.
�Y�ېn���_Rp���dLFo����p�g�M�4�'F]I�b��X�^����1��x�cRýK���:�oY���͈���$�����ЮR�
��&U���D�W ��yq4,ϳp7��Z��}��]�N�Ǆ�UR����&�Q��8Ù&���Ϛ��|���M�3yf��L����E~���j��H/�?C�<DP��J1�C������ṳ �   (SȂ��e���A��
�*��)�e��C��;�;7��b��|9�_���&�
�8��:>��8�r��U�ފr5���?g�/�t�L�H��f>����,��*�Y/�o�o��:�Dc�����5H2�|��X~O"��"4�*�J�|K/?i6���h-l4���%���^\�5�=�������l9�fQ��W�~~����^��      F   �  x�=�ɕD7Eת`|h@�8�8|y������3ȷ�gx�8g̟�h��:K`58�����\�<9rlN{Bn�7b^I���֑��������)�Ɩ�c���0��q!Ty	�6���a�N��\���n�R���y��tan�$�p��0���a�T�ŝbĕs��)��&{�Pp�&�oHԝ�D�Z$��o�Il��{D��<|�
���t�}�f#wg���(o��<g� �eb�*Ba`�4ny���CK� ��U8�6���Ҳ��("�G ���*�d
u�T�d6�+�|�ǷJ���M0��O�g����y3|�^��I���W��8��ԥ-�UjY9G H��}W2�**�~)�f��d�	%	�;1����ۘ�fik�:��I@���2�˷HwF���C^Pg��5�Ծ��I��k(�U
,��q��m5��/�쪴���qUY�vh_�wkBt�7[|�֗�8��nB'��67����R�v���N�i٨Z@ٲנT��r����3�~ ֤F�qy�hf޵���
Ӧ��㲛�f��\��j��x�j�p�oke���J0^���b}T�x�zu��z����u�ｈ5A�UV���(k�B�.S���L��5�XPէ��0�L�O��Z����+R���H�5�!��\����nQ5��e�����uy���&l��zV2H,�im�j��5�DE�Z�${�V|,�lM�V|����Z~���򞒱�M"��V%�7�W�T`�2P�;Y��˙fs|��C,��}>���ž�e��*�'�T} �	5�5EJɑ�ry(7̚�����&$5���w+��5;�]�w�n���T�&ԋsJ�mR�*���o������J�Vo:���ɲz0ͼu�M���<�A<�Ь��W�b�Y����z�z���(�|wkfU�Z�qOf%�^����~�|F%      D   �   x�P�@zc1���%���OD���*�!�č��2'��~M�G�(�A��$����tr}f�2�I�Z �x��^W�
ǒ|=���7|��Y���I)j��o���Ɖ`��dO����Q�K��g$<\�r��7�
e��_>�s~��ο����S�NsŖi�~D�W2     