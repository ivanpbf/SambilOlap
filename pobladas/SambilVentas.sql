PGDMP     4    *                w            SambilVentas    11.2    11.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    33099    SambilVentas    DATABASE     �   CREATE DATABASE "SambilVentas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "SambilVentas";
             postgres    false            �            1255    33101    validescuento()    FUNCTION     �  CREATE FUNCTION public.validescuento() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
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
 &   DROP FUNCTION public.validescuento();
       public       postgres    false            �            1259    33102    venta    TABLE     �   CREATE TABLE public.venta (
    "idVenta" integer NOT NULL,
    idtienda integer NOT NULL,
    monto integer NOT NULL,
    cedula integer NOT NULL,
    descuento integer,
    mac integer,
    fecha date NOT NULL
);
    DROP TABLE public.venta;
       public         postgres    false            �            1259    33105    Venta_idVenta_seq    SEQUENCE     �   CREATE SEQUENCE public."Venta_idVenta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Venta_idVenta_seq";
       public       postgres    false    196                       0    0    Venta_idVenta_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Venta_idVenta_seq" OWNED BY public.venta."idVenta";
            public       postgres    false    197            �            1259    33107    tienda    TABLE     �   CREATE TABLE public.tienda (
    idtienda integer NOT NULL,
    nombre character varying NOT NULL,
    catalogo character varying NOT NULL
);
    DROP TABLE public.tienda;
       public         postgres    false            �            1259    33113    tienda_idtienda_seq    SEQUENCE     �   CREATE SEQUENCE public.tienda_idtienda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tienda_idtienda_seq;
       public       postgres    false    198                       0    0    tienda_idtienda_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tienda_idtienda_seq OWNED BY public.tienda.idtienda;
            public       postgres    false    199            �
           2604    41189    tienda idtienda    DEFAULT     r   ALTER TABLE ONLY public.tienda ALTER COLUMN idtienda SET DEFAULT nextval('public.tienda_idtienda_seq'::regclass);
 >   ALTER TABLE public.tienda ALTER COLUMN idtienda DROP DEFAULT;
       public       postgres    false    199    198            �
           2604    41190    venta idVenta    DEFAULT     r   ALTER TABLE ONLY public.venta ALTER COLUMN "idVenta" SET DEFAULT nextval('public."Venta_idVenta_seq"'::regclass);
 >   ALTER TABLE public.venta ALTER COLUMN "idVenta" DROP DEFAULT;
       public       postgres    false    197    196                      0    33107    tienda 
   TABLE DATA               <   COPY public.tienda (idtienda, nombre, catalogo) FROM stdin;
    public       postgres    false    198   )                 0    33102    venta 
   TABLE DATA               Z   COPY public.venta ("idVenta", idtienda, monto, cedula, descuento, mac, fecha) FROM stdin;
    public       postgres    false    196   �                  0    0    Venta_idVenta_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Venta_idVenta_seq"', 1175, true);
            public       postgres    false    197                       0    0    tienda_idtienda_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tienda_idtienda_seq', 1, false);
            public       postgres    false    199            �
           2606    33118    venta Venta_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT "Venta_pkey" PRIMARY KEY ("idVenta");
 <   ALTER TABLE ONLY public.venta DROP CONSTRAINT "Venta_pkey";
       public         postgres    false    196            �
           2606    33120    tienda tienda_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tienda
    ADD CONSTRAINT tienda_pkey PRIMARY KEY (idtienda);
 <   ALTER TABLE ONLY public.tienda DROP CONSTRAINT tienda_pkey;
       public         postgres    false    198            �
           2620    33121    venta tr_validescuento    TRIGGER     u   CREATE TRIGGER tr_validescuento BEFORE INSERT ON public.venta FOR EACH ROW EXECUTE PROCEDURE public.validescuento();
 /   DROP TRIGGER tr_validescuento ON public.venta;
       public       postgres    false    196    200               �   x�5��
