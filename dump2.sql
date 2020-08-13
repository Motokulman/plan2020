PGDMP     2    ;                x         	   postgres2    12.0    12.0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    30427 	   postgres2    DATABASE     �   CREATE DATABASE postgres2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE postgres2;
                postgres    false                       1259    31058    account_profile    TABLE     �   CREATE TABLE public.account_profile (
    id integer NOT NULL,
    photo character varying(100) NOT NULL,
    user_id integer NOT NULL,
    city_id integer
);
 #   DROP TABLE public.account_profile;
       public         heap    postgres    false                       1259    31056    account_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.account_profile_id_seq;
       public          postgres    false    274            �           0    0    account_profile_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.account_profile_id_seq OWNED BY public.account_profile.id;
          public          postgres    false    273            �            1259    30459 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    30457    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    30469    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    30467    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    30451    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    30449    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    30477 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    30487    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    30485    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    30475    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    30495    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    30493 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    30588    brands_brand    TABLE     h   CREATE TABLE public.brands_brand (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
     DROP TABLE public.brands_brand;
       public         heap    postgres    false            �            1259    30586    brands_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.brands_brand_id_seq;
       public          postgres    false    221                        0    0    brands_brand_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.brands_brand_id_seq OWNED BY public.brands_brand.id;
          public          postgres    false    220            �            1259    30598    brands_subbrand_1    TABLE     �   CREATE TABLE public.brands_subbrand_1 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    brand_id integer
);
 %   DROP TABLE public.brands_subbrand_1;
       public         heap    postgres    false            �            1259    30596    brands_subbrand_1_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_subbrand_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.brands_subbrand_1_id_seq;
       public          postgres    false    223                       0    0    brands_subbrand_1_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.brands_subbrand_1_id_seq OWNED BY public.brands_subbrand_1.id;
          public          postgres    false    222            �            1259    30608    brands_subbrand_2    TABLE     �   CREATE TABLE public.brands_subbrand_2 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    sub_brand_1_id integer NOT NULL
);
 %   DROP TABLE public.brands_subbrand_2;
       public         heap    postgres    false            �            1259    30606    brands_subbrand_2_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_subbrand_2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.brands_subbrand_2_id_seq;
       public          postgres    false    225                       0    0    brands_subbrand_2_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.brands_subbrand_2_id_seq OWNED BY public.brands_subbrand_2.id;
          public          postgres    false    224            �            1259    30677    catalog_algorithm    TABLE     �   CREATE TABLE public.catalog_algorithm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 %   DROP TABLE public.catalog_algorithm;
       public         heap    postgres    false            �            1259    30675    catalog_algorithm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_algorithm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.catalog_algorithm_id_seq;
       public          postgres    false    233                       0    0    catalog_algorithm_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.catalog_algorithm_id_seq OWNED BY public.catalog_algorithm.id;
          public          postgres    false    232            *           1259    31373    catalog_facadematerialtype    TABLE     �   CREATE TABLE public.catalog_facadematerialtype (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    identifier character varying(20) NOT NULL
);
 .   DROP TABLE public.catalog_facadematerialtype;
       public         heap    postgres    false            )           1259    31371 !   catalog_facadematerialtype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_facadematerialtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.catalog_facadematerialtype_id_seq;
       public          postgres    false    298                       0    0 !   catalog_facadematerialtype_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.catalog_facadematerialtype_id_seq OWNED BY public.catalog_facadematerialtype.id;
          public          postgres    false    297            �            1259    30697    catalog_plan    TABLE     �   CREATE TABLE public.catalog_plan (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    scheme jsonb,
    checked boolean NOT NULL,
    author_id integer
);
     DROP TABLE public.catalog_plan;
       public         heap    postgres    false            �            1259    30695    catalog_plan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.catalog_plan_id_seq;
       public          postgres    false    235                       0    0    catalog_plan_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_plan_id_seq OWNED BY public.catalog_plan.id;
          public          postgres    false    234            ,           1259    31383    catalog_shell    TABLE     �  CREATE TABLE public.catalog_shell (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    roof_material_id integer NOT NULL,
    soffit_style character varying(20) NOT NULL,
    wall_material_0_id integer NOT NULL,
    socle_material_id integer NOT NULL,
    author_id integer,
    roof_material_type_id integer,
    socle_material_type_id integer,
    wall_material_type_0_id integer
);
 !   DROP TABLE public.catalog_shell;
       public         heap    postgres    false            +           1259    31381    catalog_shell_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_shell_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_shell_id_seq;
       public          postgres    false    300                       0    0    catalog_shell_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_shell_id_seq OWNED BY public.catalog_shell.id;
          public          postgres    false    299            �            1259    30555    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    30553    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    219                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    218            �            1259    30441    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    30439    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    30430    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    30428    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            	           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202                       1259    31031    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    30655    geography_city    TABLE     �   CREATE TABLE public.geography_city (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    heating_period_duration integer,
    heating_period_temperature double precision,
    region_id integer
);
 "   DROP TABLE public.geography_city;
       public         heap    postgres    false            �            1259    30653    geography_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.geography_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.geography_city_id_seq;
       public          postgres    false    231            
           0    0    geography_city_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.geography_city_id_seq OWNED BY public.geography_city.id;
          public          postgres    false    230            �            1259    30633    geography_country    TABLE     d   CREATE TABLE public.geography_country (
    id integer NOT NULL,
    name character varying(200)
);
 %   DROP TABLE public.geography_country;
       public         heap    postgres    false            �            1259    30631    geography_country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.geography_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.geography_country_id_seq;
       public          postgres    false    227                       0    0    geography_country_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.geography_country_id_seq OWNED BY public.geography_country.id;
          public          postgres    false    226            �            1259    30643    geography_region    TABLE     �   CREATE TABLE public.geography_region (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    code integer,
    country_id integer
);
 $   DROP TABLE public.geography_region;
       public         heap    postgres    false            �            1259    30641    geography_region_id_seq    SEQUENCE     �   CREATE SEQUENCE public.geography_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.geography_region_id_seq;
       public          postgres    false    229                       0    0    geography_region_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.geography_region_id_seq OWNED BY public.geography_region.id;
          public          postgres    false    228                       1259    31001    materialprices_insulationprice    TABLE     �   CREATE TABLE public.materialprices_insulationprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 2   DROP TABLE public.materialprices_insulationprice;
       public         heap    postgres    false                       1259    30999 %   materialprices_insulationprice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materialprices_insulationprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.materialprices_insulationprice_id_seq;
       public          postgres    false    269                       0    0 %   materialprices_insulationprice_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.materialprices_insulationprice_id_seq OWNED BY public.materialprices_insulationprice.id;
          public          postgres    false    268                       1259    30993 $   materialprices_rockwallmaterialprice    TABLE     �   CREATE TABLE public.materialprices_rockwallmaterialprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 8   DROP TABLE public.materialprices_rockwallmaterialprice;
       public         heap    postgres    false            
           1259    30991 +   materialprices_rockwallmaterialprice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materialprices_rockwallmaterialprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.materialprices_rockwallmaterialprice_id_seq;
       public          postgres    false    267                       0    0 +   materialprices_rockwallmaterialprice_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.materialprices_rockwallmaterialprice_id_seq OWNED BY public.materialprices_rockwallmaterialprice.id;
          public          postgres    false    266                       1259    30897    materials_bulksand    TABLE     �   CREATE TABLE public.materials_bulksand (
    id integer NOT NULL,
    name character varying(6) NOT NULL,
    weight integer NOT NULL
);
 &   DROP TABLE public.materials_bulksand;
       public         heap    postgres    false                       1259    30895    materials_bulksand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_bulksand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.materials_bulksand_id_seq;
       public          postgres    false    261                       0    0    materials_bulksand_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.materials_bulksand_id_seq OWNED BY public.materials_bulksand.id;
          public          postgres    false    260            &           1259    31351    materials_flexibletile    TABLE     �   CREATE TABLE public.materials_flexibletile (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    texture character varying(200) NOT NULL
);
 *   DROP TABLE public.materials_flexibletile;
       public         heap    postgres    false            %           1259    31349    materials_flexibletile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_flexibletile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.materials_flexibletile_id_seq;
       public          postgres    false    294                       0    0    materials_flexibletile_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.materials_flexibletile_id_seq OWNED BY public.materials_flexibletile.id;
          public          postgres    false    293            	           1259    30913    materials_insulation    TABLE     �   CREATE TABLE public.materials_insulation (
    id integer NOT NULL,
    thermal_conductivity double precision,
    mat_type character varying(9) NOT NULL,
    thick character varying(3) NOT NULL,
    brand_id integer
);
 (   DROP TABLE public.materials_insulation;
       public         heap    postgres    false                       1259    30911    materials_insulation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_insulation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.materials_insulation_id_seq;
       public          postgres    false    265                       0    0    materials_insulation_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.materials_insulation_id_seq OWNED BY public.materials_insulation.id;
          public          postgres    false    264                       1259    31079    materials_materialuse    TABLE     �   CREATE TABLE public.materials_materialuse (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    identifier character varying(200) NOT NULL
);
 )   DROP TABLE public.materials_materialuse;
       public         heap    postgres    false                       1259    31077    materials_materialuse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_materialuse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.materials_materialuse_id_seq;
       public          postgres    false    276                       0    0    materials_materialuse_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.materials_materialuse_id_seq OWNED BY public.materials_materialuse.id;
          public          postgres    false    275            (           1259    31361    materials_metaltile    TABLE     �   CREATE TABLE public.materials_metaltile (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    texture character varying(200) NOT NULL
);
 '   DROP TABLE public.materials_metaltile;
       public         heap    postgres    false            '           1259    31359    materials_metaltile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_metaltile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.materials_metaltile_id_seq;
       public          postgres    false    296                       0    0    materials_metaltile_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.materials_metaltile_id_seq OWNED BY public.materials_metaltile.id;
          public          postgres    false    295                       1259    31139    materials_plaster    TABLE     �   CREATE TABLE public.materials_plaster (
    id integer NOT NULL,
    texture character varying(200) NOT NULL,
    brand_id integer,
    manufacturer_id integer
);
 %   DROP TABLE public.materials_plaster;
       public         heap    postgres    false                       1259    31137    materials_plaster_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_plaster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.materials_plaster_id_seq;
       public          postgres    false    284                       0    0    materials_plaster_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.materials_plaster_id_seq OWNED BY public.materials_plaster.id;
          public          postgres    false    283                       1259    31147    materials_plaster_use    TABLE     �   CREATE TABLE public.materials_plaster_use (
    id integer NOT NULL,
    plaster_id integer NOT NULL,
    materialuse_id integer NOT NULL
);
 )   DROP TABLE public.materials_plaster_use;
       public         heap    postgres    false                       1259    31145    materials_plaster_use_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_plaster_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.materials_plaster_use_id_seq;
       public          postgres    false    286                       0    0    materials_plaster_use_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.materials_plaster_use_id_seq OWNED BY public.materials_plaster_use.id;
          public          postgres    false    285                       1259    30905    materials_rockwallmaterialunit    TABLE     j  CREATE TABLE public.materials_rockwallmaterialunit (
    id integer NOT NULL,
    name character varying(5) NOT NULL,
    material character varying(18) NOT NULL,
    greater_bed_size integer,
    minor_bed_size integer,
    height integer,
    tongue_and_groove character varying(3) NOT NULL,
    polish character varying(3) NOT NULL,
    purpose character varying(10) NOT NULL,
    partition_or_bearing character varying(9) NOT NULL,
    body_type character varying(6) NOT NULL,
    blind_hollow character varying(3) NOT NULL,
    primary_or_additional character varying(10) NOT NULL,
    algorithm_id integer,
    brand_id integer,
    class_average_density_id integer,
    class_b_id integer,
    face_id integer,
    manufacturer_id integer,
    mark_d_id integer,
    mark_f_id integer,
    mark_m_id integer,
    sub_brand_1_id integer,
    sub_brand_2_id integer
);
 2   DROP TABLE public.materials_rockwallmaterialunit;
       public         heap    postgres    false                       1259    30903 %   materials_rockwallmaterialunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_rockwallmaterialunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.materials_rockwallmaterialunit_id_seq;
       public          postgres    false    263                       0    0 %   materials_rockwallmaterialunit_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.materials_rockwallmaterialunit_id_seq OWNED BY public.materials_rockwallmaterialunit.id;
          public          postgres    false    262                       1259    31087    materials_roofcovertype    TABLE     �   CREATE TABLE public.materials_roofcovertype (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    identifier character varying(200) NOT NULL
);
 +   DROP TABLE public.materials_roofcovertype;
       public         heap    postgres    false                       1259    31085    materials_roofcovertype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_roofcovertype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.materials_roofcovertype_id_seq;
       public          postgres    false    278                       0    0    materials_roofcovertype_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.materials_roofcovertype_id_seq OWNED BY public.materials_roofcovertype.id;
          public          postgres    false    277                       1259    31115    materials_siding    TABLE     �   CREATE TABLE public.materials_siding (
    id integer NOT NULL,
    material character varying(20) NOT NULL,
    alternative_name character varying(20),
    texture character varying(200) NOT NULL,
    brand_id integer,
    manufacturer_id integer
);
 $   DROP TABLE public.materials_siding;
       public         heap    postgres    false                       1259    31113    materials_siding_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_siding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.materials_siding_id_seq;
       public          postgres    false    280                       0    0    materials_siding_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.materials_siding_id_seq OWNED BY public.materials_siding.id;
          public          postgres    false    279                       1259    31123    materials_siding_use    TABLE     �   CREATE TABLE public.materials_siding_use (
    id integer NOT NULL,
    siding_id integer NOT NULL,
    materialuse_id integer NOT NULL
);
 (   DROP TABLE public.materials_siding_use;
       public         heap    postgres    false                       1259    31121    materials_siding_use_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_siding_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.materials_siding_use_id_seq;
       public          postgres    false    282                       0    0    materials_siding_use_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.materials_siding_use_id_seq OWNED BY public.materials_siding_use.id;
          public          postgres    false    281                        1259    31293    materials_stoneproductline    TABLE     �   CREATE TABLE public.materials_stoneproductline (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    manufacturer_id integer
);
 .   DROP TABLE public.materials_stoneproductline;
       public         heap    postgres    false                       1259    31291 !   materials_stoneproductline_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_stoneproductline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.materials_stoneproductline_id_seq;
       public          postgres    false    288                       0    0 !   materials_stoneproductline_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.materials_stoneproductline_id_seq OWNED BY public.materials_stoneproductline.id;
          public          postgres    false    287            "           1259    31301    materials_stoneproductline_use    TABLE     �   CREATE TABLE public.materials_stoneproductline_use (
    id integer NOT NULL,
    stoneproductline_id integer NOT NULL,
    materialuse_id integer NOT NULL
);
 2   DROP TABLE public.materials_stoneproductline_use;
       public         heap    postgres    false            !           1259    31299 %   materials_stoneproductline_use_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_stoneproductline_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.materials_stoneproductline_use_id_seq;
       public          postgres    false    290                       0    0 %   materials_stoneproductline_use_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.materials_stoneproductline_use_id_seq OWNED BY public.materials_stoneproductline_use.id;
          public          postgres    false    289            $           1259    31309    materials_stoneunit    TABLE     �   CREATE TABLE public.materials_stoneunit (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    texture character varying(200) NOT NULL,
    product_line_id integer
);
 '   DROP TABLE public.materials_stoneunit;
       public         heap    postgres    false            #           1259    31307    materials_stoneunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_stoneunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.materials_stoneunit_id_seq;
       public          postgres    false    292                       0    0    materials_stoneunit_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.materials_stoneunit_id_seq OWNED BY public.materials_stoneunit.id;
          public          postgres    false    291                       1259    30867    names_decorativebrickface    TABLE     u   CREATE TABLE public.names_decorativebrickface (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
 -   DROP TABLE public.names_decorativebrickface;
       public         heap    postgres    false                       1259    30875    names_decorativebrickface_brand    TABLE     �   CREATE TABLE public.names_decorativebrickface_brand (
    id integer NOT NULL,
    decorativebrickface_id integer NOT NULL,
    brand_id integer NOT NULL
);
 3   DROP TABLE public.names_decorativebrickface_brand;
       public         heap    postgres    false                       1259    30873 &   names_decorativebrickface_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.names_decorativebrickface_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.names_decorativebrickface_brand_id_seq;
       public          postgres    false    259                       0    0 &   names_decorativebrickface_brand_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.names_decorativebrickface_brand_id_seq OWNED BY public.names_decorativebrickface_brand.id;
          public          postgres    false    258                        1259    30865     names_decorativebrickface_id_seq    SEQUENCE     �   CREATE SEQUENCE public.names_decorativebrickface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.names_decorativebrickface_id_seq;
       public          postgres    false    257                       0    0     names_decorativebrickface_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.names_decorativebrickface_id_seq OWNED BY public.names_decorativebrickface.id;
          public          postgres    false    256            �            1259    30801    standards_classb    TABLE     �   CREATE TABLE public.standards_classb (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 $   DROP TABLE public.standards_classb;
       public         heap    postgres    false            �            1259    30799    standards_classb_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_classb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.standards_classb_id_seq;
       public          postgres    false    245                       0    0    standards_classb_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.standards_classb_id_seq OWNED BY public.standards_classb.id;
          public          postgres    false    244            �            1259    30811    standards_classаveragedensity    TABLE     �   CREATE TABLE public."standards_classаveragedensity" (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 4   DROP TABLE public."standards_classаveragedensity";
       public         heap    postgres    false            �            1259    30809 %   standards_classаveragedensity_id_seq    SEQUENCE     �   CREATE SEQUENCE public."standards_classаveragedensity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."standards_classаveragedensity_id_seq";
       public          postgres    false    247                        0    0 %   standards_classаveragedensity_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."standards_classаveragedensity_id_seq" OWNED BY public."standards_classаveragedensity".id;
          public          postgres    false    246            �            1259    30821    standards_markd    TABLE     �   CREATE TABLE public.standards_markd (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 #   DROP TABLE public.standards_markd;
       public         heap    postgres    false            �            1259    30819    standards_markd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_markd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.standards_markd_id_seq;
       public          postgres    false    249            !           0    0    standards_markd_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.standards_markd_id_seq OWNED BY public.standards_markd.id;
          public          postgres    false    248            �            1259    30831    standards_markf    TABLE     �   CREATE TABLE public.standards_markf (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 #   DROP TABLE public.standards_markf;
       public         heap    postgres    false            �            1259    30829    standards_markf_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_markf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.standards_markf_id_seq;
       public          postgres    false    251            "           0    0    standards_markf_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.standards_markf_id_seq OWNED BY public.standards_markf.id;
          public          postgres    false    250            �            1259    30841    standards_markm    TABLE     �   CREATE TABLE public.standards_markm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 #   DROP TABLE public.standards_markm;
       public         heap    postgres    false            �            1259    30839    standards_markm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_markm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.standards_markm_id_seq;
       public          postgres    false    253            #           0    0    standards_markm_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.standards_markm_id_seq OWNED BY public.standards_markm.id;
          public          postgres    false    252            �            1259    30851    standards_nfsize    TABLE     �   CREATE TABLE public.standards_nfsize (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    greater_bed_size integer,
    minor_bed_size integer,
    height integer
);
 $   DROP TABLE public.standards_nfsize;
       public         heap    postgres    false            �            1259    30849    standards_nfsize_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_nfsize_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.standards_nfsize_id_seq;
       public          postgres    false    255            $           0    0    standards_nfsize_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.standards_nfsize_id_seq OWNED BY public.standards_nfsize.id;
          public          postgres    false    254            �            1259    30728    suppliers_activity    TABLE     �   CREATE TABLE public.suppliers_activity (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 &   DROP TABLE public.suppliers_activity;
       public         heap    postgres    false            �            1259    30726    suppliers_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.suppliers_activity_id_seq;
       public          postgres    false    237            %           0    0    suppliers_activity_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.suppliers_activity_id_seq OWNED BY public.suppliers_activity.id;
          public          postgres    false    236            �            1259    30756    suppliers_manufacturer    TABLE     �   CREATE TABLE public.suppliers_manufacturer (
    id integer NOT NULL,
    alias character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    brand_id integer,
    city_id integer
);
 *   DROP TABLE public.suppliers_manufacturer;
       public         heap    postgres    false            �            1259    30754    suppliers_manufacturer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.suppliers_manufacturer_id_seq;
       public          postgres    false    243            &           0    0    suppliers_manufacturer_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.suppliers_manufacturer_id_seq OWNED BY public.suppliers_manufacturer.id;
          public          postgres    false    242            �            1259    30738    suppliers_provider    TABLE     �   CREATE TABLE public.suppliers_provider (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    primary_activity_id integer
);
 &   DROP TABLE public.suppliers_provider;
       public         heap    postgres    false            �            1259    30736    suppliers_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.suppliers_provider_id_seq;
       public          postgres    false    239            '           0    0    suppliers_provider_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.suppliers_provider_id_seq OWNED BY public.suppliers_provider.id;
          public          postgres    false    238            �            1259    30748 %   suppliers_provider_secondary_activity    TABLE     �   CREATE TABLE public.suppliers_provider_secondary_activity (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    activity_id integer NOT NULL
);
 9   DROP TABLE public.suppliers_provider_secondary_activity;
       public         heap    postgres    false            �            1259    30746 ,   suppliers_provider_secondary_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_provider_secondary_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.suppliers_provider_secondary_activity_id_seq;
       public          postgres    false    241            (           0    0 ,   suppliers_provider_secondary_activity_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.suppliers_provider_secondary_activity_id_seq OWNED BY public.suppliers_provider_secondary_activity.id;
          public          postgres    false    240                       1259    31043 +   workprices_pilegrillagefoundationworkprices    TABLE     �  CREATE TABLE public.workprices_pilegrillagefoundationworkprices (
    id integer NOT NULL,
    const_expenditure double precision NOT NULL,
    transportation_procurement_cost double precision NOT NULL,
    reinforcement_binding double precision NOT NULL,
    clamp double precision NOT NULL,
    pile_frame double precision NOT NULL,
    formwork double precision NOT NULL,
    length_costs double precision NOT NULL,
    square_costs double precision NOT NULL,
    volume_costs double precision NOT NULL,
    pile_pour double precision NOT NULL,
    man_hours_cost integer NOT NULL,
    man_hours_profit integer NOT NULL,
    owner_id integer
);
 ?   DROP TABLE public.workprices_pilegrillagefoundationworkprices;
       public         heap    postgres    false                       1259    31041 2   workprices_pilegrillagefoundationworkprices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq;
       public          postgres    false    272            )           0    0 2   workprices_pilegrillagefoundationworkprices_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq OWNED BY public.workprices_pilegrillagefoundationworkprices.id;
          public          postgres    false    271            �           2604    31061    account_profile id    DEFAULT     x   ALTER TABLE ONLY public.account_profile ALTER COLUMN id SET DEFAULT nextval('public.account_profile_id_seq'::regclass);
 A   ALTER TABLE public.account_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    274    273    274            �           2604    30462    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �           2604    30472    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    30454    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    30480    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    30490    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    30498    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    30591    brands_brand id    DEFAULT     r   ALTER TABLE ONLY public.brands_brand ALTER COLUMN id SET DEFAULT nextval('public.brands_brand_id_seq'::regclass);
 >   ALTER TABLE public.brands_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    30601    brands_subbrand_1 id    DEFAULT     |   ALTER TABLE ONLY public.brands_subbrand_1 ALTER COLUMN id SET DEFAULT nextval('public.brands_subbrand_1_id_seq'::regclass);
 C   ALTER TABLE public.brands_subbrand_1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    30611    brands_subbrand_2 id    DEFAULT     |   ALTER TABLE ONLY public.brands_subbrand_2 ALTER COLUMN id SET DEFAULT nextval('public.brands_subbrand_2_id_seq'::regclass);
 C   ALTER TABLE public.brands_subbrand_2 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    30680    catalog_algorithm id    DEFAULT     |   ALTER TABLE ONLY public.catalog_algorithm ALTER COLUMN id SET DEFAULT nextval('public.catalog_algorithm_id_seq'::regclass);
 C   ALTER TABLE public.catalog_algorithm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    31376    catalog_facadematerialtype id    DEFAULT     �   ALTER TABLE ONLY public.catalog_facadematerialtype ALTER COLUMN id SET DEFAULT nextval('public.catalog_facadematerialtype_id_seq'::regclass);
 L   ALTER TABLE public.catalog_facadematerialtype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    298    297    298            �           2604    30700    catalog_plan id    DEFAULT     r   ALTER TABLE ONLY public.catalog_plan ALTER COLUMN id SET DEFAULT nextval('public.catalog_plan_id_seq'::regclass);
 >   ALTER TABLE public.catalog_plan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    31386    catalog_shell id    DEFAULT     t   ALTER TABLE ONLY public.catalog_shell ALTER COLUMN id SET DEFAULT nextval('public.catalog_shell_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_shell ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    299    300    300            �           2604    30558    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    30444    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �           2604    30433    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    30658    geography_city id    DEFAULT     v   ALTER TABLE ONLY public.geography_city ALTER COLUMN id SET DEFAULT nextval('public.geography_city_id_seq'::regclass);
 @   ALTER TABLE public.geography_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    30636    geography_country id    DEFAULT     |   ALTER TABLE ONLY public.geography_country ALTER COLUMN id SET DEFAULT nextval('public.geography_country_id_seq'::regclass);
 C   ALTER TABLE public.geography_country ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    30646    geography_region id    DEFAULT     z   ALTER TABLE ONLY public.geography_region ALTER COLUMN id SET DEFAULT nextval('public.geography_region_id_seq'::regclass);
 B   ALTER TABLE public.geography_region ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    31004 !   materialprices_insulationprice id    DEFAULT     �   ALTER TABLE ONLY public.materialprices_insulationprice ALTER COLUMN id SET DEFAULT nextval('public.materialprices_insulationprice_id_seq'::regclass);
 P   ALTER TABLE public.materialprices_insulationprice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    268    269            �           2604    30996 '   materialprices_rockwallmaterialprice id    DEFAULT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice ALTER COLUMN id SET DEFAULT nextval('public.materialprices_rockwallmaterialprice_id_seq'::regclass);
 V   ALTER TABLE public.materialprices_rockwallmaterialprice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    267    267            �           2604    30900    materials_bulksand id    DEFAULT     ~   ALTER TABLE ONLY public.materials_bulksand ALTER COLUMN id SET DEFAULT nextval('public.materials_bulksand_id_seq'::regclass);
 D   ALTER TABLE public.materials_bulksand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260    261            �           2604    31354    materials_flexibletile id    DEFAULT     �   ALTER TABLE ONLY public.materials_flexibletile ALTER COLUMN id SET DEFAULT nextval('public.materials_flexibletile_id_seq'::regclass);
 H   ALTER TABLE public.materials_flexibletile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    293    294    294            �           2604    30916    materials_insulation id    DEFAULT     �   ALTER TABLE ONLY public.materials_insulation ALTER COLUMN id SET DEFAULT nextval('public.materials_insulation_id_seq'::regclass);
 F   ALTER TABLE public.materials_insulation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264    265            �           2604    31082    materials_materialuse id    DEFAULT     �   ALTER TABLE ONLY public.materials_materialuse ALTER COLUMN id SET DEFAULT nextval('public.materials_materialuse_id_seq'::regclass);
 G   ALTER TABLE public.materials_materialuse ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    275    276    276            �           2604    31364    materials_metaltile id    DEFAULT     �   ALTER TABLE ONLY public.materials_metaltile ALTER COLUMN id SET DEFAULT nextval('public.materials_metaltile_id_seq'::regclass);
 E   ALTER TABLE public.materials_metaltile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    296    295    296            �           2604    31142    materials_plaster id    DEFAULT     |   ALTER TABLE ONLY public.materials_plaster ALTER COLUMN id SET DEFAULT nextval('public.materials_plaster_id_seq'::regclass);
 C   ALTER TABLE public.materials_plaster ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    283    284    284            �           2604    31150    materials_plaster_use id    DEFAULT     �   ALTER TABLE ONLY public.materials_plaster_use ALTER COLUMN id SET DEFAULT nextval('public.materials_plaster_use_id_seq'::regclass);
 G   ALTER TABLE public.materials_plaster_use ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    286    285    286            �           2604    30908 !   materials_rockwallmaterialunit id    DEFAULT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit ALTER COLUMN id SET DEFAULT nextval('public.materials_rockwallmaterialunit_id_seq'::regclass);
 P   ALTER TABLE public.materials_rockwallmaterialunit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    263    263            �           2604    31090    materials_roofcovertype id    DEFAULT     �   ALTER TABLE ONLY public.materials_roofcovertype ALTER COLUMN id SET DEFAULT nextval('public.materials_roofcovertype_id_seq'::regclass);
 I   ALTER TABLE public.materials_roofcovertype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    277    278            �           2604    31118    materials_siding id    DEFAULT     z   ALTER TABLE ONLY public.materials_siding ALTER COLUMN id SET DEFAULT nextval('public.materials_siding_id_seq'::regclass);
 B   ALTER TABLE public.materials_siding ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    280    279    280            �           2604    31126    materials_siding_use id    DEFAULT     �   ALTER TABLE ONLY public.materials_siding_use ALTER COLUMN id SET DEFAULT nextval('public.materials_siding_use_id_seq'::regclass);
 F   ALTER TABLE public.materials_siding_use ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    282    281    282            �           2604    31296    materials_stoneproductline id    DEFAULT     �   ALTER TABLE ONLY public.materials_stoneproductline ALTER COLUMN id SET DEFAULT nextval('public.materials_stoneproductline_id_seq'::regclass);
 L   ALTER TABLE public.materials_stoneproductline ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    288    287    288            �           2604    31304 !   materials_stoneproductline_use id    DEFAULT     �   ALTER TABLE ONLY public.materials_stoneproductline_use ALTER COLUMN id SET DEFAULT nextval('public.materials_stoneproductline_use_id_seq'::regclass);
 P   ALTER TABLE public.materials_stoneproductline_use ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    290    289    290            �           2604    31312    materials_stoneunit id    DEFAULT     �   ALTER TABLE ONLY public.materials_stoneunit ALTER COLUMN id SET DEFAULT nextval('public.materials_stoneunit_id_seq'::regclass);
 E   ALTER TABLE public.materials_stoneunit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    292    291    292            �           2604    30870    names_decorativebrickface id    DEFAULT     �   ALTER TABLE ONLY public.names_decorativebrickface ALTER COLUMN id SET DEFAULT nextval('public.names_decorativebrickface_id_seq'::regclass);
 K   ALTER TABLE public.names_decorativebrickface ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256    257            �           2604    30878 "   names_decorativebrickface_brand id    DEFAULT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand ALTER COLUMN id SET DEFAULT nextval('public.names_decorativebrickface_brand_id_seq'::regclass);
 Q   ALTER TABLE public.names_decorativebrickface_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    259    259            �           2604    30804    standards_classb id    DEFAULT     z   ALTER TABLE ONLY public.standards_classb ALTER COLUMN id SET DEFAULT nextval('public.standards_classb_id_seq'::regclass);
 B   ALTER TABLE public.standards_classb ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    30814 !   standards_classаveragedensity id    DEFAULT     �   ALTER TABLE ONLY public."standards_classаveragedensity" ALTER COLUMN id SET DEFAULT nextval('public."standards_classаveragedensity_id_seq"'::regclass);
 R   ALTER TABLE public."standards_classаveragedensity" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247            �           2604    30824    standards_markd id    DEFAULT     x   ALTER TABLE ONLY public.standards_markd ALTER COLUMN id SET DEFAULT nextval('public.standards_markd_id_seq'::regclass);
 A   ALTER TABLE public.standards_markd ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    249    249            �           2604    30834    standards_markf id    DEFAULT     x   ALTER TABLE ONLY public.standards_markf ALTER COLUMN id SET DEFAULT nextval('public.standards_markf_id_seq'::regclass);
 A   ALTER TABLE public.standards_markf ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250    251            �           2604    30844    standards_markm id    DEFAULT     x   ALTER TABLE ONLY public.standards_markm ALTER COLUMN id SET DEFAULT nextval('public.standards_markm_id_seq'::regclass);
 A   ALTER TABLE public.standards_markm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253            �           2604    30854    standards_nfsize id    DEFAULT     z   ALTER TABLE ONLY public.standards_nfsize ALTER COLUMN id SET DEFAULT nextval('public.standards_nfsize_id_seq'::regclass);
 B   ALTER TABLE public.standards_nfsize ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254    255            �           2604    30731    suppliers_activity id    DEFAULT     ~   ALTER TABLE ONLY public.suppliers_activity ALTER COLUMN id SET DEFAULT nextval('public.suppliers_activity_id_seq'::regclass);
 D   ALTER TABLE public.suppliers_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    30759    suppliers_manufacturer id    DEFAULT     �   ALTER TABLE ONLY public.suppliers_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.suppliers_manufacturer_id_seq'::regclass);
 H   ALTER TABLE public.suppliers_manufacturer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            �           2604    30741    suppliers_provider id    DEFAULT     ~   ALTER TABLE ONLY public.suppliers_provider ALTER COLUMN id SET DEFAULT nextval('public.suppliers_provider_id_seq'::regclass);
 D   ALTER TABLE public.suppliers_provider ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    30751 (   suppliers_provider_secondary_activity id    DEFAULT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity ALTER COLUMN id SET DEFAULT nextval('public.suppliers_provider_secondary_activity_id_seq'::regclass);
 W   ALTER TABLE public.suppliers_provider_secondary_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    31046 .   workprices_pilegrillagefoundationworkprices id    DEFAULT     �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices ALTER COLUMN id SET DEFAULT nextval('public.workprices_pilegrillagefoundationworkprices_id_seq'::regclass);
 ]   ALTER TABLE public.workprices_pilegrillagefoundationworkprices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    272    271    272            �          0    31058    account_profile 
   TABLE DATA           F   COPY public.account_profile (id, photo, user_id, city_id) FROM stdin;
    public          postgres    false    274   W�      �          0    30459 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   ��      �          0    30469    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   ��      �          0    30451    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   ��      �          0    30477 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213    �      �          0    30487    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   ��      �          0    30495    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   ��      �          0    30588    brands_brand 
   TABLE DATA           0   COPY public.brands_brand (id, name) FROM stdin;
    public          postgres    false    221   ��      �          0    30598    brands_subbrand_1 
   TABLE DATA           ?   COPY public.brands_subbrand_1 (id, name, brand_id) FROM stdin;
    public          postgres    false    223   �      �          0    30608    brands_subbrand_2 
   TABLE DATA           E   COPY public.brands_subbrand_2 (id, name, sub_brand_1_id) FROM stdin;
    public          postgres    false    225   (�      �          0    30677    catalog_algorithm 
   TABLE DATA           A   COPY public.catalog_algorithm (id, identifier, name) FROM stdin;
    public          postgres    false    233   E�      �          0    31373    catalog_facadematerialtype 
   TABLE DATA           J   COPY public.catalog_facadematerialtype (id, name, identifier) FROM stdin;
    public          postgres    false    298   b�      �          0    30697    catalog_plan 
   TABLE DATA           M   COPY public.catalog_plan (id, title, scheme, checked, author_id) FROM stdin;
    public          postgres    false    235   �      �          0    31383    catalog_shell 
   TABLE DATA           �   COPY public.catalog_shell (id, name, roof_material_id, soffit_style, wall_material_0_id, socle_material_id, author_id, roof_material_type_id, socle_material_type_id, wall_material_type_0_id) FROM stdin;
    public          postgres    false    300   ��      �          0    30555    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   ��      �          0    30441    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   ��      �          0    30430    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   m�      �          0    31031    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    270   ��      �          0    30655    geography_city 
   TABLE DATA           r   COPY public.geography_city (id, name, heating_period_duration, heating_period_temperature, region_id) FROM stdin;
    public          postgres    false    231   g�      �          0    30633    geography_country 
   TABLE DATA           5   COPY public.geography_country (id, name) FROM stdin;
    public          postgres    false    227   ��      �          0    30643    geography_region 
   TABLE DATA           F   COPY public.geography_region (id, name, code, country_id) FROM stdin;
    public          postgres    false    229   ��      �          0    31001    materialprices_insulationprice 
   TABLE DATA           V   COPY public.materialprices_insulationprice (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    269   ��      �          0    30993 $   materialprices_rockwallmaterialprice 
   TABLE DATA           \   COPY public.materialprices_rockwallmaterialprice (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    267   �      �          0    30897    materials_bulksand 
   TABLE DATA           >   COPY public.materials_bulksand (id, name, weight) FROM stdin;
    public          postgres    false    261   1�      �          0    31351    materials_flexibletile 
   TABLE DATA           C   COPY public.materials_flexibletile (id, name, texture) FROM stdin;
    public          postgres    false    294   N�      �          0    30913    materials_insulation 
   TABLE DATA           c   COPY public.materials_insulation (id, thermal_conductivity, mat_type, thick, brand_id) FROM stdin;
    public          postgres    false    265   k�      �          0    31079    materials_materialuse 
   TABLE DATA           E   COPY public.materials_materialuse (id, name, identifier) FROM stdin;
    public          postgres    false    276   ��      �          0    31361    materials_metaltile 
   TABLE DATA           @   COPY public.materials_metaltile (id, name, texture) FROM stdin;
    public          postgres    false    296   ��      �          0    31139    materials_plaster 
   TABLE DATA           S   COPY public.materials_plaster (id, texture, brand_id, manufacturer_id) FROM stdin;
    public          postgres    false    284   ��      �          0    31147    materials_plaster_use 
   TABLE DATA           O   COPY public.materials_plaster_use (id, plaster_id, materialuse_id) FROM stdin;
    public          postgres    false    286   ��      �          0    30905    materials_rockwallmaterialunit 
   TABLE DATA           y  COPY public.materials_rockwallmaterialunit (id, name, material, greater_bed_size, minor_bed_size, height, tongue_and_groove, polish, purpose, partition_or_bearing, body_type, blind_hollow, primary_or_additional, algorithm_id, brand_id, class_average_density_id, class_b_id, face_id, manufacturer_id, mark_d_id, mark_f_id, mark_m_id, sub_brand_1_id, sub_brand_2_id) FROM stdin;
    public          postgres    false    263   ��      �          0    31087    materials_roofcovertype 
   TABLE DATA           G   COPY public.materials_roofcovertype (id, name, identifier) FROM stdin;
    public          postgres    false    278   �      �          0    31115    materials_siding 
   TABLE DATA           n   COPY public.materials_siding (id, material, alternative_name, texture, brand_id, manufacturer_id) FROM stdin;
    public          postgres    false    280   ~�      �          0    31123    materials_siding_use 
   TABLE DATA           M   COPY public.materials_siding_use (id, siding_id, materialuse_id) FROM stdin;
    public          postgres    false    282   ��      �          0    31293    materials_stoneproductline 
   TABLE DATA           O   COPY public.materials_stoneproductline (id, name, manufacturer_id) FROM stdin;
    public          postgres    false    288   ��      �          0    31301    materials_stoneproductline_use 
   TABLE DATA           a   COPY public.materials_stoneproductline_use (id, stoneproductline_id, materialuse_id) FROM stdin;
    public          postgres    false    290   ��      �          0    31309    materials_stoneunit 
   TABLE DATA           Q   COPY public.materials_stoneunit (id, name, texture, product_line_id) FROM stdin;
    public          postgres    false    292   ��      �          0    30867    names_decorativebrickface 
   TABLE DATA           =   COPY public.names_decorativebrickface (id, name) FROM stdin;
    public          postgres    false    257   �      �          0    30875    names_decorativebrickface_brand 
   TABLE DATA           _   COPY public.names_decorativebrickface_brand (id, decorativebrickface_id, brand_id) FROM stdin;
    public          postgres    false    259   ,�      �          0    30801    standards_classb 
   TABLE DATA           @   COPY public.standards_classb (id, identifier, name) FROM stdin;
    public          postgres    false    245   I�      �          0    30811    standards_classаveragedensity 
   TABLE DATA           P   COPY public."standards_classаveragedensity" (id, identifier, name) FROM stdin;
    public          postgres    false    247   f�      �          0    30821    standards_markd 
   TABLE DATA           ?   COPY public.standards_markd (id, identifier, name) FROM stdin;
    public          postgres    false    249   ��      �          0    30831    standards_markf 
   TABLE DATA           ?   COPY public.standards_markf (id, identifier, name) FROM stdin;
    public          postgres    false    251   ��      �          0    30841    standards_markm 
   TABLE DATA           ?   COPY public.standards_markm (id, identifier, name) FROM stdin;
    public          postgres    false    253   ��      �          0    30851    standards_nfsize 
   TABLE DATA           j   COPY public.standards_nfsize (id, identifier, name, greater_bed_size, minor_bed_size, height) FROM stdin;
    public          postgres    false    255   ��      �          0    30728    suppliers_activity 
   TABLE DATA           B   COPY public.suppliers_activity (id, identifier, name) FROM stdin;
    public          postgres    false    237   ��      �          0    30756    suppliers_manufacturer 
   TABLE DATA           T   COPY public.suppliers_manufacturer (id, alias, name, brand_id, city_id) FROM stdin;
    public          postgres    false    243   �      �          0    30738    suppliers_provider 
   TABLE DATA           K   COPY public.suppliers_provider (id, name, primary_activity_id) FROM stdin;
    public          postgres    false    239   1�      �          0    30748 %   suppliers_provider_secondary_activity 
   TABLE DATA           ]   COPY public.suppliers_provider_secondary_activity (id, provider_id, activity_id) FROM stdin;
    public          postgres    false    241   N�      �          0    31043 +   workprices_pilegrillagefoundationworkprices 
   TABLE DATA             COPY public.workprices_pilegrillagefoundationworkprices (id, const_expenditure, transportation_procurement_cost, reinforcement_binding, clamp, pile_frame, formwork, length_costs, square_costs, volume_costs, pile_pour, man_hours_cost, man_hours_profit, owner_id) FROM stdin;
    public          postgres    false    272   k�      *           0    0    account_profile_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.account_profile_id_seq', 2, true);
          public          postgres    false    273            +           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);
          public          postgres    false    208            ,           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            -           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 180, true);
          public          postgres    false    206            .           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 2, true);
          public          postgres    false    214            /           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);
          public          postgres    false    212            0           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            1           0    0    brands_brand_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.brands_brand_id_seq', 1, false);
          public          postgres    false    220            2           0    0    brands_subbrand_1_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.brands_subbrand_1_id_seq', 1, false);
          public          postgres    false    222            3           0    0    brands_subbrand_2_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.brands_subbrand_2_id_seq', 1, false);
          public          postgres    false    224            4           0    0    catalog_algorithm_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalog_algorithm_id_seq', 1, false);
          public          postgres    false    232            5           0    0 !   catalog_facadematerialtype_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.catalog_facadematerialtype_id_seq', 1, false);
          public          postgres    false    297            6           0    0    catalog_plan_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.catalog_plan_id_seq', 5, true);
          public          postgres    false    234            7           0    0    catalog_shell_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_shell_id_seq', 1, false);
          public          postgres    false    299            8           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 22, true);
          public          postgres    false    218            9           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 45, true);
          public          postgres    false    204            :           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 38, true);
          public          postgres    false    202            ;           0    0    geography_city_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.geography_city_id_seq', 1, true);
          public          postgres    false    230            <           0    0    geography_country_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.geography_country_id_seq', 1, true);
          public          postgres    false    226            =           0    0    geography_region_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.geography_region_id_seq', 1, true);
          public          postgres    false    228            >           0    0 %   materialprices_insulationprice_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.materialprices_insulationprice_id_seq', 1, false);
          public          postgres    false    268            ?           0    0 +   materialprices_rockwallmaterialprice_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.materialprices_rockwallmaterialprice_id_seq', 1, false);
          public          postgres    false    266            @           0    0    materials_bulksand_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.materials_bulksand_id_seq', 1, false);
          public          postgres    false    260            A           0    0    materials_flexibletile_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.materials_flexibletile_id_seq', 1, false);
          public          postgres    false    293            B           0    0    materials_insulation_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.materials_insulation_id_seq', 1, false);
          public          postgres    false    264            C           0    0    materials_materialuse_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.materials_materialuse_id_seq', 1, false);
          public          postgres    false    275            D           0    0    materials_metaltile_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.materials_metaltile_id_seq', 1, false);
          public          postgres    false    295            E           0    0    materials_plaster_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.materials_plaster_id_seq', 1, false);
          public          postgres    false    283            F           0    0    materials_plaster_use_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.materials_plaster_use_id_seq', 1, false);
          public          postgres    false    285            G           0    0 %   materials_rockwallmaterialunit_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.materials_rockwallmaterialunit_id_seq', 1, false);
          public          postgres    false    262            H           0    0    materials_roofcovertype_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.materials_roofcovertype_id_seq', 2, true);
          public          postgres    false    277            I           0    0    materials_siding_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.materials_siding_id_seq', 1, false);
          public          postgres    false    279            J           0    0    materials_siding_use_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.materials_siding_use_id_seq', 1, false);
          public          postgres    false    281            K           0    0 !   materials_stoneproductline_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.materials_stoneproductline_id_seq', 1, false);
          public          postgres    false    287            L           0    0 %   materials_stoneproductline_use_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.materials_stoneproductline_use_id_seq', 1, false);
          public          postgres    false    289            M           0    0    materials_stoneunit_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.materials_stoneunit_id_seq', 1, false);
          public          postgres    false    291            N           0    0 &   names_decorativebrickface_brand_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.names_decorativebrickface_brand_id_seq', 1, false);
          public          postgres    false    258            O           0    0     names_decorativebrickface_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.names_decorativebrickface_id_seq', 1, false);
          public          postgres    false    256            P           0    0    standards_classb_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.standards_classb_id_seq', 1, false);
          public          postgres    false    244            Q           0    0 %   standards_classаveragedensity_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."standards_classаveragedensity_id_seq"', 1, false);
          public          postgres    false    246            R           0    0    standards_markd_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.standards_markd_id_seq', 1, false);
          public          postgres    false    248            S           0    0    standards_markf_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.standards_markf_id_seq', 1, false);
          public          postgres    false    250            T           0    0    standards_markm_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.standards_markm_id_seq', 1, false);
          public          postgres    false    252            U           0    0    standards_nfsize_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.standards_nfsize_id_seq', 1, false);
          public          postgres    false    254            V           0    0    suppliers_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.suppliers_activity_id_seq', 1, false);
          public          postgres    false    236            W           0    0    suppliers_manufacturer_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.suppliers_manufacturer_id_seq', 1, false);
          public          postgres    false    242            X           0    0    suppliers_provider_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.suppliers_provider_id_seq', 1, false);
          public          postgres    false    238            Y           0    0 ,   suppliers_provider_secondary_activity_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.suppliers_provider_secondary_activity_id_seq', 1, false);
          public          postgres    false    240            Z           0    0 2   workprices_pilegrillagefoundationworkprices_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.workprices_pilegrillagefoundationworkprices_id_seq', 1, false);
          public          postgres    false    271            �           2606    31063 $   account_profile account_profile_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_pkey;
       public            postgres    false    274            �           2606    31065 +   account_profile account_profile_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_user_id_key;
       public            postgres    false    274            �           2606    30584    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            �           2606    30511 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            �           2606    30474 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            �           2606    30464    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            �           2606    30502 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            �           2606    30456 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            �           2606    30492 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215            �           2606    30526 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            �           2606    30482    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213            �           2606    30500 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217                        2606    30540 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            �           2606    30578     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213                       2606    30595 "   brands_brand brands_brand_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.brands_brand
    ADD CONSTRAINT brands_brand_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.brands_brand DROP CONSTRAINT brands_brand_name_key;
       public            postgres    false    221            	           2606    30593    brands_brand brands_brand_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.brands_brand
    ADD CONSTRAINT brands_brand_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.brands_brand DROP CONSTRAINT brands_brand_pkey;
       public            postgres    false    221                       2606    30605 ,   brands_subbrand_1 brands_subbrand_1_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.brands_subbrand_1 DROP CONSTRAINT brands_subbrand_1_name_key;
       public            postgres    false    223                       2606    30603 (   brands_subbrand_1 brands_subbrand_1_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.brands_subbrand_1 DROP CONSTRAINT brands_subbrand_1_pkey;
       public            postgres    false    223                       2606    30615 ,   brands_subbrand_2 brands_subbrand_2_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.brands_subbrand_2 DROP CONSTRAINT brands_subbrand_2_name_key;
       public            postgres    false    225                       2606    30613 (   brands_subbrand_2 brands_subbrand_2_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.brands_subbrand_2 DROP CONSTRAINT brands_subbrand_2_pkey;
       public            postgres    false    225            (           2606    30684 2   catalog_algorithm catalog_algorithm_identifier_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_identifier_key UNIQUE (identifier);
 \   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_identifier_key;
       public            postgres    false    233            +           2606    30686 ,   catalog_algorithm catalog_algorithm_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_name_key;
       public            postgres    false    233            -           2606    30682 (   catalog_algorithm catalog_algorithm_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_pkey;
       public            postgres    false    233            �           2606    31380 >   catalog_facadematerialtype catalog_facadematerialtype_name_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.catalog_facadematerialtype
    ADD CONSTRAINT catalog_facadematerialtype_name_key UNIQUE (name);
 h   ALTER TABLE ONLY public.catalog_facadematerialtype DROP CONSTRAINT catalog_facadematerialtype_name_key;
       public            postgres    false    298            �           2606    31378 :   catalog_facadematerialtype catalog_facadematerialtype_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.catalog_facadematerialtype
    ADD CONSTRAINT catalog_facadematerialtype_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.catalog_facadematerialtype DROP CONSTRAINT catalog_facadematerialtype_pkey;
       public            postgres    false    298            0           2606    30705    catalog_plan catalog_plan_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_pkey;
       public            postgres    false    235            �           2606    31388     catalog_shell catalog_shell_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_pkey;
       public            postgres    false    300                       2606    30564 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219            �           2606    30448 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            �           2606    30446 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            �           2606    30438 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            �           2606    31038 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    270            $           2606    30660 "   geography_city geography_city_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.geography_city
    ADD CONSTRAINT geography_city_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.geography_city DROP CONSTRAINT geography_city_pkey;
       public            postgres    false    231                       2606    30640 ,   geography_country geography_country_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.geography_country
    ADD CONSTRAINT geography_country_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.geography_country DROP CONSTRAINT geography_country_name_key;
       public            postgres    false    227                       2606    30638 (   geography_country geography_country_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.geography_country
    ADD CONSTRAINT geography_country_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.geography_country DROP CONSTRAINT geography_country_pkey;
       public            postgres    false    227                       2606    30652 *   geography_region geography_region_code_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_code_key UNIQUE (code);
 T   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_code_key;
       public            postgres    false    229                        2606    30650 *   geography_region geography_region_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_name_key;
       public            postgres    false    229            "           2606    30648 &   geography_region geography_region_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_pkey;
       public            postgres    false    229            �           2606    31006 B   materialprices_insulationprice materialprices_insulationprice_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insulationprice_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.materialprices_insulationprice DROP CONSTRAINT materialprices_insulationprice_pkey;
       public            postgres    false    269            �           2606    30998 N   materialprices_rockwallmaterialprice materialprices_rockwallmaterialprice_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockwallmaterialprice_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice DROP CONSTRAINT materialprices_rockwallmaterialprice_pkey;
       public            postgres    false    267            p           2606    30902 *   materials_bulksand materials_bulksand_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.materials_bulksand
    ADD CONSTRAINT materials_bulksand_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.materials_bulksand DROP CONSTRAINT materials_bulksand_pkey;
       public            postgres    false    261            �           2606    31358 6   materials_flexibletile materials_flexibletile_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.materials_flexibletile
    ADD CONSTRAINT materials_flexibletile_name_key UNIQUE (name);
 `   ALTER TABLE ONLY public.materials_flexibletile DROP CONSTRAINT materials_flexibletile_name_key;
       public            postgres    false    294            �           2606    31356 2   materials_flexibletile materials_flexibletile_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.materials_flexibletile
    ADD CONSTRAINT materials_flexibletile_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.materials_flexibletile DROP CONSTRAINT materials_flexibletile_pkey;
       public            postgres    false    294            �           2606    30918 .   materials_insulation materials_insulation_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.materials_insulation
    ADD CONSTRAINT materials_insulation_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.materials_insulation DROP CONSTRAINT materials_insulation_pkey;
       public            postgres    false    265            �           2606    31344 :   materials_materialuse materials_materialuse_identifier_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.materials_materialuse
    ADD CONSTRAINT materials_materialuse_identifier_key UNIQUE (identifier);
 d   ALTER TABLE ONLY public.materials_materialuse DROP CONSTRAINT materials_materialuse_identifier_key;
       public            postgres    false    276            �           2606    31346 >   materials_materialuse materials_materialuse_name_012faa14_uniq 
   CONSTRAINT     y   ALTER TABLE ONLY public.materials_materialuse
    ADD CONSTRAINT materials_materialuse_name_012faa14_uniq UNIQUE (name);
 h   ALTER TABLE ONLY public.materials_materialuse DROP CONSTRAINT materials_materialuse_name_012faa14_uniq;
       public            postgres    false    276            �           2606    31084 0   materials_materialuse materials_materialuse_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.materials_materialuse
    ADD CONSTRAINT materials_materialuse_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.materials_materialuse DROP CONSTRAINT materials_materialuse_pkey;
       public            postgres    false    276            �           2606    31368 0   materials_metaltile materials_metaltile_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.materials_metaltile
    ADD CONSTRAINT materials_metaltile_name_key UNIQUE (name);
 Z   ALTER TABLE ONLY public.materials_metaltile DROP CONSTRAINT materials_metaltile_name_key;
       public            postgres    false    296            �           2606    31366 ,   materials_metaltile materials_metaltile_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.materials_metaltile
    ADD CONSTRAINT materials_metaltile_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.materials_metaltile DROP CONSTRAINT materials_metaltile_pkey;
       public            postgres    false    296            �           2606    31144 (   materials_plaster materials_plaster_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.materials_plaster
    ADD CONSTRAINT materials_plaster_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.materials_plaster DROP CONSTRAINT materials_plaster_pkey;
       public            postgres    false    284            �           2606    31152 0   materials_plaster_use materials_plaster_use_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_use_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.materials_plaster_use DROP CONSTRAINT materials_plaster_use_pkey;
       public            postgres    false    286            �           2606    31236 S   materials_plaster_use materials_plaster_use_plaster_id_materialuse_id_9371ddbc_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_use_plaster_id_materialuse_id_9371ddbc_uniq UNIQUE (plaster_id, materialuse_id);
 }   ALTER TABLE ONLY public.materials_plaster_use DROP CONSTRAINT materials_plaster_use_plaster_id_materialuse_id_9371ddbc_uniq;
       public            postgres    false    286    286            {           2606    30910 B   materials_rockwallmaterialunit materials_rockwallmaterialunit_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallmaterialunit_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallmaterialunit_pkey;
       public            postgres    false    263            �           2606    31096 >   materials_roofcovertype materials_roofcovertype_identifier_key 
   CONSTRAINT        ALTER TABLE ONLY public.materials_roofcovertype
    ADD CONSTRAINT materials_roofcovertype_identifier_key UNIQUE (identifier);
 h   ALTER TABLE ONLY public.materials_roofcovertype DROP CONSTRAINT materials_roofcovertype_identifier_key;
       public            postgres    false    278            �           2606    31094 8   materials_roofcovertype materials_roofcovertype_name_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.materials_roofcovertype
    ADD CONSTRAINT materials_roofcovertype_name_key UNIQUE (name);
 b   ALTER TABLE ONLY public.materials_roofcovertype DROP CONSTRAINT materials_roofcovertype_name_key;
       public            postgres    false    278            �           2606    31092 4   materials_roofcovertype materials_roofcovertype_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.materials_roofcovertype
    ADD CONSTRAINT materials_roofcovertype_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.materials_roofcovertype DROP CONSTRAINT materials_roofcovertype_pkey;
       public            postgres    false    278            �           2606    31120 &   materials_siding materials_siding_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.materials_siding
    ADD CONSTRAINT materials_siding_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.materials_siding DROP CONSTRAINT materials_siding_pkey;
       public            postgres    false    280            �           2606    31128 .   materials_siding_use materials_siding_use_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.materials_siding_use DROP CONSTRAINT materials_siding_use_pkey;
       public            postgres    false    282            �           2606    31204 P   materials_siding_use materials_siding_use_siding_id_materialuse_id_c91a5f6e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_siding_id_materialuse_id_c91a5f6e_uniq UNIQUE (siding_id, materialuse_id);
 z   ALTER TABLE ONLY public.materials_siding_use DROP CONSTRAINT materials_siding_use_siding_id_materialuse_id_c91a5f6e_uniq;
       public            postgres    false    282    282            �           2606    31322 ^   materials_stoneproductline_use materials_stoneproductli_stoneproductline_id_mate_0a83adbd_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneproductli_stoneproductline_id_mate_0a83adbd_uniq UNIQUE (stoneproductline_id, materialuse_id);
 �   ALTER TABLE ONLY public.materials_stoneproductline_use DROP CONSTRAINT materials_stoneproductli_stoneproductline_id_mate_0a83adbd_uniq;
       public            postgres    false    290    290            �           2606    31298 :   materials_stoneproductline materials_stoneproductline_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.materials_stoneproductline
    ADD CONSTRAINT materials_stoneproductline_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.materials_stoneproductline DROP CONSTRAINT materials_stoneproductline_pkey;
       public            postgres    false    288            �           2606    31306 B   materials_stoneproductline_use materials_stoneproductline_use_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneproductline_use_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.materials_stoneproductline_use DROP CONSTRAINT materials_stoneproductline_use_pkey;
       public            postgres    false    290            �           2606    31314 ,   materials_stoneunit materials_stoneunit_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.materials_stoneunit
    ADD CONSTRAINT materials_stoneunit_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.materials_stoneunit DROP CONSTRAINT materials_stoneunit_pkey;
       public            postgres    false    292            j           2606    30882 _   names_decorativebrickface_brand names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq UNIQUE (decorativebrickface_id, brand_id);
 �   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq;
       public            postgres    false    259    259            n           2606    30880 D   names_decorativebrickface_brand names_decorativebrickface_brand_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebrickface_brand_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebrickface_brand_pkey;
       public            postgres    false    259            h           2606    30872 8   names_decorativebrickface names_decorativebrickface_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.names_decorativebrickface
    ADD CONSTRAINT names_decorativebrickface_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.names_decorativebrickface DROP CONSTRAINT names_decorativebrickface_pkey;
       public            postgres    false    257            K           2606    30808 0   standards_classb standards_classb_identifier_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.standards_classb
    ADD CONSTRAINT standards_classb_identifier_key UNIQUE (identifier);
 Z   ALTER TABLE ONLY public.standards_classb DROP CONSTRAINT standards_classb_identifier_key;
       public            postgres    false    245            M           2606    30806 &   standards_classb standards_classb_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.standards_classb
    ADD CONSTRAINT standards_classb_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.standards_classb DROP CONSTRAINT standards_classb_pkey;
       public            postgres    false    245            P           2606    30818 L   standards_classаveragedensity standards_classаveragedensity_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."standards_classаveragedensity"
    ADD CONSTRAINT "standards_classаveragedensity_identifier_key" UNIQUE (identifier);
 z   ALTER TABLE ONLY public."standards_classаveragedensity" DROP CONSTRAINT "standards_classаveragedensity_identifier_key";
       public            postgres    false    247            R           2606    30816 B   standards_classаveragedensity standards_classаveragedensity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."standards_classаveragedensity"
    ADD CONSTRAINT "standards_classаveragedensity_pkey" PRIMARY KEY (id);
 p   ALTER TABLE ONLY public."standards_classаveragedensity" DROP CONSTRAINT "standards_classаveragedensity_pkey";
       public            postgres    false    247            U           2606    30828 .   standards_markd standards_markd_identifier_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.standards_markd
    ADD CONSTRAINT standards_markd_identifier_key UNIQUE (identifier);
 X   ALTER TABLE ONLY public.standards_markd DROP CONSTRAINT standards_markd_identifier_key;
       public            postgres    false    249            W           2606    30826 $   standards_markd standards_markd_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.standards_markd
    ADD CONSTRAINT standards_markd_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.standards_markd DROP CONSTRAINT standards_markd_pkey;
       public            postgres    false    249            Z           2606    30838 .   standards_markf standards_markf_identifier_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.standards_markf
    ADD CONSTRAINT standards_markf_identifier_key UNIQUE (identifier);
 X   ALTER TABLE ONLY public.standards_markf DROP CONSTRAINT standards_markf_identifier_key;
       public            postgres    false    251            \           2606    30836 $   standards_markf standards_markf_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.standards_markf
    ADD CONSTRAINT standards_markf_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.standards_markf DROP CONSTRAINT standards_markf_pkey;
       public            postgres    false    251            _           2606    30848 .   standards_markm standards_markm_identifier_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.standards_markm
    ADD CONSTRAINT standards_markm_identifier_key UNIQUE (identifier);
 X   ALTER TABLE ONLY public.standards_markm DROP CONSTRAINT standards_markm_identifier_key;
       public            postgres    false    253            a           2606    30846 $   standards_markm standards_markm_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.standards_markm
    ADD CONSTRAINT standards_markm_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.standards_markm DROP CONSTRAINT standards_markm_pkey;
       public            postgres    false    253            d           2606    30858 0   standards_nfsize standards_nfsize_identifier_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.standards_nfsize
    ADD CONSTRAINT standards_nfsize_identifier_key UNIQUE (identifier);
 Z   ALTER TABLE ONLY public.standards_nfsize DROP CONSTRAINT standards_nfsize_identifier_key;
       public            postgres    false    255            f           2606    30856 &   standards_nfsize standards_nfsize_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.standards_nfsize
    ADD CONSTRAINT standards_nfsize_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.standards_nfsize DROP CONSTRAINT standards_nfsize_pkey;
       public            postgres    false    255            3           2606    30735 4   suppliers_activity suppliers_activity_identifier_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.suppliers_activity
    ADD CONSTRAINT suppliers_activity_identifier_key UNIQUE (identifier);
 ^   ALTER TABLE ONLY public.suppliers_activity DROP CONSTRAINT suppliers_activity_identifier_key;
       public            postgres    false    237            5           2606    30733 *   suppliers_activity suppliers_activity_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.suppliers_activity
    ADD CONSTRAINT suppliers_activity_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.suppliers_activity DROP CONSTRAINT suppliers_activity_pkey;
       public            postgres    false    237            F           2606    30763 6   suppliers_manufacturer suppliers_manufacturer_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_name_key UNIQUE (name);
 `   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_name_key;
       public            postgres    false    243            H           2606    30761 2   suppliers_manufacturer suppliers_manufacturer_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_pkey;
       public            postgres    false    243            8           2606    30745 .   suppliers_provider suppliers_provider_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.suppliers_provider DROP CONSTRAINT suppliers_provider_name_key;
       public            postgres    false    239            :           2606    30743 *   suppliers_provider suppliers_provider_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.suppliers_provider DROP CONSTRAINT suppliers_provider_pkey;
       public            postgres    false    239            =           2606    30773 d   suppliers_provider_secondary_activity suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq UNIQUE (provider_id, activity_id);
 �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq;
       public            postgres    false    241    241            @           2606    30753 P   suppliers_provider_secondary_activity suppliers_provider_secondary_activity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_secondary_activity_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_secondary_activity_pkey;
       public            postgres    false    241            �           2606    31048 \   workprices_pilegrillagefoundationworkprices workprices_pilegrillagefoundationworkprices_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices
    ADD CONSTRAINT workprices_pilegrillagefoundationworkprices_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices DROP CONSTRAINT workprices_pilegrillagefoundationworkprices_pkey;
       public            postgres    false    272            �           1259    31076     account_profile_city_id_207f6508    INDEX     _   CREATE INDEX account_profile_city_id_207f6508 ON public.account_profile USING btree (city_id);
 4   DROP INDEX public.account_profile_city_id_207f6508;
       public            postgres    false    274            �           1259    30585    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            �           1259    30522 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            �           1259    30523 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            �           1259    30508 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            �           1259    30538 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215            �           1259    30537 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215            �           1259    30552 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            �           1259    30551 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            �           1259    30579     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213                       1259    30616    brands_brand_name_5759061b_like    INDEX     l   CREATE INDEX brands_brand_name_5759061b_like ON public.brands_brand USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.brands_brand_name_5759061b_like;
       public            postgres    false    221            
           1259    30623 #   brands_subbrand_1_brand_id_7085621b    INDEX     e   CREATE INDEX brands_subbrand_1_brand_id_7085621b ON public.brands_subbrand_1 USING btree (brand_id);
 7   DROP INDEX public.brands_subbrand_1_brand_id_7085621b;
       public            postgres    false    223                       1259    30622 $   brands_subbrand_1_name_f5c24720_like    INDEX     v   CREATE INDEX brands_subbrand_1_name_f5c24720_like ON public.brands_subbrand_1 USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.brands_subbrand_1_name_f5c24720_like;
       public            postgres    false    223                       1259    30629 $   brands_subbrand_2_name_d930b212_like    INDEX     v   CREATE INDEX brands_subbrand_2_name_d930b212_like ON public.brands_subbrand_2 USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.brands_subbrand_2_name_d930b212_like;
       public            postgres    false    225                       1259    30630 )   brands_subbrand_2_sub_brand_1_id_16ad81ef    INDEX     q   CREATE INDEX brands_subbrand_2_sub_brand_1_id_16ad81ef ON public.brands_subbrand_2 USING btree (sub_brand_1_id);
 =   DROP INDEX public.brands_subbrand_2_sub_brand_1_id_16ad81ef;
       public            postgres    false    225            &           1259    30706 *   catalog_algorithm_identifier_eb6862d5_like    INDEX     �   CREATE INDEX catalog_algorithm_identifier_eb6862d5_like ON public.catalog_algorithm USING btree (identifier varchar_pattern_ops);
 >   DROP INDEX public.catalog_algorithm_identifier_eb6862d5_like;
       public            postgres    false    233            )           1259    30707 $   catalog_algorithm_name_5dd925d3_like    INDEX     v   CREATE INDEX catalog_algorithm_name_5dd925d3_like ON public.catalog_algorithm USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.catalog_algorithm_name_5dd925d3_like;
       public            postgres    false    233            �           1259    31389 -   catalog_facadematerialtype_name_75e83a0b_like    INDEX     �   CREATE INDEX catalog_facadematerialtype_name_75e83a0b_like ON public.catalog_facadematerialtype USING btree (name varchar_pattern_ops);
 A   DROP INDEX public.catalog_facadematerialtype_name_75e83a0b_like;
       public            postgres    false    298            .           1259    30725    catalog_plan_author_id_19443bad    INDEX     ]   CREATE INDEX catalog_plan_author_id_19443bad ON public.catalog_plan USING btree (author_id);
 3   DROP INDEX public.catalog_plan_author_id_19443bad;
       public            postgres    false    235            �           1259    31410     catalog_shell_author_id_c4c4abab    INDEX     _   CREATE INDEX catalog_shell_author_id_c4c4abab ON public.catalog_shell USING btree (author_id);
 4   DROP INDEX public.catalog_shell_author_id_c4c4abab;
       public            postgres    false    300            �           1259    31411 ,   catalog_shell_roof_material_type_id_cecb1252    INDEX     w   CREATE INDEX catalog_shell_roof_material_type_id_cecb1252 ON public.catalog_shell USING btree (roof_material_type_id);
 @   DROP INDEX public.catalog_shell_roof_material_type_id_cecb1252;
       public            postgres    false    300            �           1259    31412 -   catalog_shell_socle_material_type_id_8b9c900c    INDEX     y   CREATE INDEX catalog_shell_socle_material_type_id_8b9c900c ON public.catalog_shell USING btree (socle_material_type_id);
 A   DROP INDEX public.catalog_shell_socle_material_type_id_8b9c900c;
       public            postgres    false    300            �           1259    31413 .   catalog_shell_wall_material_type_0_id_816c36ae    INDEX     {   CREATE INDEX catalog_shell_wall_material_type_0_id_816c36ae ON public.catalog_shell USING btree (wall_material_type_0_id);
 B   DROP INDEX public.catalog_shell_wall_material_type_0_id_816c36ae;
       public            postgres    false    300                       1259    30575 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219                       1259    30576 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219            �           1259    31040 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    270            �           1259    31039 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    270            %           1259    30674 !   geography_city_region_id_ea133d50    INDEX     a   CREATE INDEX geography_city_region_id_ea133d50 ON public.geography_city USING btree (region_id);
 5   DROP INDEX public.geography_city_region_id_ea133d50;
       public            postgres    false    231                       1259    30661 $   geography_country_name_477df8ef_like    INDEX     v   CREATE INDEX geography_country_name_477df8ef_like ON public.geography_country USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.geography_country_name_477df8ef_like;
       public            postgres    false    227                       1259    30668 $   geography_region_country_id_7b89c739    INDEX     g   CREATE INDEX geography_region_country_id_7b89c739 ON public.geography_region USING btree (country_id);
 8   DROP INDEX public.geography_region_country_id_7b89c739;
       public            postgres    false    229                       1259    30667 #   geography_region_name_78b61e6a_like    INDEX     t   CREATE INDEX geography_region_name_78b61e6a_like ON public.geography_region USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.geography_region_name_78b61e6a_like;
       public            postgres    false    229            �           1259    31029 /   materialprices_insulationprice_name_id_a70a0ae5    INDEX     }   CREATE INDEX materialprices_insulationprice_name_id_a70a0ae5 ON public.materialprices_insulationprice USING btree (name_id);
 C   DROP INDEX public.materialprices_insulationprice_name_id_a70a0ae5;
       public            postgres    false    269            �           1259    31030 0   materialprices_insulationprice_owner_id_ea647b28    INDEX        CREATE INDEX materialprices_insulationprice_owner_id_ea647b28 ON public.materialprices_insulationprice USING btree (owner_id);
 D   DROP INDEX public.materialprices_insulationprice_owner_id_ea647b28;
       public            postgres    false    269            �           1259    31017 5   materialprices_rockwallmaterialprice_name_id_5a769348    INDEX     �   CREATE INDEX materialprices_rockwallmaterialprice_name_id_5a769348 ON public.materialprices_rockwallmaterialprice USING btree (name_id);
 I   DROP INDEX public.materialprices_rockwallmaterialprice_name_id_5a769348;
       public            postgres    false    267            �           1259    31018 6   materialprices_rockwallmaterialprice_owner_id_ea24bd0d    INDEX     �   CREATE INDEX materialprices_rockwallmaterialprice_owner_id_ea24bd0d ON public.materialprices_rockwallmaterialprice USING btree (owner_id);
 J   DROP INDEX public.materialprices_rockwallmaterialprice_owner_id_ea24bd0d;
       public            postgres    false    267            �           1259    31369 )   materials_flexibletile_name_d3837b01_like    INDEX     �   CREATE INDEX materials_flexibletile_name_d3837b01_like ON public.materials_flexibletile USING btree (name varchar_pattern_ops);
 =   DROP INDEX public.materials_flexibletile_name_d3837b01_like;
       public            postgres    false    294            ~           1259    30990 &   materials_insulation_brand_id_dd7669b2    INDEX     k   CREATE INDEX materials_insulation_brand_id_dd7669b2 ON public.materials_insulation USING btree (brand_id);
 :   DROP INDEX public.materials_insulation_brand_id_dd7669b2;
       public            postgres    false    265            �           1259    31348 .   materials_materialuse_identifier_a010716f_like    INDEX     �   CREATE INDEX materials_materialuse_identifier_a010716f_like ON public.materials_materialuse USING btree (identifier varchar_pattern_ops);
 B   DROP INDEX public.materials_materialuse_identifier_a010716f_like;
       public            postgres    false    276            �           1259    31347 (   materials_materialuse_name_012faa14_like    INDEX     ~   CREATE INDEX materials_materialuse_name_012faa14_like ON public.materials_materialuse USING btree (name varchar_pattern_ops);
 <   DROP INDEX public.materials_materialuse_name_012faa14_like;
       public            postgres    false    276            �           1259    31370 &   materials_metaltile_name_3bb29633_like    INDEX     z   CREATE INDEX materials_metaltile_name_3bb29633_like ON public.materials_metaltile USING btree (name varchar_pattern_ops);
 :   DROP INDEX public.materials_metaltile_name_3bb29633_like;
       public            postgres    false    296            �           1259    31233 #   materials_plaster_brand_id_cc3e5323    INDEX     e   CREATE INDEX materials_plaster_brand_id_cc3e5323 ON public.materials_plaster USING btree (brand_id);
 7   DROP INDEX public.materials_plaster_brand_id_cc3e5323;
       public            postgres    false    284            �           1259    31234 *   materials_plaster_manufacturer_id_060021cd    INDEX     s   CREATE INDEX materials_plaster_manufacturer_id_060021cd ON public.materials_plaster USING btree (manufacturer_id);
 >   DROP INDEX public.materials_plaster_manufacturer_id_060021cd;
       public            postgres    false    284            �           1259    31248 -   materials_plaster_use_materialuse_id_3f0e40e1    INDEX     y   CREATE INDEX materials_plaster_use_materialuse_id_3f0e40e1 ON public.materials_plaster_use USING btree (materialuse_id);
 A   DROP INDEX public.materials_plaster_use_materialuse_id_3f0e40e1;
       public            postgres    false    286            �           1259    31247 )   materials_plaster_use_plaster_id_1ce61346    INDEX     q   CREATE INDEX materials_plaster_use_plaster_id_1ce61346 ON public.materials_plaster_use USING btree (plaster_id);
 =   DROP INDEX public.materials_plaster_use_plaster_id_1ce61346;
       public            postgres    false    286            q           1259    30976 <   materials_rockwallmaterial_class_average_density_id_beb6fff9    INDEX     �   CREATE INDEX materials_rockwallmaterial_class_average_density_id_beb6fff9 ON public.materials_rockwallmaterialunit USING btree (class_average_density_id);
 P   DROP INDEX public.materials_rockwallmaterial_class_average_density_id_beb6fff9;
       public            postgres    false    263            r           1259    30974 4   materials_rockwallmaterialunit_algorithm_id_4183f114    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_algorithm_id_4183f114 ON public.materials_rockwallmaterialunit USING btree (algorithm_id);
 H   DROP INDEX public.materials_rockwallmaterialunit_algorithm_id_4183f114;
       public            postgres    false    263            s           1259    30975 0   materials_rockwallmaterialunit_brand_id_4deb8894    INDEX        CREATE INDEX materials_rockwallmaterialunit_brand_id_4deb8894 ON public.materials_rockwallmaterialunit USING btree (brand_id);
 D   DROP INDEX public.materials_rockwallmaterialunit_brand_id_4deb8894;
       public            postgres    false    263            t           1259    30977 2   materials_rockwallmaterialunit_class_b_id_1de59e0b    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_class_b_id_1de59e0b ON public.materials_rockwallmaterialunit USING btree (class_b_id);
 F   DROP INDEX public.materials_rockwallmaterialunit_class_b_id_1de59e0b;
       public            postgres    false    263            u           1259    30978 /   materials_rockwallmaterialunit_face_id_712ecb1a    INDEX     }   CREATE INDEX materials_rockwallmaterialunit_face_id_712ecb1a ON public.materials_rockwallmaterialunit USING btree (face_id);
 C   DROP INDEX public.materials_rockwallmaterialunit_face_id_712ecb1a;
       public            postgres    false    263            v           1259    30979 7   materials_rockwallmaterialunit_manufacturer_id_c1176543    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_manufacturer_id_c1176543 ON public.materials_rockwallmaterialunit USING btree (manufacturer_id);
 K   DROP INDEX public.materials_rockwallmaterialunit_manufacturer_id_c1176543;
       public            postgres    false    263            w           1259    30980 1   materials_rockwallmaterialunit_mark_d_id_e456d3f5    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_mark_d_id_e456d3f5 ON public.materials_rockwallmaterialunit USING btree (mark_d_id);
 E   DROP INDEX public.materials_rockwallmaterialunit_mark_d_id_e456d3f5;
       public            postgres    false    263            x           1259    30981 1   materials_rockwallmaterialunit_mark_f_id_48ec4578    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_mark_f_id_48ec4578 ON public.materials_rockwallmaterialunit USING btree (mark_f_id);
 E   DROP INDEX public.materials_rockwallmaterialunit_mark_f_id_48ec4578;
       public            postgres    false    263            y           1259    30982 1   materials_rockwallmaterialunit_mark_m_id_e96cf97b    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_mark_m_id_e96cf97b ON public.materials_rockwallmaterialunit USING btree (mark_m_id);
 E   DROP INDEX public.materials_rockwallmaterialunit_mark_m_id_e96cf97b;
       public            postgres    false    263            |           1259    30983 6   materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb ON public.materials_rockwallmaterialunit USING btree (sub_brand_1_id);
 J   DROP INDEX public.materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb;
       public            postgres    false    263            }           1259    30984 6   materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b ON public.materials_rockwallmaterialunit USING btree (sub_brand_2_id);
 J   DROP INDEX public.materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b;
       public            postgres    false    263            �           1259    31170 0   materials_roofcovertype_identifier_8eed0695_like    INDEX     �   CREATE INDEX materials_roofcovertype_identifier_8eed0695_like ON public.materials_roofcovertype USING btree (identifier varchar_pattern_ops);
 D   DROP INDEX public.materials_roofcovertype_identifier_8eed0695_like;
       public            postgres    false    278            �           1259    31169 *   materials_roofcovertype_name_e791d481_like    INDEX     �   CREATE INDEX materials_roofcovertype_name_e791d481_like ON public.materials_roofcovertype USING btree (name varchar_pattern_ops);
 >   DROP INDEX public.materials_roofcovertype_name_e791d481_like;
       public            postgres    false    278            �           1259    31201 "   materials_siding_brand_id_947adead    INDEX     c   CREATE INDEX materials_siding_brand_id_947adead ON public.materials_siding USING btree (brand_id);
 6   DROP INDEX public.materials_siding_brand_id_947adead;
       public            postgres    false    280            �           1259    31202 )   materials_siding_manufacturer_id_4bd6fcdc    INDEX     q   CREATE INDEX materials_siding_manufacturer_id_4bd6fcdc ON public.materials_siding USING btree (manufacturer_id);
 =   DROP INDEX public.materials_siding_manufacturer_id_4bd6fcdc;
       public            postgres    false    280            �           1259    31216 ,   materials_siding_use_materialuse_id_27444db6    INDEX     w   CREATE INDEX materials_siding_use_materialuse_id_27444db6 ON public.materials_siding_use USING btree (materialuse_id);
 @   DROP INDEX public.materials_siding_use_materialuse_id_27444db6;
       public            postgres    false    282            �           1259    31215 '   materials_siding_use_siding_id_a2f23e27    INDEX     m   CREATE INDEX materials_siding_use_siding_id_a2f23e27 ON public.materials_siding_use USING btree (siding_id);
 ;   DROP INDEX public.materials_siding_use_siding_id_a2f23e27;
       public            postgres    false    282            �           1259    31320 3   materials_stoneproductline_manufacturer_id_c1271051    INDEX     �   CREATE INDEX materials_stoneproductline_manufacturer_id_c1271051 ON public.materials_stoneproductline USING btree (manufacturer_id);
 G   DROP INDEX public.materials_stoneproductline_manufacturer_id_c1271051;
       public            postgres    false    288            �           1259    31334 6   materials_stoneproductline_use_materialuse_id_7e20150f    INDEX     �   CREATE INDEX materials_stoneproductline_use_materialuse_id_7e20150f ON public.materials_stoneproductline_use USING btree (materialuse_id);
 J   DROP INDEX public.materials_stoneproductline_use_materialuse_id_7e20150f;
       public            postgres    false    290            �           1259    31333 ;   materials_stoneproductline_use_stoneproductline_id_6477c585    INDEX     �   CREATE INDEX materials_stoneproductline_use_stoneproductline_id_6477c585 ON public.materials_stoneproductline_use USING btree (stoneproductline_id);
 O   DROP INDEX public.materials_stoneproductline_use_stoneproductline_id_6477c585;
       public            postgres    false    290            �           1259    31340 ,   materials_stoneunit_product_line_id_c1b449ac    INDEX     w   CREATE INDEX materials_stoneunit_product_line_id_c1b449ac ON public.materials_stoneunit USING btree (product_line_id);
 @   DROP INDEX public.materials_stoneunit_product_line_id_c1b449ac;
       public            postgres    false    292            k           1259    30894 1   names_decorativebrickface_brand_brand_id_92646ca6    INDEX     �   CREATE INDEX names_decorativebrickface_brand_brand_id_92646ca6 ON public.names_decorativebrickface_brand USING btree (brand_id);
 E   DROP INDEX public.names_decorativebrickface_brand_brand_id_92646ca6;
       public            postgres    false    259            l           1259    30893 ?   names_decorativebrickface_brand_decorativebrickface_id_f4bd2916    INDEX     �   CREATE INDEX names_decorativebrickface_brand_decorativebrickface_id_f4bd2916 ON public.names_decorativebrickface_brand USING btree (decorativebrickface_id);
 S   DROP INDEX public.names_decorativebrickface_brand_decorativebrickface_id_f4bd2916;
       public            postgres    false    259            I           1259    30859 )   standards_classb_identifier_9c57cd5d_like    INDEX     �   CREATE INDEX standards_classb_identifier_9c57cd5d_like ON public.standards_classb USING btree (identifier varchar_pattern_ops);
 =   DROP INDEX public.standards_classb_identifier_9c57cd5d_like;
       public            postgres    false    245            N           1259    30860 7   standards_classаveragedensity_identifier_4f590a03_like    INDEX     �   CREATE INDEX "standards_classаveragedensity_identifier_4f590a03_like" ON public."standards_classаveragedensity" USING btree (identifier varchar_pattern_ops);
 M   DROP INDEX public."standards_classаveragedensity_identifier_4f590a03_like";
       public            postgres    false    247            S           1259    30861 (   standards_markd_identifier_a2035296_like    INDEX     ~   CREATE INDEX standards_markd_identifier_a2035296_like ON public.standards_markd USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.standards_markd_identifier_a2035296_like;
       public            postgres    false    249            X           1259    30862 (   standards_markf_identifier_79848dc8_like    INDEX     ~   CREATE INDEX standards_markf_identifier_79848dc8_like ON public.standards_markf USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.standards_markf_identifier_79848dc8_like;
       public            postgres    false    251            ]           1259    30863 (   standards_markm_identifier_2b0b47b2_like    INDEX     ~   CREATE INDEX standards_markm_identifier_2b0b47b2_like ON public.standards_markm USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.standards_markm_identifier_2b0b47b2_like;
       public            postgres    false    253            b           1259    30864 )   standards_nfsize_identifier_625c4c07_like    INDEX     �   CREATE INDEX standards_nfsize_identifier_625c4c07_like ON public.standards_nfsize USING btree (identifier varchar_pattern_ops);
 =   DROP INDEX public.standards_nfsize_identifier_625c4c07_like;
       public            postgres    false    255            1           1259    30764 +   suppliers_activity_identifier_d8d3a5df_like    INDEX     �   CREATE INDEX suppliers_activity_identifier_d8d3a5df_like ON public.suppliers_activity USING btree (identifier varchar_pattern_ops);
 ?   DROP INDEX public.suppliers_activity_identifier_d8d3a5df_like;
       public            postgres    false    237            B           1259    30797 (   suppliers_manufacturer_brand_id_18bff0a3    INDEX     o   CREATE INDEX suppliers_manufacturer_brand_id_18bff0a3 ON public.suppliers_manufacturer USING btree (brand_id);
 <   DROP INDEX public.suppliers_manufacturer_brand_id_18bff0a3;
       public            postgres    false    243            C           1259    30798 '   suppliers_manufacturer_city_id_734a9037    INDEX     m   CREATE INDEX suppliers_manufacturer_city_id_734a9037 ON public.suppliers_manufacturer USING btree (city_id);
 ;   DROP INDEX public.suppliers_manufacturer_city_id_734a9037;
       public            postgres    false    243            D           1259    30796 )   suppliers_manufacturer_name_2cb797cf_like    INDEX     �   CREATE INDEX suppliers_manufacturer_name_2cb797cf_like ON public.suppliers_manufacturer USING btree (name varchar_pattern_ops);
 =   DROP INDEX public.suppliers_manufacturer_name_2cb797cf_like;
       public            postgres    false    243            6           1259    30770 %   suppliers_provider_name_99a51456_like    INDEX     x   CREATE INDEX suppliers_provider_name_99a51456_like ON public.suppliers_provider USING btree (name varchar_pattern_ops);
 9   DROP INDEX public.suppliers_provider_name_99a51456_like;
       public            postgres    false    239            ;           1259    30771 /   suppliers_provider_primary_activity_id_93261e15    INDEX     }   CREATE INDEX suppliers_provider_primary_activity_id_93261e15 ON public.suppliers_provider USING btree (primary_activity_id);
 C   DROP INDEX public.suppliers_provider_primary_activity_id_93261e15;
       public            postgres    false    239            >           1259    30785 :   suppliers_provider_secondary_activity_activity_id_31284a51    INDEX     �   CREATE INDEX suppliers_provider_secondary_activity_activity_id_31284a51 ON public.suppliers_provider_secondary_activity USING btree (activity_id);
 N   DROP INDEX public.suppliers_provider_secondary_activity_activity_id_31284a51;
       public            postgres    false    241            A           1259    30784 :   suppliers_provider_secondary_activity_provider_id_2fab0709    INDEX     �   CREATE INDEX suppliers_provider_secondary_activity_provider_id_2fab0709 ON public.suppliers_provider_secondary_activity USING btree (provider_id);
 N   DROP INDEX public.suppliers_provider_secondary_activity_provider_id_2fab0709;
       public            postgres    false    241            �           1259    31054 =   workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2    INDEX     �   CREATE INDEX workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2 ON public.workprices_pilegrillagefoundationworkprices USING btree (owner_id);
 Q   DROP INDEX public.workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2;
       public            postgres    false    272                       2606    31071 E   account_profile account_profile_city_id_207f6508_fk_geography_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_city_id_207f6508_fk_geography_city_id FOREIGN KEY (city_id) REFERENCES public.geography_city(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_city_id_207f6508_fk_geography_city_id;
       public          postgres    false    3108    231    274                        2606    31066 @   account_profile account_profile_user_id_bdd52018_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_user_id_bdd52018_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_user_id_bdd52018_fk_auth_user_id;
       public          postgres    false    3057    274    213            �           2606    30517 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    207    3044    211            �           2606    30512 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    209    211    3049            �           2606    30503 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    205    207    3039            �           2606    30532 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    215    209    3049            �           2606    30527 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3057    215    213            �           2606    30546 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    207    217    3044            �           2606    30541 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    3057    217    213            �           2606    30617 H   brands_subbrand_1 brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.brands_subbrand_1 DROP CONSTRAINT brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id;
       public          postgres    false    3081    223    221            �           2606    30624 H   brands_subbrand_2 brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su FOREIGN KEY (sub_brand_1_id) REFERENCES public.brands_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.brands_subbrand_2 DROP CONSTRAINT brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su;
       public          postgres    false    225    3087    223            �           2606    30720 <   catalog_plan catalog_plan_author_id_19443bad_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id;
       public          postgres    false    213    3057    235                       2606    31390 >   catalog_shell catalog_shell_author_id_c4c4abab_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_author_id_c4c4abab_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_author_id_c4c4abab_fk_auth_user_id;
       public          postgres    false    300    213    3057                       2606    31395 F   catalog_shell catalog_shell_roof_material_type_i_cecb1252_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_roof_material_type_i_cecb1252_fk_materials FOREIGN KEY (roof_material_type_id) REFERENCES public.materials_roofcovertype(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_roof_material_type_i_cecb1252_fk_materials;
       public          postgres    false    3236    300    278                       2606    31400 F   catalog_shell catalog_shell_socle_material_type__8b9c900c_fk_catalog_f    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_socle_material_type__8b9c900c_fk_catalog_f FOREIGN KEY (socle_material_type_id) REFERENCES public.catalog_facadematerialtype(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_socle_material_type__8b9c900c_fk_catalog_f;
       public          postgres    false    3283    300    298                       2606    31405 F   catalog_shell catalog_shell_wall_material_type_0_816c36ae_fk_catalog_f    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_wall_material_type_0_816c36ae_fk_catalog_f FOREIGN KEY (wall_material_type_0_id) REFERENCES public.catalog_facadematerialtype(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_wall_material_type_0_816c36ae_fk_catalog_f;
       public          postgres    false    3283    300    298            �           2606    30565 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3039    205    219            �           2606    30570 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    219    213    3057            �           2606    30669 G   geography_city geography_city_region_id_ea133d50_fk_geography_region_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.geography_city
    ADD CONSTRAINT geography_city_region_id_ea133d50_fk_geography_region_id FOREIGN KEY (region_id) REFERENCES public.geography_region(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.geography_city DROP CONSTRAINT geography_city_region_id_ea133d50_fk_geography_region_id;
       public          postgres    false    229    231    3106            �           2606    30662 M   geography_region geography_region_country_id_7b89c739_fk_geography_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_country_id_7b89c739_fk_geography_country_id FOREIGN KEY (country_id) REFERENCES public.geography_country(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_country_id_7b89c739_fk_geography_country_id;
       public          postgres    false    3098    227    229            �           2606    31019 Q   materialprices_insulationprice materialprices_insul_name_id_a70a0ae5_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insul_name_id_a70a0ae5_fk_materials FOREIGN KEY (name_id) REFERENCES public.materials_insulation(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.materialprices_insulationprice DROP CONSTRAINT materialprices_insul_name_id_a70a0ae5_fk_materials;
       public          postgres    false    265    269    3200            �           2606    31024 R   materialprices_insulationprice materialprices_insul_owner_id_ea647b28_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insul_owner_id_ea647b28_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.materialprices_insulationprice DROP CONSTRAINT materialprices_insul_owner_id_ea647b28_fk_auth_user;
       public          postgres    false    269    3057    213            �           2606    31007 W   materialprices_rockwallmaterialprice materialprices_rockw_name_id_5a769348_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockw_name_id_5a769348_fk_materials FOREIGN KEY (name_id) REFERENCES public.materials_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice DROP CONSTRAINT materialprices_rockw_name_id_5a769348_fk_materials;
       public          postgres    false    267    3195    263            �           2606    31012 X   materialprices_rockwallmaterialprice materialprices_rockw_owner_id_ea24bd0d_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockw_owner_id_ea24bd0d_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice DROP CONSTRAINT materialprices_rockw_owner_id_ea24bd0d_fk_auth_user;
       public          postgres    false    3057    267    213            �           2606    30985 N   materials_insulation materials_insulation_brand_id_dd7669b2_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_insulation
    ADD CONSTRAINT materials_insulation_brand_id_dd7669b2_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.materials_insulation DROP CONSTRAINT materials_insulation_brand_id_dd7669b2_fk_brands_brand_id;
       public          postgres    false    3081    221    265                       2606    31223 H   materials_plaster materials_plaster_brand_id_cc3e5323_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster
    ADD CONSTRAINT materials_plaster_brand_id_cc3e5323_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.materials_plaster DROP CONSTRAINT materials_plaster_brand_id_cc3e5323_fk_brands_brand_id;
       public          postgres    false    284    221    3081                       2606    31228 I   materials_plaster materials_plaster_manufacturer_id_060021cd_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster
    ADD CONSTRAINT materials_plaster_manufacturer_id_060021cd_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.materials_plaster DROP CONSTRAINT materials_plaster_manufacturer_id_060021cd_fk_suppliers;
       public          postgres    false    3144    243    284            	           2606    31242 O   materials_plaster_use materials_plaster_us_materialuse_id_3f0e40e1_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_us_materialuse_id_3f0e40e1_fk_materials FOREIGN KEY (materialuse_id) REFERENCES public.materials_materialuse(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.materials_plaster_use DROP CONSTRAINT materials_plaster_us_materialuse_id_3f0e40e1_fk_materials;
       public          postgres    false    3228    286    276                       2606    31237 K   materials_plaster_use materials_plaster_us_plaster_id_1ce61346_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_us_plaster_id_1ce61346_fk_materials FOREIGN KEY (plaster_id) REFERENCES public.materials_plaster(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.materials_plaster_use DROP CONSTRAINT materials_plaster_us_plaster_id_1ce61346_fk_materials;
       public          postgres    false    3250    284    286            �           2606    30919 V   materials_rockwallmaterialunit materials_rockwallma_algorithm_id_4183f114_fk_catalog_a    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_algorithm_id_4183f114_fk_catalog_a FOREIGN KEY (algorithm_id) REFERENCES public.catalog_algorithm(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_algorithm_id_4183f114_fk_catalog_a;
       public          postgres    false    263    233    3117            �           2606    30924 R   materials_rockwallmaterialunit materials_rockwallma_brand_id_4deb8894_fk_brands_br    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_brand_id_4deb8894_fk_brands_br FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_brand_id_4deb8894_fk_brands_br;
       public          postgres    false    221    263    3081            �           2606    30929 ^   materials_rockwallmaterialunit materials_rockwallma_class_average_densit_beb6fff9_fk_standards    FK CONSTRAINT       ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_class_average_densit_beb6fff9_fk_standards FOREIGN KEY (class_average_density_id) REFERENCES public."standards_classаveragedensity"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_class_average_densit_beb6fff9_fk_standards;
       public          postgres    false    247    263    3154            �           2606    30934 T   materials_rockwallmaterialunit materials_rockwallma_class_b_id_1de59e0b_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_class_b_id_1de59e0b_fk_standards FOREIGN KEY (class_b_id) REFERENCES public.standards_classb(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_class_b_id_1de59e0b_fk_standards;
       public          postgres    false    3149    245    263            �           2606    30939 Q   materials_rockwallmaterialunit materials_rockwallma_face_id_712ecb1a_fk_names_dec    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_face_id_712ecb1a_fk_names_dec FOREIGN KEY (face_id) REFERENCES public.names_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_face_id_712ecb1a_fk_names_dec;
       public          postgres    false    263    257    3176            �           2606    30944 Y   materials_rockwallmaterialunit materials_rockwallma_manufacturer_id_c1176543_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_manufacturer_id_c1176543_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_manufacturer_id_c1176543_fk_suppliers;
       public          postgres    false    3144    263    243            �           2606    30949 S   materials_rockwallmaterialunit materials_rockwallma_mark_d_id_e456d3f5_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_d_id_e456d3f5_fk_standards FOREIGN KEY (mark_d_id) REFERENCES public.standards_markd(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_mark_d_id_e456d3f5_fk_standards;
       public          postgres    false    263    3159    249            �           2606    30954 S   materials_rockwallmaterialunit materials_rockwallma_mark_f_id_48ec4578_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_f_id_48ec4578_fk_standards FOREIGN KEY (mark_f_id) REFERENCES public.standards_markf(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_mark_f_id_48ec4578_fk_standards;
       public          postgres    false    3164    263    251            �           2606    30959 S   materials_rockwallmaterialunit materials_rockwallma_mark_m_id_e96cf97b_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_m_id_e96cf97b_fk_standards FOREIGN KEY (mark_m_id) REFERENCES public.standards_markm(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_mark_m_id_e96cf97b_fk_standards;
       public          postgres    false    263    253    3169            �           2606    30964 X   materials_rockwallmaterialunit materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su FOREIGN KEY (sub_brand_1_id) REFERENCES public.brands_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su;
       public          postgres    false    263    3087    223            �           2606    30969 X   materials_rockwallmaterialunit materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su FOREIGN KEY (sub_brand_2_id) REFERENCES public.brands_subbrand_2(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su;
       public          postgres    false    3092    263    225                       2606    31191 F   materials_siding materials_siding_brand_id_947adead_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding
    ADD CONSTRAINT materials_siding_brand_id_947adead_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.materials_siding DROP CONSTRAINT materials_siding_brand_id_947adead_fk_brands_brand_id;
       public          postgres    false    280    3081    221                       2606    31196 G   materials_siding materials_siding_manufacturer_id_4bd6fcdc_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding
    ADD CONSTRAINT materials_siding_manufacturer_id_4bd6fcdc_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.materials_siding DROP CONSTRAINT materials_siding_manufacturer_id_4bd6fcdc_fk_suppliers;
       public          postgres    false    3144    243    280                       2606    31210 N   materials_siding_use materials_siding_use_materialuse_id_27444db6_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_materialuse_id_27444db6_fk_materials FOREIGN KEY (materialuse_id) REFERENCES public.materials_materialuse(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.materials_siding_use DROP CONSTRAINT materials_siding_use_materialuse_id_27444db6_fk_materials;
       public          postgres    false    276    3228    282                       2606    31205 S   materials_siding_use materials_siding_use_siding_id_a2f23e27_fk_materials_siding_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_siding_id_a2f23e27_fk_materials_siding_id FOREIGN KEY (siding_id) REFERENCES public.materials_siding(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_siding_use DROP CONSTRAINT materials_siding_use_siding_id_a2f23e27_fk_materials_siding_id;
       public          postgres    false    282    280    3240            
           2606    31315 U   materials_stoneproductline materials_stoneprodu_manufacturer_id_c1271051_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline
    ADD CONSTRAINT materials_stoneprodu_manufacturer_id_c1271051_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.materials_stoneproductline DROP CONSTRAINT materials_stoneprodu_manufacturer_id_c1271051_fk_suppliers;
       public          postgres    false    243    288    3144                       2606    31328 X   materials_stoneproductline_use materials_stoneprodu_materialuse_id_7e20150f_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneprodu_materialuse_id_7e20150f_fk_materials FOREIGN KEY (materialuse_id) REFERENCES public.materials_materialuse(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_stoneproductline_use DROP CONSTRAINT materials_stoneprodu_materialuse_id_7e20150f_fk_materials;
       public          postgres    false    3228    290    276                       2606    31323 ]   materials_stoneproductline_use materials_stoneprodu_stoneproductline_id_6477c585_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneprodu_stoneproductline_id_6477c585_fk_materials FOREIGN KEY (stoneproductline_id) REFERENCES public.materials_stoneproductline(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_stoneproductline_use DROP CONSTRAINT materials_stoneprodu_stoneproductline_id_6477c585_fk_materials;
       public          postgres    false    290    3259    288                       2606    31335 M   materials_stoneunit materials_stoneunit_product_line_id_c1b449ac_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneunit
    ADD CONSTRAINT materials_stoneunit_product_line_id_c1b449ac_fk_materials FOREIGN KEY (product_line_id) REFERENCES public.materials_stoneproductline(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.materials_stoneunit DROP CONSTRAINT materials_stoneunit_product_line_id_c1b449ac_fk_materials;
       public          postgres    false    292    3259    288            �           2606    30888 S   names_decorativebrickface_brand names_decorativebric_brand_id_92646ca6_fk_brands_br    FK CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebric_brand_id_92646ca6_fk_brands_br FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebric_brand_id_92646ca6_fk_brands_br;
       public          postgres    false    221    259    3081            �           2606    30883 _   names_decorativebrickface_brand names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec    FK CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec FOREIGN KEY (decorativebrickface_id) REFERENCES public.names_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec;
       public          postgres    false    259    3176    257            �           2606    30786 R   suppliers_manufacturer suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id;
       public          postgres    false    243    221    3081            �           2606    30791 S   suppliers_manufacturer suppliers_manufacturer_city_id_734a9037_fk_geography_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_city_id_734a9037_fk_geography_city_id FOREIGN KEY (city_id) REFERENCES public.geography_city(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_city_id_734a9037_fk_geography_city_id;
       public          postgres    false    3108    231    243            �           2606    30765 O   suppliers_provider suppliers_provider_primary_activity_id_93261e15_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_primary_activity_id_93261e15_fk_suppliers FOREIGN KEY (primary_activity_id) REFERENCES public.suppliers_activity(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.suppliers_provider DROP CONSTRAINT suppliers_provider_primary_activity_id_93261e15_fk_suppliers;
       public          postgres    false    237    239    3125            �           2606    30779 \   suppliers_provider_secondary_activity suppliers_provider_s_activity_id_31284a51_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_s_activity_id_31284a51_fk_suppliers FOREIGN KEY (activity_id) REFERENCES public.suppliers_activity(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_s_activity_id_31284a51_fk_suppliers;
       public          postgres    false    237    3125    241            �           2606    30774 \   suppliers_provider_secondary_activity suppliers_provider_s_provider_id_2fab0709_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_s_provider_id_2fab0709_fk_suppliers FOREIGN KEY (provider_id) REFERENCES public.suppliers_provider(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_s_provider_id_2fab0709_fk_suppliers;
       public          postgres    false    239    241    3130            �           2606    31049 _   workprices_pilegrillagefoundationworkprices workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices
    ADD CONSTRAINT workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices DROP CONSTRAINT workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user;
       public          postgres    false    272    213    3057            �      x�3��4�4�2��4R1z\\\ *      �      x�3�0���;.l���bW� wx	�      �      x������ � �      �   F	  x��Z_o��&?{mMR֟���D9�iɠ$�ק�s��H�-�r��]��裓؈���W �Qggg�3���8�����w3��8�U6���$*��Q>[V_q �����1L2~�͎s�ҏ,0E�$/��G�C�y�?0���[����X,��,H�5� �s���c��O`�A�Z}d�Q��q5_�):���w�|O~$�>�C�ĺb �}���y���g����-��|t��зc��8��rЎ<�ϖ�֢�Wgyp��#�$���L	������?�O���ظ�z���G��S���n1�g���Ƚ���W-����/���u}�<���E}е�<�W���i�����B�z�9�,�����w��+��`w�7��~�<������~�_՗`�_C�����(�0��;�Y߆F���4f��ں�hU0����k.����fa�ی�E��x�U4�#����´s0����k@��0ȯ�߳�C��sT�����F=W���l�����V��"�M�t(��#EkIG2�{�RfZ���ν(1��ЪH���
f�-,�o�K��yq�s�N���p��E�)�X��j>>y���i�̫"+W�b�� ݗ���Ah�}G�$�G`�w_~̸��)濑��iA>b�&�Ū̖Jc{R7�Qθ�T�-v�	n�5t���m���qAޮ��F���b�fd�eq^,�W���ڔ��@��~S5Z����ui��b�~��	x`�>����yZ����D�9�=SO΋	�%���އ��tt�>�������0��C|�T�5ve'�w���4����NV�"z*Tw>ʟ�yjYwJJ���lT�=I�T����/a��O-�
w&})���g	,����,��l:P�d	��'��5vW��n��7GR�����J�`������ԪM8�h�&�K��o�V�@
� �D"N���"�ː@��!�����t%R?�F�K�P�	lt�vT�z?����̴4�R*�nKӷhK���ts��D���A���/�D�p��¿�Á���l�懙�}���l���Pvb>#�9b&�����eDI8LvF�m܈�,��6s#�ގ����L�����7�jުr�U�~�3Wi�ھ�פk�[��c�;P�'�b��?�Z$�����y��y~T���<JI�L�Sr�H��L�k�:���3�/�;8S��ps�h�`=��JD�n��e�X�#��;͌f��T͝�FEɒ��N;��d����j9\��L�F�(lC��l���y^e��$�-�Z�z[��D���|�%;��y�6����u���`e��=P>�yw�:HL�V�LTs׶e�
�@�vKA�.���(��}>�~ZU�7)�(\eu�� �!L�$�C��J��؅��@Q��)�B�fH�z3�}�����-�dQ*�`[�fq(��B[O�i�O��7��V��� �M�l�(~���<������Bj�ς�n-�&���|�fZ�_U��gJ��َ*��g���)4ςd�=�9MW�Hy�ԑ��ژ��b}�`[p�`\�>u(�Y�h���`�뜙�:�α�!z��6��SC3�fw�ơ��ˈ�$�����P���hI��,�L�UI�9a^��k\ɶ-i�i��&Լ1u���[>+���*�������:A���&���0G,�=��A?�'�`f�'�������9��`7���!Hq��k"�r.Mby;ĀεH�/�L\|��.��ϧ�x���KSR����{>y��i�P����1k�M���1"��&����ˬ����W��#�:jj5C�hS��	���j͐VI�e����	�[D��B67�m�Fh�9/m��ˆ�������l5`g����Sa��1�#],���Lmo�ɤu'k{/N�e�;�f��*�"/�GyV��h���p1OV�eT3���[�� �&Dc?a{!��S��~���|'����tվ�Ϫ֢� $Hus�?���]�� �da&&c*dA�M��s;Ax�A���� ��P����Bk�������cv�8u7��3��by���a��"���9eH��%M�o�Sx'0��7���E��o7�pЋe4+��Ruesk##�jՕЭ���+VW:YOS-�m���K=P3AZ*�@����\CV�r�9�
���k!*�b�oɃ���f,�1�I'nh��Q���5~�FU�\������]�_�.�[��B٢��խ�n���8��f��ʹSy�!M��U�rT���F��S�O�ٮ����Ʒ��&ubu��h^p_�U7��Gy	�չ�h*3ɉM�?���z�&.�>�K/d��/�0�?7�9       �   z  x�u��N�@���S��@f�����ʥ��$$��"
�-�@���!Hԅx��9]��,O�s��3����719$C&.o�&�̲�lT=n�/�-�N�]�7Øe��\�4sEflbCwU�$��3�!�qH�X�"��P�B��+��otl��`M��g���]��[���� L�@tn��Q�C�8),3�No���n�bG�q�rRz�d�S�{V�Z���!^J�V)k�LID��g�Ȫ�HR��B)�HB�]{0>�����3�tGG�/GR� �!�C35�-��V.ן:�i��o;yA+���b��U�]S�ZK���>�t�u��.�/�<0�=O�Y+�TAI�ɼ���H��,��      �      x�3�4�4�2�4�1z\\\ 	      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   2  x�͗�n�0Ư���r�&��S/&�b�"����f]�w��e�v�>|��9�3I��:���\������*���|�
E�Id�}�|�f��^u��uȴnߺj��퓻�R��Q��NSm�#�̇�����|��l~>�|>?_`���/1_Fq�Di�Je�.�-�bA"�h���V[�E���/Acr�u��[5\̋Jm�n�a%(X0��Oa�8��K`�$�ŗ�8�%�^^.j��8�`��e�8�%X�� �R,XF�x�nĞ�b�K<��N@��p�!�:ٟ��)Ə����I���~Ƅ�ݫ��qG�޸C~�TʫҮ��t헙WnL��3B�x/�M�<�a�-�_#��C[����b~}[����*/T���	����'d�<Y2�(���n��Хӫ�21��d�<���PǦͅ2~��&�����,i�{��:��>��iWc�5��#W.�ޓ�o��~=4��P��9�B޲?�E�WeQޡJ�ʹ��@m8���v_t�Y��������Űi.bq<��,����/d$�      �      x������ � �      �   �  x����jQǯ7O��J�=����s'^TA��˶H4�$)*���Bo��/�'���Z_�䍜�h����JK'K��o�?sf1" �=O&F�R{��< �h1}o:�E��헯;��n����^?tG�s����
!?$�*�O�^��Y��[Te��@眬 e��K6K� 7�E`�l���Ҹ�1��F�0�t�������v��3�$�Su=���I����3�Gӽ��t7L��U�"��'H�1wT݁��3��yH�C)�4(|�}/O2G�*���l���T����w7�!��&-�Z��E(M�m����eӏM*�U�+@kJ����r�Q���.�B"� �\տO�M�X!j��r 	�9��!g���A�T����@��B�z/�[��"7��ʪ(z`3�&�
3nX{�p~��<���k�%
PZ��,�	�t��g2��O���ó�>��k�3x>�:7�������L�9,�������N�ҷ���:���\��V$��L]86��r��\<��F��g�8�R
��\�K��,.<}����pV�R|/��p�S�U��\5�HR�n��drҕ����\����d�" Y����!a�������q:���]��Ơ��^%��3�h�8���9zE�Z�����      �   �  x�}�o�� �?��tv�ݥ3ٖ&<����G�#�B�	�v�)�ӓy��p��W.L�S��Q��I-g�l���N���}��"lU|��t]���S��u{�cB9G��B��4����F��O�ЃިE��U�ݙ��uEc��o��J��	���sv�n&t�8/��Ya��Ŧ+趢��bOo+:�ϣ4�x���Da����2v.���4����uT]���f��9we�K��ߠc��Y�y�>D�B]��Y\�+��4��;0�+��s����f�l+Ō�,~v/h�A3�C�����X8>�|_��e
�f�{�ϗB���_�Eb1E�宇�|
�����)j���>��%�M[�f���ұ�����v��]ݰ�����
Ln�����I��O�zj�Dͱbu�5���|����lE�ֱ���W\�k��N����r_��Q�9? �'��~v      �   <  x����n�8ů�S�~Ud{��e%�%n�� k̷����&$$T��s~>��i�}p}��M!���oCk��F>|P�NEM�J�)P��7V�9|?W��E�pj��
)%0%�*a���ӟ�w��3��`��Ϩ0�ʀ+u�6�z��٣i���� �X�P`Udɇ���Ͳ`�������$��ǌ��ft��NSt��dL��#��K�Iz%�B�'�s'�vO!��H�V
��Ŀ�f�/�����q���b�-~���\a�
])��wn�nJ���~�Tȵ9�b��ڃ��R���7'7M��[�5�1��w�y�fH��WR���K(�J珊��u��<��� 1*W5�93���|Ӑ��h�q�#FU��mx:?��u�ٿ.�n8z;~�_�)�$X��鹈FQV���q�Z�_0ɔ�����ˬ���@��X�����9D�	����2��_�^g|�cy0F���"ᠳ[�"F�����5־J�d1��M��*�P�Q�T����yu�J+N����k�a�ÞJ|0�Ne�?�KN��9�M�0sp�˝��vn_,�J-�vGv��獲�9*U)	H���8����i?q�H����Y����1N<�~��[|�S&�}}:���8��w��07�k���Ŕ��)��/	'\eSlk��tZ7xÓj��*+�u���Y����	�'��ݑ@�rb���>p׾��λ�׀~DɈ�b�P�1��`�N�G�R*V-(�E�7B�!D*�R��42@m�!U8�V�x�����8���.�m�b���܅���ۭW���w����?�L��      �   �  x���ˎ�@��u{�;���8X$���H M-��F@)*�T]�����p�&_�$����)��ǩ�!8���K���d��X�7:$uOC�0��p��j�$�ެ<��GP�	�N#gڸ�Jó嵔��^��:D�jSy�W=��Q��S�6oi�D�FF��}��g��b�l̺�<D�=��p�0�w�4X�wm��<��6����?�vk�r��1�<��Ϧ/��@52k�ԮI�΢D1�љ�K�i]T�D��k
jGz�yÀA�4G�����ԗ!�@f(��������;��0�#z�kz/;t��6Z� �1ҭ�]6u׶�]*n.�e6(+W�l&Z�/^vXsDl��vP�KGǾ�����\J�p)9;q�����405D��������x�}/f��?����      �      x�3�0�ہx��NC����� ��
v      �      x�3估�¾��/������� sL	w      �   $   x�3估��M@�p�D_��ih�i����� q_      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   U   x�3�0��֋M6\���.�y�^�a�Ŷ8sSKs�K2sR��8/L������.l�د��4-'�"3)'�:F��� �J5\      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     