PGDMP         /                w            SambilMesas    11.2    11.2     �
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
    public       postgres    false    196   �                  0    0    mesa_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.mesa_id_seq', 1, false);
            public       postgres    false    197            �
           2606    33131    mesa mesa_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.mesa
    ADD CONSTRAINT mesa_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.mesa DROP CONSTRAINT mesa_pkey;
       public         postgres    false    196            �
           2620    33132    mesa tr_validmesa    TRIGGER     l   CREATE TRIGGER tr_validmesa BEFORE INSERT ON public.mesa FOR EACH ROW EXECUTE PROCEDURE public.validmesa();
 *   DROP TRIGGER tr_validmesa ON public.mesa;
       public       postgres    false    196    198            �
      x������ � �     