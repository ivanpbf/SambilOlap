PGDMP         ,                w            Proyecto2BD    11.2    11.2     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    41208    Proyecto2BD    DATABASE     �   CREATE DATABASE "Proyecto2BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "Proyecto2BD";
             postgres    false            �            1259    41209    ventas    TABLE     *  CREATE TABLE public.ventas (
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
       public         postgres    false            �            1259    41215    ventas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ventas_id_seq;
       public       postgres    false    196                       0    0    ventas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ventas.id;
            public       postgres    false    197            ~
           2604    41217 	   ventas id    DEFAULT     f   ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);
 8   ALTER TABLE public.ventas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �
          0    41209    ventas 
   TABLE DATA               f   COPY public.ventas (id, cedula, mac, idtienda, nombre, catalogo, monto, descuento, fecha) FROM stdin;
    public       postgres    false    196                     0    0    ventas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ventas_id_seq', 753, true);
            public       postgres    false    197            �
           2606    41219    ventas ventas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public         postgres    false    196            �
   �  x��\ˎ$�<���|'y:��ʂ-�`�2Z���a��Ψ����*����lD�L2_A����ʒCl�ƥ-��|����ǧO�}�����CZF[R��оI�!˰��|���w<������g�|�����R]�zX������E���wO��?��������i����>����Q,8*X%/?�p�Q���_h҅:t�����Ǐ���<���K��B�B�:3G��]9q��㟟�~����x���)2�Qn�B�B�B��RK��$^��������?��I�+�/R	9�!�c�Bc��I�����}^�����O_tMw�uZ�HK�uiR��1��虐̣`SˉӨngG�Rx�9��1�zE��_>=����㯏˷��?}~��AI-��E&�E�N�4�4>�YM��"<;>9xZWۆ��>�������O�������]j�y��D��WQ����eu�[͡�4�Aiz�23#1��
