--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types (
    type_id integer NOT NULL,
    type varchar NOT NULL,
    CONSTRAINT types_pkey PRIMARY KEY (type_id)
);

--
-- Name: elements; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.elements (
    atomic_number integer NOT NULL,
    symbol varchar NOT NULL UNIQUE,
    name varchar NOT NULL UNIQUE,
    CONSTRAINT elements_pkey PRIMARY KEY (atomic_number)
);

--
-- Name: properties; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.properties (
    atomic_number integer NOT NULL,
    atomic_mass numeric NOT NULL,
    melting_point_celsius numeric NOT NULL,
    boiling_point_celsius numeric NOT NULL,
    type_id integer NOT NULL,
    CONSTRAINT properties_pkey PRIMARY KEY (atomic_number),
    CONSTRAINT properties_atomic_number_fkey FOREIGN KEY (atomic_number) REFERENCES public.elements(atomic_number),
    CONSTRAINT properties_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(type_id)
);

--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.types (type_id, type) VALUES
(1, 'metal'),
(2, 'metalloid'),
(3, 'nonmetal');

--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.elements (atomic_number, symbol, name) VALUES
(1, 'H', 'Hydrogen'),
(2, 'He', 'Helium'),
(3, 'Li', 'Lithium'),
-- etc.

--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES
(1, 1.008, -259.1, -252.9, 3),
(2, 4.0026, -272.2, -268.9, 3),
(3, 6.94, 180.5, 1342, 1),
-- etc.
