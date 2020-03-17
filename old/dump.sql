PGDMP     3                    x         	   postgres2    12.1    12.1 �   A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            D           1262    57380 	   postgres2    DATABASE     �   CREATE DATABASE postgres2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE postgres2;
                postgres    false            �            1259    57381 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    57384    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    202            E           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    203            �            1259    57386    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    57389    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    204            F           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    205            �            1259    57391    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    57394    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    206            G           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    207            �            1259    57396 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    postgres    false            �            1259    57402    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    57405    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    209            H           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    210            �            1259    57407    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    208            I           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    211            �            1259    57409    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    57412 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    212            J           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    213            �            1259    57414    catalog_activity    TABLE     �   CREATE TABLE public.catalog_activity (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 $   DROP TABLE public.catalog_activity;
       public         heap    postgres    false            �            1259    57417    catalog_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.catalog_activity_id_seq;
       public          postgres    false    214            K           0    0    catalog_activity_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.catalog_activity_id_seq OWNED BY public.catalog_activity.id;
          public          postgres    false    215            �            1259    57419    catalog_algorithm    TABLE     �   CREATE TABLE public.catalog_algorithm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 %   DROP TABLE public.catalog_algorithm;
       public         heap    postgres    false            �            1259    57422    catalog_algorithm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_algorithm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.catalog_algorithm_id_seq;
       public          postgres    false    216            L           0    0    catalog_algorithm_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.catalog_algorithm_id_seq OWNED BY public.catalog_algorithm.id;
          public          postgres    false    217            �            1259    57424    catalog_brand    TABLE     i   CREATE TABLE public.catalog_brand (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
 !   DROP TABLE public.catalog_brand;
       public         heap    postgres    false            �            1259    57427    catalog_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_brand_id_seq;
       public          postgres    false    218            M           0    0    catalog_brand_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_brand_id_seq OWNED BY public.catalog_brand.id;
          public          postgres    false    219            �            1259    57429    catalog_city    TABLE     �   CREATE TABLE public.catalog_city (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    region_id integer,
    heating_period_duration integer,
    heating_period_temperature double precision
);
     DROP TABLE public.catalog_city;
       public         heap    postgres    false            �            1259    57432    catalog_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.catalog_city_id_seq;
       public          postgres    false    220            N           0    0    catalog_city_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_city_id_seq OWNED BY public.catalog_city.id;
          public          postgres    false    221            �            1259    57434    catalog_classb    TABLE     �   CREATE TABLE public.catalog_classb (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 "   DROP TABLE public.catalog_classb;
       public         heap    postgres    false            �            1259    57437    catalog_classb_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_classb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.catalog_classb_id_seq;
       public          postgres    false    222            O           0    0    catalog_classb_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.catalog_classb_id_seq OWNED BY public.catalog_classb.id;
          public          postgres    false    223            �            1259    57439    catalog_classаveragedensity    TABLE     �   CREATE TABLE public."catalog_classаveragedensity" (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 2   DROP TABLE public."catalog_classаveragedensity";
       public         heap    postgres    false            �            1259    57442 #   catalog_classаveragedensity_id_seq    SEQUENCE     �   CREATE SEQUENCE public."catalog_classаveragedensity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."catalog_classаveragedensity_id_seq";
       public          postgres    false    224            P           0    0 #   catalog_classаveragedensity_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."catalog_classаveragedensity_id_seq" OWNED BY public."catalog_classаveragedensity".id;
          public          postgres    false    225            �            1259    57444    catalog_country    TABLE     b   CREATE TABLE public.catalog_country (
    id integer NOT NULL,
    name character varying(200)
);
 #   DROP TABLE public.catalog_country;
       public         heap    postgres    false            �            1259    57447    catalog_country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.catalog_country_id_seq;
       public          postgres    false    226            Q           0    0    catalog_country_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.catalog_country_id_seq OWNED BY public.catalog_country.id;
          public          postgres    false    227            �            1259    57449    catalog_decorativebrickface    TABLE     w   CREATE TABLE public.catalog_decorativebrickface (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
 /   DROP TABLE public.catalog_decorativebrickface;
       public         heap    postgres    false            �            1259    57452 !   catalog_decorativebrickface_brand    TABLE     �   CREATE TABLE public.catalog_decorativebrickface_brand (
    id integer NOT NULL,
    decorativebrickface_id integer NOT NULL,
    brand_id integer NOT NULL
);
 5   DROP TABLE public.catalog_decorativebrickface_brand;
       public         heap    postgres    false            �            1259    57455 (   catalog_decorativebrickface_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_decorativebrickface_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.catalog_decorativebrickface_brand_id_seq;
       public          postgres    false    229            R           0    0 (   catalog_decorativebrickface_brand_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.catalog_decorativebrickface_brand_id_seq OWNED BY public.catalog_decorativebrickface_brand.id;
          public          postgres    false    230            �            1259    57457 "   catalog_decorativebrickface_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_decorativebrickface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.catalog_decorativebrickface_id_seq;
       public          postgres    false    228            S           0    0 "   catalog_decorativebrickface_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.catalog_decorativebrickface_id_seq OWNED BY public.catalog_decorativebrickface.id;
          public          postgres    false    231            �            1259    57459    catalog_factory    TABLE     �   CREATE TABLE public.catalog_factory (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    city_id integer,
    brand_id integer
);
 #   DROP TABLE public.catalog_factory;
       public         heap    postgres    false            �            1259    57462    catalog_factory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_factory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.catalog_factory_id_seq;
       public          postgres    false    232            T           0    0    catalog_factory_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.catalog_factory_id_seq OWNED BY public.catalog_factory.id;
          public          postgres    false    233            �            1259    57464    catalog_insulation    TABLE     �   CREATE TABLE public.catalog_insulation (
    id integer NOT NULL,
    thermal_conductivity double precision,
    mat_type character varying(9) NOT NULL,
    thick character varying(3) NOT NULL,
    brand_id integer
);
 &   DROP TABLE public.catalog_insulation;
       public         heap    postgres    false            �            1259    57467    catalog_insulation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_insulation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.catalog_insulation_id_seq;
       public          postgres    false    234            U           0    0    catalog_insulation_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.catalog_insulation_id_seq OWNED BY public.catalog_insulation.id;
          public          postgres    false    235            �            1259    57469    catalog_insulationprice    TABLE     �   CREATE TABLE public.catalog_insulationprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 +   DROP TABLE public.catalog_insulationprice;
       public         heap    postgres    false            �            1259    57472    catalog_insulationprice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_insulationprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.catalog_insulationprice_id_seq;
       public          postgres    false    236            V           0    0    catalog_insulationprice_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.catalog_insulationprice_id_seq OWNED BY public.catalog_insulationprice.id;
          public          postgres    false    237            �            1259    57474    catalog_markd    TABLE     �   CREATE TABLE public.catalog_markd (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 !   DROP TABLE public.catalog_markd;
       public         heap    postgres    false            �            1259    57477    catalog_markd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_markd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_markd_id_seq;
       public          postgres    false    238            W           0    0    catalog_markd_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markd_id_seq OWNED BY public.catalog_markd.id;
          public          postgres    false    239            �            1259    57479    catalog_markf    TABLE     �   CREATE TABLE public.catalog_markf (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 !   DROP TABLE public.catalog_markf;
       public         heap    postgres    false            �            1259    57482    catalog_markf_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_markf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_markf_id_seq;
       public          postgres    false    240            X           0    0    catalog_markf_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markf_id_seq OWNED BY public.catalog_markf.id;
          public          postgres    false    241            �            1259    57484    catalog_markm    TABLE     �   CREATE TABLE public.catalog_markm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 !   DROP TABLE public.catalog_markm;
       public         heap    postgres    false            �            1259    57487    catalog_markm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_markm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_markm_id_seq;
       public          postgres    false    242            Y           0    0    catalog_markm_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markm_id_seq OWNED BY public.catalog_markm.id;
          public          postgres    false    243            �            1259    57489    catalog_nfsize    TABLE     �   CREATE TABLE public.catalog_nfsize (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    greater_bed_size integer,
    minor_bed_size integer,
    height integer
);
 "   DROP TABLE public.catalog_nfsize;
       public         heap    postgres    false            �            1259    57492    catalog_nfsize_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_nfsize_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.catalog_nfsize_id_seq;
       public          postgres    false    244            Z           0    0    catalog_nfsize_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.catalog_nfsize_id_seq OWNED BY public.catalog_nfsize.id;
          public          postgres    false    245            �            1259    57494 (   catalog_pilegrillagefoundationworkprices    TABLE     �  CREATE TABLE public.catalog_pilegrillagefoundationworkprices (
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
 <   DROP TABLE public.catalog_pilegrillagefoundationworkprices;
       public         heap    postgres    false            �            1259    57497 /   catalog_pilegrillagefoundationworkprices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_pilegrillagefoundationworkprices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.catalog_pilegrillagefoundationworkprices_id_seq;
       public          postgres    false    246            [           0    0 /   catalog_pilegrillagefoundationworkprices_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.catalog_pilegrillagefoundationworkprices_id_seq OWNED BY public.catalog_pilegrillagefoundationworkprices.id;
          public          postgres    false    247            �            1259    57499    catalog_plan    TABLE     �   CREATE TABLE public.catalog_plan (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    author_id integer,
    scheme json,
    checked boolean NOT NULL
);
     DROP TABLE public.catalog_plan;
       public         heap    postgres    false            �            1259    57505    catalog_plan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.catalog_plan_id_seq;
       public          postgres    false    248            \           0    0    catalog_plan_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_plan_id_seq OWNED BY public.catalog_plan.id;
          public          postgres    false    249                       1259    58019    catalog_plancitycost    TABLE     �   CREATE TABLE public.catalog_plancitycost (
    id integer NOT NULL,
    cost integer,
    city_id integer,
    material_id integer,
    plan_id integer
);
 (   DROP TABLE public.catalog_plancitycost;
       public         heap    postgres    false                       1259    58017    catalog_plancitycost_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_plancitycost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.catalog_plancitycost_id_seq;
       public          postgres    false    276            ]           0    0    catalog_plancitycost_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.catalog_plancitycost_id_seq OWNED BY public.catalog_plancitycost.id;
          public          postgres    false    275            �            1259    57507    catalog_profile    TABLE     t   CREATE TABLE public.catalog_profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    city_id integer
);
 #   DROP TABLE public.catalog_profile;
       public         heap    postgres    false            �            1259    57510    catalog_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.catalog_profile_id_seq;
       public          postgres    false    250            ^           0    0    catalog_profile_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.catalog_profile_id_seq OWNED BY public.catalog_profile.id;
          public          postgres    false    251            �            1259    57512    catalog_profile_provider    TABLE     �   CREATE TABLE public.catalog_profile_provider (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    provider_id integer NOT NULL
);
 ,   DROP TABLE public.catalog_profile_provider;
       public         heap    postgres    false            �            1259    57515    catalog_profile_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_profile_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.catalog_profile_provider_id_seq;
       public          postgres    false    252            _           0    0    catalog_profile_provider_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.catalog_profile_provider_id_seq OWNED BY public.catalog_profile_provider.id;
          public          postgres    false    253            �            1259    57517    catalog_provider    TABLE     �   CREATE TABLE public.catalog_provider (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    primary_activity_id integer
);
 $   DROP TABLE public.catalog_provider;
       public         heap    postgres    false            �            1259    57520    catalog_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.catalog_provider_id_seq;
       public          postgres    false    254            `           0    0    catalog_provider_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.catalog_provider_id_seq OWNED BY public.catalog_provider.id;
          public          postgres    false    255                        1259    57522 #   catalog_provider_secondary_activity    TABLE     �   CREATE TABLE public.catalog_provider_secondary_activity (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    activity_id integer NOT NULL
);
 7   DROP TABLE public.catalog_provider_secondary_activity;
       public         heap    postgres    false                       1259    57525 *   catalog_provider_secondary_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_provider_secondary_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.catalog_provider_secondary_activity_id_seq;
       public          postgres    false    256            a           0    0 *   catalog_provider_secondary_activity_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.catalog_provider_secondary_activity_id_seq OWNED BY public.catalog_provider_secondary_activity.id;
          public          postgres    false    257                       1259    57527    catalog_region    TABLE     �   CREATE TABLE public.catalog_region (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    code integer,
    country_id integer
);
 "   DROP TABLE public.catalog_region;
       public         heap    postgres    false                       1259    57530    catalog_region_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.catalog_region_id_seq;
       public          postgres    false    258            b           0    0    catalog_region_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.catalog_region_id_seq OWNED BY public.catalog_region.id;
          public          postgres    false    259                       1259    57532    catalog_rockwallmaterialprice    TABLE     �   CREATE TABLE public.catalog_rockwallmaterialprice (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 1   DROP TABLE public.catalog_rockwallmaterialprice;
       public         heap    postgres    false                       1259    57535 $   catalog_rockwallmaterialprice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialprice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.catalog_rockwallmaterialprice_id_seq;
       public          postgres    false    260            c           0    0 $   catalog_rockwallmaterialprice_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.catalog_rockwallmaterialprice_id_seq OWNED BY public.catalog_rockwallmaterialprice.id;
          public          postgres    false    261                       1259    57537    catalog_rockwallmaterialunit    TABLE     k  CREATE TABLE public.catalog_rockwallmaterialunit (
    id integer NOT NULL,
    name character varying(5) NOT NULL,
    material character varying(18) NOT NULL,
    greater_bed_size integer,
    minor_bed_size integer,
    height integer,
    min_pix_1_floor character varying(3) NOT NULL,
    min_pix_2_floor character varying(3) NOT NULL,
    min_pix_3_floor character varying(3) NOT NULL,
    work_size_1 character varying(2) NOT NULL,
    num_floors_on_work_size_1 character varying(1) NOT NULL,
    work_size_2 character varying(2) NOT NULL,
    num_floors_on_work_size_2 character varying(1) NOT NULL,
    work_size_3 character varying(2) NOT NULL,
    num_floors_on_work_size_3 character varying(1) NOT NULL,
    thermal_conductivity double precision,
    tongue_and_groove character varying(3) NOT NULL,
    polish character varying(3) NOT NULL,
    purpose character varying(10) NOT NULL,
    partition_or_bearing character varying(9) NOT NULL,
    body_type character varying(6) NOT NULL,
    blind_hollow character varying(3) NOT NULL,
    primary_or_additional character varying(10) NOT NULL,
    algorithm_id integer,
    class_average_density_id integer,
    class_b_id integer,
    factory_id integer,
    mark_d_id integer,
    mark_f_id integer,
    mark_m_id integer,
    brand_id integer,
    sub_brand_1_id integer,
    sub_brand_2_id integer,
    face_id integer
);
 0   DROP TABLE public.catalog_rockwallmaterialunit;
       public         heap    postgres    false                       1259    57540 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.catalog_rockwallmaterialunit_id_seq;
       public          postgres    false    262            d           0    0 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.catalog_rockwallmaterialunit_id_seq OWNED BY public.catalog_rockwallmaterialunit.id;
          public          postgres    false    263                       1259    57542    catalog_subbrand_1    TABLE     �   CREATE TABLE public.catalog_subbrand_1 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    brand_id integer
);
 &   DROP TABLE public.catalog_subbrand_1;
       public         heap    postgres    false            	           1259    57545    catalog_subbrand_1_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_subbrand_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.catalog_subbrand_1_id_seq;
       public          postgres    false    264            e           0    0    catalog_subbrand_1_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.catalog_subbrand_1_id_seq OWNED BY public.catalog_subbrand_1.id;
          public          postgres    false    265            
           1259    57547    catalog_subbrand_2    TABLE     �   CREATE TABLE public.catalog_subbrand_2 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    sub_brand_1_id integer NOT NULL
);
 &   DROP TABLE public.catalog_subbrand_2;
       public         heap    postgres    false                       1259    57550    catalog_subbrand_2_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_subbrand_2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.catalog_subbrand_2_id_seq;
       public          postgres    false    266            f           0    0    catalog_subbrand_2_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.catalog_subbrand_2_id_seq OWNED BY public.catalog_subbrand_2.id;
          public          postgres    false    267                       1259    57552    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false                       1259    57559    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    268            g           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    269                       1259    57561    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false                       1259    57564    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    270            h           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    271                       1259    57566    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false                       1259    57572    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    272            i           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    273                       1259    57574    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            `           2604    57580    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            a           2604    57581    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            b           2604    57582    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            c           2604    57583    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    208            d           2604    57584    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            e           2604    57585    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            f           2604    57586    catalog_activity id    DEFAULT     z   ALTER TABLE ONLY public.catalog_activity ALTER COLUMN id SET DEFAULT nextval('public.catalog_activity_id_seq'::regclass);
 B   ALTER TABLE public.catalog_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            g           2604    57587    catalog_algorithm id    DEFAULT     |   ALTER TABLE ONLY public.catalog_algorithm ALTER COLUMN id SET DEFAULT nextval('public.catalog_algorithm_id_seq'::regclass);
 C   ALTER TABLE public.catalog_algorithm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            h           2604    57588    catalog_brand id    DEFAULT     t   ALTER TABLE ONLY public.catalog_brand ALTER COLUMN id SET DEFAULT nextval('public.catalog_brand_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            i           2604    57589    catalog_city id    DEFAULT     r   ALTER TABLE ONLY public.catalog_city ALTER COLUMN id SET DEFAULT nextval('public.catalog_city_id_seq'::regclass);
 >   ALTER TABLE public.catalog_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            j           2604    57590    catalog_classb id    DEFAULT     v   ALTER TABLE ONLY public.catalog_classb ALTER COLUMN id SET DEFAULT nextval('public.catalog_classb_id_seq'::regclass);
 @   ALTER TABLE public.catalog_classb ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            k           2604    57591    catalog_classаveragedensity id    DEFAULT     �   ALTER TABLE ONLY public."catalog_classаveragedensity" ALTER COLUMN id SET DEFAULT nextval('public."catalog_classаveragedensity_id_seq"'::regclass);
 P   ALTER TABLE public."catalog_classаveragedensity" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            l           2604    57592    catalog_country id    DEFAULT     x   ALTER TABLE ONLY public.catalog_country ALTER COLUMN id SET DEFAULT nextval('public.catalog_country_id_seq'::regclass);
 A   ALTER TABLE public.catalog_country ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            m           2604    57593    catalog_decorativebrickface id    DEFAULT     �   ALTER TABLE ONLY public.catalog_decorativebrickface ALTER COLUMN id SET DEFAULT nextval('public.catalog_decorativebrickface_id_seq'::regclass);
 M   ALTER TABLE public.catalog_decorativebrickface ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    228            n           2604    57594 $   catalog_decorativebrickface_brand id    DEFAULT     �   ALTER TABLE ONLY public.catalog_decorativebrickface_brand ALTER COLUMN id SET DEFAULT nextval('public.catalog_decorativebrickface_brand_id_seq'::regclass);
 S   ALTER TABLE public.catalog_decorativebrickface_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            o           2604    57595    catalog_factory id    DEFAULT     x   ALTER TABLE ONLY public.catalog_factory ALTER COLUMN id SET DEFAULT nextval('public.catalog_factory_id_seq'::regclass);
 A   ALTER TABLE public.catalog_factory ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232            p           2604    57596    catalog_insulation id    DEFAULT     ~   ALTER TABLE ONLY public.catalog_insulation ALTER COLUMN id SET DEFAULT nextval('public.catalog_insulation_id_seq'::regclass);
 D   ALTER TABLE public.catalog_insulation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234            q           2604    57597    catalog_insulationprice id    DEFAULT     �   ALTER TABLE ONLY public.catalog_insulationprice ALTER COLUMN id SET DEFAULT nextval('public.catalog_insulationprice_id_seq'::regclass);
 I   ALTER TABLE public.catalog_insulationprice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236            r           2604    57598    catalog_markd id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markd ALTER COLUMN id SET DEFAULT nextval('public.catalog_markd_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markd ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238            s           2604    57599    catalog_markf id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markf ALTER COLUMN id SET DEFAULT nextval('public.catalog_markf_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markf ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240            t           2604    57600    catalog_markm id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markm ALTER COLUMN id SET DEFAULT nextval('public.catalog_markm_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242            u           2604    57601    catalog_nfsize id    DEFAULT     v   ALTER TABLE ONLY public.catalog_nfsize ALTER COLUMN id SET DEFAULT nextval('public.catalog_nfsize_id_seq'::regclass);
 @   ALTER TABLE public.catalog_nfsize ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244            v           2604    57602 +   catalog_pilegrillagefoundationworkprices id    DEFAULT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices ALTER COLUMN id SET DEFAULT nextval('public.catalog_pilegrillagefoundationworkprices_id_seq'::regclass);
 Z   ALTER TABLE public.catalog_pilegrillagefoundationworkprices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246            w           2604    57603    catalog_plan id    DEFAULT     r   ALTER TABLE ONLY public.catalog_plan ALTER COLUMN id SET DEFAULT nextval('public.catalog_plan_id_seq'::regclass);
 >   ALTER TABLE public.catalog_plan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248            �           2604    58022    catalog_plancitycost id    DEFAULT     �   ALTER TABLE ONLY public.catalog_plancitycost ALTER COLUMN id SET DEFAULT nextval('public.catalog_plancitycost_id_seq'::regclass);
 F   ALTER TABLE public.catalog_plancitycost ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    276    275    276            x           2604    57604    catalog_profile id    DEFAULT     x   ALTER TABLE ONLY public.catalog_profile ALTER COLUMN id SET DEFAULT nextval('public.catalog_profile_id_seq'::regclass);
 A   ALTER TABLE public.catalog_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250            y           2604    57605    catalog_profile_provider id    DEFAULT     �   ALTER TABLE ONLY public.catalog_profile_provider ALTER COLUMN id SET DEFAULT nextval('public.catalog_profile_provider_id_seq'::regclass);
 J   ALTER TABLE public.catalog_profile_provider ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252            z           2604    57606    catalog_provider id    DEFAULT     z   ALTER TABLE ONLY public.catalog_provider ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_id_seq'::regclass);
 B   ALTER TABLE public.catalog_provider ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254            {           2604    57607 &   catalog_provider_secondary_activity id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_secondary_activity_id_seq'::regclass);
 U   ALTER TABLE public.catalog_provider_secondary_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256            |           2604    57608    catalog_region id    DEFAULT     v   ALTER TABLE ONLY public.catalog_region ALTER COLUMN id SET DEFAULT nextval('public.catalog_region_id_seq'::regclass);
 @   ALTER TABLE public.catalog_region ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258            }           2604    57609     catalog_rockwallmaterialprice id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialprice ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialprice_id_seq'::regclass);
 O   ALTER TABLE public.catalog_rockwallmaterialprice ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260            ~           2604    57610    catalog_rockwallmaterialunit id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_id_seq'::regclass);
 N   ALTER TABLE public.catalog_rockwallmaterialunit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    262                       2604    57611    catalog_subbrand_1 id    DEFAULT     ~   ALTER TABLE ONLY public.catalog_subbrand_1 ALTER COLUMN id SET DEFAULT nextval('public.catalog_subbrand_1_id_seq'::regclass);
 D   ALTER TABLE public.catalog_subbrand_1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264            �           2604    57612    catalog_subbrand_2 id    DEFAULT     ~   ALTER TABLE ONLY public.catalog_subbrand_2 ALTER COLUMN id SET DEFAULT nextval('public.catalog_subbrand_2_id_seq'::regclass);
 D   ALTER TABLE public.catalog_subbrand_2 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    267    266            �           2604    57613    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    268            �           2604    57614    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    270            �           2604    57615    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    273    272            �          0    57381 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    202   �.      �          0    57386    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    204   �.      �          0    57391    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    206   /      �          0    57396 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    208   �6      �          0    57402    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    209   o8      �          0    57409    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    212   �8                 0    57414    catalog_activity 
   TABLE DATA           @   COPY public.catalog_activity (id, identifier, name) FROM stdin;
    public          postgres    false    214   �8                0    57419    catalog_algorithm 
   TABLE DATA           A   COPY public.catalog_algorithm (id, identifier, name) FROM stdin;
    public          postgres    false    216   9                0    57424    catalog_brand 
   TABLE DATA           1   COPY public.catalog_brand (id, name) FROM stdin;
    public          postgres    false    218   �9                0    57429    catalog_city 
   TABLE DATA           p   COPY public.catalog_city (id, name, region_id, heating_period_duration, heating_period_temperature) FROM stdin;
    public          postgres    false    220   4:                0    57434    catalog_classb 
   TABLE DATA           >   COPY public.catalog_classb (id, identifier, name) FROM stdin;
    public          postgres    false    222   �:      
          0    57439    catalog_classаveragedensity 
   TABLE DATA           N   COPY public."catalog_classаveragedensity" (id, identifier, name) FROM stdin;
    public          postgres    false    224   �:                0    57444    catalog_country 
   TABLE DATA           3   COPY public.catalog_country (id, name) FROM stdin;
    public          postgres    false    226   ;                0    57449    catalog_decorativebrickface 
   TABLE DATA           ?   COPY public.catalog_decorativebrickface (id, name) FROM stdin;
    public          postgres    false    228   8;                0    57452 !   catalog_decorativebrickface_brand 
   TABLE DATA           a   COPY public.catalog_decorativebrickface_brand (id, decorativebrickface_id, brand_id) FROM stdin;
    public          postgres    false    229   U;                0    57459    catalog_factory 
   TABLE DATA           F   COPY public.catalog_factory (id, name, city_id, brand_id) FROM stdin;
    public          postgres    false    232   r;                0    57464    catalog_insulation 
   TABLE DATA           a   COPY public.catalog_insulation (id, thermal_conductivity, mat_type, thick, brand_id) FROM stdin;
    public          postgres    false    234   �;                0    57469    catalog_insulationprice 
   TABLE DATA           O   COPY public.catalog_insulationprice (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    236   <<                0    57474    catalog_markd 
   TABLE DATA           =   COPY public.catalog_markd (id, identifier, name) FROM stdin;
    public          postgres    false    238   �<                0    57479    catalog_markf 
   TABLE DATA           =   COPY public.catalog_markf (id, identifier, name) FROM stdin;
    public          postgres    false    240   �<                0    57484    catalog_markm 
   TABLE DATA           =   COPY public.catalog_markm (id, identifier, name) FROM stdin;
    public          postgres    false    242   �<                0    57489    catalog_nfsize 
   TABLE DATA           h   COPY public.catalog_nfsize (id, identifier, name, greater_bed_size, minor_bed_size, height) FROM stdin;
    public          postgres    false    244   �<                 0    57494 (   catalog_pilegrillagefoundationworkprices 
   TABLE DATA             COPY public.catalog_pilegrillagefoundationworkprices (id, const_expenditure, transportation_procurement_cost, reinforcement_binding, clamp, pile_frame, formwork, length_costs, square_costs, volume_costs, pile_pour, man_hours_cost, man_hours_profit, owner_id) FROM stdin;
    public          postgres    false    246   �<      "          0    57499    catalog_plan 
   TABLE DATA           M   COPY public.catalog_plan (id, title, author_id, scheme, checked) FROM stdin;
    public          postgres    false    248   =      >          0    58019    catalog_plancitycost 
   TABLE DATA           W   COPY public.catalog_plancitycost (id, cost, city_id, material_id, plan_id) FROM stdin;
    public          postgres    false    276   �>      $          0    57507    catalog_profile 
   TABLE DATA           ?   COPY public.catalog_profile (id, user_id, city_id) FROM stdin;
    public          postgres    false    250   �>      &          0    57512    catalog_profile_provider 
   TABLE DATA           O   COPY public.catalog_profile_provider (id, profile_id, provider_id) FROM stdin;
    public          postgres    false    252   �>      (          0    57517    catalog_provider 
   TABLE DATA           I   COPY public.catalog_provider (id, name, primary_activity_id) FROM stdin;
    public          postgres    false    254   ?      *          0    57522 #   catalog_provider_secondary_activity 
   TABLE DATA           [   COPY public.catalog_provider_secondary_activity (id, provider_id, activity_id) FROM stdin;
    public          postgres    false    256   X?      ,          0    57527    catalog_region 
   TABLE DATA           D   COPY public.catalog_region (id, name, code, country_id) FROM stdin;
    public          postgres    false    258   ?      .          0    57532    catalog_rockwallmaterialprice 
   TABLE DATA           U   COPY public.catalog_rockwallmaterialprice (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    260   �?      0          0    57537    catalog_rockwallmaterialunit 
   TABLE DATA           3  COPY public.catalog_rockwallmaterialunit (id, name, material, greater_bed_size, minor_bed_size, height, min_pix_1_floor, min_pix_2_floor, min_pix_3_floor, work_size_1, num_floors_on_work_size_1, work_size_2, num_floors_on_work_size_2, work_size_3, num_floors_on_work_size_3, thermal_conductivity, tongue_and_groove, polish, purpose, partition_or_bearing, body_type, blind_hollow, primary_or_additional, algorithm_id, class_average_density_id, class_b_id, factory_id, mark_d_id, mark_f_id, mark_m_id, brand_id, sub_brand_1_id, sub_brand_2_id, face_id) FROM stdin;
    public          postgres    false    262   C@      2          0    57542    catalog_subbrand_1 
   TABLE DATA           @   COPY public.catalog_subbrand_1 (id, name, brand_id) FROM stdin;
    public          postgres    false    264   A      4          0    57547    catalog_subbrand_2 
   TABLE DATA           F   COPY public.catalog_subbrand_2 (id, name, sub_brand_1_id) FROM stdin;
    public          postgres    false    266   RA      6          0    57552    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    268   �A      8          0    57561    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    270   eK      :          0    57566    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    272   �L      <          0    57574    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    274   �P      j           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);
          public          postgres    false    203            k           0    0    auth_group_permissions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 7, true);
          public          postgres    false    205            l           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 137, true);
          public          postgres    false    207            m           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 4, true);
          public          postgres    false    210            n           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);
          public          postgres    false    211            o           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    213            p           0    0    catalog_activity_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.catalog_activity_id_seq', 2, true);
          public          postgres    false    215            q           0    0    catalog_algorithm_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.catalog_algorithm_id_seq', 3, true);
          public          postgres    false    217            r           0    0    catalog_brand_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.catalog_brand_id_seq', 5, true);
          public          postgres    false    219            s           0    0    catalog_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.catalog_city_id_seq', 7, true);
          public          postgres    false    221            t           0    0    catalog_classb_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalog_classb_id_seq', 1, false);
          public          postgres    false    223            u           0    0 #   catalog_classаveragedensity_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."catalog_classаveragedensity_id_seq"', 1, false);
          public          postgres    false    225            v           0    0    catalog_country_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalog_country_id_seq', 1, true);
          public          postgres    false    227            w           0    0 (   catalog_decorativebrickface_brand_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.catalog_decorativebrickface_brand_id_seq', 1, false);
          public          postgres    false    230            x           0    0 "   catalog_decorativebrickface_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.catalog_decorativebrickface_id_seq', 1, false);
          public          postgres    false    231            y           0    0    catalog_factory_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalog_factory_id_seq', 4, true);
          public          postgres    false    233            z           0    0    catalog_insulation_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalog_insulation_id_seq', 4, true);
          public          postgres    false    235            {           0    0    catalog_insulationprice_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.catalog_insulationprice_id_seq', 8, true);
          public          postgres    false    237            |           0    0    catalog_markd_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_markd_id_seq', 1, false);
          public          postgres    false    239            }           0    0    catalog_markf_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_markf_id_seq', 1, false);
          public          postgres    false    241            ~           0    0    catalog_markm_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_markm_id_seq', 1, false);
          public          postgres    false    243                       0    0    catalog_nfsize_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalog_nfsize_id_seq', 1, false);
          public          postgres    false    245            �           0    0 /   catalog_pilegrillagefoundationworkprices_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.catalog_pilegrillagefoundationworkprices_id_seq', 1, false);
          public          postgres    false    247            �           0    0    catalog_plan_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.catalog_plan_id_seq', 24, true);
          public          postgres    false    249            �           0    0    catalog_plancitycost_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.catalog_plancitycost_id_seq', 1, false);
          public          postgres    false    275            �           0    0    catalog_profile_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalog_profile_id_seq', 5, true);
          public          postgres    false    251            �           0    0    catalog_profile_provider_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.catalog_profile_provider_id_seq', 3, true);
          public          postgres    false    253            �           0    0    catalog_provider_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.catalog_provider_id_seq', 2, true);
          public          postgres    false    255            �           0    0 *   catalog_provider_secondary_activity_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.catalog_provider_secondary_activity_id_seq', 2, true);
          public          postgres    false    257            �           0    0    catalog_region_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_region_id_seq', 3, true);
          public          postgres    false    259            �           0    0 $   catalog_rockwallmaterialprice_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.catalog_rockwallmaterialprice_id_seq', 9, true);
          public          postgres    false    261            �           0    0 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_id_seq', 7, true);
          public          postgres    false    263            �           0    0    catalog_subbrand_1_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalog_subbrand_1_id_seq', 2, true);
          public          postgres    false    265            �           0    0    catalog_subbrand_2_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalog_subbrand_2_id_seq', 4, true);
          public          postgres    false    267            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 106, true);
          public          postgres    false    269            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 34, true);
          public          postgres    false    271            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 43, true);
          public          postgres    false    273            �           2606    57617    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    202            �           2606    57619 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    204    204            �           2606    57621 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    204            �           2606    57623    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    202            �           2606    57625 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    206    206            �           2606    57627 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    206            �           2606    57629 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    209            �           2606    57631 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    209    209            �           2606    57633    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    208            �           2606    57635 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    212            �           2606    57637 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    212    212            �           2606    57639     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    208            �           2606    57641 0   catalog_activity catalog_activity_identifier_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.catalog_activity
    ADD CONSTRAINT catalog_activity_identifier_key UNIQUE (identifier);
 Z   ALTER TABLE ONLY public.catalog_activity DROP CONSTRAINT catalog_activity_identifier_key;
       public            postgres    false    214            �           2606    57643 &   catalog_activity catalog_activity_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.catalog_activity
    ADD CONSTRAINT catalog_activity_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.catalog_activity DROP CONSTRAINT catalog_activity_pkey;
       public            postgres    false    214            �           2606    57645 ,   catalog_algorithm catalog_algorithm_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_name_key;
       public            postgres    false    216            �           2606    57647 (   catalog_algorithm catalog_algorithm_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_pkey;
       public            postgres    false    216            �           2606    57649 0   catalog_algorithm catalog_algorithm_var_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_var_name_key UNIQUE (identifier);
 Z   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_var_name_key;
       public            postgres    false    216            �           2606    57651 $   catalog_brand catalog_brand_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.catalog_brand
    ADD CONSTRAINT catalog_brand_name_key UNIQUE (name);
 N   ALTER TABLE ONLY public.catalog_brand DROP CONSTRAINT catalog_brand_name_key;
       public            postgres    false    218            �           2606    57653     catalog_brand catalog_brand_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_brand
    ADD CONSTRAINT catalog_brand_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_brand DROP CONSTRAINT catalog_brand_pkey;
       public            postgres    false    218            �           2606    57655    catalog_city catalog_city_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.catalog_city
    ADD CONSTRAINT catalog_city_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.catalog_city DROP CONSTRAINT catalog_city_pkey;
       public            postgres    false    220            �           2606    57657 ,   catalog_classb catalog_classb_identifier_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.catalog_classb
    ADD CONSTRAINT catalog_classb_identifier_key UNIQUE (identifier);
 V   ALTER TABLE ONLY public.catalog_classb DROP CONSTRAINT catalog_classb_identifier_key;
       public            postgres    false    222            �           2606    57659 "   catalog_classb catalog_classb_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.catalog_classb
    ADD CONSTRAINT catalog_classb_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.catalog_classb DROP CONSTRAINT catalog_classb_pkey;
       public            postgres    false    222            �           2606    57661 H   catalog_classаveragedensity catalog_classаveragedensity_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."catalog_classаveragedensity"
    ADD CONSTRAINT "catalog_classаveragedensity_identifier_key" UNIQUE (identifier);
 v   ALTER TABLE ONLY public."catalog_classаveragedensity" DROP CONSTRAINT "catalog_classаveragedensity_identifier_key";
       public            postgres    false    224            �           2606    57663 >   catalog_classаveragedensity catalog_classаveragedensity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."catalog_classаveragedensity"
    ADD CONSTRAINT "catalog_classаveragedensity_pkey" PRIMARY KEY (id);
 l   ALTER TABLE ONLY public."catalog_classаveragedensity" DROP CONSTRAINT "catalog_classаveragedensity_pkey";
       public            postgres    false    224            �           2606    57665 (   catalog_country catalog_country_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.catalog_country
    ADD CONSTRAINT catalog_country_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.catalog_country DROP CONSTRAINT catalog_country_name_key;
       public            postgres    false    226            �           2606    57667 $   catalog_country catalog_country_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.catalog_country
    ADD CONSTRAINT catalog_country_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.catalog_country DROP CONSTRAINT catalog_country_pkey;
       public            postgres    false    226            �           2606    57669 a   catalog_decorativebrickface_brand catalog_decorativebrickf_decorativebrickface_id_b_ccb37403_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_decorativebrickface_brand
    ADD CONSTRAINT catalog_decorativebrickf_decorativebrickface_id_b_ccb37403_uniq UNIQUE (decorativebrickface_id, brand_id);
 �   ALTER TABLE ONLY public.catalog_decorativebrickface_brand DROP CONSTRAINT catalog_decorativebrickf_decorativebrickface_id_b_ccb37403_uniq;
       public            postgres    false    229    229            �           2606    57671 H   catalog_decorativebrickface_brand catalog_decorativebrickface_brand_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_decorativebrickface_brand
    ADD CONSTRAINT catalog_decorativebrickface_brand_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.catalog_decorativebrickface_brand DROP CONSTRAINT catalog_decorativebrickface_brand_pkey;
       public            postgres    false    229            �           2606    57673 <   catalog_decorativebrickface catalog_decorativebrickface_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.catalog_decorativebrickface
    ADD CONSTRAINT catalog_decorativebrickface_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.catalog_decorativebrickface DROP CONSTRAINT catalog_decorativebrickface_pkey;
       public            postgres    false    228            �           2606    57675 (   catalog_factory catalog_factory_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.catalog_factory
    ADD CONSTRAINT catalog_factory_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.catalog_factory DROP CONSTRAINT catalog_factory_name_key;
       public            postgres    false    232            �           2606    57677 $   catalog_factory catalog_factory_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.catalog_factory
    ADD CONSTRAINT catalog_factory_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.catalog_factory DROP CONSTRAINT catalog_factory_pkey;
       public            postgres    false    232            �           2606    57679 *   catalog_insulation catalog_insulation_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.catalog_insulation
    ADD CONSTRAINT catalog_insulation_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.catalog_insulation DROP CONSTRAINT catalog_insulation_pkey;
       public            postgres    false    234            �           2606    57681 4   catalog_insulationprice catalog_insulationprice_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.catalog_insulationprice
    ADD CONSTRAINT catalog_insulationprice_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.catalog_insulationprice DROP CONSTRAINT catalog_insulationprice_pkey;
       public            postgres    false    236            �           2606    57683 *   catalog_markd catalog_markd_identifier_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_markd
    ADD CONSTRAINT catalog_markd_identifier_key UNIQUE (identifier);
 T   ALTER TABLE ONLY public.catalog_markd DROP CONSTRAINT catalog_markd_identifier_key;
       public            postgres    false    238            �           2606    57685     catalog_markd catalog_markd_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_markd
    ADD CONSTRAINT catalog_markd_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_markd DROP CONSTRAINT catalog_markd_pkey;
       public            postgres    false    238            �           2606    57687 *   catalog_markf catalog_markf_identifier_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_markf
    ADD CONSTRAINT catalog_markf_identifier_key UNIQUE (identifier);
 T   ALTER TABLE ONLY public.catalog_markf DROP CONSTRAINT catalog_markf_identifier_key;
       public            postgres    false    240            �           2606    57689     catalog_markf catalog_markf_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_markf
    ADD CONSTRAINT catalog_markf_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_markf DROP CONSTRAINT catalog_markf_pkey;
       public            postgres    false    240            �           2606    57691 *   catalog_markm catalog_markm_identifier_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_markm
    ADD CONSTRAINT catalog_markm_identifier_key UNIQUE (identifier);
 T   ALTER TABLE ONLY public.catalog_markm DROP CONSTRAINT catalog_markm_identifier_key;
       public            postgres    false    242            �           2606    57693     catalog_markm catalog_markm_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_markm
    ADD CONSTRAINT catalog_markm_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_markm DROP CONSTRAINT catalog_markm_pkey;
       public            postgres    false    242            �           2606    57695 ,   catalog_nfsize catalog_nfsize_identifier_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.catalog_nfsize
    ADD CONSTRAINT catalog_nfsize_identifier_key UNIQUE (identifier);
 V   ALTER TABLE ONLY public.catalog_nfsize DROP CONSTRAINT catalog_nfsize_identifier_key;
       public            postgres    false    244            �           2606    57697 "   catalog_nfsize catalog_nfsize_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.catalog_nfsize
    ADD CONSTRAINT catalog_nfsize_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.catalog_nfsize DROP CONSTRAINT catalog_nfsize_pkey;
       public            postgres    false    244            �           2606    57699 V   catalog_pilegrillagefoundationworkprices catalog_pilegrillagefoundationworkprices_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices
    ADD CONSTRAINT catalog_pilegrillagefoundationworkprices_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices DROP CONSTRAINT catalog_pilegrillagefoundationworkprices_pkey;
       public            postgres    false    246            �           2606    57701    catalog_plan catalog_plan_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_pkey;
       public            postgres    false    248            G           2606    58024 .   catalog_plancitycost catalog_plancitycost_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.catalog_plancitycost
    ADD CONSTRAINT catalog_plancitycost_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.catalog_plancitycost DROP CONSTRAINT catalog_plancitycost_pkey;
       public            postgres    false    276            �           2606    57703 $   catalog_profile catalog_profile_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_pkey;
       public            postgres    false    250                        2606    57705 6   catalog_profile_provider catalog_profile_provider_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.catalog_profile_provider
    ADD CONSTRAINT catalog_profile_provider_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.catalog_profile_provider DROP CONSTRAINT catalog_profile_provider_pkey;
       public            postgres    false    252                       2606    57707 V   catalog_profile_provider catalog_profile_provider_profile_id_provider_id_83474f01_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile_provider
    ADD CONSTRAINT catalog_profile_provider_profile_id_provider_id_83474f01_uniq UNIQUE (profile_id, provider_id);
 �   ALTER TABLE ONLY public.catalog_profile_provider DROP CONSTRAINT catalog_profile_provider_profile_id_provider_id_83474f01_uniq;
       public            postgres    false    252    252                       2606    57709 *   catalog_provider catalog_provider_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_name_key;
       public            postgres    false    254            	           2606    57711 &   catalog_provider catalog_provider_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_pkey;
       public            postgres    false    254                       2606    57713 b   catalog_provider_secondary_activity catalog_provider_seconda_provider_id_activity_id_491d3b4f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_seconda_provider_id_activity_id_491d3b4f_uniq UNIQUE (provider_id, activity_id);
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_seconda_provider_id_activity_id_491d3b4f_uniq;
       public            postgres    false    256    256                       2606    57715 L   catalog_provider_secondary_activity catalog_provider_secondary_activity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_secondary_activity_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_secondary_activity_pkey;
       public            postgres    false    256                       2606    57717 &   catalog_region catalog_region_code_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.catalog_region
    ADD CONSTRAINT catalog_region_code_key UNIQUE (code);
 P   ALTER TABLE ONLY public.catalog_region DROP CONSTRAINT catalog_region_code_key;
       public            postgres    false    258                       2606    57719 &   catalog_region catalog_region_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.catalog_region
    ADD CONSTRAINT catalog_region_name_key UNIQUE (name);
 P   ALTER TABLE ONLY public.catalog_region DROP CONSTRAINT catalog_region_name_key;
       public            postgres    false    258                       2606    57721 "   catalog_region catalog_region_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.catalog_region
    ADD CONSTRAINT catalog_region_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.catalog_region DROP CONSTRAINT catalog_region_pkey;
       public            postgres    false    258                       2606    57723 @   catalog_rockwallmaterialprice catalog_rockwallmaterialprice_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.catalog_rockwallmaterialprice
    ADD CONSTRAINT catalog_rockwallmaterialprice_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.catalog_rockwallmaterialprice DROP CONSTRAINT catalog_rockwallmaterialprice_pkey;
       public            postgres    false    260            '           2606    57725 >   catalog_rockwallmaterialunit catalog_rockwallmaterialunit_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmaterialunit_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmaterialunit_pkey;
       public            postgres    false    262            -           2606    57727 .   catalog_subbrand_1 catalog_subbrand_1_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.catalog_subbrand_1
    ADD CONSTRAINT catalog_subbrand_1_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.catalog_subbrand_1 DROP CONSTRAINT catalog_subbrand_1_name_key;
       public            postgres    false    264            /           2606    57729 *   catalog_subbrand_1 catalog_subbrand_1_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.catalog_subbrand_1
    ADD CONSTRAINT catalog_subbrand_1_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.catalog_subbrand_1 DROP CONSTRAINT catalog_subbrand_1_pkey;
       public            postgres    false    264            2           2606    57731 .   catalog_subbrand_2 catalog_subbrand_2_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.catalog_subbrand_2
    ADD CONSTRAINT catalog_subbrand_2_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.catalog_subbrand_2 DROP CONSTRAINT catalog_subbrand_2_name_key;
       public            postgres    false    266            4           2606    57733 *   catalog_subbrand_2 catalog_subbrand_2_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.catalog_subbrand_2
    ADD CONSTRAINT catalog_subbrand_2_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.catalog_subbrand_2 DROP CONSTRAINT catalog_subbrand_2_pkey;
       public            postgres    false    266            8           2606    57735 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    268            ;           2606    57737 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    270    270            =           2606    57739 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    270            ?           2606    57741 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    272            B           2606    57743 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    274            �           1259    57744    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    202            �           1259    57745 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    204            �           1259    57746 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    204            �           1259    57747 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    206            �           1259    57748 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    209            �           1259    57749 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    209            �           1259    57750 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    212            �           1259    57751 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    212            �           1259    57752     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    208            �           1259    57753 )   catalog_activity_identifier_3c7b3300_like    INDEX     �   CREATE INDEX catalog_activity_identifier_3c7b3300_like ON public.catalog_activity USING btree (identifier varchar_pattern_ops);
 =   DROP INDEX public.catalog_activity_identifier_3c7b3300_like;
       public            postgres    false    214            �           1259    57754 $   catalog_algorithm_name_5dd925d3_like    INDEX     v   CREATE INDEX catalog_algorithm_name_5dd925d3_like ON public.catalog_algorithm USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.catalog_algorithm_name_5dd925d3_like;
       public            postgres    false    216            �           1259    57755 (   catalog_algorithm_var_name_fff32a24_like    INDEX     �   CREATE INDEX catalog_algorithm_var_name_fff32a24_like ON public.catalog_algorithm USING btree (identifier varchar_pattern_ops);
 <   DROP INDEX public.catalog_algorithm_var_name_fff32a24_like;
       public            postgres    false    216            �           1259    57756     catalog_brand_name_ea62c47f_like    INDEX     n   CREATE INDEX catalog_brand_name_ea62c47f_like ON public.catalog_brand USING btree (name varchar_pattern_ops);
 4   DROP INDEX public.catalog_brand_name_ea62c47f_like;
       public            postgres    false    218            �           1259    57757    catalog_city_region_id_f345c297    INDEX     ]   CREATE INDEX catalog_city_region_id_f345c297 ON public.catalog_city USING btree (region_id);
 3   DROP INDEX public.catalog_city_region_id_f345c297;
       public            postgres    false    220            �           1259    57758 '   catalog_classb_identifier_d34d76e2_like    INDEX     |   CREATE INDEX catalog_classb_identifier_d34d76e2_like ON public.catalog_classb USING btree (identifier varchar_pattern_ops);
 ;   DROP INDEX public.catalog_classb_identifier_d34d76e2_like;
       public            postgres    false    222            �           1259    57759 5   catalog_classаveragedensity_identifier_54c2b78d_like    INDEX     �   CREATE INDEX "catalog_classаveragedensity_identifier_54c2b78d_like" ON public."catalog_classаveragedensity" USING btree (identifier varchar_pattern_ops);
 K   DROP INDEX public."catalog_classаveragedensity_identifier_54c2b78d_like";
       public            postgres    false    224            �           1259    57760 "   catalog_country_name_3acac907_like    INDEX     r   CREATE INDEX catalog_country_name_3acac907_like ON public.catalog_country USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.catalog_country_name_3acac907_like;
       public            postgres    false    226            �           1259    57761 :   catalog_decorativebrickfac_decorativebrickface_id_ff2c7424    INDEX     �   CREATE INDEX catalog_decorativebrickfac_decorativebrickface_id_ff2c7424 ON public.catalog_decorativebrickface_brand USING btree (decorativebrickface_id);
 N   DROP INDEX public.catalog_decorativebrickfac_decorativebrickface_id_ff2c7424;
       public            postgres    false    229            �           1259    57762 3   catalog_decorativebrickface_brand_brand_id_0817003c    INDEX     �   CREATE INDEX catalog_decorativebrickface_brand_brand_id_0817003c ON public.catalog_decorativebrickface_brand USING btree (brand_id);
 G   DROP INDEX public.catalog_decorativebrickface_brand_brand_id_0817003c;
       public            postgres    false    229            �           1259    57763 !   catalog_factory_brand_id_03484807    INDEX     a   CREATE INDEX catalog_factory_brand_id_03484807 ON public.catalog_factory USING btree (brand_id);
 5   DROP INDEX public.catalog_factory_brand_id_03484807;
       public            postgres    false    232            �           1259    57764     catalog_factory_city_id_0da00f7e    INDEX     _   CREATE INDEX catalog_factory_city_id_0da00f7e ON public.catalog_factory USING btree (city_id);
 4   DROP INDEX public.catalog_factory_city_id_0da00f7e;
       public            postgres    false    232            �           1259    57765 "   catalog_factory_name_8756d383_like    INDEX     r   CREATE INDEX catalog_factory_name_8756d383_like ON public.catalog_factory USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.catalog_factory_name_8756d383_like;
       public            postgres    false    232            �           1259    57766 $   catalog_insulation_brand_id_fff7481d    INDEX     g   CREATE INDEX catalog_insulation_brand_id_fff7481d ON public.catalog_insulation USING btree (brand_id);
 8   DROP INDEX public.catalog_insulation_brand_id_fff7481d;
       public            postgres    false    234            �           1259    57767 (   catalog_insulationprice_name_id_78483fb2    INDEX     o   CREATE INDEX catalog_insulationprice_name_id_78483fb2 ON public.catalog_insulationprice USING btree (name_id);
 <   DROP INDEX public.catalog_insulationprice_name_id_78483fb2;
       public            postgres    false    236            �           1259    57768 )   catalog_insulationprice_owner_id_7d878afb    INDEX     q   CREATE INDEX catalog_insulationprice_owner_id_7d878afb ON public.catalog_insulationprice USING btree (owner_id);
 =   DROP INDEX public.catalog_insulationprice_owner_id_7d878afb;
       public            postgres    false    236            �           1259    57769 &   catalog_markd_identifier_94610a4e_like    INDEX     z   CREATE INDEX catalog_markd_identifier_94610a4e_like ON public.catalog_markd USING btree (identifier varchar_pattern_ops);
 :   DROP INDEX public.catalog_markd_identifier_94610a4e_like;
       public            postgres    false    238            �           1259    57770 &   catalog_markf_identifier_82d307d0_like    INDEX     z   CREATE INDEX catalog_markf_identifier_82d307d0_like ON public.catalog_markf USING btree (identifier varchar_pattern_ops);
 :   DROP INDEX public.catalog_markf_identifier_82d307d0_like;
       public            postgres    false    240            �           1259    57771 &   catalog_markm_identifier_43ab376a_like    INDEX     z   CREATE INDEX catalog_markm_identifier_43ab376a_like ON public.catalog_markm USING btree (identifier varchar_pattern_ops);
 :   DROP INDEX public.catalog_markm_identifier_43ab376a_like;
       public            postgres    false    242            �           1259    57772 '   catalog_nfsize_identifier_1e4f6bf7_like    INDEX     |   CREATE INDEX catalog_nfsize_identifier_1e4f6bf7_like ON public.catalog_nfsize USING btree (identifier varchar_pattern_ops);
 ;   DROP INDEX public.catalog_nfsize_identifier_1e4f6bf7_like;
       public            postgres    false    244            �           1259    57773 :   catalog_pilegrillagefoundationworkprices_owner_id_a82c33db    INDEX     �   CREATE INDEX catalog_pilegrillagefoundationworkprices_owner_id_a82c33db ON public.catalog_pilegrillagefoundationworkprices USING btree (owner_id);
 N   DROP INDEX public.catalog_pilegrillagefoundationworkprices_owner_id_a82c33db;
       public            postgres    false    246            �           1259    57774    catalog_plan_author_id_19443bad    INDEX     ]   CREATE INDEX catalog_plan_author_id_19443bad ON public.catalog_plan USING btree (author_id);
 3   DROP INDEX public.catalog_plan_author_id_19443bad;
       public            postgres    false    248            D           1259    58040 %   catalog_plancitycost_city_id_2a14da95    INDEX     i   CREATE INDEX catalog_plancitycost_city_id_2a14da95 ON public.catalog_plancitycost USING btree (city_id);
 9   DROP INDEX public.catalog_plancitycost_city_id_2a14da95;
       public            postgres    false    276            E           1259    58041 )   catalog_plancitycost_material_id_d6d63aa9    INDEX     q   CREATE INDEX catalog_plancitycost_material_id_d6d63aa9 ON public.catalog_plancitycost USING btree (material_id);
 =   DROP INDEX public.catalog_plancitycost_material_id_d6d63aa9;
       public            postgres    false    276            H           1259    58042 %   catalog_plancitycost_plan_id_238dcdf6    INDEX     i   CREATE INDEX catalog_plancitycost_plan_id_238dcdf6 ON public.catalog_plancitycost USING btree (plan_id);
 9   DROP INDEX public.catalog_plancitycost_plan_id_238dcdf6;
       public            postgres    false    276            �           1259    57775     catalog_profile_city_id_2b229f7f    INDEX     _   CREATE INDEX catalog_profile_city_id_2b229f7f ON public.catalog_profile USING btree (city_id);
 4   DROP INDEX public.catalog_profile_city_id_2b229f7f;
       public            postgres    false    250                       1259    57776 ,   catalog_profile_provider_profile_id_1d5e33e1    INDEX     w   CREATE INDEX catalog_profile_provider_profile_id_1d5e33e1 ON public.catalog_profile_provider USING btree (profile_id);
 @   DROP INDEX public.catalog_profile_provider_profile_id_1d5e33e1;
       public            postgres    false    252                       1259    57777 -   catalog_profile_provider_provider_id_fff27d60    INDEX     y   CREATE INDEX catalog_profile_provider_provider_id_fff27d60 ON public.catalog_profile_provider USING btree (provider_id);
 A   DROP INDEX public.catalog_profile_provider_provider_id_fff27d60;
       public            postgres    false    252            �           1259    57778     catalog_profile_user_id_7c4daf2b    INDEX     _   CREATE INDEX catalog_profile_user_id_7c4daf2b ON public.catalog_profile USING btree (user_id);
 4   DROP INDEX public.catalog_profile_user_id_7c4daf2b;
       public            postgres    false    250                       1259    57779 #   catalog_provider_name_23080848_like    INDEX     t   CREATE INDEX catalog_provider_name_23080848_like ON public.catalog_provider USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.catalog_provider_name_23080848_like;
       public            postgres    false    254            
           1259    57780 -   catalog_provider_primary_activity_id_5ff3703d    INDEX     y   CREATE INDEX catalog_provider_primary_activity_id_5ff3703d ON public.catalog_provider USING btree (primary_activity_id);
 A   DROP INDEX public.catalog_provider_primary_activity_id_5ff3703d;
       public            postgres    false    254                       1259    57781 8   catalog_provider_secondary_activity_activity_id_50696e92    INDEX     �   CREATE INDEX catalog_provider_secondary_activity_activity_id_50696e92 ON public.catalog_provider_secondary_activity USING btree (activity_id);
 L   DROP INDEX public.catalog_provider_secondary_activity_activity_id_50696e92;
       public            postgres    false    256                       1259    57782 8   catalog_provider_secondary_activity_provider_id_1050e31c    INDEX     �   CREATE INDEX catalog_provider_secondary_activity_provider_id_1050e31c ON public.catalog_provider_secondary_activity USING btree (provider_id);
 L   DROP INDEX public.catalog_provider_secondary_activity_provider_id_1050e31c;
       public            postgres    false    256                       1259    57783 "   catalog_region_country_id_fbbe1377    INDEX     c   CREATE INDEX catalog_region_country_id_fbbe1377 ON public.catalog_region USING btree (country_id);
 6   DROP INDEX public.catalog_region_country_id_fbbe1377;
       public            postgres    false    258                       1259    57784 !   catalog_region_name_af23e790_like    INDEX     p   CREATE INDEX catalog_region_name_af23e790_like ON public.catalog_region USING btree (name varchar_pattern_ops);
 5   DROP INDEX public.catalog_region_name_af23e790_like;
       public            postgres    false    258                       1259    57785 .   catalog_rockwallmaterialprice_name_id_23978ff4    INDEX     {   CREATE INDEX catalog_rockwallmaterialprice_name_id_23978ff4 ON public.catalog_rockwallmaterialprice USING btree (name_id);
 B   DROP INDEX public.catalog_rockwallmaterialprice_name_id_23978ff4;
       public            postgres    false    260                       1259    57786 /   catalog_rockwallmaterialprice_owner_id_19c1cadb    INDEX     }   CREATE INDEX catalog_rockwallmaterialprice_owner_id_19c1cadb ON public.catalog_rockwallmaterialprice USING btree (owner_id);
 C   DROP INDEX public.catalog_rockwallmaterialprice_owner_id_19c1cadb;
       public            postgres    false    260                       1259    57787 2   catalog_rockwallmaterialunit_algorithm_id_16bdd59b    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_algorithm_id_16bdd59b ON public.catalog_rockwallmaterialunit USING btree (algorithm_id);
 F   DROP INDEX public.catalog_rockwallmaterialunit_algorithm_id_16bdd59b;
       public            postgres    false    262                       1259    57788 .   catalog_rockwallmaterialunit_brand_id_7ba15ba0    INDEX     {   CREATE INDEX catalog_rockwallmaterialunit_brand_id_7ba15ba0 ON public.catalog_rockwallmaterialunit USING btree (brand_id);
 B   DROP INDEX public.catalog_rockwallmaterialunit_brand_id_7ba15ba0;
       public            postgres    false    262                       1259    57789 >   catalog_rockwallmaterialunit_class_average_density_id_2df62284    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_class_average_density_id_2df62284 ON public.catalog_rockwallmaterialunit USING btree (class_average_density_id);
 R   DROP INDEX public.catalog_rockwallmaterialunit_class_average_density_id_2df62284;
       public            postgres    false    262                        1259    57790 0   catalog_rockwallmaterialunit_class_b_id_6acc8c19    INDEX        CREATE INDEX catalog_rockwallmaterialunit_class_b_id_6acc8c19 ON public.catalog_rockwallmaterialunit USING btree (class_b_id);
 D   DROP INDEX public.catalog_rockwallmaterialunit_class_b_id_6acc8c19;
       public            postgres    false    262            !           1259    57791 -   catalog_rockwallmaterialunit_face_id_eb3d5342    INDEX     y   CREATE INDEX catalog_rockwallmaterialunit_face_id_eb3d5342 ON public.catalog_rockwallmaterialunit USING btree (face_id);
 A   DROP INDEX public.catalog_rockwallmaterialunit_face_id_eb3d5342;
       public            postgres    false    262            "           1259    57792 0   catalog_rockwallmaterialunit_factory_id_f1af5d55    INDEX        CREATE INDEX catalog_rockwallmaterialunit_factory_id_f1af5d55 ON public.catalog_rockwallmaterialunit USING btree (factory_id);
 D   DROP INDEX public.catalog_rockwallmaterialunit_factory_id_f1af5d55;
       public            postgres    false    262            #           1259    57793 /   catalog_rockwallmaterialunit_mark_d_id_4fe3b199    INDEX     }   CREATE INDEX catalog_rockwallmaterialunit_mark_d_id_4fe3b199 ON public.catalog_rockwallmaterialunit USING btree (mark_d_id);
 C   DROP INDEX public.catalog_rockwallmaterialunit_mark_d_id_4fe3b199;
       public            postgres    false    262            $           1259    57794 /   catalog_rockwallmaterialunit_mark_f_id_3e515b69    INDEX     }   CREATE INDEX catalog_rockwallmaterialunit_mark_f_id_3e515b69 ON public.catalog_rockwallmaterialunit USING btree (mark_f_id);
 C   DROP INDEX public.catalog_rockwallmaterialunit_mark_f_id_3e515b69;
       public            postgres    false    262            %           1259    57795 /   catalog_rockwallmaterialunit_mark_m_id_6f18e612    INDEX     }   CREATE INDEX catalog_rockwallmaterialunit_mark_m_id_6f18e612 ON public.catalog_rockwallmaterialunit USING btree (mark_m_id);
 C   DROP INDEX public.catalog_rockwallmaterialunit_mark_m_id_6f18e612;
       public            postgres    false    262            (           1259    57796 4   catalog_rockwallmaterialunit_sub_brand_1_id_9b7b9a46    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_sub_brand_1_id_9b7b9a46 ON public.catalog_rockwallmaterialunit USING btree (sub_brand_1_id);
 H   DROP INDEX public.catalog_rockwallmaterialunit_sub_brand_1_id_9b7b9a46;
       public            postgres    false    262            )           1259    57797 4   catalog_rockwallmaterialunit_sub_brand_2_id_40f52fd1    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_sub_brand_2_id_40f52fd1 ON public.catalog_rockwallmaterialunit USING btree (sub_brand_2_id);
 H   DROP INDEX public.catalog_rockwallmaterialunit_sub_brand_2_id_40f52fd1;
       public            postgres    false    262            *           1259    57798 $   catalog_subbrand_1_brand_id_b77c1599    INDEX     g   CREATE INDEX catalog_subbrand_1_brand_id_b77c1599 ON public.catalog_subbrand_1 USING btree (brand_id);
 8   DROP INDEX public.catalog_subbrand_1_brand_id_b77c1599;
       public            postgres    false    264            +           1259    57799 %   catalog_subbrand_1_name_7262cc51_like    INDEX     x   CREATE INDEX catalog_subbrand_1_name_7262cc51_like ON public.catalog_subbrand_1 USING btree (name varchar_pattern_ops);
 9   DROP INDEX public.catalog_subbrand_1_name_7262cc51_like;
       public            postgres    false    264            0           1259    57800 %   catalog_subbrand_2_name_5be7264f_like    INDEX     x   CREATE INDEX catalog_subbrand_2_name_5be7264f_like ON public.catalog_subbrand_2 USING btree (name varchar_pattern_ops);
 9   DROP INDEX public.catalog_subbrand_2_name_5be7264f_like;
       public            postgres    false    266            5           1259    57801 *   catalog_subbrand_2_sub_brand_1_id_0113c49f    INDEX     s   CREATE INDEX catalog_subbrand_2_sub_brand_1_id_0113c49f ON public.catalog_subbrand_2 USING btree (sub_brand_1_id);
 >   DROP INDEX public.catalog_subbrand_2_sub_brand_1_id_0113c49f;
       public            postgres    false    266            6           1259    57802 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    268            9           1259    57803 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    268            @           1259    57804 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    274            C           1259    57805 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    274            I           2606    57806 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    2965    206    204            J           2606    57811 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    204    202    2954            K           2606    57816 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    270    3133    206            L           2606    57821 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    2954    202    209            M           2606    57826 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    208    2967    209            N           2606    57831 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    206    212    2965            O           2606    57836 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    208    2967    212            P           2606    57841 A   catalog_city catalog_city_region_id_f345c297_fk_catalog_region_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_city
    ADD CONSTRAINT catalog_city_region_id_f345c297_fk_catalog_region_id FOREIGN KEY (region_id) REFERENCES public.catalog_region(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.catalog_city DROP CONSTRAINT catalog_city_region_id_f345c297_fk_catalog_region_id;
       public          postgres    false    258    3096    220            Q           2606    57846 U   catalog_decorativebrickface_brand catalog_decorativebr_brand_id_0817003c_fk_catalog_b    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_decorativebrickface_brand
    ADD CONSTRAINT catalog_decorativebr_brand_id_0817003c_fk_catalog_b FOREIGN KEY (brand_id) REFERENCES public.catalog_brand(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.catalog_decorativebrickface_brand DROP CONSTRAINT catalog_decorativebr_brand_id_0817003c_fk_catalog_b;
       public          postgres    false    218    3000    229            R           2606    57851 a   catalog_decorativebrickface_brand catalog_decorativebr_decorativebrickface__ff2c7424_fk_catalog_d    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_decorativebrickface_brand
    ADD CONSTRAINT catalog_decorativebr_decorativebrickface__ff2c7424_fk_catalog_d FOREIGN KEY (decorativebrickface_id) REFERENCES public.catalog_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_decorativebrickface_brand DROP CONSTRAINT catalog_decorativebr_decorativebrickface__ff2c7424_fk_catalog_d;
       public          postgres    false    229    3020    228            S           2606    57856 E   catalog_factory catalog_factory_brand_id_03484807_fk_catalog_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_factory
    ADD CONSTRAINT catalog_factory_brand_id_03484807_fk_catalog_brand_id FOREIGN KEY (brand_id) REFERENCES public.catalog_brand(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.catalog_factory DROP CONSTRAINT catalog_factory_brand_id_03484807_fk_catalog_brand_id;
       public          postgres    false    218    3000    232            T           2606    57861 C   catalog_factory catalog_factory_city_id_0da00f7e_fk_catalog_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_factory
    ADD CONSTRAINT catalog_factory_city_id_0da00f7e_fk_catalog_city_id FOREIGN KEY (city_id) REFERENCES public.catalog_city(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.catalog_factory DROP CONSTRAINT catalog_factory_city_id_0da00f7e_fk_catalog_city_id;
       public          postgres    false    220    3002    232            U           2606    57866 K   catalog_insulation catalog_insulation_brand_id_fff7481d_fk_catalog_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_insulation
    ADD CONSTRAINT catalog_insulation_brand_id_fff7481d_fk_catalog_brand_id FOREIGN KEY (brand_id) REFERENCES public.catalog_brand(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.catalog_insulation DROP CONSTRAINT catalog_insulation_brand_id_fff7481d_fk_catalog_brand_id;
       public          postgres    false    218    3000    234            V           2606    57871 J   catalog_insulationprice catalog_insulationpr_name_id_78483fb2_fk_catalog_i    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_insulationprice
    ADD CONSTRAINT catalog_insulationpr_name_id_78483fb2_fk_catalog_i FOREIGN KEY (name_id) REFERENCES public.catalog_insulation(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.catalog_insulationprice DROP CONSTRAINT catalog_insulationpr_name_id_78483fb2_fk_catalog_i;
       public          postgres    false    234    236    3036            W           2606    57876 Q   catalog_insulationprice catalog_insulationprice_owner_id_7d878afb_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_insulationprice
    ADD CONSTRAINT catalog_insulationprice_owner_id_7d878afb_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_insulationprice DROP CONSTRAINT catalog_insulationprice_owner_id_7d878afb_fk_auth_user_id;
       public          postgres    false    2967    236    208            X           2606    57881 \   catalog_pilegrillagefoundationworkprices catalog_pilegrillage_owner_id_a82c33db_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices
    ADD CONSTRAINT catalog_pilegrillage_owner_id_a82c33db_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices DROP CONSTRAINT catalog_pilegrillage_owner_id_a82c33db_fk_auth_user;
       public          postgres    false    208    2967    246            Y           2606    57886 <   catalog_plan catalog_plan_author_id_19443bad_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id;
       public          postgres    false    208    2967    248            s           2606    58025 M   catalog_plancitycost catalog_plancitycost_city_id_2a14da95_fk_catalog_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_plancitycost
    ADD CONSTRAINT catalog_plancitycost_city_id_2a14da95_fk_catalog_city_id FOREIGN KEY (city_id) REFERENCES public.catalog_city(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.catalog_plancitycost DROP CONSTRAINT catalog_plancitycost_city_id_2a14da95_fk_catalog_city_id;
       public          postgres    false    220    276    3002            t           2606    58030 K   catalog_plancitycost catalog_plancitycost_material_id_d6d63aa9_fk_catalog_r    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_plancitycost
    ADD CONSTRAINT catalog_plancitycost_material_id_d6d63aa9_fk_catalog_r FOREIGN KEY (material_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.catalog_plancitycost DROP CONSTRAINT catalog_plancitycost_material_id_d6d63aa9_fk_catalog_r;
       public          postgres    false    276    3111    262            u           2606    58035 M   catalog_plancitycost catalog_plancitycost_plan_id_238dcdf6_fk_catalog_plan_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_plancitycost
    ADD CONSTRAINT catalog_plancitycost_plan_id_238dcdf6_fk_catalog_plan_id FOREIGN KEY (plan_id) REFERENCES public.catalog_plan(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.catalog_plancitycost DROP CONSTRAINT catalog_plancitycost_plan_id_238dcdf6_fk_catalog_plan_id;
       public          postgres    false    3066    276    248            Z           2606    57891 C   catalog_profile catalog_profile_city_id_2b229f7f_fk_catalog_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_city_id_2b229f7f_fk_catalog_city_id FOREIGN KEY (city_id) REFERENCES public.catalog_city(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_city_id_2b229f7f_fk_catalog_city_id;
       public          postgres    false    3002    250    220            \           2606    57896 N   catalog_profile_provider catalog_profile_prov_profile_id_1d5e33e1_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile_provider
    ADD CONSTRAINT catalog_profile_prov_profile_id_1d5e33e1_fk_catalog_p FOREIGN KEY (profile_id) REFERENCES public.catalog_profile(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.catalog_profile_provider DROP CONSTRAINT catalog_profile_prov_profile_id_1d5e33e1_fk_catalog_p;
       public          postgres    false    250    3069    252            ]           2606    57901 O   catalog_profile_provider catalog_profile_prov_provider_id_fff27d60_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile_provider
    ADD CONSTRAINT catalog_profile_prov_provider_id_fff27d60_fk_catalog_p FOREIGN KEY (provider_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.catalog_profile_provider DROP CONSTRAINT catalog_profile_prov_provider_id_fff27d60_fk_catalog_p;
       public          postgres    false    3081    254    252            [           2606    57906 @   catalog_profile catalog_profile_user_id_7c4daf2b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_user_id_7c4daf2b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_user_id_7c4daf2b_fk_auth_user_id;
       public          postgres    false    208    2967    250            ^           2606    57911 K   catalog_provider catalog_provider_primary_activity_id_5ff3703d_fk_catalog_a    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_primary_activity_id_5ff3703d_fk_catalog_a FOREIGN KEY (primary_activity_id) REFERENCES public.catalog_activity(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_primary_activity_id_5ff3703d_fk_catalog_a;
       public          postgres    false    254    214    2987            _           2606    57916 Z   catalog_provider_secondary_activity catalog_provider_sec_activity_id_50696e92_fk_catalog_a    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_sec_activity_id_50696e92_fk_catalog_a FOREIGN KEY (activity_id) REFERENCES public.catalog_activity(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_sec_activity_id_50696e92_fk_catalog_a;
       public          postgres    false    256    214    2987            `           2606    57921 Z   catalog_provider_secondary_activity catalog_provider_sec_provider_id_1050e31c_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_sec_provider_id_1050e31c_fk_catalog_p FOREIGN KEY (provider_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_sec_provider_id_1050e31c_fk_catalog_p;
       public          postgres    false    254    256    3081            a           2606    57926 G   catalog_region catalog_region_country_id_fbbe1377_fk_catalog_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_region
    ADD CONSTRAINT catalog_region_country_id_fbbe1377_fk_catalog_country_id FOREIGN KEY (country_id) REFERENCES public.catalog_country(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.catalog_region DROP CONSTRAINT catalog_region_country_id_fbbe1377_fk_catalog_country_id;
       public          postgres    false    3018    258    226            d           2606    57931 T   catalog_rockwallmaterialunit catalog_rockwallmate_algorithm_id_16bdd59b_fk_catalog_a    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_algorithm_id_16bdd59b_fk_catalog_a FOREIGN KEY (algorithm_id) REFERENCES public.catalog_algorithm(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_algorithm_id_16bdd59b_fk_catalog_a;
       public          postgres    false    2992    262    216            e           2606    57936 P   catalog_rockwallmaterialunit catalog_rockwallmate_brand_id_7ba15ba0_fk_catalog_b    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_brand_id_7ba15ba0_fk_catalog_b FOREIGN KEY (brand_id) REFERENCES public.catalog_brand(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_brand_id_7ba15ba0_fk_catalog_b;
       public          postgres    false    218    262    3000            f           2606    57941 \   catalog_rockwallmaterialunit catalog_rockwallmate_class_average_densit_2df62284_fk_catalog_c    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_class_average_densit_2df62284_fk_catalog_c FOREIGN KEY (class_average_density_id) REFERENCES public."catalog_classаveragedensity"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_class_average_densit_2df62284_fk_catalog_c;
       public          postgres    false    262    224    3013            g           2606    57946 R   catalog_rockwallmaterialunit catalog_rockwallmate_class_b_id_6acc8c19_fk_catalog_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_class_b_id_6acc8c19_fk_catalog_c FOREIGN KEY (class_b_id) REFERENCES public.catalog_classb(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_class_b_id_6acc8c19_fk_catalog_c;
       public          postgres    false    262    222    3008            h           2606    57951 O   catalog_rockwallmaterialunit catalog_rockwallmate_face_id_eb3d5342_fk_catalog_d    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_face_id_eb3d5342_fk_catalog_d FOREIGN KEY (face_id) REFERENCES public.catalog_decorativebrickface(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_face_id_eb3d5342_fk_catalog_d;
       public          postgres    false    262    3020    228            i           2606    57956 R   catalog_rockwallmaterialunit catalog_rockwallmate_factory_id_f1af5d55_fk_catalog_f    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_factory_id_f1af5d55_fk_catalog_f FOREIGN KEY (factory_id) REFERENCES public.catalog_factory(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_factory_id_f1af5d55_fk_catalog_f;
       public          postgres    false    262    3033    232            j           2606    57961 Q   catalog_rockwallmaterialunit catalog_rockwallmate_mark_d_id_4fe3b199_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_mark_d_id_4fe3b199_fk_catalog_m FOREIGN KEY (mark_d_id) REFERENCES public.catalog_markd(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_mark_d_id_4fe3b199_fk_catalog_m;
       public          postgres    false    238    262    3045            k           2606    57966 Q   catalog_rockwallmaterialunit catalog_rockwallmate_mark_f_id_3e515b69_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_mark_f_id_3e515b69_fk_catalog_m FOREIGN KEY (mark_f_id) REFERENCES public.catalog_markf(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_mark_f_id_3e515b69_fk_catalog_m;
       public          postgres    false    3050    262    240            l           2606    57971 Q   catalog_rockwallmaterialunit catalog_rockwallmate_mark_m_id_6f18e612_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_mark_m_id_6f18e612_fk_catalog_m FOREIGN KEY (mark_m_id) REFERENCES public.catalog_markm(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_mark_m_id_6f18e612_fk_catalog_m;
       public          postgres    false    242    3055    262            b           2606    57976 P   catalog_rockwallmaterialprice catalog_rockwallmate_name_id_23978ff4_fk_catalog_r    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialprice
    ADD CONSTRAINT catalog_rockwallmate_name_id_23978ff4_fk_catalog_r FOREIGN KEY (name_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.catalog_rockwallmaterialprice DROP CONSTRAINT catalog_rockwallmate_name_id_23978ff4_fk_catalog_r;
       public          postgres    false    3111    262    260            m           2606    57981 V   catalog_rockwallmaterialunit catalog_rockwallmate_sub_brand_1_id_9b7b9a46_fk_catalog_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_sub_brand_1_id_9b7b9a46_fk_catalog_s FOREIGN KEY (sub_brand_1_id) REFERENCES public.catalog_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_sub_brand_1_id_9b7b9a46_fk_catalog_s;
       public          postgres    false    262    264    3119            n           2606    57986 V   catalog_rockwallmaterialunit catalog_rockwallmate_sub_brand_2_id_40f52fd1_fk_catalog_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_sub_brand_2_id_40f52fd1_fk_catalog_s FOREIGN KEY (sub_brand_2_id) REFERENCES public.catalog_subbrand_2(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_sub_brand_2_id_40f52fd1_fk_catalog_s;
       public          postgres    false    266    262    3124            c           2606    57991 ]   catalog_rockwallmaterialprice catalog_rockwallmaterialprice_owner_id_19c1cadb_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialprice
    ADD CONSTRAINT catalog_rockwallmaterialprice_owner_id_19c1cadb_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialprice DROP CONSTRAINT catalog_rockwallmaterialprice_owner_id_19c1cadb_fk_auth_user_id;
       public          postgres    false    2967    208    260            o           2606    57996 K   catalog_subbrand_1 catalog_subbrand_1_brand_id_b77c1599_fk_catalog_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_subbrand_1
    ADD CONSTRAINT catalog_subbrand_1_brand_id_b77c1599_fk_catalog_brand_id FOREIGN KEY (brand_id) REFERENCES public.catalog_brand(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.catalog_subbrand_1 DROP CONSTRAINT catalog_subbrand_1_brand_id_b77c1599_fk_catalog_brand_id;
       public          postgres    false    3000    264    218            p           2606    58001 J   catalog_subbrand_2 catalog_subbrand_2_sub_brand_1_id_0113c49f_fk_catalog_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_subbrand_2
    ADD CONSTRAINT catalog_subbrand_2_sub_brand_1_id_0113c49f_fk_catalog_s FOREIGN KEY (sub_brand_1_id) REFERENCES public.catalog_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.catalog_subbrand_2 DROP CONSTRAINT catalog_subbrand_2_sub_brand_1_id_0113c49f_fk_catalog_s;
       public          postgres    false    266    264    3119            q           2606    58006 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3133    268    270            r           2606    58011 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    2967    268    208            �   ?   x�4 ��1	Клиенты
2	Торговые точки
\.


Z�      �   (   x�3�4�442�2�\� �ؘ��7�2��\1z\\\ �Z5      �   c  x��Y�n�F>�O�csh#R��}�-ю`Y2(�Az���E�nS�R$M�=���v��F���ݝ�(Q��!�(~����η����<q���A2��O�Ѓ�x�G?BH�Q<�OJ�u��a2�@��6x2H���ֳ�$=L&��ȋ�5�����	 yǰm�����q.
$��p]��~:>>��� ~��wμ'�r���!H�\1 �^׭Ǔ$����>>���5��G' �-76�ơ�˶�7Maւ铣�k�����;ܑ��.���'�8>�97htW`C��$ѳ�B��ɏ�zw����jw0r���Zw ��B�J�~��>?��y��k�k�p����H��8y�,Ī/� ��[�%x���]d��gٿ�}v	������`9������G�y����`d�i<�����(�-�(f�%jjK.ʆ�bŷ%���*�~�t�g�^WW�`
�)jU`L� LT����@�[��W��/0ɳ�,?�S6��V!�<�0tqO&�~]��z3�5Y��^oiіV���tld�E�]��\����(`2��y����ś�N�4�O��h�2ֈVD�-��s}Ev6b��Zbn�fo#^��%V�Xo�s���I�H���6/Ū���O`�S�}s�*@I�	���5V�"���FA�gw��A��J��N�|/�M��0"�i[*�ղI�ږ��aٸFm˅ٲLL�^�4��f�^��qz���R�
8���R�
P
��\�
@��`�2!4-q7�~A�����K/l� ��fgE �а����"�M�X�{~�V�&<6;��f��l��~+Z?Y������,�6�c@��pL=~��xQª�Wٟ^�O<������oI)C���@�H��l�����qfj�*.МE��2��81�֛>������x8<��I:��ǣ��oK�yGz�F�Ru�qJ_�\�ޑ�]����/�5�/���JD���/��[��t�K�ư��eP�X��8��Uq�He��cci�
|m^}s���:By�>��>�:��@��v5'�&H���D�	�v�paa�Ο�14|P��y��ۅ��Q:��-�������/��񘞂�iw�Xt��p4Y�m~�E�Ɛ��r�f�Cd{92�4�#�S��ᴃ�b�����_P�$ܝ 4ؾ`�~��+E���e��?˟�K`ߪ������$a?�p݃^?VK��8=�5>�RD?�&��H������t�K�wC�~�L�_��ݛ�^�����]}]���rӐafR��L���q�-7�f�^QMQ�w;k#�6ň���6"mV�(��ZmMH�J��l��kuxQ��n�L
m�%oր�T�*cޝc.�U���M1{��g�e���m�?�;X�W��(��Em�ќ��Zk�v{F���vq�'u[�!��e�=�ُ!����`���s�d�H~�98QM�P��707�M� U����:��j{��t�L�~Ǜڕ=�)�ͿU7��z��ϼHL��Sp̥�m�@Y�$R�6$�DX��R`.,��Wx��Ď�\S��iIՒZ�+*�+��,��4� ���8�p2Z��3��O���7Naw9Ivag9؋{	�-��#Oi/�@��G������'�|t�s�����������|0��l &r�XaEI�r�XaH��|�Xa�!
#�S��|գ�wN��;DӺ�&�ɝ��l�-���PE��z	D�B���j?)�d�^/,"(�Tű�4M���54K��Dż�!),CQ�`K�6l 9�@�����s��x�3I�;&�;���{z�PQ�7�>#7�Xt�׬i:�C�6�Q���O@���$�|vv�d�
�����G� m�r|z{���_}�����u<�      �   �  x�u�Ko�0 �3�=p���Ʀ�T��W����U�x$��P���h��j��`ɶF�yf �{���>��E�g� �bk���%�M챋��ȴ�R���Z�o~��O���AY��ab(v�-��	w@� �0�`Q��7H��0��� ���Q2*?�K�7������D����;�������ͷ�Qf�mtpڃXƯ�o�ӷzؘ�5�ƻ3�-���A�=jG�yי#�ʬMe]>Ҭ���}��'T����A�ۉn`��W��=��v��X��\w.�joIl��.���t�uh�l�l�iti%����8��F�����ŢQ�W�����u�����}�t��)�ǵ:�&{m!��܀`\V�vO	�����S4��n]k�!	b�wOp?�r�� ٥�xv�=����t�Du��ɧ8C��W5܄�ZN��	fߠ��� K+7���?��S#:-�#����/�˟      �   "   x�3�4�4�2�4�Ɯ&@҄ӔӐ+F��� 4�x      �      x������ � �          B   x�3�,)JLI弰�¾�6_�waӅ����8SRs2�R�*9/L�5^l��(����=... ��*         �   x�3�,�/�/�H-ʍ71��qLL��83�sr���S�s3�㓊2��9/̺��bÅ�@�]�®[�����@v#Pdǅ�
�_l��x���> �za���;�9��s2S�4�¾�/�E10F��� ��m5         �   x�3��L�K-JJ-JO-�2�0���[/��$�^��w]�p�_Hm��paÅ=v����9/L���b����^��v��� ��$ہ�� ��@m�.컰�˄3��8�˔3(?9[!<??�+F��� ��Ms         �   x�=���0���.����-���8p�8"��*EDA+<o�kUU�/�ޏ<t�3�8N\O4���`^�ߐ�����z�û(]���7McBZ�����Ld�Ȩę3����W��W�NzC��q),�ч&a�5���W�            x������ � �      
      x������ � �            x�3估�¾��/������� sL	w            x������ � �            x������ � �         n   x�u���@c�
*@:����	H!U��$8����X;����/��a��a��N.i^u~�%�6T*���r�0J��c��d8�ߪ�5�c\T趌��='X�         <   x�3�4�306�((�46�4�2B0	�L8������s@��\&袆 �=... �J{         ?   x�%���@�7�Z�\.�?q�����"�b�l�����G��uh�������P�w��`��            x������ � �            x������ � �            x������ � �            x������ � �             x������ � �      "   X  x��S]O�0}�_ax�K��~Ĳ�d1�h\l	tι�ߥ-��@1�����8�=��\��%;�9�K�^pJӀ��	U5��Ax�M03����2^)*��K�ca��;�<o~:�a���3���M���9���sr�2)ݳ\�@cԳ�Y�2��Y�D����
Z*��ג[�ӂ��8vh^wੁӛ���; b//$�T�9�j��b���vn�8&nm<G:��:�����& ��jK��,����zc�\��X�,��[�Υ"���b�P]��!�V�c�[���bG7\�l����b�7wc\�?�n�4��0h&dH��4�LpW
%(�M���r��      >      x������ � �      $   '   x�3�4�4�2�4�ƜƜ&\&�&@�)�)������ K�+      &      x�3�4�4�2�4�Ɯ&��\1z\\\ !��      (   C   x�3估�b�ņ�.�0H�[8��8/̾��b���.�1/쾰��^�\� ^P!�      *      x�3�4�4�2�B�=... %      ,   a   x���	�0C��O�B-��8�֫Pp]@�����72=�@^'�qZ�&���׋�Np ��B�-��{������;�����ꑭ�=�c��?��7x      .   C   x���� ���0=B(�t�9j^�Yv�`jCfJE��R���Zd���l����g:�����6!      0   �   x�����  ����8@�z����!��P�p�}b.����Ǝc��;Ƚ�7�ڋ�H��2���'N�q�"j�4�ZxSP;kT�߽)�o�t"�)
�KP�Ns{��|uֺ�:,�uݻ�6M����	�����Jwǟ�FX�Ύ��atj���.�t�	���^�����V�Q�s�]�nD���~���z���F���'��"      2   #   x�3��/�/�H-��4�2�qrv�b���� y�      4   8   x�3�41�4�2�tu�WwsQ03�73�4�2�ts�,@<N��������� ;�
=      6   �	  x��Z�n[�����@W)�lwgw��wnj��I� �/R�`D�&,���� �N_8@��Wi�4��N�(�+���u��!E��1� �,S2�ͷ�����H��Kxl��Pڡq"��R��*����������?��Ǔ��0���Oo�HQ�P!��JW(�./�����-�׀��tK;�^������	�A��ԑ�	���b�51���,�h@	�)H`:�X���U<m�	�RC���*�� zP|E~P<-ΈG;�K��P{�5�j����g�w�y�x��OH>E�/+��K��:�	{܆�HZ%�SXq�v�8�?2f���0�o�s������U�	St�U��1�M�&��I�cF�0��/�E��W��zJ��	�C�`�R��v��
�_��b�l�EV� �96\
��l4�M���(6�7�X��Р�Rא��(wFG�#�ޟ����1�|�w�����v��$�����^N?Ϗ�����N&3z5:��O�n.sO�Ւ�p��F{DS�p��?�M�����$�&�A�ʻ�TM������xF�jԊ2]lQi��X��A
V�޷m�Cb�}b�l�Te�̀8��&0r�.����1B���t;A�A6C�t��
A%H�5B��ίr����ң��hƁ:���������Qq����Y?�@���rEAj���{���/���jz�x��f.����{�R�,�SC��������nl6?>��R1�u,M�U�ת��y��M-��Ax�C�R���,���Ѹ��KAG(k�6������Z	t��+̦w�m�B�(jQ����K��Rg�c��;����V>��t<�#�RE��s+�2�j�؁KkfF�P7Js�F�B�][�N�h�V�4�Ia%��Q��Z{�DKi�rw, ��җ�|>%]>�?OJ}>/N[�Y�E�M��U;�TiB|Ld�V�Ǥ�gms<:-�ض�ˉ���Y�c�LϢ�Ӣ�����8}�W�c�gD�}H�~Ŀ���#ϛ羒Z�l��[�n�[��Ӛ׊�3���,��R3������ƾ��3i��1b�(]@�� �����^
_�4i�j��N$/<���,y�n�H�s�G��Cz��7��H� uSG~�ۋ�|V� ���6G��G8��$��e��9�%��i�i*:%�q����R�_磣q��h4�K5h���u��~�A>=���Ф<��g�r���f�锼,��"5e7�i�6ۮ,���f�␧KRL4�N5xk��O�L�YS�p�3�������A�kx3�C�ͨ�Z�jzs~4�����጑�	�1m�C���dh�hl���V��-K<U�C�j/h{T���������<��JВ���C�AIߧ*vt�N��r'@� *Z7?�):������ �ay��o�^Ӳi��܋SGcF��-����6�0�5\mTl�o�s��y�HP%-%�,�NC̍D7�����)ME=��dRZ[<}"Rkv�1�L���pa۴|���	�������~�jg¾���̴��zo�@�ko�!�q�7�Z�j�R7l��hh��Q@�*b��k����Km����4�b5�mW�]��U�M9��X�M�^ׯ��>��>K�m�U�v�s�J�n���n��p�1���SJ�� �1�=σ	դ�kd�Y��fi7+��-/�@Z�V��;�lYЫ���P�|�nC�D�!(��U���E��:	�n�*��;��to|���s��/8�Vͯ�'���!��h)���*g/K*�3�/=���2�J)k.�Љ�ce꬐�kU�Ǽ��e��SB��3�cT�\ɬ��l���|�+�h���
r[G������אLidE�8/�X.�U(�@�*m2�킞j%��T�j�k�i���)��S�#\�d���]�Yg�7�4�|������,Z�C_��T���R�w`�t�t���H�Bd��%��Dm�TM�Gb����[?B�Mm�Y�)�Z\�؎'�w��KO����ꦸ�g{Z�8�8��x����fE{~�#�w��|b�W��1��ĝ�Ex��Q-�d�˳�k���0�<�'�k�A�v<�@6,�Do�L���R4}�.�nM�Q�K����7|�M�༺�~/XWw����ƛ׆����6���G��n���˘��r���<��ܙ��AA��?��-�|�����:���X�/Sl�6o��Vhk�vQ,���Xۜz;bF����.>����d��ʲ���gu��3���j��Wp��v�4�S��o*P)i�5iuŚ5^��I�(ܱ V�� �㢯�Ky]�Q�mC�Pub���O/�Z*����F?y�٘��.��t�������X��R��D
�@������{���9��4��x���*b��Í�l6U��Q���H�`_5T4����[������{'�ߏ'G'S�E�:���ZH���U��~vg~x8��bypAriݦ�?kE	����`G�Q\�r��.�      8   K  x�}�[n� E���T���R�a� c@8JWեtI�Nkb���Ø{���ԣq��]�&s���4��w�ܕ�|��9"��)�RK���#��L��81%�,�0i{O&]Fx^���ӯ;8��2�|Wk+cl����>!�5��L���yA��*uR%?K�U%�a#t��a^\���ɫ�*�eB2�fg���@Fa���������T�@�3AT�`e9R�B��d�-9tZ���WO�rOQqcn�Ys��� q�.����dtY���%Q3�ɋ��s����\��bk¶X��
i\�vq��?5h�_ƾZ�MF�R>&xy�O$U�      :   �  x����n�8��ӧ��b����, ������L�闒GvRd� �H�g��2��8��4}��B@h�������~�te���>O��QЮ���s��H�D�$�������g��>������0$B�tC�,�����������ۆ���$$��3��\~�p��1J!�l�Y��PwS�)�vSII�����;��C��]PtA�G�����R��2���,)�+�ӟ�o��n�C����d}�';w�z��T�E��?���؛}ɴo �
���\J���v_O�0���a�p��X��x���8Zp��;Olb��Ԁ\H�Σ�BI6�f���@\P�C>�F�+F/�[�i�����3��̮���{�l�M��$=?���x�?�i�b���a8�$�:�z�[��H���ʛK� ��m�$z�+e-�#�z��g;}%�>�}6r弔�4����X�U��S��Hz��tjps�J�^m ���zT�6�Zc^^(K��H�\��JT�(r�U	�[�&�hO�����s��V �G�����C��c�;�e�R�7 	�T)���F���l|�k�������:;7��,��{��v�o{��f���MWK�d��[I)�$*��=�v�����Z̀2� ��7������C<�$�y��[���W�2�引�L$�m!
םQ�W.��ec�L'諱�zؤ&��1۳B�dO	�\�;�ʼ�y��2�����s��2�`����6 �M�Itv6��,�E��:/Ƴ�
+)$#2��,�Eր��'��5��"lN�3�Ҷ���@��en�\�Ļ��F_ ğ|�U���,C�N]}c��w�W O,Ui�Ԭ,Ӊ2+ޓM?N��&(�f.Z��D5?���j���J�R��UJ��,.È�$�[�3PҞQ��B�l�������Ĉ�#      <   D  x���͎�0��^����� �Y��bK$(��?j)�2�/��]�U��M��3��;�q1:�a�Ա��e�< ��9uX�N���IP3I�,�
�qIt$Co� �b
��z�C���e�Rkkx�d]����{���K�/S�
�V,��<qj_�*�lD���J�[~��,�,ݢl��uE��"����r��V�`��..`ۦ D��C������e�2�#�*�JI�y\c"�"���1��0Ls��{�>��z؞��Ĳ`��7du���lv��H���.���at���e�7���{�Y=�N0��h��A��t����Ч     