������B)���F�r%d� s ���U���Y/*���%G�"��ٺz*r`�ܱ�2��Ě9J��Ō��]�\�vREO��Iug΢��#�av��N=�ʓ��yx���˅A����{TQ߲nS���X(���[D��M��j�8���c���vi!V�t�	?ۂ8�9S$��Ck���;�v"�����P8rN��Vu@>�٨��(���\�X��:�ܺk:p�퐑j�����O����8kn��#���(����;���^� ������s�@Y��'�M��jRL.����$�U��S�3����"o�C���4"L(a�3�DOHӈZnh}P��b��`J���I%?�X��ϻ;Qs1�=L��K:Ǣ�LZ1i�0��Hu���J�����YM�ӿ�1^��4Z��6����`e�:*^�n��R5𐚢����mdM��V5k�#���*�kc�����	=�6�xnJ����i���뭡]����-�D�z�ҺOӆ����(R��[���yxnŝ/�
�0u ��ma0�54컨Af�s�)r�BQJ�(��W�G6��3^��i���R�N�"=/H3�e��#�����]��hQ����-yJ&��r���� g41�?\��F�84��(o� O��k�K����d�������9�:������r�����W�QF����jw�Pu�-z_�#,4!M��q<+��MY`e��ySt;���~�e�u׵$9ٹ���+e��?|"W0�B�=��T�zh�H�~\Bm�c���A�{�4��yi*�Z����4"���G�u��,�����1X4m��r��i���&���t��#�Ҩ�n��\ً��('�ax,L��K��M+�yM��&S��f�ܢh�l�C�C~3�}!�3�H��ċ0��(~�<_T���3�VC����
y���G%�tIY֖���ʨ�%-}�5p\+��m�2TP>P�u&R�����)G�~�*d�t���1$&�+��g �G
�Q����\�}�lN�O���ֆ=��پ�_}�WQ�3�>c��L�΄�9�6�)�܄д%�/$��Qȧ3M:�?��Kw_W���M�WVUjy�:��/أ.�SF"��X�@�ڙ��6=�~-�.���W�ԅj�Yԩ����f��ׇ L��ihy͹�Ai�h� �����t�ZZӱ��m�3-X�)�V"�y�ߒ����́c�� K�	��K��^-�Q6e��Q����X�ǃ3(��`J���Yʙ�-���w6�l��	+�C�����ee�ƅ����a�޷bM�J���/��ulY9
!��� O��9`����)߾(߄� �W{Oр�4�LﱚwGhz7޾q"�2|�I�YW��RÏ��i�9� ������,і��p�b�x?�����T[����h����|L
Z��_Պ�5)wۤfЭ��#'p�3���W���:�Bp.C�*�(����\zm�u��"�T��j$!���|���#���N���-tX�T�R�pT�Nw#r��'vpP__c�z�vs'pqUM����Bdl�`��H�>7X�|�ì�������F��@m�OJ���������-�%>"Z�N��>Z�q��i�%C����VG�W��*����Ʀ	B�S�#m�fq�Lh�4�Jax!8/�ܯ^�g�nh�^P_l�nQ�U��Z���9�C�
�E�t�̯+�z�ȣ�P�T�4T������{��n�r_���}%�d-v<}\o��xb�h~[���X�^P�Z*+��'_7'���}����%N+��M(ߘb����G0�>Ú��:4��;`<e���=lȩ�؋����)9+V&���Ǌ}<!�-9.2,��tkn�A}�ٝL�kn�K(��e��(Z�B#�v�O�[4��H��|ܨh��lY��x��X ��L����f3ļ���97e�@}?P�}`�w#���4��EO�U�i]�Ľ��S1��u}Z2��ȷ~s[��FW��F��i�]t@��p�����í�n��"��G��"��/����0�5T�\Ai��IG��1���x$�囂�q�+�dj��RH�=x}�ܡ\qC9��/~�F$*��fҡ��n?���I�6�)-��֟)s(�:��ٖ�&�_,�悜�]�
�˅s���<�1�*
����:4�p���T�]�3U�M�ǯw���߻G�BNs�Es��J#���Z�;5,���K8	+E=�P8�E�b ��dH���j�Ӈ�x[���l_X�b�t��$2<�^�{s��Nί�"����{7���]J�\��$�M.q�$/"Y�Iw$�#䚑��6��
笪�qt�G�4΁�/P�9��Ӄ��pp�moC�ӔS��7޵� T"L�>ً��٠�5��;���f��nd�9J�]��;h�;-X���0,�0�G02u�Z�p�
	�� ����}m�#�SQ�iG���,������rE�Y4�nF�� Ͷvg���C�@9��zG���F	1��=��1de ���j ⱑ��t�D������U��n�k`q!��^h��M^����X��c�%s�fhS�$�����{p]�������������Y�)�]D�C�M�KΉ���e�x!�F�>H�J�*����|)���n�bEI�Ei�6q�����;�c.�15y��xV'��R�N���
��ھx�,G�-^
��%�{�+�uF�o��֘�ݗ��o� �^���P�x�C��swѶ��#2�^���bh�*T�~~��_6A�%W��{�C`���('�k�$b�fsߋh]�xfx�f(Giu�wNI�S�]K�Ta��xX�,"�Ԋ��\[�oi3Y�?z�*\�S-g&���(&�;��:I��!�̩x�u�`�q�=c��B��G8��h9"|d^~��eFV6�@��r@��Z*�y�R�բ[޷}2'��9���}^V�Bk��^^ڇ����O'w>>Ӯ(���C�Q��K�#����:dN"��.�13#cܓi��cPF��f���T�1������������L�6M3�%q��JN�Kʍ����%���A"�i��.Vt�+��n�t�%�0ۙ�q�^��H�;���I�g�������[���s�R�gj��6�[�v�w��W��P���y�x�8��>��.� ��î=��H��g����	A;{�����y �D��׽�Af{�q�s�h�s��]':����A�nq���E9?�]� o���c"��j���n!B�x�Z�]GH����n2����IbRY�j�B���"�P-�_��,v�f1{�?J��yD~y�2U���˃�V�8F�Lyy���pV��㰏�W�,T��WemL�{-�{>^���Z"Z���L�>x�fx��2f]�']�z�keHo(�k<H3��nd���g��>0ڈ�~�9H\Y�h��S=}��x���i���q�%���4����ߡS�L��3]A�󛇇����g�     