�0Dד�	ַ��P-.�M�^K�MJ�o��Ü�w5�d{T��5��DM���[�l�SM*�j��Z�v�F
�?٠5j��[H^r�q%�N�a;	I^�α=d�v�p<�9�.ѫƐ�J�)8o�W�@���'�Y|q��G9�         �  x�}�ٍ9E��|��ŉ����c�|�T&�� ��$�`ld��v���گٮb�5^)��Oh���3B�ʕR	g"]�j��Uc���;��t�Yސ(��FR�"���]X5̤~�R�J1�IҮ���&W���t����A�Fd�JH�ai@��eX��&֢_cD������N3�C���յ�1��|�^J/�ބ�W�U]�}�bc|9Y��H#���-n��ʚ����ӌ��۟Z�ށ$�U�_��K3ie���SH,b�e1sg4-��j��샖��Pk�3Y�Mu1�h�WԮŌ�ϒB)��hǤ����j�F�����H*�̫'Fbי�ɇ�`&�)���/�&����d�q����x���:n�$KU�,M=�\�9S��Iw���o_"k��2�*sp��	9ӹ��Cd(eӌۭ�s�Y����K�\��'L�����|j����q�o�t��Z=-��)��,��f*��j���3����\����j��a
%}u��L�>��EVL�0Sm���Xe��̝QC�K	X5�����3�xgցOˠ�3��f�&��;����r7j2���2U�Y��6r�����.�/i���'�񱠴�弘�>�X�<����O���C���U92M���*Lg$r����Y�<�L�m2-i,E:=�����6�
	gB�ŮBH�H�������!��̥.����}�8��AR���2T93��Ll��d&����f#��41؂�ۛ֐�g�W�)�x0���1�}IҸ-J����Q���r�=�߇�f*���ɇ�4Ԧ4�la�g[��[��GE�,�(J?���k�n6�M-�/R�ԧ�a���C����Ҙo���sC�P�*��#x��hl'���Q��AC.j����J]hY�>���h�ڶ���)c��n҈��P%U����xڟk���[�Sg&�:�^͂����p�&I3�TkK	g����r#uG.g^� K����Sj�E<q�H�{_�C��c��� '�Zu�\H�۟Nf}�Ǚ�ZN�����J���v�,gD�UN�@�K+'K�$$���hz[L�&>H�8-�#�r�0�	�|1���K�s�#�,�$P$�fNL���P�MJ��|Ah���*�*�o�M��+�TU�@tJ��s'�͝�sb�kp0y�
�\���I~�G�3*1:L��=!5����C/�����܏�\�� �[�ɉ�&�G(O�DSx��9"Q�TC�')��&�EN���/:��,D^L;3��q��0G�8�J)+�BG�vC��tҴ\M�K���b�|�0م�v0�*q�����p��G�Z��HhǞ��To�[>�H��%�%R�)%�̽���*ZYRt�����1-&mL?�IU	a1{_fPіV;��Դ��Hӎ+�],�gO�}i���Ů���	�P�\B0���L���+�����dV�3���yd\J�O�xȔStlA�FLL:"̤�zd*��H�ٞ��w����I�� ��')e�����u�'�
 E�_Q%�Y�ڕ1�sFE\O�V�Qi%����'�a���5JN ���C]�tM$ю?��R]��`�>N�U��+#X�4�(�r�XY�q�[N^ֻ߆�\��w��`��qO���0��"pu�ĘO�s 	
�r'�ƻii�Y*�"f?"��4d�(#~"���	zt+=��_�x�
����h�F?U��-�t���MJ��ȵ8�O�u��I��L��Ĭ��������z-BI:|w=�D�E��a����Yܼׁ-%p=KIH�����������k�el�Zk�(���f��:n��
���k(�ere�x	���A-��(�82��t�H��niZ�9n��q|�����Vb �83^Z;�Ӑ�$k���sߠ�/�Q`vd�O����}�[��i'��U��d��ʃ�b[�Ha�\m�������!Y�� 73{+�G�G>|#�P_j�q<���HLF|����.7��u���neU�f�:a�h��V�aF�C����q��H�x(�Cq�O���L�ͯb�)���T����,�gs�V�K�b��d=^�2��+��bF1T���[}�y�vP�>6c��?{V�������}W������n���N;��(�zQ����7�.�Tg���<�}�r�]�`/^(.R��4��dieԎ�O�oL�j�!�Zמ�~���� n=�s%���^�O�_�Q�E�o��m�
Td؟���;3ə�/���S72�<b��8X'`�#�\��X�>���m]ݮ<����59%�+�q9���>F�]+
trzL�A�ձ"GƉW"�C��H\�)���<S����B�Ց�v��*I�όk0�������V�ޟa�?v�e�Imu�U�u�A�@t�5Ux�R��A��gZ˷fw�K�)< \�)�,&Y�_P�;��W�6^��b����H9�񓂝�A7w�y��J��g��0}%|��@�F5��wb#���,Z�

�r�=�;�{.+�`V-:9����/�m�Eɓ�>1>z"S(��hy�!�T|5�OW��Բ�藋Nj��&w�����]N�X��Ts����P�,���㋘;�`��BT7�\����g
N�R_O�θ%�d?��2ĵV�7��5�~͒9l؍Qf����jG���pO�����+gę�"��p#��;�\�:�귋�0�'G���d�ͭ�*�� O�Yu��������w�k�ӁF�"�y%~&�?z�v��ϥԸ�w���)?�G&Q;83��e�;39�����'Ā�K�<=��GR�������|�0�l��3�z_~�!�fYV\Zv��L��v|k�9�Ӥs����y�3�U��xeaK��<��Y*xl�
���U]!�^��;��@V�FQS�L�F��dWZ��J,�7f=��f��@T����z�m(��q�{�����TJ���O��K��s=�{r�L4��<"�/��7·_<q����d�'����`e���Ӣ0M��~JHV��	�R���n�h cQ�Rk,9*��=�7��2\�9>3��&��V���J��S�oW��ޙ�چ�M�/V�J#��Bw�_��V�ye�v�˷�B��K6�=j1 %�}=	�}w�5+\eV(u�~I4<����Y}�1f};�f2O�[�Ox�P���������8/���"?�zg�em�v�aj����� ��L�����5�.5b�pD��������w[T��Z��6���@�f
w\��Y7R(�P��~^rf����K+�p�o��C)�P֖��n��,���`�q���ə�O����y����!L��x'߈�(,�t�U��D��:�j[��T���l�U��o�4���wd�B]�$<�����arr׷n�>�$Uy�J~WO=�~�c����X����+1]����?]8K�?n܎�ϭ�k\	���p ���r����O�k��8�mk���=͵�lߙ� ���U8C~�Ņ&�&b[{�3����̇
/n[�.��!?5��N�#�Y�N��~̏��I���b��od��X��W��{��]y��_����������� ��     