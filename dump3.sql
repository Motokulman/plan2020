toc.dat                                                                                             0000600 0004000 0002000 00000553663 13672302352 0014464 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           2                x         	   postgres2    12.0    12.0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    30427 	   postgres2    DATABASE     �   CREATE DATABASE postgres2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE postgres2;
                postgres    false                    1259    31058    account_profile    TABLE     �   CREATE TABLE public.account_profile (
    id integer NOT NULL,
    photo character varying(100) NOT NULL,
    user_id integer NOT NULL,
    city_id integer
);
 #   DROP TABLE public.account_profile;
       public         heap    postgres    false                    1259    31056    account_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.account_profile_id_seq;
       public          postgres    false    274         �           0    0    account_profile_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.account_profile_id_seq OWNED BY public.account_profile.id;
          public          postgres    false    273         �            1259    30459 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false         �            1259    30457    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209         �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208         �            1259    30469    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false         �            1259    30467    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211         �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210         �            1259    30451    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false         �            1259    30449    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207         �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206         �            1259    30477 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    postgres    false         �            1259    30487    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false         �            1259    30485    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215         �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214         �            1259    30475    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213         �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212         �            1259    30495    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false         �            1259    30493 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217         �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216         �            1259    30588    brands_brand    TABLE     h   CREATE TABLE public.brands_brand (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
     DROP TABLE public.brands_brand;
       public         heap    postgres    false         �            1259    30586    brands_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.brands_brand_id_seq;
       public          postgres    false    221                     0    0    brands_brand_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.brands_brand_id_seq OWNED BY public.brands_brand.id;
          public          postgres    false    220         �            1259    30598    brands_subbrand_1    TABLE     �   CREATE TABLE public.brands_subbrand_1 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    brand_id integer
);
 %   DROP TABLE public.brands_subbrand_1;
       public         heap    postgres    false         �            1259    30596    brands_subbrand_1_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_subbrand_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.brands_subbrand_1_id_seq;
       public          postgres    false    223                    0    0    brands_subbrand_1_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.brands_subbrand_1_id_seq OWNED BY public.brands_subbrand_1.id;
          public          postgres    false    222         �            1259    30608    brands_subbrand_2    TABLE     �   CREATE TABLE public.brands_subbrand_2 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    sub_brand_1_id integer NOT NULL
);
 %   DROP TABLE public.brands_subbrand_2;
       public         heap    postgres    false         �            1259    30606    brands_subbrand_2_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_subbrand_2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.brands_subbrand_2_id_seq;
       public          postgres    false    225                    0    0    brands_subbrand_2_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.brands_subbrand_2_id_seq OWNED BY public.brands_subbrand_2.id;
          public          postgres    false    224         �            1259    30677    catalog_algorithm    TABLE     �   CREATE TABLE public.catalog_algorithm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 %   DROP TABLE public.catalog_algorithm;
       public         heap    postgres    false         �            1259    30675    catalog_algorithm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_algorithm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.catalog_algorithm_id_seq;
       public          postgres    false    233                    0    0    catalog_algorithm_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.catalog_algorithm_id_seq OWNED BY public.catalog_algorithm.id;
          public          postgres    false    232         *           1259    31373    catalog_facadematerialtype    TABLE     �   CREATE TABLE public.catalog_facadematerialtype (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    identifier character varying(20) NOT NULL
);
 .   DROP TABLE public.catalog_facadematerialtype;
       public         heap    postgres    false         )           1259    31371 !   catalog_facadematerialtype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_facadematerialtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.catalog_facadematerialtype_id_seq;
       public          postgres    false    298                    0    0 !   catalog_facadematerialtype_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.catalog_facadematerialtype_id_seq OWNED BY public.catalog_facadematerialtype.id;
          public          postgres    false    297         �            1259    30697    catalog_plan    TABLE     �   CREATE TABLE public.catalog_plan (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    scheme jsonb,
    checked boolean NOT NULL,
    author_id integer
);
     DROP TABLE public.catalog_plan;
       public         heap    postgres    false         �            1259    30695    catalog_plan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.catalog_plan_id_seq;
       public          postgres    false    235                    0    0    catalog_plan_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_plan_id_seq OWNED BY public.catalog_plan.id;
          public          postgres    false    234         ,           1259    31383    catalog_shell    TABLE     �  CREATE TABLE public.catalog_shell (
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
       public         heap    postgres    false         +           1259    31381    catalog_shell_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_shell_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_shell_id_seq;
       public          postgres    false    300                    0    0    catalog_shell_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_shell_id_seq OWNED BY public.catalog_shell.id;
          public          postgres    false    299         �            1259    30555    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false         �            1259    30553    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    219                    0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    218         �            1259    30441    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false         �            1259    30439    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205                    0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204         �            1259    30430    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false         �            1259    30428    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203         	           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202                    1259    31031    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false         �            1259    30655    geography_city    TABLE     �   CREATE TABLE public.geography_city (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    heating_period_duration integer,
    heating_period_temperature double precision,
    region_id integer
);
 "   DROP TABLE public.geography_city;
       public         heap    postgres    false         �            1259    30653    geography_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.geography_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.geography_city_id_seq;
       public          postgres    false    231         
           0    0    geography_city_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.geography_city_id_seq OWNED BY public.geography_city.id;
          public          postgres    false    230         �            1259    30633    geography_country    TABLE     d   CREATE TABLE public.geography_country (
    id integer NOT NULL,
    name character varying(200)
);
 %   DROP TABLE public.geography_country;
       public         heap    postgres    false         �            1259    30631    geography_country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.geography_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.geography_country_id_seq;
       public          postgres    false    227                    0    0    geography_country_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.geography_country_id_seq OWNED BY public.geography_country.id;
          public          postgres    false    226         �            1259    30643    geography_region    TABLE     �   CREATE TABLE public.geography_region (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    code integer,
    country_id integer
);
 $   DROP TABLE public.geography_region;
       public         heap    postgres    false         �            1259    30641    geography_region_id_seq    SEQUENCE     �   CREATE SEQUENCE public.geography_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.geography_region_id_seq;
       public          postgres    false    229                    0    0    geography_region_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.geography_region_id_seq OWNED BY public.geography_region.id;
          public          postgres    false    228                    1259    31001    materialprices_insulationprice    TABLE     �   CREATE TABLE public.materialprices_insulationprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 2   DROP TABLE public.materialprices_insulationprice;
       public         heap    postgres    false                    1259    30999 %   materialprices_insulationprice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materialprices_insulationprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.materialprices_insulationprice_id_seq;
       public          postgres    false    269                    0    0 %   materialprices_insulationprice_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.materialprices_insulationprice_id_seq OWNED BY public.materialprices_insulationprice.id;
          public          postgres    false    268                    1259    30993 $   materialprices_rockwallmaterialprice    TABLE     �   CREATE TABLE public.materialprices_rockwallmaterialprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 8   DROP TABLE public.materialprices_rockwallmaterialprice;
       public         heap    postgres    false         
           1259    30991 +   materialprices_rockwallmaterialprice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materialprices_rockwallmaterialprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.materialprices_rockwallmaterialprice_id_seq;
       public          postgres    false    267                    0    0 +   materialprices_rockwallmaterialprice_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.materialprices_rockwallmaterialprice_id_seq OWNED BY public.materialprices_rockwallmaterialprice.id;
          public          postgres    false    266                    1259    30897    materials_bulksand    TABLE     �   CREATE TABLE public.materials_bulksand (
    id integer NOT NULL,
    name character varying(6) NOT NULL,
    weight integer NOT NULL
);
 &   DROP TABLE public.materials_bulksand;
       public         heap    postgres    false                    1259    30895    materials_bulksand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_bulksand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.materials_bulksand_id_seq;
       public          postgres    false    261                    0    0    materials_bulksand_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.materials_bulksand_id_seq OWNED BY public.materials_bulksand.id;
          public          postgres    false    260         &           1259    31351    materials_flexibletile    TABLE     �   CREATE TABLE public.materials_flexibletile (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    texture character varying(200) NOT NULL
);
 *   DROP TABLE public.materials_flexibletile;
       public         heap    postgres    false         %           1259    31349    materials_flexibletile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_flexibletile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.materials_flexibletile_id_seq;
       public          postgres    false    294                    0    0    materials_flexibletile_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.materials_flexibletile_id_seq OWNED BY public.materials_flexibletile.id;
          public          postgres    false    293         	           1259    30913    materials_insulation    TABLE     �   CREATE TABLE public.materials_insulation (
    id integer NOT NULL,
    thermal_conductivity double precision,
    mat_type character varying(9) NOT NULL,
    thick character varying(3) NOT NULL,
    brand_id integer
);
 (   DROP TABLE public.materials_insulation;
       public         heap    postgres    false                    1259    30911    materials_insulation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_insulation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.materials_insulation_id_seq;
       public          postgres    false    265                    0    0    materials_insulation_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.materials_insulation_id_seq OWNED BY public.materials_insulation.id;
          public          postgres    false    264                    1259    31079    materials_materialuse    TABLE     �   CREATE TABLE public.materials_materialuse (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    identifier character varying(200) NOT NULL
);
 )   DROP TABLE public.materials_materialuse;
       public         heap    postgres    false                    1259    31077    materials_materialuse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_materialuse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.materials_materialuse_id_seq;
       public          postgres    false    276                    0    0    materials_materialuse_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.materials_materialuse_id_seq OWNED BY public.materials_materialuse.id;
          public          postgres    false    275         (           1259    31361    materials_metaltile    TABLE     �   CREATE TABLE public.materials_metaltile (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    texture character varying(200) NOT NULL
);
 '   DROP TABLE public.materials_metaltile;
       public         heap    postgres    false         '           1259    31359    materials_metaltile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_metaltile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.materials_metaltile_id_seq;
       public          postgres    false    296                    0    0    materials_metaltile_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.materials_metaltile_id_seq OWNED BY public.materials_metaltile.id;
          public          postgres    false    295                    1259    31139    materials_plaster    TABLE     �   CREATE TABLE public.materials_plaster (
    id integer NOT NULL,
    texture character varying(200) NOT NULL,
    brand_id integer,
    manufacturer_id integer
);
 %   DROP TABLE public.materials_plaster;
       public         heap    postgres    false                    1259    31137    materials_plaster_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_plaster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.materials_plaster_id_seq;
       public          postgres    false    284                    0    0    materials_plaster_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.materials_plaster_id_seq OWNED BY public.materials_plaster.id;
          public          postgres    false    283                    1259    31147    materials_plaster_use    TABLE     �   CREATE TABLE public.materials_plaster_use (
    id integer NOT NULL,
    plaster_id integer NOT NULL,
    materialuse_id integer NOT NULL
);
 )   DROP TABLE public.materials_plaster_use;
       public         heap    postgres    false                    1259    31145    materials_plaster_use_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_plaster_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.materials_plaster_use_id_seq;
       public          postgres    false    286                    0    0    materials_plaster_use_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.materials_plaster_use_id_seq OWNED BY public.materials_plaster_use.id;
          public          postgres    false    285                    1259    30905    materials_rockwallmaterialunit    TABLE     j  CREATE TABLE public.materials_rockwallmaterialunit (
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
       public         heap    postgres    false                    1259    30903 %   materials_rockwallmaterialunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_rockwallmaterialunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.materials_rockwallmaterialunit_id_seq;
       public          postgres    false    263                    0    0 %   materials_rockwallmaterialunit_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.materials_rockwallmaterialunit_id_seq OWNED BY public.materials_rockwallmaterialunit.id;
          public          postgres    false    262                    1259    31087    materials_roofcovertype    TABLE     �   CREATE TABLE public.materials_roofcovertype (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    identifier character varying(200) NOT NULL
);
 +   DROP TABLE public.materials_roofcovertype;
       public         heap    postgres    false                    1259    31085    materials_roofcovertype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_roofcovertype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.materials_roofcovertype_id_seq;
       public          postgres    false    278                    0    0    materials_roofcovertype_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.materials_roofcovertype_id_seq OWNED BY public.materials_roofcovertype.id;
          public          postgres    false    277                    1259    31115    materials_siding    TABLE     �   CREATE TABLE public.materials_siding (
    id integer NOT NULL,
    material character varying(20) NOT NULL,
    alternative_name character varying(20),
    texture character varying(200) NOT NULL,
    brand_id integer,
    manufacturer_id integer
);
 $   DROP TABLE public.materials_siding;
       public         heap    postgres    false                    1259    31113    materials_siding_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_siding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.materials_siding_id_seq;
       public          postgres    false    280                    0    0    materials_siding_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.materials_siding_id_seq OWNED BY public.materials_siding.id;
          public          postgres    false    279                    1259    31123    materials_siding_use    TABLE     �   CREATE TABLE public.materials_siding_use (
    id integer NOT NULL,
    siding_id integer NOT NULL,
    materialuse_id integer NOT NULL
);
 (   DROP TABLE public.materials_siding_use;
       public         heap    postgres    false                    1259    31121    materials_siding_use_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_siding_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.materials_siding_use_id_seq;
       public          postgres    false    282                    0    0    materials_siding_use_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.materials_siding_use_id_seq OWNED BY public.materials_siding_use.id;
          public          postgres    false    281                     1259    31293    materials_stoneproductline    TABLE     �   CREATE TABLE public.materials_stoneproductline (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    manufacturer_id integer
);
 .   DROP TABLE public.materials_stoneproductline;
       public         heap    postgres    false                    1259    31291 !   materials_stoneproductline_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_stoneproductline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.materials_stoneproductline_id_seq;
       public          postgres    false    288                    0    0 !   materials_stoneproductline_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.materials_stoneproductline_id_seq OWNED BY public.materials_stoneproductline.id;
          public          postgres    false    287         "           1259    31301    materials_stoneproductline_use    TABLE     �   CREATE TABLE public.materials_stoneproductline_use (
    id integer NOT NULL,
    stoneproductline_id integer NOT NULL,
    materialuse_id integer NOT NULL
);
 2   DROP TABLE public.materials_stoneproductline_use;
       public         heap    postgres    false         !           1259    31299 %   materials_stoneproductline_use_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_stoneproductline_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.materials_stoneproductline_use_id_seq;
       public          postgres    false    290                    0    0 %   materials_stoneproductline_use_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.materials_stoneproductline_use_id_seq OWNED BY public.materials_stoneproductline_use.id;
          public          postgres    false    289         $           1259    31309    materials_stoneunit    TABLE     �   CREATE TABLE public.materials_stoneunit (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    texture character varying(200) NOT NULL,
    product_line_id integer
);
 '   DROP TABLE public.materials_stoneunit;
       public         heap    postgres    false         #           1259    31307    materials_stoneunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_stoneunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.materials_stoneunit_id_seq;
       public          postgres    false    292                    0    0    materials_stoneunit_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.materials_stoneunit_id_seq OWNED BY public.materials_stoneunit.id;
          public          postgres    false    291                    1259    30867    names_decorativebrickface    TABLE     u   CREATE TABLE public.names_decorativebrickface (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
 -   DROP TABLE public.names_decorativebrickface;
       public         heap    postgres    false                    1259    30875    names_decorativebrickface_brand    TABLE     �   CREATE TABLE public.names_decorativebrickface_brand (
    id integer NOT NULL,
    decorativebrickface_id integer NOT NULL,
    brand_id integer NOT NULL
);
 3   DROP TABLE public.names_decorativebrickface_brand;
       public         heap    postgres    false                    1259    30873 &   names_decorativebrickface_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.names_decorativebrickface_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.names_decorativebrickface_brand_id_seq;
       public          postgres    false    259                    0    0 &   names_decorativebrickface_brand_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.names_decorativebrickface_brand_id_seq OWNED BY public.names_decorativebrickface_brand.id;
          public          postgres    false    258                     1259    30865     names_decorativebrickface_id_seq    SEQUENCE     �   CREATE SEQUENCE public.names_decorativebrickface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.names_decorativebrickface_id_seq;
       public          postgres    false    257                    0    0     names_decorativebrickface_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.names_decorativebrickface_id_seq OWNED BY public.names_decorativebrickface.id;
          public          postgres    false    256         �            1259    30801    standards_classb    TABLE     �   CREATE TABLE public.standards_classb (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 $   DROP TABLE public.standards_classb;
       public         heap    postgres    false         �            1259    30799    standards_classb_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_classb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.standards_classb_id_seq;
       public          postgres    false    245                    0    0    standards_classb_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.standards_classb_id_seq OWNED BY public.standards_classb.id;
          public          postgres    false    244         �            1259    30811    standards_classаveragedensity    TABLE     �   CREATE TABLE public."standards_classаveragedensity" (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 4   DROP TABLE public."standards_classаveragedensity";
       public         heap    postgres    false         �            1259    30809 %   standards_classаveragedensity_id_seq    SEQUENCE     �   CREATE SEQUENCE public."standards_classаveragedensity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."standards_classаveragedensity_id_seq";
       public          postgres    false    247                     0    0 %   standards_classаveragedensity_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."standards_classаveragedensity_id_seq" OWNED BY public."standards_classаveragedensity".id;
          public          postgres    false    246         �            1259    30821    standards_markd    TABLE     �   CREATE TABLE public.standards_markd (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 #   DROP TABLE public.standards_markd;
       public         heap    postgres    false         �            1259    30819    standards_markd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_markd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.standards_markd_id_seq;
       public          postgres    false    249         !           0    0    standards_markd_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.standards_markd_id_seq OWNED BY public.standards_markd.id;
          public          postgres    false    248         �            1259    30831    standards_markf    TABLE     �   CREATE TABLE public.standards_markf (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 #   DROP TABLE public.standards_markf;
       public         heap    postgres    false         �            1259    30829    standards_markf_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_markf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.standards_markf_id_seq;
       public          postgres    false    251         "           0    0    standards_markf_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.standards_markf_id_seq OWNED BY public.standards_markf.id;
          public          postgres    false    250         �            1259    30841    standards_markm    TABLE     �   CREATE TABLE public.standards_markm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 #   DROP TABLE public.standards_markm;
       public         heap    postgres    false         �            1259    30839    standards_markm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_markm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.standards_markm_id_seq;
       public          postgres    false    253         #           0    0    standards_markm_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.standards_markm_id_seq OWNED BY public.standards_markm.id;
          public          postgres    false    252         �            1259    30851    standards_nfsize    TABLE     �   CREATE TABLE public.standards_nfsize (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    greater_bed_size integer,
    minor_bed_size integer,
    height integer
);
 $   DROP TABLE public.standards_nfsize;
       public         heap    postgres    false         �            1259    30849    standards_nfsize_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_nfsize_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.standards_nfsize_id_seq;
       public          postgres    false    255         $           0    0    standards_nfsize_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.standards_nfsize_id_seq OWNED BY public.standards_nfsize.id;
          public          postgres    false    254         �            1259    30728    suppliers_activity    TABLE     �   CREATE TABLE public.suppliers_activity (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 &   DROP TABLE public.suppliers_activity;
       public         heap    postgres    false         �            1259    30726    suppliers_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.suppliers_activity_id_seq;
       public          postgres    false    237         %           0    0    suppliers_activity_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.suppliers_activity_id_seq OWNED BY public.suppliers_activity.id;
          public          postgres    false    236         �            1259    30756    suppliers_manufacturer    TABLE     �   CREATE TABLE public.suppliers_manufacturer (
    id integer NOT NULL,
    alias character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    brand_id integer,
    city_id integer
);
 *   DROP TABLE public.suppliers_manufacturer;
       public         heap    postgres    false         �            1259    30754    suppliers_manufacturer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.suppliers_manufacturer_id_seq;
       public          postgres    false    243         &           0    0    suppliers_manufacturer_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.suppliers_manufacturer_id_seq OWNED BY public.suppliers_manufacturer.id;
          public          postgres    false    242         �            1259    30738    suppliers_provider    TABLE     �   CREATE TABLE public.suppliers_provider (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    primary_activity_id integer
);
 &   DROP TABLE public.suppliers_provider;
       public         heap    postgres    false         �            1259    30736    suppliers_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.suppliers_provider_id_seq;
       public          postgres    false    239         '           0    0    suppliers_provider_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.suppliers_provider_id_seq OWNED BY public.suppliers_provider.id;
          public          postgres    false    238         �            1259    30748 %   suppliers_provider_secondary_activity    TABLE     �   CREATE TABLE public.suppliers_provider_secondary_activity (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    activity_id integer NOT NULL
);
 9   DROP TABLE public.suppliers_provider_secondary_activity;
       public         heap    postgres    false         �            1259    30746 ,   suppliers_provider_secondary_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_provider_secondary_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.suppliers_provider_secondary_activity_id_seq;
       public          postgres    false    241         (           0    0 ,   suppliers_provider_secondary_activity_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.suppliers_provider_secondary_activity_id_seq OWNED BY public.suppliers_provider_secondary_activity.id;
          public          postgres    false    240                    1259    31043 +   workprices_pilegrillagefoundationworkprices    TABLE     �  CREATE TABLE public.workprices_pilegrillagefoundationworkprices (
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
       public         heap    postgres    false                    1259    31041 2   workprices_pilegrillagefoundationworkprices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq;
       public          postgres    false    272         )           0    0 2   workprices_pilegrillagefoundationworkprices_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq OWNED BY public.workprices_pilegrillagefoundationworkprices.id;
          public          postgres    false    271         �           2604    31061    account_profile id    DEFAULT     x   ALTER TABLE ONLY public.account_profile ALTER COLUMN id SET DEFAULT nextval('public.account_profile_id_seq'::regclass);
 A   ALTER TABLE public.account_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    274    273    274         �           2604    30462    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209         �           2604    30472    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211         �           2604    30454    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207         �           2604    30480    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213         �           2604    30490    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215         �           2604    30498    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217         �           2604    30591    brands_brand id    DEFAULT     r   ALTER TABLE ONLY public.brands_brand ALTER COLUMN id SET DEFAULT nextval('public.brands_brand_id_seq'::regclass);
 >   ALTER TABLE public.brands_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221         �           2604    30601    brands_subbrand_1 id    DEFAULT     |   ALTER TABLE ONLY public.brands_subbrand_1 ALTER COLUMN id SET DEFAULT nextval('public.brands_subbrand_1_id_seq'::regclass);
 C   ALTER TABLE public.brands_subbrand_1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223         �           2604    30611    brands_subbrand_2 id    DEFAULT     |   ALTER TABLE ONLY public.brands_subbrand_2 ALTER COLUMN id SET DEFAULT nextval('public.brands_subbrand_2_id_seq'::regclass);
 C   ALTER TABLE public.brands_subbrand_2 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225         �           2604    30680    catalog_algorithm id    DEFAULT     |   ALTER TABLE ONLY public.catalog_algorithm ALTER COLUMN id SET DEFAULT nextval('public.catalog_algorithm_id_seq'::regclass);
 C   ALTER TABLE public.catalog_algorithm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233         �           2604    31376    catalog_facadematerialtype id    DEFAULT     �   ALTER TABLE ONLY public.catalog_facadematerialtype ALTER COLUMN id SET DEFAULT nextval('public.catalog_facadematerialtype_id_seq'::regclass);
 L   ALTER TABLE public.catalog_facadematerialtype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    298    297    298         �           2604    30700    catalog_plan id    DEFAULT     r   ALTER TABLE ONLY public.catalog_plan ALTER COLUMN id SET DEFAULT nextval('public.catalog_plan_id_seq'::regclass);
 >   ALTER TABLE public.catalog_plan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235         �           2604    31386    catalog_shell id    DEFAULT     t   ALTER TABLE ONLY public.catalog_shell ALTER COLUMN id SET DEFAULT nextval('public.catalog_shell_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_shell ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    299    300    300         �           2604    30558    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219         �           2604    30444    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205         �           2604    30433    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203         �           2604    30658    geography_city id    DEFAULT     v   ALTER TABLE ONLY public.geography_city ALTER COLUMN id SET DEFAULT nextval('public.geography_city_id_seq'::regclass);
 @   ALTER TABLE public.geography_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231         �           2604    30636    geography_country id    DEFAULT     |   ALTER TABLE ONLY public.geography_country ALTER COLUMN id SET DEFAULT nextval('public.geography_country_id_seq'::regclass);
 C   ALTER TABLE public.geography_country ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227         �           2604    30646    geography_region id    DEFAULT     z   ALTER TABLE ONLY public.geography_region ALTER COLUMN id SET DEFAULT nextval('public.geography_region_id_seq'::regclass);
 B   ALTER TABLE public.geography_region ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229         �           2604    31004 !   materialprices_insulationprice id    DEFAULT     �   ALTER TABLE ONLY public.materialprices_insulationprice ALTER COLUMN id SET DEFAULT nextval('public.materialprices_insulationprice_id_seq'::regclass);
 P   ALTER TABLE public.materialprices_insulationprice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    268    269         �           2604    30996 '   materialprices_rockwallmaterialprice id    DEFAULT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice ALTER COLUMN id SET DEFAULT nextval('public.materialprices_rockwallmaterialprice_id_seq'::regclass);
 V   ALTER TABLE public.materialprices_rockwallmaterialprice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    267    267         �           2604    30900    materials_bulksand id    DEFAULT     ~   ALTER TABLE ONLY public.materials_bulksand ALTER COLUMN id SET DEFAULT nextval('public.materials_bulksand_id_seq'::regclass);
 D   ALTER TABLE public.materials_bulksand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260    261         �           2604    31354    materials_flexibletile id    DEFAULT     �   ALTER TABLE ONLY public.materials_flexibletile ALTER COLUMN id SET DEFAULT nextval('public.materials_flexibletile_id_seq'::regclass);
 H   ALTER TABLE public.materials_flexibletile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    293    294    294         �           2604    30916    materials_insulation id    DEFAULT     �   ALTER TABLE ONLY public.materials_insulation ALTER COLUMN id SET DEFAULT nextval('public.materials_insulation_id_seq'::regclass);
 F   ALTER TABLE public.materials_insulation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264    265         �           2604    31082    materials_materialuse id    DEFAULT     �   ALTER TABLE ONLY public.materials_materialuse ALTER COLUMN id SET DEFAULT nextval('public.materials_materialuse_id_seq'::regclass);
 G   ALTER TABLE public.materials_materialuse ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    275    276    276         �           2604    31364    materials_metaltile id    DEFAULT     �   ALTER TABLE ONLY public.materials_metaltile ALTER COLUMN id SET DEFAULT nextval('public.materials_metaltile_id_seq'::regclass);
 E   ALTER TABLE public.materials_metaltile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    296    295    296         �           2604    31142    materials_plaster id    DEFAULT     |   ALTER TABLE ONLY public.materials_plaster ALTER COLUMN id SET DEFAULT nextval('public.materials_plaster_id_seq'::regclass);
 C   ALTER TABLE public.materials_plaster ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    283    284    284         �           2604    31150    materials_plaster_use id    DEFAULT     �   ALTER TABLE ONLY public.materials_plaster_use ALTER COLUMN id SET DEFAULT nextval('public.materials_plaster_use_id_seq'::regclass);
 G   ALTER TABLE public.materials_plaster_use ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    286    285    286         �           2604    30908 !   materials_rockwallmaterialunit id    DEFAULT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit ALTER COLUMN id SET DEFAULT nextval('public.materials_rockwallmaterialunit_id_seq'::regclass);
 P   ALTER TABLE public.materials_rockwallmaterialunit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    263    263         �           2604    31090    materials_roofcovertype id    DEFAULT     �   ALTER TABLE ONLY public.materials_roofcovertype ALTER COLUMN id SET DEFAULT nextval('public.materials_roofcovertype_id_seq'::regclass);
 I   ALTER TABLE public.materials_roofcovertype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    277    278         �           2604    31118    materials_siding id    DEFAULT     z   ALTER TABLE ONLY public.materials_siding ALTER COLUMN id SET DEFAULT nextval('public.materials_siding_id_seq'::regclass);
 B   ALTER TABLE public.materials_siding ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    280    279    280         �           2604    31126    materials_siding_use id    DEFAULT     �   ALTER TABLE ONLY public.materials_siding_use ALTER COLUMN id SET DEFAULT nextval('public.materials_siding_use_id_seq'::regclass);
 F   ALTER TABLE public.materials_siding_use ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    282    281    282         �           2604    31296    materials_stoneproductline id    DEFAULT     �   ALTER TABLE ONLY public.materials_stoneproductline ALTER COLUMN id SET DEFAULT nextval('public.materials_stoneproductline_id_seq'::regclass);
 L   ALTER TABLE public.materials_stoneproductline ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    288    287    288         �           2604    31304 !   materials_stoneproductline_use id    DEFAULT     �   ALTER TABLE ONLY public.materials_stoneproductline_use ALTER COLUMN id SET DEFAULT nextval('public.materials_stoneproductline_use_id_seq'::regclass);
 P   ALTER TABLE public.materials_stoneproductline_use ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    290    289    290         �           2604    31312    materials_stoneunit id    DEFAULT     �   ALTER TABLE ONLY public.materials_stoneunit ALTER COLUMN id SET DEFAULT nextval('public.materials_stoneunit_id_seq'::regclass);
 E   ALTER TABLE public.materials_stoneunit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    292    291    292         �           2604    30870    names_decorativebrickface id    DEFAULT     �   ALTER TABLE ONLY public.names_decorativebrickface ALTER COLUMN id SET DEFAULT nextval('public.names_decorativebrickface_id_seq'::regclass);
 K   ALTER TABLE public.names_decorativebrickface ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256    257         �           2604    30878 "   names_decorativebrickface_brand id    DEFAULT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand ALTER COLUMN id SET DEFAULT nextval('public.names_decorativebrickface_brand_id_seq'::regclass);
 Q   ALTER TABLE public.names_decorativebrickface_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    259    259         �           2604    30804    standards_classb id    DEFAULT     z   ALTER TABLE ONLY public.standards_classb ALTER COLUMN id SET DEFAULT nextval('public.standards_classb_id_seq'::regclass);
 B   ALTER TABLE public.standards_classb ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245         �           2604    30814 !   standards_classаveragedensity id    DEFAULT     �   ALTER TABLE ONLY public."standards_classаveragedensity" ALTER COLUMN id SET DEFAULT nextval('public."standards_classаveragedensity_id_seq"'::regclass);
 R   ALTER TABLE public."standards_classаveragedensity" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247         �           2604    30824    standards_markd id    DEFAULT     x   ALTER TABLE ONLY public.standards_markd ALTER COLUMN id SET DEFAULT nextval('public.standards_markd_id_seq'::regclass);
 A   ALTER TABLE public.standards_markd ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    249    249         �           2604    30834    standards_markf id    DEFAULT     x   ALTER TABLE ONLY public.standards_markf ALTER COLUMN id SET DEFAULT nextval('public.standards_markf_id_seq'::regclass);
 A   ALTER TABLE public.standards_markf ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250    251         �           2604    30844    standards_markm id    DEFAULT     x   ALTER TABLE ONLY public.standards_markm ALTER COLUMN id SET DEFAULT nextval('public.standards_markm_id_seq'::regclass);
 A   ALTER TABLE public.standards_markm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253         �           2604    30854    standards_nfsize id    DEFAULT     z   ALTER TABLE ONLY public.standards_nfsize ALTER COLUMN id SET DEFAULT nextval('public.standards_nfsize_id_seq'::regclass);
 B   ALTER TABLE public.standards_nfsize ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254    255         �           2604    30731    suppliers_activity id    DEFAULT     ~   ALTER TABLE ONLY public.suppliers_activity ALTER COLUMN id SET DEFAULT nextval('public.suppliers_activity_id_seq'::regclass);
 D   ALTER TABLE public.suppliers_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237         �           2604    30759    suppliers_manufacturer id    DEFAULT     �   ALTER TABLE ONLY public.suppliers_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.suppliers_manufacturer_id_seq'::regclass);
 H   ALTER TABLE public.suppliers_manufacturer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243         �           2604    30741    suppliers_provider id    DEFAULT     ~   ALTER TABLE ONLY public.suppliers_provider ALTER COLUMN id SET DEFAULT nextval('public.suppliers_provider_id_seq'::regclass);
 D   ALTER TABLE public.suppliers_provider ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239         �           2604    30751 (   suppliers_provider_secondary_activity id    DEFAULT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity ALTER COLUMN id SET DEFAULT nextval('public.suppliers_provider_secondary_activity_id_seq'::regclass);
 W   ALTER TABLE public.suppliers_provider_secondary_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241         �           2604    31046 .   workprices_pilegrillagefoundationworkprices id    DEFAULT     �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices ALTER COLUMN id SET DEFAULT nextval('public.workprices_pilegrillagefoundationworkprices_id_seq'::regclass);
 ]   ALTER TABLE public.workprices_pilegrillagefoundationworkprices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    272    271    272         �          0    31058    account_profile 
   TABLE DATA           F   COPY public.account_profile (id, photo, user_id, city_id) FROM stdin;
    public          postgres    false    274       3544.dat �          0    30459 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209       3479.dat �          0    30469    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211       3481.dat �          0    30451    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207       3477.dat �          0    30477 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213       3483.dat �          0    30487    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215       3485.dat �          0    30495    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217       3487.dat �          0    30588    brands_brand 
   TABLE DATA           0   COPY public.brands_brand (id, name) FROM stdin;
    public          postgres    false    221       3491.dat �          0    30598    brands_subbrand_1 
   TABLE DATA           ?   COPY public.brands_subbrand_1 (id, name, brand_id) FROM stdin;
    public          postgres    false    223       3493.dat �          0    30608    brands_subbrand_2 
   TABLE DATA           E   COPY public.brands_subbrand_2 (id, name, sub_brand_1_id) FROM stdin;
    public          postgres    false    225       3495.dat �          0    30677    catalog_algorithm 
   TABLE DATA           A   COPY public.catalog_algorithm (id, identifier, name) FROM stdin;
    public          postgres    false    233       3503.dat �          0    31373    catalog_facadematerialtype 
   TABLE DATA           J   COPY public.catalog_facadematerialtype (id, name, identifier) FROM stdin;
    public          postgres    false    298       3568.dat �          0    30697    catalog_plan 
   TABLE DATA           M   COPY public.catalog_plan (id, title, scheme, checked, author_id) FROM stdin;
    public          postgres    false    235       3505.dat �          0    31383    catalog_shell 
   TABLE DATA           �   COPY public.catalog_shell (id, name, roof_material_id, soffit_style, wall_material_0_id, socle_material_id, author_id, roof_material_type_id, socle_material_type_id, wall_material_type_0_id) FROM stdin;
    public          postgres    false    300       3570.dat �          0    30555    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219       3489.dat �          0    30441    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205       3475.dat �          0    30430    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203       3473.dat �          0    31031    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    270       3540.dat �          0    30655    geography_city 
   TABLE DATA           r   COPY public.geography_city (id, name, heating_period_duration, heating_period_temperature, region_id) FROM stdin;
    public          postgres    false    231       3501.dat �          0    30633    geography_country 
   TABLE DATA           5   COPY public.geography_country (id, name) FROM stdin;
    public          postgres    false    227       3497.dat �          0    30643    geography_region 
   TABLE DATA           F   COPY public.geography_region (id, name, code, country_id) FROM stdin;
    public          postgres    false    229       3499.dat �          0    31001    materialprices_insulationprice 
   TABLE DATA           V   COPY public.materialprices_insulationprice (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    269       3539.dat �          0    30993 $   materialprices_rockwallmaterialprice 
   TABLE DATA           \   COPY public.materialprices_rockwallmaterialprice (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    267       3537.dat �          0    30897    materials_bulksand 
   TABLE DATA           >   COPY public.materials_bulksand (id, name, weight) FROM stdin;
    public          postgres    false    261       3531.dat �          0    31351    materials_flexibletile 
   TABLE DATA           C   COPY public.materials_flexibletile (id, name, texture) FROM stdin;
    public          postgres    false    294       3564.dat �          0    30913    materials_insulation 
   TABLE DATA           c   COPY public.materials_insulation (id, thermal_conductivity, mat_type, thick, brand_id) FROM stdin;
    public          postgres    false    265       3535.dat �          0    31079    materials_materialuse 
   TABLE DATA           E   COPY public.materials_materialuse (id, name, identifier) FROM stdin;
    public          postgres    false    276       3546.dat �          0    31361    materials_metaltile 
   TABLE DATA           @   COPY public.materials_metaltile (id, name, texture) FROM stdin;
    public          postgres    false    296       3566.dat �          0    31139    materials_plaster 
   TABLE DATA           S   COPY public.materials_plaster (id, texture, brand_id, manufacturer_id) FROM stdin;
    public          postgres    false    284       3554.dat �          0    31147    materials_plaster_use 
   TABLE DATA           O   COPY public.materials_plaster_use (id, plaster_id, materialuse_id) FROM stdin;
    public          postgres    false    286       3556.dat �          0    30905    materials_rockwallmaterialunit 
   TABLE DATA           y  COPY public.materials_rockwallmaterialunit (id, name, material, greater_bed_size, minor_bed_size, height, tongue_and_groove, polish, purpose, partition_or_bearing, body_type, blind_hollow, primary_or_additional, algorithm_id, brand_id, class_average_density_id, class_b_id, face_id, manufacturer_id, mark_d_id, mark_f_id, mark_m_id, sub_brand_1_id, sub_brand_2_id) FROM stdin;
    public          postgres    false    263       3533.dat �          0    31087    materials_roofcovertype 
   TABLE DATA           G   COPY public.materials_roofcovertype (id, name, identifier) FROM stdin;
    public          postgres    false    278       3548.dat �          0    31115    materials_siding 
   TABLE DATA           n   COPY public.materials_siding (id, material, alternative_name, texture, brand_id, manufacturer_id) FROM stdin;
    public          postgres    false    280       3550.dat �          0    31123    materials_siding_use 
   TABLE DATA           M   COPY public.materials_siding_use (id, siding_id, materialuse_id) FROM stdin;
    public          postgres    false    282       3552.dat �          0    31293    materials_stoneproductline 
   TABLE DATA           O   COPY public.materials_stoneproductline (id, name, manufacturer_id) FROM stdin;
    public          postgres    false    288       3558.dat �          0    31301    materials_stoneproductline_use 
   TABLE DATA           a   COPY public.materials_stoneproductline_use (id, stoneproductline_id, materialuse_id) FROM stdin;
    public          postgres    false    290       3560.dat �          0    31309    materials_stoneunit 
   TABLE DATA           Q   COPY public.materials_stoneunit (id, name, texture, product_line_id) FROM stdin;
    public          postgres    false    292       3562.dat �          0    30867    names_decorativebrickface 
   TABLE DATA           =   COPY public.names_decorativebrickface (id, name) FROM stdin;
    public          postgres    false    257       3527.dat �          0    30875    names_decorativebrickface_brand 
   TABLE DATA           _   COPY public.names_decorativebrickface_brand (id, decorativebrickface_id, brand_id) FROM stdin;
    public          postgres    false    259       3529.dat �          0    30801    standards_classb 
   TABLE DATA           @   COPY public.standards_classb (id, identifier, name) FROM stdin;
    public          postgres    false    245       3515.dat �          0    30811    standards_classаveragedensity 
   TABLE DATA           P   COPY public."standards_classаveragedensity" (id, identifier, name) FROM stdin;
    public          postgres    false    247       3517.dat �          0    30821    standards_markd 
   TABLE DATA           ?   COPY public.standards_markd (id, identifier, name) FROM stdin;
    public          postgres    false    249       3519.dat �          0    30831    standards_markf 
   TABLE DATA           ?   COPY public.standards_markf (id, identifier, name) FROM stdin;
    public          postgres    false    251       3521.dat �          0    30841    standards_markm 
   TABLE DATA           ?   COPY public.standards_markm (id, identifier, name) FROM stdin;
    public          postgres    false    253       3523.dat �          0    30851    standards_nfsize 
   TABLE DATA           j   COPY public.standards_nfsize (id, identifier, name, greater_bed_size, minor_bed_size, height) FROM stdin;
    public          postgres    false    255       3525.dat �          0    30728    suppliers_activity 
   TABLE DATA           B   COPY public.suppliers_activity (id, identifier, name) FROM stdin;
    public          postgres    false    237       3507.dat �          0    30756    suppliers_manufacturer 
   TABLE DATA           T   COPY public.suppliers_manufacturer (id, alias, name, brand_id, city_id) FROM stdin;
    public          postgres    false    243       3513.dat �          0    30738    suppliers_provider 
   TABLE DATA           K   COPY public.suppliers_provider (id, name, primary_activity_id) FROM stdin;
    public          postgres    false    239       3509.dat �          0    30748 %   suppliers_provider_secondary_activity 
   TABLE DATA           ]   COPY public.suppliers_provider_secondary_activity (id, provider_id, activity_id) FROM stdin;
    public          postgres    false    241       3511.dat �          0    31043 +   workprices_pilegrillagefoundationworkprices 
   TABLE DATA             COPY public.workprices_pilegrillagefoundationworkprices (id, const_expenditure, transportation_procurement_cost, reinforcement_binding, clamp, pile_frame, formwork, length_costs, square_costs, volume_costs, pile_pour, man_hours_cost, man_hours_profit, owner_id) FROM stdin;
    public          postgres    false    272       3542.dat *           0    0    account_profile_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.account_profile_id_seq', 2, true);
          public          postgres    false    273         +           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);
          public          postgres    false    208         ,           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210         -           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 180, true);
          public          postgres    false    206         .           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 2, true);
          public          postgres    false    214         /           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);
          public          postgres    false    212         0           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216         1           0    0    brands_brand_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.brands_brand_id_seq', 1, false);
          public          postgres    false    220         2           0    0    brands_subbrand_1_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.brands_subbrand_1_id_seq', 1, false);
          public          postgres    false    222         3           0    0    brands_subbrand_2_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.brands_subbrand_2_id_seq', 1, false);
          public          postgres    false    224         4           0    0    catalog_algorithm_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalog_algorithm_id_seq', 1, false);
          public          postgres    false    232         5           0    0 !   catalog_facadematerialtype_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.catalog_facadematerialtype_id_seq', 1, false);
          public          postgres    false    297         6           0    0    catalog_plan_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.catalog_plan_id_seq', 5, true);
          public          postgres    false    234         7           0    0    catalog_shell_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_shell_id_seq', 1, false);
          public          postgres    false    299         8           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 22, true);
          public          postgres    false    218         9           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 45, true);
          public          postgres    false    204         :           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 38, true);
          public          postgres    false    202         ;           0    0    geography_city_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.geography_city_id_seq', 1, true);
          public          postgres    false    230         <           0    0    geography_country_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.geography_country_id_seq', 1, true);
          public          postgres    false    226         =           0    0    geography_region_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.geography_region_id_seq', 1, true);
          public          postgres    false    228         >           0    0 %   materialprices_insulationprice_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.materialprices_insulationprice_id_seq', 1, false);
          public          postgres    false    268         ?           0    0 +   materialprices_rockwallmaterialprice_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.materialprices_rockwallmaterialprice_id_seq', 1, false);
          public          postgres    false    266         @           0    0    materials_bulksand_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.materials_bulksand_id_seq', 1, false);
          public          postgres    false    260         A           0    0    materials_flexibletile_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.materials_flexibletile_id_seq', 1, false);
          public          postgres    false    293         B           0    0    materials_insulation_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.materials_insulation_id_seq', 1, false);
          public          postgres    false    264         C           0    0    materials_materialuse_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.materials_materialuse_id_seq', 1, false);
          public          postgres    false    275         D           0    0    materials_metaltile_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.materials_metaltile_id_seq', 1, false);
          public          postgres    false    295         E           0    0    materials_plaster_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.materials_plaster_id_seq', 1, false);
          public          postgres    false    283         F           0    0    materials_plaster_use_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.materials_plaster_use_id_seq', 1, false);
          public          postgres    false    285         G           0    0 %   materials_rockwallmaterialunit_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.materials_rockwallmaterialunit_id_seq', 1, false);
          public          postgres    false    262         H           0    0    materials_roofcovertype_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.materials_roofcovertype_id_seq', 2, true);
          public          postgres    false    277         I           0    0    materials_siding_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.materials_siding_id_seq', 1, false);
          public          postgres    false    279         J           0    0    materials_siding_use_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.materials_siding_use_id_seq', 1, false);
          public          postgres    false    281         K           0    0 !   materials_stoneproductline_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.materials_stoneproductline_id_seq', 1, false);
          public          postgres    false    287         L           0    0 %   materials_stoneproductline_use_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.materials_stoneproductline_use_id_seq', 1, false);
          public          postgres    false    289         M           0    0    materials_stoneunit_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.materials_stoneunit_id_seq', 1, false);
          public          postgres    false    291         N           0    0 &   names_decorativebrickface_brand_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.names_decorativebrickface_brand_id_seq', 1, false);
          public          postgres    false    258         O           0    0     names_decorativebrickface_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.names_decorativebrickface_id_seq', 1, false);
          public          postgres    false    256         P           0    0    standards_classb_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.standards_classb_id_seq', 1, false);
          public          postgres    false    244         Q           0    0 %   standards_classаveragedensity_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."standards_classаveragedensity_id_seq"', 1, false);
          public          postgres    false    246         R           0    0    standards_markd_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.standards_markd_id_seq', 1, false);
          public          postgres    false    248         S           0    0    standards_markf_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.standards_markf_id_seq', 1, false);
          public          postgres    false    250         T           0    0    standards_markm_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.standards_markm_id_seq', 1, false);
          public          postgres    false    252         U           0    0    standards_nfsize_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.standards_nfsize_id_seq', 1, false);
          public          postgres    false    254         V           0    0    suppliers_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.suppliers_activity_id_seq', 1, false);
          public          postgres    false    236         W           0    0    suppliers_manufacturer_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.suppliers_manufacturer_id_seq', 1, false);
          public          postgres    false    242         X           0    0    suppliers_provider_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.suppliers_provider_id_seq', 1, false);
          public          postgres    false    238         Y           0    0 ,   suppliers_provider_secondary_activity_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.suppliers_provider_secondary_activity_id_seq', 1, false);
          public          postgres    false    240         Z           0    0 2   workprices_pilegrillagefoundationworkprices_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.workprices_pilegrillagefoundationworkprices_id_seq', 1, false);
          public          postgres    false    271         �           2606    31063 $   account_profile account_profile_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_pkey;
       public            postgres    false    274         �           2606    31065 +   account_profile account_profile_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_user_id_key;
       public            postgres    false    274         �           2606    30584    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209         �           2606    30511 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211         �           2606    30474 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211         �           2606    30464    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209         �           2606    30502 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207         �           2606    30456 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207         �           2606    30492 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215         �           2606    30526 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215         �           2606    30482    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213         �           2606    30500 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217                     2606    30540 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217         �           2606    30578     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213                    2606    30595 "   brands_brand brands_brand_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.brands_brand
    ADD CONSTRAINT brands_brand_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.brands_brand DROP CONSTRAINT brands_brand_name_key;
       public            postgres    false    221         	           2606    30593    brands_brand brands_brand_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.brands_brand
    ADD CONSTRAINT brands_brand_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.brands_brand DROP CONSTRAINT brands_brand_pkey;
       public            postgres    false    221                    2606    30605 ,   brands_subbrand_1 brands_subbrand_1_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.brands_subbrand_1 DROP CONSTRAINT brands_subbrand_1_name_key;
       public            postgres    false    223                    2606    30603 (   brands_subbrand_1 brands_subbrand_1_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.brands_subbrand_1 DROP CONSTRAINT brands_subbrand_1_pkey;
       public            postgres    false    223                    2606    30615 ,   brands_subbrand_2 brands_subbrand_2_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.brands_subbrand_2 DROP CONSTRAINT brands_subbrand_2_name_key;
       public            postgres    false    225                    2606    30613 (   brands_subbrand_2 brands_subbrand_2_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.brands_subbrand_2 DROP CONSTRAINT brands_subbrand_2_pkey;
       public            postgres    false    225         (           2606    30684 2   catalog_algorithm catalog_algorithm_identifier_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_identifier_key UNIQUE (identifier);
 \   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_identifier_key;
       public            postgres    false    233         +           2606    30686 ,   catalog_algorithm catalog_algorithm_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_name_key;
       public            postgres    false    233         -           2606    30682 (   catalog_algorithm catalog_algorithm_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_pkey;
       public            postgres    false    233         �           2606    31380 >   catalog_facadematerialtype catalog_facadematerialtype_name_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.catalog_facadematerialtype
    ADD CONSTRAINT catalog_facadematerialtype_name_key UNIQUE (name);
 h   ALTER TABLE ONLY public.catalog_facadematerialtype DROP CONSTRAINT catalog_facadematerialtype_name_key;
       public            postgres    false    298         �           2606    31378 :   catalog_facadematerialtype catalog_facadematerialtype_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.catalog_facadematerialtype
    ADD CONSTRAINT catalog_facadematerialtype_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.catalog_facadematerialtype DROP CONSTRAINT catalog_facadematerialtype_pkey;
       public            postgres    false    298         0           2606    30705    catalog_plan catalog_plan_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_pkey;
       public            postgres    false    235         �           2606    31388     catalog_shell catalog_shell_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_pkey;
       public            postgres    false    300                    2606    30564 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219         �           2606    30448 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205         �           2606    30446 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205         �           2606    30438 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203         �           2606    31038 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    270         $           2606    30660 "   geography_city geography_city_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.geography_city
    ADD CONSTRAINT geography_city_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.geography_city DROP CONSTRAINT geography_city_pkey;
       public            postgres    false    231                    2606    30640 ,   geography_country geography_country_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.geography_country
    ADD CONSTRAINT geography_country_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.geography_country DROP CONSTRAINT geography_country_name_key;
       public            postgres    false    227                    2606    30638 (   geography_country geography_country_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.geography_country
    ADD CONSTRAINT geography_country_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.geography_country DROP CONSTRAINT geography_country_pkey;
       public            postgres    false    227                    2606    30652 *   geography_region geography_region_code_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_code_key UNIQUE (code);
 T   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_code_key;
       public            postgres    false    229                     2606    30650 *   geography_region geography_region_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_name_key;
       public            postgres    false    229         "           2606    30648 &   geography_region geography_region_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_pkey;
       public            postgres    false    229         �           2606    31006 B   materialprices_insulationprice materialprices_insulationprice_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insulationprice_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.materialprices_insulationprice DROP CONSTRAINT materialprices_insulationprice_pkey;
       public            postgres    false    269         �           2606    30998 N   materialprices_rockwallmaterialprice materialprices_rockwallmaterialprice_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockwallmaterialprice_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice DROP CONSTRAINT materialprices_rockwallmaterialprice_pkey;
       public            postgres    false    267         p           2606    30902 *   materials_bulksand materials_bulksand_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.materials_bulksand
    ADD CONSTRAINT materials_bulksand_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.materials_bulksand DROP CONSTRAINT materials_bulksand_pkey;
       public            postgres    false    261         �           2606    31358 6   materials_flexibletile materials_flexibletile_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.materials_flexibletile
    ADD CONSTRAINT materials_flexibletile_name_key UNIQUE (name);
 `   ALTER TABLE ONLY public.materials_flexibletile DROP CONSTRAINT materials_flexibletile_name_key;
       public            postgres    false    294         �           2606    31356 2   materials_flexibletile materials_flexibletile_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.materials_flexibletile
    ADD CONSTRAINT materials_flexibletile_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.materials_flexibletile DROP CONSTRAINT materials_flexibletile_pkey;
       public            postgres    false    294         �           2606    30918 .   materials_insulation materials_insulation_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.materials_insulation
    ADD CONSTRAINT materials_insulation_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.materials_insulation DROP CONSTRAINT materials_insulation_pkey;
       public            postgres    false    265         �           2606    31344 :   materials_materialuse materials_materialuse_identifier_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.materials_materialuse
    ADD CONSTRAINT materials_materialuse_identifier_key UNIQUE (identifier);
 d   ALTER TABLE ONLY public.materials_materialuse DROP CONSTRAINT materials_materialuse_identifier_key;
       public            postgres    false    276         �           2606    31346 >   materials_materialuse materials_materialuse_name_012faa14_uniq 
   CONSTRAINT     y   ALTER TABLE ONLY public.materials_materialuse
    ADD CONSTRAINT materials_materialuse_name_012faa14_uniq UNIQUE (name);
 h   ALTER TABLE ONLY public.materials_materialuse DROP CONSTRAINT materials_materialuse_name_012faa14_uniq;
       public            postgres    false    276         �           2606    31084 0   materials_materialuse materials_materialuse_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.materials_materialuse
    ADD CONSTRAINT materials_materialuse_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.materials_materialuse DROP CONSTRAINT materials_materialuse_pkey;
       public            postgres    false    276         �           2606    31368 0   materials_metaltile materials_metaltile_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.materials_metaltile
    ADD CONSTRAINT materials_metaltile_name_key UNIQUE (name);
 Z   ALTER TABLE ONLY public.materials_metaltile DROP CONSTRAINT materials_metaltile_name_key;
       public            postgres    false    296         �           2606    31366 ,   materials_metaltile materials_metaltile_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.materials_metaltile
    ADD CONSTRAINT materials_metaltile_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.materials_metaltile DROP CONSTRAINT materials_metaltile_pkey;
       public            postgres    false    296         �           2606    31144 (   materials_plaster materials_plaster_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.materials_plaster
    ADD CONSTRAINT materials_plaster_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.materials_plaster DROP CONSTRAINT materials_plaster_pkey;
       public            postgres    false    284         �           2606    31152 0   materials_plaster_use materials_plaster_use_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_use_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.materials_plaster_use DROP CONSTRAINT materials_plaster_use_pkey;
       public            postgres    false    286         �           2606    31236 S   materials_plaster_use materials_plaster_use_plaster_id_materialuse_id_9371ddbc_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_use_plaster_id_materialuse_id_9371ddbc_uniq UNIQUE (plaster_id, materialuse_id);
 }   ALTER TABLE ONLY public.materials_plaster_use DROP CONSTRAINT materials_plaster_use_plaster_id_materialuse_id_9371ddbc_uniq;
       public            postgres    false    286    286         {           2606    30910 B   materials_rockwallmaterialunit materials_rockwallmaterialunit_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallmaterialunit_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallmaterialunit_pkey;
       public            postgres    false    263         �           2606    31096 >   materials_roofcovertype materials_roofcovertype_identifier_key 
   CONSTRAINT        ALTER TABLE ONLY public.materials_roofcovertype
    ADD CONSTRAINT materials_roofcovertype_identifier_key UNIQUE (identifier);
 h   ALTER TABLE ONLY public.materials_roofcovertype DROP CONSTRAINT materials_roofcovertype_identifier_key;
       public            postgres    false    278         �           2606    31094 8   materials_roofcovertype materials_roofcovertype_name_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.materials_roofcovertype
    ADD CONSTRAINT materials_roofcovertype_name_key UNIQUE (name);
 b   ALTER TABLE ONLY public.materials_roofcovertype DROP CONSTRAINT materials_roofcovertype_name_key;
       public            postgres    false    278         �           2606    31092 4   materials_roofcovertype materials_roofcovertype_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.materials_roofcovertype
    ADD CONSTRAINT materials_roofcovertype_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.materials_roofcovertype DROP CONSTRAINT materials_roofcovertype_pkey;
       public            postgres    false    278         �           2606    31120 &   materials_siding materials_siding_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.materials_siding
    ADD CONSTRAINT materials_siding_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.materials_siding DROP CONSTRAINT materials_siding_pkey;
       public            postgres    false    280         �           2606    31128 .   materials_siding_use materials_siding_use_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.materials_siding_use DROP CONSTRAINT materials_siding_use_pkey;
       public            postgres    false    282         �           2606    31204 P   materials_siding_use materials_siding_use_siding_id_materialuse_id_c91a5f6e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_siding_id_materialuse_id_c91a5f6e_uniq UNIQUE (siding_id, materialuse_id);
 z   ALTER TABLE ONLY public.materials_siding_use DROP CONSTRAINT materials_siding_use_siding_id_materialuse_id_c91a5f6e_uniq;
       public            postgres    false    282    282         �           2606    31322 ^   materials_stoneproductline_use materials_stoneproductli_stoneproductline_id_mate_0a83adbd_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneproductli_stoneproductline_id_mate_0a83adbd_uniq UNIQUE (stoneproductline_id, materialuse_id);
 �   ALTER TABLE ONLY public.materials_stoneproductline_use DROP CONSTRAINT materials_stoneproductli_stoneproductline_id_mate_0a83adbd_uniq;
       public            postgres    false    290    290         �           2606    31298 :   materials_stoneproductline materials_stoneproductline_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.materials_stoneproductline
    ADD CONSTRAINT materials_stoneproductline_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.materials_stoneproductline DROP CONSTRAINT materials_stoneproductline_pkey;
       public            postgres    false    288         �           2606    31306 B   materials_stoneproductline_use materials_stoneproductline_use_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneproductline_use_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.materials_stoneproductline_use DROP CONSTRAINT materials_stoneproductline_use_pkey;
       public            postgres    false    290         �           2606    31314 ,   materials_stoneunit materials_stoneunit_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.materials_stoneunit
    ADD CONSTRAINT materials_stoneunit_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.materials_stoneunit DROP CONSTRAINT materials_stoneunit_pkey;
       public            postgres    false    292         j           2606    30882 _   names_decorativebrickface_brand names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq UNIQUE (decorativebrickface_id, brand_id);
 �   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq;
       public            postgres    false    259    259         n           2606    30880 D   names_decorativebrickface_brand names_decorativebrickface_brand_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebrickface_brand_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebrickface_brand_pkey;
       public            postgres    false    259         h           2606    30872 8   names_decorativebrickface names_decorativebrickface_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.names_decorativebrickface
    ADD CONSTRAINT names_decorativebrickface_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.names_decorativebrickface DROP CONSTRAINT names_decorativebrickface_pkey;
       public            postgres    false    257         K           2606    30808 0   standards_classb standards_classb_identifier_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.standards_classb
    ADD CONSTRAINT standards_classb_identifier_key UNIQUE (identifier);
 Z   ALTER TABLE ONLY public.standards_classb DROP CONSTRAINT standards_classb_identifier_key;
       public            postgres    false    245         M           2606    30806 &   standards_classb standards_classb_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.standards_classb
    ADD CONSTRAINT standards_classb_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.standards_classb DROP CONSTRAINT standards_classb_pkey;
       public            postgres    false    245         P           2606    30818 L   standards_classаveragedensity standards_classаveragedensity_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."standards_classаveragedensity"
    ADD CONSTRAINT "standards_classаveragedensity_identifier_key" UNIQUE (identifier);
 z   ALTER TABLE ONLY public."standards_classаveragedensity" DROP CONSTRAINT "standards_classаveragedensity_identifier_key";
       public            postgres    false    247         R           2606    30816 B   standards_classаveragedensity standards_classаveragedensity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."standards_classаveragedensity"
    ADD CONSTRAINT "standards_classаveragedensity_pkey" PRIMARY KEY (id);
 p   ALTER TABLE ONLY public."standards_classаveragedensity" DROP CONSTRAINT "standards_classаveragedensity_pkey";
       public            postgres    false    247         U           2606    30828 .   standards_markd standards_markd_identifier_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.standards_markd
    ADD CONSTRAINT standards_markd_identifier_key UNIQUE (identifier);
 X   ALTER TABLE ONLY public.standards_markd DROP CONSTRAINT standards_markd_identifier_key;
       public            postgres    false    249         W           2606    30826 $   standards_markd standards_markd_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.standards_markd
    ADD CONSTRAINT standards_markd_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.standards_markd DROP CONSTRAINT standards_markd_pkey;
       public            postgres    false    249         Z           2606    30838 .   standards_markf standards_markf_identifier_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.standards_markf
    ADD CONSTRAINT standards_markf_identifier_key UNIQUE (identifier);
 X   ALTER TABLE ONLY public.standards_markf DROP CONSTRAINT standards_markf_identifier_key;
       public            postgres    false    251         \           2606    30836 $   standards_markf standards_markf_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.standards_markf
    ADD CONSTRAINT standards_markf_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.standards_markf DROP CONSTRAINT standards_markf_pkey;
       public            postgres    false    251         _           2606    30848 .   standards_markm standards_markm_identifier_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.standards_markm
    ADD CONSTRAINT standards_markm_identifier_key UNIQUE (identifier);
 X   ALTER TABLE ONLY public.standards_markm DROP CONSTRAINT standards_markm_identifier_key;
       public            postgres    false    253         a           2606    30846 $   standards_markm standards_markm_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.standards_markm
    ADD CONSTRAINT standards_markm_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.standards_markm DROP CONSTRAINT standards_markm_pkey;
       public            postgres    false    253         d           2606    30858 0   standards_nfsize standards_nfsize_identifier_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.standards_nfsize
    ADD CONSTRAINT standards_nfsize_identifier_key UNIQUE (identifier);
 Z   ALTER TABLE ONLY public.standards_nfsize DROP CONSTRAINT standards_nfsize_identifier_key;
       public            postgres    false    255         f           2606    30856 &   standards_nfsize standards_nfsize_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.standards_nfsize
    ADD CONSTRAINT standards_nfsize_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.standards_nfsize DROP CONSTRAINT standards_nfsize_pkey;
       public            postgres    false    255         3           2606    30735 4   suppliers_activity suppliers_activity_identifier_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.suppliers_activity
    ADD CONSTRAINT suppliers_activity_identifier_key UNIQUE (identifier);
 ^   ALTER TABLE ONLY public.suppliers_activity DROP CONSTRAINT suppliers_activity_identifier_key;
       public            postgres    false    237         5           2606    30733 *   suppliers_activity suppliers_activity_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.suppliers_activity
    ADD CONSTRAINT suppliers_activity_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.suppliers_activity DROP CONSTRAINT suppliers_activity_pkey;
       public            postgres    false    237         F           2606    30763 6   suppliers_manufacturer suppliers_manufacturer_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_name_key UNIQUE (name);
 `   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_name_key;
       public            postgres    false    243         H           2606    30761 2   suppliers_manufacturer suppliers_manufacturer_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_pkey;
       public            postgres    false    243         8           2606    30745 .   suppliers_provider suppliers_provider_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.suppliers_provider DROP CONSTRAINT suppliers_provider_name_key;
       public            postgres    false    239         :           2606    30743 *   suppliers_provider suppliers_provider_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.suppliers_provider DROP CONSTRAINT suppliers_provider_pkey;
       public            postgres    false    239         =           2606    30773 d   suppliers_provider_secondary_activity suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq UNIQUE (provider_id, activity_id);
 �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq;
       public            postgres    false    241    241         @           2606    30753 P   suppliers_provider_secondary_activity suppliers_provider_secondary_activity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_secondary_activity_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_secondary_activity_pkey;
       public            postgres    false    241         �           2606    31048 \   workprices_pilegrillagefoundationworkprices workprices_pilegrillagefoundationworkprices_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices
    ADD CONSTRAINT workprices_pilegrillagefoundationworkprices_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices DROP CONSTRAINT workprices_pilegrillagefoundationworkprices_pkey;
       public            postgres    false    272         �           1259    31076     account_profile_city_id_207f6508    INDEX     _   CREATE INDEX account_profile_city_id_207f6508 ON public.account_profile USING btree (city_id);
 4   DROP INDEX public.account_profile_city_id_207f6508;
       public            postgres    false    274         �           1259    30585    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209         �           1259    30522 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211         �           1259    30523 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211         �           1259    30508 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207         �           1259    30538 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215         �           1259    30537 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215         �           1259    30552 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217         �           1259    30551 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217         �           1259    30579     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213                    1259    30616    brands_brand_name_5759061b_like    INDEX     l   CREATE INDEX brands_brand_name_5759061b_like ON public.brands_brand USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.brands_brand_name_5759061b_like;
       public            postgres    false    221         
           1259    30623 #   brands_subbrand_1_brand_id_7085621b    INDEX     e   CREATE INDEX brands_subbrand_1_brand_id_7085621b ON public.brands_subbrand_1 USING btree (brand_id);
 7   DROP INDEX public.brands_subbrand_1_brand_id_7085621b;
       public            postgres    false    223                    1259    30622 $   brands_subbrand_1_name_f5c24720_like    INDEX     v   CREATE INDEX brands_subbrand_1_name_f5c24720_like ON public.brands_subbrand_1 USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.brands_subbrand_1_name_f5c24720_like;
       public            postgres    false    223                    1259    30629 $   brands_subbrand_2_name_d930b212_like    INDEX     v   CREATE INDEX brands_subbrand_2_name_d930b212_like ON public.brands_subbrand_2 USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.brands_subbrand_2_name_d930b212_like;
       public            postgres    false    225                    1259    30630 )   brands_subbrand_2_sub_brand_1_id_16ad81ef    INDEX     q   CREATE INDEX brands_subbrand_2_sub_brand_1_id_16ad81ef ON public.brands_subbrand_2 USING btree (sub_brand_1_id);
 =   DROP INDEX public.brands_subbrand_2_sub_brand_1_id_16ad81ef;
       public            postgres    false    225         &           1259    30706 *   catalog_algorithm_identifier_eb6862d5_like    INDEX     �   CREATE INDEX catalog_algorithm_identifier_eb6862d5_like ON public.catalog_algorithm USING btree (identifier varchar_pattern_ops);
 >   DROP INDEX public.catalog_algorithm_identifier_eb6862d5_like;
       public            postgres    false    233         )           1259    30707 $   catalog_algorithm_name_5dd925d3_like    INDEX     v   CREATE INDEX catalog_algorithm_name_5dd925d3_like ON public.catalog_algorithm USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.catalog_algorithm_name_5dd925d3_like;
       public            postgres    false    233         �           1259    31389 -   catalog_facadematerialtype_name_75e83a0b_like    INDEX     �   CREATE INDEX catalog_facadematerialtype_name_75e83a0b_like ON public.catalog_facadematerialtype USING btree (name varchar_pattern_ops);
 A   DROP INDEX public.catalog_facadematerialtype_name_75e83a0b_like;
       public            postgres    false    298         .           1259    30725    catalog_plan_author_id_19443bad    INDEX     ]   CREATE INDEX catalog_plan_author_id_19443bad ON public.catalog_plan USING btree (author_id);
 3   DROP INDEX public.catalog_plan_author_id_19443bad;
       public            postgres    false    235         �           1259    31410     catalog_shell_author_id_c4c4abab    INDEX     _   CREATE INDEX catalog_shell_author_id_c4c4abab ON public.catalog_shell USING btree (author_id);
 4   DROP INDEX public.catalog_shell_author_id_c4c4abab;
       public            postgres    false    300         �           1259    31411 ,   catalog_shell_roof_material_type_id_cecb1252    INDEX     w   CREATE INDEX catalog_shell_roof_material_type_id_cecb1252 ON public.catalog_shell USING btree (roof_material_type_id);
 @   DROP INDEX public.catalog_shell_roof_material_type_id_cecb1252;
       public            postgres    false    300         �           1259    31412 -   catalog_shell_socle_material_type_id_8b9c900c    INDEX     y   CREATE INDEX catalog_shell_socle_material_type_id_8b9c900c ON public.catalog_shell USING btree (socle_material_type_id);
 A   DROP INDEX public.catalog_shell_socle_material_type_id_8b9c900c;
       public            postgres    false    300         �           1259    31413 .   catalog_shell_wall_material_type_0_id_816c36ae    INDEX     {   CREATE INDEX catalog_shell_wall_material_type_0_id_816c36ae ON public.catalog_shell USING btree (wall_material_type_0_id);
 B   DROP INDEX public.catalog_shell_wall_material_type_0_id_816c36ae;
       public            postgres    false    300                    1259    30575 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219                    1259    30576 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219         �           1259    31040 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    270         �           1259    31039 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    270         %           1259    30674 !   geography_city_region_id_ea133d50    INDEX     a   CREATE INDEX geography_city_region_id_ea133d50 ON public.geography_city USING btree (region_id);
 5   DROP INDEX public.geography_city_region_id_ea133d50;
       public            postgres    false    231                    1259    30661 $   geography_country_name_477df8ef_like    INDEX     v   CREATE INDEX geography_country_name_477df8ef_like ON public.geography_country USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.geography_country_name_477df8ef_like;
       public            postgres    false    227                    1259    30668 $   geography_region_country_id_7b89c739    INDEX     g   CREATE INDEX geography_region_country_id_7b89c739 ON public.geography_region USING btree (country_id);
 8   DROP INDEX public.geography_region_country_id_7b89c739;
       public            postgres    false    229                    1259    30667 #   geography_region_name_78b61e6a_like    INDEX     t   CREATE INDEX geography_region_name_78b61e6a_like ON public.geography_region USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.geography_region_name_78b61e6a_like;
       public            postgres    false    229         �           1259    31029 /   materialprices_insulationprice_name_id_a70a0ae5    INDEX     }   CREATE INDEX materialprices_insulationprice_name_id_a70a0ae5 ON public.materialprices_insulationprice USING btree (name_id);
 C   DROP INDEX public.materialprices_insulationprice_name_id_a70a0ae5;
       public            postgres    false    269         �           1259    31030 0   materialprices_insulationprice_owner_id_ea647b28    INDEX        CREATE INDEX materialprices_insulationprice_owner_id_ea647b28 ON public.materialprices_insulationprice USING btree (owner_id);
 D   DROP INDEX public.materialprices_insulationprice_owner_id_ea647b28;
       public            postgres    false    269         �           1259    31017 5   materialprices_rockwallmaterialprice_name_id_5a769348    INDEX     �   CREATE INDEX materialprices_rockwallmaterialprice_name_id_5a769348 ON public.materialprices_rockwallmaterialprice USING btree (name_id);
 I   DROP INDEX public.materialprices_rockwallmaterialprice_name_id_5a769348;
       public            postgres    false    267         �           1259    31018 6   materialprices_rockwallmaterialprice_owner_id_ea24bd0d    INDEX     �   CREATE INDEX materialprices_rockwallmaterialprice_owner_id_ea24bd0d ON public.materialprices_rockwallmaterialprice USING btree (owner_id);
 J   DROP INDEX public.materialprices_rockwallmaterialprice_owner_id_ea24bd0d;
       public            postgres    false    267         �           1259    31369 )   materials_flexibletile_name_d3837b01_like    INDEX     �   CREATE INDEX materials_flexibletile_name_d3837b01_like ON public.materials_flexibletile USING btree (name varchar_pattern_ops);
 =   DROP INDEX public.materials_flexibletile_name_d3837b01_like;
       public            postgres    false    294         ~           1259    30990 &   materials_insulation_brand_id_dd7669b2    INDEX     k   CREATE INDEX materials_insulation_brand_id_dd7669b2 ON public.materials_insulation USING btree (brand_id);
 :   DROP INDEX public.materials_insulation_brand_id_dd7669b2;
       public            postgres    false    265         �           1259    31348 .   materials_materialuse_identifier_a010716f_like    INDEX     �   CREATE INDEX materials_materialuse_identifier_a010716f_like ON public.materials_materialuse USING btree (identifier varchar_pattern_ops);
 B   DROP INDEX public.materials_materialuse_identifier_a010716f_like;
       public            postgres    false    276         �           1259    31347 (   materials_materialuse_name_012faa14_like    INDEX     ~   CREATE INDEX materials_materialuse_name_012faa14_like ON public.materials_materialuse USING btree (name varchar_pattern_ops);
 <   DROP INDEX public.materials_materialuse_name_012faa14_like;
       public            postgres    false    276         �           1259    31370 &   materials_metaltile_name_3bb29633_like    INDEX     z   CREATE INDEX materials_metaltile_name_3bb29633_like ON public.materials_metaltile USING btree (name varchar_pattern_ops);
 :   DROP INDEX public.materials_metaltile_name_3bb29633_like;
       public            postgres    false    296         �           1259    31233 #   materials_plaster_brand_id_cc3e5323    INDEX     e   CREATE INDEX materials_plaster_brand_id_cc3e5323 ON public.materials_plaster USING btree (brand_id);
 7   DROP INDEX public.materials_plaster_brand_id_cc3e5323;
       public            postgres    false    284         �           1259    31234 *   materials_plaster_manufacturer_id_060021cd    INDEX     s   CREATE INDEX materials_plaster_manufacturer_id_060021cd ON public.materials_plaster USING btree (manufacturer_id);
 >   DROP INDEX public.materials_plaster_manufacturer_id_060021cd;
       public            postgres    false    284         �           1259    31248 -   materials_plaster_use_materialuse_id_3f0e40e1    INDEX     y   CREATE INDEX materials_plaster_use_materialuse_id_3f0e40e1 ON public.materials_plaster_use USING btree (materialuse_id);
 A   DROP INDEX public.materials_plaster_use_materialuse_id_3f0e40e1;
       public            postgres    false    286         �           1259    31247 )   materials_plaster_use_plaster_id_1ce61346    INDEX     q   CREATE INDEX materials_plaster_use_plaster_id_1ce61346 ON public.materials_plaster_use USING btree (plaster_id);
 =   DROP INDEX public.materials_plaster_use_plaster_id_1ce61346;
       public            postgres    false    286         q           1259    30976 <   materials_rockwallmaterial_class_average_density_id_beb6fff9    INDEX     �   CREATE INDEX materials_rockwallmaterial_class_average_density_id_beb6fff9 ON public.materials_rockwallmaterialunit USING btree (class_average_density_id);
 P   DROP INDEX public.materials_rockwallmaterial_class_average_density_id_beb6fff9;
       public            postgres    false    263         r           1259    30974 4   materials_rockwallmaterialunit_algorithm_id_4183f114    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_algorithm_id_4183f114 ON public.materials_rockwallmaterialunit USING btree (algorithm_id);
 H   DROP INDEX public.materials_rockwallmaterialunit_algorithm_id_4183f114;
       public            postgres    false    263         s           1259    30975 0   materials_rockwallmaterialunit_brand_id_4deb8894    INDEX        CREATE INDEX materials_rockwallmaterialunit_brand_id_4deb8894 ON public.materials_rockwallmaterialunit USING btree (brand_id);
 D   DROP INDEX public.materials_rockwallmaterialunit_brand_id_4deb8894;
       public            postgres    false    263         t           1259    30977 2   materials_rockwallmaterialunit_class_b_id_1de59e0b    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_class_b_id_1de59e0b ON public.materials_rockwallmaterialunit USING btree (class_b_id);
 F   DROP INDEX public.materials_rockwallmaterialunit_class_b_id_1de59e0b;
       public            postgres    false    263         u           1259    30978 /   materials_rockwallmaterialunit_face_id_712ecb1a    INDEX     }   CREATE INDEX materials_rockwallmaterialunit_face_id_712ecb1a ON public.materials_rockwallmaterialunit USING btree (face_id);
 C   DROP INDEX public.materials_rockwallmaterialunit_face_id_712ecb1a;
       public            postgres    false    263         v           1259    30979 7   materials_rockwallmaterialunit_manufacturer_id_c1176543    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_manufacturer_id_c1176543 ON public.materials_rockwallmaterialunit USING btree (manufacturer_id);
 K   DROP INDEX public.materials_rockwallmaterialunit_manufacturer_id_c1176543;
       public            postgres    false    263         w           1259    30980 1   materials_rockwallmaterialunit_mark_d_id_e456d3f5    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_mark_d_id_e456d3f5 ON public.materials_rockwallmaterialunit USING btree (mark_d_id);
 E   DROP INDEX public.materials_rockwallmaterialunit_mark_d_id_e456d3f5;
       public            postgres    false    263         x           1259    30981 1   materials_rockwallmaterialunit_mark_f_id_48ec4578    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_mark_f_id_48ec4578 ON public.materials_rockwallmaterialunit USING btree (mark_f_id);
 E   DROP INDEX public.materials_rockwallmaterialunit_mark_f_id_48ec4578;
       public            postgres    false    263         y           1259    30982 1   materials_rockwallmaterialunit_mark_m_id_e96cf97b    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_mark_m_id_e96cf97b ON public.materials_rockwallmaterialunit USING btree (mark_m_id);
 E   DROP INDEX public.materials_rockwallmaterialunit_mark_m_id_e96cf97b;
       public            postgres    false    263         |           1259    30983 6   materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb ON public.materials_rockwallmaterialunit USING btree (sub_brand_1_id);
 J   DROP INDEX public.materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb;
       public            postgres    false    263         }           1259    30984 6   materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b ON public.materials_rockwallmaterialunit USING btree (sub_brand_2_id);
 J   DROP INDEX public.materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b;
       public            postgres    false    263         �           1259    31170 0   materials_roofcovertype_identifier_8eed0695_like    INDEX     �   CREATE INDEX materials_roofcovertype_identifier_8eed0695_like ON public.materials_roofcovertype USING btree (identifier varchar_pattern_ops);
 D   DROP INDEX public.materials_roofcovertype_identifier_8eed0695_like;
       public            postgres    false    278         �           1259    31169 *   materials_roofcovertype_name_e791d481_like    INDEX     �   CREATE INDEX materials_roofcovertype_name_e791d481_like ON public.materials_roofcovertype USING btree (name varchar_pattern_ops);
 >   DROP INDEX public.materials_roofcovertype_name_e791d481_like;
       public            postgres    false    278         �           1259    31201 "   materials_siding_brand_id_947adead    INDEX     c   CREATE INDEX materials_siding_brand_id_947adead ON public.materials_siding USING btree (brand_id);
 6   DROP INDEX public.materials_siding_brand_id_947adead;
       public            postgres    false    280         �           1259    31202 )   materials_siding_manufacturer_id_4bd6fcdc    INDEX     q   CREATE INDEX materials_siding_manufacturer_id_4bd6fcdc ON public.materials_siding USING btree (manufacturer_id);
 =   DROP INDEX public.materials_siding_manufacturer_id_4bd6fcdc;
       public            postgres    false    280         �           1259    31216 ,   materials_siding_use_materialuse_id_27444db6    INDEX     w   CREATE INDEX materials_siding_use_materialuse_id_27444db6 ON public.materials_siding_use USING btree (materialuse_id);
 @   DROP INDEX public.materials_siding_use_materialuse_id_27444db6;
       public            postgres    false    282         �           1259    31215 '   materials_siding_use_siding_id_a2f23e27    INDEX     m   CREATE INDEX materials_siding_use_siding_id_a2f23e27 ON public.materials_siding_use USING btree (siding_id);
 ;   DROP INDEX public.materials_siding_use_siding_id_a2f23e27;
       public            postgres    false    282         �           1259    31320 3   materials_stoneproductline_manufacturer_id_c1271051    INDEX     �   CREATE INDEX materials_stoneproductline_manufacturer_id_c1271051 ON public.materials_stoneproductline USING btree (manufacturer_id);
 G   DROP INDEX public.materials_stoneproductline_manufacturer_id_c1271051;
       public            postgres    false    288         �           1259    31334 6   materials_stoneproductline_use_materialuse_id_7e20150f    INDEX     �   CREATE INDEX materials_stoneproductline_use_materialuse_id_7e20150f ON public.materials_stoneproductline_use USING btree (materialuse_id);
 J   DROP INDEX public.materials_stoneproductline_use_materialuse_id_7e20150f;
       public            postgres    false    290         �           1259    31333 ;   materials_stoneproductline_use_stoneproductline_id_6477c585    INDEX     �   CREATE INDEX materials_stoneproductline_use_stoneproductline_id_6477c585 ON public.materials_stoneproductline_use USING btree (stoneproductline_id);
 O   DROP INDEX public.materials_stoneproductline_use_stoneproductline_id_6477c585;
       public            postgres    false    290         �           1259    31340 ,   materials_stoneunit_product_line_id_c1b449ac    INDEX     w   CREATE INDEX materials_stoneunit_product_line_id_c1b449ac ON public.materials_stoneunit USING btree (product_line_id);
 @   DROP INDEX public.materials_stoneunit_product_line_id_c1b449ac;
       public            postgres    false    292         k           1259    30894 1   names_decorativebrickface_brand_brand_id_92646ca6    INDEX     �   CREATE INDEX names_decorativebrickface_brand_brand_id_92646ca6 ON public.names_decorativebrickface_brand USING btree (brand_id);
 E   DROP INDEX public.names_decorativebrickface_brand_brand_id_92646ca6;
       public            postgres    false    259         l           1259    30893 ?   names_decorativebrickface_brand_decorativebrickface_id_f4bd2916    INDEX     �   CREATE INDEX names_decorativebrickface_brand_decorativebrickface_id_f4bd2916 ON public.names_decorativebrickface_brand USING btree (decorativebrickface_id);
 S   DROP INDEX public.names_decorativebrickface_brand_decorativebrickface_id_f4bd2916;
       public            postgres    false    259         I           1259    30859 )   standards_classb_identifier_9c57cd5d_like    INDEX     �   CREATE INDEX standards_classb_identifier_9c57cd5d_like ON public.standards_classb USING btree (identifier varchar_pattern_ops);
 =   DROP INDEX public.standards_classb_identifier_9c57cd5d_like;
       public            postgres    false    245         N           1259    30860 7   standards_classаveragedensity_identifier_4f590a03_like    INDEX     �   CREATE INDEX "standards_classаveragedensity_identifier_4f590a03_like" ON public."standards_classаveragedensity" USING btree (identifier varchar_pattern_ops);
 M   DROP INDEX public."standards_classаveragedensity_identifier_4f590a03_like";
       public            postgres    false    247         S           1259    30861 (   standards_markd_identifier_a2035296_like    INDEX     ~   CREATE INDEX standards_markd_identifier_a2035296_like ON public.standards_markd USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.standards_markd_identifier_a2035296_like;
       public            postgres    false    249         X           1259    30862 (   standards_markf_identifier_79848dc8_like    INDEX     ~   CREATE INDEX standards_markf_identifier_79848dc8_like ON public.standards_markf USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.standards_markf_identifier_79848dc8_like;
       public            postgres    false    251         ]           1259    30863 (   standards_markm_identifier_2b0b47b2_like    INDEX     ~   CREATE INDEX standards_markm_identifier_2b0b47b2_like ON public.standards_markm USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.standards_markm_identifier_2b0b47b2_like;
       public            postgres    false    253         b           1259    30864 )   standards_nfsize_identifier_625c4c07_like    INDEX     �   CREATE INDEX standards_nfsize_identifier_625c4c07_like ON public.standards_nfsize USING btree (identifier varchar_pattern_ops);
 =   DROP INDEX public.standards_nfsize_identifier_625c4c07_like;
       public            postgres    false    255         1           1259    30764 +   suppliers_activity_identifier_d8d3a5df_like    INDEX     �   CREATE INDEX suppliers_activity_identifier_d8d3a5df_like ON public.suppliers_activity USING btree (identifier varchar_pattern_ops);
 ?   DROP INDEX public.suppliers_activity_identifier_d8d3a5df_like;
       public            postgres    false    237         B           1259    30797 (   suppliers_manufacturer_brand_id_18bff0a3    INDEX     o   CREATE INDEX suppliers_manufacturer_brand_id_18bff0a3 ON public.suppliers_manufacturer USING btree (brand_id);
 <   DROP INDEX public.suppliers_manufacturer_brand_id_18bff0a3;
       public            postgres    false    243         C           1259    30798 '   suppliers_manufacturer_city_id_734a9037    INDEX     m   CREATE INDEX suppliers_manufacturer_city_id_734a9037 ON public.suppliers_manufacturer USING btree (city_id);
 ;   DROP INDEX public.suppliers_manufacturer_city_id_734a9037;
       public            postgres    false    243         D           1259    30796 )   suppliers_manufacturer_name_2cb797cf_like    INDEX     �   CREATE INDEX suppliers_manufacturer_name_2cb797cf_like ON public.suppliers_manufacturer USING btree (name varchar_pattern_ops);
 =   DROP INDEX public.suppliers_manufacturer_name_2cb797cf_like;
       public            postgres    false    243         6           1259    30770 %   suppliers_provider_name_99a51456_like    INDEX     x   CREATE INDEX suppliers_provider_name_99a51456_like ON public.suppliers_provider USING btree (name varchar_pattern_ops);
 9   DROP INDEX public.suppliers_provider_name_99a51456_like;
       public            postgres    false    239         ;           1259    30771 /   suppliers_provider_primary_activity_id_93261e15    INDEX     }   CREATE INDEX suppliers_provider_primary_activity_id_93261e15 ON public.suppliers_provider USING btree (primary_activity_id);
 C   DROP INDEX public.suppliers_provider_primary_activity_id_93261e15;
       public            postgres    false    239         >           1259    30785 :   suppliers_provider_secondary_activity_activity_id_31284a51    INDEX     �   CREATE INDEX suppliers_provider_secondary_activity_activity_id_31284a51 ON public.suppliers_provider_secondary_activity USING btree (activity_id);
 N   DROP INDEX public.suppliers_provider_secondary_activity_activity_id_31284a51;
       public            postgres    false    241         A           1259    30784 :   suppliers_provider_secondary_activity_provider_id_2fab0709    INDEX     �   CREATE INDEX suppliers_provider_secondary_activity_provider_id_2fab0709 ON public.suppliers_provider_secondary_activity USING btree (provider_id);
 N   DROP INDEX public.suppliers_provider_secondary_activity_provider_id_2fab0709;
       public            postgres    false    241         �           1259    31054 =   workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2    INDEX     �   CREATE INDEX workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2 ON public.workprices_pilegrillagefoundationworkprices USING btree (owner_id);
 Q   DROP INDEX public.workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2;
       public            postgres    false    272                    2606    31071 E   account_profile account_profile_city_id_207f6508_fk_geography_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_city_id_207f6508_fk_geography_city_id FOREIGN KEY (city_id) REFERENCES public.geography_city(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_city_id_207f6508_fk_geography_city_id;
       public          postgres    false    3108    231    274                     2606    31066 @   account_profile account_profile_user_id_bdd52018_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_user_id_bdd52018_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_user_id_bdd52018_fk_auth_user_id;
       public          postgres    false    3057    274    213         �           2606    30517 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    207    3044    211         �           2606    30512 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    209    211    3049         �           2606    30503 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    205    207    3039         �           2606    30532 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    215    209    3049         �           2606    30527 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3057    215    213         �           2606    30546 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    207    217    3044         �           2606    30541 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    3057    217    213         �           2606    30617 H   brands_subbrand_1 brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.brands_subbrand_1 DROP CONSTRAINT brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id;
       public          postgres    false    3081    223    221         �           2606    30624 H   brands_subbrand_2 brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su FOREIGN KEY (sub_brand_1_id) REFERENCES public.brands_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.brands_subbrand_2 DROP CONSTRAINT brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su;
       public          postgres    false    225    3087    223         �           2606    30720 <   catalog_plan catalog_plan_author_id_19443bad_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id;
       public          postgres    false    213    3057    235                    2606    31390 >   catalog_shell catalog_shell_author_id_c4c4abab_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_author_id_c4c4abab_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_author_id_c4c4abab_fk_auth_user_id;
       public          postgres    false    300    213    3057                    2606    31395 F   catalog_shell catalog_shell_roof_material_type_i_cecb1252_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_roof_material_type_i_cecb1252_fk_materials FOREIGN KEY (roof_material_type_id) REFERENCES public.materials_roofcovertype(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_roof_material_type_i_cecb1252_fk_materials;
       public          postgres    false    3236    300    278                    2606    31400 F   catalog_shell catalog_shell_socle_material_type__8b9c900c_fk_catalog_f    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_socle_material_type__8b9c900c_fk_catalog_f FOREIGN KEY (socle_material_type_id) REFERENCES public.catalog_facadematerialtype(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_socle_material_type__8b9c900c_fk_catalog_f;
       public          postgres    false    3283    300    298                    2606    31405 F   catalog_shell catalog_shell_wall_material_type_0_816c36ae_fk_catalog_f    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_wall_material_type_0_816c36ae_fk_catalog_f FOREIGN KEY (wall_material_type_0_id) REFERENCES public.catalog_facadematerialtype(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.catalog_shell DROP CONSTRAINT catalog_shell_wall_material_type_0_816c36ae_fk_catalog_f;
       public          postgres    false    3283    300    298         �           2606    30565 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3039    205    219         �           2606    30570 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    219    213    3057         �           2606    30669 G   geography_city geography_city_region_id_ea133d50_fk_geography_region_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.geography_city
    ADD CONSTRAINT geography_city_region_id_ea133d50_fk_geography_region_id FOREIGN KEY (region_id) REFERENCES public.geography_region(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.geography_city DROP CONSTRAINT geography_city_region_id_ea133d50_fk_geography_region_id;
       public          postgres    false    229    231    3106         �           2606    30662 M   geography_region geography_region_country_id_7b89c739_fk_geography_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_country_id_7b89c739_fk_geography_country_id FOREIGN KEY (country_id) REFERENCES public.geography_country(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_country_id_7b89c739_fk_geography_country_id;
       public          postgres    false    3098    227    229         �           2606    31019 Q   materialprices_insulationprice materialprices_insul_name_id_a70a0ae5_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insul_name_id_a70a0ae5_fk_materials FOREIGN KEY (name_id) REFERENCES public.materials_insulation(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.materialprices_insulationprice DROP CONSTRAINT materialprices_insul_name_id_a70a0ae5_fk_materials;
       public          postgres    false    265    269    3200         �           2606    31024 R   materialprices_insulationprice materialprices_insul_owner_id_ea647b28_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insul_owner_id_ea647b28_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.materialprices_insulationprice DROP CONSTRAINT materialprices_insul_owner_id_ea647b28_fk_auth_user;
       public          postgres    false    269    3057    213         �           2606    31007 W   materialprices_rockwallmaterialprice materialprices_rockw_name_id_5a769348_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockw_name_id_5a769348_fk_materials FOREIGN KEY (name_id) REFERENCES public.materials_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice DROP CONSTRAINT materialprices_rockw_name_id_5a769348_fk_materials;
       public          postgres    false    267    3195    263         �           2606    31012 X   materialprices_rockwallmaterialprice materialprices_rockw_owner_id_ea24bd0d_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockw_owner_id_ea24bd0d_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice DROP CONSTRAINT materialprices_rockw_owner_id_ea24bd0d_fk_auth_user;
       public          postgres    false    3057    267    213         �           2606    30985 N   materials_insulation materials_insulation_brand_id_dd7669b2_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_insulation
    ADD CONSTRAINT materials_insulation_brand_id_dd7669b2_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.materials_insulation DROP CONSTRAINT materials_insulation_brand_id_dd7669b2_fk_brands_brand_id;
       public          postgres    false    3081    221    265                    2606    31223 H   materials_plaster materials_plaster_brand_id_cc3e5323_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster
    ADD CONSTRAINT materials_plaster_brand_id_cc3e5323_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.materials_plaster DROP CONSTRAINT materials_plaster_brand_id_cc3e5323_fk_brands_brand_id;
       public          postgres    false    284    221    3081                    2606    31228 I   materials_plaster materials_plaster_manufacturer_id_060021cd_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster
    ADD CONSTRAINT materials_plaster_manufacturer_id_060021cd_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.materials_plaster DROP CONSTRAINT materials_plaster_manufacturer_id_060021cd_fk_suppliers;
       public          postgres    false    3144    243    284         	           2606    31242 O   materials_plaster_use materials_plaster_us_materialuse_id_3f0e40e1_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_us_materialuse_id_3f0e40e1_fk_materials FOREIGN KEY (materialuse_id) REFERENCES public.materials_materialuse(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.materials_plaster_use DROP CONSTRAINT materials_plaster_us_materialuse_id_3f0e40e1_fk_materials;
       public          postgres    false    3228    286    276                    2606    31237 K   materials_plaster_use materials_plaster_us_plaster_id_1ce61346_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_us_plaster_id_1ce61346_fk_materials FOREIGN KEY (plaster_id) REFERENCES public.materials_plaster(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.materials_plaster_use DROP CONSTRAINT materials_plaster_us_plaster_id_1ce61346_fk_materials;
       public          postgres    false    3250    284    286         �           2606    30919 V   materials_rockwallmaterialunit materials_rockwallma_algorithm_id_4183f114_fk_catalog_a    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_algorithm_id_4183f114_fk_catalog_a FOREIGN KEY (algorithm_id) REFERENCES public.catalog_algorithm(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_algorithm_id_4183f114_fk_catalog_a;
       public          postgres    false    263    233    3117         �           2606    30924 R   materials_rockwallmaterialunit materials_rockwallma_brand_id_4deb8894_fk_brands_br    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_brand_id_4deb8894_fk_brands_br FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_brand_id_4deb8894_fk_brands_br;
       public          postgres    false    221    263    3081         �           2606    30929 ^   materials_rockwallmaterialunit materials_rockwallma_class_average_densit_beb6fff9_fk_standards    FK CONSTRAINT       ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_class_average_densit_beb6fff9_fk_standards FOREIGN KEY (class_average_density_id) REFERENCES public."standards_classаveragedensity"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_class_average_densit_beb6fff9_fk_standards;
       public          postgres    false    247    263    3154         �           2606    30934 T   materials_rockwallmaterialunit materials_rockwallma_class_b_id_1de59e0b_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_class_b_id_1de59e0b_fk_standards FOREIGN KEY (class_b_id) REFERENCES public.standards_classb(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_class_b_id_1de59e0b_fk_standards;
       public          postgres    false    3149    245    263         �           2606    30939 Q   materials_rockwallmaterialunit materials_rockwallma_face_id_712ecb1a_fk_names_dec    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_face_id_712ecb1a_fk_names_dec FOREIGN KEY (face_id) REFERENCES public.names_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_face_id_712ecb1a_fk_names_dec;
       public          postgres    false    263    257    3176         �           2606    30944 Y   materials_rockwallmaterialunit materials_rockwallma_manufacturer_id_c1176543_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_manufacturer_id_c1176543_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_manufacturer_id_c1176543_fk_suppliers;
       public          postgres    false    3144    263    243         �           2606    30949 S   materials_rockwallmaterialunit materials_rockwallma_mark_d_id_e456d3f5_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_d_id_e456d3f5_fk_standards FOREIGN KEY (mark_d_id) REFERENCES public.standards_markd(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_mark_d_id_e456d3f5_fk_standards;
       public          postgres    false    263    3159    249         �           2606    30954 S   materials_rockwallmaterialunit materials_rockwallma_mark_f_id_48ec4578_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_f_id_48ec4578_fk_standards FOREIGN KEY (mark_f_id) REFERENCES public.standards_markf(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_mark_f_id_48ec4578_fk_standards;
       public          postgres    false    3164    263    251         �           2606    30959 S   materials_rockwallmaterialunit materials_rockwallma_mark_m_id_e96cf97b_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_m_id_e96cf97b_fk_standards FOREIGN KEY (mark_m_id) REFERENCES public.standards_markm(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_mark_m_id_e96cf97b_fk_standards;
       public          postgres    false    263    253    3169         �           2606    30964 X   materials_rockwallmaterialunit materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su FOREIGN KEY (sub_brand_1_id) REFERENCES public.brands_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su;
       public          postgres    false    263    3087    223         �           2606    30969 X   materials_rockwallmaterialunit materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su FOREIGN KEY (sub_brand_2_id) REFERENCES public.brands_subbrand_2(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su;
       public          postgres    false    3092    263    225                    2606    31191 F   materials_siding materials_siding_brand_id_947adead_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding
    ADD CONSTRAINT materials_siding_brand_id_947adead_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.materials_siding DROP CONSTRAINT materials_siding_brand_id_947adead_fk_brands_brand_id;
       public          postgres    false    280    3081    221                    2606    31196 G   materials_siding materials_siding_manufacturer_id_4bd6fcdc_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding
    ADD CONSTRAINT materials_siding_manufacturer_id_4bd6fcdc_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.materials_siding DROP CONSTRAINT materials_siding_manufacturer_id_4bd6fcdc_fk_suppliers;
       public          postgres    false    3144    243    280                    2606    31210 N   materials_siding_use materials_siding_use_materialuse_id_27444db6_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_materialuse_id_27444db6_fk_materials FOREIGN KEY (materialuse_id) REFERENCES public.materials_materialuse(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.materials_siding_use DROP CONSTRAINT materials_siding_use_materialuse_id_27444db6_fk_materials;
       public          postgres    false    276    3228    282                    2606    31205 S   materials_siding_use materials_siding_use_siding_id_a2f23e27_fk_materials_siding_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_siding_id_a2f23e27_fk_materials_siding_id FOREIGN KEY (siding_id) REFERENCES public.materials_siding(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_siding_use DROP CONSTRAINT materials_siding_use_siding_id_a2f23e27_fk_materials_siding_id;
       public          postgres    false    282    280    3240         
           2606    31315 U   materials_stoneproductline materials_stoneprodu_manufacturer_id_c1271051_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline
    ADD CONSTRAINT materials_stoneprodu_manufacturer_id_c1271051_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.materials_stoneproductline DROP CONSTRAINT materials_stoneprodu_manufacturer_id_c1271051_fk_suppliers;
       public          postgres    false    243    288    3144                    2606    31328 X   materials_stoneproductline_use materials_stoneprodu_materialuse_id_7e20150f_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneprodu_materialuse_id_7e20150f_fk_materials FOREIGN KEY (materialuse_id) REFERENCES public.materials_materialuse(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_stoneproductline_use DROP CONSTRAINT materials_stoneprodu_materialuse_id_7e20150f_fk_materials;
       public          postgres    false    3228    290    276                    2606    31323 ]   materials_stoneproductline_use materials_stoneprodu_stoneproductline_id_6477c585_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneprodu_stoneproductline_id_6477c585_fk_materials FOREIGN KEY (stoneproductline_id) REFERENCES public.materials_stoneproductline(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_stoneproductline_use DROP CONSTRAINT materials_stoneprodu_stoneproductline_id_6477c585_fk_materials;
       public          postgres    false    290    3259    288                    2606    31335 M   materials_stoneunit materials_stoneunit_product_line_id_c1b449ac_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_stoneunit
    ADD CONSTRAINT materials_stoneunit_product_line_id_c1b449ac_fk_materials FOREIGN KEY (product_line_id) REFERENCES public.materials_stoneproductline(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.materials_stoneunit DROP CONSTRAINT materials_stoneunit_product_line_id_c1b449ac_fk_materials;
       public          postgres    false    292    3259    288         �           2606    30888 S   names_decorativebrickface_brand names_decorativebric_brand_id_92646ca6_fk_brands_br    FK CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebric_brand_id_92646ca6_fk_brands_br FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebric_brand_id_92646ca6_fk_brands_br;
       public          postgres    false    221    259    3081         �           2606    30883 _   names_decorativebrickface_brand names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec    FK CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec FOREIGN KEY (decorativebrickface_id) REFERENCES public.names_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec;
       public          postgres    false    259    3176    257         �           2606    30786 R   suppliers_manufacturer suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id;
       public          postgres    false    243    221    3081         �           2606    30791 S   suppliers_manufacturer suppliers_manufacturer_city_id_734a9037_fk_geography_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_city_id_734a9037_fk_geography_city_id FOREIGN KEY (city_id) REFERENCES public.geography_city(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_city_id_734a9037_fk_geography_city_id;
       public          postgres    false    3108    231    243         �           2606    30765 O   suppliers_provider suppliers_provider_primary_activity_id_93261e15_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_primary_activity_id_93261e15_fk_suppliers FOREIGN KEY (primary_activity_id) REFERENCES public.suppliers_activity(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.suppliers_provider DROP CONSTRAINT suppliers_provider_primary_activity_id_93261e15_fk_suppliers;
       public          postgres    false    237    239    3125         �           2606    30779 \   suppliers_provider_secondary_activity suppliers_provider_s_activity_id_31284a51_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_s_activity_id_31284a51_fk_suppliers FOREIGN KEY (activity_id) REFERENCES public.suppliers_activity(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_s_activity_id_31284a51_fk_suppliers;
       public          postgres    false    237    3125    241         �           2606    30774 \   suppliers_provider_secondary_activity suppliers_provider_s_provider_id_2fab0709_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_s_provider_id_2fab0709_fk_suppliers FOREIGN KEY (provider_id) REFERENCES public.suppliers_provider(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_s_provider_id_2fab0709_fk_suppliers;
       public          postgres    false    239    241    3130         �           2606    31049 _   workprices_pilegrillagefoundationworkprices workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices
    ADD CONSTRAINT workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices DROP CONSTRAINT workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user;
       public          postgres    false    272    213    3057                                                                                     3544.dat                                                                                            0000600 0004000 0002000 00000000023 13672302352 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1		1	1
2		2	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             3479.dat                                                                                            0000600 0004000 0002000 00000000024 13672302352 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Клиент
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            3481.dat                                                                                            0000600 0004000 0002000 00000000005 13672302352 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3477.dat                                                                                            0000600 0004000 0002000 00000025413 13672302352 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Алгоритм	7	add_algorithm
26	Can change Алгоритм	7	change_algorithm
27	Can delete Алгоритм	7	delete_algorithm
28	Can view Алгоритм	7	view_algorithm
29	Can add Профиль пользователя	8	add_profile
30	Can change Профиль пользователя	8	change_profile
31	Can delete Профиль пользователя	8	delete_profile
32	Can view Профиль пользователя	8	view_profile
33	Can add Проект	9	add_plan
34	Can change Проект	9	change_plan
35	Can delete Проект	9	delete_plan
36	Can view Проект	9	view_plan
37	Can add Песок россыпью в самосвалах	10	add_bulksand
38	Can change Песок россыпью в самосвалах	10	change_bulksand
39	Can delete Песок россыпью в самосвалах	10	delete_bulksand
40	Can view Песок россыпью в самосвалах	10	view_bulksand
41	Can add Единица стенового материала	11	add_rockwallmaterialunit
42	Can change Единица стенового материала	11	change_rockwallmaterialunit
43	Can delete Единица стенового материала	11	delete_rockwallmaterialunit
44	Can view Единица стенового материала	11	view_rockwallmaterialunit
45	Can add Утеплитель	12	add_insulation
46	Can change Утеплитель	12	change_insulation
47	Can delete Утеплитель	12	delete_insulation
48	Can view Утеплитель	12	view_insulation
49	Can add Вид деятельности	13	add_activity
50	Can change Вид деятельности	13	change_activity
51	Can delete Вид деятельности	13	delete_activity
52	Can view Вид деятельности	13	view_activity
53	Can add Поставщик услуг/материалов	14	add_provider
54	Can change Поставщик услуг/материалов	14	change_provider
55	Can delete Поставщик услуг/материалов	14	delete_provider
56	Can view Поставщик услуг/материалов	14	view_provider
57	Can add Производитель материала	15	add_manufacturer
58	Can change Производитель материала	15	change_manufacturer
59	Can delete Производитель материала	15	delete_manufacturer
60	Can view Производитель материала	15	view_manufacturer
61	Can add Страна	16	add_country
62	Can change Страна	16	change_country
63	Can delete Страна	16	delete_country
64	Can view Страна	16	view_country
65	Can add Регион	17	add_region
66	Can change Регион	17	change_region
67	Can delete Регион	17	delete_region
68	Can view Регион	17	view_region
69	Can add Город	18	add_city
70	Can change Город	18	change_city
71	Can delete Город	18	delete_city
72	Can view Город	18	view_city
73	Can add Основной бренд	19	add_brand
74	Can change Основной бренд	19	change_brand
75	Can delete Основной бренд	19	delete_brand
76	Can view Основной бренд	19	view_brand
77	Can add Подбренд 1)	20	add_subbrand_1
78	Can change Подбренд 1)	20	change_subbrand_1
79	Can delete Подбренд 1)	20	delete_subbrand_1
80	Can view Подбренд 1)	20	view_subbrand_1
81	Can add Подбренд 2)	21	add_subbrand_2
82	Can change Подбренд 2)	21	change_subbrand_2
83	Can delete Подбренд 2)	21	delete_subbrand_2
84	Can view Подбренд 2)	21	view_subbrand_2
85	Can add Названея декоративной грани рядового кирпича	22	add_decorativebrickface
86	Can change Названея декоративной грани рядового кирпича	22	change_decorativebrickface
87	Can delete Названея декоративной грани рядового кирпича	22	delete_decorativebrickface
88	Can view Названея декоративной грани рядового кирпича	22	view_decorativebrickface
89	Can add Класс В бетона	23	add_classb
90	Can change Класс В бетона	23	change_classb
91	Can delete Класс В бетона	23	delete_classb
92	Can view Класс В бетона	23	view_classb
93	Can add Класс средней плотности	24	add_classаveragedensity
94	Can change Класс средней плотности	24	change_classаveragedensity
95	Can delete Класс средней плотности	24	delete_classаveragedensity
96	Can view Класс средней плотности	24	view_classаveragedensity
97	Can add Марка D	25	add_markd
98	Can change Марка D	25	change_markd
99	Can delete Марка D	25	delete_markd
100	Can view Марка D	25	view_markd
101	Can add Марка морозостойкости F	26	add_markf
102	Can change Марка морозостойкости F	26	change_markf
103	Can delete Марка морозостойкости F	26	delete_markf
104	Can view Марка морозостойкости F	26	view_markf
105	Can add Марка М	27	add_markm
106	Can change Марка М	27	change_markm
107	Can delete Марка М	27	delete_markm
108	Can view Марка М	27	view_markm
109	Can add Размер НФ	28	add_nfsize
110	Can change Размер НФ	28	change_nfsize
111	Can delete Размер НФ	28	delete_nfsize
112	Can view Размер НФ	28	view_nfsize
113	Can add Цены каменные стеновые материалы	29	add_rockwallmaterialprice
114	Can change Цены каменные стеновые материалы	29	change_rockwallmaterialprice
115	Can delete Цены каменные стеновые материалы	29	delete_rockwallmaterialprice
116	Can view Цены каменные стеновые материалы	29	view_rockwallmaterialprice
117	Can add Цены утеплители	30	add_insulationprice
118	Can change Цены утеплители	30	change_insulationprice
119	Can delete Цены утеплители	30	delete_insulationprice
120	Can view Цены утеплители	30	view_insulationprice
121	Can add Стоимость свайно-ростверкового фундамента	31	add_pilegrillagefoundationworkprices
122	Can change Стоимость свайно-ростверкового фундамента	31	change_pilegrillagefoundationworkprices
123	Can delete Стоимость свайно-ростверкового фундамента	31	delete_pilegrillagefoundationworkprices
124	Can view Стоимость свайно-ростверкового фундамента	31	view_pilegrillagefoundationworkprices
125	Can add profile	32	add_profile
126	Can change profile	32	change_profile
127	Can delete profile	32	delete_profile
128	Can view profile	32	view_profile
129	Can add roof cover type	33	add_roofcovertype
130	Can change roof cover type	33	change_roofcovertype
131	Can delete roof cover type	33	delete_roofcovertype
132	Can view roof cover type	33	view_roofcovertype
133	Can add metal tile	34	add_metaltile
134	Can change metal tile	34	change_metaltile
135	Can delete metal tile	34	delete_metaltile
136	Can view metal tile	34	view_metaltile
137	Can add flexible tile	35	add_flexibletile
138	Can change flexible tile	35	change_flexibletile
139	Can delete flexible tile	35	delete_flexibletile
140	Can view flexible tile	35	view_flexibletile
141	Can add Назначение материала	36	add_materialuse
142	Can change Назначение материала	36	change_materialuse
143	Can delete Назначение материала	36	delete_materialuse
144	Can view Назначение материала	36	view_materialuse
145	Can add selfbearing stone product line	37	add_selfbearingstoneproductline
146	Can change selfbearing stone product line	37	change_selfbearingstoneproductline
147	Can delete selfbearing stone product line	37	delete_selfbearingstoneproductline
148	Can view selfbearing stone product line	37	view_selfbearingstoneproductline
149	Can add siding	38	add_siding
150	Can change siding	38	change_siding
151	Can delete siding	38	delete_siding
152	Can view siding	38	view_siding
153	Can add plaster	39	add_plaster
154	Can change plaster	39	change_plaster
155	Can delete plaster	39	delete_plaster
156	Can view plaster	39	view_plaster
157	Can add selfbearing stone unit	40	add_selfbearingstoneunit
158	Can change selfbearing stone unit	40	change_selfbearingstoneunit
159	Can delete selfbearing stone unit	40	delete_selfbearingstoneunit
160	Can view selfbearing stone unit	40	view_selfbearingstoneunit
161	Can add Кровельный материал	41	add_roofcovermaterial
162	Can change Кровельный материал	41	change_roofcovermaterial
163	Can delete Кровельный материал	41	delete_roofcovermaterial
164	Can view Кровельный материал	41	view_roofcovermaterial
165	Can add stone unit	42	add_stoneunit
166	Can change stone unit	42	change_stoneunit
167	Can delete stone unit	42	delete_stoneunit
168	Can view stone unit	42	view_stoneunit
169	Can add stone product line	43	add_stoneproductline
170	Can change stone product line	43	change_stoneproductline
171	Can delete stone product line	43	delete_stoneproductline
172	Can view stone product line	43	view_stoneproductline
173	Can add Тип фасадного (облицовочного) материала	44	add_facadematerialtype
174	Can change Тип фасадного (облицовочного) материала	44	change_facadematerialtype
175	Can delete Тип фасадного (облицовочного) материала	44	delete_facadematerialtype
176	Can view Тип фасадного (облицовочного) материала	44	view_facadematerialtype
177	Can add Шаблон оформления фасада	45	add_shell
178	Can change Шаблон оформления фасада	45	change_shell
179	Can delete Шаблон оформления фасада	45	delete_shell
180	Can view Шаблон оформления фасада	45	view_shell
\.


                                                                                                                                                                                                                                                     3483.dat                                                                                            0000600 0004000 0002000 00000001005 13672302352 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	pbkdf2_sha256$180000$HazoqEyLXWTs$oxnxkZsg9GKmBYk+ee2D7pJuPaz5Wa+om0rzL4rA2R8=	2020-05-26 15:30:24+03	f	Мегастрой	Александр		2594501@mail.ru	f	t	2020-05-26 15:30:19+03
1	pbkdf2_sha256$180000$qhTrD1Vx6b9U$vGtCpCRX5E0pO8feNTQ2LFlW6I7sPQOPWS2SXEN61Ro=	2020-06-05 17:29:07.050105+03	t	admin	Александр	Луценко	2594501@mail.ru	t	t	2020-03-17 15:04:16+03
3	pbkdf2_sha256$180000$qXCn3e8fpizr$hvSR2uPQutmpH4PLVwvUMApGTMda47Zy3Z2Sh5bbFVo=	\N	f	test				f	t	2020-06-17 04:57:49.321838+03
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3485.dat                                                                                            0000600 0004000 0002000 00000000021 13672302353 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
2	2	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               3487.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3491.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3493.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3495.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3503.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3568.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3505.dat                                                                                            0000600 0004000 0002000 00000006415 13672302353 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	New plan	"{\\"elements\\":[{\\"id\\":0,\\"ids\\":[0],\\"type\\":\\"wall\\",\\"subType\\":\\"\\",\\"level\\":\\"floor_1\\"},{\\"id\\":1,\\"ids\\":[1],\\"type\\":\\"wall\\",\\"subType\\":\\"\\",\\"level\\":\\"floor_1\\"},{\\"id\\":2,\\"ids\\":[2],\\"type\\":\\"wall\\",\\"subType\\":\\"\\",\\"level\\":\\"floor_1\\"},{\\"id\\":3,\\"ids\\":[3],\\"type\\":\\"wall\\",\\"subType\\":\\"\\",\\"level\\":\\"floor_1\\"},{\\"id\\":4,\\"ids\\":[4],\\"type\\":\\"wall\\",\\"subType\\":\\"\\",\\"level\\":\\"floor_1\\"},{\\"id\\":5,\\"ids\\":[5],\\"type\\":\\"wall\\",\\"subType\\":\\"\\",\\"level\\":\\"floor_1\\"},{\\"id\\":6,\\"ids\\":[6,7,8,9],\\"type\\":\\"roof\\"},{\\"id\\":7,\\"ids\\":[10,11,12,13],\\"type\\":\\"roof\\"}],\\"lines\\":[{\\"id\\":0,\\"id0\\":0,\\"id1\\":1,\\"distance\\":0,\\"direction\\":\\"\\"},{\\"id\\":1,\\"id0\\":2,\\"id1\\":3,\\"distance\\":0,\\"direction\\":\\"\\"},{\\"id\\":2,\\"id0\\":4,\\"id1\\":5,\\"distance\\":0,\\"direction\\":\\"\\"},{\\"id\\":3,\\"id0\\":6,\\"id1\\":7,\\"distance\\":0,\\"direction\\":\\"\\"},{\\"id\\":4,\\"id0\\":8,\\"id1\\":9,\\"distance\\":0,\\"direction\\":\\"\\"},{\\"id\\":5,\\"id0\\":10,\\"id1\\":11,\\"distance\\":0,\\"direction\\":\\"\\"},{\\"id\\":6,\\"id0\\":12,\\"id1\\":13},{\\"id\\":7,\\"id0\\":13,\\"id1\\":14},{\\"id\\":8,\\"id0\\":14,\\"id1\\":15},{\\"id\\":9,\\"id0\\":15,\\"id1\\":12},{\\"id\\":10,\\"id0\\":16,\\"id1\\":17},{\\"id\\":11,\\"id0\\":17,\\"id1\\":18},{\\"id\\":12,\\"id0\\":18,\\"id1\\":19},{\\"id\\":13,\\"id0\\":19,\\"id1\\":16}],\\"points\\":[{\\"id\\":12,\\"x\\":-1600,\\"y\\":-1350,\\"height\\":0,\\"is_floor_1\\":true,\\"is_floor_2\\":false,\\"is_floor_3\\":false,\\"total_height\\":3000},{\\"id\\":13,\\"x\\":2800,\\"y\\":-1350,\\"is_floor_1\\":true,\\"is_floor_2\\":false,\\"is_floor_3\\":false,\\"height\\":1000,\\"total_height\\":4000},{\\"id\\":16,\\"x\\":2800,\\"y\\":-1350,\\"is_floor_1\\":true,\\"is_floor_2\\":false,\\"is_floor_3\\":false,\\"height\\":1000,\\"total_height\\":4000},{\\"id\\":17,\\"x\\":7400,\\"y\\":-1350,\\"is_floor_1\\":true,\\"is_floor_2\\":false,\\"is_floor_3\\":false,\\"height\\":0,\\"total_height\\":3000},{\\"id\\":0,\\"x\\":-600,\\"y\\":-350},{\\"id\\":7,\\"x\\":-600,\\"y\\":-350},{\\"id\\":1,\\"x\\":6400,\\"y\\":-350},{\\"id\\":2,\\"x\\":6400,\\"y\\":-350},{\\"id\\":8,\\"x\\":-600,\\"y\\":2650},{\\"id\\":10,\\"x\\":3400,\\"y\\":2650},{\\"id\\":9,\\"x\\":6400,\\"y\\":2650},{\\"id\\":5,\\"x\\":-600,\\"y\\":5650},{\\"id\\":6,\\"x\\":-600,\\"y\\":5650},{\\"id\\":11,\\"x\\":3400,\\"y\\":5650},{\\"id\\":3,\\"x\\":6400,\\"y\\":5650},{\\"id\\":4,\\"x\\":6400,\\"y\\":5650},{\\"id\\":15,\\"x\\":-1600,\\"y\\":6650,\\"is_floor_1\\":true,\\"is_floor_2\\":false,\\"is_floor_3\\":false,\\"height\\":0,\\"total_height\\":3000},{\\"id\\":14,\\"x\\":2800,\\"y\\":6650,\\"is_floor_1\\":true,\\"is_floor_2\\":false,\\"is_floor_3\\":false,\\"height\\":1000,\\"total_height\\":4000},{\\"id\\":19,\\"x\\":2800,\\"y\\":6650,\\"height\\":1000,\\"is_floor_1\\":true,\\"is_floor_2\\":false,\\"is_floor_3\\":false,\\"total_height\\":4000},{\\"id\\":18,\\"x\\":7400,\\"y\\":6650,\\"is_floor_1\\":true,\\"is_floor_2\\":false,\\"is_floor_3\\":false,\\"height\\":0,\\"total_height\\":3000}],\\"vents\\":[],\\"windows\\":[],\\"doorWindows\\":[],\\"openings\\":[],\\"scale\\":25,\\"zeroPointPadding\\":{\\"x\\":5275,\\"y\\":4575}}"	f	1
\.


                                                                                                                                                                                                                                                   3570.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3489.dat                                                                                            0000600 0004000 0002000 00000004060 13672302353 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2020-05-26 11:35:50.807776+03	3	New plan	2	[{"changed": {"fields": ["\\u0410\\u0432\\u0442\\u043e\\u0440"]}}]	9	1
2	2020-05-26 11:36:44.18883+03	3	New plan	3		9	1
3	2020-05-26 17:35:18.204361+03	1	Profile for user admin	1	[{"added": {}}]	32	1
4	2020-05-26 17:35:25.761793+03	2	Profile for user Мегастрой	1	[{"added": {}}]	32	1
5	2020-05-26 17:58:22.120516+03	4	New plan	2	[{"changed": {"fields": ["\\u0410\\u0432\\u0442\\u043e\\u0440"]}}]	9	1
6	2020-05-26 19:48:09.813311+03	1	Россия	1	[{"added": {}}]	16	1
7	2020-05-26 19:48:15.770652+03	1	Татарстан	1	[{"added": {}}]	17	1
8	2020-05-26 19:48:21.116957+03	1	Казань	1	[{"added": {}}]	18	1
9	2020-05-26 19:48:27.055297+03	1	Profile for user admin	2	[{"changed": {"fields": ["City"]}}]	32	1
10	2020-05-26 19:48:34.001694+03	2	Profile for user Мегастрой	2	[{"changed": {"fields": ["City"]}}]	32	1
11	2020-05-26 19:50:27.803203+03	1	Клиент	1	[{"added": {}}]	3	1
12	2020-05-26 19:50:56.174826+03	1	admin	2	[{"changed": {"fields": ["Groups"]}}]	4	1
13	2020-05-26 19:51:04.075278+03	2	Мегастрой	2	[{"changed": {"fields": ["Groups"]}}]	4	1
14	2020-06-03 11:56:31.045469+03	1	Металлочерепица, metal_tile  	1	[{"added": {}}]	33	1
15	2020-06-03 11:56:55.726881+03	2	Гибкая черепица, flexible_tile  	1	[{"added": {}}]	33	1
16	2020-06-03 13:31:37.928884+03	2	Монтеррей, Металлочерепица  	1	[{"added": {}}]	41	1
17	2020-06-03 13:32:33.031036+03	3	SHINGLAS Континент (Азия), Гибкая черепица  	1	[{"added": {}}]	41	1
18	2020-06-03 13:35:01.023501+03	3	SHINGLAS Континент (Азия), Гибкая черепица  	3		41	1
19	2020-06-03 13:35:01.028501+03	2	Монтеррей, Металлочерепица  	3		41	1
20	2020-06-03 13:39:33.101063+03	4	Монтеррей, Металлочерепица  	1	[{"added": {}}]	41	1
21	2020-06-03 13:40:07.207013+03	5	Континент (Азия), Гибкая черепица  	1	[{"added": {}}]	41	1
22	2020-06-17 04:57:49.778864+03	3	test	1	[{"added": {}}]	4	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                3475.dat                                                                                            0000600 0004000 0002000 00000002067 13672302353 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	catalog	algorithm
8	catalog	profile
9	catalog	plan
10	materials	bulksand
11	materials	rockwallmaterialunit
12	materials	insulation
13	suppliers	activity
14	suppliers	provider
15	suppliers	manufacturer
16	geography	country
17	geography	region
18	geography	city
19	brands	brand
20	brands	subbrand_1
21	brands	subbrand_2
22	names	decorativebrickface
23	standards	classb
24	standards	classаveragedensity
25	standards	markd
26	standards	markf
27	standards	markm
28	standards	nfsize
29	materialprices	rockwallmaterialprice
30	materialprices	insulationprice
31	workprices	pilegrillagefoundationworkprices
32	account	profile
33	materials	roofcovertype
34	materials	metaltile
35	materials	flexibletile
36	materials	materialuse
37	materials	selfbearingstoneproductline
38	materials	siding
39	materials	plaster
40	materials	selfbearingstoneunit
41	materials	roofcovermaterial
42	materials	stoneunit
43	materials	stoneproductline
44	catalog	facadematerialtype
45	catalog	shell
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                         3473.dat                                                                                            0000600 0004000 0002000 00000004741 13672302353 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	contenttypes	0001_initial	2020-03-17 15:02:02.481316+03
2	auth	0001_initial	2020-03-17 15:02:02.55832+03
3	admin	0001_initial	2020-03-17 15:02:02.666327+03
4	admin	0002_logentry_remove_auto_add	2020-03-17 15:02:02.690328+03
5	admin	0003_logentry_add_action_flag_choices	2020-03-17 15:02:02.701329+03
6	contenttypes	0002_remove_content_type_name	2020-03-17 15:02:02.72433+03
7	auth	0002_alter_permission_name_max_length	2020-03-17 15:02:02.73133+03
8	auth	0003_alter_user_email_max_length	2020-03-17 15:02:02.742331+03
9	auth	0004_alter_user_username_opts	2020-03-17 15:02:02.755332+03
10	auth	0005_alter_user_last_login_null	2020-03-17 15:02:02.766332+03
11	auth	0006_require_contenttypes_0002	2020-03-17 15:02:02.769332+03
12	auth	0007_alter_validators_add_error_messages	2020-03-17 15:02:02.780333+03
13	auth	0008_alter_user_username_max_length	2020-03-17 15:02:02.820335+03
14	auth	0009_alter_user_last_name_max_length	2020-03-17 15:02:02.834336+03
15	auth	0010_alter_group_name_max_length	2020-03-17 15:02:02.848337+03
16	auth	0011_update_proxy_permissions	2020-03-17 15:02:02.859338+03
17	brands	0001_initial	2020-03-17 15:02:03.001346+03
18	geography	0001_initial	2020-03-17 15:02:03.07835+03
19	catalog	0001_initial	2020-03-17 15:02:03.178356+03
20	suppliers	0001_initial	2020-03-17 15:02:03.276361+03
21	standards	0001_initial	2020-03-17 15:02:03.529376+03
22	names	0001_initial	2020-03-17 15:02:03.59838+03
23	materials	0001_initial	2020-03-17 15:02:03.631382+03
24	materials	0002_auto_20200317_1501	2020-03-17 15:02:03.704386+03
25	materialprices	0001_initial	2020-03-17 15:02:03.893397+03
26	sessions	0001_initial	2020-03-17 15:02:03.938399+03
27	workprices	0001_initial	2020-03-17 15:02:03.987402+03
28	account	0001_initial	2020-05-26 16:16:44.414748+03
29	catalog	0002_delete_profile	2020-05-26 16:16:44.45175+03
30	account	0002_profile_city	2020-05-26 19:46:47.603609+03
31	materials	0003_flexibletile_materialuse_metaltile_plaster_roofcovertype_selfbearingstoneproductline_selfbearingston	2020-06-03 10:22:24.040479+03
32	materials	0004_auto_20200603_1310	2020-06-03 13:10:37.928816+03
33	materials	0005_roofcovermaterial_texture	2020-06-03 13:37:03.339497+03
34	materials	0006_auto_20200603_1433	2020-06-03 14:33:15.207357+03
35	materials	0007_stoneproductline_stoneunit	2020-06-03 14:34:00.672957+03
36	materials	0008_auto_20200603_1456	2020-06-03 14:56:47.777151+03
37	materials	0009_auto_20200605_1718	2020-06-05 17:18:13.195707+03
38	catalog	0003_facadematerialtype_shell	2020-06-05 17:18:13.320714+03
\.


                               3540.dat                                                                                            0000600 0004000 0002000 00000002364 13672302353 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        a6coxbqlexit10avw2ougy4mex66z37t	NTE3ZGNhZTI3Nzk5OTRhNDVkYTFjODIyMzUwMjdmNmJjZWExOGMzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2E2MzkyMmFmNzRkZjQ4NWYzNGE4NzA3MGJmZjdiZDg1OTUxMjEyIn0=	2020-03-31 15:04:29.648733+03
1bm0hm8rwnvuenpzj20sxgv0m9pcj9fm	NTE3ZGNhZTI3Nzk5OTRhNDVkYTFjODIyMzUwMjdmNmJjZWExOGMzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2E2MzkyMmFmNzRkZjQ4NWYzNGE4NzA3MGJmZjdiZDg1OTUxMjEyIn0=	2020-04-20 14:18:00.122147+03
bxnrldmsuyzh68v8bsz7cz16kx9ghgod	NTE3ZGNhZTI3Nzk5OTRhNDVkYTFjODIyMzUwMjdmNmJjZWExOGMzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2E2MzkyMmFmNzRkZjQ4NWYzNGE4NzA3MGJmZjdiZDg1OTUxMjEyIn0=	2020-05-07 13:11:00.50997+03
9vonrmqshs4pgy0y0qgsyvenmf0uy922	NTE3ZGNhZTI3Nzk5OTRhNDVkYTFjODIyMzUwMjdmNmJjZWExOGMzZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2E2MzkyMmFmNzRkZjQ4NWYzNGE4NzA3MGJmZjdiZDg1OTUxMjEyIn0=	2020-06-19 17:29:07.052105+03
\.


                                                                                                                                                                                                                                                                            3501.dat                                                                                            0000600 0004000 0002000 00000000032 13672302353 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Казань	1	1	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      3497.dat                                                                                            0000600 0004000 0002000 00000000024 13672302353 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Россия
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            3499.dat                                                                                            0000600 0004000 0002000 00000000037 13672302353 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Татарстан	16	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 3539.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3537.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3531.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3564.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3535.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3546.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3566.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3554.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3556.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3533.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3548.dat                                                                                            0000600 0004000 0002000 00000000137 13672302353 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Металлочерепица	metal_tile
2	Гибкая черепица	flexible_tile
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                 3550.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3552.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3558.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3560.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3562.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3527.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3529.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3515.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3517.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3519.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3521.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3523.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3525.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3507.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3513.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3509.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3511.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3542.dat                                                                                            0000600 0004000 0002000 00000000005 13672302353 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000415316 13672302353 0015402 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres2;
--
-- Name: postgres2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE postgres2 OWNER TO postgres;

\connect postgres2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_profile (
    id integer NOT NULL,
    photo character varying(100) NOT NULL,
    user_id integer NOT NULL,
    city_id integer
);


ALTER TABLE public.account_profile OWNER TO postgres;

--
-- Name: account_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_profile_id_seq OWNER TO postgres;

--
-- Name: account_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_profile_id_seq OWNED BY public.account_profile.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
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


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: brands_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands_brand (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.brands_brand OWNER TO postgres;

--
-- Name: brands_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_brand_id_seq OWNER TO postgres;

--
-- Name: brands_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_brand_id_seq OWNED BY public.brands_brand.id;


--
-- Name: brands_subbrand_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands_subbrand_1 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    brand_id integer
);


ALTER TABLE public.brands_subbrand_1 OWNER TO postgres;

--
-- Name: brands_subbrand_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_subbrand_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_subbrand_1_id_seq OWNER TO postgres;

--
-- Name: brands_subbrand_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_subbrand_1_id_seq OWNED BY public.brands_subbrand_1.id;


--
-- Name: brands_subbrand_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands_subbrand_2 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    sub_brand_1_id integer NOT NULL
);


ALTER TABLE public.brands_subbrand_2 OWNER TO postgres;

--
-- Name: brands_subbrand_2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_subbrand_2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_subbrand_2_id_seq OWNER TO postgres;

--
-- Name: brands_subbrand_2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_subbrand_2_id_seq OWNED BY public.brands_subbrand_2.id;


--
-- Name: catalog_algorithm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_algorithm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.catalog_algorithm OWNER TO postgres;

--
-- Name: catalog_algorithm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_algorithm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_algorithm_id_seq OWNER TO postgres;

--
-- Name: catalog_algorithm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_algorithm_id_seq OWNED BY public.catalog_algorithm.id;


--
-- Name: catalog_facadematerialtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_facadematerialtype (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    identifier character varying(20) NOT NULL
);


ALTER TABLE public.catalog_facadematerialtype OWNER TO postgres;

--
-- Name: catalog_facadematerialtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_facadematerialtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_facadematerialtype_id_seq OWNER TO postgres;

--
-- Name: catalog_facadematerialtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_facadematerialtype_id_seq OWNED BY public.catalog_facadematerialtype.id;


--
-- Name: catalog_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_plan (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    scheme jsonb,
    checked boolean NOT NULL,
    author_id integer
);


ALTER TABLE public.catalog_plan OWNER TO postgres;

--
-- Name: catalog_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_plan_id_seq OWNER TO postgres;

--
-- Name: catalog_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_plan_id_seq OWNED BY public.catalog_plan.id;


--
-- Name: catalog_shell; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_shell (
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


ALTER TABLE public.catalog_shell OWNER TO postgres;

--
-- Name: catalog_shell_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_shell_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_shell_id_seq OWNER TO postgres;

--
-- Name: catalog_shell_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_shell_id_seq OWNED BY public.catalog_shell.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: geography_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geography_city (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    heating_period_duration integer,
    heating_period_temperature double precision,
    region_id integer
);


ALTER TABLE public.geography_city OWNER TO postgres;

--
-- Name: geography_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geography_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geography_city_id_seq OWNER TO postgres;

--
-- Name: geography_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geography_city_id_seq OWNED BY public.geography_city.id;


--
-- Name: geography_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geography_country (
    id integer NOT NULL,
    name character varying(200)
);


ALTER TABLE public.geography_country OWNER TO postgres;

--
-- Name: geography_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geography_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geography_country_id_seq OWNER TO postgres;

--
-- Name: geography_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geography_country_id_seq OWNED BY public.geography_country.id;


--
-- Name: geography_region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geography_region (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    code integer,
    country_id integer
);


ALTER TABLE public.geography_region OWNER TO postgres;

--
-- Name: geography_region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geography_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geography_region_id_seq OWNER TO postgres;

--
-- Name: geography_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geography_region_id_seq OWNED BY public.geography_region.id;


--
-- Name: materialprices_insulationprice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materialprices_insulationprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);


ALTER TABLE public.materialprices_insulationprice OWNER TO postgres;

--
-- Name: materialprices_insulationprice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materialprices_insulationprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materialprices_insulationprice_id_seq OWNER TO postgres;

--
-- Name: materialprices_insulationprice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materialprices_insulationprice_id_seq OWNED BY public.materialprices_insulationprice.id;


--
-- Name: materialprices_rockwallmaterialprice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materialprices_rockwallmaterialprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);


ALTER TABLE public.materialprices_rockwallmaterialprice OWNER TO postgres;

--
-- Name: materialprices_rockwallmaterialprice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materialprices_rockwallmaterialprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materialprices_rockwallmaterialprice_id_seq OWNER TO postgres;

--
-- Name: materialprices_rockwallmaterialprice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materialprices_rockwallmaterialprice_id_seq OWNED BY public.materialprices_rockwallmaterialprice.id;


--
-- Name: materials_bulksand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_bulksand (
    id integer NOT NULL,
    name character varying(6) NOT NULL,
    weight integer NOT NULL
);


ALTER TABLE public.materials_bulksand OWNER TO postgres;

--
-- Name: materials_bulksand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_bulksand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_bulksand_id_seq OWNER TO postgres;

--
-- Name: materials_bulksand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_bulksand_id_seq OWNED BY public.materials_bulksand.id;


--
-- Name: materials_flexibletile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_flexibletile (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    texture character varying(200) NOT NULL
);


ALTER TABLE public.materials_flexibletile OWNER TO postgres;

--
-- Name: materials_flexibletile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_flexibletile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_flexibletile_id_seq OWNER TO postgres;

--
-- Name: materials_flexibletile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_flexibletile_id_seq OWNED BY public.materials_flexibletile.id;


--
-- Name: materials_insulation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_insulation (
    id integer NOT NULL,
    thermal_conductivity double precision,
    mat_type character varying(9) NOT NULL,
    thick character varying(3) NOT NULL,
    brand_id integer
);


ALTER TABLE public.materials_insulation OWNER TO postgres;

--
-- Name: materials_insulation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_insulation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_insulation_id_seq OWNER TO postgres;

--
-- Name: materials_insulation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_insulation_id_seq OWNED BY public.materials_insulation.id;


--
-- Name: materials_materialuse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_materialuse (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    identifier character varying(200) NOT NULL
);


ALTER TABLE public.materials_materialuse OWNER TO postgres;

--
-- Name: materials_materialuse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_materialuse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_materialuse_id_seq OWNER TO postgres;

--
-- Name: materials_materialuse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_materialuse_id_seq OWNED BY public.materials_materialuse.id;


--
-- Name: materials_metaltile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_metaltile (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    texture character varying(200) NOT NULL
);


ALTER TABLE public.materials_metaltile OWNER TO postgres;

--
-- Name: materials_metaltile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_metaltile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_metaltile_id_seq OWNER TO postgres;

--
-- Name: materials_metaltile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_metaltile_id_seq OWNED BY public.materials_metaltile.id;


--
-- Name: materials_plaster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_plaster (
    id integer NOT NULL,
    texture character varying(200) NOT NULL,
    brand_id integer,
    manufacturer_id integer
);


ALTER TABLE public.materials_plaster OWNER TO postgres;

--
-- Name: materials_plaster_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_plaster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_plaster_id_seq OWNER TO postgres;

--
-- Name: materials_plaster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_plaster_id_seq OWNED BY public.materials_plaster.id;


--
-- Name: materials_plaster_use; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_plaster_use (
    id integer NOT NULL,
    plaster_id integer NOT NULL,
    materialuse_id integer NOT NULL
);


ALTER TABLE public.materials_plaster_use OWNER TO postgres;

--
-- Name: materials_plaster_use_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_plaster_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_plaster_use_id_seq OWNER TO postgres;

--
-- Name: materials_plaster_use_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_plaster_use_id_seq OWNED BY public.materials_plaster_use.id;


--
-- Name: materials_rockwallmaterialunit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_rockwallmaterialunit (
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


ALTER TABLE public.materials_rockwallmaterialunit OWNER TO postgres;

--
-- Name: materials_rockwallmaterialunit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_rockwallmaterialunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_rockwallmaterialunit_id_seq OWNER TO postgres;

--
-- Name: materials_rockwallmaterialunit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_rockwallmaterialunit_id_seq OWNED BY public.materials_rockwallmaterialunit.id;


--
-- Name: materials_roofcovertype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_roofcovertype (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    identifier character varying(200) NOT NULL
);


ALTER TABLE public.materials_roofcovertype OWNER TO postgres;

--
-- Name: materials_roofcovertype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_roofcovertype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_roofcovertype_id_seq OWNER TO postgres;

--
-- Name: materials_roofcovertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_roofcovertype_id_seq OWNED BY public.materials_roofcovertype.id;


--
-- Name: materials_siding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_siding (
    id integer NOT NULL,
    material character varying(20) NOT NULL,
    alternative_name character varying(20),
    texture character varying(200) NOT NULL,
    brand_id integer,
    manufacturer_id integer
);


ALTER TABLE public.materials_siding OWNER TO postgres;

--
-- Name: materials_siding_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_siding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_siding_id_seq OWNER TO postgres;

--
-- Name: materials_siding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_siding_id_seq OWNED BY public.materials_siding.id;


--
-- Name: materials_siding_use; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_siding_use (
    id integer NOT NULL,
    siding_id integer NOT NULL,
    materialuse_id integer NOT NULL
);


ALTER TABLE public.materials_siding_use OWNER TO postgres;

--
-- Name: materials_siding_use_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_siding_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_siding_use_id_seq OWNER TO postgres;

--
-- Name: materials_siding_use_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_siding_use_id_seq OWNED BY public.materials_siding_use.id;


--
-- Name: materials_stoneproductline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_stoneproductline (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    manufacturer_id integer
);


ALTER TABLE public.materials_stoneproductline OWNER TO postgres;

--
-- Name: materials_stoneproductline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_stoneproductline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_stoneproductline_id_seq OWNER TO postgres;

--
-- Name: materials_stoneproductline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_stoneproductline_id_seq OWNED BY public.materials_stoneproductline.id;


--
-- Name: materials_stoneproductline_use; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_stoneproductline_use (
    id integer NOT NULL,
    stoneproductline_id integer NOT NULL,
    materialuse_id integer NOT NULL
);


ALTER TABLE public.materials_stoneproductline_use OWNER TO postgres;

--
-- Name: materials_stoneproductline_use_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_stoneproductline_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_stoneproductline_use_id_seq OWNER TO postgres;

--
-- Name: materials_stoneproductline_use_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_stoneproductline_use_id_seq OWNED BY public.materials_stoneproductline_use.id;


--
-- Name: materials_stoneunit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials_stoneunit (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    texture character varying(200) NOT NULL,
    product_line_id integer
);


ALTER TABLE public.materials_stoneunit OWNER TO postgres;

--
-- Name: materials_stoneunit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_stoneunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_stoneunit_id_seq OWNER TO postgres;

--
-- Name: materials_stoneunit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_stoneunit_id_seq OWNED BY public.materials_stoneunit.id;


--
-- Name: names_decorativebrickface; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.names_decorativebrickface (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.names_decorativebrickface OWNER TO postgres;

--
-- Name: names_decorativebrickface_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.names_decorativebrickface_brand (
    id integer NOT NULL,
    decorativebrickface_id integer NOT NULL,
    brand_id integer NOT NULL
);


ALTER TABLE public.names_decorativebrickface_brand OWNER TO postgres;

--
-- Name: names_decorativebrickface_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.names_decorativebrickface_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.names_decorativebrickface_brand_id_seq OWNER TO postgres;

--
-- Name: names_decorativebrickface_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.names_decorativebrickface_brand_id_seq OWNED BY public.names_decorativebrickface_brand.id;


--
-- Name: names_decorativebrickface_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.names_decorativebrickface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.names_decorativebrickface_id_seq OWNER TO postgres;

--
-- Name: names_decorativebrickface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.names_decorativebrickface_id_seq OWNED BY public.names_decorativebrickface.id;


--
-- Name: standards_classb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.standards_classb (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);


ALTER TABLE public.standards_classb OWNER TO postgres;

--
-- Name: standards_classb_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.standards_classb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standards_classb_id_seq OWNER TO postgres;

--
-- Name: standards_classb_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standards_classb_id_seq OWNED BY public.standards_classb.id;


--
-- Name: standards_classаveragedensity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."standards_classаveragedensity" (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);


ALTER TABLE public."standards_classаveragedensity" OWNER TO postgres;

--
-- Name: standards_classаveragedensity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."standards_classаveragedensity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."standards_classаveragedensity_id_seq" OWNER TO postgres;

--
-- Name: standards_classаveragedensity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."standards_classаveragedensity_id_seq" OWNED BY public."standards_classаveragedensity".id;


--
-- Name: standards_markd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.standards_markd (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);


ALTER TABLE public.standards_markd OWNER TO postgres;

--
-- Name: standards_markd_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.standards_markd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standards_markd_id_seq OWNER TO postgres;

--
-- Name: standards_markd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standards_markd_id_seq OWNED BY public.standards_markd.id;


--
-- Name: standards_markf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.standards_markf (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);


ALTER TABLE public.standards_markf OWNER TO postgres;

--
-- Name: standards_markf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.standards_markf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standards_markf_id_seq OWNER TO postgres;

--
-- Name: standards_markf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standards_markf_id_seq OWNED BY public.standards_markf.id;


--
-- Name: standards_markm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.standards_markm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);


ALTER TABLE public.standards_markm OWNER TO postgres;

--
-- Name: standards_markm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.standards_markm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standards_markm_id_seq OWNER TO postgres;

--
-- Name: standards_markm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standards_markm_id_seq OWNED BY public.standards_markm.id;


--
-- Name: standards_nfsize; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.standards_nfsize (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    greater_bed_size integer,
    minor_bed_size integer,
    height integer
);


ALTER TABLE public.standards_nfsize OWNER TO postgres;

--
-- Name: standards_nfsize_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.standards_nfsize_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.standards_nfsize_id_seq OWNER TO postgres;

--
-- Name: standards_nfsize_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.standards_nfsize_id_seq OWNED BY public.standards_nfsize.id;


--
-- Name: suppliers_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers_activity (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.suppliers_activity OWNER TO postgres;

--
-- Name: suppliers_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_activity_id_seq OWNER TO postgres;

--
-- Name: suppliers_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_activity_id_seq OWNED BY public.suppliers_activity.id;


--
-- Name: suppliers_manufacturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers_manufacturer (
    id integer NOT NULL,
    alias character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    brand_id integer,
    city_id integer
);


ALTER TABLE public.suppliers_manufacturer OWNER TO postgres;

--
-- Name: suppliers_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_manufacturer_id_seq OWNER TO postgres;

--
-- Name: suppliers_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_manufacturer_id_seq OWNED BY public.suppliers_manufacturer.id;


--
-- Name: suppliers_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers_provider (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    primary_activity_id integer
);


ALTER TABLE public.suppliers_provider OWNER TO postgres;

--
-- Name: suppliers_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_provider_id_seq OWNER TO postgres;

--
-- Name: suppliers_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_provider_id_seq OWNED BY public.suppliers_provider.id;


--
-- Name: suppliers_provider_secondary_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers_provider_secondary_activity (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    activity_id integer NOT NULL
);


ALTER TABLE public.suppliers_provider_secondary_activity OWNER TO postgres;

--
-- Name: suppliers_provider_secondary_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_provider_secondary_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_provider_secondary_activity_id_seq OWNER TO postgres;

--
-- Name: suppliers_provider_secondary_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_provider_secondary_activity_id_seq OWNED BY public.suppliers_provider_secondary_activity.id;


--
-- Name: workprices_pilegrillagefoundationworkprices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workprices_pilegrillagefoundationworkprices (
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


ALTER TABLE public.workprices_pilegrillagefoundationworkprices OWNER TO postgres;

--
-- Name: workprices_pilegrillagefoundationworkprices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workprices_pilegrillagefoundationworkprices_id_seq OWNER TO postgres;

--
-- Name: workprices_pilegrillagefoundationworkprices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq OWNED BY public.workprices_pilegrillagefoundationworkprices.id;


--
-- Name: account_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_profile ALTER COLUMN id SET DEFAULT nextval('public.account_profile_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: brands_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_brand ALTER COLUMN id SET DEFAULT nextval('public.brands_brand_id_seq'::regclass);


--
-- Name: brands_subbrand_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_subbrand_1 ALTER COLUMN id SET DEFAULT nextval('public.brands_subbrand_1_id_seq'::regclass);


--
-- Name: brands_subbrand_2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_subbrand_2 ALTER COLUMN id SET DEFAULT nextval('public.brands_subbrand_2_id_seq'::regclass);


--
-- Name: catalog_algorithm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_algorithm ALTER COLUMN id SET DEFAULT nextval('public.catalog_algorithm_id_seq'::regclass);


--
-- Name: catalog_facadematerialtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_facadematerialtype ALTER COLUMN id SET DEFAULT nextval('public.catalog_facadematerialtype_id_seq'::regclass);


--
-- Name: catalog_plan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_plan ALTER COLUMN id SET DEFAULT nextval('public.catalog_plan_id_seq'::regclass);


--
-- Name: catalog_shell id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_shell ALTER COLUMN id SET DEFAULT nextval('public.catalog_shell_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: geography_city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_city ALTER COLUMN id SET DEFAULT nextval('public.geography_city_id_seq'::regclass);


--
-- Name: geography_country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_country ALTER COLUMN id SET DEFAULT nextval('public.geography_country_id_seq'::regclass);


--
-- Name: geography_region id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_region ALTER COLUMN id SET DEFAULT nextval('public.geography_region_id_seq'::regclass);


--
-- Name: materialprices_insulationprice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materialprices_insulationprice ALTER COLUMN id SET DEFAULT nextval('public.materialprices_insulationprice_id_seq'::regclass);


--
-- Name: materialprices_rockwallmaterialprice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materialprices_rockwallmaterialprice ALTER COLUMN id SET DEFAULT nextval('public.materialprices_rockwallmaterialprice_id_seq'::regclass);


--
-- Name: materials_bulksand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_bulksand ALTER COLUMN id SET DEFAULT nextval('public.materials_bulksand_id_seq'::regclass);


--
-- Name: materials_flexibletile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_flexibletile ALTER COLUMN id SET DEFAULT nextval('public.materials_flexibletile_id_seq'::regclass);


--
-- Name: materials_insulation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_insulation ALTER COLUMN id SET DEFAULT nextval('public.materials_insulation_id_seq'::regclass);


--
-- Name: materials_materialuse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_materialuse ALTER COLUMN id SET DEFAULT nextval('public.materials_materialuse_id_seq'::regclass);


--
-- Name: materials_metaltile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_metaltile ALTER COLUMN id SET DEFAULT nextval('public.materials_metaltile_id_seq'::regclass);


--
-- Name: materials_plaster id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_plaster ALTER COLUMN id SET DEFAULT nextval('public.materials_plaster_id_seq'::regclass);


--
-- Name: materials_plaster_use id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_plaster_use ALTER COLUMN id SET DEFAULT nextval('public.materials_plaster_use_id_seq'::regclass);


--
-- Name: materials_rockwallmaterialunit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit ALTER COLUMN id SET DEFAULT nextval('public.materials_rockwallmaterialunit_id_seq'::regclass);


--
-- Name: materials_roofcovertype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_roofcovertype ALTER COLUMN id SET DEFAULT nextval('public.materials_roofcovertype_id_seq'::regclass);


--
-- Name: materials_siding id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_siding ALTER COLUMN id SET DEFAULT nextval('public.materials_siding_id_seq'::regclass);


--
-- Name: materials_siding_use id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_siding_use ALTER COLUMN id SET DEFAULT nextval('public.materials_siding_use_id_seq'::regclass);


--
-- Name: materials_stoneproductline id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneproductline ALTER COLUMN id SET DEFAULT nextval('public.materials_stoneproductline_id_seq'::regclass);


--
-- Name: materials_stoneproductline_use id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneproductline_use ALTER COLUMN id SET DEFAULT nextval('public.materials_stoneproductline_use_id_seq'::regclass);


--
-- Name: materials_stoneunit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneunit ALTER COLUMN id SET DEFAULT nextval('public.materials_stoneunit_id_seq'::regclass);


--
-- Name: names_decorativebrickface id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names_decorativebrickface ALTER COLUMN id SET DEFAULT nextval('public.names_decorativebrickface_id_seq'::regclass);


--
-- Name: names_decorativebrickface_brand id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names_decorativebrickface_brand ALTER COLUMN id SET DEFAULT nextval('public.names_decorativebrickface_brand_id_seq'::regclass);


--
-- Name: standards_classb id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_classb ALTER COLUMN id SET DEFAULT nextval('public.standards_classb_id_seq'::regclass);


--
-- Name: standards_classаveragedensity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."standards_classаveragedensity" ALTER COLUMN id SET DEFAULT nextval('public."standards_classаveragedensity_id_seq"'::regclass);


--
-- Name: standards_markd id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_markd ALTER COLUMN id SET DEFAULT nextval('public.standards_markd_id_seq'::regclass);


--
-- Name: standards_markf id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_markf ALTER COLUMN id SET DEFAULT nextval('public.standards_markf_id_seq'::regclass);


--
-- Name: standards_markm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_markm ALTER COLUMN id SET DEFAULT nextval('public.standards_markm_id_seq'::regclass);


--
-- Name: standards_nfsize id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_nfsize ALTER COLUMN id SET DEFAULT nextval('public.standards_nfsize_id_seq'::regclass);


--
-- Name: suppliers_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_activity ALTER COLUMN id SET DEFAULT nextval('public.suppliers_activity_id_seq'::regclass);


--
-- Name: suppliers_manufacturer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.suppliers_manufacturer_id_seq'::regclass);


--
-- Name: suppliers_provider id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_provider ALTER COLUMN id SET DEFAULT nextval('public.suppliers_provider_id_seq'::regclass);


--
-- Name: suppliers_provider_secondary_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_provider_secondary_activity ALTER COLUMN id SET DEFAULT nextval('public.suppliers_provider_secondary_activity_id_seq'::regclass);


--
-- Name: workprices_pilegrillagefoundationworkprices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices ALTER COLUMN id SET DEFAULT nextval('public.workprices_pilegrillagefoundationworkprices_id_seq'::regclass);


--
-- Data for Name: account_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_profile (id, photo, user_id, city_id) FROM stdin;
\.
COPY public.account_profile (id, photo, user_id, city_id) FROM '$$PATH$$/3544.dat';

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.
COPY public.auth_group (id, name) FROM '$$PATH$$/3479.dat';

--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.
COPY public.auth_group_permissions (id, group_id, permission_id) FROM '$$PATH$$/3481.dat';

--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
\.
COPY public.auth_permission (id, name, content_type_id, codename) FROM '$$PATH$$/3477.dat';

--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.
COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM '$$PATH$$/3483.dat';

--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.
COPY public.auth_user_groups (id, user_id, group_id) FROM '$$PATH$$/3485.dat';

--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.
COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM '$$PATH$$/3487.dat';

--
-- Data for Name: brands_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands_brand (id, name) FROM stdin;
\.
COPY public.brands_brand (id, name) FROM '$$PATH$$/3491.dat';

--
-- Data for Name: brands_subbrand_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands_subbrand_1 (id, name, brand_id) FROM stdin;
\.
COPY public.brands_subbrand_1 (id, name, brand_id) FROM '$$PATH$$/3493.dat';

--
-- Data for Name: brands_subbrand_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands_subbrand_2 (id, name, sub_brand_1_id) FROM stdin;
\.
COPY public.brands_subbrand_2 (id, name, sub_brand_1_id) FROM '$$PATH$$/3495.dat';

--
-- Data for Name: catalog_algorithm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_algorithm (id, identifier, name) FROM stdin;
\.
COPY public.catalog_algorithm (id, identifier, name) FROM '$$PATH$$/3503.dat';

--
-- Data for Name: catalog_facadematerialtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_facadematerialtype (id, name, identifier) FROM stdin;
\.
COPY public.catalog_facadematerialtype (id, name, identifier) FROM '$$PATH$$/3568.dat';

--
-- Data for Name: catalog_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_plan (id, title, scheme, checked, author_id) FROM stdin;
\.
COPY public.catalog_plan (id, title, scheme, checked, author_id) FROM '$$PATH$$/3505.dat';

--
-- Data for Name: catalog_shell; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_shell (id, name, roof_material_id, soffit_style, wall_material_0_id, socle_material_id, author_id, roof_material_type_id, socle_material_type_id, wall_material_type_0_id) FROM stdin;
\.
COPY public.catalog_shell (id, name, roof_material_id, soffit_style, wall_material_0_id, socle_material_id, author_id, roof_material_type_id, socle_material_type_id, wall_material_type_0_id) FROM '$$PATH$$/3570.dat';

--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.
COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM '$$PATH$$/3489.dat';

--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
\.
COPY public.django_content_type (id, app_label, model) FROM '$$PATH$$/3475.dat';

--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
\.
COPY public.django_migrations (id, app, name, applied) FROM '$$PATH$$/3473.dat';

--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.
COPY public.django_session (session_key, session_data, expire_date) FROM '$$PATH$$/3540.dat';

--
-- Data for Name: geography_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geography_city (id, name, heating_period_duration, heating_period_temperature, region_id) FROM stdin;
\.
COPY public.geography_city (id, name, heating_period_duration, heating_period_temperature, region_id) FROM '$$PATH$$/3501.dat';

--
-- Data for Name: geography_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geography_country (id, name) FROM stdin;
\.
COPY public.geography_country (id, name) FROM '$$PATH$$/3497.dat';

--
-- Data for Name: geography_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geography_region (id, name, code, country_id) FROM stdin;
\.
COPY public.geography_region (id, name, code, country_id) FROM '$$PATH$$/3499.dat';

--
-- Data for Name: materialprices_insulationprice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materialprices_insulationprice (id, price, name_id, owner_id) FROM stdin;
\.
COPY public.materialprices_insulationprice (id, price, name_id, owner_id) FROM '$$PATH$$/3539.dat';

--
-- Data for Name: materialprices_rockwallmaterialprice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materialprices_rockwallmaterialprice (id, price, name_id, owner_id) FROM stdin;
\.
COPY public.materialprices_rockwallmaterialprice (id, price, name_id, owner_id) FROM '$$PATH$$/3537.dat';

--
-- Data for Name: materials_bulksand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_bulksand (id, name, weight) FROM stdin;
\.
COPY public.materials_bulksand (id, name, weight) FROM '$$PATH$$/3531.dat';

--
-- Data for Name: materials_flexibletile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_flexibletile (id, name, texture) FROM stdin;
\.
COPY public.materials_flexibletile (id, name, texture) FROM '$$PATH$$/3564.dat';

--
-- Data for Name: materials_insulation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_insulation (id, thermal_conductivity, mat_type, thick, brand_id) FROM stdin;
\.
COPY public.materials_insulation (id, thermal_conductivity, mat_type, thick, brand_id) FROM '$$PATH$$/3535.dat';

--
-- Data for Name: materials_materialuse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_materialuse (id, name, identifier) FROM stdin;
\.
COPY public.materials_materialuse (id, name, identifier) FROM '$$PATH$$/3546.dat';

--
-- Data for Name: materials_metaltile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_metaltile (id, name, texture) FROM stdin;
\.
COPY public.materials_metaltile (id, name, texture) FROM '$$PATH$$/3566.dat';

--
-- Data for Name: materials_plaster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_plaster (id, texture, brand_id, manufacturer_id) FROM stdin;
\.
COPY public.materials_plaster (id, texture, brand_id, manufacturer_id) FROM '$$PATH$$/3554.dat';

--
-- Data for Name: materials_plaster_use; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_plaster_use (id, plaster_id, materialuse_id) FROM stdin;
\.
COPY public.materials_plaster_use (id, plaster_id, materialuse_id) FROM '$$PATH$$/3556.dat';

--
-- Data for Name: materials_rockwallmaterialunit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_rockwallmaterialunit (id, name, material, greater_bed_size, minor_bed_size, height, tongue_and_groove, polish, purpose, partition_or_bearing, body_type, blind_hollow, primary_or_additional, algorithm_id, brand_id, class_average_density_id, class_b_id, face_id, manufacturer_id, mark_d_id, mark_f_id, mark_m_id, sub_brand_1_id, sub_brand_2_id) FROM stdin;
\.
COPY public.materials_rockwallmaterialunit (id, name, material, greater_bed_size, minor_bed_size, height, tongue_and_groove, polish, purpose, partition_or_bearing, body_type, blind_hollow, primary_or_additional, algorithm_id, brand_id, class_average_density_id, class_b_id, face_id, manufacturer_id, mark_d_id, mark_f_id, mark_m_id, sub_brand_1_id, sub_brand_2_id) FROM '$$PATH$$/3533.dat';

--
-- Data for Name: materials_roofcovertype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_roofcovertype (id, name, identifier) FROM stdin;
\.
COPY public.materials_roofcovertype (id, name, identifier) FROM '$$PATH$$/3548.dat';

--
-- Data for Name: materials_siding; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_siding (id, material, alternative_name, texture, brand_id, manufacturer_id) FROM stdin;
\.
COPY public.materials_siding (id, material, alternative_name, texture, brand_id, manufacturer_id) FROM '$$PATH$$/3550.dat';

--
-- Data for Name: materials_siding_use; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_siding_use (id, siding_id, materialuse_id) FROM stdin;
\.
COPY public.materials_siding_use (id, siding_id, materialuse_id) FROM '$$PATH$$/3552.dat';

--
-- Data for Name: materials_stoneproductline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_stoneproductline (id, name, manufacturer_id) FROM stdin;
\.
COPY public.materials_stoneproductline (id, name, manufacturer_id) FROM '$$PATH$$/3558.dat';

--
-- Data for Name: materials_stoneproductline_use; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_stoneproductline_use (id, stoneproductline_id, materialuse_id) FROM stdin;
\.
COPY public.materials_stoneproductline_use (id, stoneproductline_id, materialuse_id) FROM '$$PATH$$/3560.dat';

--
-- Data for Name: materials_stoneunit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials_stoneunit (id, name, texture, product_line_id) FROM stdin;
\.
COPY public.materials_stoneunit (id, name, texture, product_line_id) FROM '$$PATH$$/3562.dat';

--
-- Data for Name: names_decorativebrickface; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.names_decorativebrickface (id, name) FROM stdin;
\.
COPY public.names_decorativebrickface (id, name) FROM '$$PATH$$/3527.dat';

--
-- Data for Name: names_decorativebrickface_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.names_decorativebrickface_brand (id, decorativebrickface_id, brand_id) FROM stdin;
\.
COPY public.names_decorativebrickface_brand (id, decorativebrickface_id, brand_id) FROM '$$PATH$$/3529.dat';

--
-- Data for Name: standards_classb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.standards_classb (id, identifier, name) FROM stdin;
\.
COPY public.standards_classb (id, identifier, name) FROM '$$PATH$$/3515.dat';

--
-- Data for Name: standards_classаveragedensity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."standards_classаveragedensity" (id, identifier, name) FROM stdin;
\.
COPY public."standards_classаveragedensity" (id, identifier, name) FROM '$$PATH$$/3517.dat';

--
-- Data for Name: standards_markd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.standards_markd (id, identifier, name) FROM stdin;
\.
COPY public.standards_markd (id, identifier, name) FROM '$$PATH$$/3519.dat';

--
-- Data for Name: standards_markf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.standards_markf (id, identifier, name) FROM stdin;
\.
COPY public.standards_markf (id, identifier, name) FROM '$$PATH$$/3521.dat';

--
-- Data for Name: standards_markm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.standards_markm (id, identifier, name) FROM stdin;
\.
COPY public.standards_markm (id, identifier, name) FROM '$$PATH$$/3523.dat';

--
-- Data for Name: standards_nfsize; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.standards_nfsize (id, identifier, name, greater_bed_size, minor_bed_size, height) FROM stdin;
\.
COPY public.standards_nfsize (id, identifier, name, greater_bed_size, minor_bed_size, height) FROM '$$PATH$$/3525.dat';

--
-- Data for Name: suppliers_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers_activity (id, identifier, name) FROM stdin;
\.
COPY public.suppliers_activity (id, identifier, name) FROM '$$PATH$$/3507.dat';

--
-- Data for Name: suppliers_manufacturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers_manufacturer (id, alias, name, brand_id, city_id) FROM stdin;
\.
COPY public.suppliers_manufacturer (id, alias, name, brand_id, city_id) FROM '$$PATH$$/3513.dat';

--
-- Data for Name: suppliers_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers_provider (id, name, primary_activity_id) FROM stdin;
\.
COPY public.suppliers_provider (id, name, primary_activity_id) FROM '$$PATH$$/3509.dat';

--
-- Data for Name: suppliers_provider_secondary_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers_provider_secondary_activity (id, provider_id, activity_id) FROM stdin;
\.
COPY public.suppliers_provider_secondary_activity (id, provider_id, activity_id) FROM '$$PATH$$/3511.dat';

--
-- Data for Name: workprices_pilegrillagefoundationworkprices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workprices_pilegrillagefoundationworkprices (id, const_expenditure, transportation_procurement_cost, reinforcement_binding, clamp, pile_frame, formwork, length_costs, square_costs, volume_costs, pile_pour, man_hours_cost, man_hours_profit, owner_id) FROM stdin;
\.
COPY public.workprices_pilegrillagefoundationworkprices (id, const_expenditure, transportation_procurement_cost, reinforcement_binding, clamp, pile_frame, formwork, length_costs, square_costs, volume_costs, pile_pour, man_hours_cost, man_hours_profit, owner_id) FROM '$$PATH$$/3542.dat';

--
-- Name: account_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_profile_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 180, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 2, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: brands_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_brand_id_seq', 1, false);


--
-- Name: brands_subbrand_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_subbrand_1_id_seq', 1, false);


--
-- Name: brands_subbrand_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_subbrand_2_id_seq', 1, false);


--
-- Name: catalog_algorithm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_algorithm_id_seq', 1, false);


--
-- Name: catalog_facadematerialtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_facadematerialtype_id_seq', 1, false);


--
-- Name: catalog_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_plan_id_seq', 5, true);


--
-- Name: catalog_shell_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_shell_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 22, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 45, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 38, true);


--
-- Name: geography_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geography_city_id_seq', 1, true);


--
-- Name: geography_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geography_country_id_seq', 1, true);


--
-- Name: geography_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geography_region_id_seq', 1, true);


--
-- Name: materialprices_insulationprice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materialprices_insulationprice_id_seq', 1, false);


--
-- Name: materialprices_rockwallmaterialprice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materialprices_rockwallmaterialprice_id_seq', 1, false);


--
-- Name: materials_bulksand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_bulksand_id_seq', 1, false);


--
-- Name: materials_flexibletile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_flexibletile_id_seq', 1, false);


--
-- Name: materials_insulation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_insulation_id_seq', 1, false);


--
-- Name: materials_materialuse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_materialuse_id_seq', 1, false);


--
-- Name: materials_metaltile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_metaltile_id_seq', 1, false);


--
-- Name: materials_plaster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_plaster_id_seq', 1, false);


--
-- Name: materials_plaster_use_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_plaster_use_id_seq', 1, false);


--
-- Name: materials_rockwallmaterialunit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_rockwallmaterialunit_id_seq', 1, false);


--
-- Name: materials_roofcovertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_roofcovertype_id_seq', 2, true);


--
-- Name: materials_siding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_siding_id_seq', 1, false);


--
-- Name: materials_siding_use_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_siding_use_id_seq', 1, false);


--
-- Name: materials_stoneproductline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_stoneproductline_id_seq', 1, false);


--
-- Name: materials_stoneproductline_use_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_stoneproductline_use_id_seq', 1, false);


--
-- Name: materials_stoneunit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_stoneunit_id_seq', 1, false);


--
-- Name: names_decorativebrickface_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.names_decorativebrickface_brand_id_seq', 1, false);


--
-- Name: names_decorativebrickface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.names_decorativebrickface_id_seq', 1, false);


--
-- Name: standards_classb_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.standards_classb_id_seq', 1, false);


--
-- Name: standards_classаveragedensity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."standards_classаveragedensity_id_seq"', 1, false);


--
-- Name: standards_markd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.standards_markd_id_seq', 1, false);


--
-- Name: standards_markf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.standards_markf_id_seq', 1, false);


--
-- Name: standards_markm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.standards_markm_id_seq', 1, false);


--
-- Name: standards_nfsize_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.standards_nfsize_id_seq', 1, false);


--
-- Name: suppliers_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_activity_id_seq', 1, false);


--
-- Name: suppliers_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_manufacturer_id_seq', 1, false);


--
-- Name: suppliers_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_provider_id_seq', 1, false);


--
-- Name: suppliers_provider_secondary_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_provider_secondary_activity_id_seq', 1, false);


--
-- Name: workprices_pilegrillagefoundationworkprices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workprices_pilegrillagefoundationworkprices_id_seq', 1, false);


--
-- Name: account_profile account_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_pkey PRIMARY KEY (id);


--
-- Name: account_profile account_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: brands_brand brands_brand_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_brand
    ADD CONSTRAINT brands_brand_name_key UNIQUE (name);


--
-- Name: brands_brand brands_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_brand
    ADD CONSTRAINT brands_brand_pkey PRIMARY KEY (id);


--
-- Name: brands_subbrand_1 brands_subbrand_1_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_name_key UNIQUE (name);


--
-- Name: brands_subbrand_1 brands_subbrand_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_pkey PRIMARY KEY (id);


--
-- Name: brands_subbrand_2 brands_subbrand_2_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_name_key UNIQUE (name);


--
-- Name: brands_subbrand_2 brands_subbrand_2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_pkey PRIMARY KEY (id);


--
-- Name: catalog_algorithm catalog_algorithm_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_identifier_key UNIQUE (identifier);


--
-- Name: catalog_algorithm catalog_algorithm_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_name_key UNIQUE (name);


--
-- Name: catalog_algorithm catalog_algorithm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_pkey PRIMARY KEY (id);


--
-- Name: catalog_facadematerialtype catalog_facadematerialtype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_facadematerialtype
    ADD CONSTRAINT catalog_facadematerialtype_name_key UNIQUE (name);


--
-- Name: catalog_facadematerialtype catalog_facadematerialtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_facadematerialtype
    ADD CONSTRAINT catalog_facadematerialtype_pkey PRIMARY KEY (id);


--
-- Name: catalog_plan catalog_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_pkey PRIMARY KEY (id);


--
-- Name: catalog_shell catalog_shell_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: geography_city geography_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_city
    ADD CONSTRAINT geography_city_pkey PRIMARY KEY (id);


--
-- Name: geography_country geography_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_country
    ADD CONSTRAINT geography_country_name_key UNIQUE (name);


--
-- Name: geography_country geography_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_country
    ADD CONSTRAINT geography_country_pkey PRIMARY KEY (id);


--
-- Name: geography_region geography_region_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_code_key UNIQUE (code);


--
-- Name: geography_region geography_region_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_name_key UNIQUE (name);


--
-- Name: geography_region geography_region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_pkey PRIMARY KEY (id);


--
-- Name: materialprices_insulationprice materialprices_insulationprice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insulationprice_pkey PRIMARY KEY (id);


--
-- Name: materialprices_rockwallmaterialprice materialprices_rockwallmaterialprice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockwallmaterialprice_pkey PRIMARY KEY (id);


--
-- Name: materials_bulksand materials_bulksand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_bulksand
    ADD CONSTRAINT materials_bulksand_pkey PRIMARY KEY (id);


--
-- Name: materials_flexibletile materials_flexibletile_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_flexibletile
    ADD CONSTRAINT materials_flexibletile_name_key UNIQUE (name);


--
-- Name: materials_flexibletile materials_flexibletile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_flexibletile
    ADD CONSTRAINT materials_flexibletile_pkey PRIMARY KEY (id);


--
-- Name: materials_insulation materials_insulation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_insulation
    ADD CONSTRAINT materials_insulation_pkey PRIMARY KEY (id);


--
-- Name: materials_materialuse materials_materialuse_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_materialuse
    ADD CONSTRAINT materials_materialuse_identifier_key UNIQUE (identifier);


--
-- Name: materials_materialuse materials_materialuse_name_012faa14_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_materialuse
    ADD CONSTRAINT materials_materialuse_name_012faa14_uniq UNIQUE (name);


--
-- Name: materials_materialuse materials_materialuse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_materialuse
    ADD CONSTRAINT materials_materialuse_pkey PRIMARY KEY (id);


--
-- Name: materials_metaltile materials_metaltile_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_metaltile
    ADD CONSTRAINT materials_metaltile_name_key UNIQUE (name);


--
-- Name: materials_metaltile materials_metaltile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_metaltile
    ADD CONSTRAINT materials_metaltile_pkey PRIMARY KEY (id);


--
-- Name: materials_plaster materials_plaster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_plaster
    ADD CONSTRAINT materials_plaster_pkey PRIMARY KEY (id);


--
-- Name: materials_plaster_use materials_plaster_use_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_use_pkey PRIMARY KEY (id);


--
-- Name: materials_plaster_use materials_plaster_use_plaster_id_materialuse_id_9371ddbc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_use_plaster_id_materialuse_id_9371ddbc_uniq UNIQUE (plaster_id, materialuse_id);


--
-- Name: materials_rockwallmaterialunit materials_rockwallmaterialunit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallmaterialunit_pkey PRIMARY KEY (id);


--
-- Name: materials_roofcovertype materials_roofcovertype_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_roofcovertype
    ADD CONSTRAINT materials_roofcovertype_identifier_key UNIQUE (identifier);


--
-- Name: materials_roofcovertype materials_roofcovertype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_roofcovertype
    ADD CONSTRAINT materials_roofcovertype_name_key UNIQUE (name);


--
-- Name: materials_roofcovertype materials_roofcovertype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_roofcovertype
    ADD CONSTRAINT materials_roofcovertype_pkey PRIMARY KEY (id);


--
-- Name: materials_siding materials_siding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_siding
    ADD CONSTRAINT materials_siding_pkey PRIMARY KEY (id);


--
-- Name: materials_siding_use materials_siding_use_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_pkey PRIMARY KEY (id);


--
-- Name: materials_siding_use materials_siding_use_siding_id_materialuse_id_c91a5f6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_siding_id_materialuse_id_c91a5f6e_uniq UNIQUE (siding_id, materialuse_id);


--
-- Name: materials_stoneproductline_use materials_stoneproductli_stoneproductline_id_mate_0a83adbd_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneproductli_stoneproductline_id_mate_0a83adbd_uniq UNIQUE (stoneproductline_id, materialuse_id);


--
-- Name: materials_stoneproductline materials_stoneproductline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneproductline
    ADD CONSTRAINT materials_stoneproductline_pkey PRIMARY KEY (id);


--
-- Name: materials_stoneproductline_use materials_stoneproductline_use_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneproductline_use_pkey PRIMARY KEY (id);


--
-- Name: materials_stoneunit materials_stoneunit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneunit
    ADD CONSTRAINT materials_stoneunit_pkey PRIMARY KEY (id);


--
-- Name: names_decorativebrickface_brand names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq UNIQUE (decorativebrickface_id, brand_id);


--
-- Name: names_decorativebrickface_brand names_decorativebrickface_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebrickface_brand_pkey PRIMARY KEY (id);


--
-- Name: names_decorativebrickface names_decorativebrickface_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names_decorativebrickface
    ADD CONSTRAINT names_decorativebrickface_pkey PRIMARY KEY (id);


--
-- Name: standards_classb standards_classb_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_classb
    ADD CONSTRAINT standards_classb_identifier_key UNIQUE (identifier);


--
-- Name: standards_classb standards_classb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_classb
    ADD CONSTRAINT standards_classb_pkey PRIMARY KEY (id);


--
-- Name: standards_classаveragedensity standards_classаveragedensity_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."standards_classаveragedensity"
    ADD CONSTRAINT "standards_classаveragedensity_identifier_key" UNIQUE (identifier);


--
-- Name: standards_classаveragedensity standards_classаveragedensity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."standards_classаveragedensity"
    ADD CONSTRAINT "standards_classаveragedensity_pkey" PRIMARY KEY (id);


--
-- Name: standards_markd standards_markd_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_markd
    ADD CONSTRAINT standards_markd_identifier_key UNIQUE (identifier);


--
-- Name: standards_markd standards_markd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_markd
    ADD CONSTRAINT standards_markd_pkey PRIMARY KEY (id);


--
-- Name: standards_markf standards_markf_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_markf
    ADD CONSTRAINT standards_markf_identifier_key UNIQUE (identifier);


--
-- Name: standards_markf standards_markf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_markf
    ADD CONSTRAINT standards_markf_pkey PRIMARY KEY (id);


--
-- Name: standards_markm standards_markm_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_markm
    ADD CONSTRAINT standards_markm_identifier_key UNIQUE (identifier);


--
-- Name: standards_markm standards_markm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_markm
    ADD CONSTRAINT standards_markm_pkey PRIMARY KEY (id);


--
-- Name: standards_nfsize standards_nfsize_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_nfsize
    ADD CONSTRAINT standards_nfsize_identifier_key UNIQUE (identifier);


--
-- Name: standards_nfsize standards_nfsize_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standards_nfsize
    ADD CONSTRAINT standards_nfsize_pkey PRIMARY KEY (id);


--
-- Name: suppliers_activity suppliers_activity_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_activity
    ADD CONSTRAINT suppliers_activity_identifier_key UNIQUE (identifier);


--
-- Name: suppliers_activity suppliers_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_activity
    ADD CONSTRAINT suppliers_activity_pkey PRIMARY KEY (id);


--
-- Name: suppliers_manufacturer suppliers_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_name_key UNIQUE (name);


--
-- Name: suppliers_manufacturer suppliers_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: suppliers_provider suppliers_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_name_key UNIQUE (name);


--
-- Name: suppliers_provider suppliers_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_pkey PRIMARY KEY (id);


--
-- Name: suppliers_provider_secondary_activity suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq UNIQUE (provider_id, activity_id);


--
-- Name: suppliers_provider_secondary_activity suppliers_provider_secondary_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_secondary_activity_pkey PRIMARY KEY (id);


--
-- Name: workprices_pilegrillagefoundationworkprices workprices_pilegrillagefoundationworkprices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices
    ADD CONSTRAINT workprices_pilegrillagefoundationworkprices_pkey PRIMARY KEY (id);


--
-- Name: account_profile_city_id_207f6508; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_profile_city_id_207f6508 ON public.account_profile USING btree (city_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: brands_brand_name_5759061b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX brands_brand_name_5759061b_like ON public.brands_brand USING btree (name varchar_pattern_ops);


--
-- Name: brands_subbrand_1_brand_id_7085621b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX brands_subbrand_1_brand_id_7085621b ON public.brands_subbrand_1 USING btree (brand_id);


--
-- Name: brands_subbrand_1_name_f5c24720_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX brands_subbrand_1_name_f5c24720_like ON public.brands_subbrand_1 USING btree (name varchar_pattern_ops);


--
-- Name: brands_subbrand_2_name_d930b212_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX brands_subbrand_2_name_d930b212_like ON public.brands_subbrand_2 USING btree (name varchar_pattern_ops);


--
-- Name: brands_subbrand_2_sub_brand_1_id_16ad81ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX brands_subbrand_2_sub_brand_1_id_16ad81ef ON public.brands_subbrand_2 USING btree (sub_brand_1_id);


--
-- Name: catalog_algorithm_identifier_eb6862d5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_algorithm_identifier_eb6862d5_like ON public.catalog_algorithm USING btree (identifier varchar_pattern_ops);


--
-- Name: catalog_algorithm_name_5dd925d3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_algorithm_name_5dd925d3_like ON public.catalog_algorithm USING btree (name varchar_pattern_ops);


--
-- Name: catalog_facadematerialtype_name_75e83a0b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_facadematerialtype_name_75e83a0b_like ON public.catalog_facadematerialtype USING btree (name varchar_pattern_ops);


--
-- Name: catalog_plan_author_id_19443bad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_plan_author_id_19443bad ON public.catalog_plan USING btree (author_id);


--
-- Name: catalog_shell_author_id_c4c4abab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_shell_author_id_c4c4abab ON public.catalog_shell USING btree (author_id);


--
-- Name: catalog_shell_roof_material_type_id_cecb1252; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_shell_roof_material_type_id_cecb1252 ON public.catalog_shell USING btree (roof_material_type_id);


--
-- Name: catalog_shell_socle_material_type_id_8b9c900c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_shell_socle_material_type_id_8b9c900c ON public.catalog_shell USING btree (socle_material_type_id);


--
-- Name: catalog_shell_wall_material_type_0_id_816c36ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_shell_wall_material_type_0_id_816c36ae ON public.catalog_shell USING btree (wall_material_type_0_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: geography_city_region_id_ea133d50; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geography_city_region_id_ea133d50 ON public.geography_city USING btree (region_id);


--
-- Name: geography_country_name_477df8ef_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geography_country_name_477df8ef_like ON public.geography_country USING btree (name varchar_pattern_ops);


--
-- Name: geography_region_country_id_7b89c739; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geography_region_country_id_7b89c739 ON public.geography_region USING btree (country_id);


--
-- Name: geography_region_name_78b61e6a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geography_region_name_78b61e6a_like ON public.geography_region USING btree (name varchar_pattern_ops);


--
-- Name: materialprices_insulationprice_name_id_a70a0ae5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materialprices_insulationprice_name_id_a70a0ae5 ON public.materialprices_insulationprice USING btree (name_id);


--
-- Name: materialprices_insulationprice_owner_id_ea647b28; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materialprices_insulationprice_owner_id_ea647b28 ON public.materialprices_insulationprice USING btree (owner_id);


--
-- Name: materialprices_rockwallmaterialprice_name_id_5a769348; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materialprices_rockwallmaterialprice_name_id_5a769348 ON public.materialprices_rockwallmaterialprice USING btree (name_id);


--
-- Name: materialprices_rockwallmaterialprice_owner_id_ea24bd0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materialprices_rockwallmaterialprice_owner_id_ea24bd0d ON public.materialprices_rockwallmaterialprice USING btree (owner_id);


--
-- Name: materials_flexibletile_name_d3837b01_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_flexibletile_name_d3837b01_like ON public.materials_flexibletile USING btree (name varchar_pattern_ops);


--
-- Name: materials_insulation_brand_id_dd7669b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_insulation_brand_id_dd7669b2 ON public.materials_insulation USING btree (brand_id);


--
-- Name: materials_materialuse_identifier_a010716f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_materialuse_identifier_a010716f_like ON public.materials_materialuse USING btree (identifier varchar_pattern_ops);


--
-- Name: materials_materialuse_name_012faa14_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_materialuse_name_012faa14_like ON public.materials_materialuse USING btree (name varchar_pattern_ops);


--
-- Name: materials_metaltile_name_3bb29633_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_metaltile_name_3bb29633_like ON public.materials_metaltile USING btree (name varchar_pattern_ops);


--
-- Name: materials_plaster_brand_id_cc3e5323; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_plaster_brand_id_cc3e5323 ON public.materials_plaster USING btree (brand_id);


--
-- Name: materials_plaster_manufacturer_id_060021cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_plaster_manufacturer_id_060021cd ON public.materials_plaster USING btree (manufacturer_id);


--
-- Name: materials_plaster_use_materialuse_id_3f0e40e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_plaster_use_materialuse_id_3f0e40e1 ON public.materials_plaster_use USING btree (materialuse_id);


--
-- Name: materials_plaster_use_plaster_id_1ce61346; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_plaster_use_plaster_id_1ce61346 ON public.materials_plaster_use USING btree (plaster_id);


--
-- Name: materials_rockwallmaterial_class_average_density_id_beb6fff9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterial_class_average_density_id_beb6fff9 ON public.materials_rockwallmaterialunit USING btree (class_average_density_id);


--
-- Name: materials_rockwallmaterialunit_algorithm_id_4183f114; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_algorithm_id_4183f114 ON public.materials_rockwallmaterialunit USING btree (algorithm_id);


--
-- Name: materials_rockwallmaterialunit_brand_id_4deb8894; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_brand_id_4deb8894 ON public.materials_rockwallmaterialunit USING btree (brand_id);


--
-- Name: materials_rockwallmaterialunit_class_b_id_1de59e0b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_class_b_id_1de59e0b ON public.materials_rockwallmaterialunit USING btree (class_b_id);


--
-- Name: materials_rockwallmaterialunit_face_id_712ecb1a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_face_id_712ecb1a ON public.materials_rockwallmaterialunit USING btree (face_id);


--
-- Name: materials_rockwallmaterialunit_manufacturer_id_c1176543; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_manufacturer_id_c1176543 ON public.materials_rockwallmaterialunit USING btree (manufacturer_id);


--
-- Name: materials_rockwallmaterialunit_mark_d_id_e456d3f5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_mark_d_id_e456d3f5 ON public.materials_rockwallmaterialunit USING btree (mark_d_id);


--
-- Name: materials_rockwallmaterialunit_mark_f_id_48ec4578; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_mark_f_id_48ec4578 ON public.materials_rockwallmaterialunit USING btree (mark_f_id);


--
-- Name: materials_rockwallmaterialunit_mark_m_id_e96cf97b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_mark_m_id_e96cf97b ON public.materials_rockwallmaterialunit USING btree (mark_m_id);


--
-- Name: materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb ON public.materials_rockwallmaterialunit USING btree (sub_brand_1_id);


--
-- Name: materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b ON public.materials_rockwallmaterialunit USING btree (sub_brand_2_id);


--
-- Name: materials_roofcovertype_identifier_8eed0695_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_roofcovertype_identifier_8eed0695_like ON public.materials_roofcovertype USING btree (identifier varchar_pattern_ops);


--
-- Name: materials_roofcovertype_name_e791d481_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_roofcovertype_name_e791d481_like ON public.materials_roofcovertype USING btree (name varchar_pattern_ops);


--
-- Name: materials_siding_brand_id_947adead; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_siding_brand_id_947adead ON public.materials_siding USING btree (brand_id);


--
-- Name: materials_siding_manufacturer_id_4bd6fcdc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_siding_manufacturer_id_4bd6fcdc ON public.materials_siding USING btree (manufacturer_id);


--
-- Name: materials_siding_use_materialuse_id_27444db6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_siding_use_materialuse_id_27444db6 ON public.materials_siding_use USING btree (materialuse_id);


--
-- Name: materials_siding_use_siding_id_a2f23e27; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_siding_use_siding_id_a2f23e27 ON public.materials_siding_use USING btree (siding_id);


--
-- Name: materials_stoneproductline_manufacturer_id_c1271051; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_stoneproductline_manufacturer_id_c1271051 ON public.materials_stoneproductline USING btree (manufacturer_id);


--
-- Name: materials_stoneproductline_use_materialuse_id_7e20150f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_stoneproductline_use_materialuse_id_7e20150f ON public.materials_stoneproductline_use USING btree (materialuse_id);


--
-- Name: materials_stoneproductline_use_stoneproductline_id_6477c585; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_stoneproductline_use_stoneproductline_id_6477c585 ON public.materials_stoneproductline_use USING btree (stoneproductline_id);


--
-- Name: materials_stoneunit_product_line_id_c1b449ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materials_stoneunit_product_line_id_c1b449ac ON public.materials_stoneunit USING btree (product_line_id);


--
-- Name: names_decorativebrickface_brand_brand_id_92646ca6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX names_decorativebrickface_brand_brand_id_92646ca6 ON public.names_decorativebrickface_brand USING btree (brand_id);


--
-- Name: names_decorativebrickface_brand_decorativebrickface_id_f4bd2916; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX names_decorativebrickface_brand_decorativebrickface_id_f4bd2916 ON public.names_decorativebrickface_brand USING btree (decorativebrickface_id);


--
-- Name: standards_classb_identifier_9c57cd5d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX standards_classb_identifier_9c57cd5d_like ON public.standards_classb USING btree (identifier varchar_pattern_ops);


--
-- Name: standards_classаveragedensity_identifier_4f590a03_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "standards_classаveragedensity_identifier_4f590a03_like" ON public."standards_classаveragedensity" USING btree (identifier varchar_pattern_ops);


--
-- Name: standards_markd_identifier_a2035296_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX standards_markd_identifier_a2035296_like ON public.standards_markd USING btree (identifier varchar_pattern_ops);


--
-- Name: standards_markf_identifier_79848dc8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX standards_markf_identifier_79848dc8_like ON public.standards_markf USING btree (identifier varchar_pattern_ops);


--
-- Name: standards_markm_identifier_2b0b47b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX standards_markm_identifier_2b0b47b2_like ON public.standards_markm USING btree (identifier varchar_pattern_ops);


--
-- Name: standards_nfsize_identifier_625c4c07_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX standards_nfsize_identifier_625c4c07_like ON public.standards_nfsize USING btree (identifier varchar_pattern_ops);


--
-- Name: suppliers_activity_identifier_d8d3a5df_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX suppliers_activity_identifier_d8d3a5df_like ON public.suppliers_activity USING btree (identifier varchar_pattern_ops);


--
-- Name: suppliers_manufacturer_brand_id_18bff0a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX suppliers_manufacturer_brand_id_18bff0a3 ON public.suppliers_manufacturer USING btree (brand_id);


--
-- Name: suppliers_manufacturer_city_id_734a9037; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX suppliers_manufacturer_city_id_734a9037 ON public.suppliers_manufacturer USING btree (city_id);


--
-- Name: suppliers_manufacturer_name_2cb797cf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX suppliers_manufacturer_name_2cb797cf_like ON public.suppliers_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: suppliers_provider_name_99a51456_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX suppliers_provider_name_99a51456_like ON public.suppliers_provider USING btree (name varchar_pattern_ops);


--
-- Name: suppliers_provider_primary_activity_id_93261e15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX suppliers_provider_primary_activity_id_93261e15 ON public.suppliers_provider USING btree (primary_activity_id);


--
-- Name: suppliers_provider_secondary_activity_activity_id_31284a51; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX suppliers_provider_secondary_activity_activity_id_31284a51 ON public.suppliers_provider_secondary_activity USING btree (activity_id);


--
-- Name: suppliers_provider_secondary_activity_provider_id_2fab0709; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX suppliers_provider_secondary_activity_provider_id_2fab0709 ON public.suppliers_provider_secondary_activity USING btree (provider_id);


--
-- Name: workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2 ON public.workprices_pilegrillagefoundationworkprices USING btree (owner_id);


--
-- Name: account_profile account_profile_city_id_207f6508_fk_geography_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_city_id_207f6508_fk_geography_city_id FOREIGN KEY (city_id) REFERENCES public.geography_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_profile account_profile_user_id_bdd52018_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_user_id_bdd52018_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: brands_subbrand_1 brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: brands_subbrand_2 brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su FOREIGN KEY (sub_brand_1_id) REFERENCES public.brands_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_plan catalog_plan_author_id_19443bad_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_shell catalog_shell_author_id_c4c4abab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_author_id_c4c4abab_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_shell catalog_shell_roof_material_type_i_cecb1252_fk_materials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_roof_material_type_i_cecb1252_fk_materials FOREIGN KEY (roof_material_type_id) REFERENCES public.materials_roofcovertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_shell catalog_shell_socle_material_type__8b9c900c_fk_catalog_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_socle_material_type__8b9c900c_fk_catalog_f FOREIGN KEY (socle_material_type_id) REFERENCES public.catalog_facadematerialtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_shell catalog_shell_wall_material_type_0_816c36ae_fk_catalog_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_shell
    ADD CONSTRAINT catalog_shell_wall_material_type_0_816c36ae_fk_catalog_f FOREIGN KEY (wall_material_type_0_id) REFERENCES public.catalog_facadematerialtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geography_city geography_city_region_id_ea133d50_fk_geography_region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_city
    ADD CONSTRAINT geography_city_region_id_ea133d50_fk_geography_region_id FOREIGN KEY (region_id) REFERENCES public.geography_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geography_region geography_region_country_id_7b89c739_fk_geography_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_country_id_7b89c739_fk_geography_country_id FOREIGN KEY (country_id) REFERENCES public.geography_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materialprices_insulationprice materialprices_insul_name_id_a70a0ae5_fk_materials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insul_name_id_a70a0ae5_fk_materials FOREIGN KEY (name_id) REFERENCES public.materials_insulation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materialprices_insulationprice materialprices_insul_owner_id_ea647b28_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insul_owner_id_ea647b28_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materialprices_rockwallmaterialprice materialprices_rockw_name_id_5a769348_fk_materials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockw_name_id_5a769348_fk_materials FOREIGN KEY (name_id) REFERENCES public.materials_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materialprices_rockwallmaterialprice materialprices_rockw_owner_id_ea24bd0d_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockw_owner_id_ea24bd0d_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_insulation materials_insulation_brand_id_dd7669b2_fk_brands_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_insulation
    ADD CONSTRAINT materials_insulation_brand_id_dd7669b2_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_plaster materials_plaster_brand_id_cc3e5323_fk_brands_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_plaster
    ADD CONSTRAINT materials_plaster_brand_id_cc3e5323_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_plaster materials_plaster_manufacturer_id_060021cd_fk_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_plaster
    ADD CONSTRAINT materials_plaster_manufacturer_id_060021cd_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_plaster_use materials_plaster_us_materialuse_id_3f0e40e1_fk_materials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_us_materialuse_id_3f0e40e1_fk_materials FOREIGN KEY (materialuse_id) REFERENCES public.materials_materialuse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_plaster_use materials_plaster_us_plaster_id_1ce61346_fk_materials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_plaster_use
    ADD CONSTRAINT materials_plaster_us_plaster_id_1ce61346_fk_materials FOREIGN KEY (plaster_id) REFERENCES public.materials_plaster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_algorithm_id_4183f114_fk_catalog_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_algorithm_id_4183f114_fk_catalog_a FOREIGN KEY (algorithm_id) REFERENCES public.catalog_algorithm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_brand_id_4deb8894_fk_brands_br; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_brand_id_4deb8894_fk_brands_br FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_class_average_densit_beb6fff9_fk_standards; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_class_average_densit_beb6fff9_fk_standards FOREIGN KEY (class_average_density_id) REFERENCES public."standards_classаveragedensity"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_class_b_id_1de59e0b_fk_standards; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_class_b_id_1de59e0b_fk_standards FOREIGN KEY (class_b_id) REFERENCES public.standards_classb(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_face_id_712ecb1a_fk_names_dec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_face_id_712ecb1a_fk_names_dec FOREIGN KEY (face_id) REFERENCES public.names_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_manufacturer_id_c1176543_fk_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_manufacturer_id_c1176543_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_mark_d_id_e456d3f5_fk_standards; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_d_id_e456d3f5_fk_standards FOREIGN KEY (mark_d_id) REFERENCES public.standards_markd(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_mark_f_id_48ec4578_fk_standards; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_f_id_48ec4578_fk_standards FOREIGN KEY (mark_f_id) REFERENCES public.standards_markf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_mark_m_id_e96cf97b_fk_standards; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_m_id_e96cf97b_fk_standards FOREIGN KEY (mark_m_id) REFERENCES public.standards_markm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su FOREIGN KEY (sub_brand_1_id) REFERENCES public.brands_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_rockwallmaterialunit materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su FOREIGN KEY (sub_brand_2_id) REFERENCES public.brands_subbrand_2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_siding materials_siding_brand_id_947adead_fk_brands_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_siding
    ADD CONSTRAINT materials_siding_brand_id_947adead_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_siding materials_siding_manufacturer_id_4bd6fcdc_fk_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_siding
    ADD CONSTRAINT materials_siding_manufacturer_id_4bd6fcdc_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_siding_use materials_siding_use_materialuse_id_27444db6_fk_materials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_materialuse_id_27444db6_fk_materials FOREIGN KEY (materialuse_id) REFERENCES public.materials_materialuse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_siding_use materials_siding_use_siding_id_a2f23e27_fk_materials_siding_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_siding_use
    ADD CONSTRAINT materials_siding_use_siding_id_a2f23e27_fk_materials_siding_id FOREIGN KEY (siding_id) REFERENCES public.materials_siding(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_stoneproductline materials_stoneprodu_manufacturer_id_c1271051_fk_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneproductline
    ADD CONSTRAINT materials_stoneprodu_manufacturer_id_c1271051_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_stoneproductline_use materials_stoneprodu_materialuse_id_7e20150f_fk_materials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneprodu_materialuse_id_7e20150f_fk_materials FOREIGN KEY (materialuse_id) REFERENCES public.materials_materialuse(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_stoneproductline_use materials_stoneprodu_stoneproductline_id_6477c585_fk_materials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneproductline_use
    ADD CONSTRAINT materials_stoneprodu_stoneproductline_id_6477c585_fk_materials FOREIGN KEY (stoneproductline_id) REFERENCES public.materials_stoneproductline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: materials_stoneunit materials_stoneunit_product_line_id_c1b449ac_fk_materials; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials_stoneunit
    ADD CONSTRAINT materials_stoneunit_product_line_id_c1b449ac_fk_materials FOREIGN KEY (product_line_id) REFERENCES public.materials_stoneproductline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: names_decorativebrickface_brand names_decorativebric_brand_id_92646ca6_fk_brands_br; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebric_brand_id_92646ca6_fk_brands_br FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: names_decorativebrickface_brand names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec FOREIGN KEY (decorativebrickface_id) REFERENCES public.names_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: suppliers_manufacturer suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: suppliers_manufacturer suppliers_manufacturer_city_id_734a9037_fk_geography_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_city_id_734a9037_fk_geography_city_id FOREIGN KEY (city_id) REFERENCES public.geography_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: suppliers_provider suppliers_provider_primary_activity_id_93261e15_fk_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_primary_activity_id_93261e15_fk_suppliers FOREIGN KEY (primary_activity_id) REFERENCES public.suppliers_activity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: suppliers_provider_secondary_activity suppliers_provider_s_activity_id_31284a51_fk_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_s_activity_id_31284a51_fk_suppliers FOREIGN KEY (activity_id) REFERENCES public.suppliers_activity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: suppliers_provider_secondary_activity suppliers_provider_s_provider_id_2fab0709_fk_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_s_provider_id_2fab0709_fk_suppliers FOREIGN KEY (provider_id) REFERENCES public.suppliers_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: workprices_pilegrillagefoundationworkprices workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices
    ADD CONSTRAINT workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  