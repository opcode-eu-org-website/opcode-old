--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.volume DROP CONSTRAINT volume_book_id_fkey;
ALTER TABLE ONLY public.page DROP CONSTRAINT page_volume_id_fkey;
ALTER TABLE ONLY public.fulltext DROP CONSTRAINT fulltext_page_id_fkey;
ALTER TABLE ONLY public.content DROP CONSTRAINT content_volume_id_fkey;
DROP INDEX public.slownikgeo_entry_s;
DROP INDEX public.fulltext_page_id_index;
ALTER TABLE ONLY public.volume DROP CONSTRAINT volume_pkey;
ALTER TABLE ONLY public.volume DROP CONSTRAINT unique_volume_url_in_book;
ALTER TABLE ONLY public.book DROP CONSTRAINT unique_url;
ALTER TABLE ONLY public.page DROP CONSTRAINT unique_title_in_volume;
ALTER TABLE ONLY public.page DROP CONSTRAINT unique_page_no_in_volume;
ALTER TABLE ONLY public.slownikgeo_entry DROP CONSTRAINT slownikgeo_entry_pkey;
ALTER TABLE ONLY public.page DROP CONSTRAINT page_pkey;
ALTER TABLE ONLY public.fulltext DROP CONSTRAINT fulltext_pkey;
ALTER TABLE ONLY public.content DROP CONSTRAINT content_pkey;
ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
DROP TABLE public.volume;
DROP SEQUENCE public.volume_id_seq;
DROP TABLE public.slownikgeo_entry;
DROP SEQUENCE public.slownikgeo_entry_id_seq;
DROP TABLE public.page;
DROP SEQUENCE public.page_id_seq;
DROP TABLE public.fulltext;
DROP SEQUENCE public.fulltext_id_seq;
DROP TABLE public.content;
DROP SEQUENCE public.content_id_seq;
DROP TABLE public.book;
DROP SEQUENCE public.book_id_seq;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: diropadm
--

CREATE SEQUENCE book_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.book_id_seq OWNER TO diropadm;

--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diropadm
--

