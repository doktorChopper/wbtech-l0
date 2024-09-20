--
-- PostgreSQL database dump
--

--
-- Name: delivery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.delivery (
    name text NOT NULL,
    phone text NOT NULL,
    zip text NOT NULL,
    city text NOT NULL,
    address text NOT NULL,
    region text NOT NULL,
    email text NOT NULL,
    id integer NOT NULL,
    id_order integer
);

--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.items (
    chrt_id bigint NOT NULL,
    track_number text NOT NULL,
    price integer NOT NULL,
    rid text NOT NULL,
    name text NOT NULL,
    sale integer NOT NULL,
    size text,
    total_price integer NOT NULL,
    nm_id bigint NOT NULL,
    brand text NOT NULL,
    status integer NOT NULL,
    id integer NOT NULL,
    id_order integer
);

--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.orders (
    order_uid text NOT NULL,
    track_number text NOT NULL,
    entry text NOT NULL,
    locale text NOT NULL,
    internal_signature text,
    customer_id text NOT NULL,
    delivery_service text NOT NULL,
    shardkey text NOT NULL,
    sm_id integer NOT NULL,
    date_created text NOT NULL,
    off_shard text NOT NULL,
    id integer NOT NULL
);

--
-- Name: payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.payment (
    transaction text NOT NULL,
    request_id text,
    currency text NOT NULL,
    provider text NOT NULL,
    amount integer NOT NULL,
    payment_dt bigint NOT NULL,
    bank text NOT NULL,
    delivery_cost integer NOT NULL,
    googs_total integer NOT NULL,
    custom_fee integer,
    id integer NOT NULL,
    id_order integer
);

--
-- Name: delivery id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery ALTER COLUMN id SET DEFAULT nextval('public.delivery_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- Name: bin_ord bin_ord_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bin_ord
    ADD CONSTRAINT bin_ord_pkey PRIMARY KEY (id);


--
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: delivery delivery_id_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- Name: items items_id_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- Name: payment payment_id_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- PostgreSQL database dump complete
--

