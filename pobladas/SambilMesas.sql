PGDMP         +                w            SambilMesas    11.2    11.2     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    33122    SambilMesas    DATABASE     �   CREATE DATABASE "SambilMesas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "SambilMesas";
             postgres    false            �            1255    33123    validmesa()    FUNCTION     A  CREATE FUNCTION public.validmesa() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
cont INT4;
BEGIN

	cont := (SELECT COUNT(id) FROM  mesa WHERE (nmesa = new.nmesa) AND (new.fechaocupada < fechadesocupada) );
	
	IF (cont = 0) THEN
	   return new;
	END IF;
	
	IF (cont > 0) THEN
	   return null;
	END IF;

End;
$$;
 "   DROP FUNCTION public.validmesa();
       public       postgres    false            �            1259    33124    mesa    TABLE     �   CREATE TABLE public.mesa (
    id integer NOT NULL,
    nmesa integer NOT NULL,
    mac integer,
    fechaocupada timestamp without time zone NOT NULL,
    fechadesocupada timestamp without time zone NOT NULL
);
    DROP TABLE public.mesa;
       public         postgres    false            �            1259    33127    mesa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mesa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.mesa_id_seq;
       public       postgres    false    196                       0    0    mesa_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.mesa_id_seq OWNED BY public.mesa.id;
            public       postgres    false    197            ~
           2604    33129    mesa id    DEFAULT     b   ALTER TABLE ONLY public.mesa ALTER COLUMN id SET DEFAULT nextval('public.mesa_id_seq'::regclass);
 6   ALTER TABLE public.mesa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �
          0    33124    mesa 
   TABLE DATA               M   COPY public.mesa (id, nmesa, mac, fechaocupada, fechadesocupada) FROM stdin;
    public       postgres    false    196   �                  0    0    mesa_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.mesa_id_seq', 398, true);
            public       postgres    false    197            �
           2606    33131    mesa mesa_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.mesa
    ADD CONSTRAINT mesa_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.mesa DROP CONSTRAINT mesa_pkey;
       public         postgres    false    196            �
           2620    33132    mesa tr_validmesa    TRIGGER     l   CREATE TRIGGER tr_validmesa BEFORE INSERT ON public.mesa FOR EACH ROW EXECUTE PROCEDURE public.validmesa();
 *   DROP TRIGGER tr_validmesa ON public.mesa;
       public       postgres    false    196    198            �
   Z
  x�mY�u����"/�M��[�鿎h�w,��%�6-Q  j4�/���!���|���aW�[���=�R6ߚ����똏�K��u^f-�[�o��w�p�C�>��1��y�\�[�o�[��X
r �x������K�y�]:�d��{�զ����WKh�8������c	���5|�)R�ˏ���&>�-`Ԫ16Pó�v��Y:���c��k(jt�|��W㠢��Wzϑ���2�/��y��m+G�O���a#B�'�.�B�e0(h^�x�(y�k��|	F�1�B��~�VM��W�z�����tN5�B��:PT1���ב z� ��-2��� f��!Z�z�c{ݿ��X<��"G�QÑ���������X�1��!��P����J�@^n1m�ᫎ�!�[�oÙ�5u�:&ֱoB��]*Z��7\�э�񚯊�^�w;���i�r��ms���Pǖ�lK�/E��%�J���BBHjas�Hb�y�@�v���z����� �@jCզꓢ�H�J���1�a.�0��ꊎ��A��ДG�a�Ô&�@�U����>k3��ӎP��H�3I�8&*�N��� �g�s!+�d�Kw����������k�qt)K!���N�i4:(��TV�n�+g{�Bg�@9'���9�X3�Ɋ�5&��̒#D"Fo�'�1�r���/�oA��g�.z�M���5�o[�V�s�M���  ��.D,G9؋hf��ԙ�ay�ʑ@x�	)��� b{�#I����s�������V�湀TFg!Rz�[��6Ʃ�����ݵy�� ���}9���~��L�;�B��1�`w�K��Ŵ#HA��n������c���
��LK�j�B�� �=xC�<x���.s�M˹~#��E_/(�۷��k'hM\#��3���m4� ���nhbw	yfL�N�yL.E3@�G����yp�r�Ք#d��;xSo���6��/;�Fv(�"�7	��:�.�$�c����г:ԏN�r'��ø�Ӎ�u����w�[H�邵�ۙ@%���bU6��9���4$z��P��
�c�w[�%���
��|�V�a[���ړ�&lQP���h�
i�s'F��<b�H@�F�@��,��������"Mp`y�8St�O �9l���c�U�dh�rЄ��)o.o%<ؚU��	ފ��"|���
��G?�Ǆq+:��T �i�8���:�ޠ1�m~ց� i�@(��7�m �?�`�ؤ����
���Yi�5ì$���k�>%ox��
Z��DiC;6W�Co�!�"�
l)��lX>(K�%Uŏ�&vba�`�3(�N<t�;��07��v�؊,L��j�Q��ǹ�2����z��O(H+A̱�S�>@6����Y���B�=e�L�������H�ZB����ba���8S��'��j�4���F+@>�h)�>./���N�xr͂�@-P9B@
���єr�b?�ٷ;��Ä��!�HZN )�Q�58�A����3T�x��B���
X�+��ݲ�&MXֶ=z�X"7�p
��ǳ
����h+�~���H��L��8�xɶ��(  ��i���	5�����k��0�*�8B R�=@��뎶�Q��n�斅s0��"^.d䠭��H룚�fo��
����'2��a�F�T��_��Y/5���C�{�
 �k(�� Cx�^��˂%���@�	�GqXI��hJ[�k��#:�s��a��p]Н ��v}m��G�A��-
�uG�2�-?�cS?[���;�����Oi^yPK��"�Rp(J�מ�A~�{D�͑g��+C{�>c �:���"k���W��՚�7��7I�#� 3��Cr ��F�2��dL9B�]@��K�o�/������*�!`X�t������SB�a�Ɠ�V�k��&)v�,�y��I��+.[�"V��14�^&[> "�ȑdSxN0$��ՂB;=�����l�z�ÔvT��E�z�~�5Yؤ�?B(&2w���OjV���hn`v����^�q,��� �V6��A]7� �����K��B�mԷ��jj����
c�Zd��>b[�����?&ӿ!��c�h�)n{)�Ϭ�8�8B�����Q/?i*��\�h�a��n&�h�*�h�1�۲n&a KYG�&y���y_2��Z��=�6�<B��E?<T?/�s A�s+dD�
g��><�U��& ��-�� ����
�}��yd=H��YI�2��沋7� ��8�����Op��^��b�BX����>��g�< �W?��B���X��#�I
�a�����|�w~D�΃�$�ۓË�+�����F	���LbRD�6/'��|�Z;�ܗ1�$���c��U��. i������W�H?4�]�䠬����c�/V�V�`́���1�`<�G獇l"D�X�7�����?줬�b,a��=��_Жk,���>�!�Z���y���oKrZ�k'���dk���[�����t�9��
L���~�E�:k�!�� 3w��������%�     