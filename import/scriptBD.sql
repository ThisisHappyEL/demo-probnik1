--
-- PostgreSQL database dump
--

\restrict OGhsuY77DLey1MkQz5YkBLQ7xXSDc0ZlLrGYOIY3NUOvlhBL8U1o3TdJt3cgGKU

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-06-11 20:43:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 25949)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id integer CONSTRAINT provider_id_not_null NOT NULL,
    name character varying(255)
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25970)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id integer NOT NULL,
    article character varying(255),
    name character varying(255),
    unit_id integer,
    price integer,
    producer_id integer,
    category_id integer,
    current_discount integer,
    quantity_in_stock integer,
    description text,
    photo character varying(255)
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25993)
-- Name: books_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books_authors (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.books_authors OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25969)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.books ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 26039)
-- Name: books_in_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books_in_orders (
    id integer NOT NULL,
    order_id integer,
    book_id integer,
    quantity integer
);


ALTER TABLE public.books_in_orders OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 26038)
-- Name: books_in_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.books_in_orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.books_in_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 25963)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name name
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25962)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 26009)
-- Name: order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.order_status OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 26008)
-- Name: order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_status ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 26016)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_date date,
    delivery_date date,
    pickup_point_id integer,
    user_id integer,
    code_for_receive integer,
    order_status_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 26015)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 25898)
-- Name: pickup_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_points (
    id integer NOT NULL,
    index integer,
    city character varying(255),
    street character varying(255),
    building integer
);


ALTER TABLE public.pickup_points OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25897)
-- Name: pickup_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pickup_points ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pickup_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 25956)
-- Name: producers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producers (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.producers OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25955)
-- Name: producers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.producers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.producers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 25948)
-- Name: provider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.authors ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 25907)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25906)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 25942)
-- Name: unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.unit OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25941)
-- Name: unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.unit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 25928)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    role_id integer,
    last_name character varying(255),
    first_name character varying(255),
    father_name character varying(255),
    mail character varying(255),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25927)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4998 (class 0 OID 25949)
-- Dependencies: 228
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (1, 'Виктор Астафьев');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (2, 'Гилберт Кит Честертон');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (3, 'Кирилл Каланджи');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (4, 'Людмила Улицкая');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (5, 'Аркадий Гайдар');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (6, 'Юрий Родичев');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (7, 'Дэниел Джей Барретт');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (8, 'Шон Кэрролл');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (9, 'Яков Гордин');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (10, 'Иосиф Бродский');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (11, 'Янь Чуннянь Янь Чуннянь');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (12, 'Дмитрий Мережковский');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (13, 'Дмитрий Щербаков');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (14, 'Роджер Осборн');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (15, 'Любовь Беликова');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (16, 'Сергей Моргачев');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (17, 'Екатерина Габарта');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (18, 'Татьяна Лопаткина');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (19, 'Дэн Стерджис');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (20, 'Инна Ерофеева');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (21, 'Татьяна Шутова');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (22, 'Ирина Игнатьева');
INSERT INTO public.authors OVERRIDING SYSTEM VALUE VALUES (23, 'Софья Маннапова');