SELECT pg_catalog.setval('book_id_seq', 66, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: book; Type: TABLE; Schema: public; Owner: diropadm; Tablespace: 
--

CREATE TABLE book (
    book_id integer DEFAULT nextval('book_id_seq'::regclass) NOT NULL,
    title character varying(255),
    url character varying(100),
    single_vid integer,
    extra text
);


ALTER TABLE public.book OWNER TO diropadm;

--
-- Name: COLUMN book.book_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN book.book_id IS 'unikalny numeryczny identyfikator serii';


--
-- Name: COLUMN book.title; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN book.title IS 'pelny TYTUL serii w utf8 (gdy jedno woluminowa == tytul voluminu)';


--
-- Name: COLUMN book.url; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN book.url IS 'URL serii (gdy jedno woluminowa == url voluminu)';


--
-- Name: COLUMN book.single_vid; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN book.single_vid IS 'wskazuje volume_id gdy JEDNO WOLUMINOWA, jezeli nieznany to -1, jezeli wielo woluminowa to -2 (domyslnie szukaj tylko w bierzacym woluminie) lub -3 (domyslnie szukaj w calej serii)';


--
-- Name: COLUMN book.extra; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN book.extra IS 'dodatkowe informacje, np. o wyszukiwaniu specjalnym';


--
-- Name: content_id_seq; Type: SEQUENCE; Schema: public; Owner: diropadm
--

CREATE SEQUENCE content_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.content_id_seq OWNER TO diropadm;

--
-- Name: content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diropadm
--

SELECT pg_catalog.setval('content_id_seq', 3180, true);


--
-- Name: content; Type: TABLE; Schema: public; Owner: diropadm; Tablespace: 
--

CREATE TABLE content (
    content_id integer DEFAULT nextval('content_id_seq'::regclass) NOT NULL,
    title text NOT NULL,
    parent_id integer,
    volume_id integer,
    page_title character varying(50),
    page_no integer
);


ALTER TABLE public.content OWNER TO diropadm;

--
-- Name: COLUMN content.content_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN content.content_id IS 'unikalny identyfikator pozycji spisu tresci';


--
-- Name: COLUMN content.title; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN content.title IS 'tekst pozycji spisu tresci';


--
-- Name: COLUMN content.parent_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN content.parent_id IS 'identyfikator (content_id) rodzica';


--
-- Name: COLUMN content.volume_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN content.volume_id IS 'identyfikator woluminu do ktorego nalezy pozycja spisu tresci';


--
-- Name: COLUMN content.page_title; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN content.page_title IS 'tytyl (url) strony na ktora wskazuje pozycja spisu tresci';


--
-- Name: COLUMN content.page_no; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN content.page_no IS 'numer strony (jest to powielanie informacji z page_title, ale w formie wygodniejszej do odnajdywania bierzacej strony - aktualizowac po zmianach w tabeli page dla volume_id=$VOL za pomoca: UPDATE content AS c SET page_no=NULL WHERE c.volume_id=$VOL; UPDATE content AS c SET page_no=(SELECT page_no FROM page AS p WHERE p.volume_id=c.volume_id AND p.title=c.page_title) WHERE c.volume_id=$VOL; UPDATE content AS c SET page_no=(SELECT page_no FROM content AS c2 WHERE c2.content_id>c.content_id AND c2.page_no IS NOT NULL AND c2.volume_id=c.volume_id ORDER BY c2.content_id LIMIT 1) WHERE page_no IS NULL AND c.volume_id=$VOL;';


--
-- Name: fulltext_id_seq; Type: SEQUENCE; Schema: public; Owner: diropadm
--

CREATE SEQUENCE fulltext_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.fulltext_id_seq OWNER TO diropadm;

--
-- Name: fulltext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diropadm
--

SELECT pg_catalog.setval('fulltext_id_seq', 189233, true);


--
-- Name: fulltext; Type: TABLE; Schema: public; Owner: diropadm; Tablespace: 
--

CREATE TABLE fulltext (
    fulltext_id integer DEFAULT nextval('fulltext_id_seq'::regclass) NOT NULL,
    page_id integer NOT NULL,
    fulltext_s text,
    fulltext text,
    "type" integer
);


ALTER TABLE public.fulltext OWNER TO diropadm;

--
-- Name: COLUMN fulltext.fulltext_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN fulltext.fulltext_id IS 'unikalny identyfikator wpisu pelnotekstowego';


--
-- Name: COLUMN fulltext.page_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN fulltext.page_id IS 'unikalny identyfikator strony do ktorej nalezy wpis pelnotekstowy';


--
-- Name: COLUMN fulltext.fulltext_s; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN fulltext.fulltext_s IS 'teskst do wyszukiwan';


--
-- Name: COLUMN fulltext.fulltext; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN fulltext.fulltext IS 'teskst do prezentacji';


--
-- Name: COLUMN fulltext."type"; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN fulltext."type" IS 'typ wyszukiwania ktorego dotyczy wpis: NULL => pelnotekstowe, 1 => indeksowe';


--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: diropadm
--

CREATE SEQUENCE page_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.page_id_seq OWNER TO diropadm;

--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diropadm
--

SELECT pg_catalog.setval('page_id_seq', 66532, true);


--
-- Name: page; Type: TABLE; Schema: public; Owner: diropadm; Tablespace: 
--

CREATE TABLE page (
    page_id integer DEFAULT nextval('page_id_seq'::regclass) NOT NULL,
    volume_id integer NOT NULL,
    page_no integer,
    title character varying(50)
);


ALTER TABLE public.page OWNER TO diropadm;

--
-- Name: COLUMN page.page_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN page.page_id IS 'unikalny identyfikator strony';


--
-- Name: COLUMN page.volume_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN page.volume_id IS 'unikalny identyfikator woluminu do ktorej nalezy strona';


--
-- Name: COLUMN page.page_no; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN page.page_no IS 'kolejny NUMER strony w ramach voluminu == prefix nazwy pliku z skanem (zaczynamy od zera, zwiekszany automatycznie przy wstawianiu, musi by cigy)';


--
-- Name: COLUMN page.title; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN page.title IS 'TYTUL strony (uzywany w URL) / ladny numer (w postaci napisowej, uwzgledniajacy numeracje rzymska itp)';


--
-- Name: slownikgeo_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: diropadm
--

CREATE SEQUENCE slownikgeo_entry_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.slownikgeo_entry_id_seq OWNER TO diropadm;

--
-- Name: slownikgeo_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diropadm
--

SELECT pg_catalog.setval('slownikgeo_entry_id_seq', 132741, true);


--
-- Name: slownikgeo_entry; Type: TABLE; Schema: public; Owner: diropadm; Tablespace: 
--

CREATE TABLE slownikgeo_entry (
    entry_id integer DEFAULT nextval('slownikgeo_entry_id_seq'::regclass) NOT NULL,
    page_id integer NOT NULL,
    entry_s text,
    entry text,
    meta text
);


ALTER TABLE public.slownikgeo_entry OWNER TO diropadm;

--
-- Name: volume_id_seq; Type: SEQUENCE; Schema: public; Owner: diropadm
--

CREATE SEQUENCE volume_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.volume_id_seq OWNER TO diropadm;

--
-- Name: volume_id_seq; Type: SEQUENCE SET; Schema: public; Owner: diropadm
--

SELECT pg_catalog.setval('volume_id_seq', 157, true);


--
-- Name: volume; Type: TABLE; Schema: public; Owner: diropadm; Tablespace: 
--

CREATE TABLE volume (
    volume_id integer DEFAULT nextval('volume_id_seq'::regclass) NOT NULL,
    book_id integer NOT NULL,
    title character varying(255) NOT NULL,
    url character varying(100),
    dc_title text,
    dc_creator text,
    dc_subject_and_keywords text,
    dc_description text,
    dc_publisher text,
    dc_date text,
    info_category text,
    info_status integer,
    dc_contributor text
);


ALTER TABLE public.volume OWNER TO diropadm;

--
-- Name: COLUMN volume.volume_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.volume_id IS 'unikalny identyfikator volumenu';


--
-- Name: COLUMN volume.book_id; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.book_id IS 'unikalny identyfikator ksiazki do ktorej nalezy volumin';


--
-- Name: COLUMN volume.title; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.title IS 'pelny TYTUL pozycji w utf8';


--
-- Name: COLUMN volume.url; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.url IS 'URL pozycji';


--
-- Name: COLUMN volume.dc_title; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.dc_title IS 'Dublin Core - tytul (pelen tytul pozycji)';


--
-- Name: COLUMN volume.dc_creator; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.dc_creator IS 'Dublin Core - tworca';


--
-- Name: COLUMN volume.dc_subject_and_keywords; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.dc_subject_and_keywords IS 'Dublin Core - temat i slowa kluczowe';


--
-- Name: COLUMN volume.dc_description; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.dc_description IS 'Dublin Core - opis (pelen opis pozycji)';


--
-- Name: COLUMN volume.dc_publisher; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.dc_publisher IS 'Dublin Core - wydawaca';


--
-- Name: COLUMN volume.dc_date; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.dc_date IS 'Dublin Core - data wydania';


--
-- Name: COLUMN volume.info_category; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.info_category IS 'lista (rozdzielana srednikami) KATEGORII do ktorych zalicza sie pozycja';


--
-- Name: COLUMN volume.info_status; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.info_status IS 'status pozycji: -2==oczekujaca na dodanie, -1==ukryta, 0==normalna, 1==nowowsc, ... dalsze w przyszlosci';


--
-- Name: COLUMN volume.dc_contributor; Type: COMMENT; Schema: public; Owner: diropadm
--

COMMENT ON COLUMN volume.dc_contributor IS 'Dublin Core - wspoltworca (w znaczeniu redaktor opracowania)';


--
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- Name: content_pkey; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_pkey PRIMARY KEY (content_id);


--
-- Name: fulltext_pkey; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY fulltext
    ADD CONSTRAINT fulltext_pkey PRIMARY KEY (fulltext_id);


--
-- Name: page_pkey; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_pkey PRIMARY KEY (page_id);


--
-- Name: slownikgeo_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY slownikgeo_entry
    ADD CONSTRAINT slownikgeo_entry_pkey PRIMARY KEY (entry_id);


--
-- Name: unique_page_no_in_volume; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT unique_page_no_in_volume UNIQUE (volume_id, page_no);


--
-- Name: unique_title_in_volume; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT unique_title_in_volume UNIQUE (volume_id, title);


--
-- Name: unique_url; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY book
    ADD CONSTRAINT unique_url UNIQUE (url);


--
-- Name: unique_volume_url_in_book; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY volume
    ADD CONSTRAINT unique_volume_url_in_book UNIQUE (book_id, url);


--
-- Name: volume_pkey; Type: CONSTRAINT; Schema: public; Owner: diropadm; Tablespace: 
--

ALTER TABLE ONLY volume
    ADD CONSTRAINT volume_pkey PRIMARY KEY (volume_id);


--
-- Name: fulltext_page_id_index; Type: INDEX; Schema: public; Owner: diropadm; Tablespace: 
--

CREATE INDEX fulltext_page_id_index ON fulltext USING btree (page_id);


--
-- Name: slownikgeo_entry_s; Type: INDEX; Schema: public; Owner: diropadm; Tablespace: 
--

CREATE INDEX slownikgeo_entry_s ON slownikgeo_entry USING btree (entry_s);


--
-- Name: content_volume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diropadm
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_volume_id_fkey FOREIGN KEY (volume_id) REFERENCES volume(volume_id) ON DELETE CASCADE;


--
-- Name: fulltext_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diropadm
--

ALTER TABLE ONLY fulltext
    ADD CONSTRAINT fulltext_page_id_fkey FOREIGN KEY (page_id) REFERENCES page(page_id) ON DELETE CASCADE;


--
-- Name: page_volume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diropadm
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_volume_id_fkey FOREIGN KEY (volume_id) REFERENCES volume(volume_id) ON DELETE CASCADE;


--
-- Name: volume_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: diropadm
--

ALTER TABLE ONLY volume
    ADD CONSTRAINT volume_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: book_id_seq; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON SEQUENCE book_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE book_id_seq FROM diropadm;
GRANT SELECT,UPDATE ON SEQUENCE book_id_seq TO diropadm;
GRANT SELECT ON SEQUENCE book_id_seq TO diropusr;


--
-- Name: book; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON TABLE book FROM PUBLIC;
REVOKE ALL ON TABLE book FROM diropadm;
GRANT ALL ON TABLE book TO diropadm;
GRANT SELECT ON TABLE book TO diropusr;


--
-- Name: content_id_seq; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON SEQUENCE content_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE content_id_seq FROM diropadm;
GRANT SELECT,UPDATE ON SEQUENCE content_id_seq TO diropadm;
GRANT SELECT ON SEQUENCE content_id_seq TO diropusr;


--
-- Name: content; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON TABLE content FROM PUBLIC;
REVOKE ALL ON TABLE content FROM diropadm;
GRANT ALL ON TABLE content TO diropadm;
GRANT SELECT ON TABLE content TO diropusr;


--
-- Name: fulltext_id_seq; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON SEQUENCE fulltext_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE fulltext_id_seq FROM diropadm;
GRANT SELECT,UPDATE ON SEQUENCE fulltext_id_seq TO diropadm;
GRANT SELECT ON SEQUENCE fulltext_id_seq TO diropusr;


--
-- Name: fulltext; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON TABLE fulltext FROM PUBLIC;
REVOKE ALL ON TABLE fulltext FROM diropadm;
GRANT ALL ON TABLE fulltext TO diropadm;
GRANT SELECT ON TABLE fulltext TO diropusr;


--
-- Name: page_id_seq; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON SEQUENCE page_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE page_id_seq FROM diropadm;
GRANT SELECT,UPDATE ON SEQUENCE page_id_seq TO diropadm;
GRANT SELECT ON SEQUENCE page_id_seq TO diropusr;


--
-- Name: page; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON TABLE page FROM PUBLIC;
REVOKE ALL ON TABLE page FROM diropadm;
GRANT ALL ON TABLE page TO diropadm;
GRANT SELECT ON TABLE page TO diropusr;


--
-- Name: slownikgeo_entry_id_seq; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON SEQUENCE slownikgeo_entry_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE slownikgeo_entry_id_seq FROM diropadm;
GRANT SELECT,UPDATE ON SEQUENCE slownikgeo_entry_id_seq TO diropadm;
GRANT SELECT ON SEQUENCE slownikgeo_entry_id_seq TO diropusr;


--
-- Name: slownikgeo_entry; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON TABLE slownikgeo_entry FROM PUBLIC;
REVOKE ALL ON TABLE slownikgeo_entry FROM diropadm;
GRANT ALL ON TABLE slownikgeo_entry TO diropadm;
GRANT SELECT ON TABLE slownikgeo_entry TO diropusr;


--
-- Name: volume_id_seq; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON SEQUENCE volume_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE volume_id_seq FROM diropadm;
GRANT SELECT,UPDATE ON SEQUENCE volume_id_seq TO diropadm;
GRANT SELECT ON SEQUENCE volume_id_seq TO diropusr;


--
-- Name: volume; Type: ACL; Schema: public; Owner: diropadm
--

REVOKE ALL ON TABLE volume FROM PUBLIC;
REVOKE ALL ON TABLE volume FROM diropadm;
GRANT ALL ON TABLE volume TO diropadm;
GRANT SELECT ON TABLE volume TO diropusr;


--
-- PostgreSQL database dump complete
--
