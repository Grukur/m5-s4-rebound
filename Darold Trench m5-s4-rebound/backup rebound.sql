PGDMP     6    3                {            m5-s4-rebound    15.2    15.2     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    16918    m5-s4-rebound    DATABASE     �   CREATE DATABASE "m5-s4-rebound" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "m5-s4-rebound";
                postgres    false            �            1259    16924    clientes    TABLE       CREATE TABLE public.clientes (
    run character varying(10) NOT NULL,
    nombre character varying(120) NOT NULL,
    correo character varying(80) NOT NULL,
    direccion character varying(120) NOT NULL,
    telefono character varying(15) NOT NULL,
    alta character(1) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16919    empresas    TABLE       CREATE TABLE public.empresas (
    run character varying(10) NOT NULL,
    nombre character varying(120) NOT NULL,
    direccion character varying(120) NOT NULL,
    telefono character varying(15) NOT NULL,
    correo character varying(80) NOT NULL,
    web character varying(50)
);
    DROP TABLE public.empresas;
       public         heap    postgres    false            �            1259    16976    mantenciones    TABLE     �   CREATE TABLE public.mantenciones (
    id numeric(12,0) NOT NULL,
    fecha date DEFAULT now(),
    trabajaos_realizados character varying(1000),
    id_venta numeric(12,0) NOT NULL
);
     DROP TABLE public.mantenciones;
       public         heap    postgres    false            �            1259    16929    marcas    TABLE     j   CREATE TABLE public.marcas (
    id numeric(12,0) NOT NULL,
    nombre character varying(120) NOT NULL
);
    DROP TABLE public.marcas;
       public         heap    postgres    false            �            1259    16934    tipo_vehiculos    TABLE     r   CREATE TABLE public.tipo_vehiculos (
    id numeric(12,0) NOT NULL,
    nombre character varying(120) NOT NULL
);
 "   DROP TABLE public.tipo_vehiculos;
       public         heap    postgres    false            �            1259    16945 	   vehiculos    TABLE     �  CREATE TABLE public.vehiculos (
    id numeric(12,0) NOT NULL,
    patente character varying(10) NOT NULL,
    marca character varying(20) NOT NULL,
    modelo character varying(20) NOT NULL,
    color character varying(15) NOT NULL,
    precio numeric(12,2) NOT NULL,
    frecuencia_matencion numeric(5,0) NOT NULL,
    id_marca numeric(12,0) NOT NULL,
    id_tipovehiculo numeric(12,0) NOT NULL,
    stock numeric,
    estado boolean
);
    DROP TABLE public.vehiculos;
       public         heap    postgres    false            �            1259    16960    ventas    TABLE     �   CREATE TABLE public.ventas (
    folio numeric(12,0) NOT NULL,
    fecha date DEFAULT now(),
    monto numeric(12,2) NOT NULL,
    id_vehiculo numeric(12,0) NOT NULL,
    id_cliente character varying(10) NOT NULL
);
    DROP TABLE public.ventas;
       public         heap    postgres    false                       0    16924    clientes 
   TABLE DATA                 public          postgres    false    215   k"                 0    16919    empresas 
   TABLE DATA                 public          postgres    false    214   )#       %          0    16976    mantenciones 
   TABLE DATA                 public          postgres    false    220   �#       !          0    16929    marcas 
   TABLE DATA                 public          postgres    false    216   �#       "          0    16934    tipo_vehiculos 
   TABLE DATA                 public          postgres    false    217   S$       #          0    16945 	   vehiculos 
   TABLE DATA                 public          postgres    false    218   �$       $          0    16960    ventas 
   TABLE DATA                 public          postgres    false    219   �%       �           2606    16928    clientes clientes_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (run);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    215                       2606    16923    empresas empresas_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (run);
 @   ALTER TABLE ONLY public.empresas DROP CONSTRAINT empresas_pkey;
       public            postgres    false    214            �           2606    16983    mantenciones mantenciones_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.mantenciones
    ADD CONSTRAINT mantenciones_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.mantenciones DROP CONSTRAINT mantenciones_pkey;
       public            postgres    false    220            �           2606    16933    marcas marcas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.marcas DROP CONSTRAINT marcas_pkey;
       public            postgres    false    216            �           2606    16938 "   tipo_vehiculos tipo_vehiculos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_vehiculos
    ADD CONSTRAINT tipo_vehiculos_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_vehiculos DROP CONSTRAINT tipo_vehiculos_pkey;
       public            postgres    false    217            �           2606    16949    vehiculos vehiculos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_pkey;
       public            postgres    false    218            �           2606    16965    ventas ventas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (folio);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    219            �           2606    16984 '   mantenciones mantenciones_id_venta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenciones
    ADD CONSTRAINT mantenciones_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES public.ventas(folio);
 Q   ALTER TABLE ONLY public.mantenciones DROP CONSTRAINT mantenciones_id_venta_fkey;
       public          postgres    false    3209    219    220            �           2606    16950 !   vehiculos vehiculos_id_marca_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_id_marca_fkey FOREIGN KEY (id_marca) REFERENCES public.marcas(id);
 K   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_id_marca_fkey;
       public          postgres    false    218    3203    216            �           2606    16955 (   vehiculos vehiculos_id_tipovehiculo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_id_tipovehiculo_fkey FOREIGN KEY (id_tipovehiculo) REFERENCES public.tipo_vehiculos(id);
 R   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_id_tipovehiculo_fkey;
       public          postgres    false    3205    217    218            �           2606    16971    ventas ventas_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(run);
 G   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_id_cliente_fkey;
       public          postgres    false    219    215    3201            �           2606    16966    ventas ventas_id_vehiculo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_id_vehiculo_fkey FOREIGN KEY (id_vehiculo) REFERENCES public.vehiculos(id);
 H   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_id_vehiculo_fkey;
       public          postgres    false    218    3207    219                �   x���=�0�w~�m@R�-���H�`"�^�Ԕ�����.L����q�=]?���~��{��V�2��dn�,͓C��Cb����N>ɆQ/s�7�[;@��-�\��R�i�6�+�a����8�1<F���bi�|�t"+�2���ѕ&t�b�֓��O�|u�ʗ$_�[\�         �   x�M�A�@໿bn*l��etɃ!Һ��ƺ#��?/����TuS>[����ک#'C��!0��y�	�C�o���k�lmi��]�_e��d�R_�_(9R/]E��w����%N�iv:�n�<�Y�&���Skm�'���G8      %   
   x���          !   U   x���v
Q���W((M��L��M,JN,V��L�Q���M*J�Ts�	uV�0�QPɯ�/IT״��$M�PspiUiv&H3 X
%      "   Z   x���v
Q���W((M��L�+�,ȏ/K��L.��/V��L�Q���M*J�Ts�	uV�02�QP/NMI�S״��$�C�!��a #�� �*O      #   -  x���Ok�0�{?�{�B��`��C���:a'�i�2cR�d0?����ܽ��<mI�4�r5��P-�/����|�%>$��t0���9�� pd�3�ep����Vp��{L/4�l{3�& ���4lN��8��~  :�3����u��M(�x6+KJcl+��T9r����yL��@Fh(^�z1~����#���i�Ĕ�g�5�!�CfH(qЬ�H�,�����0�	���g��0GC]�0���6��ʡ�Z���fz�H/�Aobq�ĢO|c��Rz�1�~ �p\�      $   �   x���v
Q���W((M��L�+K�+I,V�H�����QHKM�H�Q���+�2S��R32�Ks ��L��TM�0G�P�`Cu##c]S]CCuSS�30�Q04 IICC###]SuMk.Oj�����.0�������� �.H     