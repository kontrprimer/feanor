PGDMP     2                    |           postgres    14.12 (Homebrew)    14.12 (Homebrew)     X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            [           1262    14088    postgres    DATABASE     S   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE postgres;
                yuliyastasyuk    false            \           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   yuliyastasyuk    false    3675                        2615    16384    indoor_plants    SCHEMA        CREATE SCHEMA indoor_plants;
    DROP SCHEMA indoor_plants;
                yuliyastasyuk    false            �            1259    16393 
   dict_light    TABLE     �   CREATE TABLE indoor_plants.dict_light (
    id_light integer NOT NULL,
    light character varying(50),
    description character varying(100)
);
 %   DROP TABLE indoor_plants.dict_light;
       indoor_plants         heap    yuliyastasyuk    false    5            �            1259    16392    dict_light_id_light_seq    SEQUENCE     �   CREATE SEQUENCE indoor_plants.dict_light_id_light_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE indoor_plants.dict_light_id_light_seq;
       indoor_plants          yuliyastasyuk    false    211    5            ]           0    0    dict_light_id_light_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE indoor_plants.dict_light_id_light_seq OWNED BY indoor_plants.dict_light.id_light;
          indoor_plants          yuliyastasyuk    false    210            �            1259    16400    events    TABLE     �   CREATE TABLE indoor_plants.events (
    id_event integer NOT NULL,
    id_event_type integer,
    event_date timestamp without time zone,
    id_plant integer
);
 !   DROP TABLE indoor_plants.events;
       indoor_plants         heap    yuliyastasyuk    false    5            �            1259    16399    events_id_event_seq    SEQUENCE     �   CREATE SEQUENCE indoor_plants.events_id_event_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE indoor_plants.events_id_event_seq;
       indoor_plants          yuliyastasyuk    false    213    5            ^           0    0    events_id_event_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE indoor_plants.events_id_event_seq OWNED BY indoor_plants.events.id_event;
          indoor_plants          yuliyastasyuk    false    212            �            1259    16407    plant_types    TABLE     �   CREATE TABLE indoor_plants.plant_types (
    id_plant_type integer NOT NULL,
    plant_type character varying(100) NOT NULL,
    id_light integer,
    temp_min integer,
    temp_max integer
);
 &   DROP TABLE indoor_plants.plant_types;
       indoor_plants         heap    yuliyastasyuk    false    5            �            1259    16406    plant_types_id_seq    SEQUENCE     �   CREATE SEQUENCE indoor_plants.plant_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE indoor_plants.plant_types_id_seq;
       indoor_plants          yuliyastasyuk    false    5    215            _           0    0    plant_types_id_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE indoor_plants.plant_types_id_seq OWNED BY indoor_plants.plant_types.id_plant_type;
          indoor_plants          yuliyastasyuk    false    214            �            1259    16413    plant_waterings    TABLE     �   CREATE TABLE indoor_plants.plant_waterings (
    id_plant_type integer NOT NULL,
    water_spring_d integer NOT NULL,
    water_summer_d integer NOT NULL,
    water_fall_d integer NOT NULL,
    water_winter_d integer NOT NULL
);
 *   DROP TABLE indoor_plants.plant_waterings;
       indoor_plants         heap    yuliyastasyuk    false    5            �           2604    16396    dict_light id_light    DEFAULT     �   ALTER TABLE ONLY indoor_plants.dict_light ALTER COLUMN id_light SET DEFAULT nextval('indoor_plants.dict_light_id_light_seq'::regclass);
 I   ALTER TABLE indoor_plants.dict_light ALTER COLUMN id_light DROP DEFAULT;
       indoor_plants          yuliyastasyuk    false    211    210    211            �           2604    16403    events id_event    DEFAULT     �   ALTER TABLE ONLY indoor_plants.events ALTER COLUMN id_event SET DEFAULT nextval('indoor_plants.events_id_event_seq'::regclass);
 E   ALTER TABLE indoor_plants.events ALTER COLUMN id_event DROP DEFAULT;
       indoor_plants          yuliyastasyuk    false    213    212    213            �           2604    16410    plant_types id_plant_type    DEFAULT     �   ALTER TABLE ONLY indoor_plants.plant_types ALTER COLUMN id_plant_type SET DEFAULT nextval('indoor_plants.plant_types_id_seq'::regclass);
 O   ALTER TABLE indoor_plants.plant_types ALTER COLUMN id_plant_type DROP DEFAULT;
       indoor_plants          yuliyastasyuk    false    215    214    215            P          0    16393 
   dict_light 
   TABLE DATA           I   COPY indoor_plants.dict_light (id_light, light, description) FROM stdin;
    indoor_plants          yuliyastasyuk    false    211   �"       R          0    16400    events 
   TABLE DATA           V   COPY indoor_plants.events (id_event, id_event_type, event_date, id_plant) FROM stdin;
    indoor_plants          yuliyastasyuk    false    213   $       T          0    16407    plant_types 
   TABLE DATA           e   COPY indoor_plants.plant_types (id_plant_type, plant_type, id_light, temp_min, temp_max) FROM stdin;
    indoor_plants          yuliyastasyuk    false    215   "$       U          0    16413    plant_waterings 
   TABLE DATA           }   COPY indoor_plants.plant_waterings (id_plant_type, water_spring_d, water_summer_d, water_fall_d, water_winter_d) FROM stdin;
    indoor_plants          yuliyastasyuk    false    216   �%       `           0    0    dict_light_id_light_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('indoor_plants.dict_light_id_light_seq', 7, true);
          indoor_plants          yuliyastasyuk    false    210            a           0    0    events_id_event_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('indoor_plants.events_id_event_seq', 1, false);
          indoor_plants          yuliyastasyuk    false    212            b           0    0    plant_types_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('indoor_plants.plant_types_id_seq', 28, true);
          indoor_plants          yuliyastasyuk    false    214            �           2606    16398    dict_light dict_light_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY indoor_plants.dict_light
    ADD CONSTRAINT dict_light_pkey PRIMARY KEY (id_light);
 K   ALTER TABLE ONLY indoor_plants.dict_light DROP CONSTRAINT dict_light_pkey;
       indoor_plants            yuliyastasyuk    false    211            �           2606    16405    events events_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY indoor_plants.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id_event);
 C   ALTER TABLE ONLY indoor_plants.events DROP CONSTRAINT events_pkey;
       indoor_plants            yuliyastasyuk    false    213            �           2606    16412    plant_types plant_types_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY indoor_plants.plant_types
    ADD CONSTRAINT plant_types_pkey PRIMARY KEY (id_plant_type);
 M   ALTER TABLE ONLY indoor_plants.plant_types DROP CONSTRAINT plant_types_pkey;
       indoor_plants            yuliyastasyuk    false    215            �           2606    16417 $   plant_waterings plant_waterings_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY indoor_plants.plant_waterings
    ADD CONSTRAINT plant_waterings_pkey PRIMARY KEY (id_plant_type);
 U   ALTER TABLE ONLY indoor_plants.plant_waterings DROP CONSTRAINT plant_waterings_pkey;
       indoor_plants            yuliyastasyuk    false    216            P   *  x�]��j�0E��W�B��uK)fV�����J�ⱃ,O��Wi��L�u9W�1����u���(3V��&��'d�O�38�n���yṣ���"��E &��X��H'�ѱʍ*���ޙ7
���3�n����s*]Maq3(]��k{o��W�}�J-��J9;$�*p����t�`��٥q��HGu����J��;\��;�H����>��9������E�yү��]�*�J��A2#�z��~2�,�RC���F����N4�&�87f�V�Y�������^ѫ�Wm��Jֺ�      R      x������ � �      T   �  x�]Q�n�@<S_���Z�����0ں5Ç�Zb��W��>�*__���&י!93�����A�,�lkmI��,@Iv��!��h�]��	Ǩ�T(�}t�&�%t!9�.ީ~��)�� �O��u&v"�b��+��?*����1P#*g�57n	��2g��0�yRr
�xº���ܿ������%l퀢Bg�G��'ۡ;�〳*�}��m�4�����V����	��uܺ+�ޚ8D����d�m��k�-h�xBz�Z�\�
��A�<A��r�2���ܔP�N�С�hu��ʽ�V���!��ب:zq`G�2�����9[�@Z�PzSH	O�jhj}�(쀗y����V_P|�3�-a����B(&ej-�����Q|~9�+xБDբ���ꋟ�%��,�಄G뉿;ܰ��$���+      U   a   x�M��	�0��a�������s�
��.p��P��9�來���y�zjy�³�*�w�w�g�q�pg@�u!P(�pG�7s����2�/�-f     