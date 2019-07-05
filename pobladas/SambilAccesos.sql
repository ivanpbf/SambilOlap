PGDMP     1    +                w            SambilAccesos    11.2    11.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    hsalida timestamp without time zone NOT NULL,
    mac integer
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
           2604    41192    acceso idacceso    DEFAULT     r   ALTER TABLE ONLY public.acceso ALTER COLUMN idacceso SET DEFAULT nextval('public.acceso_idacceso_seq'::regclass);
 >   ALTER TABLE public.acceso ALTER COLUMN idacceso DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    41193    torniquete id    DEFAULT     n   ALTER TABLE ONLY public.torniquete ALTER COLUMN id SET DEFAULT nextval('public.torniquete_id_seq'::regclass);
 <   ALTER TABLE public.torniquete ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199                      0    33068    acceso 
   TABLE DATA               [   COPY public.acceso (idacceso, entrada, salida, cedula, horaacceso, horasalida) FROM stdin;
    public       postgres    false    196   d                 0    33073    rasgos 
   TABLE DATA               4   COPY public.rasgos (cedula, edad, sexo) FROM stdin;
    public       postgres    false    198   80                 0    33076 
   torniquete 
   TABLE DATA               J   COPY public.torniquete (id, idtienda, hentrada, hsalida, mac) FROM stdin;
    public       postgres    false    199   /2                 0    33081    usuario 
   TABLE DATA               .   COPY public.usuario (mac, cedula) FROM stdin;
    public       postgres    false    201   �g                  0    0    acceso_idacceso_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.acceso_idacceso_seq', 483, true);
            public       postgres    false    197                       0    0    torniquete_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.torniquete_id_seq', 1244, true);
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
       public       postgres    false    201    202                  x�u\ٕd����b�=$pI[��v���}��F҇�b	�T)�O�?)�?�������|r�H}zn6^?��%���hZ�M�O)�O�?����d�H�(�S�G�
ȟ�uQ�>V?In*�Gۧ����%�>#[$���>$��R���yj�����`������O7	�cF�R�6
$T~�OQY$�G�G�� �A�Cғ%���(Z��vjZNOʶ��>�Ք*t� %ڢL����)�tˢ#��f��?�nV���#�f���v%������y���iT�LYu�<v�4P��أ#Y����7��o@@�*�'�P!�2M"�����oV��,ϨV4C�^c��̜�'B�ݑN�:����T%!+��`j�
�D��n��D9)LKt����*]�"-���W"��J_"�����?"K[�U�.@�M膘���0
�#-*���NP!���-��S4yDˢ C�c�����PW����]"̪q���ƣ5��X���W# V�-���%��9�Q]�?��~����t ܊ѓd��l� Y}�"���y�t
����	x'�a�p� ݐ��:�P�d�$��)�* �Ϧ�)hKc,��lgJ�[�V��	,:c���y��psdrh+ ���M%�(^��o�d�yF��hV��"�R]$(cNϜtXn���L���:*aQ�\Sk^)͍���g�G���X{2ä�L$4Hi�zϻ]B%_�B&�7�OX_4����:@�@FRB��q�$�+������+Y*� 	�u���dƜ�Q��T��HM��\�Z�7��\4P"_Ȝe�zر�1�o�`*$T��64<9��,f��T�|���Ƃσz���\��D���'��X��J]�Q������++-����)U#s]�`�g(4G��%���P��V��9�ҍ����1W4��ᇪA8�5*B��XB@�Uk�h3�-�wҩ��3d{��� �j�j��ArwG���d�۠��������:�\K&ڠG��� �Pv�{��"pqo�P�p�m^�Q�O�Iǐj�f��OiQ��jje0�[ � �LbG��}�f�b77V2�TX�G&����{�^��ג;H��A-�t~csu��o5�9]ʴ����0��14���k��<V���4�X�c���o�N�z��6˭z:��F8��|��t���oh�@�EBs�pJ�d
�'�/0-��-fd��&f0A's}���V��pd_�X�����`�%ȧ�3�����z" �*�D�&{`�9׮�������)�"It���7+���Ōpj��ΔN� �{9�{�HLw&$S׈�|��ޘog�$��=A3F�.}��\C�3�4����`��Ak٢Q��P(�0�Zq�ƾ��m>Y0`pFTVH�3�X`���k�B��DUǕ>icZu�$�r�B�`b[W*���2�6�x�~Zn5�]���0�0�5.��y�A���B�Jo ���hiS�����t���U5`$\f<QΕ�{��	�$��|E0�@�w�f��f�wP�V�}�
�nN���`�RE��4C�#������MB\@T���x��7C���:�PCA�sB��+z���Ķ�
�tc���)�yLp|�����RpPY'Qd��C�GRT�\wb�V�V�b�ᒙՒr�l`�{B4�3ހ^���4i�����x�I�����I�6塃����zF#U$����=�M.�tAPjo,��n�4�˳h�Y,�QO��: `�f�p#�쀄D_�0���Wl
��Ј!�$�����*s�C����v�!���jʦ����;��m��O�o�^%dBإ��1�07��s��݋z߳�o��O�P���2�\���F]����d�I}��'6�ņ�$��`�GE��b��f<. ,����R�I�͐�y�w�U�������FU��U�$�9���k'0��ʙC�E�x$7��"gܱ�u����) :ꓔ�-�܊���-DSZqb��͓���`bLpF,��fC,���öG�z��T������ �e󄏇/þ�&q�Ьu���p|C��u�8X���=Qc4�����1�����E ���o2�����.�6������;f5�Z Ll$����#:��%�s�1�i]K �R�A��C�����0����X����n���z3C��' �	=�o^�}�z�!zR�H>\ a���Bvs�v�Ez��� �� }�#�L>�=U�1��#�Af�ֲ蠞����'pk(̀p�Y���fH�Yu��A���u���eK`�	o�ߔ��-Q�s9r"��`s��d"�B���H]oV�+�w媩#'�K2�h�N�#�w"@Xm�&®�S�["�|�� ��تB�>� 
�ٯr�82ث������N� +'�J3�R����:ݢ���a�bq@z�����9B�e�ƼުqX�)Î��� [ҜZ��p�z^CBm�!A斴/��(n�b��hR�OR��R��7*��2���k7���6YW]�ս�Y��� ��ܭ��h�$͞i��� v�S@��Rc]=V#|g W�x.�����RǱ�`��p%`��.!%(a���C��#�s�Zj�#�F��M�|^��6��4�߾�Z
�u/�!`�GZC�&_���m��}��ͼ٫���<�.��� ߓP�>JB����>���.�p���jbR�ͩ_�̐O���hfrjT#�Y�Ma�A�1a�W�	�|�����,�N��ŗ�fL6��)a�Y���@�}5���]�t��u������\h&�졇)d�u.�6	){)�c��[؝[ec[# �-����n�~,�$��:��/w	\"�Q�Z;�
x�
����t���g�7ԩ�W��t��j��o9�W�O2�D��yӀ�0n��EI*-���Ȕ������%)�i�H��ʦ��hl�9��#䰂_E �P��P������¹nG�1g<���ane�n�t�2��i-��Z�v����o1�eĳ���
/��u���ح���W�b6�I��F����N���P�Z�,�b�`,�i �؈x(;�$�O��A[������o�G� �h�������_+:6V��)$D4v[��>j�`l�a��j6��\���	q�p�w��i����̵Y���~�v�Km��ɔQcZ`�h� ?�����U(��\�=x�ܗ��l޻�TH�#������s
��&����%���.)y�!�Ke3$�y�z��+��z尫ˤ]u7d9�ڰ������|��]gKXvKʭ������J���t���o�;;Ճ�� �rb��n�v�BB�v̀&�[���cS������J���4�St�����8�3g�`s�vl�v��_O|� �hJ��G�V��-l%?��<C���X�[�LZ�7�S;�Q�m��8
�z���^u�By�<:7����$�ʘlV����
uV�MH�[�R6�w|�C�\M�S#��{���	��c)�:r�%����ųB�\���;�P����~��xW̆��0b�(��"��kJ{[�@(�2�����n,�^&�V�^S\��[����r��:�����O`̲������"Y̧����vB��T e�n"4�v���"��7	�o��!I�
	�H�-�,ko��81"�eh��:o�T�m�	�g~���6�%��:!{Ĕ[0��K��3�����.D'2^^�܀"�K�(��z0��ijr���w����\+�\���~	>�M'4�,_`<�����'���K��KIt�>nsl�mL[>��?��',����������*r���6�H����,�mo`p:�/%�/G�D�Y��w�d���[�"��y�X�������3��#xK��x_�9�j��
?�e�3�T�H�g�%��:����cF�x{����mf(�u&U��B�'�j���җ׹�2�0p-� ̩,��Ӯ:��'�A@x�)���,Ǝ��-�����^�Wd�Bm��R��?���T�� ���:\ �  M~�e��Mm�AWq3{a�u����iFg�!� /��~-�_<2%{������#���=�8^h�n���f���o����O��Ķ3�l�#�n����� ��!��8����	yj_A�[ТG��Ȉm* o.���=�9����9t�$�����xDCZC RJ&qT]�Plnn���N�;	�L�DH���-w�͌��{���>�E�{̴�h^��� (`�떶�/�1����ʔ�y�Sm����/IU}e�Sn��o����|��G8y�A����(`ޗ�������t��a8=i�[do�=w,o	q:{�N��֔�m��I΍ďy��i���`�o;6g��8�u�3��H2�R'���~|c�~���~4��1|�2mWAng���@k��Q��u�U��\�G�
l����*�Jmr��H0���5��w\���\ʤ�Y�g���p\�B��+[-mV�v��E<�k�� >�:6{��:�>�t���7���M����:G�9�1��D�#��;����o�9�r�|�������)-̓�c��芁�
�����q��<��p������ϩ�i�Np�������������Ϝ�C��pO�4�l�%mF��9���;�.`��77T�x/�	�����r����̐���Z?2�P���c;e�߸䡔�o���x}��Dd����n��n�n]�W8R�X��;2�����#�ݰk(�M~dъ�/���V� x�2�����_d4�8��}`�+��e5�;�!�;�	�o;�y�~��2�Q�j5��ίl�. _�1�E��I���ie˺\��Ⱦ�q�-�Mq>����b�<+��x#��ǔg�\��8���3�/gh��=>?��ۯ	X}�S�NsY-e{C��1!!�8g�_�����7���W�� ��*� ���[ �_��x�� 	?����m٢�n�-�~� m�#��=�/�}q)P�r���; �K@��kx��%��v�ٶ��J�.������G*O� a;�h�ta+xD|#7�hD�C��۱�Pn����5x��i��!�Wχoɡ��h�ڑ��k���o�M���u�����s����
ٯ���B��jR�d+߅LY$:�c��_l��/vX�G8./�K�K0z,�ߜUi���vه�aj͗YY�C^�0	������?�T[         �  x�ET�q1{��d�`7�_RA��#��L������~�����v%�t�o���$:i:}Ga�����F�����D�m�胄�N�9�S�F%�I"g'��;�V2>��'p�b b�G��"������/g�&�eN4󁥛O{ƶI,�y0Ϗ=���FL�1و�
V_�r�e�D�$��w�B��m�
�=��Ycf���ä
,X͞�:w��,�9g��u���*`�C���A@�Xȓ����*�͒bh� ��F<o� ��`U�c���{�Z����v�R!��h�G��.�)ռ,D�A�4� �J�&�Դ˂N.B�% RW�x��z/V���i@Q�ҳ�a-�-�����Dh��Wd0ϧp��n����H�R,�n��!�j'#�aVJ�>���<��t0n�T{~W�H��H�Y�t`�.�Y<q�,�PG��_"�ud�+������u�������p�            x�m}[�,���w�Q�	�2�@�5�A��"3ն��1;dP�!�g�h���m����������5��$�������.��:���7d���C�����a]�,$_�z��>}�Oo2�<�OO?�������{'����O�w�f�⡭|��G6�cäi!��k���m������Cm�t�k}�Oe��e��^?l��̚R�r��=�����f�c�!x4鲵���-c�qi2�-j7������M�n^H`��Z[�� ��?����5�($�����m�n���r�Ld��xp�b��5ǚ����Ǔ�
��ڿ�~�N7)$ǿ�;!.���#����=�������B��鯯����`�7����קۉ���Ayk���{��?���?w�ķ�i���!8O'a�8=�����LG")W�檮}ן�'濆���^�Rκ7Hh�x/��Ϗ_�6��R���o��!3�|��?����7���@a�>��O���xm|��QIXT��=���<>��Pi�?�t*Vn�Ůo�������Ef���ڶ)�W����Ʊ=B��I�SWt~��tz%uSd�n&ϧ�"�J=}��lH!�N���<n�J<>\~�vٽJ<�w�)���T������1�0pO�Wz��q�UF�<d��o[��UHbש��������	�1�:��$���i6m����_��jVH
3 Ҝ�*^��R����;�-*2î����(��o��w��ʶ���u����}hb�i~&��Q(�2��M�^�t2�!\0���!�^ej�΋975�e�Z9�.V�ʗC���y�}��[V6M��&\�յ�zDN�����#Tu0A��!�p��#T�Ԧc�B���~��>�&��d��?��83=������f����ţʞ���nY>Z�H���?ؽ���=�"L��$�%�A�.܇��7�Q��{���:,�"F��C <yy$�{�����ns�B�O&΢]<V�g��ƻ�4�B����Ǿ�e�o�A�B4�Qj��rZ�/���{l���mK�B��l�*XT(�GQH�A��m�Uk��)��&Ȱ;�^7��0]D0k���+s��/��?ECL�A���1�J�j�A"�[K1�#_��UH��Ͱ�XS��$�gIC�u��%���W�m�W΋Ǹ�\�0��a�0*�+�e��1΀=�X�((��ʀ�����|��z��:%��)i=��v�V0�;�r%a�qۚ�ӗ�l���8rF�m�QIT��
ܡ�^r���su��0��QI��I���������<nX}U��·��x9%B�-���^I|��r����}x�|�S��`���<�
�A���@�[Y��z�y<��x�8�Os#���)+���r-g�sl1��N{���:�'��]<�����Br���x��<���DPI�ӧ��	�t�F�A+Yr��2�_wQ��E��{=`��8��p�&0H4�
T�r6nI��<��cT;�I�]��0� ��E�n�1o0�t���qi�L/˧�Ô�ӭ�����p���R1�)ͱ�>��<�0w/�Q����p<_�$#P�G4�,�x�,�P����{�PY0[�l_�g�ÄOV.$j�ä4%���+��PC��n(��@v���/������%�C���NXdO��ţ�7T��a/-$��H4����0ok�mt�BaW,�-�C���_���I���Mz%����^��B|�:��j�B�ýt�ϗG�EL����+)��TF�^�*�E|��:%;�Ě����h?y�wR���N�LUV/�}�?w�(���¡�,	�[!y�>��Y��/?�:6�I
I©�)%����h�7[ˋH$k������cSⶰG/��/-�]��f
�VH�	���˺.z�X�:��qz]�ť4�ߣ=~��Ԛ��37kk#�zyXYT�#�F��^�s�2;D���"`��EZ�0���W'��b���1ʢjxL�ʚA�L�2�(mB�_)d�o
�����A
E�/��D�qF(�YH������Ԩ����֞mԑq�a��$�+��/M�����j���ǁ���"I��3�T�s�!�!Qs���C2�,R�ȟ@̎74��% B ��rH��cA��	$���K��B��,,CD��_[��V��5���:O�E�O$8���/�}V�RȜ�f1ʮ>V�C�7*�L�1�vtה�����`����l؊y�^�|1��"*�Ib� l�;%�)=}N��^S+$��g�����0e�$���z+$�7��A�ǥ�u�����e)�r�u@#aTC�?�&xh�@��ɯ��,�����	�O��ы0s	hߠl�B|F�,@�_��g�&�@��Jb��l7��K�c=�uW�$�|�ԣ_�'-]���L��-�KQ8��#�,~�DXە��=�bW��ꆖҢ.�yaT��Ε}Py4�����EME����F�uN�78��ފx�¡.��$@5�ۖ}����&ؤu���X�����(b*�y�3�m$�cM����Z���an]H���������a�-�/��a��֦"�:�r�g�RPB�V)
wM���px `=�D!E�%��䝞܊h
}]<f�X�Hަz�)��ch�f~y��������>Ɛz�#� 'q@^)�xv���%{f��q��S�e��o�H���&��p_�[X
�'}e��v"�c$���}Y�-_#�%��
{\���g��!Y��	��s
�	���Ȇ�,,Kmn�8��,�B�M����M󟊂<"S���Dܝ2�-h�f1���u� �K7iFF�P+v��2�6�O��<��Bb h�{�X�G�6���H�ƎoV}\<v�YO����\�|�,0g������j�I� []HD9��Nx�H��'xVLu�.��G��Է=b�u�������0��ˣߧ>��#x 8=��HS-�d2��a�[$�>��.����g��C��IOr��Cw%�sHQ�d�<�Ǔ?4����4d"#J<��O��x��g�O5�fؿ�8�d[ԥ��<�?�e'$����?/�}��O��-}�9����:� �?�,<�p.l��<{"��^��������fO��]e�	,ը$n-�:���C�g�fv����!ŋ �1�2���"?�@�^�h3t."����!s�G�����a�)���>"mp���#i̳o��졅b=2����"�7�1����*i�@zg���1�Йh��j��UIqf����{y��)��p@Vo���,���/���8_g�!�w &H�#!����/��l��0��"��~�,�����)YQ�-B�QY5)��x����?b���Y��B���������cV�	��Ჲ�a��d�啒�����C�2P?{9���I�Gݓ�J��D�f|��x2���d�P��X�с����	3��7����o@�^I�,���|���T+`y<���#k�����O�[}jw�3Rt�HDgu���1��s�r�#�B��j����´p�_R�[��/V j�v�����F��/���=�X���pEHgQ��Ţ�Q	A�{(�tr ��z���9�4y0X.&U�X��Aox×GGM�i�v����P�yy���,��ܪ���I?��ߟHϚeSG�=�J���m�����kа�C�1м�TF4�H���?V�CcL�9���6hQL�c�r^~��加%=;����LA2���=Xۣ����Xڀu�.�S��M���O�dLyB�H��<�� S		4j��U�)sd
l�ɢ�o�+��b$#�i��+�(�� �3/����Ԑ�FKM����tGv��a�8q�,��8�d�0�ż�١.��-$�4�Rc���
�0���مtT@*���c�1szS���V�w&*�=�M~x�����~�W��|4T��L�L~    y�O��5��ˬ�µv����C�UX,��eR��_<r��9k~��Bb�?t+�_)�gJwTK�^Iv�X��,��o'\��g]`�o��Q���Q[Ĕ�8���ʱ��5�<���I����9�uD��M�YH�>��Mw��~*�bXv�,ҋ�ma[&��X$��
��m��-�LXRѰaw��CZQ��7'b�L��v��F	c��!�{�S��f*���R�[��/-<<�� P�L��T�0>�ؙk_�gUx-� �j�z�B9�<�����nv^&m⠱ۺ������1w�ř�$j��L���iy`b��1���5�� �s�>���S���Rv.��O���B��b�~�?�" �Ft��l���c����c���@�8-n{��Sk����Ж���S����k�FE+�>U[ #�Ά��kA��?�(|�6� ��E65
�pF���f!y�'����x/8ş�#�\�"z���`��8�[ك�{�D���
I���A����,T1@��eV���Kw�e�#mQ�>��	̰�k=�^�D:� �f�ǞX#C�X#��p}Ndi�9�?�Np�S����;[,��]�`d"�Zx�^Ht�)Q��aы�M��n�9��g��Sa��d�����~J�����I=<�MI"\xyh��h��((�B�v�x�����<s�īw��b�)p}�y8�=;��� ���߃�@��F?�<��k�{�N��7���ƣ~�oz���-����n�~x�Y���O�@��$���~���� ���,@<���G���D0�f��:! ��
qv���Q��1T$�C�4���J`Dw�N�5�,% ��{Y�{��5�o�wyƘ����m_Iw �}b�-��q�����~�� ?��%��4�~�q)N#k�<�󳣀�qI~Ь���1��~y�j�ͤȨ�NN�~j��À�oYG�Z.�ک��3H�|��^oq�A�u�QX������8�]��x���Ig���](�]��T<8���r8Gi54`:�����|��������o)���o`���$|HQ�@���qW����2���'�M��&����qW��nmN��H=�v�-�X�B��E�:5*��.�E��w�����k~�1Ũ�+y����7����6��݊�!|���@%3���yE%ZN�3�H�n��J`o�Kf2ś�lQ�5�s+�԰KPa�T���mHl+�L��IGK@�t���ţH��6�в>+iG�~1}|c�x�V�cE� dK*��1�{ �h���1}����3�xY3�� �(f��V��/��?�8G�{�֝e?.��6�.7�^K�k�֮O!��+br��^�E,zr��t�s�n*D�bq;>=�����ik����4�ʾY��*ʹ�Xo�rޢ���ًs�k����h@�H��4]�c�!I��®��ţj�ل��
ۃ�L��Ş"�5vVO#3�o��G�1O�蚭��ic㙏*��wa�z<]gaá�V�.�<�0R��dy	�M�r�܎�s�A��������(���nd;$58"p �"AјŠ*����*��1R���/�V�a��
�ک`��r#o!�i��9�UHLfn�l���o���V���H���B��h�aGI<��J�p=ۣw��e�M�e��d/�ZోԲ9(���H��&���/�ղ�º��� ;D�(��* �®�<�؉�i���%C3����4�q1���OK�iF�R�<y7������q8��ǭ�����,g�Y�4z���Du a{i?�E6kz��Q�7Aq�нY��X�5aB�����c��;ԍr��������0����_��Q����cAۗ���X�#��r#̯��ʹ�LY�<vy�h�e혰w���C���Zϝb�==�t@|���C:�������)�C��<ۨ�bD��g��C>$V���+��S�),���Q!��~��MU�G�Xt�0l��xX桁gaqhU
ţdlO��^^�6����>
��c��_��Q &�n���B�*$�&l�tjǗ�,��,��p�^����j�b���/��82S}nhH.�rxYs"p���jP?�&�k਴��b�{__���)Q��T+]*I�JD1{��?��N��(�џ��Lɰߗ�f�������.��*��ͣB�3a��7����N
�7�����}З�\��ֿ�����)��h��??�B����J�$h ���������GA�l�J��n�<���xtrѷ}I/�5�@�Ǻ��r�DA�;�%�8�&p-��T��;Ӄ��@�QcI!�yr����[�������n�B�[H\��|�Wo~s�^=J��ܪ�d���>����Ex��ϴ�b��U̢2 G]���(k3�?ҋ=��B��s�<^t�2�
��͛�G�`Z�_<�(����R����=�L��g#��7zzˌ�ׂ�5�<�ж���NS��y��"]Iv\,�����1/��8�O-$J'.���l_�s��!��RH,z!���e>����S��೒N��y�L<.����� X�?f8��"�,c��h>�����d��WR}l�,E|y��x~�-e$�m�PzX�ƒB�X$M��=F��]��M�S�`y�O��x�1��D�6�hr��nI'��K;�O-��Lb����D�_�'k��`5��\���Ǡ/�a0/����"�;���c�
�Gc�����8�Z5d;c�8C����CF�m2����/�k*���FA�Y�,G��LWŬ���dM{�oV���֝��m����ޯ!�n'��}���)��a�u�=��36�u^�����w���3/+�@Z�������_�1a���E�-*=��T�J�P��P�񳊜�LNc���h��f���c�Ta�j1�Mܬ�"	�?��k��%���a��fn-�,����g���q��Aig����%Y ��T���Z>������	�Ҧ��s�⅗���V["��:�?�N'FH/	3��Tb��1�ZU�;�y,�!al��EςN|���eEJ�0����/�dҏ|�rtX�V�[�a3��ޗ�g�b���rx��Q�zf�8�y�,F�;�%����|l$k��2���0�w����o>�#�m�X�%�?�bck��==s��YD&_�G�O�Lz�)F1@Ʊ�,����v�x�E
u˂��a�C�(���8���B�[��	爜-�$�� ����U�=#.���W!���z��,��D�1�Hk.>$�b5��i�h=�v|i���^w��吃��xT��N�sس"�tZ�ic���(�ۓ�&�ue7�8��g�ӳꆓHf��5�B�h�e#�~�z1��*D�4w�k3PO4�Q��dB��c�1��U��ZQ�(�eM/�Q�d��X�Hm:��� �})�&�cYje�]Hў!U��zy�+j�|���z�<�Iw�-Y� �w-�3�n�d�V�̧�8rB7�_js�B:�]��p0��|���F��f2>�7F21�*�z2Y�/�
NK�)�QH'7ˎ��v��k����~f"5*�QH'�6Δ_<V��WZ$�F��.\��,��c���-\@����Ab-.���Ѯ���#���c\3�>��K��z�V����ٿ	ʛ#��O�� ��v���P9/$9sȰ��.�0���ݲ���`�c�d���j�=��>��%�eʉX�`��e�e9b0�Nh��8��� 0�� f���@Ϯ;�����~�Y����5Vu��-�-��l�}y�j8b��,��B:��g�N��t��䏠~Z�����$O?6�W�g�[���Q�3���!e=�
5�hL폁�T��K�<���co�5I߉��v4z3��â��`t,F���\�)��T�;yf��<짚|������CΔE�%��e�Ab��z��c���̻�k�	�Ŝ\����4���w�&p(����N�V���Q=�1F�mn^�����X�kv�؝���X�y`{U|�OQ:snu�%��mEw��Ů���9���.YHc�f    ��&8K##<�g�*�����{F�����t�C�$bݡ�sxz�ZtJ|y�?�:pP��zvb�+Tڠ���)���5��=�`A��.����H�ٟR(f�P\ɣ#��S���1�]��7(�6�$�!Q"��0���Gd'�?��?�)����/��׃�A��6������0�N;�屳���^ª�A!y�8�H����O��h���Bz\V�iX�Vv-sp�鳮�b�B��2��龹h9�Q�N=7�aj�zP�陘�rrg�-!:y�����Q.��7�g��a��i���ʘۃc7o&��ht~O�ބ1�@$P�ʔ�ɸ♛�a=��}|��J�ٶм���K9s�Ι�VI�!��cV��$���gƅ����=v�ncgvsI�%�F;w̽v%y��X%A����:�)�-�� ix��v�Dx^~�)a��I���́��S:�F�?�٢�u����$�g����<��X�J�N/F1^;�$��O;)����O��S�iEw�?�#�f���`=%����^H��ʱ�[�lbiWv��=:�΁�B�(�]+�������۫���%���������9�]�0pB�S@>/�s��Aa�.��LAq����H��虳*�୔��q�p��wҾ��!�����������(��-��X���m����nf{�ͤ�Q2���/xc�PJ�71XVL�j�yڕL���ɚ-�l��]Hrf>e��b�t�Q$�܅���W�D�t19�7����B�j��K��@4hLOLff"��������\����2�:SN���~����c�N��/�F-d5���.�C��X��˺^���ψY���M����Q��Ӛ�H��`�h���=���ѯqj��Ṋ�H��,��<0[m1��<߫	�g��E�+�+zp1������l?�"^q��i�d��y��A9P�F���($�Zo���Gy����4h���*��n�$�1�K�����3��#1�;�<��֊imp�'4�J%�s�"�����]Px\��cU m��ba��X�M��m��N ���%&��C�V�1r(��+�"�<����u�%�b��*�d�x���Lza1*��9�T<s'ط}��`:�Rc* t[=�p��b�g�b��'�9!����f!{����BL�$S9�F�nY�΍_���Vxx/�*�Jid���v���Kϒ7F	8ꁭ��$�H�ܚÂ��v�A��xƷ.&�6(g��:���B��"ҙ?���= ��t�<�-�]IM�~�l^.�\�4����f�ŬiΉ&y�hy=QD���o�xZ����P�\ �3���L�h�fu%,�%&vk���l4dh���e6���%i�3�.���\����Y1+�e��H#<�U�p�(��L�٣ݒ�X�C��CV!Q�3G�Y�38�F�L���S��V��+iŸM 1���L���O����	%��OJp:C /�����lB¥�5�Ff��q�>8��<$�1��$�-�մ���L���v1�l3OGB�l~xU5��&�Su1I!�T���. �B��Y2#�E����N������3��WG�L��?}�J��9
�TW,�&������ic5��f�#5�X���8� !�Y4[�nP`����Z;s�q�����l0�-�(+��hy�������!.��DJ�c3Y�,�5[V�-�9�a��ד�Q]6 �ڃ�r�ɟ�QX[iL⺸3XIX��t.N��j��$�!V��f/*=ƚ�;�f!=7 ����"���gB��p�*�aB���d'<��V�a3��9�uVJ�Nrƃ�����QA)k	#��^�Ӊ6�ѡ;��\f>��&Q�<F�w!Ō_�_L֟��g6���)̍ϡ�_��h"�QA׭P�8�Ű�/�ՊM�{
x��i�a�x�><�Eb���D2(�S�L�N�G9�16�.c��ms�ΥeQO���v����z���ˣ53����U�?������a��~��f�U�%F1���������3	���Q9cG���¤{=��?�'
MVkRIѷh���/�\42�L��P,�g�s.�����X�H�3I�Fw͋�Fi��ƣ����F�J#Q��}YFP��͜[�>5��G!���m��?����|(��R�nw��x�
1�����7KVi<!�XmjQ8��Bݙ�=��#vn����`��IaQ|��y�l���{�3k������.g�O a{ƿǏ�鞭��y�d	cW�7���Hg�|41Y�Ţ�)�?3.?��NiNlpHY�˴�,���}�?�탚[쿘�J	�Wy?�����p��e%y\�����
���z�>�̠]���}�n��󒟏f ����3����h�,��<��򟹼�G���M:Sq=J�|���%�[�w��QL�&�	���[>��f��]�g�C�$<���y`R�M&���F.1x�������p���d�s�
P�,$���?���b2�i���q���i�K8pf�*���L�d�9���ϕ��sX�$����i���V!E�"�d�5(/iya%.�aj5�@�q��f,��-)�R�$^H��؅d1B�w �|�ײ�ɷ����u�¤쎆��|����!����I6c�`�ν���?�G��qL�5�f�}�]m��
�6�zQ�������.$�W�*\ߋ���9���/4�ج�(�a]+k�_&)uyFꅡ����V8澞�l��ڟ�I���j�ո�=��X��b���_��so~b��,�B��,x�hgY��*���Z&gc��^M�9�a�}m{�,$����~<�I<�s�D�ڍ�ʈ�[��c�E���:sf�nw��znV��Um��݅���N�G���+e��z����x�=3Hx��6)���;���LD-��%�[���{�B�s|xٺ�$�B̈́+ ��|� �@W��{1Yy;"Un�[f!Wch(ԋI���f����W��ĵ/��2Z�ӟ�9�
I�ȌRU\L����G�oع�W���6]L2���})t�8�=��xK^�Q�pqI��\�[�x�S!��S���{e�eeL�'
gq�B:;��
�y��xAQ;�A%���)Z�8>u&&����F=��q�,���<5l>�.&)뾞�:	���®g0O\�9�d���,(1�%R�+9��j�\�H���F1F>�fqJT��[���aT#/��E:���˖T�>�A�.��$�e"E����{SRP����L��L�(�#P��m�B:+��o��j~����	nV	y�H���V�$�gX��L}WB��D�=A$֟���KL���QH��	��o������oN�3׼kp�Dk�R`�O�Z?����o��I�t�u�w��I��!
���}��G[����;���c��ьB�S�8�>�80o��ILY�`g4Z�J9�!:���RMbD$X�ʰ�.$&�'/����Ue��E��8���+�"�ac�go&�X�(Y����^��!X˫۷�L,�S\o������!8���.���g���Q�5,E��d��ԍ�gQ0�M��5�s/�Lw�����8/��8��b?�߬�&��I��!1һru?ØX�7{�?�LR�h?��{���n���؀~ƴ��d�r��p��2K%Ōc�D��9#Ձ�ϝ	�>ו����>�����I��çq��4�J�+s���Gr�ϰ�3�I�u)$�3J�1r1���d4.�i�=L
�N���^,�@��
���5�C:c�'�>:(�I{ʬ�����xHL��4���d̢��3Հ�f*�t���|*s �E���e��[�めѧ����Ώ��#Y� �z!y�b]�)��T�/f�b�k<����,�����;�.1�%�㿍����g�\L������3I
I�.ms&fo&�A�3`cŵ	�Bb �7�_LnE*�zܦ��]<�37�[cR�br��=ʚ����J:�`�=9��br�+�L��F`�U�ģ��7{���ܞ�ȃ�b֑�J!���.���u)�RN�ס˲^H�~����y�2W�w��+�s�Hr�Zс;n i  �����R:Ȳ�<���ֱ�C������ �]HgJ)<)��_\4�t���6!��]I��9RSn&��	>]J�3g%E���bb��4r��`T�F�k�8��b����m�C��:&�zp.�ו>gd[yb	�؀:{!Y�J *���izY�X�K��Օ�Y��O��������H��޵�I����r��E��"W\�b��o\�p��n�c;	e����ތ������q��#>C�9��)Rbm�I��}ng�\lj%C�F�zq�yM$\ށ�bF&��|c���$a�31Q�eWh]�١�jli�k��`{�4<��+$ۮc�4�hžK���9�@�<��t��;��n&�#u��t����e��a�<����L$71�#�>
����r�/&;��K�I(�ݥ{�������_�[��Q8�7�b����"f�R�3n.&U�j{�Dm[��ݟIg�-��6�b��)ļ�����(�X�r��E7�3~L8�%�p���C���&��ɚ��畴��Q\z1�ƿP����
����0�����y�8H��Ja��`�4��̚�ibV[������Jl�Yŋ��#禎�����M�{D�n:'��M��ͥ���D| 1ʙW�r�퇇T������cr$9$;��M/R,�EM'�h�J�V�\�f�E|&Y��V�*�䱵3q����Sb|5�eS )b]��,+D�ڔ���ś�z���a%V�����);S8fj�{�d�j �~y�,���J��$f}x��`�ˣ��$zܐ�g&���i��~�U���i�p��F\c5vcp�<v�@��v�4��Pgo dyޗ�ϟ�0p�n������d���L=a�U1�k'Tz�����O�Ŵ�0����l��U����1��|�+�#���Oic)�<�[1��
4���u�[�	��N$gNiA8��ox.��-�ݟ8#/P�<g�ōB�S��S?�9WX�i��'Bε�3����*h�\�Ka[�G����o<�҅Z=C�S����j��~�Xs�*�Ϋ�����hZ�92��V!����W�b"��h�\9}�}M
�fc����P�2��\��<t.�$As�����(���rs�PI�1���N:���{H�ƙ��3�6�~���j\�G�I�5�A5�ʽ�zl�4%��=�v�)�v�>��b�:/���I��;��1l��)��.���7��0�3�y��.{o�����}3�eaé�E7��$?W�l�ai_&������Q�ǘ���]$lU4�\L$�i�H�Zw	�!����i��Ds��L��8E���B:�����I�q��<�p:�
�t���vݻcwۇ�<$?��m�4�ad���.�������pĸK         s  x���q@1Cϟb2�K/鿎<���`!$��QK�\MB����t=��R�Ԇ������\l�b�ב�b[?��'s�>���g��r�{�\�JWhO���Y��x���瞲��ߍČ���Vn3=�2��۟uHF]�A�����H*S��w%���!�}�ч��p����|�[�vIP��_�tg_�W�ޮv|ђ6n�p��YP��Jf�4��жmh+VYO�yf��k��׿ɹ퍯Lhq�hf-����1l����^�!%�]�-�9�����=m&*�8�]M�����2n��ǳ<?z6��R4gP:��@,��=��pt��Y��?�q)�.�hD�E�C4���̕l��6�����_mf?�vT?�^�"u^Ǔ% ��p"
��m���m���3G�89-"��A%SFI���`ӕ��'2��M	�2Y:.�&�;@�U��iD*�X�/_��o�2Y#2H�#��;�I�4�$)���Rb����ם��k&t��+ʑ�"Hf4}�7��N|O�TLE)�_�5� ���.|�Ep��M����P�Ha�x����6�ݔ�<J�������K�qM)���erVl�A%�����d�@H�	��/���)�?"�{�\     