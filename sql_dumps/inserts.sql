--
-- PostgreSQL database dump
--

-- Dumped from database version 13.16 (Ubuntu 13.16-1.pgdg22.04+1)
-- Dumped by pg_dump version 13.16 (Ubuntu 13.16-1.pgdg22.04+1)

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

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: wb_admin
--

INSERT INTO public.orders (order_uid, track_number, entry, locale, internal_signature, customer_id, delivery_service, shardkey, sm_id, date_created, off_shard, id) 
VALUES (
    'b563feb7b2b84b6test', 
    'WBILMTESTTRACK', 
    'WBIL', 
    'en', 
    '', 
    'test', 
    'meest', 
    '9', 
    99, 
    '2021-11-26T06:22:19Z', 
    '1', 
    1
);


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: wb_admin
--

INSERT INTO public.delivery (name, phone, zip, city, address, region, email, id, id_order) 
VALUES (
    'Test Testov', 
    '+9720000000', 
    '2639809', 
    'Kiryat Mozkin', 
    'Ploshad Mira 15', 
    'Kraiot', 
    'test@gmail.com', 
    4, 
    1
);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: wb_admin
--

INSERT INTO public.items (chrt_id, track_number, price, rid, name, sale, size, total_price, nm_id, brand, status, id, id_order) 
VALUES (
    9934930, 
    'WBILMTESTTRACK', 
    453, 
    'ab4219087a764ae0btest', 
    'Mascaras', 
    30, 
    '0', 
    317, 
    2389212, 
    'Vivienne Sabo', 
    202, 
    1, 
    NULL
);


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: wb_admin
--

INSERT INTO public.payment (transaction, request_id, currency, provider, amount, payment_dt, bank, delivery_cost, custom_fee, id, id_order, goods_total) 
VALUES (
    'b563feb7b2b84b6test', 
    '', 
    'USD', 
    'wbpay', 
    1817, 
    1637907727, 
    'alpha', 
    1500, 
    0, 
    1, 
    NULL, 
    317
);

