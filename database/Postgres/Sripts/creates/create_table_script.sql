
-- SCHEMA: template

--DROP SCHEMA IF EXISTS template ;

CREATE SCHEMA IF NOT EXISTS template
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA template TO postgres WITH GRANT OPTION;

GRANT ALL ON DATABASE book_crossing TO postgres;

-- SEQUENCE: template.tamplate_id_title_id_seq

--DROP SEQUENCE IF EXISTS template.tamplate_id_title_id_seq;

CREATE SEQUENCE IF NOT EXISTS template.tamplate_id_title_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE template.tamplate_id_title_id_seq
    OWNER TO postgres;

-- Table: template.tamplate_id_title

--DROP TABLE IF EXISTS template.tamplate_id_title;

CREATE TABLE IF NOT EXISTS template.tamplate_id_title
(
    id integer NOT NULL DEFAULT nextval('template.tamplate_id_title_id_seq'::regclass),
    title text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tamplate_id_title_pkey PRIMARY KEY (id),
    CONSTRAINT id UNIQUE (id)
        INCLUDE(id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS template.tamplate_id_title
    OWNER to postgres;

-- SCHEMA: main

-- DROP SCHEMA IF EXISTS main ;

CREATE SCHEMA IF NOT EXISTS main
    AUTHORIZATION postgres;

GRANT ALL ON SCHEMA main TO postgres WITH GRANT OPTION;

-- FUNCTION: main.cur_year()

-- DROP FUNCTION IF EXISTS main.cur_year();

CREATE OR REPLACE FUNCTION main.cur_year(
	)
    RETURNS integer
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
SELECT date_part('year', CURRENT_DATE) 
$BODY$;

ALTER FUNCTION main.cur_year()
    OWNER TO postgres;

-- Table: main.age_restrictions

-- DROP TABLE IF EXISTS main.age_restrictions;

CREATE TABLE IF NOT EXISTS main.age_restrictions
(
    -- Inherited from table template.tamplate_id_title: id integer NOT NULL DEFAULT nextval('template.tamplate_id_title_id_seq'::regclass),
    -- Inherited from table template.tamplate_id_title: title text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT age_restrictions_pkey PRIMARY KEY (id)
)
    INHERITS (template.tamplate_id_title)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS main.age_restrictions
    OWNER to postgres;

-- Table: main.binding

-- DROP TABLE IF EXISTS main.binding;

CREATE TABLE IF NOT EXISTS main.binding
(
    -- Inherited from table template.tamplate_id_title: id integer NOT NULL DEFAULT nextval('template.tamplate_id_title_id_seq'::regclass),
    -- Inherited from table template.tamplate_id_title: title text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT binding_pkey PRIMARY KEY (id)
)
    INHERITS (template.tamplate_id_title)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS main.binding
    OWNER to postgres;

-- Table: main.genre

-- DROP TABLE IF EXISTS main.genre;

CREATE TABLE IF NOT EXISTS main.genre
(
    -- Inherited from table template.tamplate_id_title: id integer NOT NULL DEFAULT nextval('template.tamplate_id_title_id_seq'::regclass),
    -- Inherited from table template.tamplate_id_title: title text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genre_pkey PRIMARY KEY (id)
)
    INHERITS (template.tamplate_id_title)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS main.genre
    OWNER to postgres;

-- Table: main.languages

-- DROP TABLE IF EXISTS main.languages;

CREATE TABLE IF NOT EXISTS main.languages
(
    -- Inherited from table template.tamplate_id_title: id integer NOT NULL DEFAULT nextval('template.tamplate_id_title_id_seq'::regclass),
    -- Inherited from table template.tamplate_id_title: title text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT languages_pkey PRIMARY KEY (id)
)
    INHERITS (template.tamplate_id_title)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS main.languages
    OWNER to postgres;


-- Table: main.library

-- DROP TABLE IF EXISTS main.library;

CREATE TABLE IF NOT EXISTS main.library
(
    -- Inherited from table template.tamplate_id_title: id integer NOT NULL DEFAULT nextval('template.tamplate_id_title_id_seq'::regclass),
    -- Inherited from table template.tamplate_id_title: title text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT library_pkey PRIMARY KEY (id)
)
    INHERITS (template.tamplate_id_title)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS main.library
    OWNER to postgres;
	

-- Table: main.book

-- DROP TABLE IF EXISTS main.book;

CREATE TABLE IF NOT EXISTS main.book
(
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    id_library integer NOT NULL DEFAULT 21,
    id_genre integer NOT NULL DEFAULT '-1'::integer,
    id_lang integer NOT NULL DEFAULT '-1'::integer,
    id_binding integer NOT NULL DEFAULT '-1'::integer,
    id_ar integer NOT NULL DEFAULT '-1'::integer,
    title text COLLATE pg_catalog."default" NOT NULL DEFAULT 'Название'::text,
    author text COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    publisher text COLLATE pg_catalog."default",
    book_serias text COLLATE pg_catalog."default",
    year_publish integer,
    delivery_date date DEFAULT CURRENT_DATE,
    CONSTRAINT book_pkey PRIMARY KEY (id),
    CONSTRAINT age_restr FOREIGN KEY (id_ar)
        REFERENCES main.age_restrictions (id) MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT binding FOREIGN KEY (id_binding)
        REFERENCES main.binding (id) MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT genre FOREIGN KEY (id_genre)
        REFERENCES main.genre (id) MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lang FOREIGN KEY (id_lang)
        REFERENCES main.languages (id) MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT lib FOREIGN KEY (id_library)
        REFERENCES main.library (id) MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT check_year_publish CHECK (year_publish >= 1455 AND year_publish <= main.cur_year())
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS main.book
    OWNER to postgres;

REVOKE ALL ON TABLE main.book FROM "user";

GRANT ALL ON TABLE main.book TO postgres;

GRANT DELETE, UPDATE, INSERT, SELECT ON TABLE main.book TO "user";

COMMENT ON COLUMN main.book.id
    IS 'Идентификатор книги';

COMMENT ON COLUMN main.book.id_library
    IS 'Идентификатор библиотеки';

COMMENT ON COLUMN main.book.id_genre
    IS 'Идентификатор жанра';

COMMENT ON COLUMN main.book.id_lang
    IS 'Идентификатор языка';

COMMENT ON COLUMN main.book.id_binding
    IS 'Идентификатор переплёта';

COMMENT ON COLUMN main.book.id_ar
    IS 'Идентификатор возрастного ограничения';

COMMENT ON COLUMN main.book.title
    IS 'Название книги';

COMMENT ON COLUMN main.book.author
    IS 'Автор';

COMMENT ON COLUMN main.book.description
    IS 'Описание';

COMMENT ON COLUMN main.book.publisher
    IS 'Издатель';

COMMENT ON COLUMN main.book.book_serias
    IS 'Серия(цикл) книги';

COMMENT ON COLUMN main.book.year_publish
    IS 'Год выпуска';

COMMENT ON COLUMN main.book.delivery_date
    IS 'Дата добавления';
-- Index: fki_age_restr

-- DROP INDEX IF EXISTS main.fki_age_restr;

CREATE INDEX IF NOT EXISTS fki_age_restr
    ON main.book USING btree
    (id_ar ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_binding

 --DROP INDEX IF EXISTS main.fki_binding;

CREATE INDEX IF NOT EXISTS fki_binding
    ON main.book USING btree
    (id_binding ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_genre

 --DROP INDEX IF EXISTS main.fki_genre;

CREATE INDEX IF NOT EXISTS fki_genre
    ON main.book USING btree
    (id_genre ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_lang

 --DROP INDEX IF EXISTS main.fki_lang;

CREATE INDEX IF NOT EXISTS fki_lang
    ON main.book USING btree
    (id_lang ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_lib

 --DROP INDEX IF EXISTS main.fki_lib;

CREATE INDEX IF NOT EXISTS fki_lib
    ON main.book USING btree
    (id_library ASC NULLS LAST)
    TABLESPACE pg_default;

-- View: main.book_shelf_view

-- DROP VIEW main.book_shelf_view;

CREATE OR REPLACE VIEW main.book_shelf_view
 AS
 SELECT b.id AS uuid,
    lib.title AS "Адрес",
    g.title AS "Жанр",
    lang.title AS "Языки",
    bind.title AS "Переплет",
    ar.title AS "Возрастные_ограничения",
    b.title AS "Название",
    b.author AS "Автор",
    b.description AS "Описание",
    b.publisher AS "Издатель",
    b.book_serias AS "Серия",
    b.year_publish AS "Год_издания",
    b.delivery_date AS "Дата_добавления"
   FROM main.book b
     LEFT JOIN main.library lib ON b.id_library = lib.id
     LEFT JOIN main.genre g ON b.id_genre = g.id
     LEFT JOIN main.languages lang ON b.id_lang = lang.id
     LEFT JOIN main.binding bind ON b.id_binding = bind.id
     LEFT JOIN main.age_restrictions ar ON b.id_ar = ar.id
  ORDER BY b.delivery_date DESC;

ALTER TABLE main.book_shelf_view
    OWNER TO postgres;
