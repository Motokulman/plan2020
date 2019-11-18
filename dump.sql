PGDMP         5            
    w         	   postgres2    12.0    12.0 x   $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            '           1262    18022 	   postgres2    DATABASE     �   CREATE DATABASE postgres2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE postgres2;
                postgres    false            �            1259    18054 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    18052    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            (           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    18064    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    18062    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            )           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    18046    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    18044    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            *           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    18072 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    postgres    false            �            1259    18082    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    18080    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215            +           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    18070    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            ,           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    18090    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    18088 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217            -           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    18180    catalog_application    TABLE     �   CREATE TABLE public.catalog_application (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 '   DROP TABLE public.catalog_application;
       public         heap    postgres    false            �            1259    18178    catalog_application_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.catalog_application_id_seq;
       public          postgres    false    221            .           0    0    catalog_application_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.catalog_application_id_seq OWNED BY public.catalog_application.id;
          public          postgres    false    220            �            1259    18200    catalog_city    TABLE     h   CREATE TABLE public.catalog_city (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
     DROP TABLE public.catalog_city;
       public         heap    postgres    false            �            1259    18198    catalog_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.catalog_city_id_seq;
       public          postgres    false    223            /           0    0    catalog_city_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_city_id_seq OWNED BY public.catalog_city.id;
          public          postgres    false    222            �            1259    26724    catalog_classblight    TABLE     �   CREATE TABLE public.catalog_classblight (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 '   DROP TABLE public.catalog_classblight;
       public         heap    postgres    false            �            1259    26722    catalog_classb_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_classb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.catalog_classb_id_seq;
       public          postgres    false    250            0           0    0    catalog_classb_id_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.catalog_classb_id_seq OWNED BY public.catalog_classblight.id;
          public          postgres    false    249            �            1259    18220    catalog_directproducer    TABLE     r   CREATE TABLE public.catalog_directproducer (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
 *   DROP TABLE public.catalog_directproducer;
       public         heap    postgres    false            �            1259    26734    catalog_markd    TABLE     �   CREATE TABLE public.catalog_markd (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 !   DROP TABLE public.catalog_markd;
       public         heap    postgres    false            �            1259    26732    catalog_markd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_markd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_markd_id_seq;
       public          postgres    false    252            1           0    0    catalog_markd_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markd_id_seq OWNED BY public.catalog_markd.id;
          public          postgres    false    251            �            1259    26744    catalog_markm    TABLE     �   CREATE TABLE public.catalog_markm (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 !   DROP TABLE public.catalog_markm;
       public         heap    postgres    false            �            1259    26742    catalog_markm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_markm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.catalog_markm_id_seq;
       public          postgres    false    254            2           0    0    catalog_markm_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markm_id_seq OWNED BY public.catalog_markm.id;
          public          postgres    false    253            �            1259    18210    catalog_productbrand    TABLE     p   CREATE TABLE public.catalog_productbrand (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
 (   DROP TABLE public.catalog_productbrand;
       public         heap    postgres    false            �            1259    18208    catalog_materialbrand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_materialbrand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.catalog_materialbrand_id_seq;
       public          postgres    false    225            3           0    0    catalog_materialbrand_id_seq    SEQUENCE OWNED BY     \   ALTER SEQUENCE public.catalog_materialbrand_id_seq OWNED BY public.catalog_productbrand.id;
          public          postgres    false    224                       1259    26986 (   catalog_pilegrillagefoundationworkprices    TABLE     �  CREATE TABLE public.catalog_pilegrillagefoundationworkprices (
    id integer NOT NULL,
    const_expenditure double precision NOT NULL,
    transportation_procurement_cost double precision NOT NULL,
    reinforcement_binding double precision NOT NULL,
    clamp double precision NOT NULL,
    pile_frame double precision NOT NULL,
    formwork double precision NOT NULL,
    pile_pour double precision NOT NULL,
    man_hours_cost integer NOT NULL,
    man_hours_profit integer NOT NULL,
    owner_id integer,
    length_costs double precision NOT NULL,
    square_costs double precision NOT NULL,
    volume_costs double precision NOT NULL
);
 <   DROP TABLE public.catalog_pilegrillagefoundationworkprices;
       public         heap    postgres    false                       1259    26984 )   catalog_pilegrillagefoundationcost_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_pilegrillagefoundationcost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.catalog_pilegrillagefoundationcost_id_seq;
       public          postgres    false    272            4           0    0 )   catalog_pilegrillagefoundationcost_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.catalog_pilegrillagefoundationcost_id_seq OWNED BY public.catalog_pilegrillagefoundationworkprices.id;
          public          postgres    false    271                       1259    27054    catalog_plan    TABLE     i   CREATE TABLE public.catalog_plan (
    id integer NOT NULL,
    title character varying(200) NOT NULL
);
     DROP TABLE public.catalog_plan;
       public         heap    postgres    false                       1259    27052    catalog_plan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.catalog_plan_id_seq;
       public          postgres    false    274            5           0    0    catalog_plan_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_plan_id_seq OWNED BY public.catalog_plan.id;
          public          postgres    false    273            �            1259    18218    catalog_producer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_producer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.catalog_producer_id_seq;
       public          postgres    false    227            6           0    0    catalog_producer_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.catalog_producer_id_seq OWNED BY public.catalog_directproducer.id;
          public          postgres    false    226            �            1259    18230    catalog_provider    TABLE     �   CREATE TABLE public.catalog_provider (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    ownership_form character varying(1) NOT NULL,
    primary_activity_id integer
);
 $   DROP TABLE public.catalog_provider;
       public         heap    postgres    false            �            1259    18228    catalog_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.catalog_provider_id_seq;
       public          postgres    false    229            7           0    0    catalog_provider_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.catalog_provider_id_seq OWNED BY public.catalog_provider.id;
          public          postgres    false    228            �            1259    18351 #   catalog_provider_secondary_activity    TABLE     �   CREATE TABLE public.catalog_provider_secondary_activity (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    provideractivitytype_id integer NOT NULL
);
 7   DROP TABLE public.catalog_provider_secondary_activity;
       public         heap    postgres    false            �            1259    18349 *   catalog_provider_secondary_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_provider_secondary_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.catalog_provider_secondary_activity_id_seq;
       public          postgres    false    245            8           0    0 *   catalog_provider_secondary_activity_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.catalog_provider_secondary_activity_id_seq OWNED BY public.catalog_provider_secondary_activity.id;
          public          postgres    false    244            �            1259    18359    catalog_provider_tax_system    TABLE     �   CREATE TABLE public.catalog_provider_tax_system (
    id integer NOT NULL,
    provider_id integer NOT NULL,
    taxsystemtype_id integer NOT NULL
);
 /   DROP TABLE public.catalog_provider_tax_system;
       public         heap    postgres    false            �            1259    18357 "   catalog_provider_tax_system_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_provider_tax_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.catalog_provider_tax_system_id_seq;
       public          postgres    false    247            9           0    0 "   catalog_provider_tax_system_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.catalog_provider_tax_system_id_seq OWNED BY public.catalog_provider_tax_system.id;
          public          postgres    false    246            �            1259    18240    catalog_provideractivitytype    TABLE     �   CREATE TABLE public.catalog_provideractivitytype (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 0   DROP TABLE public.catalog_provideractivitytype;
       public         heap    postgres    false            �            1259    18238 #   catalog_provideractivitytype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_provideractivitytype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.catalog_provideractivitytype_id_seq;
       public          postgres    false    231            :           0    0 #   catalog_provideractivitytype_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.catalog_provideractivitytype_id_seq OWNED BY public.catalog_provideractivitytype.id;
          public          postgres    false    230            �            1259    18250    catalog_provideroutlet    TABLE     �   CREATE TABLE public.catalog_provideroutlet (
    id integer NOT NULL,
    local_name character varying(200) NOT NULL,
    information text NOT NULL,
    city_id integer NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 *   DROP TABLE public.catalog_provideroutlet;
       public         heap    postgres    false            �            1259    18248    catalog_provideroutlet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_provideroutlet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.catalog_provideroutlet_id_seq;
       public          postgres    false    233            ;           0    0    catalog_provideroutlet_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.catalog_provideroutlet_id_seq OWNED BY public.catalog_provideroutlet.id;
          public          postgres    false    232            �            1259    18271 %   catalog_rockwallmaterialpriceposition    TABLE     �   CREATE TABLE public.catalog_rockwallmaterialpriceposition (
    id integer NOT NULL,
    price double precision NOT NULL,
    name_id integer NOT NULL,
    owner_id integer
);
 9   DROP TABLE public.catalog_rockwallmaterialpriceposition;
       public         heap    postgres    false            �            1259    18269 ,   catalog_rockwallmaterialpriceposition_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialpriceposition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.catalog_rockwallmaterialpriceposition_id_seq;
       public          postgres    false    235            <           0    0 ,   catalog_rockwallmaterialpriceposition_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.catalog_rockwallmaterialpriceposition_id_seq OWNED BY public.catalog_rockwallmaterialpriceposition.id;
          public          postgres    false    234                        1259    26754 $   catalog_rockwallmaterialstandardsize    TABLE     4  CREATE TABLE public.catalog_rockwallmaterialstandardsize (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    a_size integer NOT NULL,
    b_size integer NOT NULL,
    c_size integer NOT NULL,
    size_type character varying(2) NOT NULL
);
 8   DROP TABLE public.catalog_rockwallmaterialstandardsize;
       public         heap    postgres    false            �            1259    26752 +   catalog_rockwallmaterialstandardsize_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialstandardsize_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.catalog_rockwallmaterialstandardsize_id_seq;
       public          postgres    false    256            =           0    0 +   catalog_rockwallmaterialstandardsize_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.catalog_rockwallmaterialstandardsize_id_seq OWNED BY public.catalog_rockwallmaterialstandardsize.id;
          public          postgres    false    255            �            1259    18279    catalog_rockwallmaterialunit    TABLE     "  CREATE TABLE public.catalog_rockwallmaterialunit (
    id integer NOT NULL,
    thermal_conductivity integer,
    primary_or_additional character varying(1) NOT NULL,
    body_type character varying(1) NOT NULL,
    brick_type character varying(1) NOT NULL,
    standard_size_id integer
);
 0   DROP TABLE public.catalog_rockwallmaterialunit;
       public         heap    postgres    false            
           1259    26900 "   catalog_rockwallmaterialunit_brand    TABLE     �   CREATE TABLE public.catalog_rockwallmaterialunit_brand (
    id integer NOT NULL,
    rockwallmaterialunit_id integer NOT NULL,
    productbrand_id integer NOT NULL
);
 6   DROP TABLE public.catalog_rockwallmaterialunit_brand;
       public         heap    postgres    false            	           1259    26898 )   catalog_rockwallmaterialunit_brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.catalog_rockwallmaterialunit_brand_id_seq;
       public          postgres    false    266            >           0    0 )   catalog_rockwallmaterialunit_brand_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.catalog_rockwallmaterialunit_brand_id_seq OWNED BY public.catalog_rockwallmaterialunit_brand.id;
          public          postgres    false    265                       1259    26764 $   catalog_rockwallmaterialunit_class_b    TABLE     �   CREATE TABLE public.catalog_rockwallmaterialunit_class_b (
    id integer NOT NULL,
    rockwallmaterialunit_id integer NOT NULL,
    classblight_id integer NOT NULL
);
 8   DROP TABLE public.catalog_rockwallmaterialunit_class_b;
       public         heap    postgres    false                       1259    26762 +   catalog_rockwallmaterialunit_class_b_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_class_b_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.catalog_rockwallmaterialunit_class_b_id_seq;
       public          postgres    false    258            ?           0    0 +   catalog_rockwallmaterialunit_class_b_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.catalog_rockwallmaterialunit_class_b_id_seq OWNED BY public.catalog_rockwallmaterialunit_class_b.id;
          public          postgres    false    257            �            1259    18277 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.catalog_rockwallmaterialunit_id_seq;
       public          postgres    false    237            @           0    0 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.catalog_rockwallmaterialunit_id_seq OWNED BY public.catalog_rockwallmaterialunit.id;
          public          postgres    false    236                       1259    26772 #   catalog_rockwallmaterialunit_mark_d    TABLE     �   CREATE TABLE public.catalog_rockwallmaterialunit_mark_d (
    id integer NOT NULL,
    rockwallmaterialunit_id integer NOT NULL,
    markd_id integer NOT NULL
);
 7   DROP TABLE public.catalog_rockwallmaterialunit_mark_d;
       public         heap    postgres    false                       1259    26770 *   catalog_rockwallmaterialunit_mark_d_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_mark_d_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.catalog_rockwallmaterialunit_mark_d_id_seq;
       public          postgres    false    260            A           0    0 *   catalog_rockwallmaterialunit_mark_d_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.catalog_rockwallmaterialunit_mark_d_id_seq OWNED BY public.catalog_rockwallmaterialunit_mark_d.id;
          public          postgres    false    259                       1259    26780 #   catalog_rockwallmaterialunit_mark_m    TABLE     �   CREATE TABLE public.catalog_rockwallmaterialunit_mark_m (
    id integer NOT NULL,
    rockwallmaterialunit_id integer NOT NULL,
    markm_id integer NOT NULL
);
 7   DROP TABLE public.catalog_rockwallmaterialunit_mark_m;
       public         heap    postgres    false                       1259    26778 *   catalog_rockwallmaterialunit_mark_m_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_mark_m_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.catalog_rockwallmaterialunit_mark_m_id_seq;
       public          postgres    false    262            B           0    0 *   catalog_rockwallmaterialunit_mark_m_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.catalog_rockwallmaterialunit_mark_m_id_seq OWNED BY public.catalog_rockwallmaterialunit_mark_m.id;
          public          postgres    false    261                       1259    26909 %   catalog_rockwallmaterialunit_producer    TABLE     �   CREATE TABLE public.catalog_rockwallmaterialunit_producer (
    id integer NOT NULL,
    rockwallmaterialunit_id integer NOT NULL,
    directproducer_id integer NOT NULL
);
 9   DROP TABLE public.catalog_rockwallmaterialunit_producer;
       public         heap    postgres    false                       1259    26907 ,   catalog_rockwallmaterialunit_producer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_producer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.catalog_rockwallmaterialunit_producer_id_seq;
       public          postgres    false    268            C           0    0 ,   catalog_rockwallmaterialunit_producer_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.catalog_rockwallmaterialunit_producer_id_seq OWNED BY public.catalog_rockwallmaterialunit_producer.id;
          public          postgres    false    267                       1259    26917 '   catalog_rockwallmaterialunit_trade_mark    TABLE     �   CREATE TABLE public.catalog_rockwallmaterialunit_trade_mark (
    id integer NOT NULL,
    rockwallmaterialunit_id integer NOT NULL,
    trademark_id integer NOT NULL
);
 ;   DROP TABLE public.catalog_rockwallmaterialunit_trade_mark;
       public         heap    postgres    false                       1259    26915 .   catalog_rockwallmaterialunit_trade_mark_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_trade_mark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.catalog_rockwallmaterialunit_trade_mark_id_seq;
       public          postgres    false    270            D           0    0 .   catalog_rockwallmaterialunit_trade_mark_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.catalog_rockwallmaterialunit_trade_mark_id_seq OWNED BY public.catalog_rockwallmaterialunit_trade_mark.id;
          public          postgres    false    269            �            1259    18303    catalog_taxsystemtype    TABLE     �   CREATE TABLE public.catalog_taxsystemtype (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL
);
 )   DROP TABLE public.catalog_taxsystemtype;
       public         heap    postgres    false            �            1259    18301    catalog_taxsystemtype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_taxsystemtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.catalog_taxsystemtype_id_seq;
       public          postgres    false    239            E           0    0    catalog_taxsystemtype_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.catalog_taxsystemtype_id_seq OWNED BY public.catalog_taxsystemtype.id;
          public          postgres    false    238            �            1259    18313    catalog_trademark    TABLE     �   CREATE TABLE public.catalog_trademark (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    brand_id integer NOT NULL
);
 %   DROP TABLE public.catalog_trademark;
       public         heap    postgres    false            �            1259    18311    catalog_trademark_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_trademark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.catalog_trademark_id_seq;
       public          postgres    false    241            F           0    0    catalog_trademark_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.catalog_trademark_id_seq OWNED BY public.catalog_trademark.id;
          public          postgres    false    240            �            1259    18323    catalog_trademarkseries    TABLE     �   CREATE TABLE public.catalog_trademarkseries (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    trademark_id integer NOT NULL
);
 +   DROP TABLE public.catalog_trademarkseries;
       public         heap    postgres    false            �            1259    18321    catalog_trademarkseries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_trademarkseries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.catalog_trademarkseries_id_seq;
       public          postgres    false    243            G           0    0    catalog_trademarkseries_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.catalog_trademarkseries_id_seq OWNED BY public.catalog_trademarkseries.id;
          public          postgres    false    242                       1259    26856    catalog_wallmaterialtype    TABLE     �   CREATE TABLE public.catalog_wallmaterialtype (
    id integer NOT NULL,
    identifier character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    common_wall_type character varying(1) NOT NULL
);
 ,   DROP TABLE public.catalog_wallmaterialtype;
       public         heap    postgres    false                       1259    26854    catalog_wallmaterialtype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_wallmaterialtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.catalog_wallmaterialtype_id_seq;
       public          postgres    false    264            H           0    0    catalog_wallmaterialtype_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.catalog_wallmaterialtype_id_seq OWNED BY public.catalog_wallmaterialtype.id;
          public          postgres    false    263            �            1259    18150    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false            �            1259    18148    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    219            I           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    218            �            1259    18036    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    18034    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            J           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    18025    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    18023    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            K           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    18495    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            ]           2604    18057    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            ^           2604    18067    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            \           2604    18049    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            _           2604    18075    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            `           2604    18085    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            a           2604    18093    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            d           2604    18183    catalog_application id    DEFAULT     �   ALTER TABLE ONLY public.catalog_application ALTER COLUMN id SET DEFAULT nextval('public.catalog_application_id_seq'::regclass);
 E   ALTER TABLE public.catalog_application ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            e           2604    18203    catalog_city id    DEFAULT     r   ALTER TABLE ONLY public.catalog_city ALTER COLUMN id SET DEFAULT nextval('public.catalog_city_id_seq'::regclass);
 >   ALTER TABLE public.catalog_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            r           2604    26727    catalog_classblight id    DEFAULT     {   ALTER TABLE ONLY public.catalog_classblight ALTER COLUMN id SET DEFAULT nextval('public.catalog_classb_id_seq'::regclass);
 E   ALTER TABLE public.catalog_classblight ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            g           2604    18223    catalog_directproducer id    DEFAULT     �   ALTER TABLE ONLY public.catalog_directproducer ALTER COLUMN id SET DEFAULT nextval('public.catalog_producer_id_seq'::regclass);
 H   ALTER TABLE public.catalog_directproducer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            s           2604    26737    catalog_markd id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markd ALTER COLUMN id SET DEFAULT nextval('public.catalog_markd_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markd ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252            t           2604    26747    catalog_markm id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markm ALTER COLUMN id SET DEFAULT nextval('public.catalog_markm_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            }           2604    26989 +   catalog_pilegrillagefoundationworkprices id    DEFAULT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices ALTER COLUMN id SET DEFAULT nextval('public.catalog_pilegrillagefoundationcost_id_seq'::regclass);
 Z   ALTER TABLE public.catalog_pilegrillagefoundationworkprices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    272    272            ~           2604    27057    catalog_plan id    DEFAULT     r   ALTER TABLE ONLY public.catalog_plan ALTER COLUMN id SET DEFAULT nextval('public.catalog_plan_id_seq'::regclass);
 >   ALTER TABLE public.catalog_plan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    274    273    274            f           2604    18213    catalog_productbrand id    DEFAULT     �   ALTER TABLE ONLY public.catalog_productbrand ALTER COLUMN id SET DEFAULT nextval('public.catalog_materialbrand_id_seq'::regclass);
 F   ALTER TABLE public.catalog_productbrand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            h           2604    18233    catalog_provider id    DEFAULT     z   ALTER TABLE ONLY public.catalog_provider ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_id_seq'::regclass);
 B   ALTER TABLE public.catalog_provider ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            p           2604    18354 &   catalog_provider_secondary_activity id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_secondary_activity_id_seq'::regclass);
 U   ALTER TABLE public.catalog_provider_secondary_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            q           2604    18362    catalog_provider_tax_system id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provider_tax_system ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_tax_system_id_seq'::regclass);
 M   ALTER TABLE public.catalog_provider_tax_system ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247            i           2604    18243    catalog_provideractivitytype id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provideractivitytype ALTER COLUMN id SET DEFAULT nextval('public.catalog_provideractivitytype_id_seq'::regclass);
 N   ALTER TABLE public.catalog_provideractivitytype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            j           2604    18253    catalog_provideroutlet id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provideroutlet ALTER COLUMN id SET DEFAULT nextval('public.catalog_provideroutlet_id_seq'::regclass);
 H   ALTER TABLE public.catalog_provideroutlet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            k           2604    18274 (   catalog_rockwallmaterialpriceposition id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialpriceposition_id_seq'::regclass);
 W   ALTER TABLE public.catalog_rockwallmaterialpriceposition ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235            u           2604    26757 '   catalog_rockwallmaterialstandardsize id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialstandardsize_id_seq'::regclass);
 V   ALTER TABLE public.catalog_rockwallmaterialstandardsize ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255    256            l           2604    18282    catalog_rockwallmaterialunit id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_id_seq'::regclass);
 N   ALTER TABLE public.catalog_rockwallmaterialunit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            z           2604    26903 %   catalog_rockwallmaterialunit_brand id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_brand_id_seq'::regclass);
 T   ALTER TABLE public.catalog_rockwallmaterialunit_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    265    266            v           2604    26767 '   catalog_rockwallmaterialunit_class_b id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_class_b_id_seq'::regclass);
 V   ALTER TABLE public.catalog_rockwallmaterialunit_class_b ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258            w           2604    26775 &   catalog_rockwallmaterialunit_mark_d id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_mark_d_id_seq'::regclass);
 U   ALTER TABLE public.catalog_rockwallmaterialunit_mark_d ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    260    260            x           2604    26783 &   catalog_rockwallmaterialunit_mark_m id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_mark_m_id_seq'::regclass);
 U   ALTER TABLE public.catalog_rockwallmaterialunit_mark_m ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261    262            {           2604    26912 (   catalog_rockwallmaterialunit_producer id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_producer_id_seq'::regclass);
 W   ALTER TABLE public.catalog_rockwallmaterialunit_producer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267    268            |           2604    26920 *   catalog_rockwallmaterialunit_trade_mark id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_trade_mark_id_seq'::regclass);
 Y   ALTER TABLE public.catalog_rockwallmaterialunit_trade_mark ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    270    270            m           2604    18306    catalog_taxsystemtype id    DEFAULT     �   ALTER TABLE ONLY public.catalog_taxsystemtype ALTER COLUMN id SET DEFAULT nextval('public.catalog_taxsystemtype_id_seq'::regclass);
 G   ALTER TABLE public.catalog_taxsystemtype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            n           2604    18316    catalog_trademark id    DEFAULT     |   ALTER TABLE ONLY public.catalog_trademark ALTER COLUMN id SET DEFAULT nextval('public.catalog_trademark_id_seq'::regclass);
 C   ALTER TABLE public.catalog_trademark ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            o           2604    18326    catalog_trademarkseries id    DEFAULT     �   ALTER TABLE ONLY public.catalog_trademarkseries ALTER COLUMN id SET DEFAULT nextval('public.catalog_trademarkseries_id_seq'::regclass);
 I   ALTER TABLE public.catalog_trademarkseries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            y           2604    26859    catalog_wallmaterialtype id    DEFAULT     �   ALTER TABLE ONLY public.catalog_wallmaterialtype ALTER COLUMN id SET DEFAULT nextval('public.catalog_wallmaterialtype_id_seq'::regclass);
 J   ALTER TABLE public.catalog_wallmaterialtype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    263    264            b           2604    18153    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            [           2604    18039    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            Z           2604    18028    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �          0    18054 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   �      �          0    18064    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   	      �          0    18046    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   &      �          0    18072 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   4"      �          0    18082    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   �#      �          0    18090    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   $      �          0    18180    catalog_application 
   TABLE DATA           C   COPY public.catalog_application (id, identifier, name) FROM stdin;
    public          postgres    false    221   :$      �          0    18200    catalog_city 
   TABLE DATA           0   COPY public.catalog_city (id, name) FROM stdin;
    public          postgres    false    223   �$      	          0    26724    catalog_classblight 
   TABLE DATA           C   COPY public.catalog_classblight (id, identifier, name) FROM stdin;
    public          postgres    false    250   (%      �          0    18220    catalog_directproducer 
   TABLE DATA           :   COPY public.catalog_directproducer (id, name) FROM stdin;
    public          postgres    false    227   V%                0    26734    catalog_markd 
   TABLE DATA           =   COPY public.catalog_markd (id, identifier, name) FROM stdin;
    public          postgres    false    252   �%                0    26744    catalog_markm 
   TABLE DATA           =   COPY public.catalog_markm (id, identifier, name) FROM stdin;
    public          postgres    false    254   �%                0    26986 (   catalog_pilegrillagefoundationworkprices 
   TABLE DATA             COPY public.catalog_pilegrillagefoundationworkprices (id, const_expenditure, transportation_procurement_cost, reinforcement_binding, clamp, pile_frame, formwork, pile_pour, man_hours_cost, man_hours_profit, owner_id, length_costs, square_costs, volume_costs) FROM stdin;
    public          postgres    false    272    &      !          0    27054    catalog_plan 
   TABLE DATA           1   COPY public.catalog_plan (id, title) FROM stdin;
    public          postgres    false    274   6&      �          0    18210    catalog_productbrand 
   TABLE DATA           8   COPY public.catalog_productbrand (id, name) FROM stdin;
    public          postgres    false    225   ^&      �          0    18230    catalog_provider 
   TABLE DATA           Y   COPY public.catalog_provider (id, name, ownership_form, primary_activity_id) FROM stdin;
    public          postgres    false    229   �&                0    18351 #   catalog_provider_secondary_activity 
   TABLE DATA           g   COPY public.catalog_provider_secondary_activity (id, provider_id, provideractivitytype_id) FROM stdin;
    public          postgres    false    245   �&                0    18359    catalog_provider_tax_system 
   TABLE DATA           X   COPY public.catalog_provider_tax_system (id, provider_id, taxsystemtype_id) FROM stdin;
    public          postgres    false    247   �&      �          0    18240    catalog_provideractivitytype 
   TABLE DATA           L   COPY public.catalog_provideractivitytype (id, identifier, name) FROM stdin;
    public          postgres    false    231   �&      �          0    18250    catalog_provideroutlet 
   TABLE DATA           i   COPY public.catalog_provideroutlet (id, local_name, information, city_id, name_id, owner_id) FROM stdin;
    public          postgres    false    233   �'      �          0    18271 %   catalog_rockwallmaterialpriceposition 
   TABLE DATA           ]   COPY public.catalog_rockwallmaterialpriceposition (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    235   �'                0    26754 $   catalog_rockwallmaterialstandardsize 
   TABLE DATA           w   COPY public.catalog_rockwallmaterialstandardsize (id, identifier, name, a_size, b_size, c_size, size_type) FROM stdin;
    public          postgres    false    256   �'      �          0    18279    catalog_rockwallmaterialunit 
   TABLE DATA           �   COPY public.catalog_rockwallmaterialunit (id, thermal_conductivity, primary_or_additional, body_type, brick_type, standard_size_id) FROM stdin;
    public          postgres    false    237   j(                0    26900 "   catalog_rockwallmaterialunit_brand 
   TABLE DATA           j   COPY public.catalog_rockwallmaterialunit_brand (id, rockwallmaterialunit_id, productbrand_id) FROM stdin;
    public          postgres    false    266   �(                0    26764 $   catalog_rockwallmaterialunit_class_b 
   TABLE DATA           k   COPY public.catalog_rockwallmaterialunit_class_b (id, rockwallmaterialunit_id, classblight_id) FROM stdin;
    public          postgres    false    258   �(                0    26772 #   catalog_rockwallmaterialunit_mark_d 
   TABLE DATA           d   COPY public.catalog_rockwallmaterialunit_mark_d (id, rockwallmaterialunit_id, markd_id) FROM stdin;
    public          postgres    false    260   �(                0    26780 #   catalog_rockwallmaterialunit_mark_m 
   TABLE DATA           d   COPY public.catalog_rockwallmaterialunit_mark_m (id, rockwallmaterialunit_id, markm_id) FROM stdin;
    public          postgres    false    262   �(                0    26909 %   catalog_rockwallmaterialunit_producer 
   TABLE DATA           o   COPY public.catalog_rockwallmaterialunit_producer (id, rockwallmaterialunit_id, directproducer_id) FROM stdin;
    public          postgres    false    268   !)                0    26917 '   catalog_rockwallmaterialunit_trade_mark 
   TABLE DATA           l   COPY public.catalog_rockwallmaterialunit_trade_mark (id, rockwallmaterialunit_id, trademark_id) FROM stdin;
    public          postgres    false    270   D)      �          0    18303    catalog_taxsystemtype 
   TABLE DATA           E   COPY public.catalog_taxsystemtype (id, identifier, name) FROM stdin;
    public          postgres    false    239   a)                 0    18313    catalog_trademark 
   TABLE DATA           ?   COPY public.catalog_trademark (id, name, brand_id) FROM stdin;
    public          postgres    false    241   �)                0    18323    catalog_trademarkseries 
   TABLE DATA           I   COPY public.catalog_trademarkseries (id, name, trademark_id) FROM stdin;
    public          postgres    false    243   *                0    26856    catalog_wallmaterialtype 
   TABLE DATA           Z   COPY public.catalog_wallmaterialtype (id, identifier, name, common_wall_type) FROM stdin;
    public          postgres    false    264   !*      �          0    18150    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   �*      �          0    18036    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   �2      �          0    18025    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   K4                0    18495    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    248   97      L           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);
          public          postgres    false    208            M           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            N           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 132, true);
          public          postgres    false    206            O           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 3, true);
          public          postgres    false    214            P           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);
          public          postgres    false    212            Q           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            R           0    0    catalog_application_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.catalog_application_id_seq', 5, true);
          public          postgres    false    220            S           0    0    catalog_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.catalog_city_id_seq', 2, true);
          public          postgres    false    222            T           0    0    catalog_classb_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_classb_id_seq', 2, true);
          public          postgres    false    249            U           0    0    catalog_markd_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.catalog_markd_id_seq', 2, true);
          public          postgres    false    251            V           0    0    catalog_markm_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.catalog_markm_id_seq', 2, true);
          public          postgres    false    253            W           0    0    catalog_materialbrand_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.catalog_materialbrand_id_seq', 1, true);
          public          postgres    false    224            X           0    0 )   catalog_pilegrillagefoundationcost_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.catalog_pilegrillagefoundationcost_id_seq', 2, true);
          public          postgres    false    271            Y           0    0    catalog_plan_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.catalog_plan_id_seq', 1, true);
          public          postgres    false    273            Z           0    0    catalog_producer_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.catalog_producer_id_seq', 2, true);
          public          postgres    false    226            [           0    0    catalog_provider_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.catalog_provider_id_seq', 1, false);
          public          postgres    false    228            \           0    0 *   catalog_provider_secondary_activity_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.catalog_provider_secondary_activity_id_seq', 1, false);
          public          postgres    false    244            ]           0    0 "   catalog_provider_tax_system_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.catalog_provider_tax_system_id_seq', 1, false);
          public          postgres    false    246            ^           0    0 #   catalog_provideractivitytype_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.catalog_provideractivitytype_id_seq', 4, true);
          public          postgres    false    230            _           0    0    catalog_provideroutlet_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.catalog_provideroutlet_id_seq', 1, false);
          public          postgres    false    232            `           0    0 ,   catalog_rockwallmaterialpriceposition_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.catalog_rockwallmaterialpriceposition_id_seq', 1, true);
          public          postgres    false    234            a           0    0 +   catalog_rockwallmaterialstandardsize_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.catalog_rockwallmaterialstandardsize_id_seq', 4, true);
          public          postgres    false    255            b           0    0 )   catalog_rockwallmaterialunit_brand_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_brand_id_seq', 1, true);
          public          postgres    false    265            c           0    0 +   catalog_rockwallmaterialunit_class_b_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_class_b_id_seq', 3, true);
          public          postgres    false    257            d           0    0 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_id_seq', 9, true);
          public          postgres    false    236            e           0    0 *   catalog_rockwallmaterialunit_mark_d_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_mark_d_id_seq', 3, true);
          public          postgres    false    259            f           0    0 *   catalog_rockwallmaterialunit_mark_m_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_mark_m_id_seq', 2, true);
          public          postgres    false    261            g           0    0 ,   catalog_rockwallmaterialunit_producer_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_producer_id_seq', 3, true);
          public          postgres    false    267            h           0    0 .   catalog_rockwallmaterialunit_trade_mark_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_trade_mark_id_seq', 1, false);
          public          postgres    false    269            i           0    0    catalog_taxsystemtype_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.catalog_taxsystemtype_id_seq', 3, true);
          public          postgres    false    238            j           0    0    catalog_trademark_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalog_trademark_id_seq', 1, false);
          public          postgres    false    240            k           0    0    catalog_trademarkseries_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.catalog_trademarkseries_id_seq', 1, false);
          public          postgres    false    242            l           0    0    catalog_wallmaterialtype_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.catalog_wallmaterialtype_id_seq', 5, true);
          public          postgres    false    263            m           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 71, true);
          public          postgres    false    218            n           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 31, true);
          public          postgres    false    204            o           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);
          public          postgres    false    202            �           2606    18061    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            �           2606    18116 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            �           2606    18069 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            �           2606    18059    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            �           2606    18102 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            �           2606    18051 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            �           2606    18087 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215            �           2606    18131 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            �           2606    18077    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213            �           2606    18095 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217            �           2606    18145 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            �           2606    18173     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213            �           2606    18513 6   catalog_application catalog_application_identifier_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.catalog_application
    ADD CONSTRAINT catalog_application_identifier_key UNIQUE (identifier);
 `   ALTER TABLE ONLY public.catalog_application DROP CONSTRAINT catalog_application_identifier_key;
       public            postgres    false    221            �           2606    18185 ,   catalog_application catalog_application_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.catalog_application
    ADD CONSTRAINT catalog_application_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.catalog_application DROP CONSTRAINT catalog_application_pkey;
       public            postgres    false    221            �           2606    18207 "   catalog_city catalog_city_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.catalog_city
    ADD CONSTRAINT catalog_city_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.catalog_city DROP CONSTRAINT catalog_city_name_key;
       public            postgres    false    223            �           2606    18205    catalog_city catalog_city_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.catalog_city
    ADD CONSTRAINT catalog_city_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.catalog_city DROP CONSTRAINT catalog_city_pkey;
       public            postgres    false    223            �           2606    26731 1   catalog_classblight catalog_classb_identifier_key 
   CONSTRAINT     r   ALTER TABLE ONLY public.catalog_classblight
    ADD CONSTRAINT catalog_classb_identifier_key UNIQUE (identifier);
 [   ALTER TABLE ONLY public.catalog_classblight DROP CONSTRAINT catalog_classb_identifier_key;
       public            postgres    false    250            �           2606    26729 '   catalog_classblight catalog_classb_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.catalog_classblight
    ADD CONSTRAINT catalog_classb_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.catalog_classblight DROP CONSTRAINT catalog_classb_pkey;
       public            postgres    false    250            �           2606    26741 *   catalog_markd catalog_markd_identifier_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_markd
    ADD CONSTRAINT catalog_markd_identifier_key UNIQUE (identifier);
 T   ALTER TABLE ONLY public.catalog_markd DROP CONSTRAINT catalog_markd_identifier_key;
       public            postgres    false    252            �           2606    26739     catalog_markd catalog_markd_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_markd
    ADD CONSTRAINT catalog_markd_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_markd DROP CONSTRAINT catalog_markd_pkey;
       public            postgres    false    252                       2606    26751 *   catalog_markm catalog_markm_identifier_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_markm
    ADD CONSTRAINT catalog_markm_identifier_key UNIQUE (identifier);
 T   ALTER TABLE ONLY public.catalog_markm DROP CONSTRAINT catalog_markm_identifier_key;
       public            postgres    false    254                       2606    26749     catalog_markm catalog_markm_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.catalog_markm
    ADD CONSTRAINT catalog_markm_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.catalog_markm DROP CONSTRAINT catalog_markm_pkey;
       public            postgres    false    254            �           2606    18217 3   catalog_productbrand catalog_materialbrand_name_key 
   CONSTRAINT     n   ALTER TABLE ONLY public.catalog_productbrand
    ADD CONSTRAINT catalog_materialbrand_name_key UNIQUE (name);
 ]   ALTER TABLE ONLY public.catalog_productbrand DROP CONSTRAINT catalog_materialbrand_name_key;
       public            postgres    false    225            �           2606    18215 /   catalog_productbrand catalog_materialbrand_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.catalog_productbrand
    ADD CONSTRAINT catalog_materialbrand_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY public.catalog_productbrand DROP CONSTRAINT catalog_materialbrand_pkey;
       public            postgres    false    225            5           2606    26991 P   catalog_pilegrillagefoundationworkprices catalog_pilegrillagefoundationcost_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices
    ADD CONSTRAINT catalog_pilegrillagefoundationcost_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices DROP CONSTRAINT catalog_pilegrillagefoundationcost_pkey;
       public            postgres    false    272            7           2606    27059    catalog_plan catalog_plan_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.catalog_plan
    ADD CONSTRAINT catalog_plan_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.catalog_plan DROP CONSTRAINT catalog_plan_pkey;
       public            postgres    false    274            �           2606    18227 0   catalog_directproducer catalog_producer_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_directproducer
    ADD CONSTRAINT catalog_producer_name_key UNIQUE (name);
 Z   ALTER TABLE ONLY public.catalog_directproducer DROP CONSTRAINT catalog_producer_name_key;
       public            postgres    false    227            �           2606    18225 ,   catalog_directproducer catalog_producer_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.catalog_directproducer
    ADD CONSTRAINT catalog_producer_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.catalog_directproducer DROP CONSTRAINT catalog_producer_pkey;
       public            postgres    false    227            �           2606    18237 *   catalog_provider catalog_provider_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_name_key;
       public            postgres    false    229            �           2606    18235 &   catalog_provider catalog_provider_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_pkey;
       public            postgres    false    229            �           2606    18478 c   catalog_provider_secondary_activity catalog_provider_seconda_provider_id_provideracti_2a5631df_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_seconda_provider_id_provideracti_2a5631df_uniq UNIQUE (provider_id, provideractivitytype_id);
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_seconda_provider_id_provideracti_2a5631df_uniq;
       public            postgres    false    245    245            �           2606    18356 L   catalog_provider_secondary_activity catalog_provider_secondary_activity_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_secondary_activity_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_secondary_activity_pkey;
       public            postgres    false    245            �           2606    18492 [   catalog_provider_tax_system catalog_provider_tax_sys_provider_id_taxsystemtyp_84bf5152_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_tax_system
    ADD CONSTRAINT catalog_provider_tax_sys_provider_id_taxsystemtyp_84bf5152_uniq UNIQUE (provider_id, taxsystemtype_id);
 �   ALTER TABLE ONLY public.catalog_provider_tax_system DROP CONSTRAINT catalog_provider_tax_sys_provider_id_taxsystemtyp_84bf5152_uniq;
       public            postgres    false    247    247            �           2606    18364 <   catalog_provider_tax_system catalog_provider_tax_system_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.catalog_provider_tax_system
    ADD CONSTRAINT catalog_provider_tax_system_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.catalog_provider_tax_system DROP CONSTRAINT catalog_provider_tax_system_pkey;
       public            postgres    false    247            �           2606    18519 H   catalog_provideractivitytype catalog_provideractivitytype_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provideractivitytype
    ADD CONSTRAINT catalog_provideractivitytype_identifier_key UNIQUE (identifier);
 r   ALTER TABLE ONLY public.catalog_provideractivitytype DROP CONSTRAINT catalog_provideractivitytype_identifier_key;
       public            postgres    false    231            �           2606    18245 >   catalog_provideractivitytype catalog_provideractivitytype_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.catalog_provideractivitytype
    ADD CONSTRAINT catalog_provideractivitytype_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.catalog_provideractivitytype DROP CONSTRAINT catalog_provideractivitytype_pkey;
       public            postgres    false    231            �           2606    18258 2   catalog_provideroutlet catalog_provideroutlet_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.catalog_provideroutlet
    ADD CONSTRAINT catalog_provideroutlet_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.catalog_provideroutlet DROP CONSTRAINT catalog_provideroutlet_pkey;
       public            postgres    false    233            "           2606    26934 b   catalog_rockwallmaterialunit_brand catalog_rockwallmaterial_rockwallmaterialunit_id__58bcaae8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__58bcaae8_uniq UNIQUE (rockwallmaterialunit_id, productbrand_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__58bcaae8_uniq;
       public            postgres    false    266    266                       2606    26809 d   catalog_rockwallmaterialunit_class_b catalog_rockwallmaterial_rockwallmaterialunit_id__6fe40e85_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__6fe40e85_uniq UNIQUE (rockwallmaterialunit_id, classblight_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__6fe40e85_uniq;
       public            postgres    false    258    258            .           2606    26962 g   catalog_rockwallmaterialunit_trade_mark catalog_rockwallmaterial_rockwallmaterialunit_id__9691e92a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__9691e92a_uniq UNIQUE (rockwallmaterialunit_id, trademark_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__9691e92a_uniq;
       public            postgres    false    270    270                       2606    26823 c   catalog_rockwallmaterialunit_mark_d catalog_rockwallmaterial_rockwallmaterialunit_id__ce4c7c58_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__ce4c7c58_uniq UNIQUE (rockwallmaterialunit_id, markd_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__ce4c7c58_uniq;
       public            postgres    false    260    260            (           2606    26948 e   catalog_rockwallmaterialunit_producer catalog_rockwallmaterial_rockwallmaterialunit_id__eafcd31a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__eafcd31a_uniq UNIQUE (rockwallmaterialunit_id, directproducer_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__eafcd31a_uniq;
       public            postgres    false    268    268                       2606    26837 c   catalog_rockwallmaterialunit_mark_m catalog_rockwallmaterial_rockwallmaterialunit_id__ef817d8b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__ef817d8b_uniq UNIQUE (rockwallmaterialunit_id, markm_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__ef817d8b_uniq;
       public            postgres    false    262    262            �           2606    18276 P   catalog_rockwallmaterialpriceposition catalog_rockwallmaterialpriceposition_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition
    ADD CONSTRAINT catalog_rockwallmaterialpriceposition_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition DROP CONSTRAINT catalog_rockwallmaterialpriceposition_pkey;
       public            postgres    false    235                       2606    26761 X   catalog_rockwallmaterialstandardsize catalog_rockwallmaterialstandardsize_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize
    ADD CONSTRAINT catalog_rockwallmaterialstandardsize_identifier_key UNIQUE (identifier);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize DROP CONSTRAINT catalog_rockwallmaterialstandardsize_identifier_key;
       public            postgres    false    256            	           2606    26759 N   catalog_rockwallmaterialstandardsize catalog_rockwallmaterialstandardsize_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize
    ADD CONSTRAINT catalog_rockwallmaterialstandardsize_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize DROP CONSTRAINT catalog_rockwallmaterialstandardsize_pkey;
       public            postgres    false    256            %           2606    26905 J   catalog_rockwallmaterialunit_brand catalog_rockwallmaterialunit_brand_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand
    ADD CONSTRAINT catalog_rockwallmaterialunit_brand_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand DROP CONSTRAINT catalog_rockwallmaterialunit_brand_pkey;
       public            postgres    false    266                       2606    26769 N   catalog_rockwallmaterialunit_class_b catalog_rockwallmaterialunit_class_b_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b
    ADD CONSTRAINT catalog_rockwallmaterialunit_class_b_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b DROP CONSTRAINT catalog_rockwallmaterialunit_class_b_pkey;
       public            postgres    false    258                       2606    26777 L   catalog_rockwallmaterialunit_mark_d catalog_rockwallmaterialunit_mark_d_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d
    ADD CONSTRAINT catalog_rockwallmaterialunit_mark_d_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d DROP CONSTRAINT catalog_rockwallmaterialunit_mark_d_pkey;
       public            postgres    false    260                       2606    26785 L   catalog_rockwallmaterialunit_mark_m catalog_rockwallmaterialunit_mark_m_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m
    ADD CONSTRAINT catalog_rockwallmaterialunit_mark_m_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m DROP CONSTRAINT catalog_rockwallmaterialunit_mark_m_pkey;
       public            postgres    false    262            �           2606    18284 >   catalog_rockwallmaterialunit catalog_rockwallmaterialunit_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmaterialunit_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmaterialunit_pkey;
       public            postgres    false    237            ,           2606    26914 P   catalog_rockwallmaterialunit_producer catalog_rockwallmaterialunit_producer_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer
    ADD CONSTRAINT catalog_rockwallmaterialunit_producer_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer DROP CONSTRAINT catalog_rockwallmaterialunit_producer_pkey;
       public            postgres    false    268            1           2606    26922 T   catalog_rockwallmaterialunit_trade_mark catalog_rockwallmaterialunit_trade_mark_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark
    ADD CONSTRAINT catalog_rockwallmaterialunit_trade_mark_pkey PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark DROP CONSTRAINT catalog_rockwallmaterialunit_trade_mark_pkey;
       public            postgres    false    270            �           2606    18525 :   catalog_taxsystemtype catalog_taxsystemtype_identifier_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.catalog_taxsystemtype
    ADD CONSTRAINT catalog_taxsystemtype_identifier_key UNIQUE (identifier);
 d   ALTER TABLE ONLY public.catalog_taxsystemtype DROP CONSTRAINT catalog_taxsystemtype_identifier_key;
       public            postgres    false    239            �           2606    18308 0   catalog_taxsystemtype catalog_taxsystemtype_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.catalog_taxsystemtype
    ADD CONSTRAINT catalog_taxsystemtype_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.catalog_taxsystemtype DROP CONSTRAINT catalog_taxsystemtype_pkey;
       public            postgres    false    239            �           2606    18320 ,   catalog_trademark catalog_trademark_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.catalog_trademark
    ADD CONSTRAINT catalog_trademark_name_key UNIQUE (name);
 V   ALTER TABLE ONLY public.catalog_trademark DROP CONSTRAINT catalog_trademark_name_key;
       public            postgres    false    241            �           2606    18318 (   catalog_trademark catalog_trademark_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.catalog_trademark
    ADD CONSTRAINT catalog_trademark_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.catalog_trademark DROP CONSTRAINT catalog_trademark_pkey;
       public            postgres    false    241            �           2606    18330 8   catalog_trademarkseries catalog_trademarkseries_name_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.catalog_trademarkseries
    ADD CONSTRAINT catalog_trademarkseries_name_key UNIQUE (name);
 b   ALTER TABLE ONLY public.catalog_trademarkseries DROP CONSTRAINT catalog_trademarkseries_name_key;
       public            postgres    false    243            �           2606    18328 4   catalog_trademarkseries catalog_trademarkseries_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.catalog_trademarkseries
    ADD CONSTRAINT catalog_trademarkseries_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.catalog_trademarkseries DROP CONSTRAINT catalog_trademarkseries_pkey;
       public            postgres    false    243                       2606    26863 @   catalog_wallmaterialtype catalog_wallmaterialtype_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_wallmaterialtype
    ADD CONSTRAINT catalog_wallmaterialtype_identifier_key UNIQUE (identifier);
 j   ALTER TABLE ONLY public.catalog_wallmaterialtype DROP CONSTRAINT catalog_wallmaterialtype_identifier_key;
       public            postgres    false    264                        2606    26861 6   catalog_wallmaterialtype catalog_wallmaterialtype_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.catalog_wallmaterialtype
    ADD CONSTRAINT catalog_wallmaterialtype_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.catalog_wallmaterialtype DROP CONSTRAINT catalog_wallmaterialtype_pkey;
       public            postgres    false    264            �           2606    18159 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219            �           2606    18043 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            �           2606    18041 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            �           2606    18033 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            �           2606    18502 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    248            �           1259    18104    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            �           1259    18117 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            �           1259    18118 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            �           1259    18103 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            �           1259    18133 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215            �           1259    18132 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215            �           1259    18147 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            �           1259    18146 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            �           1259    18174     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213            �           1259    18514 ,   catalog_application_identifier_0719a225_like    INDEX     �   CREATE INDEX catalog_application_identifier_0719a225_like ON public.catalog_application USING btree (identifier varchar_pattern_ops);
 @   DROP INDEX public.catalog_application_identifier_0719a225_like;
       public            postgres    false    221            �           1259    18367    catalog_city_name_cafc1586_like    INDEX     l   CREATE INDEX catalog_city_name_cafc1586_like ON public.catalog_city USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.catalog_city_name_cafc1586_like;
       public            postgres    false    223            �           1259    26794 '   catalog_classb_identifier_d34d76e2_like    INDEX     �   CREATE INDEX catalog_classb_identifier_d34d76e2_like ON public.catalog_classblight USING btree (identifier varchar_pattern_ops);
 ;   DROP INDEX public.catalog_classb_identifier_d34d76e2_like;
       public            postgres    false    250            �           1259    26795 &   catalog_markd_identifier_94610a4e_like    INDEX     z   CREATE INDEX catalog_markd_identifier_94610a4e_like ON public.catalog_markd USING btree (identifier varchar_pattern_ops);
 :   DROP INDEX public.catalog_markd_identifier_94610a4e_like;
       public            postgres    false    252                        1259    26796 &   catalog_markm_identifier_43ab376a_like    INDEX     z   CREATE INDEX catalog_markm_identifier_43ab376a_like ON public.catalog_markm USING btree (identifier varchar_pattern_ops);
 :   DROP INDEX public.catalog_markm_identifier_43ab376a_like;
       public            postgres    false    254            �           1259    18368 (   catalog_materialbrand_name_7bd3d144_like    INDEX     }   CREATE INDEX catalog_materialbrand_name_7bd3d144_like ON public.catalog_productbrand USING btree (name varchar_pattern_ops);
 <   DROP INDEX public.catalog_materialbrand_name_7bd3d144_like;
       public            postgres    false    225            3           1259    26997 4   catalog_pilegrillagefoundationcost_owner_id_38d99042    INDEX     �   CREATE INDEX catalog_pilegrillagefoundationcost_owner_id_38d99042 ON public.catalog_pilegrillagefoundationworkprices USING btree (owner_id);
 H   DROP INDEX public.catalog_pilegrillagefoundationcost_owner_id_38d99042;
       public            postgres    false    272            �           1259    18369 #   catalog_producer_name_d9d25ff3_like    INDEX     z   CREATE INDEX catalog_producer_name_d9d25ff3_like ON public.catalog_directproducer USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.catalog_producer_name_d9d25ff3_like;
       public            postgres    false    227            �           1259    18370 #   catalog_provider_name_23080848_like    INDEX     t   CREATE INDEX catalog_provider_name_23080848_like ON public.catalog_provider USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.catalog_provider_name_23080848_like;
       public            postgres    false    229            �           1259    18461 -   catalog_provider_primary_activity_id_5ff3703d    INDEX     y   CREATE INDEX catalog_provider_primary_activity_id_5ff3703d ON public.catalog_provider USING btree (primary_activity_id);
 A   DROP INDEX public.catalog_provider_primary_activity_id_5ff3703d;
       public            postgres    false    229            �           1259    18479 8   catalog_provider_secondary_activity_provider_id_1050e31c    INDEX     �   CREATE INDEX catalog_provider_secondary_activity_provider_id_1050e31c ON public.catalog_provider_secondary_activity USING btree (provider_id);
 L   DROP INDEX public.catalog_provider_secondary_activity_provider_id_1050e31c;
       public            postgres    false    245            �           1259    18480 ;   catalog_provider_secondary_provideractivitytype_id_b77a182c    INDEX     �   CREATE INDEX catalog_provider_secondary_provideractivitytype_id_b77a182c ON public.catalog_provider_secondary_activity USING btree (provideractivitytype_id);
 O   DROP INDEX public.catalog_provider_secondary_provideractivitytype_id_b77a182c;
       public            postgres    false    245            �           1259    18493 0   catalog_provider_tax_system_provider_id_d0d5b87d    INDEX        CREATE INDEX catalog_provider_tax_system_provider_id_d0d5b87d ON public.catalog_provider_tax_system USING btree (provider_id);
 D   DROP INDEX public.catalog_provider_tax_system_provider_id_d0d5b87d;
       public            postgres    false    247            �           1259    18494 5   catalog_provider_tax_system_taxsystemtype_id_886b2f4c    INDEX     �   CREATE INDEX catalog_provider_tax_system_taxsystemtype_id_886b2f4c ON public.catalog_provider_tax_system USING btree (taxsystemtype_id);
 I   DROP INDEX public.catalog_provider_tax_system_taxsystemtype_id_886b2f4c;
       public            postgres    false    247            �           1259    18520 5   catalog_provideractivitytype_identifier_3b6aaeae_like    INDEX     �   CREATE INDEX catalog_provideractivitytype_identifier_3b6aaeae_like ON public.catalog_provideractivitytype USING btree (identifier varchar_pattern_ops);
 I   DROP INDEX public.catalog_provideractivitytype_identifier_3b6aaeae_like;
       public            postgres    false    231            �           1259    18387 '   catalog_provideroutlet_city_id_1642bb7a    INDEX     m   CREATE INDEX catalog_provideroutlet_city_id_1642bb7a ON public.catalog_provideroutlet USING btree (city_id);
 ;   DROP INDEX public.catalog_provideroutlet_city_id_1642bb7a;
       public            postgres    false    233            �           1259    18388 '   catalog_provideroutlet_name_id_da8a3b33    INDEX     m   CREATE INDEX catalog_provideroutlet_name_id_da8a3b33 ON public.catalog_provideroutlet USING btree (name_id);
 ;   DROP INDEX public.catalog_provideroutlet_name_id_da8a3b33;
       public            postgres    false    233            �           1259    18389 (   catalog_provideroutlet_owner_id_496d374f    INDEX     o   CREATE INDEX catalog_provideroutlet_owner_id_496d374f ON public.catalog_provideroutlet USING btree (owner_id);
 <   DROP INDEX public.catalog_provideroutlet_owner_id_496d374f;
       public            postgres    false    233            �           1259    18449 6   catalog_rockwallmaterialpriceposition_name_id_17c3a4a8    INDEX     �   CREATE INDEX catalog_rockwallmaterialpriceposition_name_id_17c3a4a8 ON public.catalog_rockwallmaterialpriceposition USING btree (name_id);
 J   DROP INDEX public.catalog_rockwallmaterialpriceposition_name_id_17c3a4a8;
       public            postgres    false    235            �           1259    18506 7   catalog_rockwallmaterialpriceposition_owner_id_5cb00786    INDEX     �   CREATE INDEX catalog_rockwallmaterialpriceposition_owner_id_5cb00786 ON public.catalog_rockwallmaterialpriceposition USING btree (owner_id);
 K   DROP INDEX public.catalog_rockwallmaterialpriceposition_owner_id_5cb00786;
       public            postgres    false    235                       1259    26797 =   catalog_rockwallmaterialstandardsize_identifier_1e278702_like    INDEX     �   CREATE INDEX catalog_rockwallmaterialstandardsize_identifier_1e278702_like ON public.catalog_rockwallmaterialstandardsize USING btree (identifier varchar_pattern_ops);
 Q   DROP INDEX public.catalog_rockwallmaterialstandardsize_identifier_1e278702_like;
       public            postgres    false    256            )           1259    26950 5   catalog_rockwallmaterialun_directproducer_id_bfaab3b6    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_directproducer_id_bfaab3b6 ON public.catalog_rockwallmaterialunit_producer USING btree (directproducer_id);
 I   DROP INDEX public.catalog_rockwallmaterialun_directproducer_id_bfaab3b6;
       public            postgres    false    268                       1259    26810 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_51474c00    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_51474c00 ON public.catalog_rockwallmaterialunit_class_b USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_51474c00;
       public            postgres    false    258            /           1259    26963 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_73cb98d9    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_73cb98d9 ON public.catalog_rockwallmaterialunit_trade_mark USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_73cb98d9;
       public            postgres    false    270                       1259    26824 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_81d664e3    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_81d664e3 ON public.catalog_rockwallmaterialunit_mark_d USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_81d664e3;
       public            postgres    false    260            *           1259    26949 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_ba32081d    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_ba32081d ON public.catalog_rockwallmaterialunit_producer USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_ba32081d;
       public            postgres    false    268            #           1259    26935 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_bcc17867    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_bcc17867 ON public.catalog_rockwallmaterialunit_brand USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_bcc17867;
       public            postgres    false    266                       1259    26838 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_fd6d0c7d    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_fd6d0c7d ON public.catalog_rockwallmaterialunit_mark_m USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_fd6d0c7d;
       public            postgres    false    262            &           1259    26936 ;   catalog_rockwallmaterialunit_brand_productbrand_id_36de2fb0    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_brand_productbrand_id_36de2fb0 ON public.catalog_rockwallmaterialunit_brand USING btree (productbrand_id);
 O   DROP INDEX public.catalog_rockwallmaterialunit_brand_productbrand_id_36de2fb0;
       public            postgres    false    266                       1259    26811 7   catalog_rockwallmaterialunit_class_b_classb_id_2ae3624e    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_class_b_classb_id_2ae3624e ON public.catalog_rockwallmaterialunit_class_b USING btree (classblight_id);
 K   DROP INDEX public.catalog_rockwallmaterialunit_class_b_classb_id_2ae3624e;
       public            postgres    false    258                       1259    26825 5   catalog_rockwallmaterialunit_mark_d_markd_id_0cb39fa5    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_mark_d_markd_id_0cb39fa5 ON public.catalog_rockwallmaterialunit_mark_d USING btree (markd_id);
 I   DROP INDEX public.catalog_rockwallmaterialunit_mark_d_markd_id_0cb39fa5;
       public            postgres    false    260                       1259    26839 5   catalog_rockwallmaterialunit_mark_m_markm_id_d6c246a8    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_mark_m_markm_id_d6c246a8 ON public.catalog_rockwallmaterialunit_mark_m USING btree (markm_id);
 I   DROP INDEX public.catalog_rockwallmaterialunit_mark_m_markm_id_d6c246a8;
       public            postgres    false    262            �           1259    26967 6   catalog_rockwallmaterialunit_standard_size_id_4948e697    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_standard_size_id_4948e697 ON public.catalog_rockwallmaterialunit USING btree (standard_size_id);
 J   DROP INDEX public.catalog_rockwallmaterialunit_standard_size_id_4948e697;
       public            postgres    false    237            2           1259    26964 =   catalog_rockwallmaterialunit_trade_mark_trademark_id_1b3ea04a    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_trade_mark_trademark_id_1b3ea04a ON public.catalog_rockwallmaterialunit_trade_mark USING btree (trademark_id);
 Q   DROP INDEX public.catalog_rockwallmaterialunit_trade_mark_trademark_id_1b3ea04a;
       public            postgres    false    270            �           1259    18526 .   catalog_taxsystemtype_identifier_c4e29c1f_like    INDEX     �   CREATE INDEX catalog_taxsystemtype_identifier_c4e29c1f_like ON public.catalog_taxsystemtype USING btree (identifier varchar_pattern_ops);
 B   DROP INDEX public.catalog_taxsystemtype_identifier_c4e29c1f_like;
       public            postgres    false    239            �           1259    18426 #   catalog_trademark_brand_id_1f05b25a    INDEX     e   CREATE INDEX catalog_trademark_brand_id_1f05b25a ON public.catalog_trademark USING btree (brand_id);
 7   DROP INDEX public.catalog_trademark_brand_id_1f05b25a;
       public            postgres    false    241            �           1259    18425 $   catalog_trademark_name_c2f3ac10_like    INDEX     v   CREATE INDEX catalog_trademark_name_c2f3ac10_like ON public.catalog_trademark USING btree (name varchar_pattern_ops);
 8   DROP INDEX public.catalog_trademark_name_c2f3ac10_like;
       public            postgres    false    241            �           1259    18432 *   catalog_trademarkseries_name_539eb61f_like    INDEX     �   CREATE INDEX catalog_trademarkseries_name_539eb61f_like ON public.catalog_trademarkseries USING btree (name varchar_pattern_ops);
 >   DROP INDEX public.catalog_trademarkseries_name_539eb61f_like;
       public            postgres    false    243            �           1259    18433 -   catalog_trademarkseries_trademark_id_49fa59f5    INDEX     y   CREATE INDEX catalog_trademarkseries_trademark_id_49fa59f5 ON public.catalog_trademarkseries USING btree (trademark_id);
 A   DROP INDEX public.catalog_trademarkseries_trademark_id_49fa59f5;
       public            postgres    false    243                       1259    26872 1   catalog_wallmaterialtype_identifier_d62c39ea_like    INDEX     �   CREATE INDEX catalog_wallmaterialtype_identifier_d62c39ea_like ON public.catalog_wallmaterialtype USING btree (identifier varchar_pattern_ops);
 E   DROP INDEX public.catalog_wallmaterialtype_identifier_d62c39ea_like;
       public            postgres    false    264            �           1259    18170 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219            �           1259    18171 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219            �           1259    18504 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    248            �           1259    18503 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    248            :           2606    18110 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    207    211    2953            9           2606    18105 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    2958    211    209            8           2606    18096 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    2948    207    205            <           2606    18125 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    209    215    2958            ;           2606    18120 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    2966    215    213            >           2606    18139 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    207    217    2953            =           2606    18134 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    217    2966    213            Z           2606    26992 \   catalog_pilegrillagefoundationworkprices catalog_pilegrillage_owner_id_38d99042_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices
    ADD CONSTRAINT catalog_pilegrillage_owner_id_38d99042_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationworkprices DROP CONSTRAINT catalog_pilegrillage_owner_id_38d99042_fk_auth_user;
       public          postgres    false    2966    213    272            A           2606    18462 K   catalog_provider catalog_provider_primary_activity_id_5ff3703d_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_primary_activity_id_5ff3703d_fk_catalog_p FOREIGN KEY (primary_activity_id) REFERENCES public.catalog_provideractivitytype(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_primary_activity_id_5ff3703d_fk_catalog_p;
       public          postgres    false    231    229    3016            J           2606    18467 Z   catalog_provider_secondary_activity catalog_provider_sec_provider_id_1050e31c_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_sec_provider_id_1050e31c_fk_catalog_p FOREIGN KEY (provider_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_sec_provider_id_1050e31c_fk_catalog_p;
       public          postgres    false    229    3010    245            K           2606    18472 c   catalog_provider_secondary_activity catalog_provider_sec_provideractivitytype_b77a182c_fk_catalog_p    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_sec_provideractivitytype_b77a182c_fk_catalog_p FOREIGN KEY (provideractivitytype_id) REFERENCES public.catalog_provideractivitytype(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_sec_provideractivitytype_b77a182c_fk_catalog_p;
       public          postgres    false    3016    245    231            L           2606    18481 R   catalog_provider_tax_system catalog_provider_tax_provider_id_d0d5b87d_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_tax_system
    ADD CONSTRAINT catalog_provider_tax_provider_id_d0d5b87d_fk_catalog_p FOREIGN KEY (provider_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.catalog_provider_tax_system DROP CONSTRAINT catalog_provider_tax_provider_id_d0d5b87d_fk_catalog_p;
       public          postgres    false    3010    247    229            M           2606    18486 W   catalog_provider_tax_system catalog_provider_tax_taxsystemtype_id_886b2f4c_fk_catalog_t    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_tax_system
    ADD CONSTRAINT catalog_provider_tax_taxsystemtype_id_886b2f4c_fk_catalog_t FOREIGN KEY (taxsystemtype_id) REFERENCES public.catalog_taxsystemtype(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_tax_system DROP CONSTRAINT catalog_provider_tax_taxsystemtype_id_886b2f4c_fk_catalog_t;
       public          postgres    false    3033    239    247            B           2606    18372 Q   catalog_provideroutlet catalog_provideroutlet_city_id_1642bb7a_fk_catalog_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provideroutlet
    ADD CONSTRAINT catalog_provideroutlet_city_id_1642bb7a_fk_catalog_city_id FOREIGN KEY (city_id) REFERENCES public.catalog_city(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_provideroutlet DROP CONSTRAINT catalog_provideroutlet_city_id_1642bb7a_fk_catalog_city_id;
       public          postgres    false    2995    233    223            C           2606    18377 U   catalog_provideroutlet catalog_provideroutlet_name_id_da8a3b33_fk_catalog_provider_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provideroutlet
    ADD CONSTRAINT catalog_provideroutlet_name_id_da8a3b33_fk_catalog_provider_id FOREIGN KEY (name_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.catalog_provideroutlet DROP CONSTRAINT catalog_provideroutlet_name_id_da8a3b33_fk_catalog_provider_id;
       public          postgres    false    3010    233    229            D           2606    18382 O   catalog_provideroutlet catalog_provideroutlet_owner_id_496d374f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provideroutlet
    ADD CONSTRAINT catalog_provideroutlet_owner_id_496d374f_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.catalog_provideroutlet DROP CONSTRAINT catalog_provideroutlet_owner_id_496d374f_fk_auth_user_id;
       public          postgres    false    213    233    2966            N           2606    26887 ^   catalog_rockwallmaterialunit_class_b catalog_rockwallmate_classblight_id_6e007ad6_fk_catalog_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b
    ADD CONSTRAINT catalog_rockwallmate_classblight_id_6e007ad6_fk_catalog_c FOREIGN KEY (classblight_id) REFERENCES public.catalog_classblight(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b DROP CONSTRAINT catalog_rockwallmate_classblight_id_6e007ad6_fk_catalog_c;
       public          postgres    false    250    3066    258            W           2606    26942 b   catalog_rockwallmaterialunit_producer catalog_rockwallmate_directproducer_id_bfaab3b6_fk_catalog_d    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer
    ADD CONSTRAINT catalog_rockwallmate_directproducer_id_bfaab3b6_fk_catalog_d FOREIGN KEY (directproducer_id) REFERENCES public.catalog_directproducer(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer DROP CONSTRAINT catalog_rockwallmate_directproducer_id_bfaab3b6_fk_catalog_d;
       public          postgres    false    3005    227    268            Q           2606    26817 W   catalog_rockwallmaterialunit_mark_d catalog_rockwallmate_markd_id_0cb39fa5_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d
    ADD CONSTRAINT catalog_rockwallmate_markd_id_0cb39fa5_fk_catalog_m FOREIGN KEY (markd_id) REFERENCES public.catalog_markd(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d DROP CONSTRAINT catalog_rockwallmate_markd_id_0cb39fa5_fk_catalog_m;
       public          postgres    false    260    252    3071            S           2606    26831 W   catalog_rockwallmaterialunit_mark_m catalog_rockwallmate_markm_id_d6c246a8_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m
    ADD CONSTRAINT catalog_rockwallmate_markm_id_d6c246a8_fk_catalog_m FOREIGN KEY (markm_id) REFERENCES public.catalog_markm(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m DROP CONSTRAINT catalog_rockwallmate_markm_id_d6c246a8_fk_catalog_m;
       public          postgres    false    254    3076    262            E           2606    18450 X   catalog_rockwallmaterialpriceposition catalog_rockwallmate_name_id_17c3a4a8_fk_catalog_r    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition
    ADD CONSTRAINT catalog_rockwallmate_name_id_17c3a4a8_fk_catalog_r FOREIGN KEY (name_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition DROP CONSTRAINT catalog_rockwallmate_name_id_17c3a4a8_fk_catalog_r;
       public          postgres    false    3027    235    237            F           2606    18507 Y   catalog_rockwallmaterialpriceposition catalog_rockwallmate_owner_id_5cb00786_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition
    ADD CONSTRAINT catalog_rockwallmate_owner_id_5cb00786_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition DROP CONSTRAINT catalog_rockwallmate_owner_id_5cb00786_fk_auth_user;
       public          postgres    false    213    2966    235            U           2606    26928 ]   catalog_rockwallmaterialunit_brand catalog_rockwallmate_productbrand_id_36de2fb0_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand
    ADD CONSTRAINT catalog_rockwallmate_productbrand_id_36de2fb0_fk_catalog_p FOREIGN KEY (productbrand_id) REFERENCES public.catalog_productbrand(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand DROP CONSTRAINT catalog_rockwallmate_productbrand_id_36de2fb0_fk_catalog_p;
       public          postgres    false    3000    225    266            O           2606    26892 d   catalog_rockwallmaterialunit_class_b catalog_rockwallmate_rockwallmaterialunit_51474c00_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_51474c00_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_51474c00_fk_catalog_r;
       public          postgres    false    237    3027    258            X           2606    26951 g   catalog_rockwallmaterialunit_trade_mark catalog_rockwallmate_rockwallmaterialunit_73cb98d9_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_73cb98d9_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_73cb98d9_fk_catalog_r;
       public          postgres    false    270    237    3027            P           2606    26812 c   catalog_rockwallmaterialunit_mark_d catalog_rockwallmate_rockwallmaterialunit_81d664e3_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_81d664e3_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_81d664e3_fk_catalog_r;
       public          postgres    false    260    3027    237            V           2606    26937 e   catalog_rockwallmaterialunit_producer catalog_rockwallmate_rockwallmaterialunit_ba32081d_fk_catalog_r    FK CONSTRAINT     	  ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_ba32081d_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_ba32081d_fk_catalog_r;
       public          postgres    false    237    268    3027            T           2606    26923 b   catalog_rockwallmaterialunit_brand catalog_rockwallmate_rockwallmaterialunit_bcc17867_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_bcc17867_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_bcc17867_fk_catalog_r;
       public          postgres    false    266    3027    237            R           2606    26826 c   catalog_rockwallmaterialunit_mark_m catalog_rockwallmate_rockwallmaterialunit_fd6d0c7d_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_fd6d0c7d_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_fd6d0c7d_fk_catalog_r;
       public          postgres    false    3027    262    237            G           2606    26978 X   catalog_rockwallmaterialunit catalog_rockwallmate_standard_size_id_4948e697_fk_catalog_r    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_standard_size_id_4948e697_fk_catalog_r FOREIGN KEY (standard_size_id) REFERENCES public.catalog_rockwallmaterialstandardsize(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_standard_size_id_4948e697_fk_catalog_r;
       public          postgres    false    3081    256    237            Y           2606    26956 _   catalog_rockwallmaterialunit_trade_mark catalog_rockwallmate_trademark_id_1b3ea04a_fk_catalog_t    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark
    ADD CONSTRAINT catalog_rockwallmate_trademark_id_1b3ea04a_fk_catalog_t FOREIGN KEY (trademark_id) REFERENCES public.catalog_trademark(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark DROP CONSTRAINT catalog_rockwallmate_trademark_id_1b3ea04a_fk_catalog_t;
       public          postgres    false    241    3039    270            H           2606    18420 Q   catalog_trademark catalog_trademark_brand_id_1f05b25a_fk_catalog_materialbrand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_trademark
    ADD CONSTRAINT catalog_trademark_brand_id_1f05b25a_fk_catalog_materialbrand_id FOREIGN KEY (brand_id) REFERENCES public.catalog_productbrand(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_trademark DROP CONSTRAINT catalog_trademark_brand_id_1f05b25a_fk_catalog_materialbrand_id;
       public          postgres    false    241    225    3000            I           2606    18427 O   catalog_trademarkseries catalog_trademarkser_trademark_id_49fa59f5_fk_catalog_t    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_trademarkseries
    ADD CONSTRAINT catalog_trademarkser_trademark_id_49fa59f5_fk_catalog_t FOREIGN KEY (trademark_id) REFERENCES public.catalog_trademark(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.catalog_trademarkseries DROP CONSTRAINT catalog_trademarkser_trademark_id_49fa59f5_fk_catalog_t;
       public          postgres    false    241    243    3039            ?           2606    18160 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    219    205    2948            @           2606    18165 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    2966    219    213            �   R   x�%���  �nV��z,F�eb��"�f;r��9����N=����נ���k�!�˺��TI��3'���eD���4`      �      x������ � �      �   �  x��Y�n�6>KO�hki���c(�]�,��6iz��4EТF�.E�4=���v�8���7*9J3�V�j���V����!�)�Η��g3/Iw�h^d�ߑ����� d� ��F�o�� gQ�o��> ��#S7jРR����8��t� ����8Du;��츖Ȑ���&���,].��k�ߡ��sԅ�j2�����b ��*�<ʜ>P��ߧ��)�׀�� ��:6>���ᨊ<M�5�x���(�[�돩��~BuYx�G��N-�B�\��+�y�Gu����^cPgc�����
