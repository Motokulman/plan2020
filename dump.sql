PGDMP                         x         	   postgres2    12.1    12.1 f              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    49304 	   postgres2    DATABASE     �   CREATE DATABASE postgres2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE postgres2;
                postgres    false            �            1259    49305 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    49308    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    202                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    203            �            1259    49310    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    49313    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    204                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    205            �            1259    49315    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    49318    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    206            	           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    207            �            1259    49320 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    postgres    false            �            1259    49326    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    49329    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    209            
           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    210            �            1259    49331    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    208                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    211            �            1259    49333    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    49336 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    212                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    213            �            1259    49338    catalog_activity    TABLE     �   CREATE TABLE public.catalog_activity (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 $   DROP TABLE public.catalog_activity;
       public         heap    postgres    false            �            1259    49341    catalog_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.catalog_activity_id_seq;
       public          postgres    false    214                       0    0    catalog_activity_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.catalog_activity_id_seq OWNED BY public.catalog_activity.id;
          public          postgres    false    215            �            1259    49343    catalog_algorithm    TABLE     �   CREATE TABLE public.catalog_algorithm (
    id integer NOT NULL,
    var_name character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 %   DROP TABLE public.catalog_algorithm;
       public         heap    postgres    false            �            1259    49346    catalog_algorithm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_algorithm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.catalog_algorithm_id_seq;
       public          postgres    false    216                       0    0    catalog_algorithm_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.catalog_algorithm_id_seq OWNED BY public.catalog_algorithm.id;
          public          postgres    false    217            �            1259    49348    catalog_brand    TABLE     i   CREATE TABLE public.catalog_brand (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
 !   DROP TABLE public.catalog_brand;
       public         heap    postgres    false            �            1259    49351    catalog_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_brand_id_seq;
       public          postgres    false    218                       0    0    catalog_brand_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_brand_id_seq OWNED BY public.catalog_brand.id;
          public          postgres    false    219            �            1259    49353    catalog_city    TABLE     �   CREATE TABLE public.catalog_city (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    region_id integer,
    heating_period_duration integer,
    heating_period_temperature double precision
);
     DROP TABLE public.catalog_city;
       public         heap    postgres    false            �            1259    49356    catalog_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.catalog_city_id_seq;
       public          postgres    false    220                       0    0    catalog_city_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_city_id_seq OWNED BY public.catalog_city.id;
          public          postgres    false    221            �            1259    49358    catalog_classb    TABLE     �   CREATE TABLE public.catalog_classb (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 "   DROP TABLE public.catalog_classb;
       public         heap    postgres    false            �            1259    49361    catalog_classb_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_classb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.catalog_classb_id_seq;
       public          postgres    false    222                       0    0    catalog_classb_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.catalog_classb_id_seq OWNED BY public.catalog_classb.id;
          public          postgres    false    223            �            1259    49363    catalog_classаveragedensity    TABLE     �   CREATE TABLE public."catalog_classаveragedensity" (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 2   DROP TABLE public."catalog_classаveragedensity";
       public         heap    postgres    false            �            1259    49366 #   catalog_classаveragedensity_id_seq    SEQUENCE     �   CREATE SEQUENCE public."catalog_classаveragedensity_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."catalog_classаveragedensity_id_seq";
       public          postgres    false    224                       0    0 #   catalog_classаveragedensity_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."catalog_classаveragedensity_id_seq" OWNED BY public."catalog_classаveragedensity".id;
          public          postgres    false    225            �            1259    49368    catalog_country    TABLE     b   CREATE TABLE public.catalog_country (
    id integer NOT NULL,
    name character varying(200)
);
 #   DROP TABLE public.catalog_country;
       public         heap    postgres    false            �            1259    49371    catalog_country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.catalog_country_id_seq;
       public          postgres    false    226                       0    0    catalog_country_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.catalog_country_id_seq OWNED BY public.catalog_country.id;
          public          postgres    false    227            �            1259    49373    catalog_factory    TABLE     �   CREATE TABLE public.catalog_factory (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    city_id integer,
    brand_id integer
);
 #   DROP TABLE public.catalog_factory;
       public         heap    postgres    false            �            1259    49376    catalog_factory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_factory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.catalog_factory_id_seq;
       public          postgres    false    228                       0    0    catalog_factory_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.catalog_factory_id_seq OWNED BY public.catalog_factory.id;
          public          postgres    false    229            �            1259    49378    catalog_markd    TABLE     �   CREATE TABLE public.catalog_markd (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 !   DROP TABLE public.catalog_markd;
       public         heap    postgres    false            �            1259    49381    catalog_markd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_markd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_markd_id_seq;
       public          postgres    false    230                       0    0    catalog_markd_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markd_id_seq OWNED BY public.catalog_markd.id;
          public          postgres    false    231            �            1259    49383    catalog_markf    TABLE     �   CREATE TABLE public.catalog_markf (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 !   DROP TABLE public.catalog_markf;
       public         heap    postgres    false            �            1259    49386    catalog_markf_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_markf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_markf_id_seq;
       public          postgres    false    232                       0    0    catalog_markf_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markf_id_seq OWNED BY public.catalog_markf.id;
          public          postgres    false    233            �            1259    49388    catalog_markm    TABLE     �   CREATE TABLE public.catalog_markm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(5) NOT NULL
);
 !   DROP TABLE public.catalog_markm;
       public         heap    postgres    false            �            1259    49391    catalog_markm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_markm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_markm_id_seq;
       public          postgres    false    234                       0    0    catalog_markm_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markm_id_seq OWNED BY public.catalog_markm.id;
          public          postgres    false    235            �            1259    49393    catalog_nfsize    TABLE     �   CREATE TABLE public.catalog_nfsize (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    greater_bed_size integer,
    minor_bed_size integer,
    height integer
);
 "   DROP TABLE public.catalog_nfsize;
       public         heap    postgres    false            �            1259    49396    catalog_nfsize_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_nfsize_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.catalog_nfsize_id_seq;
       public          postgres    false    236                       0    0    catalog_nfsize_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.catalog_nfsize_id_seq OWNED BY public.catalog_nfsize.id;
          public          postgres    false    237            �            1259    49398    catalog_outlet    TABLE     b   CREATE TABLE public.catalog_outlet (
    id integer NOT NULL,
    provider_id integer NOT NULL
);
 "   DROP TABLE public.catalog_outlet;
       public         heap    postgres    false            �            1259    49401    catalog_outlet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_outlet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.catalog_outlet_id_seq;
       public          postgres    false    238                       0    0    catalog_outlet_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.catalog_outlet_id_seq OWNED BY public.catalog_outlet.id;
          public          postgres    false    239            �            1259    49403 (   catalog_pilegrillagefoundationworkprices    TABLE     �  CREATE TABLE public.catalog_pilegrillagefoundationworkprices (
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
       public         heap    postgres    false            �            1259    49406 /   catalog_pilegrillagefoundationworkprices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_pilegrillagefoundationworkprices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.catalog_pilegrillagefoundationworkprices_id_seq;
       public          postgres    false    240                       0    0 /   catalog_pilegrillagefoundationworkprices_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.catalog_pilegrillagefoundationworkprices_id_seq OWNED BY public.catalog_pilegrillagefoundationworkprices.id;
          public          postgres    false    241            �            1259    49408    catalog_plan    TABLE     �   CREATE TABLE public.catalog_plan (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    author_id integer
);
     DROP TABLE public.catalog_plan;
       public         heap    postgres    false            �            1259    49411    catalog_plan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.catalog_plan_id_seq;
       public          postgres    false    242                       0    0    catalog_plan_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_plan_id_seq OWNED BY public.catalog_plan.id;
          public          postgres    false    243            �            1259    49413    catalog_profile    TABLE     �   CREATE TABLE public.catalog_profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    city_id integer,
    primary_or_additional character varying(10) NOT NULL
);
 #   DROP TABLE public.catalog_profile;
       public         heap    postgres    false            �            1259    49416    catalog_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.catalog_profile_id_seq;
       public          postgres    false    244                       0    0    catalog_profile_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.catalog_profile_id_seq OWNED BY public.catalog_profile.id;
          public          postgres    false    245                       1259    49869    catalog_profile_outlet    TABLE     �   CREATE TABLE public.catalog_profile_outlet (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    outlet_id integer NOT NULL
);
 *   DROP TABLE public.catalog_profile_outlet;
       public         heap    postgres    false                       1259    49867    catalog_profile_outlet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_profile_outlet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.catalog_profile_outlet_id_seq;
       public          postgres    false    268                       0    0    catalog_profile_outlet_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.catalog_profile_outlet_id_seq OWNED BY public.catalog_profile_outlet.id;
          public          postgres    false    267            �            1259    49418    catalog_provider    TABLE     �   CREATE TABLE public.catalog_provider (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    primary_activity_id integer
);
 $   DROP TABLE public.catalog_provider;
       public         heap    postgres    false            �            1259    49421    catalog_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.catalog_provider_id_seq;
       public          postgres    false    246                       0    0    catalog_provider_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.catalog_provider_id_seq OWNED BY public.catalog_provider.id;
          public          postgres    false    247            �            1259    49423 #   catalog_provider_secondary_activity    TABLE     �   CREATE TABLE public.catalog_provider_secondary_activity (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    activity_id integer NOT NULL
);
 7   DROP TABLE public.catalog_provider_secondary_activity;
       public         heap    postgres    false            �            1259    49426 *   catalog_provider_secondary_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_provider_secondary_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.catalog_provider_secondary_activity_id_seq;
       public          postgres    false    248                       0    0 *   catalog_provider_secondary_activity_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.catalog_provider_secondary_activity_id_seq OWNED BY public.catalog_provider_secondary_activity.id;
          public          postgres    false    249            �            1259    49428    catalog_region    TABLE     �   CREATE TABLE public.catalog_region (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    code integer,
    country_id integer
);
 "   DROP TABLE public.catalog_region;
       public         heap    postgres    false            �            1259    49431    catalog_region_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.catalog_region_id_seq;
       public          postgres    false    250                        0    0    catalog_region_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.catalog_region_id_seq OWNED BY public.catalog_region.id;
          public          postgres    false    251            �            1259    49433 %   catalog_rockwallmaterialpriceposition    TABLE     �   CREATE TABLE public.catalog_rockwallmaterialpriceposition (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 9   DROP TABLE public.catalog_rockwallmaterialpriceposition;
       public         heap    postgres    false            �            1259    49436 ,   catalog_rockwallmaterialpriceposition_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialpriceposition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.catalog_rockwallmaterialpriceposition_id_seq;
       public          postgres    false    252            !           0    0 ,   catalog_rockwallmaterialpriceposition_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.catalog_rockwallmaterialpriceposition_id_seq OWNED BY public.catalog_rockwallmaterialpriceposition.id;
          public          postgres    false    253            �            1259    49438    catalog_rockwallmaterialunit    TABLE     M  CREATE TABLE public.catalog_rockwallmaterialunit (
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
    thermal_conductivity integer,
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
    sub_brand_2_id integer
);
 0   DROP TABLE public.catalog_rockwallmaterialunit;
       public         heap    postgres    false            �            1259    49441 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.catalog_rockwallmaterialunit_id_seq;
       public          postgres    false    254            "           0    0 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.catalog_rockwallmaterialunit_id_seq OWNED BY public.catalog_rockwallmaterialunit.id;
          public          postgres    false    255                        1259    49443    catalog_subbrand_1    TABLE     �   CREATE TABLE public.catalog_subbrand_1 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    brand_id integer
);
 &   DROP TABLE public.catalog_subbrand_1;
       public         heap    postgres    false                       1259    49446    catalog_subbrand_1_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_subbrand_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.catalog_subbrand_1_id_seq;
       public          postgres    false    256            #           0    0    catalog_subbrand_1_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.catalog_subbrand_1_id_seq OWNED BY public.catalog_subbrand_1.id;
          public          postgres    false    257                       1259    49448    catalog_subbrand_2    TABLE     �   CREATE TABLE public.catalog_subbrand_2 (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    sub_brand_1_id integer NOT NULL
);
 &   DROP TABLE public.catalog_subbrand_2;
       public         heap    postgres    false                       1259    49451    catalog_subbrand_2_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_subbrand_2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.catalog_subbrand_2_id_seq;
       public          postgres    false    258            $           0    0    catalog_subbrand_2_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.catalog_subbrand_2_id_seq OWNED BY public.catalog_subbrand_2.id;
          public          postgres    false    259                       1259    49453    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false                       1259    49460    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    260            %           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    261                       1259    49462    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false                       1259    49465    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    262            &           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    263                       1259    49467    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            	           1259    49473    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    264            '           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    265            
           1259    49475    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            G           2604    49481    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            H           2604    49482    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            I           2604    49483    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            J           2604    49484    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    208            K           2604    49485    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            L           2604    49486    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            M           2604    49487    catalog_activity id    DEFAULT     z   ALTER TABLE ONLY public.catalog_activity ALTER COLUMN id SET DEFAULT nextval('public.catalog_activity_id_seq'::regclass);
 B   ALTER TABLE public.catalog_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            N           2604    49488    catalog_algorithm id    DEFAULT     |   ALTER TABLE ONLY public.catalog_algorithm ALTER COLUMN id SET DEFAULT nextval('public.catalog_algorithm_id_seq'::regclass);
 C   ALTER TABLE public.catalog_algorithm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            O           2604    49489    catalog_brand id    DEFAULT     t   ALTER TABLE ONLY public.catalog_brand ALTER COLUMN id SET DEFAULT nextval('public.catalog_brand_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            P           2604    49490    catalog_city id    DEFAULT     r   ALTER TABLE ONLY public.catalog_city ALTER COLUMN id SET DEFAULT nextval('public.catalog_city_id_seq'::regclass);
 >   ALTER TABLE public.catalog_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            Q           2604    49491    catalog_classb id    DEFAULT     v   ALTER TABLE ONLY public.catalog_classb ALTER COLUMN id SET DEFAULT nextval('public.catalog_classb_id_seq'::regclass);
 @   ALTER TABLE public.catalog_classb ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            R           2604    49492    catalog_classаveragedensity id    DEFAULT     �   ALTER TABLE ONLY public."catalog_classаveragedensity" ALTER COLUMN id SET DEFAULT nextval('public."catalog_classаveragedensity_id_seq"'::regclass);
 P   ALTER TABLE public."catalog_classаveragedensity" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            S           2604    49493    catalog_country id    DEFAULT     x   ALTER TABLE ONLY public.catalog_country ALTER COLUMN id SET DEFAULT nextval('public.catalog_country_id_seq'::regclass);
 A   ALTER TABLE public.catalog_country ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            T           2604    49494    catalog_factory id    DEFAULT     x   ALTER TABLE ONLY public.catalog_factory ALTER COLUMN id SET DEFAULT nextval('public.catalog_factory_id_seq'::regclass);
 A   ALTER TABLE public.catalog_factory ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228            U           2604    49495    catalog_markd id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markd ALTER COLUMN id SET DEFAULT nextval('public.catalog_markd_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markd ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230            V           2604    49496    catalog_markf id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markf ALTER COLUMN id SET DEFAULT nextval('public.catalog_markf_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markf ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232            W           2604    49497    catalog_markm id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markm ALTER COLUMN id SET DEFAULT nextval('public.catalog_markm_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234            X           2604    49498    catalog_nfsize id    DEFAULT     v   ALTER TABLE ONLY public.catalog_nfsize ALTER COLUMN id SET DEFAULT nextval('public.catalog_nfsize_id_seq'::regclass);
 @   ALTER TABLE public.catalog_nfsize ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236            Y           2604    49499    catalog_outlet id    DEFAULT     v   ALTER TABLE ONLY public.catalog_outlet ALTER COLUMN id SET DEFAULT nextval('public.catalog_outlet_id_seq'::regclass);
 @   ALTER TABLE public.catalog_outlet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238            Z           2604    49500 +   catalog_pilegrillagefoundationworkprices id    DEFAULT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices ALTER COLUMN id SET DEFAULT nextval('public.catalog_pilegrillagefoundationworkprices_id_seq'::regclass);
 Z   ALTER TABLE public.catalog_pilegrillagefoundationworkprices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240            [           2604    49501    catalog_plan id    DEFAULT     r   ALTER TABLE ONLY public.catalog_plan ALTER COLUMN id SET DEFAULT nextval('public.catalog_plan_id_seq'::regclass);
 >   ALTER TABLE public.catalog_plan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242            \           2604    49502    catalog_profile id    DEFAULT     x   ALTER TABLE ONLY public.catalog_profile ALTER COLUMN id SET DEFAULT nextval('public.catalog_profile_id_seq'::regclass);
 A   ALTER TABLE public.catalog_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244            h           2604    49872    catalog_profile_outlet id    DEFAULT     �   ALTER TABLE ONLY public.catalog_profile_outlet ALTER COLUMN id SET DEFAULT nextval('public.catalog_profile_outlet_id_seq'::regclass);
 H   ALTER TABLE public.catalog_profile_outlet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267    268            ]           2604    49503    catalog_provider id    DEFAULT     z   ALTER TABLE ONLY public.catalog_provider ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_id_seq'::regclass);
 B   ALTER TABLE public.catalog_provider ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246            ^           2604    49504 &   catalog_provider_secondary_activity id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_secondary_activity_id_seq'::regclass);
 U   ALTER TABLE public.catalog_provider_secondary_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248            _           2604    49505    catalog_region id    DEFAULT     v   ALTER TABLE ONLY public.catalog_region ALTER COLUMN id SET DEFAULT nextval('public.catalog_region_id_seq'::regclass);
 @   ALTER TABLE public.catalog_region ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250            `           2604    49506 (   catalog_rockwallmaterialpriceposition id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialpriceposition_id_seq'::regclass);
 W   ALTER TABLE public.catalog_rockwallmaterialpriceposition ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252            a           2604    49507    catalog_rockwallmaterialunit id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_id_seq'::regclass);
 N   ALTER TABLE public.catalog_rockwallmaterialunit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254            b           2604    49508    catalog_subbrand_1 id    DEFAULT     ~   ALTER TABLE ONLY public.catalog_subbrand_1 ALTER COLUMN id SET DEFAULT nextval('public.catalog_subbrand_1_id_seq'::regclass);
 D   ALTER TABLE public.catalog_subbrand_1 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256            c           2604    49509    catalog_subbrand_2 id    DEFAULT     ~   ALTER TABLE ONLY public.catalog_subbrand_2 ALTER COLUMN id SET DEFAULT nextval('public.catalog_subbrand_2_id_seq'::regclass);
 D   ALTER TABLE public.catalog_subbrand_2 ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258            d           2604    49510    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260            f           2604    49511    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    262            g           2604    49512    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264            �          0    49305 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    202   �      �          0    49310    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    204   ��      �          0    49315    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    206   ��      �          0    49320 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    208   ��      �          0    49326    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    209   ��      �          0    49333    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    212   ��      �          0    49338    catalog_activity 
   TABLE DATA           @   COPY public.catalog_activity (id, identifier, name) FROM stdin;
    public          postgres    false    214   ��      �          0    49343    catalog_algorithm 
   TABLE DATA           ?   COPY public.catalog_algorithm (id, var_name, name) FROM stdin;
    public          postgres    false    216   �      �          0    49348    catalog_brand 
   TABLE DATA           1   COPY public.catalog_brand (id, name) FROM stdin;
    public          postgres    false    218   ;�      �          0    49353    catalog_city 
   TABLE DATA           p   COPY public.catalog_city (id, name, region_id, heating_period_duration, heating_period_temperature) FROM stdin;
    public          postgres    false    220   g�      �          0    49358    catalog_classb 
   TABLE DATA           >   COPY public.catalog_classb (id, identifier, name) FROM stdin;
    public          postgres    false    222   ��      �          0    49363    catalog_classаveragedensity 
   TABLE DATA           N   COPY public."catalog_classаveragedensity" (id, identifier, name) FROM stdin;
    public          postgres    false    224   ��      �          0    49368    catalog_country 
   TABLE DATA           3   COPY public.catalog_country (id, name) FROM stdin;
    public          postgres    false    226   ��      �          0    49373    catalog_factory 
   TABLE DATA           F   COPY public.catalog_factory (id, name, city_id, brand_id) FROM stdin;
    public          postgres    false    228   *�      �          0    49378    catalog_markd 
   TABLE DATA           =   COPY public.catalog_markd (id, identifier, name) FROM stdin;
    public          postgres    false    230   G�      �          0    49383    catalog_markf 
   TABLE DATA           =   COPY public.catalog_markf (id, identifier, name) FROM stdin;
    public          postgres    false    232   d�      �          0    49388    catalog_markm 
   TABLE DATA           =   COPY public.catalog_markm (id, identifier, name) FROM stdin;
    public          postgres    false    234   ��      �          0    49393    catalog_nfsize 
   TABLE DATA           h   COPY public.catalog_nfsize (id, identifier, name, greater_bed_size, minor_bed_size, height) FROM stdin;
    public          postgres    false    236   ��      �          0    49398    catalog_outlet 
   TABLE DATA           9   COPY public.catalog_outlet (id, provider_id) FROM stdin;
    public          postgres    false    238   ��      �          0    49403 (   catalog_pilegrillagefoundationworkprices 
   TABLE DATA             COPY public.catalog_pilegrillagefoundationworkprices (id, const_expenditure, transportation_procurement_cost, reinforcement_binding, clamp, pile_frame, formwork, length_costs, square_costs, volume_costs, pile_pour, man_hours_cost, man_hours_profit, owner_id) FROM stdin;
    public          postgres    false    240   ��      �          0    49408    catalog_plan 
   TABLE DATA           <   COPY public.catalog_plan (id, title, author_id) FROM stdin;
    public          postgres    false    242   ��      �          0    49413    catalog_profile 
   TABLE DATA           V   COPY public.catalog_profile (id, user_id, city_id, primary_or_additional) FROM stdin;
    public          postgres    false    244   $�                 0    49869    catalog_profile_outlet 
   TABLE DATA           K   COPY public.catalog_profile_outlet (id, profile_id, outlet_id) FROM stdin;
    public          postgres    false    268   N�      �          0    49418    catalog_provider 
   TABLE DATA           I   COPY public.catalog_provider (id, name, primary_activity_id) FROM stdin;
    public          postgres    false    246   k�      �          0    49423 #   catalog_provider_secondary_activity 
   TABLE DATA           [   COPY public.catalog_provider_secondary_activity (id, provider_id, activity_id) FROM stdin;
    public          postgres    false    248   ��      �          0    49428    catalog_region 
   TABLE DATA           D   COPY public.catalog_region (id, name, code, country_id) FROM stdin;
    public          postgres    false    250   ��      �          0    49433 %   catalog_rockwallmaterialpriceposition 
   TABLE DATA           ]   COPY public.catalog_rockwallmaterialpriceposition (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    252   �      �          0    49438    catalog_rockwallmaterialunit 
   TABLE DATA           *  COPY public.catalog_rockwallmaterialunit (id, name, material, greater_bed_size, minor_bed_size, height, min_pix_1_floor, min_pix_2_floor, min_pix_3_floor, work_size_1, num_floors_on_work_size_1, work_size_2, num_floors_on_work_size_2, work_size_3, num_floors_on_work_size_3, thermal_conductivity, tongue_and_groove, polish, purpose, partition_or_bearing, body_type, blind_hollow, primary_or_additional, algorithm_id, class_average_density_id, class_b_id, factory_id, mark_d_id, mark_f_id, mark_m_id, brand_id, sub_brand_1_id, sub_brand_2_id) FROM stdin;
    public          postgres    false    254   .�      �          0    49443    catalog_subbrand_1 
   TABLE DATA           @   COPY public.catalog_subbrand_1 (id, name, brand_id) FROM stdin;
    public          postgres    false    256   K�      �          0    49448    catalog_subbrand_2 
   TABLE DATA           F   COPY public.catalog_subbrand_2 (id, name, sub_brand_1_id) FROM stdin;
    public          postgres    false    258   h�      �          0    49453    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    260   ��      �          0    49462    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    262   m�      �          0    49467    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    264   ��      �          0    49475    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    266   ��      (           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    203            )           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    205            *           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 116, true);
          public          postgres    false    207            +           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    210            ,           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    211            -           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    213            .           0    0    catalog_activity_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.catalog_activity_id_seq', 2, true);
          public          postgres    false    215            /           0    0    catalog_algorithm_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalog_algorithm_id_seq', 1, false);
          public          postgres    false    217            0           0    0    catalog_brand_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.catalog_brand_id_seq', 1, true);
          public          postgres    false    219            1           0    0    catalog_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.catalog_city_id_seq', 3, true);
          public          postgres    false    221            2           0    0    catalog_classb_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalog_classb_id_seq', 1, false);
          public          postgres    false    223            3           0    0 #   catalog_classаveragedensity_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."catalog_classаveragedensity_id_seq"', 1, false);
          public          postgres    false    225            4           0    0    catalog_country_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalog_country_id_seq', 1, true);
          public          postgres    false    227            5           0    0    catalog_factory_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.catalog_factory_id_seq', 1, false);
          public          postgres    false    229            6           0    0    catalog_markd_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_markd_id_seq', 1, false);
          public          postgres    false    231            7           0    0    catalog_markf_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_markf_id_seq', 1, false);
          public          postgres    false    233            8           0    0    catalog_markm_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_markm_id_seq', 1, false);
          public          postgres    false    235            9           0    0    catalog_nfsize_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalog_nfsize_id_seq', 1, false);
          public          postgres    false    237            :           0    0    catalog_outlet_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_outlet_id_seq', 1, true);
          public          postgres    false    239            ;           0    0 /   catalog_pilegrillagefoundationworkprices_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.catalog_pilegrillagefoundationworkprices_id_seq', 1, false);
          public          postgres    false    241            <           0    0    catalog_plan_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.catalog_plan_id_seq', 1, true);
          public          postgres    false    243            =           0    0    catalog_profile_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalog_profile_id_seq', 1, true);
          public          postgres    false    245            >           0    0    catalog_profile_outlet_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.catalog_profile_outlet_id_seq', 1, false);
          public          postgres    false    267            ?           0    0    catalog_provider_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.catalog_provider_id_seq', 1, true);
          public          postgres    false    247            @           0    0 *   catalog_provider_secondary_activity_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.catalog_provider_secondary_activity_id_seq', 1, true);
          public          postgres    false    249            A           0    0    catalog_region_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_region_id_seq', 2, true);
          public          postgres    false    251            B           0    0 ,   catalog_rockwallmaterialpriceposition_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.catalog_rockwallmaterialpriceposition_id_seq', 1, false);
          public          postgres    false    253            C           0    0 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_id_seq', 1, false);
          public          postgres    false    255            D           0    0    catalog_subbrand_1_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.catalog_subbrand_1_id_seq', 1, false);
          public          postgres    false    257            E           0    0    catalog_subbrand_2_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.catalog_subbrand_2_id_seq', 1, false);
          public          postgres    false    259            F           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 13, true);
          public          postgres    false    261            G           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 29, true);
          public          postgres    false    263            H           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);
          public          postgres    false    265            k           2606    49514    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    202            p           2606    49516 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    204    204            s           2606    49518 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    204            m           2606    49520    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    202            v           2606    49522 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    206    206            x           2606    49524 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    206            �           2606    49526 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    209            �           2606    49528 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    209    209            z           2606    49530    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    208            �           2606    49532 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    212            �           2606    49534 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    212    212            }           2606    49536     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    208            �           2606    49538 0   catalog_activity catalog_activity_identifier_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.catalog_activity
    ADD CONSTRAINT catalog_activity_identifier_key UNIQUE (identifier);
 Z   ALTER TABLE ONLY public.catalog_activity DROP CONSTRAINT catalog_activity_identifier_key;
       public            postgres    false    214            �           2606    49540 &   catalog_activity catalog_activity_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.catalog_activity
    ADD CONSTRAINT catalog_activity_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.catalog_activity DROP CONSTRAINT catalog_activity_pkey;
       public            postgres    false    214            �           2606    49542 ,   catalog_algorithm catalog_algorithm_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_name_key;
       public            postgres    false    216            �           2606    49544 (   catalog_algorithm catalog_algorithm_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_pkey;
       public            postgres    false    216            �           2606    49546 0   catalog_algorithm catalog_algorithm_var_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.catalog_algorithm
    ADD CONSTRAINT catalog_algorithm_var_name_key UNIQUE (var_name);
 Z   ALTER TABLE ONLY public.catalog_algorithm DROP CONSTRAINT catalog_algorithm_var_name_key;
       public            postgres    false    216            �           2606    49548 $   catalog_brand catalog_brand_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.catalog_brand
    ADD CONSTRAINT catalog_brand_name_key UNIQUE (name);
 N   ALTER TABLE ONLY public.catalog_brand DROP CONSTRAINT catalog_brand_name_key;
       public            postgres    false    218            �           2606    49550     catalog_brand catalog_brand_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_brand
    ADD CONSTRAINT catalog_brand_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_brand DROP CONSTRAINT catalog_brand_pkey;
       public            postgres    false    218            �           2606    49552    catalog_city catalog_city_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.catalog_city
    ADD CONSTRAINT catalog_city_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.catalog_city DROP CONSTRAINT catalog_city_pkey;
       public            postgres    false    220            �           2606    49554 ,   catalog_classb catalog_classb_identifier_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.catalog_classb
    ADD CONSTRAINT catalog_classb_identifier_key UNIQUE (identifier);
 V   ALTER TABLE ONLY public.catalog_classb DROP CONSTRAINT catalog_classb_identifier_key;
       public            postgres    false    222            �           2606    49556 "   catalog_classb catalog_classb_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.catalog_classb
    ADD CONSTRAINT catalog_classb_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.catalog_classb DROP CONSTRAINT catalog_classb_pkey;
       public            postgres    false    222            �           2606    49558 H   catalog_classаveragedensity catalog_classаveragedensity_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."catalog_classаveragedensity"
    ADD CONSTRAINT "catalog_classаveragedensity_identifier_key" UNIQUE (identifier);
 v   ALTER TABLE ONLY public."catalog_classаveragedensity" DROP CONSTRAINT "catalog_classаveragedensity_identifier_key";
       public            postgres    false    224            �           2606    49560 >   catalog_classаveragedensity catalog_classаveragedensity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."catalog_classаveragedensity"
    ADD CONSTRAINT "catalog_classаveragedensity_pkey" PRIMARY KEY (id);
 l   ALTER TABLE ONLY public."catalog_classаveragedensity" DROP CONSTRAINT "catalog_classаveragedensity_pkey";
       public            postgres    false    224            �           2606    49562 (   catalog_country catalog_country_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.catalog_country
    ADD CONSTRAINT catalog_country_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.catalog_country DROP CONSTRAINT catalog_country_name_key;
       public            postgres    false    226            �           2606    49564 $   catalog_country catalog_country_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.catalog_country
    ADD CONSTRAINT catalog_country_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.catalog_country DROP CONSTRAINT catalog_country_pkey;
       public            postgres    false    226            �           2606    49566 (   catalog_factory catalog_factory_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.catalog_factory
    ADD CONSTRAINT catalog_factory_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.catalog_factory DROP CONSTRAINT catalog_factory_name_key;
       public            postgres    false    228            �           2606    49568 $   catalog_factory catalog_factory_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.catalog_factory
    ADD CONSTRAINT catalog_factory_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.catalog_factory DROP CONSTRAINT catalog_factory_pkey;
       public            postgres    false    228            �           2606    49570 *   catalog_markd catalog_markd_identifier_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_markd
    ADD CONSTRAINT catalog_markd_identifier_key UNIQUE (identifier);
 T   ALTER TABLE ONLY public.catalog_markd DROP CONSTRAINT catalog_markd_identifier_key;
       public            postgres    false    230            �           2606    49572     catalog_markd catalog_markd_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_markd
    ADD CONSTRAINT catalog_markd_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_markd DROP CONSTRAINT catalog_markd_pkey;
       public            postgres    false    230            �           2606    49574 *   catalog_markf catalog_markf_identifier_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_markf
    ADD CONSTRAINT catalog_markf_identifier_key UNIQUE (identifier);
 T   ALTER TABLE ONLY public.catalog_markf DROP CONSTRAINT catalog_markf_identifier_key;
       public            postgres    false    232            �           2606    49576     catalog_markf catalog_markf_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_markf
    ADD CONSTRAINT catalog_markf_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_markf DROP CONSTRAINT catalog_markf_pkey;
       public            postgres    false    232            �           2606    49578 *   catalog_markm catalog_markm_identifier_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_markm
    ADD CONSTRAINT catalog_markm_identifier_key UNIQUE (identifier);
 T   ALTER TABLE ONLY public.catalog_markm DROP CONSTRAINT catalog_markm_identifier_key;
       public            postgres    false    234            �           2606    49580     catalog_markm catalog_markm_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_markm
    ADD CONSTRAINT catalog_markm_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_markm DROP CONSTRAINT catalog_markm_pkey;
       public            postgres    false    234            �           2606    49582 ,   catalog_nfsize catalog_nfsize_identifier_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.catalog_nfsize
    ADD CONSTRAINT catalog_nfsize_identifier_key UNIQUE (identifier);
 V   ALTER TABLE ONLY public.catalog_nfsize DROP CONSTRAINT catalog_nfsize_identifier_key;
       public            postgres    false    236            �           2606    49584 "   catalog_nfsize catalog_nfsize_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.catalog_nfsize
    ADD CONSTRAINT catalog_nfsize_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.catalog_nfsize DROP CONSTRAINT catalog_nfsize_pkey;
       public            postgres    false    236            �           2606    49586 "   catalog_outlet catalog_outlet_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.catalog_outlet
    ADD CONSTRAINT catalog_outlet_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.catalog_outlet DROP CONSTRAINT catalog_outlet_pkey;
       public            postgres    false    238            �           2606    49588 V   catalog_pilegrillagefoundationworkprices catalog_pilegrillagefoundationworkprices_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices
    ADD CONSTRAINT catalog_pilegrillagefoundationworkprices_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices DROP CONSTRAINT catalog_pilegrillagefoundationworkprices_pkey;
       public            postgres    false    240            �           2606    49590    catalog_plan catalog_plan_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_pkey;
       public            postgres    false    242                       2606    49874 2   catalog_profile_outlet catalog_profile_outlet_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.catalog_profile_outlet
    ADD CONSTRAINT catalog_profile_outlet_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.catalog_profile_outlet DROP CONSTRAINT catalog_profile_outlet_pkey;
       public            postgres    false    268                       2606    49877 P   catalog_profile_outlet catalog_profile_outlet_profile_id_outlet_id_61a07550_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile_outlet
    ADD CONSTRAINT catalog_profile_outlet_profile_id_outlet_id_61a07550_uniq UNIQUE (profile_id, outlet_id);
 z   ALTER TABLE ONLY public.catalog_profile_outlet DROP CONSTRAINT catalog_profile_outlet_profile_id_outlet_id_61a07550_uniq;
       public            postgres    false    268    268            �           2606    49592 $   catalog_profile catalog_profile_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_pkey;
       public            postgres    false    244            �           2606    49594 +   catalog_profile catalog_profile_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_user_id_key;
       public            postgres    false    244            �           2606    49596 *   catalog_provider catalog_provider_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_name_key;
       public            postgres    false    246            �           2606    49598 &   catalog_provider catalog_provider_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_pkey;
       public            postgres    false    246            �           2606    49600 b   catalog_provider_secondary_activity catalog_provider_seconda_provider_id_activity_id_491d3b4f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_seconda_provider_id_activity_id_491d3b4f_uniq UNIQUE (provider_id, activity_id);
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_seconda_provider_id_activity_id_491d3b4f_uniq;
       public            postgres    false    248    248            �           2606    49602 L   catalog_provider_secondary_activity catalog_provider_secondary_activity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_secondary_activity_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_secondary_activity_pkey;
       public            postgres    false    248            �           2606    49604 &   catalog_region catalog_region_code_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.catalog_region
    ADD CONSTRAINT catalog_region_code_key UNIQUE (code);
 P   ALTER TABLE ONLY public.catalog_region DROP CONSTRAINT catalog_region_code_key;
       public            postgres    false    250            �           2606    49606 &   catalog_region catalog_region_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.catalog_region
    ADD CONSTRAINT catalog_region_name_key UNIQUE (name);
 P   ALTER TABLE ONLY public.catalog_region DROP CONSTRAINT catalog_region_name_key;
       public            postgres    false    250            �           2606    49608 "   catalog_region catalog_region_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.catalog_region
    ADD CONSTRAINT catalog_region_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.catalog_region DROP CONSTRAINT catalog_region_pkey;
       public            postgres    false    250            �           2606    49610 P   catalog_rockwallmaterialpriceposition catalog_rockwallmaterialpriceposition_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition
    ADD CONSTRAINT catalog_rockwallmaterialpriceposition_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition DROP CONSTRAINT catalog_rockwallmaterialpriceposition_pkey;
       public            postgres    false    252            �           2606    49612 >   catalog_rockwallmaterialunit catalog_rockwallmaterialunit_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmaterialunit_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmaterialunit_pkey;
       public            postgres    false    254            �           2606    49614 .   catalog_subbrand_1 catalog_subbrand_1_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.catalog_subbrand_1
    ADD CONSTRAINT catalog_subbrand_1_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.catalog_subbrand_1 DROP CONSTRAINT catalog_subbrand_1_name_key;
       public            postgres    false    256                        2606    49616 *   catalog_subbrand_1 catalog_subbrand_1_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.catalog_subbrand_1
    ADD CONSTRAINT catalog_subbrand_1_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.catalog_subbrand_1 DROP CONSTRAINT catalog_subbrand_1_pkey;
       public            postgres    false    256                       2606    49618 .   catalog_subbrand_2 catalog_subbrand_2_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.catalog_subbrand_2
    ADD CONSTRAINT catalog_subbrand_2_name_key UNIQUE (name);
 X   ALTER TABLE ONLY public.catalog_subbrand_2 DROP CONSTRAINT catalog_subbrand_2_name_key;
       public            postgres    false    258                       2606    49620 *   catalog_subbrand_2 catalog_subbrand_2_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.catalog_subbrand_2
    ADD CONSTRAINT catalog_subbrand_2_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.catalog_subbrand_2 DROP CONSTRAINT catalog_subbrand_2_pkey;
       public            postgres    false    258            	           2606    49622 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    260                       2606    49624 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    262    262                       2606    49626 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    262                       2606    49628 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    264                       2606    49630 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    266            i           1259    49631    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    202            n           1259    49632 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    204            q           1259    49633 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    204            t           1259    49634 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    206            ~           1259    49635 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    209            �           1259    49636 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    209            �           1259    49637 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    212            �           1259    49638 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    212            {           1259    49639     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    208            �           1259    49640 )   catalog_activity_identifier_3c7b3300_like    INDEX     �   CREATE INDEX catalog_activity_identifier_3c7b3300_like ON public.catalog_activity USING btree (identifier varchar_pattern_ops);
 =   DROP INDEX public.catalog_activity_identifier_3c7b3300_like;
       public            postgres    false    214            �           1259    49641 $   catalog_algorithm_name_5dd925d3_like    INDEX     v   CREATE INDEX catalog_algorithm_name_5dd925d3_like ON public.catalog_algorithm USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.catalog_algorithm_name_5dd925d3_like;
       public            postgres    false    216            �           1259    49642 (   catalog_algorithm_var_name_fff32a24_like    INDEX     ~   CREATE INDEX catalog_algorithm_var_name_fff32a24_like ON public.catalog_algorithm USING btree (var_name varchar_pattern_ops);
 <   DROP INDEX public.catalog_algorithm_var_name_fff32a24_like;
       public            postgres    false    216            �           1259    49643     catalog_brand_name_ea62c47f_like    INDEX     n   CREATE INDEX catalog_brand_name_ea62c47f_like ON public.catalog_brand USING btree (name varchar_pattern_ops);
 4   DROP INDEX public.catalog_brand_name_ea62c47f_like;
       public            postgres    false    218            �           1259    49644    catalog_city_region_id_f345c297    INDEX     ]   CREATE INDEX catalog_city_region_id_f345c297 ON public.catalog_city USING btree (region_id);
 3   DROP INDEX public.catalog_city_region_id_f345c297;
       public            postgres    false    220            �           1259    49645 '   catalog_classb_identifier_d34d76e2_like    INDEX     |   CREATE INDEX catalog_classb_identifier_d34d76e2_like ON public.catalog_classb USING btree (identifier varchar_pattern_ops);
 ;   DROP INDEX public.catalog_classb_identifier_d34d76e2_like;
       public            postgres    false    222            �           1259    49646 5   catalog_classаveragedensity_identifier_54c2b78d_like    INDEX     �   CREATE INDEX "catalog_classаveragedensity_identifier_54c2b78d_like" ON public."catalog_classаveragedensity" USING btree (identifier varchar_pattern_ops);
 K   DROP INDEX public."catalog_classаveragedensity_identifier_54c2b78d_like";
       public            postgres    false    224            �           1259    49647 "   catalog_country_name_3acac907_like    INDEX     r   CREATE INDEX catalog_country_name_3acac907_like ON public.catalog_country USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.catalog_country_name_3acac907_like;
       public            postgres    false    226            �           1259    49648 !   catalog_factory_brand_id_03484807    INDEX     a   CREATE INDEX catalog_factory_brand_id_03484807 ON public.catalog_factory USING btree (brand_id);
 5   DROP INDEX public.catalog_factory_brand_id_03484807;
       public            postgres    false    228            �           1259    49649     catalog_factory_city_id_0da00f7e    INDEX     _   CREATE INDEX catalog_factory_city_id_0da00f7e ON public.catalog_factory USING btree (city_id);
 4   DROP INDEX public.catalog_factory_city_id_0da00f7e;
       public            postgres    false    228            �           1259    49650 "   catalog_factory_name_8756d383_like    INDEX     r   CREATE INDEX catalog_factory_name_8756d383_like ON public.catalog_factory USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.catalog_factory_name_8756d383_like;
       public            postgres    false    228            �           1259    49651 &   catalog_markd_identifier_94610a4e_like    INDEX     z   CREATE INDEX catalog_markd_identifier_94610a4e_like ON public.catalog_markd USING btree (identifier varchar_pattern_ops);
 :   DROP INDEX public.catalog_markd_identifier_94610a4e_like;
       public            postgres    false    230            �           1259    49652 &   catalog_markf_identifier_82d307d0_like    INDEX     z   CREATE INDEX catalog_markf_identifier_82d307d0_like ON public.catalog_markf USING btree (identifier varchar_pattern_ops);
 :   DROP INDEX public.catalog_markf_identifier_82d307d0_like;
       public            postgres    false    232            �           1259    49653 &   catalog_markm_identifier_43ab376a_like    INDEX     z   CREATE INDEX catalog_markm_identifier_43ab376a_like ON public.catalog_markm USING btree (identifier varchar_pattern_ops);
 :   DROP INDEX public.catalog_markm_identifier_43ab376a_like;
       public            postgres    false    234            �           1259    49654 '   catalog_nfsize_identifier_1e4f6bf7_like    INDEX     |   CREATE INDEX catalog_nfsize_identifier_1e4f6bf7_like ON public.catalog_nfsize USING btree (identifier varchar_pattern_ops);
 ;   DROP INDEX public.catalog_nfsize_identifier_1e4f6bf7_like;
       public            postgres    false    236            �           1259    49656 #   catalog_outlet_provider_id_af336149    INDEX     e   CREATE INDEX catalog_outlet_provider_id_af336149 ON public.catalog_outlet USING btree (provider_id);
 7   DROP INDEX public.catalog_outlet_provider_id_af336149;
       public            postgres    false    238            �           1259    49657 :   catalog_pilegrillagefoundationworkprices_owner_id_a82c33db    INDEX     �   CREATE INDEX catalog_pilegrillagefoundationworkprices_owner_id_a82c33db ON public.catalog_pilegrillagefoundationworkprices USING btree (owner_id);
 N   DROP INDEX public.catalog_pilegrillagefoundationworkprices_owner_id_a82c33db;
       public            postgres    false    240            �           1259    49658    catalog_plan_author_id_19443bad    INDEX     ]   CREATE INDEX catalog_plan_author_id_19443bad ON public.catalog_plan USING btree (author_id);
 3   DROP INDEX public.catalog_plan_author_id_19443bad;
       public            postgres    false    242            �           1259    49659     catalog_profile_city_id_2b229f7f    INDEX     _   CREATE INDEX catalog_profile_city_id_2b229f7f ON public.catalog_profile USING btree (city_id);
 4   DROP INDEX public.catalog_profile_city_id_2b229f7f;
       public            postgres    false    244                       1259    49889 )   catalog_profile_outlet_outlet_id_fcaf3ca5    INDEX     q   CREATE INDEX catalog_profile_outlet_outlet_id_fcaf3ca5 ON public.catalog_profile_outlet USING btree (outlet_id);
 =   DROP INDEX public.catalog_profile_outlet_outlet_id_fcaf3ca5;
       public            postgres    false    268                       1259    49888 *   catalog_profile_outlet_profile_id_e0046916    INDEX     s   CREATE INDEX catalog_profile_outlet_profile_id_e0046916 ON public.catalog_profile_outlet USING btree (profile_id);
 >   DROP INDEX public.catalog_profile_outlet_profile_id_e0046916;
       public            postgres    false    268            �           1259    49660 #   catalog_provider_name_23080848_like    INDEX     t   CREATE INDEX catalog_provider_name_23080848_like ON public.catalog_provider USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.catalog_provider_name_23080848_like;
       public            postgres    false    246            �           1259    49661 -   catalog_provider_primary_activity_id_5ff3703d    INDEX     y   CREATE INDEX catalog_provider_primary_activity_id_5ff3703d ON public.catalog_provider USING btree (primary_activity_id);
 A   DROP INDEX public.catalog_provider_primary_activity_id_5ff3703d;
       public            postgres    false    246            �           1259    49662 8   catalog_provider_secondary_activity_activity_id_50696e92    INDEX     �   CREATE INDEX catalog_provider_secondary_activity_activity_id_50696e92 ON public.catalog_provider_secondary_activity USING btree (activity_id);
 L   DROP INDEX public.catalog_provider_secondary_activity_activity_id_50696e92;
       public            postgres    false    248            �           1259    49663 8   catalog_provider_secondary_activity_provider_id_1050e31c    INDEX     �   CREATE INDEX catalog_provider_secondary_activity_provider_id_1050e31c ON public.catalog_provider_secondary_activity USING btree (provider_id);
 L   DROP INDEX public.catalog_provider_secondary_activity_provider_id_1050e31c;
       public            postgres    false    248            �           1259    49664 "   catalog_region_country_id_fbbe1377    INDEX     c   CREATE INDEX catalog_region_country_id_fbbe1377 ON public.catalog_region USING btree (country_id);
 6   DROP INDEX public.catalog_region_country_id_fbbe1377;
       public            postgres    false    250            �           1259    49665 !   catalog_region_name_af23e790_like    INDEX     p   CREATE INDEX catalog_region_name_af23e790_like ON public.catalog_region USING btree (name varchar_pattern_ops);
 5   DROP INDEX public.catalog_region_name_af23e790_like;
       public            postgres    false    250            �           1259    49666 6   catalog_rockwallmaterialpriceposition_name_id_17c3a4a8    INDEX     �   CREATE INDEX catalog_rockwallmaterialpriceposition_name_id_17c3a4a8 ON public.catalog_rockwallmaterialpriceposition USING btree (name_id);
 J   DROP INDEX public.catalog_rockwallmaterialpriceposition_name_id_17c3a4a8;
       public            postgres    false    252            �           1259    49667 7   catalog_rockwallmaterialpriceposition_owner_id_5cb00786    INDEX     �   CREATE INDEX catalog_rockwallmaterialpriceposition_owner_id_5cb00786 ON public.catalog_rockwallmaterialpriceposition USING btree (owner_id);
 K   DROP INDEX public.catalog_rockwallmaterialpriceposition_owner_id_5cb00786;
       public            postgres    false    252            �           1259    49668 2   catalog_rockwallmaterialunit_algorithm_id_16bdd59b    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_algorithm_id_16bdd59b ON public.catalog_rockwallmaterialunit USING btree (algorithm_id);
 F   DROP INDEX public.catalog_rockwallmaterialunit_algorithm_id_16bdd59b;
       public            postgres    false    254            �           1259    49669 .   catalog_rockwallmaterialunit_brand_id_7ba15ba0    INDEX     {   CREATE INDEX catalog_rockwallmaterialunit_brand_id_7ba15ba0 ON public.catalog_rockwallmaterialunit USING btree (brand_id);
 B   DROP INDEX public.catalog_rockwallmaterialunit_brand_id_7ba15ba0;
       public            postgres    false    254            �           1259    49670 >   catalog_rockwallmaterialunit_class_average_density_id_2df62284    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_class_average_density_id_2df62284 ON public.catalog_rockwallmaterialunit USING btree (class_average_density_id);
 R   DROP INDEX public.catalog_rockwallmaterialunit_class_average_density_id_2df62284;
       public            postgres    false    254            �           1259    49671 0   catalog_rockwallmaterialunit_class_b_id_6acc8c19    INDEX        CREATE INDEX catalog_rockwallmaterialunit_class_b_id_6acc8c19 ON public.catalog_rockwallmaterialunit USING btree (class_b_id);
 D   DROP INDEX public.catalog_rockwallmaterialunit_class_b_id_6acc8c19;
       public            postgres    false    254            �           1259    49672 0   catalog_rockwallmaterialunit_factory_id_f1af5d55    INDEX        CREATE INDEX catalog_rockwallmaterialunit_factory_id_f1af5d55 ON public.catalog_rockwallmaterialunit USING btree (factory_id);
 D   DROP INDEX public.catalog_rockwallmaterialunit_factory_id_f1af5d55;
       public            postgres    false    254            �           1259    49673 /   catalog_rockwallmaterialunit_mark_d_id_4fe3b199    INDEX     }   CREATE INDEX catalog_rockwallmaterialunit_mark_d_id_4fe3b199 ON public.catalog_rockwallmaterialunit USING btree (mark_d_id);
 C   DROP INDEX public.catalog_rockwallmaterialunit_mark_d_id_4fe3b199;
       public            postgres    false    254            �           1259    49674 /   catalog_rockwallmaterialunit_mark_f_id_3e515b69    INDEX     }   CREATE INDEX catalog_rockwallmaterialunit_mark_f_id_3e515b69 ON public.catalog_rockwallmaterialunit USING btree (mark_f_id);
 C   DROP INDEX public.catalog_rockwallmaterialunit_mark_f_id_3e515b69;
       public            postgres    false    254            �           1259    49675 /   catalog_rockwallmaterialunit_mark_m_id_6f18e612    INDEX     }   CREATE INDEX catalog_rockwallmaterialunit_mark_m_id_6f18e612 ON public.catalog_rockwallmaterialunit USING btree (mark_m_id);
 C   DROP INDEX public.catalog_rockwallmaterialunit_mark_m_id_6f18e612;
       public            postgres    false    254            �           1259    49676 4   catalog_rockwallmaterialunit_sub_brand_1_id_9b7b9a46    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_sub_brand_1_id_9b7b9a46 ON public.catalog_rockwallmaterialunit USING btree (sub_brand_1_id);
 H   DROP INDEX public.catalog_rockwallmaterialunit_sub_brand_1_id_9b7b9a46;
       public            postgres    false    254            �           1259    49677 4   catalog_rockwallmaterialunit_sub_brand_2_id_40f52fd1    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_sub_brand_2_id_40f52fd1 ON public.catalog_rockwallmaterialunit USING btree (sub_brand_2_id);
 H   DROP INDEX public.catalog_rockwallmaterialunit_sub_brand_2_id_40f52fd1;
       public            postgres    false    254            �           1259    49678 $   catalog_subbrand_1_brand_id_b77c1599    INDEX     g   CREATE INDEX catalog_subbrand_1_brand_id_b77c1599 ON public.catalog_subbrand_1 USING btree (brand_id);
 8   DROP INDEX public.catalog_subbrand_1_brand_id_b77c1599;
       public            postgres    false    256            �           1259    49679 %   catalog_subbrand_1_name_7262cc51_like    INDEX     x   CREATE INDEX catalog_subbrand_1_name_7262cc51_like ON public.catalog_subbrand_1 USING btree (name varchar_pattern_ops);
 9   DROP INDEX public.catalog_subbrand_1_name_7262cc51_like;
       public            postgres    false    256                       1259    49680 %   catalog_subbrand_2_name_5be7264f_like    INDEX     x   CREATE INDEX catalog_subbrand_2_name_5be7264f_like ON public.catalog_subbrand_2 USING btree (name varchar_pattern_ops);
 9   DROP INDEX public.catalog_subbrand_2_name_5be7264f_like;
       public            postgres    false    258                       1259    49681 *   catalog_subbrand_2_sub_brand_1_id_0113c49f    INDEX     s   CREATE INDEX catalog_subbrand_2_sub_brand_1_id_0113c49f ON public.catalog_subbrand_2 USING btree (sub_brand_1_id);
 >   DROP INDEX public.catalog_subbrand_2_sub_brand_1_id_0113c49f;
       public            postgres    false    258                       1259    49682 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    260            
           1259    49683 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    260                       1259    49684 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    266                       1259    49685 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    266                       2606    49686 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    204    2936    206                       2606    49691 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    204    2925    202                       2606    49696 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3086    262    206                       2606    49701 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    209    2925    202                       2606    49706 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    208    2938    209                        2606    49711 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    212    2936    206            !           2606    49716 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    208    212    2938            "           2606    49721 A   catalog_city catalog_city_region_id_f345c297_fk_catalog_region_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_city
    ADD CONSTRAINT catalog_city_region_id_f345c297_fk_catalog_region_id FOREIGN KEY (region_id) REFERENCES public.catalog_region(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.catalog_city DROP CONSTRAINT catalog_city_region_id_f345c297_fk_catalog_region_id;
       public          postgres    false    250    3050    220            #           2606    49726 E   catalog_factory catalog_factory_brand_id_03484807_fk_catalog_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_factory
    ADD CONSTRAINT catalog_factory_brand_id_03484807_fk_catalog_brand_id FOREIGN KEY (brand_id) REFERENCES public.catalog_brand(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.catalog_factory DROP CONSTRAINT catalog_factory_brand_id_03484807_fk_catalog_brand_id;
       public          postgres    false    228    218    2971            $           2606    49731 C   catalog_factory catalog_factory_city_id_0da00f7e_fk_catalog_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_factory
    ADD CONSTRAINT catalog_factory_city_id_0da00f7e_fk_catalog_city_id FOREIGN KEY (city_id) REFERENCES public.catalog_city(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.catalog_factory DROP CONSTRAINT catalog_factory_city_id_0da00f7e_fk_catalog_city_id;
       public          postgres    false    228    220    2973            %           2606    49741 I   catalog_outlet catalog_outlet_provider_id_af336149_fk_catalog_provider_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_outlet
    ADD CONSTRAINT catalog_outlet_provider_id_af336149_fk_catalog_provider_id FOREIGN KEY (provider_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.catalog_outlet DROP CONSTRAINT catalog_outlet_provider_id_af336149_fk_catalog_provider_id;
       public          postgres    false    238    246    3035            &           2606    49746 \   catalog_pilegrillagefoundationworkprices catalog_pilegrillage_owner_id_a82c33db_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices
    ADD CONSTRAINT catalog_pilegrillage_owner_id_a82c33db_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices DROP CONSTRAINT catalog_pilegrillage_owner_id_a82c33db_fk_auth_user;
       public          postgres    false    240    2938    208            '           2606    49751 <   catalog_plan catalog_plan_author_id_19443bad_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_author_id_19443bad_fk_auth_user_id;
       public          postgres    false    208    242    2938            (           2606    49756 C   catalog_profile catalog_profile_city_id_2b229f7f_fk_catalog_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_city_id_2b229f7f_fk_catalog_city_id FOREIGN KEY (city_id) REFERENCES public.catalog_city(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_city_id_2b229f7f_fk_catalog_city_id;
       public          postgres    false    220    244    2973            >           2606    49878 L   catalog_profile_outlet catalog_profile_outl_profile_id_e0046916_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile_outlet
    ADD CONSTRAINT catalog_profile_outl_profile_id_e0046916_fk_catalog_p FOREIGN KEY (profile_id) REFERENCES public.catalog_profile(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.catalog_profile_outlet DROP CONSTRAINT catalog_profile_outl_profile_id_e0046916_fk_catalog_p;
       public          postgres    false    244    268    3028            ?           2606    49883 U   catalog_profile_outlet catalog_profile_outlet_outlet_id_fcaf3ca5_fk_catalog_outlet_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile_outlet
    ADD CONSTRAINT catalog_profile_outlet_outlet_id_fcaf3ca5_fk_catalog_outlet_id FOREIGN KEY (outlet_id) REFERENCES public.catalog_outlet(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.catalog_profile_outlet DROP CONSTRAINT catalog_profile_outlet_outlet_id_fcaf3ca5_fk_catalog_outlet_id;
       public          postgres    false    268    238    3018            )           2606    49761 @   catalog_profile catalog_profile_user_id_7c4daf2b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_profile
    ADD CONSTRAINT catalog_profile_user_id_7c4daf2b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.catalog_profile DROP CONSTRAINT catalog_profile_user_id_7c4daf2b_fk_auth_user_id;
       public          postgres    false    208    2938    244            *           2606    49766 K   catalog_provider catalog_provider_primary_activity_id_5ff3703d_fk_catalog_a    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_primary_activity_id_5ff3703d_fk_catalog_a FOREIGN KEY (primary_activity_id) REFERENCES public.catalog_activity(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_primary_activity_id_5ff3703d_fk_catalog_a;
       public          postgres    false    2958    214    246            +           2606    49771 Z   catalog_provider_secondary_activity catalog_provider_sec_activity_id_50696e92_fk_catalog_a    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_sec_activity_id_50696e92_fk_catalog_a FOREIGN KEY (activity_id) REFERENCES public.catalog_activity(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_sec_activity_id_50696e92_fk_catalog_a;
       public          postgres    false    248    2958    214            ,           2606    49776 Z   catalog_provider_secondary_activity catalog_provider_sec_provider_id_1050e31c_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_sec_provider_id_1050e31c_fk_catalog_p FOREIGN KEY (provider_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_sec_provider_id_1050e31c_fk_catalog_p;
       public          postgres    false    248    246    3035            -           2606    49781 G   catalog_region catalog_region_country_id_fbbe1377_fk_catalog_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_region
    ADD CONSTRAINT catalog_region_country_id_fbbe1377_fk_catalog_country_id FOREIGN KEY (country_id) REFERENCES public.catalog_country(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.catalog_region DROP CONSTRAINT catalog_region_country_id_fbbe1377_fk_catalog_country_id;
       public          postgres    false    2989    226    250            0           2606    49786 T   catalog_rockwallmaterialunit catalog_rockwallmate_algorithm_id_16bdd59b_fk_catalog_a    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_algorithm_id_16bdd59b_fk_catalog_a FOREIGN KEY (algorithm_id) REFERENCES public.catalog_algorithm(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_algorithm_id_16bdd59b_fk_catalog_a;
       public          postgres    false    2963    254    216            1           2606    49791 P   catalog_rockwallmaterialunit catalog_rockwallmate_brand_id_7ba15ba0_fk_catalog_b    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_brand_id_7ba15ba0_fk_catalog_b FOREIGN KEY (brand_id) REFERENCES public.catalog_brand(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_brand_id_7ba15ba0_fk_catalog_b;
       public          postgres    false    254    218    2971            2           2606    49796 \   catalog_rockwallmaterialunit catalog_rockwallmate_class_average_densit_2df62284_fk_catalog_c    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_class_average_densit_2df62284_fk_catalog_c FOREIGN KEY (class_average_density_id) REFERENCES public."catalog_classаveragedensity"(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_class_average_densit_2df62284_fk_catalog_c;
       public          postgres    false    254    2984    224            3           2606    49801 R   catalog_rockwallmaterialunit catalog_rockwallmate_class_b_id_6acc8c19_fk_catalog_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_class_b_id_6acc8c19_fk_catalog_c FOREIGN KEY (class_b_id) REFERENCES public.catalog_classb(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_class_b_id_6acc8c19_fk_catalog_c;
       public          postgres    false    222    254    2979            4           2606    49806 R   catalog_rockwallmaterialunit catalog_rockwallmate_factory_id_f1af5d55_fk_catalog_f    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_factory_id_f1af5d55_fk_catalog_f FOREIGN KEY (factory_id) REFERENCES public.catalog_factory(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_factory_id_f1af5d55_fk_catalog_f;
       public          postgres    false    254    228    2996            5           2606    49811 Q   catalog_rockwallmaterialunit catalog_rockwallmate_mark_d_id_4fe3b199_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_mark_d_id_4fe3b199_fk_catalog_m FOREIGN KEY (mark_d_id) REFERENCES public.catalog_markd(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_mark_d_id_4fe3b199_fk_catalog_m;
       public          postgres    false    230    254    3001            6           2606    49816 Q   catalog_rockwallmaterialunit catalog_rockwallmate_mark_f_id_3e515b69_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_mark_f_id_3e515b69_fk_catalog_m FOREIGN KEY (mark_f_id) REFERENCES public.catalog_markf(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_mark_f_id_3e515b69_fk_catalog_m;
       public          postgres    false    3006    254    232            7           2606    49821 Q   catalog_rockwallmaterialunit catalog_rockwallmate_mark_m_id_6f18e612_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_mark_m_id_6f18e612_fk_catalog_m FOREIGN KEY (mark_m_id) REFERENCES public.catalog_markm(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_mark_m_id_6f18e612_fk_catalog_m;
       public          postgres    false    3011    234    254            .           2606    49826 X   catalog_rockwallmaterialpriceposition catalog_rockwallmate_name_id_17c3a4a8_fk_catalog_r    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition
    ADD CONSTRAINT catalog_rockwallmate_name_id_17c3a4a8_fk_catalog_r FOREIGN KEY (name_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition DROP CONSTRAINT catalog_rockwallmate_name_id_17c3a4a8_fk_catalog_r;
       public          postgres    false    254    3064    252            /           2606    49831 Y   catalog_rockwallmaterialpriceposition catalog_rockwallmate_owner_id_5cb00786_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition
    ADD CONSTRAINT catalog_rockwallmate_owner_id_5cb00786_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition DROP CONSTRAINT catalog_rockwallmate_owner_id_5cb00786_fk_auth_user;
       public          postgres    false    208    2938    252            8           2606    49836 V   catalog_rockwallmaterialunit catalog_rockwallmate_sub_brand_1_id_9b7b9a46_fk_catalog_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_sub_brand_1_id_9b7b9a46_fk_catalog_s FOREIGN KEY (sub_brand_1_id) REFERENCES public.catalog_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_sub_brand_1_id_9b7b9a46_fk_catalog_s;
       public          postgres    false    3072    256    254            9           2606    49841 V   catalog_rockwallmaterialunit catalog_rockwallmate_sub_brand_2_id_40f52fd1_fk_catalog_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_sub_brand_2_id_40f52fd1_fk_catalog_s FOREIGN KEY (sub_brand_2_id) REFERENCES public.catalog_subbrand_2(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_sub_brand_2_id_40f52fd1_fk_catalog_s;
       public          postgres    false    3077    258    254            :           2606    49846 K   catalog_subbrand_1 catalog_subbrand_1_brand_id_b77c1599_fk_catalog_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_subbrand_1
    ADD CONSTRAINT catalog_subbrand_1_brand_id_b77c1599_fk_catalog_brand_id FOREIGN KEY (brand_id) REFERENCES public.catalog_brand(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.catalog_subbrand_1 DROP CONSTRAINT catalog_subbrand_1_brand_id_b77c1599_fk_catalog_brand_id;
       public          postgres    false    218    256    2971            ;           2606    49851 J   catalog_subbrand_2 catalog_subbrand_2_sub_brand_1_id_0113c49f_fk_catalog_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_subbrand_2
    ADD CONSTRAINT catalog_subbrand_2_sub_brand_1_id_0113c49f_fk_catalog_s FOREIGN KEY (sub_brand_1_id) REFERENCES public.catalog_subbrand_1(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.catalog_subbrand_2 DROP CONSTRAINT catalog_subbrand_2_sub_brand_1_id_0113c49f_fk_catalog_s;
       public          postgres    false    258    256    3072            <           2606    49856 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    262    3086    260            =           2606    49861 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    260    2938    208            �      x������ � �      �      x������ � �      �     x��XMo�F=/�͡�H}�[�Wh�V˒@��S�-
p���"m���Y�-D�S�/,�Qgg�f(J����7�;o��ϓq��h2��<."�O�/�!�O��0e(}����t΁���x���L��S6M�l6�&c�4#�Pqh�l��cX#�`{^"C�F��;��|r:M����A���F��DT��9{)�*��Sp:Ks�B�g����S�zhӷ�y�t���c|�~�uo>���0j���4mT`n�;AԣBJ`#���TW	o�Q|��2Kh�˰�S=K��vP��
b6�=��t06�=��s02�=U9����y'��}�B���AtQZ2N�l��$��|���$����#�D��_�G��;@�V��彼���B�7D.��&�D�h?i<=�� Oƃ'���ZeO"���b=�'����"ͷ'����.�?a9����N�����W�6�X�2�����e ���+�A^��y(_CNr	C�R\�0�8Jf�����x{�Um"YGo��������q:7Ue��@�R����(`0�х\�(����Y�'�t��g�b�xC��hi=֘��S���k��UY�Z���k�ı���Ѓ�?��<7����s�*���0���8�wz�]��ﱁo�Ж��>��.p�\���^ȏ���DmF�?�Kerulܡ�e3�plԣ���j9&�Ro �B��E������$ɏA�;U	g25P�V%�I�@�c������U
!5mq���o�f.�_���8
ڽ	ԡ!�SC~u�H�GA�Q�~W`�*��FD��IЉ7�@�!`��2D,�����T����0�C�0+C���SDz�3>�e_�A�;H�ȵ�E��f@��
��-���Ϫ��sV�7�$���`�T�ozӓO��%��I2O�,���y������o��o0�~u����zW�w��q-�K�~�QoZ�"�W�y�g��t+~r�E���%N�w�87���I�qce�J|]�}K���B�X���t��^����`���cX������R�7���n� �˘J~(K�:���R�z�6�'G�(z���]�ĞX���Z]�Ǟ)X�Vy��Ţ�,G�T��"6�"�*�Y���lr��g�V>"{e��"���;\�V�~A�C��������SL_9���-q��U�R}D���� Z�X�ƦP�a��F�=�� QS��$?�9>��D^���N!�k^���B�%?�=�;E�~��R��=��^�N��r��9W�����:�А0j��A����t7gCD�g��֌tL9#�o�H��3����ؒ���)��ێ:D��g7ƍvW$=��`���SK��c ��F��B^�Ao܆�K����~�xm��"�څ�,�s�F�<��3�Uǒv�#�?�_�,i�O��)�zd	���M3mY\گNr���/|jfg�!���5��٦g�.����uzj����٧�&��~�]�͙���[��X/�Ź���tr:�]�&���#�W��P�I��0_}��;,��      �   �   x�E��
�@@���S�pʝ;?9A
!YB�BcZZV����l#Cu��x�4�rY Sn��]&���ʍYb�	n�͘'���:4u��j�r��j�]T����  x�hØ��@
�g��HlݷBJ-$�eo���3��r7�F�υ@1�,=�����,.      �      x������ � �      �      x������ � �      �   B   x�3�,)JLI弰�¾�6_�waӅ����8SRs2�R�*9/L�5^l��(����=... ��*      �      x������ � �      �      x�3��L�K-JJ-JO-����� D �      �   L   x�3�0�b����89c���˘�¤�.6]�uaǅ�`)#��!�Y6\��{/� u�r��q��qqq w+ �      �      x������ � �      �      x������ � �      �      x�3估�¾��/������� sL	w      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x�3�4����� ]      �      x������ � �      �      x�3��K-W(�I�������� 4�      �      x�3�4�������"�=... 3]�             x������ � �      �   (   x�3估�b�ņ�.�0H�[8�b���� DXF      �      x�3�4�4����� �Y      �   ;   x�3估��M@�p�D_��ih�i�e�ya�-�\l�4]�q����(���� Ly�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x�}�On�@�s
�+t4o��O�X�.�%�"���Jm`Y	�X������Җp�77�Mp�:R���7߼o���op�!L��T�yo �=.3��.�a<ċ��^7����C]�����V"��*��qd�|Ɠ8��,��#��d�UKZ�x�%2���x_�5_�j)�UI[&���T(ɷ�&�(�=D|�#��^�qަC��� �RI�x� 3|G��%^P���B���9���3�E<�3\�)^�Ƒ�}�VX}3����SQ��d��W%)poA����2-�{2���<�,y���6�QiI&����a��=�4tc�IG�3g����;�^��c~��-_��/�m�2=�1��5uz�r�I{Ђ��M�+|M�U�ݴc�@�F���Pߥ�Lr���Iy�j����i��/i�Y<լi����5;u^�v������O��M�j�ۅb���=b����ea#      �      x�u�mn� ���L�~�w�4���Z%��jO���H#�M�?��ϋV���=�$w0
s��@2p��l����E�$�W�w���{��Z�AE����U�	�=
m��e����]����BNwЛZ[��Z����H�=���<aj��YIo�a���vP�-��
t�+0����� �u}������Hmv�@���ᆂ/Oјj)�ϤZ�[Sł�r�Z��-9tE���7/������|~f����R�~0��]Fn�ӛ�^�qJ�T]���o �Y��l      �   F  x���ي�0E�������T����!MZ�m9t�~JJ�8i0z��Qխ�۾����8��`�q��k
`�>|���X�\�Zs���
7ǯ�
�b`�vm��+*�U���l��)��hG��o��޺��	C��i	!��"Hf�6������ۯ>l)��(nP��Rf�%��M7�s����"�����&��~l�4���޶��6���_OQ��QfA�5Ot�օ�-��)�O�BkJ:r8�_�C�:!8[r�h����2��g5'
5�����"w��0.�f�m2�D^ ����P�	;�q����؏�����/
ϙB�2�y���9��yj�XHՃG�B	2�d���8;��c?��Hq����<�E�c�s\u��X�S�����j�n�u)�@uz��?��ʴ�h ˪�cp�I� ���d��,+��*o.��@�w��Z�R�ρ��"/�C��d�!��x'�U-D)�6��>����sl|���ї��թ�"u��@^��C2�J)�����(o��%+��X�Җk��(�7 U����U���P� ���+���Y���r����]Ǉ      �   D  x���͎�0��^����� �Y��bK$(��?j)�2�/��]�U��M��3��;�q1:�a�Ա��e�< ��9uX�N���IP3I�,�
�qIt$Co� �b
��z�C���e�Rkkx�d]����{���K�/S�
�V,��<qj_�*�lD���J�[~��,�,ݢl��uE��"����r��V�`��..`ۦ D��C������e�2�#�*�JI�y\c"�"���1��0Ls��{�>��z؞��Ĳ`��7du���lv��H���.���at���e�7���{�Y=�N0��h��A��t����Ч     