PGDMP     0    7                z         	   StudyApp2    10.19    10.19 %    !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            $           1262    24788 	   StudyApp2    DATABASE     �   CREATE DATABASE "StudyApp2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "StudyApp2";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            %           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            &           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24789    classes    TABLE     [   CREATE TABLE public.classes (
    classid integer NOT NULL,
    classname text NOT NULL
);
    DROP TABLE public.classes;
       public         postgres    false    3            �            1259    32844    classes_classid_seq    SEQUENCE     �   ALTER TABLE public.classes ALTER COLUMN classid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.classes_classid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1
);
            public       postgres    false    3    196            �            1259    24827    lessons    TABLE     u   CREATE TABLE public.lessons (
    lssnid integer NOT NULL,
    lssnname text NOT NULL,
    subid integer NOT NULL
);
    DROP TABLE public.lessons;
       public         postgres    false    3            �            1259    32870    lessons_lssnid_seq    SEQUENCE     �   ALTER TABLE public.lessons ALTER COLUMN lssnid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lessons_lssnid_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1
);
            public       postgres    false    3    199            �            1259    24835    quiz    TABLE     �   CREATE TABLE public.quiz (
    quizid integer NOT NULL,
    question text,
    optiona text,
    optionb text,
    optionc text,
    optiond text,
    answer text,
    lssnid integer
);
    DROP TABLE public.quiz;
       public         postgres    false    3            �            1259    32868    quiz_quizid_seq    SEQUENCE     �   ALTER TABLE public.quiz ALTER COLUMN quizid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.quiz_quizid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1
);
            public       postgres    false    200    3            �            1259    24803    subjects    TABLE     �   CREATE TABLE public.subjects (
    subid integer NOT NULL,
    subname text NOT NULL,
    classid integer NOT NULL,
    filepath text
);
    DROP TABLE public.subjects;
       public         postgres    false    3            �            1259    32872    subjects_subid_seq    SEQUENCE     �   ALTER TABLE public.subjects ALTER COLUMN subid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.subjects_subid_seq
    START WITH 9
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1
);
            public       postgres    false    3    198            �            1259    24795    users    TABLE     O  CREATE TABLE public.users (
    userid integer NOT NULL,
    username text NOT NULL,
    email text,
    userpswd text NOT NULL,
    progress integer DEFAULT 0 NOT NULL,
    classid integer,
    subid integer,
    lssnprogress boolean DEFAULT false,
    subprogress boolean DEFAULT false,
    time_taken timestamp without time zone
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    32874    users_userid_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN userid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100000
    CACHE 1
);
            public       postgres    false    197    3                      0    24789    classes 
   TABLE DATA               5   COPY public.classes (classid, classname) FROM stdin;
    public       postgres    false    196   �&                 0    24827    lessons 
   TABLE DATA               :   COPY public.lessons (lssnid, lssnname, subid) FROM stdin;
    public       postgres    false    199   #'                 0    24835    quiz 
   TABLE DATA               d   COPY public.quiz (quizid, question, optiona, optionb, optionc, optiond, answer, lssnid) FROM stdin;
    public       postgres    false    200   �'                 0    24803    subjects 
   TABLE DATA               E   COPY public.subjects (subid, subname, classid, filepath) FROM stdin;
    public       postgres    false    198   �-                 0    24795    users 
   TABLE DATA               �   COPY public.users (userid, username, email, userpswd, progress, classid, subid, lssnprogress, subprogress, time_taken) FROM stdin;
    public       postgres    false    197   .       '           0    0    classes_classid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.classes_classid_seq', 1, false);
            public       postgres    false    201            (           0    0    lessons_lssnid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.lessons_lssnid_seq', 4, true);
            public       postgres    false    203            )           0    0    quiz_quizid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.quiz_quizid_seq', 35, true);
            public       postgres    false    202            *           0    0    subjects_subid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.subjects_subid_seq', 9, true);
            public       postgres    false    204            +           0    0    users_userid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_userid_seq', 1, false);
            public       postgres    false    205            �
           2606    32847    classes classes_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (classid);
 >   ALTER TABLE ONLY public.classes DROP CONSTRAINT classes_pkey;
       public         postgres    false    196            �
           2606    24834    lessons lessons_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (lssnid);
 >   ALTER TABLE ONLY public.lessons DROP CONSTRAINT lessons_pkey;
       public         postgres    false    199            �
           2606    24842    quiz quiz_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (quizid);
 8   ALTER TABLE ONLY public.quiz DROP CONSTRAINT quiz_pkey;
       public         postgres    false    200            �
           2606    24810    subjects subjects_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (subid);
 @   ALTER TABLE ONLY public.subjects DROP CONSTRAINT subjects_pkey;
       public         postgres    false    198            �
           2606    24802    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    197            �
           2606    32848    subjects constraint_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT constraint_fk FOREIGN KEY (classid) REFERENCES public.classes(classid);
 @   ALTER TABLE ONLY public.subjects DROP CONSTRAINT constraint_fk;
       public       postgres    false    198    2703    196            �
           2606    32853    lessons constraint_fk    FK CONSTRAINT     x   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT constraint_fk FOREIGN KEY (subid) REFERENCES public.subjects(subid);
 ?   ALTER TABLE ONLY public.lessons DROP CONSTRAINT constraint_fk;
       public       postgres    false    198    2707    199            �
           2606    32858    users constraint_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT constraint_fk FOREIGN KEY (classid) REFERENCES public.classes(classid);
 =   ALTER TABLE ONLY public.users DROP CONSTRAINT constraint_fk;
       public       postgres    false    197    2703    196            �
           2606    32863    users fk    FK CONSTRAINT     k   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk FOREIGN KEY (subid) REFERENCES public.subjects(subid);
 2   ALTER TABLE ONLY public.users DROP CONSTRAINT fk;
       public       postgres    false    2707    198    197                  x�3�44(������� �*         Z   x�-�I
�0��urA�ƻ%�A������o>$(��r5�����l�'��A*�����]f`����Z,�p�]7^��뀈7�N#2         �  x��VMs�6=����S��83���I*�zⴹ��+( h��5�-�e}�˱3iɤ����oߢ��p�d5x�m+��J�'�#٫�R�C/��*g��6�,5����w�u줒A�F�Ԋ��N�VK��d�5~�j���V�o�w��¨{�� ���Ʌw�#>���V�*�����!���:e1W�T���VFzRu԰�(���֬���Z�Z7�q��O�;�<C����4"�<�z�#������I�⹘��wysv*.��
;�,}�$nr�e1o�<Vګ|��l�,��u'[3�.�lC�uH&����!�s��M�[�����:��&c�/+׌ �j�,��O�{J.5����s���6)��6���-��+C���n��}]�ũ�x�`�κ��o��%�
�gh���5�BT^d�n��d��dF��ł<^9�$j�N1*��D��l��K����f��ՄĒ��������{e[�9�&���Oh�B1��*�ȸ#�������!��R[l���MH�~��>��ř���K\E��*e��H����|��uX��N_'�͜�ow���Y漆����݇�
{t�,�2u�u����ds��TFX�􎵆z�H%���xM��ڸ��z��I�ɠ�w����� C_e5��$ᷩ���<gd쓄�~3l��3�L��\���#gT>幘��I��=��w,^��>X\���02�\�'��Nx�NS����ѷn�\ï�.��xp��'d�E~!ij�,�$Ba5�x
�k�� s`Zt�F� ΁�v��]ML�c��C�[��Һ5@G�:ؓ��Q��4S��6��H�C�OŻN�αP@#sKU.n��o�E���S��Q��x�o�b��� [e�.��	��sMj*��.���P��e�!�g��-�&k��޿b�������������㙴�O`����|2���_��1=�"q�!�G�?be�4�[��g�+��p��67���S���� �\&�*��35���|f�x��>��9��%�9Og�L��7�P�#��R�P���}��	²��r�~�?֝��i0
�1���U�Dy��̀�+tz�+�ڭ���i�֝c��ʎ-�9wΆ��/�m�����)��A��R�="��`OABaN��q~"�IzB�� z;�1�,-�'5��S��oY���޴ ��a4z����N���:b����xVL~�[��uV�B�:����F�������i�ߤC��)�ǛS�βJ5|�B�6���@sҊ���4xZ^ЖҼZ��S��"�-?�J���w��MW{B��|0麠7"�_A%�(��>��.f��~��9.J��6+m��YNC��/m`O��5γ��5���f}����'I��"5���"�rZ^)��+s��Y��rLFC�������t�\�-��G�7y'��7��R�~�]�p���D��b:��R�O�"�������Q��x\�?E��         f   x�=�[
� D����n���ڍ���'h��3�H��z��*Zu;��t̪�N�پ{��S��"�D��k�^�tEL��ԷF����i+n���3)�            x������ � �     