PGDMP         $            
    w         	   postgres2    12.0    12.0 q              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    18022 	   postgres2    DATABASE     �   CREATE DATABASE postgres2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
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
       public          postgres    false    209                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
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
       public          postgres    false    211                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
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
       public          postgres    false    207                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
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
       public          postgres    false    215                        0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    18070    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            !           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
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
       public          postgres    false    217            "           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
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
       public          postgres    false    221            #           0    0    catalog_application_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.catalog_application_id_seq OWNED BY public.catalog_application.id;
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
       public          postgres    false    223            $           0    0    catalog_city_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.catalog_city_id_seq OWNED BY public.catalog_city.id;
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
       public          postgres    false    250            %           0    0    catalog_classb_id_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.catalog_classb_id_seq OWNED BY public.catalog_classblight.id;
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
       public          postgres    false    252            &           0    0    catalog_markd_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markd_id_seq OWNED BY public.catalog_markd.id;
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
       public          postgres    false    254            '           0    0    catalog_markm_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.catalog_markm_id_seq OWNED BY public.catalog_markm.id;
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
       public          postgres    false    225            (           0    0    catalog_materialbrand_id_seq    SEQUENCE OWNED BY     \   ALTER SEQUENCE public.catalog_materialbrand_id_seq OWNED BY public.catalog_productbrand.id;
          public          postgres    false    224                       1259    26986 "   catalog_pilegrillagefoundationcost    TABLE     �  CREATE TABLE public.catalog_pilegrillagefoundationcost (
    id integer NOT NULL,
    const_expenditure double precision NOT NULL,
    transportation_procurement_cost double precision NOT NULL,
    reinforcement_binding double precision NOT NULL,
    clamp double precision NOT NULL,
    pile_frame double precision NOT NULL,
    formwork double precision NOT NULL,
    ground_leveling double precision NOT NULL,
    ruberoid_lining double precision NOT NULL,
    pile_pour double precision NOT NULL,
    grillage_pour double precision NOT NULL,
    man_hours_cost integer NOT NULL,
    man_hours_profit integer NOT NULL,
    owner_id integer
);
 6   DROP TABLE public.catalog_pilegrillagefoundationcost;
       public         heap    postgres    false                       1259    26984 )   catalog_pilegrillagefoundationcost_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_pilegrillagefoundationcost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.catalog_pilegrillagefoundationcost_id_seq;
       public          postgres    false    272            )           0    0 )   catalog_pilegrillagefoundationcost_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.catalog_pilegrillagefoundationcost_id_seq OWNED BY public.catalog_pilegrillagefoundationcost.id;
          public          postgres    false    271            �            1259    18218    catalog_producer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_producer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.catalog_producer_id_seq;
       public          postgres    false    227            *           0    0    catalog_producer_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.catalog_producer_id_seq OWNED BY public.catalog_directproducer.id;
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
       public          postgres    false    229            +           0    0    catalog_provider_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.catalog_provider_id_seq OWNED BY public.catalog_provider.id;
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
       public          postgres    false    245            ,           0    0 *   catalog_provider_secondary_activity_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.catalog_provider_secondary_activity_id_seq OWNED BY public.catalog_provider_secondary_activity.id;
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
       public          postgres    false    247            -           0    0 "   catalog_provider_tax_system_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.catalog_provider_tax_system_id_seq OWNED BY public.catalog_provider_tax_system.id;
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
       public          postgres    false    231            .           0    0 #   catalog_provideractivitytype_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.catalog_provideractivitytype_id_seq OWNED BY public.catalog_provideractivitytype.id;
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
       public          postgres    false    233            /           0    0    catalog_provideroutlet_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.catalog_provideroutlet_id_seq OWNED BY public.catalog_provideroutlet.id;
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
       public          postgres    false    235            0           0    0 ,   catalog_rockwallmaterialpriceposition_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.catalog_rockwallmaterialpriceposition_id_seq OWNED BY public.catalog_rockwallmaterialpriceposition.id;
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
       public          postgres    false    256            1           0    0 +   catalog_rockwallmaterialstandardsize_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.catalog_rockwallmaterialstandardsize_id_seq OWNED BY public.catalog_rockwallmaterialstandardsize.id;
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
       public          postgres    false    266            2           0    0 )   catalog_rockwallmaterialunit_brand_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.catalog_rockwallmaterialunit_brand_id_seq OWNED BY public.catalog_rockwallmaterialunit_brand.id;
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
       public          postgres    false    258            3           0    0 +   catalog_rockwallmaterialunit_class_b_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.catalog_rockwallmaterialunit_class_b_id_seq OWNED BY public.catalog_rockwallmaterialunit_class_b.id;
          public          postgres    false    257            �            1259    18277 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalog_rockwallmaterialunit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.catalog_rockwallmaterialunit_id_seq;
       public          postgres    false    237            4           0    0 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.catalog_rockwallmaterialunit_id_seq OWNED BY public.catalog_rockwallmaterialunit.id;
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
       public          postgres    false    260            5           0    0 *   catalog_rockwallmaterialunit_mark_d_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.catalog_rockwallmaterialunit_mark_d_id_seq OWNED BY public.catalog_rockwallmaterialunit_mark_d.id;
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
       public          postgres    false    262            6           0    0 *   catalog_rockwallmaterialunit_mark_m_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.catalog_rockwallmaterialunit_mark_m_id_seq OWNED BY public.catalog_rockwallmaterialunit_mark_m.id;
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
       public          postgres    false    268            7           0    0 ,   catalog_rockwallmaterialunit_producer_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.catalog_rockwallmaterialunit_producer_id_seq OWNED BY public.catalog_rockwallmaterialunit_producer.id;
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
       public          postgres    false    270            8           0    0 .   catalog_rockwallmaterialunit_trade_mark_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.catalog_rockwallmaterialunit_trade_mark_id_seq OWNED BY public.catalog_rockwallmaterialunit_trade_mark.id;
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
       public          postgres    false    239            9           0    0    catalog_taxsystemtype_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.catalog_taxsystemtype_id_seq OWNED BY public.catalog_taxsystemtype.id;
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
       public          postgres    false    241            :           0    0    catalog_trademark_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.catalog_trademark_id_seq OWNED BY public.catalog_trademark.id;
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
       public          postgres    false    243            ;           0    0    catalog_trademarkseries_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.catalog_trademarkseries_id_seq OWNED BY public.catalog_trademarkseries.id;
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
       public          postgres    false    264            <           0    0    catalog_wallmaterialtype_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.catalog_wallmaterialtype_id_seq OWNED BY public.catalog_wallmaterialtype.id;
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
       public          postgres    false    219            =           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
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
       public          postgres    false    205            >           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
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
       public          postgres    false    203            ?           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    18495    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            W           2604    18057    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            X           2604    18067    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            V           2604    18049    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            Y           2604    18075    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            Z           2604    18085    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            [           2604    18093    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            ^           2604    18183    catalog_application id    DEFAULT     �   ALTER TABLE ONLY public.catalog_application ALTER COLUMN id SET DEFAULT nextval('public.catalog_application_id_seq'::regclass);
 E   ALTER TABLE public.catalog_application ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            _           2604    18203    catalog_city id    DEFAULT     r   ALTER TABLE ONLY public.catalog_city ALTER COLUMN id SET DEFAULT nextval('public.catalog_city_id_seq'::regclass);
 >   ALTER TABLE public.catalog_city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            l           2604    26727    catalog_classblight id    DEFAULT     {   ALTER TABLE ONLY public.catalog_classblight ALTER COLUMN id SET DEFAULT nextval('public.catalog_classb_id_seq'::regclass);
 E   ALTER TABLE public.catalog_classblight ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            a           2604    18223    catalog_directproducer id    DEFAULT     �   ALTER TABLE ONLY public.catalog_directproducer ALTER COLUMN id SET DEFAULT nextval('public.catalog_producer_id_seq'::regclass);
 H   ALTER TABLE public.catalog_directproducer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            m           2604    26737    catalog_markd id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markd ALTER COLUMN id SET DEFAULT nextval('public.catalog_markd_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markd ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            n           2604    26747    catalog_markm id    DEFAULT     t   ALTER TABLE ONLY public.catalog_markm ALTER COLUMN id SET DEFAULT nextval('public.catalog_markm_id_seq'::regclass);
 ?   ALTER TABLE public.catalog_markm ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            w           2604    26989 %   catalog_pilegrillagefoundationcost id    DEFAULT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationcost ALTER COLUMN id SET DEFAULT nextval('public.catalog_pilegrillagefoundationcost_id_seq'::regclass);
 T   ALTER TABLE public.catalog_pilegrillagefoundationcost ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    272    271    272            `           2604    18213    catalog_productbrand id    DEFAULT     �   ALTER TABLE ONLY public.catalog_productbrand ALTER COLUMN id SET DEFAULT nextval('public.catalog_materialbrand_id_seq'::regclass);
 F   ALTER TABLE public.catalog_productbrand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            b           2604    18233    catalog_provider id    DEFAULT     z   ALTER TABLE ONLY public.catalog_provider ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_id_seq'::regclass);
 B   ALTER TABLE public.catalog_provider ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            j           2604    18354 &   catalog_provider_secondary_activity id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_secondary_activity_id_seq'::regclass);
 U   ALTER TABLE public.catalog_provider_secondary_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            k           2604    18362    catalog_provider_tax_system id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provider_tax_system ALTER COLUMN id SET DEFAULT nextval('public.catalog_provider_tax_system_id_seq'::regclass);
 M   ALTER TABLE public.catalog_provider_tax_system ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247            c           2604    18243    catalog_provideractivitytype id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provideractivitytype ALTER COLUMN id SET DEFAULT nextval('public.catalog_provideractivitytype_id_seq'::regclass);
 N   ALTER TABLE public.catalog_provideractivitytype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            d           2604    18253    catalog_provideroutlet id    DEFAULT     �   ALTER TABLE ONLY public.catalog_provideroutlet ALTER COLUMN id SET DEFAULT nextval('public.catalog_provideroutlet_id_seq'::regclass);
 H   ALTER TABLE public.catalog_provideroutlet ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            e           2604    18274 (   catalog_rockwallmaterialpriceposition id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialpriceposition_id_seq'::regclass);
 W   ALTER TABLE public.catalog_rockwallmaterialpriceposition ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            o           2604    26757 '   catalog_rockwallmaterialstandardsize id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialstandardsize_id_seq'::regclass);
 V   ALTER TABLE public.catalog_rockwallmaterialstandardsize ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255    256            f           2604    18282    catalog_rockwallmaterialunit id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_id_seq'::regclass);
 N   ALTER TABLE public.catalog_rockwallmaterialunit ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            t           2604    26903 %   catalog_rockwallmaterialunit_brand id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_brand_id_seq'::regclass);
 T   ALTER TABLE public.catalog_rockwallmaterialunit_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    265    266            p           2604    26767 '   catalog_rockwallmaterialunit_class_b id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_class_b_id_seq'::regclass);
 V   ALTER TABLE public.catalog_rockwallmaterialunit_class_b ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258            q           2604    26775 &   catalog_rockwallmaterialunit_mark_d id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_mark_d_id_seq'::regclass);
 U   ALTER TABLE public.catalog_rockwallmaterialunit_mark_d ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259    260            r           2604    26783 &   catalog_rockwallmaterialunit_mark_m id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_mark_m_id_seq'::regclass);
 U   ALTER TABLE public.catalog_rockwallmaterialunit_mark_m ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261    262            u           2604    26912 (   catalog_rockwallmaterialunit_producer id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_producer_id_seq'::regclass);
 W   ALTER TABLE public.catalog_rockwallmaterialunit_producer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267    268            v           2604    26920 *   catalog_rockwallmaterialunit_trade_mark id    DEFAULT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark ALTER COLUMN id SET DEFAULT nextval('public.catalog_rockwallmaterialunit_trade_mark_id_seq'::regclass);
 Y   ALTER TABLE public.catalog_rockwallmaterialunit_trade_mark ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    270    269    270            g           2604    18306    catalog_taxsystemtype id    DEFAULT     �   ALTER TABLE ONLY public.catalog_taxsystemtype ALTER COLUMN id SET DEFAULT nextval('public.catalog_taxsystemtype_id_seq'::regclass);
 G   ALTER TABLE public.catalog_taxsystemtype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            h           2604    18316    catalog_trademark id    DEFAULT     |   ALTER TABLE ONLY public.catalog_trademark ALTER COLUMN id SET DEFAULT nextval('public.catalog_trademark_id_seq'::regclass);
 C   ALTER TABLE public.catalog_trademark ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241            i           2604    18326    catalog_trademarkseries id    DEFAULT     �   ALTER TABLE ONLY public.catalog_trademarkseries ALTER COLUMN id SET DEFAULT nextval('public.catalog_trademarkseries_id_seq'::regclass);
 I   ALTER TABLE public.catalog_trademarkseries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243            s           2604    26859    catalog_wallmaterialtype id    DEFAULT     �   ALTER TABLE ONLY public.catalog_wallmaterialtype ALTER COLUMN id SET DEFAULT nextval('public.catalog_wallmaterialtype_id_seq'::regclass);
 J   ALTER TABLE public.catalog_wallmaterialtype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    263    264            \           2604    18153    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            U           2604    18039    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            T           2604    18028    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �          0    18054 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   �      �          0    18064    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   ?      �          0    18046    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   \      �          0    18072 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   %      �          0    18082    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   �      �          0    18090    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217         �          0    18180    catalog_application 
   TABLE DATA           C   COPY public.catalog_application (id, identifier, name) FROM stdin;
    public          postgres    false    221   #      �          0    18200    catalog_city 
   TABLE DATA           0   COPY public.catalog_city (id, name) FROM stdin;
    public          postgres    false    223   �                 0    26724    catalog_classblight 
   TABLE DATA           C   COPY public.catalog_classblight (id, identifier, name) FROM stdin;
    public          postgres    false    250         �          0    18220    catalog_directproducer 
   TABLE DATA           :   COPY public.catalog_directproducer (id, name) FROM stdin;
    public          postgres    false    227   ?                0    26734    catalog_markd 
   TABLE DATA           =   COPY public.catalog_markd (id, identifier, name) FROM stdin;
    public          postgres    false    252   �                0    26744    catalog_markm 
   TABLE DATA           =   COPY public.catalog_markm (id, identifier, name) FROM stdin;
    public          postgres    false    254   �                0    26986 "   catalog_pilegrillagefoundationcost 
   TABLE DATA             COPY public.catalog_pilegrillagefoundationcost (id, const_expenditure, transportation_procurement_cost, reinforcement_binding, clamp, pile_frame, formwork, ground_leveling, ruberoid_lining, pile_pour, grillage_pour, man_hours_cost, man_hours_profit, owner_id) FROM stdin;
    public          postgres    false    272   �      �          0    18210    catalog_productbrand 
   TABLE DATA           8   COPY public.catalog_productbrand (id, name) FROM stdin;
    public          postgres    false    225   &      �          0    18230    catalog_provider 
   TABLE DATA           Y   COPY public.catalog_provider (id, name, ownership_form, primary_activity_id) FROM stdin;
    public          postgres    false    229   R      �          0    18351 #   catalog_provider_secondary_activity 
   TABLE DATA           g   COPY public.catalog_provider_secondary_activity (id, provider_id, provideractivitytype_id) FROM stdin;
    public          postgres    false    245   o      �          0    18359    catalog_provider_tax_system 
   TABLE DATA           X   COPY public.catalog_provider_tax_system (id, provider_id, taxsystemtype_id) FROM stdin;
    public          postgres    false    247   �      �          0    18240    catalog_provideractivitytype 
   TABLE DATA           L   COPY public.catalog_provideractivitytype (id, identifier, name) FROM stdin;
    public          postgres    false    231   �      �          0    18250    catalog_provideroutlet 
   TABLE DATA           i   COPY public.catalog_provideroutlet (id, local_name, information, city_id, name_id, owner_id) FROM stdin;
    public          postgres    false    233   ^      �          0    18271 %   catalog_rockwallmaterialpriceposition 
   TABLE DATA           ]   COPY public.catalog_rockwallmaterialpriceposition (id, price, name_id, owner_id) FROM stdin;
    public          postgres    false    235   {                0    26754 $   catalog_rockwallmaterialstandardsize 
   TABLE DATA           w   COPY public.catalog_rockwallmaterialstandardsize (id, identifier, name, a_size, b_size, c_size, size_type) FROM stdin;
    public          postgres    false    256   �      �          0    18279    catalog_rockwallmaterialunit 
   TABLE DATA           �   COPY public.catalog_rockwallmaterialunit (id, thermal_conductivity, primary_or_additional, body_type, brick_type, standard_size_id) FROM stdin;
    public          postgres    false    237   2                 0    26900 "   catalog_rockwallmaterialunit_brand 
   TABLE DATA           j   COPY public.catalog_rockwallmaterialunit_brand (id, rockwallmaterialunit_id, productbrand_id) FROM stdin;
    public          postgres    false    266   c                 0    26764 $   catalog_rockwallmaterialunit_class_b 
   TABLE DATA           k   COPY public.catalog_rockwallmaterialunit_class_b (id, rockwallmaterialunit_id, classblight_id) FROM stdin;
    public          postgres    false    258   �       
          0    26772 #   catalog_rockwallmaterialunit_mark_d 
   TABLE DATA           d   COPY public.catalog_rockwallmaterialunit_mark_d (id, rockwallmaterialunit_id, markd_id) FROM stdin;
    public          postgres    false    260   �                 0    26780 #   catalog_rockwallmaterialunit_mark_m 
   TABLE DATA           d   COPY public.catalog_rockwallmaterialunit_mark_m (id, rockwallmaterialunit_id, markm_id) FROM stdin;
    public          postgres    false    262   �                 0    26909 %   catalog_rockwallmaterialunit_producer 
   TABLE DATA           o   COPY public.catalog_rockwallmaterialunit_producer (id, rockwallmaterialunit_id, directproducer_id) FROM stdin;
    public          postgres    false    268   �                 0    26917 '   catalog_rockwallmaterialunit_trade_mark 
   TABLE DATA           l   COPY public.catalog_rockwallmaterialunit_trade_mark (id, rockwallmaterialunit_id, trademark_id) FROM stdin;
    public          postgres    false    270   !      �          0    18303    catalog_taxsystemtype 
   TABLE DATA           E   COPY public.catalog_taxsystemtype (id, identifier, name) FROM stdin;
    public          postgres    false    239   )!      �          0    18313    catalog_trademark 
   TABLE DATA           ?   COPY public.catalog_trademark (id, name, brand_id) FROM stdin;
    public          postgres    false    241   �!      �          0    18323    catalog_trademarkseries 
   TABLE DATA           I   COPY public.catalog_trademarkseries (id, name, trademark_id) FROM stdin;
    public          postgres    false    243   �!                0    26856    catalog_wallmaterialtype 
   TABLE DATA           Z   COPY public.catalog_wallmaterialtype (id, identifier, name, common_wall_type) FROM stdin;
    public          postgres    false    264   �!      �          0    18150    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   �"      �          0    18036    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   �*      �          0    18025    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   �+      �          0    18495    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    248   �.      @           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);
          public          postgres    false    208            A           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            B           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 124, true);
          public          postgres    false    206            C           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 3, true);
          public          postgres    false    214            D           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);
          public          postgres    false    212            E           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            F           0    0    catalog_application_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.catalog_application_id_seq', 5, true);
          public          postgres    false    220            G           0    0    catalog_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.catalog_city_id_seq', 2, true);
          public          postgres    false    222            H           0    0    catalog_classb_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.catalog_classb_id_seq', 2, true);
          public          postgres    false    249            I           0    0    catalog_markd_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.catalog_markd_id_seq', 2, true);
          public          postgres    false    251            J           0    0    catalog_markm_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.catalog_markm_id_seq', 2, true);
          public          postgres    false    253            K           0    0    catalog_materialbrand_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.catalog_materialbrand_id_seq', 1, true);
          public          postgres    false    224            L           0    0 )   catalog_pilegrillagefoundationcost_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.catalog_pilegrillagefoundationcost_id_seq', 1, true);
          public          postgres    false    271            M           0    0    catalog_producer_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.catalog_producer_id_seq', 2, true);
          public          postgres    false    226            N           0    0    catalog_provider_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.catalog_provider_id_seq', 1, false);
          public          postgres    false    228            O           0    0 *   catalog_provider_secondary_activity_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.catalog_provider_secondary_activity_id_seq', 1, false);
          public          postgres    false    244            P           0    0 "   catalog_provider_tax_system_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.catalog_provider_tax_system_id_seq', 1, false);
          public          postgres    false    246            Q           0    0 #   catalog_provideractivitytype_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.catalog_provideractivitytype_id_seq', 4, true);
          public          postgres    false    230            R           0    0    catalog_provideroutlet_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.catalog_provideroutlet_id_seq', 1, false);
          public          postgres    false    232            S           0    0 ,   catalog_rockwallmaterialpriceposition_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.catalog_rockwallmaterialpriceposition_id_seq', 1, true);
          public          postgres    false    234            T           0    0 +   catalog_rockwallmaterialstandardsize_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.catalog_rockwallmaterialstandardsize_id_seq', 4, true);
          public          postgres    false    255            U           0    0 )   catalog_rockwallmaterialunit_brand_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_brand_id_seq', 1, true);
          public          postgres    false    265            V           0    0 +   catalog_rockwallmaterialunit_class_b_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_class_b_id_seq', 3, true);
          public          postgres    false    257            W           0    0 #   catalog_rockwallmaterialunit_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_id_seq', 9, true);
          public          postgres    false    236            X           0    0 *   catalog_rockwallmaterialunit_mark_d_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_mark_d_id_seq', 3, true);
          public          postgres    false    259            Y           0    0 *   catalog_rockwallmaterialunit_mark_m_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_mark_m_id_seq', 2, true);
          public          postgres    false    261            Z           0    0 ,   catalog_rockwallmaterialunit_producer_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_producer_id_seq', 3, true);
          public          postgres    false    267            [           0    0 .   catalog_rockwallmaterialunit_trade_mark_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.catalog_rockwallmaterialunit_trade_mark_id_seq', 1, false);
          public          postgres    false    269            \           0    0    catalog_taxsystemtype_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.catalog_taxsystemtype_id_seq', 3, true);
          public          postgres    false    238            ]           0    0    catalog_trademark_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalog_trademark_id_seq', 1, false);
          public          postgres    false    240            ^           0    0    catalog_trademarkseries_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.catalog_trademarkseries_id_seq', 1, false);
          public          postgres    false    242            _           0    0    catalog_wallmaterialtype_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.catalog_wallmaterialtype_id_seq', 5, true);
          public          postgres    false    263            `           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 69, true);
          public          postgres    false    218            a           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 30, true);
          public          postgres    false    204            b           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 32, true);
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
       public            postgres    false    252            �           2606    26751 *   catalog_markm catalog_markm_identifier_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.catalog_markm
    ADD CONSTRAINT catalog_markm_identifier_key UNIQUE (identifier);
 T   ALTER TABLE ONLY public.catalog_markm DROP CONSTRAINT catalog_markm_identifier_key;
       public            postgres    false    254            �           2606    26749     catalog_markm catalog_markm_pkey 
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
       public            postgres    false    225            .           2606    26991 J   catalog_pilegrillagefoundationcost catalog_pilegrillagefoundationcost_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationcost
    ADD CONSTRAINT catalog_pilegrillagefoundationcost_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.catalog_pilegrillagefoundationcost DROP CONSTRAINT catalog_pilegrillagefoundationcost_pkey;
       public            postgres    false    272            �           2606    18227 0   catalog_directproducer catalog_producer_name_key 
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
       public            postgres    false    233                       2606    26934 b   catalog_rockwallmaterialunit_brand catalog_rockwallmaterial_rockwallmaterialunit_id__58bcaae8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__58bcaae8_uniq UNIQUE (rockwallmaterialunit_id, productbrand_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__58bcaae8_uniq;
       public            postgres    false    266    266                       2606    26809 d   catalog_rockwallmaterialunit_class_b catalog_rockwallmaterial_rockwallmaterialunit_id__6fe40e85_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__6fe40e85_uniq UNIQUE (rockwallmaterialunit_id, classblight_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__6fe40e85_uniq;
       public            postgres    false    258    258            '           2606    26962 g   catalog_rockwallmaterialunit_trade_mark catalog_rockwallmaterial_rockwallmaterialunit_id__9691e92a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__9691e92a_uniq UNIQUE (rockwallmaterialunit_id, trademark_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__9691e92a_uniq;
       public            postgres    false    270    270            
           2606    26823 c   catalog_rockwallmaterialunit_mark_d catalog_rockwallmaterial_rockwallmaterialunit_id__ce4c7c58_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__ce4c7c58_uniq UNIQUE (rockwallmaterialunit_id, markd_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__ce4c7c58_uniq;
       public            postgres    false    260    260            !           2606    26948 e   catalog_rockwallmaterialunit_producer catalog_rockwallmaterial_rockwallmaterialunit_id__eafcd31a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__eafcd31a_uniq UNIQUE (rockwallmaterialunit_id, directproducer_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__eafcd31a_uniq;
       public            postgres    false    268    268                       2606    26837 c   catalog_rockwallmaterialunit_mark_m catalog_rockwallmaterial_rockwallmaterialunit_id__ef817d8b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m
    ADD CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__ef817d8b_uniq UNIQUE (rockwallmaterialunit_id, markm_id);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m DROP CONSTRAINT catalog_rockwallmaterial_rockwallmaterialunit_id__ef817d8b_uniq;
       public            postgres    false    262    262            �           2606    18276 P   catalog_rockwallmaterialpriceposition catalog_rockwallmaterialpriceposition_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition
    ADD CONSTRAINT catalog_rockwallmaterialpriceposition_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition DROP CONSTRAINT catalog_rockwallmaterialpriceposition_pkey;
       public            postgres    false    235                        2606    26761 X   catalog_rockwallmaterialstandardsize catalog_rockwallmaterialstandardsize_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize
    ADD CONSTRAINT catalog_rockwallmaterialstandardsize_identifier_key UNIQUE (identifier);
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize DROP CONSTRAINT catalog_rockwallmaterialstandardsize_identifier_key;
       public            postgres    false    256                       2606    26759 N   catalog_rockwallmaterialstandardsize catalog_rockwallmaterialstandardsize_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize
    ADD CONSTRAINT catalog_rockwallmaterialstandardsize_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.catalog_rockwallmaterialstandardsize DROP CONSTRAINT catalog_rockwallmaterialstandardsize_pkey;
       public            postgres    false    256                       2606    26905 J   catalog_rockwallmaterialunit_brand catalog_rockwallmaterialunit_brand_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand
    ADD CONSTRAINT catalog_rockwallmaterialunit_brand_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand DROP CONSTRAINT catalog_rockwallmaterialunit_brand_pkey;
       public            postgres    false    266                       2606    26769 N   catalog_rockwallmaterialunit_class_b catalog_rockwallmaterialunit_class_b_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b
    ADD CONSTRAINT catalog_rockwallmaterialunit_class_b_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b DROP CONSTRAINT catalog_rockwallmaterialunit_class_b_pkey;
       public            postgres    false    258                       2606    26777 L   catalog_rockwallmaterialunit_mark_d catalog_rockwallmaterialunit_mark_d_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d
    ADD CONSTRAINT catalog_rockwallmaterialunit_mark_d_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d DROP CONSTRAINT catalog_rockwallmaterialunit_mark_d_pkey;
       public            postgres    false    260                       2606    26785 L   catalog_rockwallmaterialunit_mark_m catalog_rockwallmaterialunit_mark_m_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m
    ADD CONSTRAINT catalog_rockwallmaterialunit_mark_m_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m DROP CONSTRAINT catalog_rockwallmaterialunit_mark_m_pkey;
       public            postgres    false    262            �           2606    18284 >   catalog_rockwallmaterialunit catalog_rockwallmaterialunit_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmaterialunit_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmaterialunit_pkey;
       public            postgres    false    237            %           2606    26914 P   catalog_rockwallmaterialunit_producer catalog_rockwallmaterialunit_producer_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer
    ADD CONSTRAINT catalog_rockwallmaterialunit_producer_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer DROP CONSTRAINT catalog_rockwallmaterialunit_producer_pkey;
       public            postgres    false    268            *           2606    26922 T   catalog_rockwallmaterialunit_trade_mark catalog_rockwallmaterialunit_trade_mark_pkey 
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
       public            postgres    false    243                       2606    26863 @   catalog_wallmaterialtype catalog_wallmaterialtype_identifier_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalog_wallmaterialtype
    ADD CONSTRAINT catalog_wallmaterialtype_identifier_key UNIQUE (identifier);
 j   ALTER TABLE ONLY public.catalog_wallmaterialtype DROP CONSTRAINT catalog_wallmaterialtype_identifier_key;
       public            postgres    false    264                       2606    26861 6   catalog_wallmaterialtype catalog_wallmaterialtype_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.catalog_wallmaterialtype
    ADD CONSTRAINT catalog_wallmaterialtype_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.catalog_wallmaterialtype DROP CONSTRAINT catalog_wallmaterialtype_pkey;
       public            postgres    false    264            �           2606    18159 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219            {           2606    18043 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            }           2606    18041 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            y           2606    18033 (   django_migrations django_migrations_pkey 
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
       public            postgres    false    211            ~           1259    18103 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
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
       public            postgres    false    252            �           1259    26796 &   catalog_markm_identifier_43ab376a_like    INDEX     z   CREATE INDEX catalog_markm_identifier_43ab376a_like ON public.catalog_markm USING btree (identifier varchar_pattern_ops);
 :   DROP INDEX public.catalog_markm_identifier_43ab376a_like;
       public            postgres    false    254            �           1259    18368 (   catalog_materialbrand_name_7bd3d144_like    INDEX     }   CREATE INDEX catalog_materialbrand_name_7bd3d144_like ON public.catalog_productbrand USING btree (name varchar_pattern_ops);
 <   DROP INDEX public.catalog_materialbrand_name_7bd3d144_like;
       public            postgres    false    225            ,           1259    26997 4   catalog_pilegrillagefoundationcost_owner_id_38d99042    INDEX     �   CREATE INDEX catalog_pilegrillagefoundationcost_owner_id_38d99042 ON public.catalog_pilegrillagefoundationcost USING btree (owner_id);
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
       public            postgres    false    235            �           1259    26797 =   catalog_rockwallmaterialstandardsize_identifier_1e278702_like    INDEX     �   CREATE INDEX catalog_rockwallmaterialstandardsize_identifier_1e278702_like ON public.catalog_rockwallmaterialstandardsize USING btree (identifier varchar_pattern_ops);
 Q   DROP INDEX public.catalog_rockwallmaterialstandardsize_identifier_1e278702_like;
       public            postgres    false    256            "           1259    26950 5   catalog_rockwallmaterialun_directproducer_id_bfaab3b6    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_directproducer_id_bfaab3b6 ON public.catalog_rockwallmaterialunit_producer USING btree (directproducer_id);
 I   DROP INDEX public.catalog_rockwallmaterialun_directproducer_id_bfaab3b6;
       public            postgres    false    268                       1259    26810 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_51474c00    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_51474c00 ON public.catalog_rockwallmaterialunit_class_b USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_51474c00;
       public            postgres    false    258            (           1259    26963 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_73cb98d9    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_73cb98d9 ON public.catalog_rockwallmaterialunit_trade_mark USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_73cb98d9;
       public            postgres    false    270                       1259    26824 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_81d664e3    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_81d664e3 ON public.catalog_rockwallmaterialunit_mark_d USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_81d664e3;
       public            postgres    false    260            #           1259    26949 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_ba32081d    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_ba32081d ON public.catalog_rockwallmaterialunit_producer USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_ba32081d;
       public            postgres    false    268                       1259    26935 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_bcc17867    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_bcc17867 ON public.catalog_rockwallmaterialunit_brand USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_bcc17867;
       public            postgres    false    266                       1259    26838 ;   catalog_rockwallmaterialun_rockwallmaterialunit_id_fd6d0c7d    INDEX     �   CREATE INDEX catalog_rockwallmaterialun_rockwallmaterialunit_id_fd6d0c7d ON public.catalog_rockwallmaterialunit_mark_m USING btree (rockwallmaterialunit_id);
 O   DROP INDEX public.catalog_rockwallmaterialun_rockwallmaterialunit_id_fd6d0c7d;
       public            postgres    false    262                       1259    26936 ;   catalog_rockwallmaterialunit_brand_productbrand_id_36de2fb0    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_brand_productbrand_id_36de2fb0 ON public.catalog_rockwallmaterialunit_brand USING btree (productbrand_id);
 O   DROP INDEX public.catalog_rockwallmaterialunit_brand_productbrand_id_36de2fb0;
       public            postgres    false    266                       1259    26811 7   catalog_rockwallmaterialunit_class_b_classb_id_2ae3624e    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_class_b_classb_id_2ae3624e ON public.catalog_rockwallmaterialunit_class_b USING btree (classblight_id);
 K   DROP INDEX public.catalog_rockwallmaterialunit_class_b_classb_id_2ae3624e;
       public            postgres    false    258                       1259    26825 5   catalog_rockwallmaterialunit_mark_d_markd_id_0cb39fa5    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_mark_d_markd_id_0cb39fa5 ON public.catalog_rockwallmaterialunit_mark_d USING btree (markd_id);
 I   DROP INDEX public.catalog_rockwallmaterialunit_mark_d_markd_id_0cb39fa5;
       public            postgres    false    260                       1259    26839 5   catalog_rockwallmaterialunit_mark_m_markm_id_d6c246a8    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_mark_m_markm_id_d6c246a8 ON public.catalog_rockwallmaterialunit_mark_m USING btree (markm_id);
 I   DROP INDEX public.catalog_rockwallmaterialunit_mark_m_markm_id_d6c246a8;
       public            postgres    false    262            �           1259    26967 6   catalog_rockwallmaterialunit_standard_size_id_4948e697    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_standard_size_id_4948e697 ON public.catalog_rockwallmaterialunit USING btree (standard_size_id);
 J   DROP INDEX public.catalog_rockwallmaterialunit_standard_size_id_4948e697;
       public            postgres    false    237            +           1259    26964 =   catalog_rockwallmaterialunit_trade_mark_trademark_id_1b3ea04a    INDEX     �   CREATE INDEX catalog_rockwallmaterialunit_trade_mark_trademark_id_1b3ea04a ON public.catalog_rockwallmaterialunit_trade_mark USING btree (trademark_id);
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
       public            postgres    false    243                       1259    26872 1   catalog_wallmaterialtype_identifier_d62c39ea_like    INDEX     �   CREATE INDEX catalog_wallmaterialtype_identifier_d62c39ea_like ON public.catalog_wallmaterialtype USING btree (identifier varchar_pattern_ops);
 E   DROP INDEX public.catalog_wallmaterialtype_identifier_d62c39ea_like;
       public            postgres    false    264            �           1259    18170 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219            �           1259    18171 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219            �           1259    18504 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    248            �           1259    18503 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    248            1           2606    18110 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    2946    211    207            0           2606    18105 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    209    2951    211            /           2606    18096 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    205    207    2941            3           2606    18125 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    209    215    2951            2           2606    18120 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    213    215    2959            5           2606    18139 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    2946    217    207            4           2606    18134 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    2959    213    217            Q           2606    26992 V   catalog_pilegrillagefoundationcost catalog_pilegrillage_owner_id_38d99042_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationcost
    ADD CONSTRAINT catalog_pilegrillage_owner_id_38d99042_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_pilegrillagefoundationcost DROP CONSTRAINT catalog_pilegrillage_owner_id_38d99042_fk_auth_user;
       public          postgres    false    2959    272    213            8           2606    18462 K   catalog_provider catalog_provider_primary_activity_id_5ff3703d_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider
    ADD CONSTRAINT catalog_provider_primary_activity_id_5ff3703d_fk_catalog_p FOREIGN KEY (primary_activity_id) REFERENCES public.catalog_provideractivitytype(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.catalog_provider DROP CONSTRAINT catalog_provider_primary_activity_id_5ff3703d_fk_catalog_p;
       public          postgres    false    229    3009    231            A           2606    18467 Z   catalog_provider_secondary_activity catalog_provider_sec_provider_id_1050e31c_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_sec_provider_id_1050e31c_fk_catalog_p FOREIGN KEY (provider_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_sec_provider_id_1050e31c_fk_catalog_p;
       public          postgres    false    245    3003    229            B           2606    18472 c   catalog_provider_secondary_activity catalog_provider_sec_provideractivitytype_b77a182c_fk_catalog_p    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_provider_secondary_activity
    ADD CONSTRAINT catalog_provider_sec_provideractivitytype_b77a182c_fk_catalog_p FOREIGN KEY (provideractivitytype_id) REFERENCES public.catalog_provideractivitytype(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_secondary_activity DROP CONSTRAINT catalog_provider_sec_provideractivitytype_b77a182c_fk_catalog_p;
       public          postgres    false    3009    245    231            C           2606    18481 R   catalog_provider_tax_system catalog_provider_tax_provider_id_d0d5b87d_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_tax_system
    ADD CONSTRAINT catalog_provider_tax_provider_id_d0d5b87d_fk_catalog_p FOREIGN KEY (provider_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.catalog_provider_tax_system DROP CONSTRAINT catalog_provider_tax_provider_id_d0d5b87d_fk_catalog_p;
       public          postgres    false    247    3003    229            D           2606    18486 W   catalog_provider_tax_system catalog_provider_tax_taxsystemtype_id_886b2f4c_fk_catalog_t    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provider_tax_system
    ADD CONSTRAINT catalog_provider_tax_taxsystemtype_id_886b2f4c_fk_catalog_t FOREIGN KEY (taxsystemtype_id) REFERENCES public.catalog_taxsystemtype(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_provider_tax_system DROP CONSTRAINT catalog_provider_tax_taxsystemtype_id_886b2f4c_fk_catalog_t;
       public          postgres    false    3026    239    247            9           2606    18372 Q   catalog_provideroutlet catalog_provideroutlet_city_id_1642bb7a_fk_catalog_city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provideroutlet
    ADD CONSTRAINT catalog_provideroutlet_city_id_1642bb7a_fk_catalog_city_id FOREIGN KEY (city_id) REFERENCES public.catalog_city(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_provideroutlet DROP CONSTRAINT catalog_provideroutlet_city_id_1642bb7a_fk_catalog_city_id;
       public          postgres    false    233    223    2988            :           2606    18377 U   catalog_provideroutlet catalog_provideroutlet_name_id_da8a3b33_fk_catalog_provider_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provideroutlet
    ADD CONSTRAINT catalog_provideroutlet_name_id_da8a3b33_fk_catalog_provider_id FOREIGN KEY (name_id) REFERENCES public.catalog_provider(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.catalog_provideroutlet DROP CONSTRAINT catalog_provideroutlet_name_id_da8a3b33_fk_catalog_provider_id;
       public          postgres    false    229    233    3003            ;           2606    18382 O   catalog_provideroutlet catalog_provideroutlet_owner_id_496d374f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_provideroutlet
    ADD CONSTRAINT catalog_provideroutlet_owner_id_496d374f_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.catalog_provideroutlet DROP CONSTRAINT catalog_provideroutlet_owner_id_496d374f_fk_auth_user_id;
       public          postgres    false    2959    213    233            E           2606    26887 ^   catalog_rockwallmaterialunit_class_b catalog_rockwallmate_classblight_id_6e007ad6_fk_catalog_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b
    ADD CONSTRAINT catalog_rockwallmate_classblight_id_6e007ad6_fk_catalog_c FOREIGN KEY (classblight_id) REFERENCES public.catalog_classblight(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b DROP CONSTRAINT catalog_rockwallmate_classblight_id_6e007ad6_fk_catalog_c;
       public          postgres    false    250    258    3059            N           2606    26942 b   catalog_rockwallmaterialunit_producer catalog_rockwallmate_directproducer_id_bfaab3b6_fk_catalog_d    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer
    ADD CONSTRAINT catalog_rockwallmate_directproducer_id_bfaab3b6_fk_catalog_d FOREIGN KEY (directproducer_id) REFERENCES public.catalog_directproducer(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer DROP CONSTRAINT catalog_rockwallmate_directproducer_id_bfaab3b6_fk_catalog_d;
       public          postgres    false    268    227    2998            H           2606    26817 W   catalog_rockwallmaterialunit_mark_d catalog_rockwallmate_markd_id_0cb39fa5_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d
    ADD CONSTRAINT catalog_rockwallmate_markd_id_0cb39fa5_fk_catalog_m FOREIGN KEY (markd_id) REFERENCES public.catalog_markd(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d DROP CONSTRAINT catalog_rockwallmate_markd_id_0cb39fa5_fk_catalog_m;
       public          postgres    false    252    260    3064            J           2606    26831 W   catalog_rockwallmaterialunit_mark_m catalog_rockwallmate_markm_id_d6c246a8_fk_catalog_m    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m
    ADD CONSTRAINT catalog_rockwallmate_markm_id_d6c246a8_fk_catalog_m FOREIGN KEY (markm_id) REFERENCES public.catalog_markm(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m DROP CONSTRAINT catalog_rockwallmate_markm_id_d6c246a8_fk_catalog_m;
       public          postgres    false    254    262    3069            <           2606    18450 X   catalog_rockwallmaterialpriceposition catalog_rockwallmate_name_id_17c3a4a8_fk_catalog_r    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition
    ADD CONSTRAINT catalog_rockwallmate_name_id_17c3a4a8_fk_catalog_r FOREIGN KEY (name_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition DROP CONSTRAINT catalog_rockwallmate_name_id_17c3a4a8_fk_catalog_r;
       public          postgres    false    237    3020    235            =           2606    18507 Y   catalog_rockwallmaterialpriceposition catalog_rockwallmate_owner_id_5cb00786_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition
    ADD CONSTRAINT catalog_rockwallmate_owner_id_5cb00786_fk_auth_user FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialpriceposition DROP CONSTRAINT catalog_rockwallmate_owner_id_5cb00786_fk_auth_user;
       public          postgres    false    213    235    2959            L           2606    26928 ]   catalog_rockwallmaterialunit_brand catalog_rockwallmate_productbrand_id_36de2fb0_fk_catalog_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand
    ADD CONSTRAINT catalog_rockwallmate_productbrand_id_36de2fb0_fk_catalog_p FOREIGN KEY (productbrand_id) REFERENCES public.catalog_productbrand(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand DROP CONSTRAINT catalog_rockwallmate_productbrand_id_36de2fb0_fk_catalog_p;
       public          postgres    false    266    2993    225            F           2606    26892 d   catalog_rockwallmaterialunit_class_b catalog_rockwallmate_rockwallmaterialunit_51474c00_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_51474c00_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_class_b DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_51474c00_fk_catalog_r;
       public          postgres    false    237    258    3020            O           2606    26951 g   catalog_rockwallmaterialunit_trade_mark catalog_rockwallmate_rockwallmaterialunit_73cb98d9_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_73cb98d9_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_73cb98d9_fk_catalog_r;
       public          postgres    false    3020    270    237            G           2606    26812 c   catalog_rockwallmaterialunit_mark_d catalog_rockwallmate_rockwallmaterialunit_81d664e3_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_81d664e3_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_d DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_81d664e3_fk_catalog_r;
       public          postgres    false    3020    237    260            M           2606    26937 e   catalog_rockwallmaterialunit_producer catalog_rockwallmate_rockwallmaterialunit_ba32081d_fk_catalog_r    FK CONSTRAINT     	  ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_ba32081d_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_producer DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_ba32081d_fk_catalog_r;
       public          postgres    false    3020    268    237            K           2606    26923 b   catalog_rockwallmaterialunit_brand catalog_rockwallmate_rockwallmaterialunit_bcc17867_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_bcc17867_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_brand DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_bcc17867_fk_catalog_r;
       public          postgres    false    3020    237    266            I           2606    26826 c   catalog_rockwallmaterialunit_mark_m catalog_rockwallmate_rockwallmaterialunit_fd6d0c7d_fk_catalog_r    FK CONSTRAINT       ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m
    ADD CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_fd6d0c7d_fk_catalog_r FOREIGN KEY (rockwallmaterialunit_id) REFERENCES public.catalog_rockwallmaterialunit(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_mark_m DROP CONSTRAINT catalog_rockwallmate_rockwallmaterialunit_fd6d0c7d_fk_catalog_r;
       public          postgres    false    237    3020    262            >           2606    26978 X   catalog_rockwallmaterialunit catalog_rockwallmate_standard_size_id_4948e697_fk_catalog_r    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit
    ADD CONSTRAINT catalog_rockwallmate_standard_size_id_4948e697_fk_catalog_r FOREIGN KEY (standard_size_id) REFERENCES public.catalog_rockwallmaterialstandardsize(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit DROP CONSTRAINT catalog_rockwallmate_standard_size_id_4948e697_fk_catalog_r;
       public          postgres    false    237    3074    256            P           2606    26956 _   catalog_rockwallmaterialunit_trade_mark catalog_rockwallmate_trademark_id_1b3ea04a_fk_catalog_t    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark
    ADD CONSTRAINT catalog_rockwallmate_trademark_id_1b3ea04a_fk_catalog_t FOREIGN KEY (trademark_id) REFERENCES public.catalog_trademark(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalog_rockwallmaterialunit_trade_mark DROP CONSTRAINT catalog_rockwallmate_trademark_id_1b3ea04a_fk_catalog_t;
       public          postgres    false    241    3032    270            ?           2606    18420 Q   catalog_trademark catalog_trademark_brand_id_1f05b25a_fk_catalog_materialbrand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_trademark
    ADD CONSTRAINT catalog_trademark_brand_id_1f05b25a_fk_catalog_materialbrand_id FOREIGN KEY (brand_id) REFERENCES public.catalog_productbrand(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalog_trademark DROP CONSTRAINT catalog_trademark_brand_id_1f05b25a_fk_catalog_materialbrand_id;
       public          postgres    false    2993    241    225            @           2606    18427 O   catalog_trademarkseries catalog_trademarkser_trademark_id_49fa59f5_fk_catalog_t    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog_trademarkseries
    ADD CONSTRAINT catalog_trademarkser_trademark_id_49fa59f5_fk_catalog_t FOREIGN KEY (trademark_id) REFERENCES public.catalog_trademark(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.catalog_trademarkseries DROP CONSTRAINT catalog_trademarkser_trademark_id_49fa59f5_fk_catalog_t;
       public          postgres    false    243    241    3032            6           2606    18160 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    205    219    2941            7           2606    18165 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    213    2959    219            �   R   x�%���  �nV��z,F�eb��"�f;r��9����N=����נ���k�!�˺��TI��3'���eD���4`      �      x������ � �      �   �  x��Y�n�6>KO�hci���c(�]���]HZ���N�A���A��гۍ���W�ި�p(�ВlisX`%}�f�����|�pᅳ�7_�z�"K�8�#����p� �>�C�[%��Y4�2ԷJ`��q���ԍ4(2[E�^���r��Zy����#�͏a1A��)2$�Hp�"��d�^9=H���M�<Ǽ�Ӝ�AHP�b �>���(q������}�bx����0,c�c������"���eOV�3����c��Ƅ~B���;e��eX��:���!a�r6�K�Y��l/a�^#s�AV����x'>���0�����@��Kq&��w�y��8*��ѱB;#�@�Z��i�'[�i�ό�����(c&k�3/(�X�*���k/?��#�!�����t'b�I&ދ���A���b%�r�Vd0�zlU��DA�h���E5�h�{�$)�(K��z#N��^�q&� ��1�`�}̬q�b ��R:��U>W3�ԑ��R��(����$\���"���̋xL�7�3�pH��n$�@���5�T�q9��'5�o�t_�U����Ҍ�̵Zs�bY�1wkMg�iAG\�5�.�q�7r6�9{,'�K��s�PR='�n�m�{��l��L�q��DXj���!;q�"'��N�FE�#��������U����Ɂ9�����Ȍ���:������4���:wp{�Dn)���Ov�����0;�3�9w��"�d'jx�y��&�Q\��{��s�*��t^�3��;�[�ND���k`U�;qY��!+5wbbZ�U�,�A��D��kn X��+�CoF����1�,�>tcKíà�7#M,�����߈4�a�o��fR����f�X����>�_�h�?,���d���h�Lc؝yٺ������k�m�D�NZ�nc,�k�#U�OUaO�B��\"�ѽ���TϨR��"��!�i�k��x���Fx�ֻ���à�I�{����R�_a�Tε�3�F�g���OY�]�$͢=p��xm	Qh��W���(��I+[[F��k�f0"j�_��$�E{a��5�/�ԨS�n�X��ѡl�T�x[��%�J�Ɂ�M�C=��T��m*g]��#��4�}6v%i�{�c^#�x�M{���N���R6:�l8e}>QK/��Ńe2���;�q`��L�z�p�,U��P��>S��	���g�6��@OfqM���3�)-Q>��:��$EmRvLiI	�ڄĩ����Ȝ�}��:9A�����z�}���u F���֙��6�g�\lݫ��Ig3D������k?��³����
M�6X��K�CO���fx��}w�-�F�7E��g���"�w���X��� ���2��}�C|w�<�I�+X�6�X�G�xc���o,$�,ҸAU����4�$lX��F�<xT���Dx\����* Y�˥�A���;nڂq�6��
�Y�>���-J���
�W�@5{\+5�Na*��V�[��pL��^�ọoo���Cj���n�l�P|Ӹu�b�`���MO�W/�/�x'	�ʋ+EG=u�>�$Q�����\���{�mt̗�.�3��Ȉq*��o��m���!E���5@8,g�^*���\�aY��Z������U<�v�x>w�˵\O��>]�*:�
�?S��r�����`6M9�*��3�����|���g�g�      �   �  x�u�MN�@��s
�!<��Ó��DK����	B�Lb�$�1�Vm/�+�7@��@�z�Fu*�
)<��f��U���8$�+�p]��QSӝ�μ�㜵U?�i��n��I�զ|!�ae���[T�H����C��VB�x�|�|.���}�+�J�� � �p�T\�Ǵ�v#�?���sSWO���A�`๮��yka�;$}O��B&�:9�/��2�k���8�'���s�@��~�����؝�l���'N��tf�$�zc��7����W�(e��HR涮����G���r�7���b+���Q?kM��sMә���;"�������/�rh53�Dw�t���c}�x-��1M� T�
S��'�J�qGsr�-���W�@\4VՉ�[�V�T�jǬ      �      x�3�4�4�2�4�Ɯ&�F\1z\\\ !��      �      x������ � �      �   �   x�3�L+�ɉOJ,N�M�+�0���.l������m��.�دpaㅭ�+\l����V�����{.���T �:w��lj��e�Y�4:-193/���<4@�/6���e�	��j$�pA�NJL�+�t�Ƌ�@�07D�O9��1z\\\ ?ͥW      �   ,   x�3�0�ہx��.#�s.��xaׅM6p��qqq s�             x�3�L2�1�t\F�I@�)W� 9�      �   9   x�3�0�¾��6\�ua߅M��;.l
m
m�2⼰�ى[E� tf0             x�3�L150�t\F�)f 6������� N��         !   x�3��540��\F@��)�md����� P�
         -   x�3�45�44 N=cNC 4�4�M�,#N�8s��qqq ��`      �      x�3��L�K-JJ-JO-����� D �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�U�]
�0���S��?�$j�@,�V��}��A�AQ#���a�Fn
"��3��Pl�JS��δ��}C�^��|k�r�i�3-p���6{�T��#|B%�-qG�c�V�vFYZ�����'�/Ա���R�r"���r��f����3����yӁ��gmyW      �      x������ � �      �      x�3�4250��4����� a1            x�3�425��0�73�4�1W�0�����)'P(������� ��� (UaWahb�i���$Te�ifdob`od`�ya��_�waㅭ���^���V���V� �����r�b���� ��2      �   !   x������,�,���4䲄p�؄+F��� d��            x������ � �            x�3��4����� 	9c      
      x�3��4����� 	9c            x�3��4����� 	%a            x�3��4����� 	0b            x������ � �      �   v   x�3�,N�I�O�-�ɯLMἰ�{.컰H����b���\Ɯř@%�i��)�%��ŕ�%���5̽0OA���[/lW r�\X��eę���Z����zL��F��=... ?#B�      �      x������ � �      �      x������ � �         �   x�]�1��@Ek�)r���6H�0����PDi(((�����fW�s#>���-����C&�,�c��6�c�����KX�Ƹ���h��J�h���U_��ϴ�>��f.8rx#X�}�?������@b��va_�)�M�dn	|���U�.�6.���Ιfʷ���%6����4�ڇ��N��O��)���Rw�Ћ�      �   �  x��YKoU^;�b�U�����-B���5���Uǎ&.( $Z��*!U���`���:��/���ܙq���n�U��Q�;��<nX�S��1v��X٘j���B�ME����^�~�Oo�ˏ�\Oz���G_~�է-�bk|�q�9�!o������Q���5��9SsF��LWLL��_����F>����W>�j@|gM��"�Xg��=���X@=ȟNo��7�h�0~:�&�O��U/c����	��"�7�'ߋ�g�ځ7'��S��	\��&��p�l.[����G �}�'K27!���#��M�@�,�6��f~X�g�x���O�}��G�Kp|�
�� }�Gw�o5�E|ŉUBSSF���#@~r"�!$�� Hf�)O���8�u�$�����~:���ӏׇ�V���	6gB�
X"$��Q����l3�.�YS.f^`�mXc�.P΋��66��]�D,�N��N����q
�\D���F:^zsAQm��E#�ZDQ�0��P�ڣ��Pt��G�bҰ�\\d���P��E�*L�Y{�q�(�>.ņ(�S�RWj�g��#��_���L���G��tz���E`)�c�T	Z�{��y&�!���$J0.+!�EyB�
iF��������]Q°`��<<�oN�W�L]��X�AИi����*�� k���P( �q�T��������"���)˱=�d�{�p܇7��px��҄W���Y��'���P�`NBq���\�l2ԯ�h�PIy��?��g�Ŗ|A���^��8�u�ya�塨d�"�jͫ�a�`��]��c?�`�x�׎)=�p1��Y�t�8�y����+��{`��GG�� �5�
��N�e:��'�a�`Ilj_B�6ڝ�f,�m�h�/��;��+}����r��mS��ӠB�J+�
�]Q�x���N�
e�h�t'(*b6����%� u�t��&�ƥk�Ags�맽�f��^�����P�J�\i�QUu���Yr��O}8RM�~6>O��N7͒�~w��N(N�]�1�t5c��o���٨���8��R��+㪺vw������Lt�n�?N;���S�$�F�3�����P%�K��6��A�?��T����h�s	�v��y���A��u�ּ��s�P9:�Qv�q`����Bl�U��������Õ��:9d/TG4c��]q3kG�d�F�����Տ���b2N�~2�`�{I����EJ��vm�#����.���;~/��A�����x{|>�����^L��������d�B�P�s�� ���ܠUtxH��������3xt�xw;���y�+�'-Ғ��˴,f}H�7B��#���Z䓴���v��J���(�@F����0���u������;;�BV5�Ν�����
o=���}�h��%��̏���V2�������dp�K\I���cJ�4�����E��Lc�����Ȇ.eZ�y~�5���rA}nζ������!�ц+ڱ����w���E�J�|~C+��W4��(I�4����xUb���%>gI���k�+z��S`"�~k��[��:����o�ٽ!����MT�2:�^�:5���ޔ,3�2���3˯lU�J3�ތ5'pV����"L�ox�;f��
]�84�𳦀��zv����.�G��,w�u.MV]h��T`��vE��+V/���eSӀ�M\��X[]��-�_M��[���w����7�,����u�f
m�������&��xpSK��/�� ������z�M4^��>�%V\݌uZ�/g�k�;E����p�l-��r#�~�p�߁�gM\C��0H�X�JLC�>l��9W��5ܨy�P��7D-w6@X�Y�Ye��;��UE���|�t38t�X&o^)�yA��
�q%l�LU�9�X�O���ڿD|�      �   @  x�u�Mr� ���a:��ߥ��	6�i��۵�ԓz��'U�P[�Pc+܁�L�[�J�B�Q�9����	����g�EL�����4�XY#��T&FO���Ӭ^�u�)��C��lZ��f�#�d��M�@�و\�e8����^ۮ4c�����v+?d�(�����ާxA{ux����,Ɛh��:���[*!1ߩK��8�B�8l�Ao�b�
a���C����L��G�Vflz�B92ֻ��釧����}z��$��a��u~�zf<��ޤt�T���Hk&�M�אK۞�I�� ~Z��      �   �  x���͎�0���S�}5����gYɲ6�DB�h����d��d3.P�����fם��4�_�z�! 4�flb�A��]�70��G��C �C�7�2~�R`, H
����9}Cb�Ly�`h���B_��:��]���c�S@*1ԝAw�B܍Mw
��x����q�X(4�N,�������M8�c�Ed�L�a��X��\��f�����'����_=DIN)��N(��.?�clڗ%o7QdII�l�;�O���KC��6c���]��CG�g0A4�����S�9��2{7ƽ��f�3��>�]?���}���XC<<;WH��M8�0�!j��Ir"�UB�B�I�6�8F���FQ%P�m ��\����2�(r[����u���#�v`��@ ��-T �$h ��ړ��(��rO$�Tz�^/T���y������=3 �N�[�P�
��(2�����K�Z��_�x ��un5R��+=o�C�}m�` �%��#zr�UB�k����5�.�+�4���]�
 � y��RZI�k�eA� 2 a�o\"v $�,��e@YD�%@	�������
cYD�5�-  ��JI�L��EZ�U����W��rT���x���F����!��މ���8�������_���      �     x�=�Mo�0 ���+v_4�P&;AR"%��م�`��8���vx.o������Qy�|��åtw�8\�kw��H�3��~�< ���5���fg�� %Y�x��g��.V�hh�S+�9�ڲ8�D�,��hB�6��Zy���t�]/yx�nƽ&cuI�����YnѿWO�T0UU	�U�r���?o���B����q�wl�@��"�7vܝL2�G�l�,�y���1�:�IF:|1?���%�x��k�^���nZ���0�_͎g�     