PGDMP     -    1                z            livraria    14.2    14.2 3    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    32768    livraria    DATABASE     h   CREATE DATABASE livraria WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE livraria;
                postgres    false            �            1259    32769    autor    TABLE     �   CREATE TABLE public.autor (
    cod_autor integer NOT NULL,
    nome_autor character varying(25) NOT NULL,
    sobrenome_autor character varying(25) NOT NULL
);
    DROP TABLE public.autor;
       public         heap    postgres    false            �            1259    32772    autor_cod_autor_seq    SEQUENCE     �   CREATE SEQUENCE public.autor_cod_autor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.autor_cod_autor_seq;
       public          postgres    false    209            .           0    0    autor_cod_autor_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.autor_cod_autor_seq OWNED BY public.autor.cod_autor;
          public          postgres    false    210            �            1259    32773    cliente    TABLE        CREATE TABLE public.cliente (
    cpf_cliente character varying(11) NOT NULL,
    nome_cliente character varying(25) NOT NULL,
    sobrenome_cliente character varying(25) NOT NULL,
    telefone_cliente character varying(9) NOT NULL,
    endereco_cliente character varying(50) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    32776    compra    TABLE     �   CREATE TABLE public.compra (
    cod_compra integer NOT NULL,
    cpf_cliente character varying(11) NOT NULL,
    cod_livro integer NOT NULL,
    data_compra date NOT NULL
);
    DROP TABLE public.compra;
       public         heap    postgres    false            �            1259    32779    compra_cod_compra_seq    SEQUENCE     �   CREATE SEQUENCE public.compra_cod_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.compra_cod_compra_seq;
       public          postgres    false    212            /           0    0    compra_cod_compra_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.compra_cod_compra_seq OWNED BY public.compra.cod_compra;
          public          postgres    false    213            �            1259    32780    editora    TABLE     s   CREATE TABLE public.editora (
    cod_editora integer NOT NULL,
    nome_editora character varying(25) NOT NULL
);
    DROP TABLE public.editora;
       public         heap    postgres    false            �            1259    32783    editora_cod_editora_seq    SEQUENCE     �   CREATE SEQUENCE public.editora_cod_editora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.editora_cod_editora_seq;
       public          postgres    false    214            0           0    0    editora_cod_editora_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.editora_cod_editora_seq OWNED BY public.editora.cod_editora;
          public          postgres    false    215            �            1259    32784    genero    TABLE     p   CREATE TABLE public.genero (
    cod_genero integer NOT NULL,
    nome_genero character varying(25) NOT NULL
);
    DROP TABLE public.genero;
       public         heap    postgres    false            �            1259    32787    genero_cod_genero_seq    SEQUENCE     �   CREATE SEQUENCE public.genero_cod_genero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.genero_cod_genero_seq;
       public          postgres    false    216            1           0    0    genero_cod_genero_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.genero_cod_genero_seq OWNED BY public.genero.cod_genero;
          public          postgres    false    217            �            1259    32788    livro    TABLE     t  CREATE TABLE public.livro (
    cod_livro integer NOT NULL,
    cod_editora integer NOT NULL,
    cod_genero integer NOT NULL,
    cod_autor integer NOT NULL,
    nome_livro character varying(25) NOT NULL,
    qtd_exemplar integer NOT NULL,
    preco_livro double precision NOT NULL,
    CONSTRAINT livro_preco_livro_check CHECK ((preco_livro > (0)::double precision))
);
    DROP TABLE public.livro;
       public         heap    postgres    false            �            1259    32792    livro_cod_livro_seq    SEQUENCE     �   CREATE SEQUENCE public.livro_cod_livro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.livro_cod_livro_seq;
       public          postgres    false    218            2           0    0    livro_cod_livro_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.livro_cod_livro_seq OWNED BY public.livro.cod_livro;
          public          postgres    false    219            �            1259    32793    recomendacao    TABLE     u   CREATE TABLE public.recomendacao (
    cpf_cliente character varying(11) NOT NULL,
    cod_livro integer NOT NULL
);
     DROP TABLE public.recomendacao;
       public         heap    postgres    false            x           2604    32796    autor cod_autor    DEFAULT     r   ALTER TABLE ONLY public.autor ALTER COLUMN cod_autor SET DEFAULT nextval('public.autor_cod_autor_seq'::regclass);
 >   ALTER TABLE public.autor ALTER COLUMN cod_autor DROP DEFAULT;
       public          postgres    false    210    209            y           2604    32797    compra cod_compra    DEFAULT     v   ALTER TABLE ONLY public.compra ALTER COLUMN cod_compra SET DEFAULT nextval('public.compra_cod_compra_seq'::regclass);
 @   ALTER TABLE public.compra ALTER COLUMN cod_compra DROP DEFAULT;
       public          postgres    false    213    212            z           2604    32798    editora cod_editora    DEFAULT     z   ALTER TABLE ONLY public.editora ALTER COLUMN cod_editora SET DEFAULT nextval('public.editora_cod_editora_seq'::regclass);
 B   ALTER TABLE public.editora ALTER COLUMN cod_editora DROP DEFAULT;
       public          postgres    false    215    214            {           2604    32799    genero cod_genero    DEFAULT     v   ALTER TABLE ONLY public.genero ALTER COLUMN cod_genero SET DEFAULT nextval('public.genero_cod_genero_seq'::regclass);
 @   ALTER TABLE public.genero ALTER COLUMN cod_genero DROP DEFAULT;
       public          postgres    false    217    216            |           2604    32800    livro cod_livro    DEFAULT     r   ALTER TABLE ONLY public.livro ALTER COLUMN cod_livro SET DEFAULT nextval('public.livro_cod_livro_seq'::regclass);
 >   ALTER TABLE public.livro ALTER COLUMN cod_livro DROP DEFAULT;
       public          postgres    false    219    218                      0    32769    autor 
   TABLE DATA           G   COPY public.autor (cod_autor, nome_autor, sobrenome_autor) FROM stdin;
    public          postgres    false    209   �:                 0    32773    cliente 
   TABLE DATA           s   COPY public.cliente (cpf_cliente, nome_cliente, sobrenome_cliente, telefone_cliente, endereco_cliente) FROM stdin;
    public          postgres    false    211   Y;                 0    32776    compra 
   TABLE DATA           Q   COPY public.compra (cod_compra, cpf_cliente, cod_livro, data_compra) FROM stdin;
    public          postgres    false    212   �;       !          0    32780    editora 
   TABLE DATA           <   COPY public.editora (cod_editora, nome_editora) FROM stdin;
    public          postgres    false    214   <       #          0    32784    genero 
   TABLE DATA           9   COPY public.genero (cod_genero, nome_genero) FROM stdin;
    public          postgres    false    216   �<       %          0    32788    livro 
   TABLE DATA           u   COPY public.livro (cod_livro, cod_editora, cod_genero, cod_autor, nome_livro, qtd_exemplar, preco_livro) FROM stdin;
    public          postgres    false    218   =       '          0    32793    recomendacao 
   TABLE DATA           >   COPY public.recomendacao (cpf_cliente, cod_livro) FROM stdin;
    public          postgres    false    220   �=       3           0    0    autor_cod_autor_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.autor_cod_autor_seq', 81, true);
          public          postgres    false    210            4           0    0    compra_cod_compra_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.compra_cod_compra_seq', 15, true);
          public          postgres    false    213            5           0    0    editora_cod_editora_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.editora_cod_editora_seq', 52, true);
          public          postgres    false    215            6           0    0    genero_cod_genero_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.genero_cod_genero_seq', 75, true);
          public          postgres    false    217            7           0    0    livro_cod_livro_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.livro_cod_livro_seq', 18, true);
          public          postgres    false    219                       2606    32802    autor autor_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (cod_autor);
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    209            �           2606    32804    cliente cliente_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cpf_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    211            �           2606    32806    compra compra_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (cod_compra);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public            postgres    false    212            �           2606    32808    editora editora_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.editora
    ADD CONSTRAINT editora_pkey PRIMARY KEY (cod_editora);
 >   ALTER TABLE ONLY public.editora DROP CONSTRAINT editora_pkey;
       public            postgres    false    214            �           2606    32810    genero genero_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (cod_genero);
 <   ALTER TABLE ONLY public.genero DROP CONSTRAINT genero_pkey;
       public            postgres    false    216            �           2606    32812    livro livro_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY (cod_livro);
 :   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_pkey;
       public            postgres    false    218            �           2606    32813    compra compra_cod_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_cod_livro_fkey FOREIGN KEY (cod_livro) REFERENCES public.livro(cod_livro);
 F   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_cod_livro_fkey;
       public          postgres    false    212    3209    218            �           2606    32818    compra compra_cpf_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_cpf_cliente_fkey FOREIGN KEY (cpf_cliente) REFERENCES public.cliente(cpf_cliente);
 H   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_cpf_cliente_fkey;
       public          postgres    false    212    3201    211            �           2606    32823    livro livro_cod_autor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_cod_autor_fkey FOREIGN KEY (cod_autor) REFERENCES public.autor(cod_autor);
 D   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_cod_autor_fkey;
       public          postgres    false    218    209    3199            �           2606    32828    livro livro_cod_editora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_cod_editora_fkey FOREIGN KEY (cod_editora) REFERENCES public.editora(cod_editora);
 F   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_cod_editora_fkey;
       public          postgres    false    3205    214    218            �           2606    32833    livro livro_cod_genero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_cod_genero_fkey FOREIGN KEY (cod_genero) REFERENCES public.genero(cod_genero);
 E   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_cod_genero_fkey;
       public          postgres    false    216    218    3207            �           2606    32838 (   recomendacao recomendacao_cod_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendacao
    ADD CONSTRAINT recomendacao_cod_livro_fkey FOREIGN KEY (cod_livro) REFERENCES public.livro(cod_livro);
 R   ALTER TABLE ONLY public.recomendacao DROP CONSTRAINT recomendacao_cod_livro_fkey;
       public          postgres    false    220    3209    218            �           2606    32843 *   recomendacao recomendacao_cpf_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendacao
    ADD CONSTRAINT recomendacao_cpf_cliente_fkey FOREIGN KEY (cpf_cliente) REFERENCES public.cliente(cpf_cliente);
 T   ALTER TABLE ONLY public.recomendacao DROP CONSTRAINT recomendacao_cpf_cliente_fkey;
       public          postgres    false    3201    220    211               �   x���
�0������	�Q0q�](�"Tp�f�����z��7
�����
��$��W}����bftq�"�5��`3r����8>t(uph�I&�Ĳ�r���냽%%�4լ�-G&�{ʩ��ɇB��&9
Z��\��N,�         c   x�3426153��44�*����)K䴴0735162�t,SpN,.I��Wp*J�K��214341753�0�t�K�t��M-�4����U�X��Y������ W�         >   x�}ɱ�0���"�]��N��i�ibQ��3�a��k0��	���z>tco�?�^ ��      !   �   x�-�=
�@F�S�	�M�_)@,S�͐��gd6�},-<E.����}�簥��܉k�};�[�m$�_�Y���5�!�	/a�KCO�Nѯਃ�R��@6�un��j�<��^@���!�ep��9T����+�Kg�W"'�:A�0�55      #   J   x�37�t�L>����|��Լ��k�2��̍��\榜���%�We�sq��&�%�r��pz�p��qqq �E      %   �   x����0�{U��w�q�D�.�X�$"EĲ��(�ư����xAL���sK`�f�GD�a�\4���;b ��O`��"攏�G����Zt�+\4�أ�'��rhG�����k�7�'=�z�lk�����=� f�&.      '      x������ � �     