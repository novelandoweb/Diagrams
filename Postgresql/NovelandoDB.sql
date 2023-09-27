--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.3

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
-- Name: autor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.autor (
    id bigint NOT NULL,
    nome character varying(255),
    usuario_id bigint
);


--
-- Name: autor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.autor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.autor_id_seq OWNED BY public.autor.id;


--
-- Name: avaliacao_obra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.avaliacao_obra (
    aceite boolean NOT NULL,
    analise_obra character varying(255),
    data_avaliacao date,
    avaliador_id bigint NOT NULL,
    obra_id bigint NOT NULL
);


--
-- Name: avaliador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.avaliador (
    id bigint NOT NULL,
    cpf character varying(11),
    nome character varying(255),
    usuario_id bigint
);


--
-- Name: avaliador_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.avaliador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: avaliador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.avaliador_id_seq OWNED BY public.avaliador.id;


--
-- Name: capitulo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capitulo (
    id bigint NOT NULL,
    corpo_html character varying(255),
    ordem integer NOT NULL,
    data_publicacao date,
    ultimo_alteracao timestamp(6) without time zone,
    temporada_id bigint
);


--
-- Name: capitulo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.capitulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: capitulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.capitulo_id_seq OWNED BY public.capitulo.id;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categoria (
    id bigint NOT NULL,
    nome character varying(255)
);


--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- Name: categoria_obra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categoria_obra (
    obra_id bigint NOT NULL,
    categoria_id bigint NOT NULL
);


--
-- Name: obra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.obra (
    id bigint NOT NULL,
    data_criacao date,
    nome character varying(255),
    periodicidade character varying(255),
    sinopse character varying(255),
    situacao character varying(255),
    autor_id bigint,
    CONSTRAINT obra_periodicidade_check CHECK (((periodicidade)::text = ANY ((ARRAY['SEMANAL'::character varying, 'QUINZENAL'::character varying, 'MENSAL'::character varying])::text[]))),
    CONSTRAINT obra_situacao_check CHECK (((situacao)::text = ANY ((ARRAY['CRIADA'::character varying, 'APROVADA'::character varying, 'REPROVADA'::character varying, 'PUBLICADA'::character varying, 'EM_HIATO'::character varying, 'FINALIZDA'::character varying])::text[])))
);


--
-- Name: obra_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.obra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: obra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.obra_id_seq OWNED BY public.obra.id;


--
-- Name: temporada; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.temporada (
    id bigint NOT NULL,
    descricao character varying(255),
    ordem integer NOT NULL,
    obra_id bigint
);


--
-- Name: temporada_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.temporada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: temporada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.temporada_id_seq OWNED BY public.temporada.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    email character varying(255),
    ip_acesso character varying(255),
    moderador boolean NOT NULL,
    nickname character varying(255),
    status character varying(255),
    ultimo_acesso timestamp(6) without time zone,
    CONSTRAINT usuario_status_check CHECK (((status)::text = ANY ((ARRAY['ATIVO'::character varying, 'INATIVO'::character varying])::text[])))
);


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: autor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autor ALTER COLUMN id SET DEFAULT nextval('public.autor_id_seq'::regclass);


--
-- Name: avaliador id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.avaliador ALTER COLUMN id SET DEFAULT nextval('public.avaliador_id_seq'::regclass);


--
-- Name: capitulo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capitulo ALTER COLUMN id SET DEFAULT nextval('public.capitulo_id_seq'::regclass);


--
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- Name: obra id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.obra ALTER COLUMN id SET DEFAULT nextval('public.obra_id_seq'::regclass);


--
-- Name: temporada id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.temporada ALTER COLUMN id SET DEFAULT nextval('public.temporada_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id);


--
-- Name: avaliacao_obra avaliacao_obra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.avaliacao_obra
    ADD CONSTRAINT avaliacao_obra_pkey PRIMARY KEY (avaliador_id, obra_id);


--
-- Name: avaliador avaliador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.avaliador
    ADD CONSTRAINT avaliador_pkey PRIMARY KEY (id);


--
-- Name: capitulo capitulo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capitulo
    ADD CONSTRAINT capitulo_pkey PRIMARY KEY (id);


--
-- Name: categoria_obra categoria_obra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria_obra
    ADD CONSTRAINT categoria_obra_pkey PRIMARY KEY (obra_id, categoria_id);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: obra obra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.obra
    ADD CONSTRAINT obra_pkey PRIMARY KEY (id);


--
-- Name: temporada temporada_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.temporada
    ADD CONSTRAINT temporada_pkey PRIMARY KEY (id);


--
-- Name: avaliador uk_1pxuhgkt54ayubcrkll3mp147; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.avaliador
    ADD CONSTRAINT uk_1pxuhgkt54ayubcrkll3mp147 UNIQUE (cpf);


--
-- Name: usuario uk_5171l57faosmj8myawaucatdw; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email);


--
-- Name: avaliador uk_8cgtpxo8pwkfwxmp1l7wscckm; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.avaliador
    ADD CONSTRAINT uk_8cgtpxo8pwkfwxmp1l7wscckm UNIQUE (usuario_id);


--
-- Name: autor uk_fqpj7na90qdh3dtterh9ud9a4; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT uk_fqpj7na90qdh3dtterh9ud9a4 UNIQUE (usuario_id);


--
-- Name: usuario uk_lbkxel95iw6vtu2w6huyrpu26; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_lbkxel95iw6vtu2w6huyrpu26 UNIQUE (nickname);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: avaliacao_obra fk8vgqnm99iekjxryqxih8afj4v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.avaliacao_obra
    ADD CONSTRAINT fk8vgqnm99iekjxryqxih8afj4v FOREIGN KEY (obra_id) REFERENCES public.obra(id);


--
-- Name: capitulo fk9y7ek236s7xa4yh9qt77cf85n; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capitulo
    ADD CONSTRAINT fk9y7ek236s7xa4yh9qt77cf85n FOREIGN KEY (temporada_id) REFERENCES public.temporada(id);


--
-- Name: avaliador fkasfaru8ycg3wwfnthqb9gsvhk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.avaliador
    ADD CONSTRAINT fkasfaru8ycg3wwfnthqb9gsvhk FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: obra fkbmy8y9rd9u7fmmv2fuy0o5oyq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.obra
    ADD CONSTRAINT fkbmy8y9rd9u7fmmv2fuy0o5oyq FOREIGN KEY (autor_id) REFERENCES public.autor(id);


--
-- Name: categoria_obra fkf15pt8n3d01xb3l3b967g9t18; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria_obra
    ADD CONSTRAINT fkf15pt8n3d01xb3l3b967g9t18 FOREIGN KEY (obra_id) REFERENCES public.obra(id);


--
-- Name: avaliacao_obra fkiqbqnbi4ffqpk68pb65tjy782; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.avaliacao_obra
    ADD CONSTRAINT fkiqbqnbi4ffqpk68pb65tjy782 FOREIGN KEY (avaliador_id) REFERENCES public.avaliador(id);


--
-- Name: autor fkk31pucsuoj01nf5ccptqcaess; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT fkk31pucsuoj01nf5ccptqcaess FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: categoria_obra fkotjjs7if6sqxxq7u4cpng2ure; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria_obra
    ADD CONSTRAINT fkotjjs7if6sqxxq7u4cpng2ure FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);


--
-- Name: temporada fkphl6ij54fimfl80v46ech9xqc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.temporada
    ADD CONSTRAINT fkphl6ij54fimfl80v46ech9xqc FOREIGN KEY (obra_id) REFERENCES public.obra(id);


--
-- PostgreSQL database dump complete
--

