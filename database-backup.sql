--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-1.pgdg16.04+1)
-- Dumped by pg_dump version 12.3

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

--
-- Name: addons; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.addons (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    amount integer NOT NULL,
    restaurant_id integer NOT NULL
);


ALTER TABLE public.addons OWNER TO breakit;

--
-- Name: addons_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.addons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addons_id_seq OWNER TO breakit;

--
-- Name: addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.addons_id_seq OWNED BY public.addons.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO breakit;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO breakit;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO breakit;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO breakit;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO breakit;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO breakit;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.city (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    lat text,
    lon text,
    name character varying(50) NOT NULL,
    active_radius integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.city OWNER TO breakit;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO breakit;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE public.corsheaders_corsmodel OWNER TO breakit;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.corsheaders_corsmodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.corsheaders_corsmodel_id_seq OWNER TO breakit;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.corsheaders_corsmodel_id_seq OWNED BY public.corsheaders_corsmodel.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    lat text,
    lon text,
    preference text NOT NULL,
    full_address text NOT NULL,
    address_landmark text NOT NULL,
    user_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.customers OWNER TO breakit;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO breakit;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: delivery_executives; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.delivery_executives (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    lat text,
    lon text,
    name character varying(100) NOT NULL,
    rating integer NOT NULL,
    orders_fulfilled integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.delivery_executives OWNER TO breakit;

--
-- Name: delivery_executives_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.delivery_executives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_executives_id_seq OWNER TO breakit;

--
-- Name: delivery_executives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.delivery_executives_id_seq OWNED BY public.delivery_executives.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: breakit
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


ALTER TABLE public.django_admin_log OWNER TO breakit;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO breakit;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO breakit;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO breakit;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO breakit;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO breakit;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO breakit;

--
-- Name: food_items; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.food_items (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    nutrition character varying(250) NOT NULL,
    amount integer NOT NULL,
    restaurant_id integer NOT NULL,
    speciality_id integer NOT NULL,
    image character varying(250) NOT NULL
);


ALTER TABLE public.food_items OWNER TO breakit;

--
-- Name: food_items_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.food_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_items_id_seq OWNER TO breakit;

--
-- Name: food_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.food_items_id_seq OWNED BY public.food_items.id;


--
-- Name: food_items_recommended_addons; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.food_items_recommended_addons (
    id integer NOT NULL,
    fooditem_id integer NOT NULL,
    addon_id integer NOT NULL
);


ALTER TABLE public.food_items_recommended_addons OWNER TO breakit;

--
-- Name: food_items_recommended_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.food_items_recommended_addons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_items_recommended_addons_id_seq OWNER TO breakit;

--
-- Name: food_items_recommended_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.food_items_recommended_addons_id_seq OWNED BY public.food_items_recommended_addons.id;


--
-- Name: food_speciality; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.food_speciality (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    type character varying(20) NOT NULL,
    icon character varying(250) NOT NULL
);


ALTER TABLE public.food_speciality OWNER TO breakit;

--
-- Name: food_speciality_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.food_speciality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_speciality_id_seq OWNER TO breakit;

--
-- Name: food_speciality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.food_speciality_id_seq OWNED BY public.food_speciality.id;


--
-- Name: locality; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.locality (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    lat text,
    lon text,
    name character varying(50) NOT NULL,
    active_radius integer NOT NULL,
    is_active boolean NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.locality OWNER TO breakit;

--
-- Name: locality_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.locality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locality_id_seq OWNER TO breakit;

--
-- Name: locality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.locality_id_seq OWNED BY public.locality.id;


--
-- Name: mealsets; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.mealsets (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    delivery_date date NOT NULL,
    locality_id integer NOT NULL,
    food_item_five_id integer NOT NULL,
    food_item_four_id integer NOT NULL,
    food_item_one_id integer NOT NULL,
    food_item_three_id integer NOT NULL,
    food_item_two_id integer NOT NULL
);


ALTER TABLE public.mealsets OWNER TO breakit;

--
-- Name: mealsets_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.mealsets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mealsets_id_seq OWNER TO breakit;

--
-- Name: mealsets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.mealsets_id_seq OWNED BY public.mealsets.id;


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO breakit;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO breakit;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO breakit;

--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.oauth2_provider_application (
    id bigint DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO breakit;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO breakit;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO breakit;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO breakit;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO breakit;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    lat text,
    lon text,
    amount integer NOT NULL,
    status integer NOT NULL,
    fail_reason text NOT NULL,
    rating integer NOT NULL,
    full_address text NOT NULL,
    address_landmark text NOT NULL,
    customer_id integer,
    delivery_executive_id integer,
    food_item_id integer,
    mealset_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO breakit;

--
-- Name: orders_addons; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.orders_addons (
    id integer NOT NULL,
    order_id integer NOT NULL,
    addon_id integer NOT NULL
);


ALTER TABLE public.orders_addons OWNER TO breakit;

--
-- Name: orders_addons_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.orders_addons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_addons_id_seq OWNER TO breakit;

--
-- Name: orders_addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.orders_addons_id_seq OWNED BY public.orders_addons.id;


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO breakit;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.restaurants (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    lat text,
    lon text,
    name character varying(100) NOT NULL,
    rating integer NOT NULL,
    orders_fulfilled integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.restaurants OWNER TO breakit;

--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.restaurants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_id_seq OWNER TO breakit;

--
-- Name: restaurants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    mobile character varying(60),
    latest_otp character varying(6),
    is_active boolean NOT NULL,
    fcm_token character varying(200),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_staff boolean NOT NULL,
    auth_token character varying(20)
);


ALTER TABLE public."user" OWNER TO breakit;

--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_groups OWNER TO breakit;

--
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_groups_id_seq OWNER TO breakit;

--
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.user_groups_id_seq OWNED BY public.user_groups.id;


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO breakit;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_user_permissions; Type: TABLE; Schema: public; Owner: breakit
--

CREATE TABLE public.user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_user_permissions OWNER TO breakit;

--
-- Name: user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: breakit
--

CREATE SEQUENCE public.user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_permissions_id_seq OWNER TO breakit;

--
-- Name: user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: breakit
--

ALTER SEQUENCE public.user_user_permissions_id_seq OWNED BY public.user_user_permissions.id;


--
-- Name: addons id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.addons ALTER COLUMN id SET DEFAULT nextval('public.addons_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: city id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: corsheaders_corsmodel id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('public.corsheaders_corsmodel_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: delivery_executives id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.delivery_executives ALTER COLUMN id SET DEFAULT nextval('public.delivery_executives_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: food_items id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_items ALTER COLUMN id SET DEFAULT nextval('public.food_items_id_seq'::regclass);


--
-- Name: food_items_recommended_addons id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_items_recommended_addons ALTER COLUMN id SET DEFAULT nextval('public.food_items_recommended_addons_id_seq'::regclass);


--
-- Name: food_speciality id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_speciality ALTER COLUMN id SET DEFAULT nextval('public.food_speciality_id_seq'::regclass);


--
-- Name: locality id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.locality ALTER COLUMN id SET DEFAULT nextval('public.locality_id_seq'::regclass);


--
-- Name: mealsets id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets ALTER COLUMN id SET DEFAULT nextval('public.mealsets_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_addons id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders_addons ALTER COLUMN id SET DEFAULT nextval('public.orders_addons_id_seq'::regclass);


--
-- Name: restaurants id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_groups id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_groups_id_seq'::regclass);


--
-- Name: user_user_permissions id; Type: DEFAULT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_permissions_id_seq'::regclass);


--
-- Data for Name: addons; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.addons (id, created_at, updated_at, name, description, amount, restaurant_id) FROM stdin;
1	2020-07-28 23:54:46.005694+00	2020-07-28 23:54:46.00581+00	Chaas	Cold chaas	50	1
2	2020-07-29 00:03:33.752648+00	2020-07-29 00:03:33.752773+00	Coke	Refreshing coke	35	1
3	2020-07-29 00:07:17.615313+00	2020-07-29 00:07:17.615373+00	Curd	Amul Curd	35	1
4	2020-07-29 00:09:27.894297+00	2020-07-29 00:09:27.894336+00	Whey Protein Shake	MuscleBlaze brand Whey Protein Shake with 200g of protein nutritional value	110	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add application	6	add_application
22	Can change application	6	change_application
23	Can delete application	6	delete_application
24	Can view application	6	view_application
25	Can add access token	7	add_accesstoken
26	Can change access token	7	change_accesstoken
27	Can delete access token	7	delete_accesstoken
28	Can view access token	7	view_accesstoken
29	Can add grant	8	add_grant
30	Can change grant	8	change_grant
31	Can delete grant	8	delete_grant
32	Can view grant	8	view_grant
33	Can add refresh token	9	add_refreshtoken
34	Can change refresh token	9	change_refreshtoken
35	Can delete refresh token	9	delete_refreshtoken
36	Can view refresh token	9	view_refreshtoken
37	Can add cors model	10	add_corsmodel
38	Can change cors model	10	change_corsmodel
39	Can delete cors model	10	delete_corsmodel
40	Can view cors model	10	view_corsmodel
41	Can add user	11	add_user
42	Can change user	11	change_user
43	Can delete user	11	delete_user
44	Can view user	11	view_user
45	Can add customer	12	add_customer
46	Can change customer	12	change_customer
47	Can delete customer	12	delete_customer
48	Can view customer	12	view_customer
49	Can add delivery executive	13	add_deliveryexecutive
50	Can change delivery executive	13	change_deliveryexecutive
51	Can delete delivery executive	13	delete_deliveryexecutive
52	Can view delivery executive	13	view_deliveryexecutive
53	Can add meal set	14	add_mealset
54	Can change meal set	14	change_mealset
55	Can delete meal set	14	delete_mealset
56	Can view meal set	14	view_mealset
57	Can add city	15	add_city
58	Can change city	15	change_city
59	Can delete city	15	delete_city
60	Can view city	15	view_city
61	Can add food speciality	16	add_foodspeciality
62	Can change food speciality	16	change_foodspeciality
63	Can delete food speciality	16	delete_foodspeciality
64	Can view food speciality	16	view_foodspeciality
65	Can add locality	17	add_locality
66	Can change locality	17	change_locality
67	Can delete locality	17	delete_locality
68	Can view locality	17	view_locality
69	Can add order	18	add_order
70	Can change order	18	change_order
71	Can delete order	18	delete_order
72	Can view order	18	view_order
73	Can add add on	19	add_addon
74	Can change add on	19	change_addon
75	Can delete add on	19	delete_addon
76	Can view add on	19	view_addon
77	Can add restaurant	20	add_restaurant
78	Can change restaurant	20	change_restaurant
79	Can delete restaurant	20	delete_restaurant
80	Can view restaurant	20	view_restaurant
81	Can add food item	21	add_fooditem
82	Can change food item	21	change_fooditem
83	Can delete food item	21	delete_fooditem
84	Can view food item	21	view_fooditem
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.city (id, created_at, updated_at, lat, lon, name, active_radius, is_active) FROM stdin;
1	2020-07-29 00:11:46.918633+00	2020-07-29 00:11:46.918657+00	18.900	72.900	Sahara	50	t
\.


--
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.customers (id, created_at, updated_at, lat, lon, preference, full_address, address_landmark, user_id, name) FROM stdin;
3	2020-07-31 16:55:39.839628+00	2020-07-31 19:45:53.459645+00	22.7195687	75.8577258		Indore, Madhya Pradesh, India		36	
\.


--
-- Data for Name: delivery_executives; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.delivery_executives (id, created_at, updated_at, lat, lon, name, rating, orders_fulfilled, user_id) FROM stdin;
1	2020-07-28 23:37:24.285894+00	2020-07-31 20:52:09.585173+00	22.7195687	75.8577258	John Doe	-1	0	3
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-07-28 23:37:24.303574+00	1	DeliveryExecutive object (1)	1	[{"added": {}}]	13	2
2	2020-07-28 23:53:46.333095+00	1	1 BreakIt Kitchen	1	[{"added": {}}]	20	2
3	2020-07-28 23:54:46.034789+00	1	1 BreakIt Kitchen-Chaas	1	[{"added": {}}]	19	2
4	2020-07-29 00:00:59.966786+00	1	Chef's Pick	1	[{"added": {}}]	16	2
5	2020-07-29 00:01:58.484105+00	1	1 BreakIt Kitchen-Chole Kulche	1	[{"added": {}}]	21	2
6	2020-07-29 00:02:33.9551+00	2	Continental	1	[{"added": {}}]	16	2
7	2020-07-29 00:03:33.767048+00	2	2 BreakIt Kitchen-Coke	1	[{"added": {}}]	19	2
8	2020-07-29 00:03:45.878923+00	2	2 BreakIt Kitchen-White Sauce Pasta	1	[{"added": {}}]	21	2
9	2020-07-29 00:04:50.514461+00	3	High Protein	1	[{"added": {}}]	16	2
10	2020-07-29 00:05:12.201421+00	3	3 BreakIt Kitchen-Chicken Tikka Masala Meal	1	[{"added": {}}]	21	2
11	2020-07-29 00:06:26.099951+00	4	Falahar	1	[{"added": {}}]	16	2
12	2020-07-29 00:07:17.636372+00	3	3 BreakIt Kitchen-Curd	1	[{"added": {}}]	19	2
13	2020-07-29 00:07:20.626668+00	4	4 BreakIt Kitchen-Sabudana Khichdi	1	[{"added": {}}]	21	2
14	2020-07-29 00:07:56.01429+00	5	Keto	1	[{"added": {}}]	16	2
15	2020-07-29 00:09:27.903111+00	4	4 BreakIt Kitchen-Whey Protein Shake	1	[{"added": {}}]	19	2
16	2020-07-29 00:09:34.752883+00	5	5 BreakIt Kitchen-Paneer with Oats	1	[{"added": {}}]	21	2
17	2020-07-29 00:09:55.803075+00	3	3 BreakIt Kitchen-Chicken Tikka Masala Meal	2	[{"changed": {"fields": ["recommended_addons"]}}]	21	2
18	2020-07-29 00:11:46.942237+00	1	Sahara	1	[{"added": {}}]	15	2
19	2020-07-29 00:11:49.838043+00	1	Oasis City	1	[{"added": {}}]	17	2
20	2020-07-29 00:36:47.146203+00	6	MealSet object (6)	1	[{"added": {}}]	14	2
21	2020-07-29 00:47:46.606937+00	7	MealSet object (7)	1	[{"added": {}}]	14	2
22	2020-07-29 00:50:27.394852+00	1	Order object (1)	2	[{"changed": {"fields": ["status"]}}]	18	2
23	2020-07-29 00:53:35.184362+00	1	Order object (1)	2	[{"changed": {"fields": ["status"]}}]	18	2
24	2020-07-29 01:08:17.563483+00	1	Order object (1)	2	[{"changed": {"fields": ["delivery_executive"]}}]	18	2
25	2020-07-29 01:09:55.277366+00	1	Order object (1)	2	[{"changed": {"fields": ["status"]}}]	18	2
26	2020-07-30 18:49:59.19669+00	8	8 2020-07-15 Oasis City	1	[{"added": {}}]	14	37
27	2020-07-30 18:51:28.93635+00	6	6 2020-08-01 Oasis City	2	[{"changed": {"fields": ["delivery_date"]}}]	14	37
28	2020-07-30 18:55:04.37862+00	2	Order object (2)	2	[{"changed": {"fields": ["mealset"]}}]	18	37
29	2020-07-31 16:07:59.716046+00	9	9 2020-08-02 Oasis City	1	[{"added": {}}]	14	37
30	2020-07-31 16:09:32.089153+00	5	5 BreakIt Kitchen-Paneer with Oats	2	[{"changed": {"fields": ["image"]}}]	21	37
31	2020-07-31 16:10:37.583849+00	4	4 BreakIt Kitchen-Sabudana Khichdi	2	[{"changed": {"fields": ["image"]}}]	21	37
32	2020-07-31 16:11:20.466369+00	3	3 BreakIt Kitchen-Chicken Tikka Masala Meal	2	[{"changed": {"fields": ["image"]}}]	21	37
33	2020-07-31 16:11:59.197658+00	2	2 BreakIt Kitchen-White Sauce Pasta	2	[{"changed": {"fields": ["image"]}}]	21	37
34	2020-07-31 16:15:56.770936+00	1	1 BreakIt Kitchen-Chole Kulche	2	[{"changed": {"fields": ["description"]}}]	21	37
35	2020-07-31 16:16:42.788326+00	2	2 BreakIt Kitchen-White Sauce Pasta	2	[{"changed": {"fields": ["description"]}}]	21	37
36	2020-07-31 16:16:59.912092+00	3	3 BreakIt Kitchen-Chicken Tikka Masala Meal	2	[{"changed": {"fields": ["description"]}}]	21	37
37	2020-07-31 16:17:52.011778+00	5	5 BreakIt Kitchen-Paneer with Oats	2	[{"changed": {"fields": ["description"]}}]	21	37
38	2020-07-31 16:18:29.543717+00	4	4 BreakIt Kitchen-Sabudana Khichdi	2	[{"changed": {"fields": ["description"]}}]	21	37
39	2020-07-31 16:32:57.454053+00	6	6 2020-08-31 Oasis City	2	[{"changed": {"fields": ["delivery_date"]}}]	14	37
40	2020-07-31 16:33:48.764218+00	6	6 2020-07-31 Oasis City	2	[{"changed": {"fields": ["delivery_date"]}}]	14	37
41	2020-07-31 16:51:59.365437+00	3	Order object (3)	3		18	37
42	2020-07-31 16:51:59.382157+00	2	Order object (2)	3		18	37
43	2020-07-31 16:51:59.386182+00	1	Order object (1)	3		18	37
44	2020-07-31 16:52:14.470733+00	7	7 2020-07-01 Oasis City	2	[{"changed": {"fields": ["delivery_date"]}}]	14	37
45	2020-07-31 16:52:21.946637+00	7	7 2020-08-01 Oasis City	2	[{"changed": {"fields": ["delivery_date"]}}]	14	37
46	2020-07-31 16:52:34.945178+00	9	9 2020-08-02 Oasis City	3		14	37
47	2020-07-31 16:53:14.804608+00	2	Customer object (2)	3		12	37
48	2020-07-31 16:53:14.81771+00	1	Customer object (1)	3		12	37
49	2020-07-31 19:37:19.45758+00	6	6 2020-08-02 Oasis City	2	[{"changed": {"fields": ["delivery_date"]}}]	14	37
50	2020-07-31 19:37:37.602134+00	8	8 2020-08-03 Oasis City	2	[{"changed": {"fields": ["delivery_date"]}}]	14	37
51	2020-07-31 19:37:56.5145+00	7	7 2020-08-01 Oasis City	2	[{"changed": {"fields": ["food_item_two", "food_item_three", "food_item_four"]}}]	14	37
52	2020-07-31 20:09:01.363623+00	4	Order object (4)	2	[{"changed": {"fields": ["status", "address_landmark"]}}]	18	37
53	2020-07-31 20:09:44.035829+00	7	7 2020-08-01 Oasis City	3		14	37
54	2020-07-31 20:09:49.767523+00	6	6 2020-08-01 Oasis City	2	[{"changed": {"fields": ["delivery_date"]}}]	14	37
55	2020-07-31 20:21:15.750321+00	4	Order object (4)	2	[{"changed": {"fields": ["status"]}}]	18	37
56	2020-07-31 20:39:20.966621+00	4	Order object (4)	2	[{"changed": {"fields": ["status"]}}]	18	37
57	2020-07-31 20:39:31.312199+00	4	Order object (4)	2	[{"changed": {"fields": ["status"]}}]	18	37
58	2020-07-31 20:51:29.296655+00	4	Order object (4)	2	[{"changed": {"fields": ["delivery_executive"]}}]	18	37
59	2020-07-31 20:52:09.588955+00	1	DeliveryExecutive object (1)	2	[{"changed": {"fields": ["lat", "lon"]}}]	13	37
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	oauth2_provider	application
7	oauth2_provider	accesstoken
8	oauth2_provider	grant
9	oauth2_provider	refreshtoken
10	corsheaders	corsmodel
11	authentication	user
12	customers	customer
13	delivery	deliveryexecutive
14	mealset	mealset
15	operation_manifest	city
16	operation_manifest	foodspeciality
17	operation_manifest	locality
18	orders	order
19	restaurants	addon
20	restaurants	restaurant
21	restaurants	fooditem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-07-28 22:40:06.393296+00
2	contenttypes	0002_remove_content_type_name	2020-07-28 22:40:06.449169+00
3	auth	0001_initial	2020-07-28 22:40:06.630848+00
4	auth	0002_alter_permission_name_max_length	2020-07-28 22:40:06.864091+00
5	auth	0003_alter_user_email_max_length	2020-07-28 22:40:06.906257+00
6	auth	0004_alter_user_username_opts	2020-07-28 22:40:06.950002+00
7	auth	0005_alter_user_last_login_null	2020-07-28 22:40:06.996981+00
8	auth	0006_require_contenttypes_0002	2020-07-28 22:40:07.01653+00
9	auth	0007_alter_validators_add_error_messages	2020-07-28 22:40:07.049991+00
10	auth	0008_alter_user_username_max_length	2020-07-28 22:40:07.09573+00
11	auth	0009_alter_user_last_name_max_length	2020-07-28 22:40:07.150224+00
12	auth	0010_alter_group_name_max_length	2020-07-28 22:40:07.203859+00
13	auth	0011_update_proxy_permissions	2020-07-28 22:40:07.238604+00
14	authentication	0001_initial	2020-07-28 22:40:07.397313+00
15	admin	0001_initial	2020-07-28 22:40:07.690345+00
16	admin	0002_logentry_remove_auto_add	2020-07-28 22:40:07.779172+00
17	admin	0003_logentry_add_action_flag_choices	2020-07-28 22:40:07.821763+00
18	corsheaders	0001_initial	2020-07-28 22:40:07.912084+00
19	customers	0001_initial	2020-07-28 22:40:08.016455+00
20	delivery	0001_initial	2020-07-28 22:40:08.148204+00
21	operation_manifest	0001_initial	2020-07-28 22:40:08.346626+00
22	restaurants	0001_initial	2020-07-28 22:40:08.691113+00
23	mealset	0001_initial	2020-07-28 22:40:09.014878+00
24	oauth2_provider	0001_initial	2020-07-28 22:40:09.489485+00
25	oauth2_provider	0002_08_updates	2020-07-28 22:40:10.145764+00
26	oauth2_provider	0003_auto_20160316_1503	2020-07-28 22:40:10.249696+00
27	oauth2_provider	0004_auto_20160525_1623	2020-07-28 22:40:10.557801+00
28	oauth2_provider	0005_auto_20170514_1141	2020-07-28 22:40:12.408636+00
29	oauth2_provider	0006_auto_20171214_2232	2020-07-28 22:40:13.119314+00
30	orders	0001_initial	2020-07-28 22:40:13.317328+00
31	sessions	0001_initial	2020-07-28 22:40:13.610033+00
32	authentication	0002_user_is_staff	2020-07-28 22:47:04.146141+00
33	orders	0002_auto_20200729_0416	2020-07-28 22:47:04.398832+00
34	authentication	0003_user_auth_token	2020-07-28 23:19:19.050032+00
35	operation_manifest	0002_auto_20200729_0527	2020-07-28 23:57:13.878443+00
36	restaurants	0002_auto_20200729_0605	2020-07-29 00:36:21.139536+00
37	mealset	0002_auto_20200729_0605	2020-07-29 00:36:21.490713+00
38	customers	0002_customer_name	2020-07-29 04:46:13.848721+00
39	restaurants	0003_fooditem_image	2020-07-30 20:15:00.448954+00
40	operation_manifest	0003_foodspeciality_icon	2020-07-31 05:02:44.882946+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
5f2d372t86rt7jmrkg9mpgekwynp0t53	YzliNmNhNDc5NWZmMTE3YTA0ZTlkMDBmODhjZjBjZjg3YTEyZDhmODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MTU3ZDA4NGUyYTg4M2ZlYTViNDI0ZjQ1NDc0Y2YzMTI0MGRiMDcyIn0=	2020-08-11 22:48:28.887606+00
3fqo552uscniwhdg50xozw877mzy01fu	NTJmNTJmZmQ3ZTBmM2MwZTI1MjUxYzU2ZmEyZGUyY2FiYjY5ZTQ1OTp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGM5NzNkMDY0Nzk4NTA4N2ZjNTM4NzkxM2VkZGEzNTg3ZGE5OWJkMiJ9	2020-08-13 18:49:25.915338+00
caxpb99njr7ylf7g0w2hc76bz9gyd5rk	NTJmNTJmZmQ3ZTBmM2MwZTI1MjUxYzU2ZmEyZGUyY2FiYjY5ZTQ1OTp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGM5NzNkMDY0Nzk4NTA4N2ZjNTM4NzkxM2VkZGEzNTg3ZGE5OWJkMiJ9	2020-08-14 04:59:00.865699+00
\.


--
-- Data for Name: food_items; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.food_items (id, created_at, updated_at, name, description, nutrition, amount, restaurant_id, speciality_id, image) FROM stdin;
1	2020-07-29 00:01:58.353586+00	2020-07-31 16:15:56.760415+00	Chole Kulche	A delicious meal all by itself. A traditional Punjabi recipe, Kulche is made from maida.	{ "protein" : 123,  "carbs" : 123}	50	1	1	https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2013/06/matar-kulcha-recipe-1-500x500.jpg
2	2020-07-29 00:03:45.816498+00	2020-07-31 16:16:42.777838+00	White Sauce Pasta	It's cheesy and oh so good! Packed with veggies. Guilt free healthy Food!	{ "protein" : 40,  "carbs" : 180, "fat": 202}	100	1	2	https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT01AAxy_nTwI9rKR9G4ZPggU1GpgFUMNKs6Q&usqp=CAU
3	2020-07-29 00:05:12.124146+00	2020-07-31 16:16:59.899482+00	Chicken Tikka Masala Meal	With a rich, flavoursome tomato sauce and delicately flavoured chunks of chicken, what's not to love	{ "protein" : 200,  "carbs" : 30, "fat": 20}	100	1	3	https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR0D_5k2tx-jpg8tB7CLHZmyS0eBNB-zyPeEA&usqp=CAU
5	2020-07-29 00:09:34.697924+00	2020-07-31 16:17:52.001762+00	Paneer with Oats	Paneer Oats Paratha is a North Indian recipe made using oats, paneer and wheat flour. #Healthy :D	{ "protein" : 110,  "carbs" : 5, "fat": 15}	180	1	5	https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRB3-4oxaA5F_O_S1kzwYQROQI7dcZTUVxZPw&usqp=CAU
4	2020-07-29 00:07:20.547827+00	2020-07-31 16:18:29.531746+00	Sabudana Khichdi	Enjoy your Falahar meal 🙏 #GodBlessYou	{ "protein" : 20,  "carbs" : 130, "fat": 120}	150	1	4	https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLFl_G8jmiTAAplP5aLMC3h9jthB_ElggkLw&usqp=CAU
\.


--
-- Data for Name: food_items_recommended_addons; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.food_items_recommended_addons (id, fooditem_id, addon_id) FROM stdin;
1	1	1
2	2	2
3	3	2
4	4	3
5	5	3
6	5	4
7	3	4
\.


--
-- Data for Name: food_speciality; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.food_speciality (id, created_at, updated_at, type, icon) FROM stdin;
1	2020-07-29 00:00:59.938863+00	2020-07-29 00:00:59.938889+00	Chef's Pick	https://image.flaticon.com/icons/png/512/1599/1599774.png
2	2020-07-29 00:02:33.94224+00	2020-07-29 00:02:33.942411+00	Continental	https://image.flaticon.com/icons/png/512/1599/1599774.png
3	2020-07-29 00:04:50.497514+00	2020-07-29 00:04:50.49762+00	High Protein	https://image.flaticon.com/icons/png/512/1599/1599774.png
4	2020-07-29 00:06:26.082612+00	2020-07-29 00:06:26.082634+00	Falahar	https://image.flaticon.com/icons/png/512/1599/1599774.png
5	2020-07-29 00:07:56.003832+00	2020-07-29 00:07:56.003857+00	Keto	https://image.flaticon.com/icons/png/512/1599/1599774.png
\.


--
-- Data for Name: locality; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.locality (id, created_at, updated_at, lat, lon, name, active_radius, is_active, city_id) FROM stdin;
1	2020-07-29 00:11:49.809027+00	2020-07-29 00:11:49.809052+00	18.900	72.900	Oasis City	10	t	1
\.


--
-- Data for Name: mealsets; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.mealsets (id, created_at, updated_at, delivery_date, locality_id, food_item_five_id, food_item_four_id, food_item_one_id, food_item_three_id, food_item_two_id) FROM stdin;
8	2020-07-30 18:49:59.183546+00	2020-07-31 19:37:37.596715+00	2020-08-03	1	1	2	5	3	4
6	2020-07-29 00:36:47.117634+00	2020-07-31 20:09:49.762147+00	2020-08-01	1	3	5	1	4	2
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.orders (id, created_at, updated_at, lat, lon, amount, status, fail_reason, rating, full_address, address_landmark, customer_id, delivery_executive_id, food_item_id, mealset_id) FROM stdin;
4	2020-07-31 19:45:16.290087+00	2020-07-31 20:51:29.285613+00	22.7195687	75.8577258	290	2		-1	Indore, Madhya Pradesh, India	A good place	3	1	5	6
\.


--
-- Data for Name: orders_addons; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.orders_addons (id, order_id, addon_id) FROM stdin;
13	4	4
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.restaurants (id, created_at, updated_at, lat, lon, name, rating, orders_fulfilled, user_id) FROM stdin;
1	2020-07-28 23:53:46.30211+00	2020-07-29 01:10:02.559991+00	18.1232	71.1232	BreakIt Kitchen	3	0	3
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public."user" (id, password, last_login, is_superuser, mobile, latest_otp, is_active, fcm_token, created_at, updated_at, is_staff, auth_token) FROM stdin;
2	pbkdf2_sha256$150000$ecOC8wG7COgr$JbXhE2K9HUtUbz6Vdz7+kiD7PXBOigsNeAStWyrVhTM=	2020-07-28 22:48:28.873462+00	t	9090909090	\N	t	\N	2020-07-28 22:48:19.511026+00	2020-07-28 22:48:19.511044+00	t	\N
36		\N	f	8839013329	4375	t	\N	2020-07-30 11:35:53.443326+00	2020-07-31 20:38:32.778916+00	t	495486149906
3		\N	f	1234567890	6657	t	some-fcm-token	2020-07-28 22:53:20.830257+00	2020-07-30 18:46:25.271126+00	t	223948193992
37	pbkdf2_sha256$150000$6aI5uH6onccb$aiD6YvGzZGPhPFHR+NXk4Dk9zi/U6BvvJfRtKLRYElo=	2020-07-31 04:59:00.847254+00	t	9900990099	\N	t	\N	2020-07-30 18:49:19.129288+00	2020-07-30 18:49:19.129298+00	t	\N
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_user_permissions; Type: TABLE DATA; Schema: public; Owner: breakit
--

COPY public.user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.addons_id_seq', 4, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);


--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.city_id_seq', 1, true);


--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.corsheaders_corsmodel_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.customers_id_seq', 3, true);


--
-- Name: delivery_executives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.delivery_executives_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 59, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 40, true);


--
-- Name: food_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.food_items_id_seq', 5, true);


--
-- Name: food_items_recommended_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.food_items_recommended_addons_id_seq', 7, true);


--
-- Name: food_speciality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.food_speciality_id_seq', 5, true);


--
-- Name: locality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.locality_id_seq', 1, true);


--
-- Name: mealsets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.mealsets_id_seq', 9, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: orders_addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.orders_addons_id_seq', 13, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.restaurants_id_seq', 1, true);


--
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.user_id_seq', 37, true);


--
-- Name: user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: breakit
--

SELECT pg_catalog.setval('public.user_user_permissions_id_seq', 1, false);


--
-- Name: addons addons_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.addons
    ADD CONSTRAINT addons_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: city city_name_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_name_key UNIQUE (name);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: corsheaders_corsmodel corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customers customers_user_id_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_key UNIQUE (user_id);


--
-- Name: delivery_executives delivery_executives_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.delivery_executives
    ADD CONSTRAINT delivery_executives_pkey PRIMARY KEY (id);


--
-- Name: delivery_executives delivery_executives_user_id_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.delivery_executives
    ADD CONSTRAINT delivery_executives_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: food_items food_items_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_items
    ADD CONSTRAINT food_items_pkey PRIMARY KEY (id);


--
-- Name: food_items_recommended_addons food_items_recommended_a_fooditem_id_addon_id_72e868d2_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_items_recommended_addons
    ADD CONSTRAINT food_items_recommended_a_fooditem_id_addon_id_72e868d2_uniq UNIQUE (fooditem_id, addon_id);


--
-- Name: food_items_recommended_addons food_items_recommended_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_items_recommended_addons
    ADD CONSTRAINT food_items_recommended_addons_pkey PRIMARY KEY (id);


--
-- Name: food_speciality food_speciality_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_speciality
    ADD CONSTRAINT food_speciality_pkey PRIMARY KEY (id);


--
-- Name: locality locality_name_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.locality
    ADD CONSTRAINT locality_name_key UNIQUE (name);


--
-- Name: locality locality_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.locality
    ADD CONSTRAINT locality_pkey PRIMARY KEY (id);


--
-- Name: mealsets mealsets_delivery_date_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets
    ADD CONSTRAINT mealsets_delivery_date_key UNIQUE (delivery_date);


--
-- Name: mealsets mealsets_locality_id_delivery_date_7053515c_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets
    ADD CONSTRAINT mealsets_locality_id_delivery_date_7053515c_uniq UNIQUE (locality_id, delivery_date);


--
-- Name: mealsets mealsets_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets
    ADD CONSTRAINT mealsets_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: orders_addons orders_addons_order_id_addon_id_12a1b0ef_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders_addons
    ADD CONSTRAINT orders_addons_order_id_addon_id_12a1b0ef_uniq UNIQUE (order_id, addon_id);


--
-- Name: orders_addons orders_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders_addons
    ADD CONSTRAINT orders_addons_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_user_id_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_user_id_key UNIQUE (user_id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_groups user_groups_user_id_group_id_40beef00_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_user_id_group_id_40beef00_uniq UNIQUE (user_id, group_id);


--
-- Name: user user_mobile_key; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_mobile_key UNIQUE (mobile);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_user_permissions user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_permissions user_user_permissions_user_id_permission_id_7dc6e2e0_uniq; Type: CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_user_id_permission_id_7dc6e2e0_uniq UNIQUE (user_id, permission_id);


--
-- Name: addons_restaurant_id_10d6b625; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX addons_restaurant_id_10d6b625 ON public.addons USING btree (restaurant_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: city_name_b45a2f92_like; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX city_name_b45a2f92_like ON public.city USING btree (name varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: food_items_recommended_addons_addon_id_c449a296; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX food_items_recommended_addons_addon_id_c449a296 ON public.food_items_recommended_addons USING btree (addon_id);


--
-- Name: food_items_recommended_addons_fooditem_id_04706635; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX food_items_recommended_addons_fooditem_id_04706635 ON public.food_items_recommended_addons USING btree (fooditem_id);


--
-- Name: food_items_restaurant_id_4f2f0b53; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX food_items_restaurant_id_4f2f0b53 ON public.food_items USING btree (restaurant_id);


--
-- Name: food_items_speciality_id_de68e3d1; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX food_items_speciality_id_de68e3d1 ON public.food_items USING btree (speciality_id);


--
-- Name: locality_city_id_4f797bce; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX locality_city_id_4f797bce ON public.locality USING btree (city_id);


--
-- Name: locality_name_3ac35a20_like; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX locality_name_3ac35a20_like ON public.locality USING btree (name varchar_pattern_ops);


--
-- Name: mealsets_food_item_five_id_8a69279b; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX mealsets_food_item_five_id_8a69279b ON public.mealsets USING btree (food_item_five_id);


--
-- Name: mealsets_food_item_four_id_727b8427; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX mealsets_food_item_four_id_727b8427 ON public.mealsets USING btree (food_item_four_id);


--
-- Name: mealsets_food_item_one_id_cb705e98; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX mealsets_food_item_one_id_cb705e98 ON public.mealsets USING btree (food_item_one_id);


--
-- Name: mealsets_food_item_three_id_e3a37b4f; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX mealsets_food_item_three_id_e3a37b4f ON public.mealsets USING btree (food_item_three_id);


--
-- Name: mealsets_food_item_two_id_5cbb5114; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX mealsets_food_item_two_id_5cbb5114 ON public.mealsets USING btree (food_item_two_id);


--
-- Name: mealsets_locality_id_191a04d9; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX mealsets_locality_id_191a04d9 ON public.mealsets USING btree (locality_id);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: orders_addons_addon_id_756a05e0; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX orders_addons_addon_id_756a05e0 ON public.orders_addons USING btree (addon_id);


--
-- Name: orders_addons_order_id_b8711d3e; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX orders_addons_order_id_b8711d3e ON public.orders_addons USING btree (order_id);


--
-- Name: orders_customer_id_b7016332; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX orders_customer_id_b7016332 ON public.orders USING btree (customer_id);


--
-- Name: orders_delivery_executive_id_afff6b11; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX orders_delivery_executive_id_afff6b11 ON public.orders USING btree (delivery_executive_id);


--
-- Name: orders_food_item_id_201fdf1e; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX orders_food_item_id_201fdf1e ON public.orders USING btree (food_item_id);


--
-- Name: orders_mealset_id_75806149; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX orders_mealset_id_75806149 ON public.orders USING btree (mealset_id);


--
-- Name: user_groups_group_id_b76f8aba; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX user_groups_group_id_b76f8aba ON public.user_groups USING btree (group_id);


--
-- Name: user_groups_user_id_abaea130; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX user_groups_user_id_abaea130 ON public.user_groups USING btree (user_id);


--
-- Name: user_mobile_f4e0e9e6_like; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX user_mobile_f4e0e9e6_like ON public."user" USING btree (mobile varchar_pattern_ops);


--
-- Name: user_user_permissions_permission_id_9deb68a3; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX user_user_permissions_permission_id_9deb68a3 ON public.user_user_permissions USING btree (permission_id);


--
-- Name: user_user_permissions_user_id_ed4a47ea; Type: INDEX; Schema: public; Owner: breakit
--

CREATE INDEX user_user_permissions_user_id_ed4a47ea ON public.user_user_permissions USING btree (user_id);


--
-- Name: addons addons_restaurant_id_10d6b625_fk_restaurants_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.addons
    ADD CONSTRAINT addons_restaurant_id_10d6b625_fk_restaurants_id FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers customers_user_id_28f6c6eb_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_28f6c6eb_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: delivery_executives delivery_executives_user_id_696f3599_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.delivery_executives
    ADD CONSTRAINT delivery_executives_user_id_696f3599_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_items_recommended_addons food_items_recommend_fooditem_id_04706635_fk_food_item; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_items_recommended_addons
    ADD CONSTRAINT food_items_recommend_fooditem_id_04706635_fk_food_item FOREIGN KEY (fooditem_id) REFERENCES public.food_items(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_items_recommended_addons food_items_recommended_addons_addon_id_c449a296_fk_addons_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_items_recommended_addons
    ADD CONSTRAINT food_items_recommended_addons_addon_id_c449a296_fk_addons_id FOREIGN KEY (addon_id) REFERENCES public.addons(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_items food_items_restaurant_id_4f2f0b53_fk_restaurants_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_items
    ADD CONSTRAINT food_items_restaurant_id_4f2f0b53_fk_restaurants_id FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: food_items food_items_speciality_id_de68e3d1_fk_food_speciality_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.food_items
    ADD CONSTRAINT food_items_speciality_id_de68e3d1_fk_food_speciality_id FOREIGN KEY (speciality_id) REFERENCES public.food_speciality(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: locality locality_city_id_4f797bce_fk_city_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.locality
    ADD CONSTRAINT locality_city_id_4f797bce_fk_city_id FOREIGN KEY (city_id) REFERENCES public.city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mealsets mealsets_food_item_five_id_8a69279b_fk_food_items_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets
    ADD CONSTRAINT mealsets_food_item_five_id_8a69279b_fk_food_items_id FOREIGN KEY (food_item_five_id) REFERENCES public.food_items(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mealsets mealsets_food_item_four_id_727b8427_fk_food_items_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets
    ADD CONSTRAINT mealsets_food_item_four_id_727b8427_fk_food_items_id FOREIGN KEY (food_item_four_id) REFERENCES public.food_items(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mealsets mealsets_food_item_one_id_cb705e98_fk_food_items_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets
    ADD CONSTRAINT mealsets_food_item_one_id_cb705e98_fk_food_items_id FOREIGN KEY (food_item_one_id) REFERENCES public.food_items(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mealsets mealsets_food_item_three_id_e3a37b4f_fk_food_items_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets
    ADD CONSTRAINT mealsets_food_item_three_id_e3a37b4f_fk_food_items_id FOREIGN KEY (food_item_three_id) REFERENCES public.food_items(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mealsets mealsets_food_item_two_id_5cbb5114_fk_food_items_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets
    ADD CONSTRAINT mealsets_food_item_two_id_5cbb5114_fk_food_items_id FOREIGN KEY (food_item_two_id) REFERENCES public.food_items(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mealsets mealsets_locality_id_191a04d9_fk_locality_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.mealsets
    ADD CONSTRAINT mealsets_locality_id_191a04d9_fk_locality_id FOREIGN KEY (locality_id) REFERENCES public.locality(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_addons orders_addons_addon_id_756a05e0_fk_addons_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders_addons
    ADD CONSTRAINT orders_addons_addon_id_756a05e0_fk_addons_id FOREIGN KEY (addon_id) REFERENCES public.addons(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_addons orders_addons_order_id_b8711d3e_fk_orders_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders_addons
    ADD CONSTRAINT orders_addons_order_id_b8711d3e_fk_orders_id FOREIGN KEY (order_id) REFERENCES public.orders(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders orders_customer_id_b7016332_fk_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_b7016332_fk_customers_id FOREIGN KEY (customer_id) REFERENCES public.customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders orders_delivery_executive_id_afff6b11_fk_delivery_executives_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_delivery_executive_id_afff6b11_fk_delivery_executives_id FOREIGN KEY (delivery_executive_id) REFERENCES public.delivery_executives(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders orders_food_item_id_201fdf1e_fk_food_items_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_food_item_id_201fdf1e_fk_food_items_id FOREIGN KEY (food_item_id) REFERENCES public.food_items(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders orders_mealset_id_75806149_fk_mealsets_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_mealset_id_75806149_fk_mealsets_id FOREIGN KEY (mealset_id) REFERENCES public.mealsets(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurants restaurants_user_id_c0d49ab1_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_user_id_c0d49ab1_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_groups user_groups_group_id_b76f8aba_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_group_id_b76f8aba_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_groups user_groups_user_id_abaea130_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_user_id_abaea130_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_permissions user_user_permission_permission_id_9deb68a3_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permission_permission_id_9deb68a3_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_permissions user_user_permissions_user_id_ed4a47ea_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: breakit
--

ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_user_id_ed4a47ea_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