--
-- TOC entry 5004 (class 0 OID 25970)
-- Dependencies: 234
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (1, 'А112Т4', 'Прокляты и убиты', 1, 585, 1, 1, 25, 6, 'Роман-эпопею Прокляты и убиты Виктора Астафьева по праву считают одним из самых сильных и пронзительных произведений отечественной военной прозы.', '1.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (2, 'G843H5', 'Тайны и загадки отца БраунаТайны и загадки отца Брауна', 1, 193, 1, 1, 30, 9, 'Гилберт Кит Честертон — признанный классик английской литературы, один из самых ярких писателей первой половины XX века. Классикой стали его романы и многочисленные эссе, однако любовь массового читателя принесли ему рассказы об отце Брауне, тихом, застенчивом священнике, мастерски раскрывающем наиболее запутанные загадки и преступления. ', '2.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (3, 'D325D4', 'Девайс', 1, 1599, 2, 1, 5, 12, 'Молодой фрилансер Захар Скаро устраивается на очередную подработку. Задача, казалось бы, тривиальная: тестирование нового устройства. Вот только вопрос в том, тестированием какой реальности занимается этот новый Девайс?', '3.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (4, 'S432T5', 'Необыкновенное обыкновенное чудо. Школьные истории', 1, 549, 2, 1, 15, 15, NULL, '4.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (5, 'F325D4', 'Чук и Гек', 1, 209, 2, 1, 18, 3, 'В книгу вошли повести и рассказы Аркадия Петровича Гайдара: Чук и Гек, Горячий камень и Сказка о военной тайне, о Мальчише-Кибальчише и его твердом слове', '5.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (6, 'G432G6', 'Информационная безопасность. Национальные стандарты Российской Федерации. 3-е издание. Учебное пособие', 1, 3899, 3, 2, 22, 3, 'В учебном пособии рассмотрено более 300 действующих открытых документов национальной системы стандартизации Российской Федерации, включая международные и межгосударственные стандарты в области информационной безопасности по состоянию на начало 2023 года.', '6.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (7, 'H542F5', 'Linux. Командная строка. Лучшие практики', 1, 1799, 3, 2, 4, 5, 'Перейдите на новый уровень работы в Linux! Если вы системный администратор, разработчик программного обеспечения, SRE-инженер или пользователь Linux, книга поможет вам работать быстрее, элегантнее и эффективнее. ', '7.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (8, 'C346F5', 'Квантовые миры и возникновение пространства-времени', 1, 1349, 3, 2, 5, 4, 'Шон Кэрролл — физик-теоретик и один из самых известных в мире популяризаторов науки — заставляет нас по-новому взглянуть на физику. Столкновение с главной загадкой квантовой механики полностью поменяет наши представления о пространстве и времени.', '8.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (9, 'F256G6', 'Вселенная. Происхождение жизни, смысл нашего существования и огромный космос', 1, 1799, 3, 2, 6, 2, 'Знаменитый физик Шон Кэрролл в свойственной ему увлекательной манере объясняет принципы, которые лежат в основах научных революций от Дарвина до Эйнштейна, и показывает как невероятные научные открытия последнего столетия изменили наш мир.', NULL);
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (10, 'J532V5', 'Пушкин. Бродский. Империя и судьба. В 2-х томах (комплект из 2-х книг)', 1, 529, 4, 3, 8, 6, 'Первая книга двухтомника «Пушкин. Бродский. Империя и судьба» пронизана пушкинской темой. Пушкин — «певец империи и свободы» — присутствует даже там, где он впрямую не упоминается, ибо его судьба, как и судьба других героев книги, органично связана с трагедией великой империи.', '10.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (11, 'G643F4', 'Иосиф Бродский. Избранные эссе (комплект из 6-ти книг)', 1, 4925, 5, 3, 2, 24, 'Шесть сборников избранных эссе Иосифа Бродского (1940-1996), великого поэта, драматурга, мыслителя, лауреата Нобелевской премии по литературе (1987): «Будущее или далекое прошлое», «Верь своей боли», «Как читать книгу», «О русской литературе», «О тирании», «Путеводитель по переименованному городу». Все тексты представлены на английском языке и в переводе на русский и открывают автора не только как поэта, но как историка, критика, и глубокого и ироничного мыслителя.', '11.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (12, 'J326V5', 'Тысячелетие императорской керамикиv', 1, 2599, 5, 3, 5, 4, 'Фарфор стал величайшим символом китайской культуры. Это одно из выдающихся изобретений, внесших неоценимый вклад в мировую цивилизацию. ', '12.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (13, 'J632F6', 'Вечные спутники: Портреты из всемирной литературы', 1, 1599, 5, 3, 0, 6, 'Книга Вечные спутники - это цикл критических очерков о культуре и великих литераторах, сопровождавших жизнь и творчество русского писателя, поэта, литературного критика и общественного деятеля Дмитрия Мережковского (1865–1941). ', '13.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (14, 'G632H6', 'Формирование литературной репутации Н.Г.Чернышевского в ХIX-XXI веках', 1, 1349, 6, 3, 2, 8, 'Монография Д. А. Щербакова - новаторская. Поэтапно рассмотрены не только многочисленные суждения известных отечественных и зарубежных критиков, литературоведов, философов и политиков, различным образом характеризовавших Н. Г. Чернышевского в связи и вне связи со знаменитым романом Что делать? ', '14.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (15, 'M642E5', 'Теория искусства. Краткий путеводитель', 1, 879, 6, 3, 3, 2, NULL, '15.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (16, 'G543F5', 'Религиозные верования с древнейших времен до наших дней', 1, 879, 7, 3, 4, 6, 'Настоящее издание представляет собой сборник переводов лекций по истории дохристианских и нехристианских религий, прочитанных в Лондоне в период с 1888 по 1891 гг. авторитетными исследователями данного раздела религиоведения. ', '16.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (17, 'B653G6', 'Русский язык: Первые шаги. Часть 3. Учебное пособие', 1, 2699, 8, 4, 8, 9, 'Пособие является завершающей частью учебного комплекса. Третья часть содержит 10 уроков (21-30, последний-повторительный). Усвоение лексико-грамматического материала рассчитано примерно на 200-240 часов аудиторных занятий. ', '17.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (18, 'J735J7', 'Синтетический образ индивидуального психического мира', 1, 1099, 8, 3, 9, 4, 'Психика подобна определенным объектам, это фиксируют сами люди в языке и искусстве. В данном исследовании рассматриваются в этом плане образы сосуда, воронки, дерева и крепости.', '18.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (19, 'H436H7', 'Английский язык в спорте: Учебное пособие', 1, 1999, 9, 4, 2, 0, 'Учебное пособие подготовлено для слушателей, изу чающих английский язык как язык специальности', '19.jpg');
INSERT INTO public.books OVERRIDING SYSTEM VALUE VALUES (20, 'H475R5', 'Лексика и грамматика современного китайского языка (к тому II учебника «Новый практический курс китайского языка» под редакцией Лю Сюня): учебное пособие', 1, 608, 10, 4, 25, 12, 'Пособие выступает дополнением ко второму тому учебника «Новый практический курс китайского языка» (под редакцией Лю Сюня). ', '20.jpg');


--
-- TOC entry 5005 (class 0 OID 25993)
-- Dependencies: 235
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.books_authors VALUES (1, 1);
INSERT INTO public.books_authors VALUES (2, 2);
INSERT INTO public.books_authors VALUES (3, 3);
INSERT INTO public.books_authors VALUES (4, 4);
INSERT INTO public.books_authors VALUES (5, 5);
INSERT INTO public.books_authors VALUES (6, 6);
INSERT INTO public.books_authors VALUES (7, 7);
INSERT INTO public.books_authors VALUES (8, 8);
INSERT INTO public.books_authors VALUES (9, 8);
INSERT INTO public.books_authors VALUES (10, 9);
INSERT INTO public.books_authors VALUES (11, 10);
INSERT INTO public.books_authors VALUES (12, 11);
INSERT INTO public.books_authors VALUES (13, 12);
INSERT INTO public.books_authors VALUES (14, 13);
INSERT INTO public.books_authors VALUES (15, 14);
INSERT INTO public.books_authors VALUES (15, 19);
INSERT INTO public.books_authors VALUES (16, 13);
INSERT INTO public.books_authors VALUES (17, 15);
INSERT INTO public.books_authors VALUES (17, 20);
INSERT INTO public.books_authors VALUES (17, 21);
INSERT INTO public.books_authors VALUES (18, 16);
INSERT INTO public.books_authors VALUES (19, 17);
INSERT INTO public.books_authors VALUES (19, 22);
INSERT INTO public.books_authors VALUES (20, 18);
INSERT INTO public.books_authors VALUES (20, 23);


--
-- TOC entry 5011 (class 0 OID 26039)
-- Dependencies: 241
-- Data for Name: books_in_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 2);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (2, 2, 2, 1);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (3, 3, 3, 10);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (4, 4, 5, 5);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (5, 5, 6, 20);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (6, 6, 1, 2);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (7, 7, 8, 3);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (8, 8, 5, 1);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (9, 9, 10, 5);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (10, 10, 9, 5);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (11, 1, 2, 2);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (12, 2, 1, 1);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (13, 3, 4, 10);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (14, 4, 3, 4);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (15, 5, 7, 20);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (16, 6, 2, 2);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (17, 7, 9, 3);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (18, 8, 6, 1);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (19, 9, 9, 1);
INSERT INTO public.books_in_orders OVERRIDING SYSTEM VALUE VALUES (20, 10, 10, 5);


--
-- TOC entry 5002 (class 0 OID 25963)
-- Dependencies: 232
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (1, 'Художественная литература');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (2, 'Учебник для вузов');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (3, 'Хрестоматия');
INSERT INTO public.categories OVERRIDING SYSTEM VALUE VALUES (4, 'Учебное пособие');


--
-- TOC entry 5007 (class 0 OID 26009)
-- Dependencies: 237
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_status OVERRIDING SYSTEM VALUE VALUES (1, 'Завершен');
INSERT INTO public.order_status OVERRIDING SYSTEM VALUE VALUES (2, 'Новый ');


--
-- TOC entry 5009 (class 0 OID 26016)
-- Dependencies: 239
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (1, '2024-02-27', '2024-04-20', 1, 10, 901, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (2, '2023-09-28', '2024-04-21', 11, 7, 902, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (3, '2024-03-21', '2024-04-22', 2, 8, 903, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (4, '2024-02-20', '2024-04-23', 11, 9, 904, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (5, '2024-03-17', '2024-04-24', 2, 10, 905, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (6, '2024-03-01', '2024-04-25', 15, 7, 906, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (7, '2024-02-28', '2024-04-26', 3, 8, 907, 1);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (8, '2024-03-31', '2024-04-27', 19, 9, 908, 2);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (9, '2024-04-02', '2024-04-28', 5, 10, 909, 2);
INSERT INTO public.orders OVERRIDING SYSTEM VALUE VALUES (10, '2024-04-03', '2024-04-29', 19, 10, 910, 2);


--
-- TOC entry 4990 (class 0 OID 25898)
-- Dependencies: 220
-- Data for Name: pickup_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (1, 420151, 'г.Лесной', 'ул.Вишневая', 32);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (2, 125061, 'г.Лесной', 'ул.Подгорная', 8);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (3, 630370, 'г.Лесной', 'ул.Шоссейная', 24);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (4, 400562, 'г.Лесной', 'ул.Зеленая', 32);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (5, 614510, 'г.Лесной', 'ул.Маяковского', 47);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (6, 410542, 'г.Лесной', 'ул.Светлая', 46);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (7, 620839, 'г.Лесной', 'ул.Цветочная', 8);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (8, 443890, 'г.Лесной', 'ул.Коммунистическая', 1);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (9, 603379, 'г.Лесной', 'ул.Спортивная', 46);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (10, 603721, 'г.Лесной', 'ул.Гоголя', 41);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (11, 410172, 'г.Лесной', 'ул.Северная', 13);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (12, 614611, 'г.Лесной', 'ул.Молодежная', 50);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (13, 454311, 'г.Лесной', 'ул.Новая', 19);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (14, 660007, 'г.Лесной', 'ул.Октябрьская', 19);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (15, 603036, 'г.Лесной', 'ул.Садовая', 4);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (16, 394060, 'г.Лесной', 'ул.Фрунзе', 43);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (17, 410661, 'г.Лесной', 'ул.Школьная', 50);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (18, 625590, 'г.Лесной', 'ул.Коммунистическая', 20);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (19, 625683, 'г.Лесной', 'ул.8Марта', NULL);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (20, 450983, 'г.Лесной', 'ул.Комсомольская', 26);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (21, 394782, 'г.Лесной', 'ул.Чехова', 3);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (22, 603002, 'г.Лесной', 'ул.Дзержинского', 28);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (23, 450558, 'г.Лесной', 'ул.Набережная', 30);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (24, 344288, 'г.Лесной', 'ул.Чехова', 1);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (25, 614164, 'г.Лесной', ' ул.Степная', 30);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (26, 394242, 'г.Лесной', 'ул.Коммунистическая', 43);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (27, 660540, 'г.Лесной', 'ул.Солнечная', 25);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (28, 125837, 'г.Лесной', 'ул.Шоссейная', 40);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (29, 125703, 'г.Лесной', 'ул.Партизанская', 49);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (30, 625283, 'г.Лесной', 'ул.Победы', 46);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (31, 614753, 'г.Лесной', 'ул.Полевая', 35);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (32, 426030, 'г.Лесной', 'ул.Маяковского', 44);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (33, 450375, 'г.Лесной', 'ул.Клубная', 44);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (34, 625560, 'г.Лесной', 'ул.Некрасова', 12);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (35, 630201, 'г.Лесной', 'ул.Комсомольская', 17);
INSERT INTO public.pickup_points OVERRIDING SYSTEM VALUE VALUES (36, 190949, 'г.Лесной', 'ул.Мичурина', 26);


--
-- TOC entry 5000 (class 0 OID 25956)
-- Dependencies: 230
-- Data for Name: producers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (1, 'Яуза');
INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (2, 'Т8 Издательские технологии');
INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (3, 'Прогресс книга');
INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (4, 'Время');
INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (6, 'Неолит');
INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (7, 'Амрита-Русь');
INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (8, 'Златоуст');
INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (9, 'Аспект Пресс');
INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (10, 'ВКН');
INSERT INTO public.producers OVERRIDING SYSTEM VALUE VALUES (5, 'Лениздат');


--
-- TOC entry 4992 (class 0 OID 25907)
-- Dependencies: 222
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles OVERRIDING SYSTEM VALUE VALUES (1, 'Администратор
');
INSERT INTO public.roles OVERRIDING SYSTEM VALUE VALUES (2, 'Менеджер
');
INSERT INTO public.roles OVERRIDING SYSTEM VALUE VALUES (3, 'Авторизированный клиент
');


--
-- TOC entry 4996 (class 0 OID 25942)
-- Dependencies: 226
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unit OVERRIDING SYSTEM VALUE VALUES (1, 'шт.');


--
-- TOC entry 4994 (class 0 OID 25928)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Никифорова', 'Анна', 'Семеновна', '94d5ous@gmail.com', 'uzWC67');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Стелина', 'Евгения', 'Петровна', 'uth4iz@mail.com', '2L6KZG');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Михайлюк', 'Анна', 'Вячеславовна', '5d4zbu@tutanota.com', 'rwVDh9');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (4, 2, 'Ситдикова', 'Елена', 'Анатольевна', 'ptec8ym@yahoo.com', 'LdNyos');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (5, 2, 'Ворсин', 'Петр', 'Евгеньевич', '1qz4kw@mail.com', 'gynQMT');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (6, 2, 'Старикова', 'Елена', 'Павловна', '4np6se@mail.com', 'AtnDjr');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (7, 3, 'Никифорова', 'Весения', 'Николаевна', 'yzls62@outlook.com', 'JlFRCZ');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (8, 3, 'Сазонов', 'Руслан', 'Германович', '1diph5e@tutanota.com', '8ntwUp');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (9, 3, 'Одинцов', 'Серафим', 'Артёмович', 'tjde7c@yahoo.com', 'YOyhfR');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (10, 3, 'Степанов', 'Михаил', 'Артёмович', 'wpmrc3do@tutanota.com', 'RSbvHv');


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 233
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 1, false);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 240
-- Name: books_in_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_in_orders_id_seq', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 231
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 236
-- Name: order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_id_seq', 2, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 238
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 219
-- Name: pickup_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pickup_points_id_seq', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 229
-- Name: producers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producers_id_seq', 1, false);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 227
-- Name: provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provider_id_seq', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 221
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 225
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unit_id_seq', 1, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4830 (class 2606 OID 26044)
-- Name: books_in_orders books_in_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_in_orders
    ADD CONSTRAINT books_in_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 25977)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 4822 (class 2606 OID 25968)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 26014)
-- Name: order_status order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4828 (class 2606 OID 26021)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4810 (class 2606 OID 25905)
-- Name: pickup_points pickup_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_points
    ADD CONSTRAINT pickup_points_pkey PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 25961)
-- Name: producers producers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_pkey PRIMARY KEY (id);


--
-- TOC entry 4818 (class 2606 OID 25954)
-- Name: authors provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id);


--
-- TOC entry 4812 (class 2606 OID 25912)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4816 (class 2606 OID 25947)
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- TOC entry 4814 (class 2606 OID 25935)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4835 (class 2606 OID 26003)
-- Name: books_authors books_authors_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_authors
    ADD CONSTRAINT books_authors_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4836 (class 2606 OID 25998)
-- Name: books_authors books_authors_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_authors
    ADD CONSTRAINT books_authors_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4832 (class 2606 OID 25988)
-- Name: books books_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4840 (class 2606 OID 26050)
-- Name: books_in_orders books_in_orders_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_in_orders
    ADD CONSTRAINT books_in_orders_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4841 (class 2606 OID 26045)
-- Name: books_in_orders books_in_orders_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books_in_orders
    ADD CONSTRAINT books_in_orders_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4833 (class 2606 OID 25983)
-- Name: books books_producer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_producer_id_fkey FOREIGN KEY (producer_id) REFERENCES public.producers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4834 (class 2606 OID 25978)
-- Name: books books_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4837 (class 2606 OID 26032)
-- Name: orders orders_order_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_status_id_fkey FOREIGN KEY (order_status_id) REFERENCES public.order_status(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4838 (class 2606 OID 26022)
-- Name: orders orders_pickup_point_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pickup_point_id_fkey FOREIGN KEY (pickup_point_id) REFERENCES public.pickup_points(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4839 (class 2606 OID 26027)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4831 (class 2606 OID 25936)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-06-11 20:43:25

--
-- PostgreSQL database dump complete
--

\unrestrict OGhsuY77DLey1MkQz5YkBLQ7xXSDc0ZlLrGYOIY3NUOvlhBL8U1o3TdJt3cgGKU