F�zU����/�F|��a����W�8ř���yy�ɿ��q���A��"��a�l]t��>3f��:3c�3Ys�y!���^��	���C�<�ʧ���Iw"V�$�`�X�kg9��gQ���R���U�!'&���9�����&Z��B*�(k��z%N��^�q!� ��1�`�}̬q�b ��R;��E>W3�ԑ��$�E��ar/�3�Ǭ��Q�Հyo�2y�>1#��v#�
zv.ީ1�r���->��}���H/�t��J3�3�ژ�ˊ����t��Vt�7&�%��"n�J�5g��~!�\xrNJ����kd+�������L�q��DX�9�Cv����;1�,"q��5�l}%.��{O̹8��؜�Gft�,�a��ǲN���\��n��ȭ�r~���r~j���Y�9w��"�d'jx�y����A\��/��3�*���.����t+"+��k`U�[qY�3\CVjn��rexF4Kg��*�0�Otݿ��e��>�f4K�{�x�h����n�{=����֑0��"wX���cs=
�X�Bm3C,��JR���U4�V�&�!Yd�4Z�y��!/[7�$�p��u'Ig'-`71V�k�#U�UaO�\��\"�ѽ��[5Ϩ1��y\�C^�:үI���+\�k�#�zב�q4;�~����T�X3�s�����#���SA~�?΋h\}�+ަ��h��W�M91�'�l�2B2-��j#r�����ɠ��Y�f{~�&;u����[�<ԭ�jo�{\�dUI79PyS��P�=��`��6��.�ݑ]o��>���q�=G�1�m����O��N����lt��p��|��^���i6���;�q`e��󱆫ge��󲆫ϲ���Y�C�(��v}<��Y4-�#��:�lȈ�I�Sʆ��G��S6���ڄĩ����Ȝ�}��:9A�����z�}���u F���֙�綷g�\l�k��IgD������k?h�³����
Md,q�?�%ޡ'~u|3��y~ϝpK���M����`�H���r6V�62H�g/��{_9��e{3��~e��F����Vo�4����ėE7hR)^:����/a�525��T���L�*�Q��VJ��׿��~�vj��-7m��qW�rZ��,���\�U�e���
�W�@k��V j��4nu� l����0�TŽ:�w���m��~+���:�X���q�@���
��7=y�^�_�)�F>�.��$�}PH���zs]C��{o�c��t�:s�����"�����
?��2���`}����kC�>��2,��YkP�{z���h7��$܍�K����}��*:�
�^�)�mx����f�M�b�^��`����,x�f{�V'��w9���]��d|W󂩨w$�$�;=�p&�]��5�M�5���$ACH�6 �N=��s�u�� ��      �   �  x�u��N�@��,�Cx��%��8W;\b'�2�m�b�8&�ھ@7���A���
�gpވ�B*�_�ftt>��g�a�?e�!f��0����p�r
��UU;��}���8.�^��.����गuI:�ظ���UN]%Vʻ�O����ȋ���!;� ����M��ې�hs���7�mϻ ���"8胀�~ߎV{�˧���s'7�x�F�L�}c5�}�1��(���"Y'�p:��&�e}���}�˟W#�Y�F:5,�3�l�.l48��w���.�o��:>�M�	GK7��^�h�J�ە.��OeP����B�~_]�3�.o�����eJ���:�D�'��s����Z��(:��<�^kR�^F@�3�QXͮ1�~��:��R��w_�*�?�_�9�r>G�S]U�'ͱ      �      x�3�4�4�2�4�Ɯ&�F\1z\\\ !��      �      x������ � �      �   �   x�3�L+�ɉOJ,N�M�+�0���.l������m��.�دpaㅭ�+\l����V�����{.���T �:w��lj��e�Y�4:-193/���<4@�/6���e�	��j$�pA�NJL�+�t�Ƌ�@�07D�O9��1z\\\ ?ͥW      �   ,   x�3�0�ہx��.#�s.��xaׅM6p��qqq s�      	      x�3�L2�1�t\F�I@�)W� 9�      �   9   x�3�0�¾��6\�ua߅M��;.l
m
m�2⼰�ى[E� tf0             x�3�L150�t\F�)f 6������� N��         !   x�3��540��\F@��)�md����� P�
         &   x�3�45�44 N=cNC �@>CD��b���� ��      !      x�3��K-W(�I������ %2�      �      x�3��L�K-JJ-JO-����� D �      �      x������ � �            x������ � �            x������ � �      �   �   x�U�]
