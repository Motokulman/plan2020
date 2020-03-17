PGDMP     *    0                x         	   postgres2    12.0    12.0 �   *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    30427 	   postgres2    DATABASE     �   CREATE DATABASE postgres2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE postgres2;
                postgres    false            �            1259    30459 
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
       public          postgres    false    209            .           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
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
       public          postgres    false    211            /           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
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
       public          postgres    false    207            0           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
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
       public          postgres    false    215            1           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    30475    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            2           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
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
       public          postgres    false    217            3           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
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
       public          postgres    false    221            4           0    0    brands_brand_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.brands_brand_id_seq OWNED BY public.brands_brand.id;
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
       public          postgres    false    223            5           0    0    brands_subbrand_1_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.brands_subbrand_1_id_seq OWNED BY public.brands_subbrand_1.id;
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
       public          postgres    false    225            6           0    0    brands_subbrand_2_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.brands_subbrand_2_id_seq OWNED BY public.brands_subbrand_2.id;
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
       public          postgres    false    233            7           0    0    catalog_algorithm_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.catalog_algorithm_id_seq OWNED BY public.catalog_algorithm.id;
          public          postgres    false    232            �            1259    30697    catalog_plan    TABLE     �   CREATE TABLE public.catalog_plan (
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
       public          postgres    false    237            8           0    0    catalog_plan_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_plan_id_seq OWNED BY public.catalog_plan.id;
          public          postgres    false    236            �            1259    30689    catalog_profile    TABLE     t   CREATE TABLE public.catalog_profile (
    id integer NOT NULL,
    city_id integer,
    user_id integer NOT NULL
);
 #   DROP TABLE public.catalog_profile;
       public         heap    postgres    false            �            1259    30687    catalog_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.catalog_profile_id_seq;
       public          postgres    false    235            9           0    0    catalog_profile_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.catalog_profile_id_seq OWNED BY public.catalog_profile.id;
          public          postgres    false    234            �            1259    30555    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public          postgres    false    219            :           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
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
       public          postgres    false    205            ;           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
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
       public          postgres    false    203            <           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202                       1259    31031    django_session    TABLE     �   CREATE TABLE public.django_session (
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
       public          postgres    false    231            =           0    0    geography_city_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.geography_city_id_seq OWNED BY public.geography_city.id;
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
       public          postgres    false    227            >           0    0    geography_country_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.geography_country_id_seq OWNED BY public.geography_country.id;
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
       public          postgres    false    229            ?           0    0    geography_region_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.geography_region_id_seq OWNED BY public.geography_region.id;
          public          postgres    false    228                       1259    31001    materialprices_insulationprice    TABLE     �   CREATE TABLE public.materialprices_insulationprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 2   DROP TABLE public.materialprices_insulationprice;
       public         heap    postgres    false                       1259    30999 %   materialprices_insulationprice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materialprices_insulationprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.materialprices_insulationprice_id_seq;
       public          postgres    false    271            @           0    0 %   materialprices_insulationprice_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.materialprices_insulationprice_id_seq OWNED BY public.materialprices_insulationprice.id;
          public          postgres    false    270                       1259    30993 $   materialprices_rockwallmaterialprice    TABLE     �   CREATE TABLE public.materialprices_rockwallmaterialprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 8   DROP TABLE public.materialprices_rockwallmaterialprice;
       public         heap    postgres    false                       1259    30991 +   materialprices_rockwallmaterialprice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materialprices_rockwallmaterialprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.materialprices_rockwallmaterialprice_id_seq;
       public          postgres    false    269            A           0    0 +   materialprices_rockwallmaterialprice_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.materialprices_rockwallmaterialprice_id_seq OWNED BY public.materialprices_rockwallmaterialprice.id;
          public          postgres    false    268                       1259    30897    materials_bulksand    TABLE     �   CREATE TABLE public.materials_bulksand (
    id integer NOT NULL,
    name character varying(6) NOT NULL,
    weight integer NOT NULL
);
 &   DROP TABLE public.materials_bulksand;
       public         heap    postgres    false                       1259    30895    materials_bulksand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_bulksand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.materials_bulksand_id_seq;
       public          postgres    false    263            B           0    0    materials_bulksand_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.materials_bulksand_id_seq OWNED BY public.materials_bulksand.id;
          public          postgres    false    262                       1259    30913    materials_insulation    TABLE     �   CREATE TABLE public.materials_insulation (
    id integer NOT NULL,
    thermal_conductivity double precision,
    mat_type character varying(9) NOT NULL,
    thick character varying(3) NOT NULL,
    brand_id integer
);
 (   DROP TABLE public.materials_insulation;
       public         heap    postgres    false            
           1259    30911    materials_insulation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_insulation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.materials_insulation_id_seq;
       public          postgres    false    267            C           0    0    materials_insulation_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.materials_insulation_id_seq OWNED BY public.materials_insulation.id;
          public          postgres    false    266            	           1259    30905    materials_rockwallmaterialunit    TABLE     j  CREATE TABLE public.materials_rockwallmaterialunit (
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
       public         heap    postgres    false                       1259    30903 %   materials_rockwallmaterialunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_rockwallmaterialunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.materials_rockwallmaterialunit_id_seq;
       public          postgres    false    265            D           0    0 %   materials_rockwallmaterialunit_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.materials_rockwallmaterialunit_id_seq OWNED BY public.materials_rockwallmaterialunit.id;
          public          postgres    false    264                       1259    30867    names_decorativebrickface    TABLE     u   CREATE TABLE public.names_decorativebrickface (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
 -   DROP TABLE public.names_decorativebrickface;
       public         heap    postgres    false                       1259    30875    names_decorativebrickface_brand    TABLE     �   CREATE TABLE public.names_decorativebrickface_brand (
    id integer NOT NULL,
    decorativebrickface_id integer NOT NULL,
    brand_id integer NOT NULL
);
 3   DROP TABLE public.names_decorativebrickface_brand;
       public         heap    postgres    false                       1259    30873 &   names_decorativebrickface_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.names_decorativebrickface_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.names_decorativebrickface_brand_id_seq;
       public          postgres    false    261            E           0    0 &   names_decorativebrickface_brand_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.names_decorativebrickface_brand_id_seq OWNED BY public.names_decorativebrickface_brand.id;
          public          postgres    false    260                       1259    30865     names_decorativebrickface_id_seq    SEQUENCE     �   CREATE SEQUENCE public.names_decorativebrickface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.names_decorativebrickface_id_seq;
       public          postgres    false    259            F           0    0     names_decorativebrickface_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.names_decorativebrickface_id_seq OWNED BY public.names_decorativebrickface.id;
          public          postgres    false    258            �            1259    30801    standards_classb    TABLE     �   CREATE TABLE public.standards_classb (
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
       public          postgres    false    247            G           0    0    standards_classb_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.standards_classb_id_seq OWNED BY public.standards_classb.id;
          public          postgres    false    246            �            1259    30811    standards_classаveragedensity    TABLE     �   CREATE TABLE public."standards_classаveragedensity" (
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
       public          postgres    false    249            H           0    0 %   standards_classаveragedensity_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."standards_classаveragedensity_id_seq" OWNED BY public."standards_classаveragedensity".id;
          public          postgres    false    248            �            1259    30821    standards_markd    TABLE     �   CREATE TABLE public.standards_markd (
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
       public          postgres    false    251            I           0    0    standards_markd_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.standards_markd_id_seq OWNED BY public.standards_markd.id;
          public          postgres    false    250            �            1259    30831    standards_markf    TABLE     �   CREATE TABLE public.standards_markf (
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
       public          postgres    false    253            J           0    0    standards_markf_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.standards_markf_id_seq OWNED BY public.standards_markf.id;
          public          postgres    false    252            �            1259    30841    standards_markm    TABLE     �   CREATE TABLE public.standards_markm (
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
       public          postgres    false    255            K           0    0    standards_markm_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.standards_markm_id_seq OWNED BY public.standards_markm.id;
          public          postgres    false    254                       1259    30851    standards_nfsize    TABLE     �   CREATE TABLE public.standards_nfsize (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    greater_bed_size integer,
    minor_bed_size integer,
    height integer
);
 $   DROP TABLE public.standards_nfsize;
       public         heap    postgres    false                        1259    30849    standards_nfsize_id_seq    SEQUENCE     �   CREATE SEQUENCE public.standards_nfsize_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.standards_nfsize_id_seq;
       public          postgres    false    257            L           0    0    standards_nfsize_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.standards_nfsize_id_seq OWNED BY public.standards_nfsize.id;
          public          postgres    false    256            �            1259    30728    suppliers_activity    TABLE     �   CREATE TABLE public.suppliers_activity (
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
       public          postgres    false    239            M           0    0    suppliers_activity_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.suppliers_activity_id_seq OWNED BY public.suppliers_activity.id;
          public          postgres    false    238            �            1259    30756    suppliers_manufacturer    TABLE     �   CREATE TABLE public.suppliers_manufacturer (
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
       public          postgres    false    245            N           0    0    suppliers_manufacturer_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.suppliers_manufacturer_id_seq OWNED BY public.suppliers_manufacturer.id;
          public          postgres    false    244            �            1259    30738    suppliers_provider    TABLE     �   CREATE TABLE public.suppliers_provider (
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
       public          postgres    false    241            O           0    0    suppliers_provider_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.suppliers_provider_id_seq OWNED BY public.suppliers_provider.id;
          public          postgres    false    240            �            1259    30748 %   suppliers_provider_secondary_activity    TABLE     �   CREATE TABLE public.suppliers_provider_secondary_activity (
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
       public          postgres    false    243            P           0    0 ,   suppliers_provider_secondary_activity_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.suppliers_provider_secondary_activity_id_seq OWNED BY public.suppliers_provider_secondary_activity.id;
          public          postgres    false    242                       1259    31043 +   workprices_pilegrillagefoundationworkprices    TABLE     �  CREATE TABLE public.workprices_pilegrillagefoundationworkprices (
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
       public         heap    postgres    false                       1259    31041 2   workprices_pilegrillagefoundationworkprices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq;
       public          postgres    false    274            Q           0    0 2   workprices_pilegrillagefoundationworkprices_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.workprices_pilegrillagefoundationworkprices_id_seq OWNED BY public.workprices_pilegrillagefoundationworkprices.id;
          public          postgres    false    273            ]           2604    30462    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            ^           2604    30472    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            \           2604    30454    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            _           2604    30480    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            `           2604    30490    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            a           2604    30498    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            d           2604    30591    brands_brand id    DEFAULT     r   ALTER TABLE ONLY public.brands_brand ALTER COLUMN id SET DEFAULT nextval('public.brands_brand_id_seq'::regclass);
 >   ALTER TABLE public.brands_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            e           2604    30601    brands_subbrand_1 id    DEFAULT     |   ALTER TABLE ONLY public.brands_subbrand_1 ALTER COLUMN id SET DEFAULT nextval('public.brands_subbrand_1_id_seq'::regclass);
 C   ALTER TABLE public.brands_subbrand_1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            f           2604    30611    brands_subbrand_2 id    DEFAULT     |   ALTER TABLE ONLY public.brands_subbrand_2 ALTER COLUMN id SET DEFAULT nextval('public.brands_subbrand_2_id_seq'::regclass);
 C   ALTER TABLE public.brands_subbrand_2 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            j           2604    30680    catalog_algorithm id    DEFAULT     |   ALTER TABLE ONLY public.catalog_algorithm ALTER COLUMN id SET DEFAULT nextval('public.catalog_algorithm_id_seq'::regclass);
 C   ALTER TABLE public.catalog_algorithm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            l           2604    30700    catalog_plan id    DEFAULT     r   ALTER TABLE ONLY public.catalog_plan ALTER COLUMN id SET DEFAULT nextval('public.catalog_plan_id_seq'::regclass);
 >   ALTER TABLE public.catalog_plan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            k           2604    30692    catalog_profile id    DEFAULT     x   ALTER TABLE ONLY public.catalog_profile ALTER COLUMN id SET DEFAULT nextval('public.catalog_profile_id_seq'::regclass);
 A   ALTER TABLE public.catalog_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235            b           2604    30558    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            [           2604    30444    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            Z           2604    30433    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            i           2604    30658    geography_city id    DEFAULT     v   ALTER TABLE ONLY public.geography_city ALTER COLUMN id SET DEFAULT nextval('public.geography_city_id_seq'::regclass);
 @   ALTER TABLE public.geography_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            g           2604    30636    geography_country id    DEFAULT     |   ALTER TABLE ONLY public.geography_country ALTER COLUMN id SET DEFAULT nextval('public.geography_country_id_seq'::regclass);
 C   ALTER TABLE public.geography_country ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            h           2604    30646    geography_region id    DEFAULT     z   ALTER TABLE ONLY public.geography_region ALTER COLUMN id SET DEFAULT nextval('public.geography_region_id_seq'::regclass);
 B   ALTER TABLE public.geography_region ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            }           2604    31004 !   materialprices_insulationprice id    DEFAULT     �   ALTER TABLE ONLY public.materialprices_insulationprice ALTER COLUMN id SET DEFAULT nextval('public.materialprices_insulationprice_id_seq'::regclass);
 P   ALTER TABLE public.materialprices_insulationprice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    270    271    271            |           2604    30996 '   materialprices_rockwallmaterialprice id    DEFAULT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice ALTER COLUMN id SET DEFAULT nextval('public.materialprices_rockwallmaterialprice_id_seq'::regclass);
 V   ALTER TABLE public.materialprices_rockwallmaterialprice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    268    269            y           2604    30900    materials_bulksand id    DEFAULT     ~   ALTER TABLE ONLY public.materials_bulksand ALTER COLUMN id SET DEFAULT nextval('public.materials_bulksand_id_seq'::regclass);
 D   ALTER TABLE public.materials_bulksand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    262    263            {           2604    30916    materials_insulation id    DEFAULT     �   ALTER TABLE ONLY public.materials_insulation ALTER COLUMN id SET DEFAULT nextval('public.materials_insulation_id_seq'::regclass);
 F   ALTER TABLE public.materials_insulation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    267    266    267            z           2604    30908 !   materials_rockwallmaterialunit id    DEFAULT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit ALTER COLUMN id SET DEFAULT nextval('public.materials_rockwallmaterialunit_id_seq'::regclass);
 P   ALTER TABLE public.materials_rockwallmaterialunit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    265    265            w           2604    30870    names_decorativebrickface id    DEFAULT     �   ALTER TABLE ONLY public.names_decorativebrickface ALTER COLUMN id SET DEFAULT nextval('public.names_decorativebrickface_id_seq'::regclass);
 K   ALTER TABLE public.names_decorativebrickface ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258    259            x           2604    30878 "   names_decorativebrickface_brand id    DEFAULT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand ALTER COLUMN id SET DEFAULT nextval('public.names_decorativebrickface_brand_id_seq'::regclass);
 Q   ALTER TABLE public.names_decorativebrickface_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    261    261            q           2604    30804    standards_classb id    DEFAULT     z   ALTER TABLE ONLY public.standards_classb ALTER COLUMN id SET DEFAULT nextval('public.standards_classb_id_seq'::regclass);
 B   ALTER TABLE public.standards_classb ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247            r           2604    30814 !   standards_classаveragedensity id    DEFAULT     �   ALTER TABLE ONLY public."standards_classаveragedensity" ALTER COLUMN id SET DEFAULT nextval('public."standards_classаveragedensity_id_seq"'::regclass);
 R   ALTER TABLE public."standards_classаveragedensity" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249            s           2604    30824    standards_markd id    DEFAULT     x   ALTER TABLE ONLY public.standards_markd ALTER COLUMN id SET DEFAULT nextval('public.standards_markd_id_seq'::regclass);
 A   ALTER TABLE public.standards_markd ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250    251            t           2604    30834    standards_markf id    DEFAULT     x   ALTER TABLE ONLY public.standards_markf ALTER COLUMN id SET DEFAULT nextval('public.standards_markf_id_seq'::regclass);
 A   ALTER TABLE public.standards_markf ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253            u           2604    30844    standards_markm id    DEFAULT     x   ALTER TABLE ONLY public.standards_markm ALTER COLUMN id SET DEFAULT nextval('public.standards_markm_id_seq'::regclass);
 A   ALTER TABLE public.standards_markm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    255    255            v           2604    30854    standards_nfsize id    DEFAULT     z   ALTER TABLE ONLY public.standards_nfsize ALTER COLUMN id SET DEFAULT nextval('public.standards_nfsize_id_seq'::regclass);
 B   ALTER TABLE public.standards_nfsize ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    257    257            m           2604    30731    suppliers_activity id    DEFAULT     ~   ALTER TABLE ONLY public.suppliers_activity ALTER COLUMN id SET DEFAULT nextval('public.suppliers_activity_id_seq'::regclass);
 D   ALTER TABLE public.suppliers_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            p           2604    30759    suppliers_manufacturer id    DEFAULT     �   ALTER TABLE ONLY public.suppliers_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.suppliers_manufacturer_id_seq'::regclass);
 H   ALTER TABLE public.suppliers_manufacturer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            n           2604    30741    suppliers_provider id    DEFAULT     ~   ALTER TABLE ONLY public.suppliers_provider ALTER COLUMN id SET DEFAULT nextval('public.suppliers_provider_id_seq'::regclass);
 D   ALTER TABLE public.suppliers_provider ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241            o           2604    30751 (   suppliers_provider_secondary_activity id    DEFAULT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity ALTER COLUMN id SET DEFAULT nextval('public.suppliers_provider_secondary_activity_id_seq'::regclass);
 W   ALTER TABLE public.suppliers_provider_secondary_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243            ~           2604    31046 .   workprices_pilegrillagefoundationworkprices id    DEFAULT     �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices ALTER COLUMN id SET DEFAULT nextval('public.workprices_pilegrillagefoundationworkprices_id_seq'::regclass);
 ]   ALTER TABLE public.workprices_pilegrillagefoundationworkprices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    273    274    274            �          0    30459 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   �      �          0    30469    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   �      �          0    30451    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   �      �          0    30477 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   �      �          0    30487    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   x      �          0    30495    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   �      �          0    30588    brands_brand 
   TABLE DATA           0   COPY public.brands_brand (id, name) FROM stdin;
    public          postgres    false    221   �      �          0    30598    brands_subbrand_1 
   TABLE DATA           ?   COPY public.brands_subbrand_1 (id, name, brand_id) FROM stdin;
    public          postgres    false    223   �      �          0    30608    brands_subbrand_2 
   TABLE DATA           E   COPY public.brands_subbrand_2 (id, name, sub_brand_1_id) FROM stdin;
    public          postgres    false    225   �      �          0    30677    catalog_algorithm 
   TABLE DATA           A   COPY public.catalog_algorithm (id, identifier, name) FROM stdin;
    public          postgres    false    233   	                 0    30697    catalog_plan 
   TABLE DATA           M   COPY public.catalog_plan (id, title, scheme, checked, author_id) FROM stdin;
    public          postgres    false    237   &                  0    30689    catalog_profile 
   TABLE DATA           ?   COPY public.catalog_profile (id, city_id, user_id) FROM stdin;
    public          postgres    false    235   T       �          0    30555    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   q       �          0    30441    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   �       �          0    30430    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   �!      %          0    31031    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    272   "$      �          0    30655    geography_city 
   TABLE DATA           r   COPY public.geography_city (id, name, heating_period_duration, heating_period_temperature, region_id) FROM stdin;
    public          postgres    false    231   H%      �          0    30633    geography_country 
   TABLE DATA           5   COPY public.geography_country (id, name) FROM stdin;
    public          postgres    false    227   e%      �          0    30643    geography_region 
   TABLE DATA           F   COPY public.geography_region (id, name, code, country_id) FROM stdin;
    public          postgres    false    229   �%      $          0    31001    materialprices_insulationprice 
   TABLE DATA           V   COPY public.materialprices_insulationprice (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    271   �%      "          0    30993 $   materialprices_rockwallmaterialprice 
   TABLE DATA           \   COPY public.materialprices_rockwallmaterialprice (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    269   �%                0    30897    materials_bulksand 
   TABLE DATA           >   COPY public.materials_bulksand (id, name, weight) FROM stdin;
    public          postgres    false    263   �%                 0    30913    materials_insulation 
   TABLE DATA           c   COPY public.materials_insulation (id, thermal_conductivity, mat_type, thick, brand_id) FROM stdin;
    public          postgres    false    267   �%                0    30905    materials_rockwallmaterialunit 
   TABLE DATA           y  COPY public.materials_rockwallmaterialunit (id, name, material, greater_bed_size, minor_bed_size, height, tongue_and_groove, polish, purpose, partition_or_bearing, body_type, blind_hollow, primary_or_additional, algorithm_id, brand_id, class_average_density_id, class_b_id, face_id, manufacturer_id, mark_d_id, mark_f_id, mark_m_id, sub_brand_1_id, sub_brand_2_id) FROM stdin;
    public          postgres    false    265   &                0    30867    names_decorativebrickface 
   TABLE DATA           =   COPY public.names_decorativebrickface (id, name) FROM stdin;
    public          postgres    false    259   0&                0    30875    names_decorativebrickface_brand 
   TABLE DATA           _   COPY public.names_decorativebrickface_brand (id, decorativebrickface_id, brand_id) FROM stdin;
    public          postgres    false    261   M&                0    30801    standards_classb 
   TABLE DATA           @   COPY public.standards_classb (id, identifier, name) FROM stdin;
    public          postgres    false    247   j&                0    30811    standards_classаveragedensity 
   TABLE DATA           P   COPY public."standards_classаveragedensity" (id, identifier, name) FROM stdin;
    public          postgres    false    249   �&                0    30821    standards_markd 
   TABLE DATA           ?   COPY public.standards_markd (id, identifier, name) FROM stdin;
    public          postgres    false    251   �&                0    30831    standards_markf 
   TABLE DATA           ?   COPY public.standards_markf (id, identifier, name) FROM stdin;
    public          postgres    false    253   �&                0    30841    standards_markm 
   TABLE DATA           ?   COPY public.standards_markm (id, identifier, name) FROM stdin;
    public          postgres    false    255   �&                0    30851    standards_nfsize 
   TABLE DATA           j   COPY public.standards_nfsize (id, identifier, name, greater_bed_size, minor_bed_size, height) FROM stdin;
    public          postgres    false    257   �&                0    30728    suppliers_activity 
   TABLE DATA           B   COPY public.suppliers_activity (id, identifier, name) FROM stdin;
    public          postgres    false    239   '      
          0    30756    suppliers_manufacturer 
   TABLE DATA           T   COPY public.suppliers_manufacturer (id, alias, name, brand_id, city_id) FROM stdin;
    public          postgres    false    245   5'                0    30738    suppliers_provider 
   TABLE DATA           K   COPY public.suppliers_provider (id, name, primary_activity_id) FROM stdin;
    public          postgres    false    241   R'                0    30748 %   suppliers_provider_secondary_activity 
   TABLE DATA           ]   COPY public.suppliers_provider_secondary_activity (id, provider_id, activity_id) FROM stdin;
    public          postgres    false    243   o'      '          0    31043 +   workprices_pilegrillagefoundationworkprices 
   TABLE DATA             COPY public.workprices_pilegrillagefoundationworkprices (id, const_expenditure, transportation_procurement_cost, reinforcement_binding, clamp, pile_frame, formwork, length_costs, square_costs, volume_costs, pile_pour, man_hours_cost, man_hours_profit, owner_id) FROM stdin;
    public          postgres    false    274   �'      R           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    208            S           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            T           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 124, true);
          public          postgres    false    206            U           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    214            V           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    212            W           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            X           0    0    brands_brand_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.brands_brand_id_seq', 1, false);
          public          postgres    false    220            Y           0    0    brands_subbrand_1_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.brands_subbrand_1_id_seq', 1, false);
          public          postgres    false    222            Z           0    0    brands_subbrand_2_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.brands_subbrand_2_id_seq', 1, false);
          public          postgres    false    224            [           0    0    catalog_algorithm_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalog_algorithm_id_seq', 1, false);
          public          postgres    false    232            \           0    0    catalog_plan_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.catalog_plan_id_seq', 1, true);
          public          postgres    false    236            ]           0    0    catalog_profile_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.catalog_profile_id_seq', 1, false);
          public          postgres    false    234            ^           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    218            _           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 31, true);
          public          postgres    false    204            `           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);
          public          postgres    false    202            a           0    0    geography_city_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.geography_city_id_seq', 1, false);
          public          postgres    false    230            b           0    0    geography_country_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.geography_country_id_seq', 1, false);
          public          postgres    false    226            c           0    0    geography_region_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.geography_region_id_seq', 1, false);
          public          postgres    false    228            d           0    0 %   materialprices_insulationprice_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.materialprices_insulationprice_id_seq', 1, false);
          public          postgres    false    270            e           0    0 +   materialprices_rockwallmaterialprice_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.materialprices_rockwallmaterialprice_id_seq', 1, false);
          public          postgres    false    268            f           0    0    materials_bulksand_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.materials_bulksand_id_seq', 1, false);
          public          postgres    false    262            g           0    0    materials_insulation_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.materials_insulation_id_seq', 1, false);
          public          postgres    false    266            h           0    0 %   materials_rockwallmaterialunit_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.materials_rockwallmaterialunit_id_seq', 1, false);
          public          postgres    false    264            i           0    0 &   names_decorativebrickface_brand_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.names_decorativebrickface_brand_id_seq', 1, false);
          public          postgres    false    260            j           0    0     names_decorativebrickface_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.names_decorativebrickface_id_seq', 1, false);
          public          postgres    false    258            k           0    0    standards_classb_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.standards_classb_id_seq', 1, false);
          public          postgres    false    246            l           0    0 %   standards_classаveragedensity_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."standards_classаveragedensity_id_seq"', 1, false);
          public          postgres    false    248            m           0    0    standards_markd_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.standards_markd_id_seq', 1, false);
          public          postgres    false    250            n           0    0    standards_markf_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.standards_markf_id_seq', 1, false);
          public          postgres    false    252            o           0    0    standards_markm_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.standards_markm_id_seq', 1, false);
          public          postgres    false    254            p           0    0    standards_nfsize_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.standards_nfsize_id_seq', 1, false);
          public          postgres    false    256            q           0    0    suppliers_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.suppliers_activity_id_seq', 1, false);
          public          postgres    false    238            r           0    0    suppliers_manufacturer_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.suppliers_manufacturer_id_seq', 1, false);
          public          postgres    false    244            s           0    0    suppliers_provider_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.suppliers_provider_id_seq', 1, false);
          public          postgres    false    240            t           0    0 ,   suppliers_provider_secondary_activity_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.suppliers_provider_secondary_activity_id_seq', 1, false);
          public          postgres    false    242            u           0    0 2   workprices_pilegrillagefoundationworkprices_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.workprices_pilegrillagefoundationworkprices_id_seq', 1, false);
          public          postgres    false    273            �           2606    30584    auth_group auth_group_name_key 
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
       public            postgres    false    217            �           2606    30540 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            �           2606    30578     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213            �           2606    30595 "   brands_brand brands_brand_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.brands_brand
    ADD CONSTRAINT brands_brand_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.brands_brand DROP CONSTRAINT brands_brand_name_key;
       public            postgres    false    221            �           2606    30593    brands_brand brands_brand_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.brands_brand
    ADD CONSTRAINT brands_brand_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.brands_brand DROP CONSTRAINT brands_brand_pkey;
       public            postgres    false    221            �           2606    30605 ,   brands_subbrand_1 brands_subbrand_1_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.brands_subbrand_1 DROP CONSTRAINT brands_subbrand_1_name_key;
       public            postgres    false    223            �           2606    30603 (   brands_subbrand_1 brands_subbrand_1_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.brands_subbrand_1 DROP CONSTRAINT brands_subbrand_1_pkey;
       public            postgres    false    223            �           2606    30615 ,   brands_subbrand_2 brands_subbrand_2_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.brands_subbrand_2 DROP CONSTRAINT brands_subbrand_2_name_key;
       public            postgres    false    225            �           2606    30613 (   brands_subbrand_2 brands_subbrand_2_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.brands_subbrand_2 DROP CONSTRAINT brands_subbrand_2_pkey;
       public            postgres    false    225            �           2606    30684 2   catalog_algorithm catalog_algorithm_identifier_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_identifier_key UNIQUE (identifier);
 \   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_identifier_key;
       public            postgres    false    233            �           2606    30686 ,   catalog_algorithm catalog_algorithm_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_name_key;
       public            postgres    false    233            �           2606    30682 (   catalog_algorithm catalog_algorithm_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_pkey;
       public            postgres    false    233            �           2606    30705    catalog_plan catalog_plan_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_pkey;
       public            postgres    false    237            �           2606    30694 $   catalog_profile catalog_profile_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_pkey;
       public            postgres    false    235            �           2606    30564 &   django_admin_log django_admin_log_pkey 
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
       public            postgres    false    203            4           2606    31038 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    272            �           2606    30660 "   geography_city geography_city_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.geography_city
    ADD CONSTRAINT geography_city_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.geography_city DROP CONSTRAINT geography_city_pkey;
       public            postgres    false    231            �           2606    30640 ,   geography_country geography_country_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.geography_country
    ADD CONSTRAINT geography_country_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.geography_country DROP CONSTRAINT geography_country_name_key;
       public            postgres    false    227            �           2606    30638 (   geography_country geography_country_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.geography_country
    ADD CONSTRAINT geography_country_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.geography_country DROP CONSTRAINT geography_country_pkey;
       public            postgres    false    227            �           2606    30652 *   geography_region geography_region_code_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_code_key UNIQUE (code);
 T   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_code_key;
       public            postgres    false    229            �           2606    30650 *   geography_region geography_region_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_name_key;
       public            postgres    false    229            �           2606    30648 &   geography_region geography_region_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_pkey;
       public            postgres    false    229            1           2606    31006 B   materialprices_insulationprice materialprices_insulationprice_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insulationprice_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.materialprices_insulationprice DROP CONSTRAINT materialprices_insulationprice_pkey;
       public            postgres    false    271            -           2606    30998 N   materialprices_rockwallmaterialprice materialprices_rockwallmaterialprice_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockwallmaterialprice_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice DROP CONSTRAINT materialprices_rockwallmaterialprice_pkey;
       public            postgres    false    269                       2606    30902 *   materials_bulksand materials_bulksand_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.materials_bulksand
    ADD CONSTRAINT materials_bulksand_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.materials_bulksand DROP CONSTRAINT materials_bulksand_pkey;
       public            postgres    false    263            )           2606    30918 .   materials_insulation materials_insulation_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.materials_insulation
    ADD CONSTRAINT materials_insulation_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.materials_insulation DROP CONSTRAINT materials_insulation_pkey;
       public            postgres    false    267            $           2606    30910 B   materials_rockwallmaterialunit materials_rockwallmaterialunit_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallmaterialunit_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallmaterialunit_pkey;
       public            postgres    false    265                       2606    30882 _   names_decorativebrickface_brand names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq UNIQUE (decorativebrickface_id, brand_id);
 �   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebrickfac_decorativebrickface_id_b_2f3593b3_uniq;
       public            postgres    false    261    261                       2606    30880 D   names_decorativebrickface_brand names_decorativebrickface_brand_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebrickface_brand_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebrickface_brand_pkey;
       public            postgres    false    261                       2606    30872 8   names_decorativebrickface names_decorativebrickface_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.names_decorativebrickface
    ADD CONSTRAINT names_decorativebrickface_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.names_decorativebrickface DROP CONSTRAINT names_decorativebrickface_pkey;
       public            postgres    false    259            �           2606    30808 0   standards_classb standards_classb_identifier_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.standards_classb
    ADD CONSTRAINT standards_classb_identifier_key UNIQUE (identifier);
 Z   ALTER TABLE ONLY public.standards_classb DROP CONSTRAINT standards_classb_identifier_key;
       public            postgres    false    247            �           2606    30806 &   standards_classb standards_classb_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.standards_classb
    ADD CONSTRAINT standards_classb_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.standards_classb DROP CONSTRAINT standards_classb_pkey;
       public            postgres    false    247            �           2606    30818 L   standards_classаveragedensity standards_classаveragedensity_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."standards_classаveragedensity"
    ADD CONSTRAINT "standards_classаveragedensity_identifier_key" UNIQUE (identifier);
 z   ALTER TABLE ONLY public."standards_classаveragedensity" DROP CONSTRAINT "standards_classаveragedensity_identifier_key";
       public            postgres    false    249            �           2606    30816 B   standards_classаveragedensity standards_classаveragedensity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."standards_classаveragedensity"
    ADD CONSTRAINT "standards_classаveragedensity_pkey" PRIMARY KEY (id);
 p   ALTER TABLE ONLY public."standards_classаveragedensity" DROP CONSTRAINT "standards_classаveragedensity_pkey";
       public            postgres    false    249            �           2606    30828 .   standards_markd standards_markd_identifier_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.standards_markd
    ADD CONSTRAINT standards_markd_identifier_key UNIQUE (identifier);
 X   ALTER TABLE ONLY public.standards_markd DROP CONSTRAINT standards_markd_identifier_key;
       public            postgres    false    251                        2606    30826 $   standards_markd standards_markd_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.standards_markd
    ADD CONSTRAINT standards_markd_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.standards_markd DROP CONSTRAINT standards_markd_pkey;
       public            postgres    false    251                       2606    30838 .   standards_markf standards_markf_identifier_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.standards_markf
    ADD CONSTRAINT standards_markf_identifier_key UNIQUE (identifier);
 X   ALTER TABLE ONLY public.standards_markf DROP CONSTRAINT standards_markf_identifier_key;
       public            postgres    false    253                       2606    30836 $   standards_markf standards_markf_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.standards_markf
    ADD CONSTRAINT standards_markf_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.standards_markf DROP CONSTRAINT standards_markf_pkey;
       public            postgres    false    253                       2606    30848 .   standards_markm standards_markm_identifier_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.standards_markm
    ADD CONSTRAINT standards_markm_identifier_key UNIQUE (identifier);
 X   ALTER TABLE ONLY public.standards_markm DROP CONSTRAINT standards_markm_identifier_key;
       public            postgres    false    255            
           2606    30846 $   standards_markm standards_markm_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.standards_markm
    ADD CONSTRAINT standards_markm_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.standards_markm DROP CONSTRAINT standards_markm_pkey;
       public            postgres    false    255                       2606    30858 0   standards_nfsize standards_nfsize_identifier_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.standards_nfsize
    ADD CONSTRAINT standards_nfsize_identifier_key UNIQUE (identifier);
 Z   ALTER TABLE ONLY public.standards_nfsize DROP CONSTRAINT standards_nfsize_identifier_key;
       public            postgres    false    257                       2606    30856 &   standards_nfsize standards_nfsize_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.standards_nfsize
    ADD CONSTRAINT standards_nfsize_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.standards_nfsize DROP CONSTRAINT standards_nfsize_pkey;
       public            postgres    false    257            �           2606    30735 4   suppliers_activity suppliers_activity_identifier_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.suppliers_activity
    ADD CONSTRAINT suppliers_activity_identifier_key UNIQUE (identifier);
 ^   ALTER TABLE ONLY public.suppliers_activity DROP CONSTRAINT suppliers_activity_identifier_key;
       public            postgres    false    239            �           2606    30733 *   suppliers_activity suppliers_activity_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.suppliers_activity
    ADD CONSTRAINT suppliers_activity_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.suppliers_activity DROP CONSTRAINT suppliers_activity_pkey;
       public            postgres    false    239            �           2606    30763 6   suppliers_manufacturer suppliers_manufacturer_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_name_key UNIQUE (name);
 `   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_name_key;
       public            postgres    false    245            �           2606    30761 2   suppliers_manufacturer suppliers_manufacturer_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_pkey;
       public            postgres    false    245            �           2606    30745 .   suppliers_provider suppliers_provider_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.suppliers_provider DROP CONSTRAINT suppliers_provider_name_key;
       public            postgres    false    241            �           2606    30743 *   suppliers_provider suppliers_provider_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.suppliers_provider DROP CONSTRAINT suppliers_provider_pkey;
       public            postgres    false    241            �           2606    30773 d   suppliers_provider_secondary_activity suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq UNIQUE (provider_id, activity_id);
 �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_secon_provider_id_activity_id_edc7fd0d_uniq;
       public            postgres    false    243    243            �           2606    30753 P   suppliers_provider_secondary_activity suppliers_provider_secondary_activity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_secondary_activity_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_secondary_activity_pkey;
       public            postgres    false    243            8           2606    31048 \   workprices_pilegrillagefoundationworkprices workprices_pilegrillagefoundationworkprices_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices
    ADD CONSTRAINT workprices_pilegrillagefoundationworkprices_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices DROP CONSTRAINT workprices_pilegrillagefoundationworkprices_pkey;
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
       public            postgres    false    213            �           1259    30616    brands_brand_name_5759061b_like    INDEX     l   CREATE INDEX brands_brand_name_5759061b_like ON public.brands_brand USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.brands_brand_name_5759061b_like;
       public            postgres    false    221            �           1259    30623 #   brands_subbrand_1_brand_id_7085621b    INDEX     e   CREATE INDEX brands_subbrand_1_brand_id_7085621b ON public.brands_subbrand_1 USING btree (brand_id);
 7   DROP INDEX public.brands_subbrand_1_brand_id_7085621b;
       public            postgres    false    223            �           1259    30622 $   brands_subbrand_1_name_f5c24720_like    INDEX     v   CREATE INDEX brands_subbrand_1_name_f5c24720_like ON public.brands_subbrand_1 USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.brands_subbrand_1_name_f5c24720_like;
       public            postgres    false    223            �           1259    30629 $   brands_subbrand_2_name_d930b212_like    INDEX     v   CREATE INDEX brands_subbrand_2_name_d930b212_like ON public.brands_subbrand_2 USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.brands_subbrand_2_name_d930b212_like;
       public            postgres    false    225            �           1259    30630 )   brands_subbrand_2_sub_brand_1_id_16ad81ef    INDEX     q   CREATE INDEX brands_subbrand_2_sub_brand_1_id_16ad81ef ON public.brands_subbrand_2 USING btree (sub_brand_1_id);
 =   DROP INDEX public.brands_subbrand_2_sub_brand_1_id_16ad81ef;
       public            postgres    false    225            �           1259    30706 *   catalog_algorithm_identifier_eb6862d5_like    INDEX     �   CREATE INDEX catalog_algorithm_identifier_eb6862d5_like ON public.catalog_algorithm USING btree (identifier varchar_pattern_ops);
 >   DROP INDEX public.catalog_algorithm_identifier_eb6862d5_like;
       public            postgres    false    233            �           1259    30707 $   catalog_algorithm_name_5dd925d3_like    INDEX     v   CREATE INDEX catalog_algorithm_name_5dd925d3_like ON public.catalog_algorithm USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.catalog_algorithm_name_5dd925d3_like;
       public            postgres    false    233            �           1259    30725    catalog_plan_author_id_19443bad    INDEX     ]   CREATE INDEX catalog_plan_author_id_19443bad ON public.catalog_plan USING btree (author_id);
 3   DROP INDEX public.catalog_plan_author_id_19443bad;
       public            postgres    false    237            �           1259    30718     catalog_profile_city_id_2b229f7f    INDEX     _   CREATE INDEX catalog_profile_city_id_2b229f7f ON public.catalog_profile USING btree (city_id);
 4   DROP INDEX public.catalog_profile_city_id_2b229f7f;
       public            postgres    false    235            �           1259    30719     catalog_profile_user_id_7c4daf2b    INDEX     _   CREATE INDEX catalog_profile_user_id_7c4daf2b ON public.catalog_profile USING btree (user_id);
 4   DROP INDEX public.catalog_profile_user_id_7c4daf2b;
       public            postgres    false    235            �           1259    30575 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219            �           1259    30576 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219            2           1259    31040 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    272            5           1259    31039 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    272            �           1259    30674 !   geography_city_region_id_ea133d50    INDEX     a   CREATE INDEX geography_city_region_id_ea133d50 ON public.geography_city USING btree (region_id);
 5   DROP INDEX public.geography_city_region_id_ea133d50;
       public            postgres    false    231            �           1259    30661 $   geography_country_name_477df8ef_like    INDEX     v   CREATE INDEX geography_country_name_477df8ef_like ON public.geography_country USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.geography_country_name_477df8ef_like;
       public            postgres    false    227            �           1259    30668 $   geography_region_country_id_7b89c739    INDEX     g   CREATE INDEX geography_region_country_id_7b89c739 ON public.geography_region USING btree (country_id);
 8   DROP INDEX public.geography_region_country_id_7b89c739;
       public            postgres    false    229            �           1259    30667 #   geography_region_name_78b61e6a_like    INDEX     t   CREATE INDEX geography_region_name_78b61e6a_like ON public.geography_region USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.geography_region_name_78b61e6a_like;
       public            postgres    false    229            .           1259    31029 /   materialprices_insulationprice_name_id_a70a0ae5    INDEX     }   CREATE INDEX materialprices_insulationprice_name_id_a70a0ae5 ON public.materialprices_insulationprice USING btree (name_id);
 C   DROP INDEX public.materialprices_insulationprice_name_id_a70a0ae5;
       public            postgres    false    271            /           1259    31030 0   materialprices_insulationprice_owner_id_ea647b28    INDEX        CREATE INDEX materialprices_insulationprice_owner_id_ea647b28 ON public.materialprices_insulationprice USING btree (owner_id);
 D   DROP INDEX public.materialprices_insulationprice_owner_id_ea647b28;
       public            postgres    false    271            *           1259    31017 5   materialprices_rockwallmaterialprice_name_id_5a769348    INDEX     �   CREATE INDEX materialprices_rockwallmaterialprice_name_id_5a769348 ON public.materialprices_rockwallmaterialprice USING btree (name_id);
 I   DROP INDEX public.materialprices_rockwallmaterialprice_name_id_5a769348;
       public            postgres    false    269            +           1259    31018 6   materialprices_rockwallmaterialprice_owner_id_ea24bd0d    INDEX     �   CREATE INDEX materialprices_rockwallmaterialprice_owner_id_ea24bd0d ON public.materialprices_rockwallmaterialprice USING btree (owner_id);
 J   DROP INDEX public.materialprices_rockwallmaterialprice_owner_id_ea24bd0d;
       public            postgres    false    269            '           1259    30990 &   materials_insulation_brand_id_dd7669b2    INDEX     k   CREATE INDEX materials_insulation_brand_id_dd7669b2 ON public.materials_insulation USING btree (brand_id);
 :   DROP INDEX public.materials_insulation_brand_id_dd7669b2;
       public            postgres    false    267                       1259    30976 <   materials_rockwallmaterial_class_average_density_id_beb6fff9    INDEX     �   CREATE INDEX materials_rockwallmaterial_class_average_density_id_beb6fff9 ON public.materials_rockwallmaterialunit USING btree (class_average_density_id);
 P   DROP INDEX public.materials_rockwallmaterial_class_average_density_id_beb6fff9;
       public            postgres    false    265                       1259    30974 4   materials_rockwallmaterialunit_algorithm_id_4183f114    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_algorithm_id_4183f114 ON public.materials_rockwallmaterialunit USING btree (algorithm_id);
 H   DROP INDEX public.materials_rockwallmaterialunit_algorithm_id_4183f114;
       public            postgres    false    265                       1259    30975 0   materials_rockwallmaterialunit_brand_id_4deb8894    INDEX        CREATE INDEX materials_rockwallmaterialunit_brand_id_4deb8894 ON public.materials_rockwallmaterialunit USING btree (brand_id);
 D   DROP INDEX public.materials_rockwallmaterialunit_brand_id_4deb8894;
       public            postgres    false    265                       1259    30977 2   materials_rockwallmaterialunit_class_b_id_1de59e0b    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_class_b_id_1de59e0b ON public.materials_rockwallmaterialunit USING btree (class_b_id);
 F   DROP INDEX public.materials_rockwallmaterialunit_class_b_id_1de59e0b;
       public            postgres    false    265                       1259    30978 /   materials_rockwallmaterialunit_face_id_712ecb1a    INDEX     }   CREATE INDEX materials_rockwallmaterialunit_face_id_712ecb1a ON public.materials_rockwallmaterialunit USING btree (face_id);
 C   DROP INDEX public.materials_rockwallmaterialunit_face_id_712ecb1a;
       public            postgres    false    265                       1259    30979 7   materials_rockwallmaterialunit_manufacturer_id_c1176543    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_manufacturer_id_c1176543 ON public.materials_rockwallmaterialunit USING btree (manufacturer_id);
 K   DROP INDEX public.materials_rockwallmaterialunit_manufacturer_id_c1176543;
       public            postgres    false    265                        1259    30980 1   materials_rockwallmaterialunit_mark_d_id_e456d3f5    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_mark_d_id_e456d3f5 ON public.materials_rockwallmaterialunit USING btree (mark_d_id);
 E   DROP INDEX public.materials_rockwallmaterialunit_mark_d_id_e456d3f5;
       public            postgres    false    265            !           1259    30981 1   materials_rockwallmaterialunit_mark_f_id_48ec4578    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_mark_f_id_48ec4578 ON public.materials_rockwallmaterialunit USING btree (mark_f_id);
 E   DROP INDEX public.materials_rockwallmaterialunit_mark_f_id_48ec4578;
       public            postgres    false    265            "           1259    30982 1   materials_rockwallmaterialunit_mark_m_id_e96cf97b    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_mark_m_id_e96cf97b ON public.materials_rockwallmaterialunit USING btree (mark_m_id);
 E   DROP INDEX public.materials_rockwallmaterialunit_mark_m_id_e96cf97b;
       public            postgres    false    265            %           1259    30983 6   materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb ON public.materials_rockwallmaterialunit USING btree (sub_brand_1_id);
 J   DROP INDEX public.materials_rockwallmaterialunit_sub_brand_1_id_6717e0fb;
       public            postgres    false    265            &           1259    30984 6   materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b    INDEX     �   CREATE INDEX materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b ON public.materials_rockwallmaterialunit USING btree (sub_brand_2_id);
 J   DROP INDEX public.materials_rockwallmaterialunit_sub_brand_2_id_15c37d7b;
       public            postgres    false    265                       1259    30894 1   names_decorativebrickface_brand_brand_id_92646ca6    INDEX     �   CREATE INDEX names_decorativebrickface_brand_brand_id_92646ca6 ON public.names_decorativebrickface_brand USING btree (brand_id);
 E   DROP INDEX public.names_decorativebrickface_brand_brand_id_92646ca6;
       public            postgres    false    261                       1259    30893 ?   names_decorativebrickface_brand_decorativebrickface_id_f4bd2916    INDEX     �   CREATE INDEX names_decorativebrickface_brand_decorativebrickface_id_f4bd2916 ON public.names_decorativebrickface_brand USING btree (decorativebrickface_id);
 S   DROP INDEX public.names_decorativebrickface_brand_decorativebrickface_id_f4bd2916;
       public            postgres    false    261            �           1259    30859 )   standards_classb_identifier_9c57cd5d_like    INDEX     �   CREATE INDEX standards_classb_identifier_9c57cd5d_like ON public.standards_classb USING btree (identifier varchar_pattern_ops);
 =   DROP INDEX public.standards_classb_identifier_9c57cd5d_like;
       public            postgres    false    247            �           1259    30860 7   standards_classаveragedensity_identifier_4f590a03_like    INDEX     �   CREATE INDEX "standards_classаveragedensity_identifier_4f590a03_like" ON public."standards_classаveragedensity" USING btree (identifier varchar_pattern_ops);
 M   DROP INDEX public."standards_classаveragedensity_identifier_4f590a03_like";
       public            postgres    false    249            �           1259    30861 (   standards_markd_identifier_a2035296_like    INDEX     ~   CREATE INDEX standards_markd_identifier_a2035296_like ON public.standards_markd USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.standards_markd_identifier_a2035296_like;
       public            postgres    false    251                       1259    30862 (   standards_markf_identifier_79848dc8_like    INDEX     ~   CREATE INDEX standards_markf_identifier_79848dc8_like ON public.standards_markf USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.standards_markf_identifier_79848dc8_like;
       public            postgres    false    253                       1259    30863 (   standards_markm_identifier_2b0b47b2_like    INDEX     ~   CREATE INDEX standards_markm_identifier_2b0b47b2_like ON public.standards_markm USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.standards_markm_identifier_2b0b47b2_like;
       public            postgres    false    255                       1259    30864 )   standards_nfsize_identifier_625c4c07_like    INDEX     �   CREATE INDEX standards_nfsize_identifier_625c4c07_like ON public.standards_nfsize USING btree (identifier varchar_pattern_ops);
 =   DROP INDEX public.standards_nfsize_identifier_625c4c07_like;
       public            postgres    false    257            �           1259    30764 +   suppliers_activity_identifier_d8d3a5df_like    INDEX     �   CREATE INDEX suppliers_activity_identifier_d8d3a5df_like ON public.suppliers_activity USING btree (identifier varchar_pattern_ops);
 ?   DROP INDEX public.suppliers_activity_identifier_d8d3a5df_like;
       public            postgres    false    239            �           1259    30797 (   suppliers_manufacturer_brand_id_18bff0a3    INDEX     o   CREATE INDEX suppliers_manufacturer_brand_id_18bff0a3 ON public.suppliers_manufacturer USING btree (brand_id);
 <   DROP INDEX public.suppliers_manufacturer_brand_id_18bff0a3;
       public            postgres    false    245            �           1259    30798 '   suppliers_manufacturer_city_id_734a9037    INDEX     m   CREATE INDEX suppliers_manufacturer_city_id_734a9037 ON public.suppliers_manufacturer USING btree (city_id);
 ;   DROP INDEX public.suppliers_manufacturer_city_id_734a9037;
       public            postgres    false    245            �           1259    30796 )   suppliers_manufacturer_name_2cb797cf_like    INDEX     �   CREATE INDEX suppliers_manufacturer_name_2cb797cf_like ON public.suppliers_manufacturer USING btree (name varchar_pattern_ops);
 =   DROP INDEX public.suppliers_manufacturer_name_2cb797cf_like;
       public            postgres    false    245            �           1259    30770 %   suppliers_provider_name_99a51456_like    INDEX     x   CREATE INDEX suppliers_provider_name_99a51456_like ON public.suppliers_provider USING btree (name varchar_pattern_ops);
 9   DROP INDEX public.suppliers_provider_name_99a51456_like;
       public            postgres    false    241            �           1259    30771 /   suppliers_provider_primary_activity_id_93261e15    INDEX     }   CREATE INDEX suppliers_provider_primary_activity_id_93261e15 ON public.suppliers_provider USING btree (primary_activity_id);
 C   DROP INDEX public.suppliers_provider_primary_activity_id_93261e15;
       public            postgres    false    241            �           1259    30785 :   suppliers_provider_secondary_activity_activity_id_31284a51    INDEX     �   CREATE INDEX suppliers_provider_secondary_activity_activity_id_31284a51 ON public.suppliers_provider_secondary_activity USING btree (activity_id);
 N   DROP INDEX public.suppliers_provider_secondary_activity_activity_id_31284a51;
       public            postgres    false    243            �           1259    30784 :   suppliers_provider_secondary_activity_provider_id_2fab0709    INDEX     �   CREATE INDEX suppliers_provider_secondary_activity_provider_id_2fab0709 ON public.suppliers_provider_secondary_activity USING btree (provider_id);
 N   DROP INDEX public.suppliers_provider_secondary_activity_provider_id_2fab0709;
       public            postgres    false    243            6           1259    31054 =   workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2    INDEX     �   CREATE INDEX workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2 ON public.workprices_pilegrillagefoundationworkprices USING btree (owner_id);
 Q   DROP INDEX public.workprices_pilegrillagefoundationworkprices_owner_id_d59cdcc2;
       public            postgres    false    274            ;           2606    30517 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    207    2953    211            :           2606    30512 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    2958    211    209            9           2606    30503 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    205    2948    207            =           2606    30532 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    2958    209    215            <           2606    30527 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    213    2966    215            ?           2606    30546 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    217    2953    207            >           2606    30541 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    2966    213    217            B           2606    30617 H   brands_subbrand_1 brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.brands_subbrand_1
    ADD CONSTRAINT brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.brands_subbrand_1 DROP CONSTRAINT brands_subbrand_1_brand_id_7085621b_fk_brands_brand_id;
       public          postgres    false    2990    221    223            C           2606    30624 H   brands_subbrand_2 brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.brands_subbrand_2
    ADD CONSTRAINT brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su FOREIGN KEY (sub_brand_1_id) REFERENCES public.brands_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.brands_subbrand_2 DROP CONSTRAINT brands_subbrand_2_sub_brand_1_id_16ad81ef_fk_brands_su;
       public          postgres    false    225    2996    223            H           2606    30720 <   catalog_plan catalog_plan_author_id_19443bad_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id;
       public          postgres    false    237    213    2966            F           2606    30708 E   catalog_profile catalog_profile_city_id_2b229f7f_fk_geography_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_city_id_2b229f7f_fk_geography_city_id FOREIGN KEY (city_id) REFERENCES public.geography_city(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_city_id_2b229f7f_fk_geography_city_id;
       public          postgres    false    231    235    3017            G           2606    30713 @   catalog_profile catalog_profile_user_id_7c4daf2b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_user_id_7c4daf2b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_user_id_7c4daf2b_fk_auth_user_id;
       public          postgres    false    235    213    2966            @           2606    30565 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    205    219    2948            A           2606    30570 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    219    213    2966            E           2606    30669 G   geography_city geography_city_region_id_ea133d50_fk_geography_region_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.geography_city
    ADD CONSTRAINT geography_city_region_id_ea133d50_fk_geography_region_id FOREIGN KEY (region_id) REFERENCES public.geography_region(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.geography_city DROP CONSTRAINT geography_city_region_id_ea133d50_fk_geography_region_id;
       public          postgres    false    3015    231    229            D           2606    30662 M   geography_region geography_region_country_id_7b89c739_fk_geography_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.geography_region
    ADD CONSTRAINT geography_region_country_id_7b89c739_fk_geography_country_id FOREIGN KEY (country_id) REFERENCES public.geography_country(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.geography_region DROP CONSTRAINT geography_region_country_id_7b89c739_fk_geography_country_id;
       public          postgres    false    227    3007    229            ^           2606    31019 Q   materialprices_insulationprice materialprices_insul_name_id_a70a0ae5_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insul_name_id_a70a0ae5_fk_materials FOREIGN KEY (name_id) REFERENCES public.materials_insulation(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.materialprices_insulationprice DROP CONSTRAINT materialprices_insul_name_id_a70a0ae5_fk_materials;
       public          postgres    false    271    267    3113            _           2606    31024 R   materialprices_insulationprice materialprices_insul_owner_id_ea647b28_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_insulationprice
    ADD CONSTRAINT materialprices_insul_owner_id_ea647b28_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.materialprices_insulationprice DROP CONSTRAINT materialprices_insul_owner_id_ea647b28_fk_auth_user;
       public          postgres    false    213    271    2966            \           2606    31007 W   materialprices_rockwallmaterialprice materialprices_rockw_name_id_5a769348_fk_materials    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockw_name_id_5a769348_fk_materials FOREIGN KEY (name_id) REFERENCES public.materials_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice DROP CONSTRAINT materialprices_rockw_name_id_5a769348_fk_materials;
       public          postgres    false    265    3108    269            ]           2606    31012 X   materialprices_rockwallmaterialprice materialprices_rockw_owner_id_ea24bd0d_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice
    ADD CONSTRAINT materialprices_rockw_owner_id_ea24bd0d_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materialprices_rockwallmaterialprice DROP CONSTRAINT materialprices_rockw_owner_id_ea24bd0d_fk_auth_user;
       public          postgres    false    2966    213    269            [           2606    30985 N   materials_insulation materials_insulation_brand_id_dd7669b2_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_insulation
    ADD CONSTRAINT materials_insulation_brand_id_dd7669b2_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.materials_insulation DROP CONSTRAINT materials_insulation_brand_id_dd7669b2_fk_brands_brand_id;
       public          postgres    false    267    221    2990            P           2606    30919 V   materials_rockwallmaterialunit materials_rockwallma_algorithm_id_4183f114_fk_catalog_a    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_algorithm_id_4183f114_fk_catalog_a FOREIGN KEY (algorithm_id) REFERENCES public.catalog_algorithm(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_algorithm_id_4183f114_fk_catalog_a;
       public          postgres    false    3026    233    265            Q           2606    30924 R   materials_rockwallmaterialunit materials_rockwallma_brand_id_4deb8894_fk_brands_br    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_brand_id_4deb8894_fk_brands_br FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_brand_id_4deb8894_fk_brands_br;
       public          postgres    false    265    2990    221            R           2606    30929 ^   materials_rockwallmaterialunit materials_rockwallma_class_average_densit_beb6fff9_fk_standards    FK CONSTRAINT       ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_class_average_densit_beb6fff9_fk_standards FOREIGN KEY (class_average_density_id) REFERENCES public."standards_classаveragedensity"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_class_average_densit_beb6fff9_fk_standards;
       public          postgres    false    265    3067    249            S           2606    30934 T   materials_rockwallmaterialunit materials_rockwallma_class_b_id_1de59e0b_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_class_b_id_1de59e0b_fk_standards FOREIGN KEY (class_b_id) REFERENCES public.standards_classb(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_class_b_id_1de59e0b_fk_standards;
       public          postgres    false    3062    247    265            T           2606    30939 Q   materials_rockwallmaterialunit materials_rockwallma_face_id_712ecb1a_fk_names_dec    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_face_id_712ecb1a_fk_names_dec FOREIGN KEY (face_id) REFERENCES public.names_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_face_id_712ecb1a_fk_names_dec;
       public          postgres    false    265    3089    259            U           2606    30944 Y   materials_rockwallmaterialunit materials_rockwallma_manufacturer_id_c1176543_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_manufacturer_id_c1176543_fk_suppliers FOREIGN KEY (manufacturer_id) REFERENCES public.suppliers_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_manufacturer_id_c1176543_fk_suppliers;
       public          postgres    false    265    3057    245            V           2606    30949 S   materials_rockwallmaterialunit materials_rockwallma_mark_d_id_e456d3f5_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_d_id_e456d3f5_fk_standards FOREIGN KEY (mark_d_id) REFERENCES public.standards_markd(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_mark_d_id_e456d3f5_fk_standards;
       public          postgres    false    3072    265    251            W           2606    30954 S   materials_rockwallmaterialunit materials_rockwallma_mark_f_id_48ec4578_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_f_id_48ec4578_fk_standards FOREIGN KEY (mark_f_id) REFERENCES public.standards_markf(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_mark_f_id_48ec4578_fk_standards;
       public          postgres    false    253    3077    265            X           2606    30959 S   materials_rockwallmaterialunit materials_rockwallma_mark_m_id_e96cf97b_fk_standards    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_mark_m_id_e96cf97b_fk_standards FOREIGN KEY (mark_m_id) REFERENCES public.standards_markm(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_mark_m_id_e96cf97b_fk_standards;
       public          postgres    false    265    255    3082            Y           2606    30964 X   materials_rockwallmaterialunit materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su FOREIGN KEY (sub_brand_1_id) REFERENCES public.brands_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_sub_brand_1_id_6717e0fb_fk_brands_su;
       public          postgres    false    223    265    2996            Z           2606    30969 X   materials_rockwallmaterialunit materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_rockwallmaterialunit
    ADD CONSTRAINT materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su FOREIGN KEY (sub_brand_2_id) REFERENCES public.brands_subbrand_2(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.materials_rockwallmaterialunit DROP CONSTRAINT materials_rockwallma_sub_brand_2_id_15c37d7b_fk_brands_su;
       public          postgres    false    265    3001    225            O           2606    30888 S   names_decorativebrickface_brand names_decorativebric_brand_id_92646ca6_fk_brands_br    FK CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebric_brand_id_92646ca6_fk_brands_br FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebric_brand_id_92646ca6_fk_brands_br;
       public          postgres    false    2990    261    221            N           2606    30883 _   names_decorativebrickface_brand names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec    FK CONSTRAINT     �   ALTER TABLE ONLY public.names_decorativebrickface_brand
    ADD CONSTRAINT names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec FOREIGN KEY (decorativebrickface_id) REFERENCES public.names_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.names_decorativebrickface_brand DROP CONSTRAINT names_decorativebric_decorativebrickface__f4bd2916_fk_names_dec;
       public          postgres    false    259    261    3089            L           2606    30786 R   suppliers_manufacturer suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id FOREIGN KEY (brand_id) REFERENCES public.brands_brand(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_brand_id_18bff0a3_fk_brands_brand_id;
       public          postgres    false    2990    221    245            M           2606    30791 S   suppliers_manufacturer suppliers_manufacturer_city_id_734a9037_fk_geography_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_manufacturer
    ADD CONSTRAINT suppliers_manufacturer_city_id_734a9037_fk_geography_city_id FOREIGN KEY (city_id) REFERENCES public.geography_city(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.suppliers_manufacturer DROP CONSTRAINT suppliers_manufacturer_city_id_734a9037_fk_geography_city_id;
       public          postgres    false    3017    245    231            I           2606    30765 O   suppliers_provider suppliers_provider_primary_activity_id_93261e15_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider
    ADD CONSTRAINT suppliers_provider_primary_activity_id_93261e15_fk_suppliers FOREIGN KEY (primary_activity_id) REFERENCES public.suppliers_activity(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.suppliers_provider DROP CONSTRAINT suppliers_provider_primary_activity_id_93261e15_fk_suppliers;
       public          postgres    false    3038    239    241            K           2606    30779 \   suppliers_provider_secondary_activity suppliers_provider_s_activity_id_31284a51_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_s_activity_id_31284a51_fk_suppliers FOREIGN KEY (activity_id) REFERENCES public.suppliers_activity(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_s_activity_id_31284a51_fk_suppliers;
       public          postgres    false    239    3038    243            J           2606    30774 \   suppliers_provider_secondary_activity suppliers_provider_s_provider_id_2fab0709_fk_suppliers    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity
    ADD CONSTRAINT suppliers_provider_s_provider_id_2fab0709_fk_suppliers FOREIGN KEY (provider_id) REFERENCES public.suppliers_provider(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.suppliers_provider_secondary_activity DROP CONSTRAINT suppliers_provider_s_provider_id_2fab0709_fk_suppliers;
       public          postgres    false    3043    243    241            `           2606    31049 _   workprices_pilegrillagefoundationworkprices workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices
    ADD CONSTRAINT workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.workprices_pilegrillagefoundationworkprices DROP CONSTRAINT workprices_pilegrill_owner_id_d59cdcc2_fk_auth_user;
       public          postgres    false    2966    213    274            �      x������ � �      �      x������ � �      �   �  x��YMo�F=����ښ���s���-�
aZ2(�AzJ��E��)Z�R�m�=��@�v���uvvv9�ZJ�� �cQo޾]���8J�è���l<+q ���g�&�Oǣ�B�G5���aVd3���6O���jоQv����t�O�A���a������a�\��%�۫%ZH��p}�rTN�'A��a�����IAb�ICHA�Z��
��e̧Y�Q��5��||���W�}>:hp��c��8���kFL�3xk���I�z$��q�q�$����.O�8>٫e:h�kac�z����A��)L��^cH��Y����<cs��*�g��I��z$�ՙ�	�(--F�2��?k�{ऒEX��A�Y��<jg�z�?vW=K�z�w�N�"^���b�W��E�S����E��U�=�^ߚ�ZI��襯i�j۞D���h9�uu�U�E:[�՜J'���լPKG`��m`J��L����:�$ÿg�]���1�|�7������6 ?�̋�i:�����N��mMڷ3މ�*cH�{�:;Qbk��Eį�f�-,����q^����k':�,r)� V{l9=H��8�ee��q>ۖ�JOu��`y׮#P��#0�ە+�gg��7����%-��A�ڄ|<��Lzl��͆ ���ݳ!�*�㸇6Da~<�9��P���vU��1�dX�e�6#���|�������6al��L�wC�}ss��DL0wL�-�y���*}k�m�D\|�2Q`q[�'����}�\w!�7�t|x�z�!N˲wa���u�}g	[�\c����5ձ���!��y)�z�j{>��M���e�SR�,���ʮ�=!VϦc��Wu�L[ w����ɤc��4�,�m�u���%0�MJ�,���,/ �;qĪa,��l�s�z� ��tV{=a��9H�ڄc��6��^�X���qY ]H���d�t�m�B��!������N$���!7'�Q��A)����)��tK�"m�X����a}�jNT����u`�Q�I��n:?@��8�]�/F~X�ۧ���a��ٝ�/H�XHܜQ��Q����7#k��H��AX{MF*��B���V�kl5o�v����ƙ+=kY��r�%�����������{p�D�?�l0)��8��|p6��=�>��T\� �g>� zM^ܼ>���½�3G�p���	�3�&MT2��nP���Aط=rm��L��]sm�vQ��>�6N�*E�|���.e�e%e#|uC���|��4+�Q6��S���vC�[��z�0�7Tg+f^�掷z[���\ae��(��[D_�n�ʣaط��������;P�nIh��m�AR�p�O#���N��2������
��I�H����a)J�VC��P�H�����
I�}o�^I���`�� �e)�ݦ,����?��ȼ���l��i�$��N�o�0����p�l"lo�E�n�=ɇG�ͼ�_�WϤQ˻�5�Gqe�E���P=�����<]c�����pk���}k��уq{ߡ�w9z��ꛂïsg���s�u4A���8Vny4M�[�&��K����H��i
����e)p����7����<�\�%���lB���AKu�'y��ʼ(`9�3��0)�P�4�r?�}ŲY��	�+�3��8���C]�lR��ga���.      �   �   x�e��
�@@���W�p�{3��A`A���� %-S�>?���� �{Y��X�LHm��^u2l����:i����n�	���n~rd�m�ʽ5�� Lcg�/1z�:p�
L�)C���|	�L$/��AaB�p��Mk��L��!�P��-����D,      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �            x�3��K-W(�I����L\1z\\\ Q6�             x������ � �      �      x������ � �      �   Z  x�e�o�� �?�ì
���VN�(�uN�G�#��N���)�ǳ���58,>��&��o��r1�x�">E�>�ĩf�=�*İ7}�E��-�����-�M�u��0%����eN��	�n̂��c��0��m(�~����F_��F�Ԁ�n�n�Ԝ�'�}�W_n`wU'W?h<�o肱��P�~s0��1_n�����2M�S+\G�MǚAp�g-�[O,8�:p�D\t���5Ε:������*�C֦>�Hn������DE��q�F� �����Fp�7��;5(��?���{�Y}�ϗY1l7���|)��H<�f�-&�!��Qw=�ʗ ~���cR��      �     x���ݎ� ���S���f��>K%D�E�������q�ZG�d���̙F.�����6ؑPJ�v��δ(��/L|c����+ɐ��)���)��+8�Y��\;��+�FYR=$�[ߤ8�M��w���^��u��(���`���t�\���ݚF_^��$�X�2�Y����r���Mg�QP!f�X�m�h�l��8戲\w�C��oҭM��$W.�iL?���B*@d��VJ���%?�'�p�s}]�3�5c�ƻ���n�\��/�R������jnq]gϞ@��hN���nZw5ч��ކ����8��Y�%��b�+Nn��c��D�T�$�ţC(LT��;���?�0�D,#����4$�����}j�m$Ov�c��
����<�s���%i�o�^otB.*r1Ѥ~��,��%�4���@� j��X #cL��p$9
���\�#%gI����Y��_�^��̋1�(2��l!h�r����!�5���L�W���&�]�dW�P�*���ß��))*Z��y>�N� ���      %     x�=�Ko�0  ����Mi���<RbK$�م��*n���[v��K��kǩ����٠~<�x?ώ>N�g����y�xL�1��w�<4(�*�T���Ó�NS�(^�S�����X62TΒS]�e*��S2�],N�C;��*�7/��Q��*�=v�>�K6�%�W� ���w���fC&�����{��&�?�v��A!Zx�=]���DG����j�в24j>��U'yp���0���@�h���� g��缭z��\Y���!h�      �      x������ � �      �      x������ � �      �      x������ � �      $      x������ � �      "      x������ � �            x������ � �             x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      
      x������ � �            x������ � �            x������ � �      '      x������ � �     