�0���S��?�$j�@,�V��}��A�AQ#���a�Fn
"��3��Pl�JS��δ��}C�^��|k�r�i�3-p���6{�T��#|B%�-qG�c�V�vFYZ�����'�/Ա���R�r"���r��f����3����yӁ��gmyW      �      x������ � �      �      x�3�4250��4����� a1            x�3�425��0�73�4�1W�0�����)'P(������� ��� (UaWahb�i���$Te�ifdob`od`�ya��_�waㅭ���^���V���V� �����r�b���� ��2      �   !   x������,�,���4䲄p�؄+F��� d��            x������ � �            x�3��4����� 	9c            x�3��4����� 	9c            x�3��4����� 	%a            x�3��4����� 	0b            x������ � �      �   v   x�3�,N�I�O�-�ɯLMἰ�{.컰H����b���\Ɯř@%�i��)�%��ŕ�%���5̽0OA���[/lW r�\X��eę���Z����zL��F��=... ?#B�             x������ � �            x������ � �         �   x�]�1��@Ek�)r���6H�0����PDi(((�����fW�s#>���-����C&�,�c��6�c�����KX�Ƹ���h��J�h���U_��ϴ�>��f.8rx#X�}�?������@b��va_�)�M�dn	|���U�.�6.���Ιfʷ���%6����4�ڇ��N��O��)���Rw�Ћ�      �   �  x��Y[o�~�~�BO*�L��}��𫋢)��4 V��!L�n�bIQ$� ��8u[���Ւ|���sfw%q�+�vkA��K�w�3s�sBOp���"H�K�a�8.�/��A�|T������|�᧛�p�7����>���{�!�A@0!@j �+�/_��g�Qy�"@D�!��1`&?�?/_�����Ay���WyR��>��bT�
ϜwZ4Ԟ��D=.�ϿAO�.����������^��*͌2 �ˆ��H�?�aR�(��<�[�ɇ.p�۔k&�w��C�A�1,�Ɋ�m�S��u�^�'H��6�!.���i�C<�	H�O��1"�P>N�����a���?#�?��|�.|���sZn���9�SD~v"�R� w1���s8Ap���ɝ
p��(�����I��o~taL�T#kˤ\����I^��ŝ�ha*�,
̐�g�4�����|msWh�� R00�+_�{�0�@P�3�*/jonjΓ�!���B��(�1�ZI]�i��
��(��iP�tqe:P,��e	�&먽B�h_���bC��kŹ���j�)��AHZg�	�_���=�?lA�~XI���&@[p�a���<ƴ�RLK��#�'���fR��kL8_U)�&~~���S|�$<BdڒO� �S0��i2��k��P�N�*Bu+�5+G�TYf��B�����1��oU�&c�I��0e����w~ms�$ќ��X�Z �m2֯4d�r�E���3/�!4J%�4��y�<�v�����+bQK�pʹ3F4�G~L!�s�?����8x���M	�إO�1�7M��>�Pu������|����>:k�GY ~�y��X��{]����P>iN���-c�+,Җa��M�T���l��vk��%��|U��ؕ �M߶5^]V�Tk�VJ�l$�NxuT,S�S!�:aR��,���iS�C�RW݈P�mݾ7�w��Q>�����V{�_�5�U*S�[�d�#p��`�����Z�����O�b�?ȋlw4����`�P`��q�&[Y^LE>˻�c	jMѠ����k��9?���8;�fy0�\c*��6���j�t�2���~-v�&?.��q���[�L��N��qծ��(R��P"��/ƚW�yV�[g4J��5�m؂�}�M�
��
Uo���tm`��N�ы��3 ���;�v2�f�xz��v:��A6��fy1���ϲ�0+�����_O'�v��m'����C7GE>�����a�������=�Q P���l��ʊ��~[GMI]A��Ԕy罫=@:�gnX�:"��R�c�������8;�����_��Hˈ��8��0��^����n�e:8�����d���nq��f�AZ�1"G��t��7��M��}Z�˫�cw$����K��6w������ȷ��Ͳ}[�Q�d~�q^�fcJʴ��?�f�\JŊFR�(}�A�s�R�ijxgk�8�m\�����5eF�E~����d��>�`[��S|(i��qk#4�;�7��3���݊�ˆp�7�K�؉�������U�:�Zh�jC���X�t�1��9g}U�U[����K��_
��m��E���ؐj$�B�h{���u���i����Udx�ʬ�V�[~c��W���f�������,�a���w�m��L��Y��U�fc�ה��@í�S׾�ep�)l�r�V��e��V]�%�
��4��f�
�I�6��`ڤ�3�s�:����>u�8*�ՊG��db[��^�N��փп?�8Z����)wL�����1���?����D�a���pq�q�5�XW-��bzoo�Z�`!��['pSOd͗
������k,uD���:��b��qR����ߠ9��D- ��� i�w�Z�b�jGE�;-����m䳝`5�MG�U��H�,
��t��p��|%r��JN_�\Ң�F�w�I��sH�:�PH�3�������=����/�n-      �   J  x�u�Mr�0���0��׻t��hbl�,����@�����{���	S`ݲ/\hȫ�P�饈$-���C5)��.�v*�D��������c�"�x;�p(,*�ct��A=.�}M���c�򹘖��Y���ѝ}�,F�Pw6g�G����U/Z�[n>��:u�`v�#�^�x%{������GaK1$�jov�s�
C�;�I���ZA�`M-��ͫ���\y!B��A,��z�N�BVle��rb\n�����"�,�����g'�-P��?y�ϧ����+�0����P�";j��ÆΡ�m�� �q		���ġ�� ����      �   �  x���͎�0���S�}5����gYɲ6�D d����6Yb ��%R��j��v��q��TÎs�n뱎�9�w�wn��xa=��.�������@@R�]<����A�$�w	��;���+�չ�����x|�p
�Jug�;�t!ƺkï&��ᣫ��#rB'��ą�����$��\=F	a���a��X��R��z�����'4U{�=DIJ)���(qC]��αn^R��Q�L�%%�d;�e|���]B ��d4qS�5���<:Z�<s��)��׺��ͱ�����1��47#����q��!Ͼ����j���ةB27Č��y�@3I�$�I�[(aA��R�C#��j����6��U.��m'�F乭`ʗ�{I@��E� ��z� ys�� Q ]b ���ø�(�n��@*� H���i'@缐��MhО�f'��-@(r�,�3�Ђ��K�Z_�x �I�:�E��=m�C�=�e	0+ r�@��p�*.Ք�sv�k��J0-ЊɁ.n�f�4E˔VR�`YD�� � �7*9��.KA�2�,"��8, �s�J1���Xpp+ pϑ)���5eAl �*L *"�,���(�r�q- 4N����|җ=��;�4�<�N)��	�"²�t@Y� AZ��6v�(�f@	 zIM������!	.Mlʌ�W��a�o��l�����B5           x�=�Ko�@ ��+zo4ˮh0�""����H/<��eWi���5=�6�I&�]�Ew���:��ǖ�����f����	��5GB��܅ #@Q6
���]��c���ch�h�el|ٰ���a,9�4S;��Q�n�S����W��^�Q'+�<��%Jsv@�������
��$�㻩l�����煾[�����5>?�����P�{�r���Mq.�v���4h�/i8�uZ_��#ן�x���KV^�D��|����1s��Ki�     