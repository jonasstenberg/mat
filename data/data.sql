--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Debian 14.8-1.pgdg100+1)
-- Dumped by pg_dump version 14.8 (Debian 14.8-1.pgdg100+1)

-- Started on 2023-09-05 02:01:44 CEST

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
-- TOC entry 3422 (class 1262 OID 19041)
-- Name: mat; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mat WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE mat OWNER TO postgres;

\connect mat

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
-- TOC entry 3423 (class 0 OID 0)
-- Name: mat; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE mat SET "TimeZone" TO 'UTC';


\connect mat

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
-- TOC entry 3415 (class 0 OID 19348)
-- Dependencies: 216
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, date_published, date_modified, name, owner) FROM stdin;
1e92d3e7-8a5e-4d0d-a52e-737a519666c5	2020-11-24 20:22:39.496212	2020-11-24 20:22:39.496212	Frukost	jonas@stenberg.io
008625e8-ada4-4412-b20f-feb6f2f5c6ed	2020-11-24 20:36:47.070808	2020-11-24 20:36:47.070808	Middag	jonas@stenberg.io
5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	2020-11-24 20:36:47.085581	2020-11-24 20:36:47.085581	Fest	jonas@stenberg.io
2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	2020-11-24 20:37:27.306155	2020-11-24 20:37:27.306155	Högtid	jonas@stenberg.io
ffa8c20f-3293-418e-a89f-200018197bab	2020-11-24 20:37:34.635708	2020-11-24 20:37:34.635708	Dessert	jonas@stenberg.io
74b57792-fa68-4efb-be46-e8d194d86ed3	2022-12-29 15:17:14.471522	2022-12-29 15:17:14.471522	Bakelse	jonas@stenberg.io
fcbddad5-f66b-4142-949f-af475423a834	2023-08-04 12:31:16.591547	2023-08-04 12:31:16.591547	Tillbehör	jonas@stenberg.io
73f14622-6755-4c5a-a610-ad8bf0f28071	2023-08-04 16:56:05.373362	2023-08-04 16:56:05.373362	Matbröd	jonas@stenberg.io
\.


--
-- TOC entry 3410 (class 0 OID 19251)
-- Dependencies: 211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, provider, owner) FROM stdin;
93eb6174-e2e2-478c-9433-072b0befbbea	Jonas Stenberg	jonas.d.stenberg@gmail.com	google	jonas.d.stenberg@gmail.com
592fd113-c3e6-48c2-8c17-4a0c32323676	Svante Richter	svante.richter@gmail.com	google	svante.richter@gmail.com
7c619dec-8b65-4197-a251-cd8558f08e18	Andreas Wilnerzon	awgobeat@gmail.com	google	awgobeat@gmail.com
e708ff15-722c-4177-ac55-405fff35b30f	Jonas Stenberg	jonas@stenberg.io	\N	jonas@stenberg.io
\.


--
-- TOC entry 3412 (class 0 OID 19281)
-- Dependencies: 213
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes (id, date_published, date_modified, name, author, recipe_yield, recipe_yield_name, prep_time, cook_time, cuisine, description, image, thumbnail, owner, tsv) FROM stdin;
33c62ccb-4f03-4528-8d4e-e29b0b71bf16	2020-11-17 17:59:25.323289	2023-08-24 20:09:53.491402	Inlagd sill	Jonas Stenberg	4	portioner	0	0	\N		33c62ccb-4f03-4528-8d4e-e29b0b71bf16.webp	\N	jonas@stenberg.io	'början':20 'färg':28 'garner':12 'gul':9 'gärn':4 'inlag':1,6 'lätt':23 'lökring':10 'rosagrå':24 'rödlök':18 'rödlöksring':15 'sill':2,7,22 'tar':16 'trist':26 'varv':3
234950c8-2db3-4aa6-9bfa-20c38b52af85	2020-11-16 20:34:25.331545	2023-08-24 20:09:53.491402	Grönkålspesto	Jonas Stenberg	4	portioner	0	0	\N		234950c8-2db3-4aa6-9bfa-20c38b52af85.webp	\N	jonas@stenberg.io	'grönkålspesto':1 'mix':2
66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	2020-12-26 15:34:30.466289	2023-08-24 20:09:53.491402	Rostad morotssoppa	Jonas Stenberg	4	portioner	0	0	\N		66cf92d6-c4c1-4c1e-9a5f-fe59283c762a.webp	\N	jonas@stenberg.io	'20':26 '220':21 '5':66 'avslut':77 'buljontärning':36 'cirk':25,65 'dill':74 'eventuellt':46 'grad':22 'granatäpplekärn':72 'grädd':34 'klädd':7 'kok':28,62 'krydd':59 'lit':82 'lägg':3 'låt':61 'mer':48 'minut':27,67 'mitt':14 'mix':43 'mjukt':19 'morotssopp':2 'moröt':4,41 'olj':11,83 'pistagenöt':76 'placer':12 'plock':73 'plåt':8 'ring':80 'ringl':9 'rost':1,18,40 'slätt':44 'smaksät':57 'sopp':56 'soppan':69 'späd':45 'syr':33 'tid':30 'topp':68 'tunn':55 'ugn':16 'varmluft':23 'vatt':32,49 'vill':52 'vänd':37 'yoghurtboll':71 'ytterligg':64
e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	2022-09-22 19:54:14.424542	2023-08-24 20:09:53.491402	Lemon posset med hallon	Jonas Stenberg	4	portioner	10	240	\N		e6800c24-b01f-4d28-baf1-3dfa25fcfa4b.webp	\N	jonas@stenberg.io	'1':12 '4':36 '6':24,29 'citronjuic':20 'form':25 'glas':27 'grädd':7 'hallon':4,46 'häll':21 'kok':5,11 'kyl':34 'lemon':1 'låt':10 'minst':35 'minut':13 'ner':19 'port':30 'posset':2 'rör':18 'servering':43,48 'sock':9 'steln':41 'ställ':32 'ta':14 'till':39 'timm':37 'topp':44 'värm':16
a27b18c2-7351-4818-bb33-c1387e76e307	2020-12-26 15:38:10.569088	2023-08-24 20:09:53.491402	Snabb tomatsoppa med soltorkad tomat och matvete	Jonas Stenberg	4	portioner	0	0	\N		a27b18c2-7351-4818-bb33-c1387e76e307.webp	\N	jonas@stenberg.io	'15':22 'andr':42 'cirk':21 'eventuellt':41 'fetaost':51 'häll':8 'ingrediens':11 'kansk':49 'kastrull':17 'knapr':43 'kok':19 'kokt':37 'krutong':46 'lit':50 'låt':18 'matvet':7,38 'medelst':16 'minut':23 'mix':24 'salt':32 'samt':10 'server':35 'sesamfrön':47 'slätt':25 'smak':29 'snabb':1 'solroskärn':39 'soltork':4 'soppan':13 'stavmix':28 'svartpepp':34 'tom':5 'tomatsopp':2 'topping':44
49bd57fd-c569-43cf-b69c-0bc1371ce407	2020-12-01 12:18:08.492246	2023-08-24 20:09:53.491402	Sötpotatisbiffar med tzatziki och bönsallad	Jonas Stenberg	4	portioner	0	0	\N		49bd57fd-c569-43cf-b69c-0bc1371ce407.webp	\N	jonas@stenberg.io	'150':9 '8':62 'biff':63,78,128 'bland':52,109 'bön':89,114 'bönsall':5,87,130 'c':10 'citronsaft':117 'durkslag':92 'fint':25 'form':61 'grovt':22 'gurkan':46 'halv':105 'hälft':21,24 'häll':88 'ihop':27 'in':13,77 'kallt':96 'krydd':32,122 'lit':50 'lägg':76 'låt':38,99 'lök':112 'medelvärm':75 'minut':43,80 'mjöl':30 'ner':35 'olj':121 'oljan':70 'pepp':56,126 'plåt':15,84 'press':48,58,115 'ringl':119 'rinn':100 'riv':19,45 'salladslök':108 'salt':55,124 'server':127 'skal':17 'skär':102 'smet':39 'spol':93 'stek':67 'stekpan':73 'striml':107 'sväll':40 'sätt':6,12 'sötpotatis':20,37 'sötpotatisbiff':1,16,60 'sötpotatissmet':65 'tom':110 'tomat':103 'tzatziki':3,44,132 'ugn':7,86 'ur':49 'varm':83 'vatt':97 'visp':26 'vitlök':59 'vänd':34 'vätsk':51 'yoghurt':54 'ägg':28 'äggvit':29
fc52748c-181d-4c2b-916b-08332cdcb473	2020-11-22 14:01:13.827309	2023-08-24 20:09:53.491402	Fisksoppa	Jonas Stenberg	4	portioner	0	0	\N		fc52748c-181d-4c2b-916b-08332cdcb473.webp	\N	jonas@stenberg.io	'-15':70 '-2':113 '-4':103 '1':112 '10':69 '3':90,102 'bar':111 'behöv':13,110 'benfri':87 'bit':25 'bort':18 'bröd':118 'ca':68 'cayennepepp':41 'cm':91 'crem':122 'del':21 'dom':99 'exempelvis':108 'finhack':2 'fisk':88 'fiskbit':96 'fiskbuljongtärning':62 'fiskfilé':106 'fisksopp':1 'fraich':123 'fräs':26 'fänkål':52 'fästet':19 'gott':117 'gryt':37 'grönsak':7 'hummerfond':64 'kastrull':35 'klick':121 'kok':66 'krydd':78 'kub':93 'lagom':9,76 'lägg':48,60,94 'lök':3,27 'minut':71,104,114 'mjuk':77 'moröt':51 'munsbit':11 'ner':49 'olj':32 'pepp':82 'potatis':50,74 'rosmarin':44 'rör':46 'saffran':40 'salt':80 'server':115 'sjud':98 'skal':15 'skär':6,17,85 'smak':84 'smaksät':38 'soppan':101 'späd':55 'spättafilé':109 'stor':10,24,92 'till':73 'timjan':42 'tomat':12,22,54 'tunn':105 'varsamt':30 'vatt':57 'vin':59 'vitlök':5,29
6675697a-c45c-495c-af13-2180ae68113a	2022-12-29 12:44:07.979499	2023-08-24 20:18:30.179113	Soppa med vita bönor	Ingmarie Stenberg	4	portioner	0	0	\N		6675697a-c45c-495c-af13-2180ae68113a.webp	\N	jonas@stenberg.io	'10':39 'buljongtärning':31 'bön':4,43 'ca':38 'fräs':11,26 'gryt':17 'hack':7,21 'hacket':12 'kok':34,47 'lit':52 'lägg':41 'låt':24,45 'lök':8 'minut':40 'paprikan':22 'paprikapulvret':20 'skal':5 'smak':49 'smör':14 'sock':53 'sopp':1 'svag':36 'tillsamman':18 'tillsät':28 'timjan':33 'tomat':29 'vatt':30 'vinäg':55 'vit':3 'vitlök':10 'värm':37
ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	2020-12-26 17:32:55.258401	2023-08-24 20:09:53.491402	Granola	Jonas Stenberg	4	portioner	30	90	\N		ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d.webp	\N	jonas@stenberg.io	'-90':66 '100':42 '30':6,13 '5':37 '75':65 'bakplåtspapp':57 'bland':44 'blötlägg':2,8 'bovetet':3,19 'bred':51 'bunk':50 'ca':5,12 'cirk':36,64 'dubbl':70 'frukt/b':84 'fröer':10 'fröern':30 'grad':43 'granol':1 'granolan':74 'gyllen':78 'hel':53 'häll':15 'ingrediens':47 'kakaonib':81 'kallt':24 'klabbet':54 'koko':80 'krisp':76 'låt':32 'mer':67 'minut':7,14,38,72 'nog':22 'och/eller':82 'receptet':71 'rinn':33 'rost':59 'runt':45 'sil':26 'skölj':21 'till':73 'tillsät':79 'tork':83 'ugn':40,62 'vatt':25 'vattnet':17,28 'värm':39
12905e60-8310-45f0-8507-ad5334662b3a	2022-12-29 12:55:19.256035	2023-08-24 20:17:14.087893	Mammas äppelkaka med vaniljsås	Ingmarie Stenberg	4	portioner	0	0	\N		12905e60-8310-45f0-8507-ad5334662b3a.webp	\N	jonas@stenberg.io	'225':27 'bland':9 'deg':20 'grad':28 'grovt':17 'grädd':23 'mamm':1 'mandl':11 'riv':15 'rör':5 'server':29 'skorpmjöl':12 'smör':6 'sock':8 'ugn':25 'vaniljsås':4,31 'varv':19 'vetemjöl':14 'äppelkak':2 'äppl':16,22
3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	2020-12-03 20:31:07.082067	2023-08-24 20:09:53.491402	Bakpotatis med tonfiskröra	Jonas Stenberg	4	portioner	15	60	\N		3b6206a8-4ed8-4228-a66b-1e0c05ac2af4.webp	\N	jonas@stenberg.io	'1':73 '200':43 'bak':34,36,67 'bakpotatis':1,46 'bjud':113 'bland':18 'ca':72 'finhack':14 'fyll':110 'gaffel':59 'grad':44 'gärn':114 'gör':4,48 'helt':94 'häll':7 'ihop':19 'ingrediens':21 'klar':81 'klick':105 'kniv':86 'kryss':51 'kyl':31 'känn':90 'lit':107 'låt':28,99 'lök':13,17 'medan':32 'mitt':88 'mjuk':95 'nagg':55 'pepp':27 'potatis':35,37,68,104 'sall':117 'salt':25 'se':77 'sellerin':15 'skal':12 'smak':22 'smör':108 'sprick':64 'stick':84 'stå':29 'svaln':100 'ta':96 'timm':74 'tonfisk':11 'tonfiskrör':3 'tonfiskröran':112 'topp':53 'tvätt':45 'ugn':39,41,66,71 'värm':40 'vätskan':9 'öppn':102
ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	2020-11-24 20:51:42.560464	2023-08-24 20:09:53.491402	Bönchili med koriander och nachos	Jonas Stenberg	4	portioner	15	60	\N		ae627ce3-5e81-48b1-a04e-4a3216d9f6b9.webp	\N	jonas@stenberg.io	'10':64 'blad':74,87 'bland':38,55 'bleksellerin':14 'bort':70 'burk':50 'burktomat':47 'båd':71 'bön':57 'bönchili':1 'ca':63 'chilin':10 'finhack':6,77 'fräs':34 'genomskin':31 'grovhack':86 'grytan':83 'grönsak':20 'gullök':7 'innan':84 'kakaon':59 'kok':53,62 'koriand':3,76 'kub':17 'lägg':80 'låt':33,52,61 'lök':29 'minut':37,65 'moröt':12 'nacho':5 'ner':39,56,81 'olivolj':24 'oregano':41 'paprikapulv':42 'peppr':68 'rik':22 'salt':66 'server':89 'servering':85 'sidan':91 'skär':11,69 'små':16 'spiskummit':44 'stamm':72,78 'stek':18 'timjan':40 'tomatpurén':27 'vatt':51 'vitlök':8
b844bebc-62e6-43d8-92f3-af8033543f16	2020-11-17 09:48:17.339654	2023-08-24 20:09:53.491402	Pytt i panna	Jonas Stenberg	4	portioner	0	0	\N		b844bebc-62e6-43d8-92f3-af8033543f16.webp	\N	jonas@stenberg.io	'-25':39 '1x1':19 '20':38 '225':7 'bit':22 'ca':18,37 'cm':20 'grad':8 'inlag':47 'kålrot':14 'lägg':23 'minut':40 'moröt':13 'olivolj':29 'palsternack':16 'pann':3 'peppr':32 'plåt':26 'potatis':12 'pytt':1 'ringl':27 'rost':33 'rödbet':48 'salt':30 'server':45 'skal':9 'stek':41 'stor':21 'sätt':4 'tid':44 'tärn':11 'ugn':5,36 'ägg':42
efb431d6-38ea-417c-b197-b92b346e5fbb	2020-11-17 17:33:36.72893	2023-08-24 20:09:53.491402	Rödbetssallad med hemgjord pesto och quinoa	Jonas Stenberg	4	portioner	0	0	\N		efb431d6-38ea-417c-b197-b92b346e5fbb.webp	\N	jonas@stenberg.io	'1/2':71 'babyspen':76 'cm':72 'dra':41 'fetaost':82 'grönkål':10,54 'gör':49 'hemgjord':3,9 'honung':61 'händ':45 'inuti':24 'kallt':38 'kok':14 'kokt':88 'lag':80 'lägg':55,75 'låt':28 'mix':66 'mjuk':23 'nästan':22 'pesto':4,11,46,91 'quino':6,13,89 'rödbet':15,69,78 'rödbetarsall':7 'rödbetssall':1 'salt':26 'server':86 'skal':17,35 'skalet':43 'skiv':73 'skär':68 'skölj':32 'svaln':30 'söt':64 'till':19 'tillsät':81 'topp':84 'tsk':60 'valnöt':52 'vanligtvis':57 'vatt':27,39
f0d97e79-a8e3-46c0-a72d-4134cfb774c8	2020-12-26 15:51:02.332474	2023-08-24 20:09:53.491402	Linfröknäcke	Jonas Stenberg	4	portioner	0	0	\N		f0d97e79-a8e3-46c0-a72d-4134cfb774c8.webp	\N	jonas@stenberg.io	'1':46,70 '125':23 '4':12 'bakplåtspapp':37 'bit':77 'bland':2 'bred':25 'bryt':75 'centimeter':54 'frömassan':27 'frön':4 'glip':55 'grad':24 'grädd':41,68 'gång':17 'häll':5 'jämt':30 'kallt':10 'lag':32 'linfröknäck':1 'låt':48,72 'minut':60 'plåt':35 'rör':14 'saltet':40 'släpp':62 'strö':38 'ställt':9 'svaln':73 'sänk':65 'sätt':20 'temperatur':66 'timm':13,19,47,71 'tiond':59 'tunt':31 'ugn':21,44 'ugnsluckan':49 'vatt':7 'ytter':69 'ångan':64 'öpp':51 'öppn':57
d08968af-bbdc-4102-8dfe-650cb9d30e83	2021-01-10 19:30:03.04069	2023-08-24 20:09:53.491402	Dillstuvad potatis	Jonas Stenberg	4	portioner	5	30	\N		d08968af-bbdc-4102-8dfe-650cb9d30e83.webp	\N	jonas@stenberg.io	'bit':60 'bland':27 'dill':65 'dillstuv':1 'grav':71 'grädd':31,43 'hack':55 'hälft':29,33 'klar':9 'klumpfrit':26 'kok':3 'lagom':58 'lax':72 'låt':11 'mjölk':35,45 'muskot':48 'ner':18,28,62 'nästan':7 'peppr':54 'potatis':2,4,56,63 'rest':41 'riv':46 'runt':38,68 'rör':21,67 'salt':52 'server':69 'smak':50 'smöret':15 'stor':59 'svaln':12 'till':23 'vetemjölet':19 'visp':37 'vänd':61 'värm':13
e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	2020-11-17 17:53:32.881259	2023-08-24 20:09:53.491402	Rabarbermarmelad med ingefära	Jonas Stenberg	4	portioner	0	0	\N		e35f9be3-7cc2-4d4d-9144-cf7bccf070ab.webp	\N	jonas@stenberg.io	'-2':11 '1':10 '107':96 '108':97 '12':53 '15':89 '20':65,90 'apelsin':18,42 'bit':14 'bland':29 'borst':15 'bunk':45 'burk':118,125 'ca':52,64 'citron':16,40 'cm':12 'gen':120 'grad':98 'gryt':61 'grytan':112 'hälft':32 'häll':57 'igen':82 'ingefär':3 'ingefäran':101 'kalln':132 'kok':63,80,84 'kraft':85 'lit':77,103 'lock':87,122 'låt':50 'marmelad':105,130 'minut':66,91 'ner':73,109,128 'plastfoli':48 'press':26 'rabarb':5,30 'rabarbermarmel':1 'ren':19,116 'rest':74 'riv':23 'rumstemperatur':56 'rör':67,72,99,107 'saft':28,38 'samt':35 'skal':36 'skalet':24 'skiv':7 'skölj':4 'sockret':34,76 'stor':13 'ställ':124 'stå':51 'sätt':119 'taget':79 'temperatur':94 'till':129 'timm':54 'täck':46 'ur':27 'varm':117 'varmt':21 'vatt':22 'ös':113
40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	2020-11-16 18:45:35.354003	2023-08-24 20:09:53.491402	Laxtaco	Jonas Stenberg	4	portioner	0	0	\N		40b0ea90-96bb-4c1d-ba4b-29eea6419ea1.webp	\N	jonas@stenberg.io	'-30':36 '175':28 '20':35 'burk':64 'dom':20 'exak':45 'form':6 'grad':29 'in':19,32,67 'innan':72 'koll':38 'krydd':16 'kyl':69 'lax':2,10,24,33 'laxtaco':1 'lit':39 'lägg':8 'masser':18 'minut':37 'mortl':14 'ner':9 'neråt':13 'nån':70 'olj':3 'osäk':43 'ovansidan':22 'pickl':47 'rödlök':48,53,58 'skinnsidan':12 'smält':56 'sockret':55 'striml':57 'sätt':25,31,66 'tid':46 'timm':71 'ugn':26 'ugnssäk':5 'utom':52 'värm':49
1642372e-2a7a-445d-be6f-2474be5b8586	2020-11-17 17:51:55.475259	2023-08-24 20:09:53.491402	Hummus, tabbouleh och stekt halloumi	Jonas Stenberg	4	portioner	0	0	\N		1642372e-2a7a-445d-be6f-2474be5b8586.webp	\N	jonas@stenberg.io	'anvisning':50 'bland':63 'bulgurn':48,67 'chilifruk':22 'citronjuic':25 'enl':49 'finhack':9,55,59 'förpackning':52 'förvar':42 'halloumi':5 'halloumin':74 'hummus':1,6 'häll':11 'ingrediens':65 'jämn':35 'kallt':43 'kikärt':15,21 'kok':47 'krydd':68 'lägg':19 'låt':16,53 'lök':60 'matbered':31 'mix':32 'olivolj':26 'pepp':41,72 'persiljan':56 'press':24 'rinn':17 'salt':39,70 'servering':45 'skal':7,57 'skölj':14 'smaksät':37 'smet':36 'spiskummin':23 'stek':73 'stekt':4 'svaln':54 'tabbouleh':2,46 'tahini':28 'tomat':62 'tärn':61 'vitklök':20 'vitlöksklyftan':10
e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	2020-11-17 09:47:13.881733	2023-08-24 20:09:53.491402	Pasta med räkor, chili och tomat	Jonas Stenberg	4	portioner	0	0	\N		e7e6ba02-26e6-4e54-af66-5afb58f6bd4b.webp	\N	jonas@stenberg.io	'2':52 '5':34 'ans':7 'anvisning':23 'bland':71 'ca':33 'chili':4,30 'chilin':16 'citronskal':64 'enl':22 'finhack':15 'fräs':26,42,50 'förpackning':25 'grädd':56 'halver':18 'hälft':76 'häll':54 'ihop':60 'kok':20,59 'låt':58 'lök':37 'minut':35,46,53 'mjukn':38 'ner':69 'nog':11 'oljan':32 'ost':78 'parmesan':83 'past':1 'pastan':21,72 'pepp':67 'purjolök':10,27 'rest':81 'räk':3,70 'salt':65 'server':79 'sidan':85 'skiv':12 'skölj':9 'smak':61 'sås':74 'till':36 'tillsät':39,47 'tom':6 'tomat':19,48 'tomatpur':40 'tunt':14 'vitlök':28 'vänd':68 'ytter':51
dbecf460-5460-40c4-89a4-d7d704148456	2022-12-29 12:47:34.459066	2023-08-24 20:17:14.087893	Mammas pepparkaksdeg	Ingmarie Stenberg	4	portioner	0	0	\N		dbecf460-5460-40c4-89a4-d7d704148456.webp	\N	jonas@stenberg.io	'200':33 'alltsamman':18 'bak':26 'bland':6,12 'deg':20 'grad':34 'grädd':11,29 'ihop':17 'krydd':15 'kylskåpet':25 'låt':19 'mamm':1 'natt':23 'pepparkaksdeg':2 'rör':16 'sirap':9 'smält':3 'smöret':4 'sock':8 'stå':21 'ugn':31 'vetemjölet':13
39223e98-f9b2-4217-957c-58a43ab3cbe7	2020-11-17 18:04:33.936906	2023-08-24 20:18:14.721337	Senapsgravad strömming	Ingmarie Stenberg	4	portioner	0	0	\N		39223e98-f9b2-4217-957c-58a43ab3cbe7.webp	\N	jonas@stenberg.io	'1':75,80 '6':42 'bland':3,52 'bort':45 'burk':63 'ca':41,74 'drag':48 'dygn':76 'fast':40 'filé':23 'för':77 'häll':44 'hållb':79 'in':27,68 'ingrediens':54 'krus':66 'kyl':30,70,83 'köttet':36 'lag':25,46 'ligg':34 'lägg':21 'låt':32 'löst':19 'mogn':73 'ner':22 'rör':15 'salt':11 'senapsgrav':1 'senapssås':56,60 'servering':78 'skinnet':49 'skål':9 'sock':13 'strömming':2,51,58 'ställ':26,67 'till':16,35 'tillsät':10 'timm':43 'varv':57 'vatt':4 'veck':81 'vitt':38 'ättiksprit':6
57be7a15-9cc3-437c-a189-21b0c11b203b	2022-12-29 17:16:54.57467	2023-08-24 20:18:21.816892	Slottsstek	Ingmarie Stenberg	4	portioner	0	0	\N		57be7a15-9cc3-437c-a189-21b0c11b203b.webp	\N	jonas@stenberg.io	'aluminiumfoli':34 'bland':10 'bryn':2,8 'grytan':14 'grädd':44 'in':32 'ingrediens':12 'kok':16 'köttet':3,23,29 'lind':31 'lock':21 'låg':18 'lök':9 'maizen':42 'mört':25 'olj':7 'red':39 'sil':35 'skyn':37 'slottsstek':1 'smak':46 'smör':5 'svartvinbärsgel':49 'sås':26 'ta':27 'tillsät':43 'värm':19
9b6996db-e837-44a4-bd55-46f9ed31f515	2022-12-29 17:21:28.347914	2023-08-24 20:09:53.491402	Rimmad torsk med brynt smör och potatispuré	Jonas Stenberg	4	portioner	0	0	\N		9b6996db-e837-44a4-bd55-46f9ed31f515.webp	\N	jonas@stenberg.io	'20':16 '3':93 'beroend':98 'bland':68,110 'bryn':20 'brynt':4,18,106 'ca':92 'citronskal':71 'doft':29 'dà':63 'fisk':11,86,102 'gulbet':69 'gyllen':26 'kapris':76 'kastrull':24 'klapp':85 'klistr':66 'kok':34 'konsist':54 'krass':112 'luft':53 'läng':62 'lättsalt':37 'låt':13 'minut':17 'mjuk':35 'mjölk':41,51 'nöt':28 'olivoli':78 'pepp':84 'pepparrot':109 'persilj':74 'potatis':32,47 'potatispuré':7,30 'puré':104 'pà':95,99 'rimm':1 'rucol':75 'saft':73 'sall':105 'salt':9,58,82 'samman':46 'server':101 'sid':97 'skal':31 'smak':55,79 'smor':43 'smör':5,19,91,107 'smöret':21 'stek':89 'strö':8 'tillsamman':44 'tjocklek':100 'torr':87 'torsk':2 'vari':96 'varm':50 'vatt':38 'vil':14 'visp':45,59 'värm':39 'äppelsall':67 'äppl':70
41bc608a-d07b-45f2-a533-2085726ae280	2020-11-16 20:46:51.50334	2023-08-24 20:09:53.491402	Chipotlegryta	Jonas Stenberg	4	portioner	5	45	\N		41bc608a-d07b-45f2-a533-2085726ae280.webp	\N	jonas@stenberg.io	'30':42 'adobo':21 'chipotl':22 'chipotlegryt':1 'fint':7 'fräs':8,24 'genomskin':17 'grovriv':28 'gullök':3 'hack':2 'ingefäran':6 'klar':55 'kok':51 'kokosmjölk':45 'kokosolj':10 'kross':34 'lins':49,53 'lök':15 'minst':41 'minut':13,27,43 'moröt':29,37 'puttr':39 'röd':48 'tid':31 'till':14,52 'tillsät':18,44 'tomat':35 'tomatpur':19 'vitlöksklyft':4 'ytterligg':25
05bb7c8d-c879-41cb-aad0-44ce505db2ae	2020-12-26 15:55:40.087658	2023-08-24 20:09:53.491402	Guldmjölk	Jonas Stenberg	4	portioner	0	0	\N		05bb7c8d-c879-41cb-aad0-44ce505db2ae.webp	\N	jonas@stenberg.io	'-2':25,36 '1':24,35 'bland':7 'fin':53 'fint':6 'försikt':18 'grönsakscentrifug':48 'guldmjölk':1 'guldmjölkspast':38 'gör':45 'ingefär':51 'ingefärajuic':46 'ingrediens':10 'kardemumm':3 'kastrull':15 'kok':16 'kram':58 'låt':20 'minut':26 'mjölk':32 'mortl':2 'msk':37 'omrörning':23 'pastan':12 'riv':49 'rivjärnet':56 'saft':60 'sidan':54 'sjud':21 'smak':41 'svartpepp':5 'tillsät':34 'tip':42 'tjockn':29 'ur':59 'värm':30 'övr':9
4aa69da1-cda1-46cb-b386-6fd0e5251b6e	2020-11-21 15:16:22.100787	2023-08-24 20:09:53.491402	Lax med pepparrotscreme och ugnsrostad potatis	Jonas Stenberg	4	portioner	0	0	\N		\N	\N	jonas@stenberg.io	'-20':68 '-57':78 '15':67 '200':10 '25':41 '55':77 'bakplåtspapp':34 'bland':21,49 'bred':56 'ca':40,66 'grad':11,79 'gyllenbrun':47 'in':36,63 'ingrediens':51 'innertemperatur':75 'klyft':20 'lax':1,72 'laxfilé':59 'laxsidan':61 'lägg':28 'mindr':19 'minut':42,69 'olivolj':23 'ovanpå':58 'pepp':26 'pepparrotscrem':3,48 'plåt':32 'potatis':6,13,17,45 'sall':82 'salt':24 'server':80 'skal':14 'skär':16 'skål':54 'sätt':7,35,62 'till':44 'ugn':8,38,65 'ugnsrost':5,12
647d6e35-8369-4e00-8146-7d0587c28478	2022-12-29 17:29:34.277671	2023-08-24 20:09:53.491402	Halloumi stroganof	Jonas Stenberg	4	portioner	0	0	\N		647d6e35-8369-4e00-8146-7d0587c28478.webp	\N	jonas@stenberg.io	'1':63 'aioli':116 'bit':13 'buljongtärning':56 'dijonsenap':53 'fat':43 'fin':35 'fräs':61 'färg':36 'gott':118 'grovt':17 'grädd':82,96 'hack':5,112 'halloumi':1 'halloumin':22,78 'hasselnöt':113 'hemlag':115 'häll':65 'kok':84 'kokt':108 'lit':94,114 'lägg':39 'lät':83 'låt':60,71 'lök':6,45 'mer':90,95 'mindr':12 'minut':75 'morot':47 'moröt':10 'ner':77 'olj':28 'ost':26 'pa':81 'pannan':49 'paprikapulv':51 'pepp':104 'puttr':72 'ris':109 'riv':15 'riviärn':20 'rucol':110 'runt':37 'rör':57,68 'salt':102 'serv':105 'skal':3,7 'skär':9,21 'slå':80 'smak':99 'smul':55 'stav':24 'stek':25,44 'stekpan':31 'stroganof':2 'stroganoff':92 'säs':91 'till':32 'tillsamman':106 'tillsät':50,93 'tomatpuré':52 'vatt':67,98 'vill':86 'vänd':76
fb5328c4-5e22-41d7-a1e1-35448e96b4af	2020-12-26 15:40:43.094303	2023-08-24 20:09:53.491402	Morotssoppa med kokos	Jonas Stenberg	4	portioner	0	0	\N		fb5328c4-5e22-41d7-a1e1-35448e96b4af.webp	\N	jonas@stenberg.io	'15':42 '20':43 'all':28 'chiliflak':19 'cirk':41 'ev':60 'fräs':12 'färg':24 'får':22 'gryt':10 'grytan':31 'grönsaksfond':34 'gärn':72 'hett':4 'häll':25 'ihop':32 'ingefär':17 'koko':3 'kokosmjölk':29,69 'limejuic':55 'lit':23 'lock':40 'låt':37 'lök':13 'minut':44 'mix':50 'mjuk':49 'morotssopp':1 'moröt':15,47 'nästan':27 'olivolj':6 'pumpafrön':74 'rest':67 'ringl':65 'salt':56 'servering':64,76 'sjud':38 'slät':52 'soppan':51 'spiskummin':16 'späd':59 'stor':9 'svartpepp':58 'till':20,46 'tillsät':54 'topp':71 'vatt':36,62 'vitlök':14
f26e4739-19bc-48f4-91ed-e87268a69423	2022-12-29 12:37:33.928328	2023-08-24 20:17:14.087893	Mammas lammstek	Ingmarie Stenberg	4	portioner	0	0	\N		f26e4739-19bc-48f4-91ed-e87268a69423.webp	\N	jonas@stenberg.io	'1':61 '175':6 '200':106 '65':81 'alltid':87 'aluminiumfoli':51 'aluminiumfolie-kläd':50 'bott':57,95 'bryn':27 'bränn':101 'dl':62 'finn':88 'form':53,91,120 'färg':37 'fått':36,77 'gall':70 'gnid':8 'grad':7,82,107 'gryt':33 'gyllenbrun':133 'hjälp':20 'häll':116 'in':9,17,48,66,127 'innertemperatur':79 'klädd':52 'kniv':24 'krydd':15 'lammstek':2 'lägg':112 'långpan':115 'mamm':1 'mitt':72 'pepp':13 'plåt':55,93,122 'potatis':109,124,131 'salt':12 'se':83 'skipp':44 'skiv':108 'steget':46 'stek':10,26,28,67 'stekpan':31 'stick':16 'stor':42 'sätt':3,47,65,103,126 'tunt':110 'ugn':4,59,74,97,104,129 'vass':23 'vatt':63 'vitlöksklyft':18 'vätsk':89 'vätskan':118
1cb4d94c-8104-47ee-8849-c11bbdc60c1b	2020-11-17 18:06:35.71147	2023-08-24 20:17:50.366811	Ört- och vitlöksgravad strömming	Ingmarie Stenberg	4	portioner	0	0	\N		1cb4d94c-8104-47ee-8849-c11bbdc60c1b.webp	\N	jonas@stenberg.io	'1':74,80 '6':42 'bland':5,51 'bort':45 'burk':62 'ca':41,73,79 'drag':47 'dygn':75 'fast':40 'filé':23 'för':76 'häll':44 'hållb':78 'in':27,66 'ingrediens':53 'krus':64 'kyl':29,69,83 'köttet':36 'lag':25,46 'ligg':33 'lägg':21 'låt':31 'löst':19 'mogn':72 'ner':22 'rör':15 'saltet':13 'servering':77 'skinnet':48 'skål':11 'strömming':4,50,57 'ställ':26,65 'sås':59 'till':16,35 'tillsät':12 'timm':43 'varv':56 'vatt':6 'veck':81 'vitlöksgrav':3 'vitt':38 'ättikssprit':8 'ört':1 'örtsås':55
e93d25fa-4339-4a26-87d4-5329921b5786	2021-01-16 09:28:04.555309	2023-08-24 20:09:53.491402	Kikärtsgryta med röd curry och kokosmjölk	Jonas Stenberg	4	portioner	0	0	\N		e93d25fa-4339-4a26-87d4-5329921b5786.webp	\N	jonas@stenberg.io	'1/4':56 '5':43 'anvisning':10 'basilik':71 'basilikan':22 'ca':42 'curry':4,28 'currypast':29 'del':45 'enl':9 'fräs':18 'färsk':70 'grytan':52 'hack':13,21 'häll':50 'kikärt':31 'kikärtsgryt':1 'kok':7,36,59 'kokosmjölk':6,27 'lim':57 'låt':39,58 'lök':14 'minut':44 'mitt':48 'mjuk':63 'olj':20 'paketet':12 'puttr':40 'ris':8,66 'röd':3 'saft':54 'salt':35 'server':64 'smak':32 'till':60 'tillsamman':25 'tillsät':24,53 'tomat':46,61 'topp':68 'vitlök':16
bc0a6a05-bc49-49dc-89e3-37933fc145e9	2023-08-04 16:56:05.373362	2023-08-24 20:09:53.491402	Enkla frukostfrallor	Jonas Stenberg	6	frallor	15	25	\N		bc0a6a05-bc49-49dc-89e3-37933fc145e9.webp	\N	jonas@stenberg.io	'-20':134 '15':133 '2':68 '250':127 '275':79 '30':18 'avstäng':53 'bakbord':31 'bakplåtspapp':44 'bit':37,39 'bland':22 'bott':66 'brick':47 'bröd':113,131 'bull':72 'bunk':12 'dag':67 'deg':27 'del':33 'enkl':1 'fin':140 'for':8 'fram':71 'frukostfrall':2 'färg':141 'fått':139 'grad':80,128 'hand':9 'hyllan':92 'ihop':4 'in':50,112 'isbit':61,119 'kall':55 'kylklamp':59 'linfrön':110 'lit':102,107 'lägg':40,117 'låt':13,93,130 'max':17 'minut':16,24,135 'mitt':85 'mjöl':30 'morgon':69 'nederst':91 'nedr':122 'oöm':88 'pensl':98 'plåt':64,83,89,123 'rikt':96 'rundriv':38 'rör':3 'salt':7,20 'sex':36 'solroskärn':108 'sprej':100 'stjälp':25 'strö':105 'ställ':49 'stå':132 'sänk':124 'sätt':76,111 'ta':70 'till':137 'tillsät':19 'ugn':56,74,94,115 'ur':73 'utom':6 'varm':97 'vatt':103 'vil':14 'värm':125
93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	2022-12-29 17:32:14.415375	2023-08-24 20:09:53.491402	Havets wallenbergare	Jonas Stenberg	4	portioner	0	0	\N		93fa5cd7-4c61-42e5-91a5-c60728a1ba0d.webp	\N	jonas@stenberg.io	'1':61 '10':134 '125':83 '30':14 '4':88 '58':139 '8':91 'bit':53 'bland':37 'boll':94 'bunk':5,59 'c':84,140 'ca':133 'citronklyft':148 'dill':152 'fat':99 'finfordel':70 'fisk':50,69 'form':85 'fortsat':78 'frys':12 'försikt':104 'grädd':30,72 'gräddmjölk':41 'gyllen':121 'gärn':150 'havet':1 'häll':25 'in':4,128 'innertemperatur':137 'kall':58 'kastrull':33 'kniv':7 'kok':20 'lingon':145 'lägg':55,96,122 'lättsalt':23 'matbered':10 'mindr':52,92 'minst':13 'minut':15,135 'mitt':130 'mix':66 'mixning':79 'mjuk':21 'mjölk':28 'olj':115 'pa':82 'pepp':65 'potatis':18,35 'potatispur':143 'potatispuré':16 'press':34 'puré':44 'rik':113 'rund':93 'runt':107 'rårörd':144 'salt':48,63 'server':141 'skal':17 'skär':49 'smak':45 'smet':86 'smör':39,117 'stall':127 'stek':110 'stor':89 'strål':76 'ströbröd':101 'ströbrödet':109 'ställ':3 'sätt':80 'till':118,136 'tillsät':71 'topp':149 'tryck':102 'tsk':62 'tunn':75 'ugn':81,132 'ugnsform':125 'vatt':24 'vänd':106 'värm':27 'wallenberg':2,111 'ärt':146
d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	2022-12-29 17:26:36.816902	2023-08-24 20:15:45.261953	Lövbiffsgryta	Ingmarie Stenberg	4	portioner	0	0	\N		d6f52463-0949-4b7d-801e-7aa4c2e6fe8e.webp	\N	jonas@stenberg.io	'2':74 'bön':65,83 'ca':73 'flytt':28 'fått':36 'grytan':77 'grädd':56 'hett':6 'hälft':16 'häll':50,54 'hög':21 'klick':10 'kok':68,72 'kött':53 'köttet':3,18,30,41 'lägg':14,64 'lät':60 'låt':71 'lök':43,47 'lövbiffsgryt':1 'minut':63 'mjuk':49 'omrörning':24 'peppr':27 'potatis':81 'rest':39 'ris':79 'salt':25,67 'samt':82 'senap':57 'server':76 'småputtr':61 'smör':12 'soj':59 'stek':19,38,42 'stekpan':9 'stekyt':37 'striml':2 'tallrik':33 'till':46 'tillbak':51 'tunt':4 'vatt':69 'vitlök':45 'värm':22
8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	2022-05-01 21:19:23.701127	2023-08-24 20:09:53.491402	Krämig sötpotatisdhal	Jonas Stenberg	4	portioner	0	0	\N		8aa6fb8a-705b-4c9c-92d1-ac9066ddde62.webp	\N	jonas@stenberg.io	'-2':78 '-25':113 '-3':66 '-6':169 '1':77 '10':139 '2':11,65 '20':34,112 '220':6 '3':147 '4':83,168 '5':92 'bakplåtspapp':25 'band':150 'belugalins':90 'bit':14 'bland':15,127 'blåt':23 'bred':149 'ca':33,91,111,167 'citronsaft':120 'cm':12,148 'curry':73 'dhal':143 'dl':84 'dropp':119 'finhack':41,124 'finriv':44 'fräs':60,75 'först':89 'garam':70 'grad':7 'grovriv':47 'grönsaksbuljong':87 'gyllen':164 'hett':49 'ingefär':45,69 'innan':94 'kastrull':56 'klick':189 'kok':98,179 'kokosmjölk':82 'koktid':141 'koriand':125 'korianderchip':193 'korianderoljan':158 'krisp':166,192 'kräm':1 'lins':40,97,108 'lock':106 'lök':42,61 'masal':71 'medelhög':58 'minut':93 'mjuk':38 'mjukn':110 'morot':48 'ner':175 'olivolj':17,51,129 'pensl':156 'pepp':20,123,132 'placer':152 'plåt':155 'rost':29,160 'röd':96 'rör':80,174 'salt':18,121,130 'server':186 'sjud':104 'skär':144 'skål':135 'skölj':39,171 'smak':115 'spen':172 'spenat':182 'sprid':26 'spänst':185 'stor':13 'sänk':100 'sätt':3 'sötpotatis':9,178 'sötpotatisdhal':2 'tapp':183 'till':37,107,163 'tillsamman':176 'tillsät':68,88 'tortill':145 'traktörpan':54 'tärn':8 'ugn':4,31,162 'vatt':85 'vitlök':43,63 'värm':59,102 'yoghurt':190 'återstår':138
7f4502e4-b154-4bfe-b0ae-a4f762c7a910	2020-11-16 20:56:04.321388	2023-08-24 20:09:53.491402	Tonfiskpasta med chili, citron och kapris	Jonas Stenberg	4	portioner	0	0	\N		7f4502e4-b154-4bfe-b0ae-a4f762c7a910.webp	\N	jonas@stenberg.io	'1':32 'behöv':66 'börj':50 'chili':3 'chiliflaks':15 'citron':4,47 'citronsaft':27 'citronskal':43 'dl':33,54 'dropp':26 'fräs':11,18 'hack':7 'halv':46,53 'kapris':6,17 'klar':39 'kok':28 'konsistens':60 'känn':57 'låt':14 'lök':8 'mer':63 'ner':68 'nästan':37 'olivoljan':13 'parmesan':73 'pastan':36,69 'pastavat':34,55 'persiljan':49 'rivet':42 'server':71 'sidan':75 'slutet':21 'spaghettin':29 'spar':31 'tillsät':22,62 'tonfisk':23 'tonfiskpast':1 'vitlök':10 'vänd':67
1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	2022-12-29 17:24:19.424081	2023-08-24 20:15:23.530407	Kalljästa morotsfrallor med äpple	Ingmarie Stenberg	8	frallor	0	0	\N		1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50.webp	\N	jonas@stenberg.io	'-15':88 '1':5 '10':41 '12':87 '2':43 '250':47 'bakplåtspapp':65 'bakplåtspappret':77 'bland':30 'bunk':13 'c':48 'ca':40 'deg':24,60 'fin':94 'frall':62,79,92 'färg':95 'fått':93 'gall':99 'grädd':82 'het':57 'hop':7,20,31 'händ':68 'in':50 'jäs':33 'jäst':8 'kalljäst':1 'klick':58 'lät':32 'låt':96 'lös':23 'minut':89 'mitt':84 'mjöl':67 'morot':26 'morotsfrall':2 'natt':38 'plåt':52,73,81 'pà':46 'rumstemperatur':36 'rägmjöl':15 'rör':19 'salt':18 'skjut':75 'ställ':49 'svaln':97 'sätt':44 'ta':69 'till':91 'tillsät':14,25 'timm':42 'ugn':45,86 'varm':72 'vattnet':10 'vetemjöl':16 'visp':6 'äppl':4,28 'övertäck':34
49d79c70-f086-4339-b5c5-df189a86074f	2020-11-25 19:51:42.46462	2023-08-24 20:09:53.491402	Pico de gallo	Jonas Stenberg	4	portioner	0	0	\N		49d79c70-f086-4339-b5c5-df189a86074f.webp	\N	jonas@stenberg.io	'1':8 'bit':11 'bland':17,31 'ca':7 'cm':9 'finhack':35 'gallo':3 'gott':29 'grovhack':15 'hack':12 'halv':26,34 'koriand':16 'lim':27 'mango':36 'pico':1 'press':23 'salladslök':13 'skiv':4 'skål':21 'stor':10 'tomat':5 'tunt':14 'även':28
dd534f07-426c-4dcc-87e0-8174d44d03f7	2020-11-21 15:32:01.748489	2023-08-24 20:09:53.491402	Spaghetti och (veg)köttfärssås	Jonas Stenberg	4	portioner	0	0	\N		dd534f07-426c-4dcc-87e0-8174d44d03f7.webp	\N	jonas@stenberg.io	'0.5':13 'anammafärs':33 'basilikan':64 'bit':16 'bort':56 'burktomat':60 'bättr':71 'ca':12 'cm':14 'desto':68,70 'finhack':17 'fräs':19,35,44 'genomskin':30 'gullök':6,20 'hack':5 'köttfärssås':4 'längr':69 'låt':52,66 'lök':28 'minut':39,47,58 'moröt':8,22 'olivoljan':26 'pepp':83 'puttr':55,67 'rotselleri':10,24 'salt':81 'skiv':7 'smak':78 'spaghetti':1 'stor':15 'till':27 'tillsät':59,72 'tomatpur':42 'tork':63 'torrt':77 'vatt':73 'veg':3 'vinet':50 'vitlök':18,21 'vätskan':54 'ytterligg':37
8f4f0cd3-b2b8-4e78-8110-15459b651d18	2020-11-17 17:43:49.165456	2023-08-24 20:09:53.491402	Blåbärsgröt	Jonas Stenberg	2	portioner	5	5	\N		8f4f0cd3-b2b8-4e78-8110-15459b651d18.webp	\N	jonas@stenberg.io	'5':18 'blåbär':4 'blåbärsgröt':1 'cirk':17 'först':3 'grahamsgryn':11 'gärn':21 'hack':25 'hasselnöt':26 'honung':30 'klick':29 'kok':2,15 'kokosflak':24 'minut':19 'ner':9 'rost':23 'saltet':13 'server':20 'sock':7 'vatt':5
dd36e4c5-da23-408b-8f45-2b6a349ebddc	2020-11-16 20:50:47.924138	2023-08-24 20:09:53.491402	Vegköttbullar med grönpepparsås, pressgurka och rårörda lingon	Jonas Stenberg	4	portioner	0	0	\N		dd36e4c5-da23-408b-8f45-2b6a349ebddc.webp	\N	jonas@stenberg.io	'-2':233 '1':42,89,98,210,227,232 '1.5':206 '10':220 '2':39,45,49,184 '3':13 '30':30 '4':102 '500':229 'ägg':228 'än':88 'är':157 'ättik':41 'bar':119 'bit':114 'bland':11,205 'burk':57 'ca':29,101,219 'dl':43,90,207,211 'fat':21,248 'fär':231 'färg':137,271 'får':110,197 'fåt':136,268 'form':241 'fram':71 'frusn':73 'fryst':82 'funk':160 'g':230 'gäng':125 'gärn':111 'genomstek':266 'god':158,194 'gör':35,257 'gräd':149,191 'grovhack':123 'grovmaln':141 'grovriv':224 'grönpepp':142,173 'grönpepparkorn':106 'grönpepparsås':104 'grönpepparsås':3 'gullök':226 'gurk':10 'gurkan':54 'hack':51 'halvväg':143 'häll':32,59,147,182 'händ':254 'in':144 'innan':68,187 'kallt':251 'kastrull':133 'kinesisk':156 'kok':167,198,202 'konjak':186 'köttbull':204,243,258 'kross':105 'kryddmåt':14 'kvar':115 'lag':37,61 'lägg':19,53,245 'låt':27,63,95,166,217 'lingon':7,83 'lit':86,113 'lyx':179 'mal':239 'matfet':130 'medelhög':261 'mer':172 'mindr':87 'minst':65,97 'minut':31,221 'mjölk':208 'mortel':109 'msk':40,46,50,185 'när':255 'någr':77 'ner':12,85 'nog':161 'också':193 'öv':25,60 'paket':81 'på':145,148,183,246,253,260 'per':103 'persilj':52 'potatis':203 'pressgurk':4 'pulv':122 'rät':237 'rejält':269 'rör':84,93 'rårörd':6 'salt':15,175,235 'så':116 'sås':196 'servering':69 'skål':18,216 'skiva/mandolina/osthyvla':8 'skogschampinjon':126 'skvät':152 'smak':169 'sock':47,91 'soj':153 'spadet':34 'stå':28,64,96,218 'stek':128,259 'stekning':146 'stor':215,225 'ströbröd':212 'stund':201 'svartpepp':240 'ta':70 'temperatur':262 'till':134,263 'tillsät':222 'timm':67,78,99 'tin':76,79 'tip':249 'tsk':234 'tyck':155 'tyng':24 'vatt':44,252 'vegfärs':74 'vegköttbull':1 'vill':178
9bbf4e07-645f-44a4-88e2-ca7d23f31746	2022-12-29 17:35:36.149884	2023-08-24 20:09:53.491402	Stekta kroppkakor med svamp och hasselnötter	Jonas Stenberg	4	portioner	0	0	\N		9bbf4e07-645f-44a4-88e2-ca7d23f31746.webp	\N	jonas@stenberg.io	'1':29 '10':54 '2':44 'bland':24 'ca':53 'deg':35 'finhack':39 'fräs':41 'fyllning':36 'genom':15 'hasselnöt':6 'höj':56 'ihop':22 'jämn':34 'kok':9 'kroppkak':2 'kryddpepp':61 'lättsalt':12 'låg':48 'låt':19 'lök':40,42 'minut':55,68 'mjukn':52 'mjöl':27 'msk':45 'ner':70 'nött':71 'potatis':10,25 'potatispress':17 'press':14 'rör':69 'salt':31,63 'skal':7,37 'smör':46 'stek':65 'stekt':1 'svaln':20 'svamp':4,60 'till':50 'tillsät':59 'tsk':30,62 'vatt':13 'visp':21 'vtter':66 'värm':49,57 'ägg':26 'ägget':23
04ecefde-1b56-44df-9aef-401c9e48c34a	2023-08-04 11:15:45.48476	2023-08-24 20:14:33.252537	Amerikanska blåbärsmuffins	Ingmarie Stenberg	12	muffins	15	15	\N		04ecefde-1b56-44df-9aef-401c9e48c34a.webp	\N	jonas@stenberg.io	'15':46 '200':43 'amerikansk':1 'bakpulv':23 'bland':20 'blåbär':34 'blåbärsmuffin':2 'ca':45 'form':29 'fyll':28 'grädd':38 'mjöl':21 'mjölk':19 'pös':9 'rör':10,25 'sked':37 'smet':27,31 'smör':4 'sock':6 'taget':15 'tillsät':16 'tryck':32 'ugn':41 'vaniljsock':17 'visp':3 'vitt':7 'ägg':12
076be509-1a06-41b5-946a-31693a6a8079	2020-12-22 17:02:27.059205	2023-08-24 20:14:49.819859	Fisk i ugn	Ingmarie Stenberg	4	portioner	10	20	\N		076be509-1a06-41b5-946a-31693a6a8079.webp	\N	jonas@stenberg.io	'-3':13 '10':84 '2':12 '220':7 'annan':49 'behåll':40 'buljong':41,53 'börj':27 'ca':83 'citron':55 'cm':14 'dragon':58 'fisk':1,10,73 'fiskkryd':18 'form':39 'fräs':42 'grad':8 'gratiner':80 'grädd':60 'häll':70 'ihop':62 'kastrull':50 'kok':61 'kryddpepparkorn':20 'lit':76 'lägg':35 'minut':85 'mjölet':46 'ner':52,67 'ost':78 'plock':32 'potatismo':88 'precis':26 'press':54 'riv':77 'runt':30 'salt':15 'server':86 'sjud':9 'smör':43 'sätt':4 'sås':71 'ta':63 'till':24 'tillsamman':44 'traktörpan':23 'ugn':3,5,82 'ugnssäk':38 'vatt':16 'visp':51,66 'vit':29 'äggul':69
1312646e-45e1-407b-a46e-ed3b60bc1405	2020-11-17 17:55:13.522796	2023-08-24 20:15:31.669279	Knäckig rabarberpaj	Ingmarie Stenberg	1	paj	0	0	\N		1312646e-45e1-407b-a46e-ed3b60bc1405.webp	\N	jonas@stenberg.io	'-35':97 '175':6 '30':96 'annar':123 'ans':8 'bit':14 'bre':83 'bredvid':158 'bunk':18 'direk':67 'dropp':141 'eftersom':111 'foli':135 'fruktsaft':142 'färg':103,122 'få':128 'fått':102 'glass':153,157 'grad':7 'grädd':46,90,105 'hjälp':86 'häll':44,77 'in':42 'ingrediens':64 'kastrull':33,70 'knäck':1,130,147 'kok':55 'lit':35,134 'lägg':15,73 'låt':27,54,143 'mer':115 'mitt':92,110 'ner':68 'ordent':120 'ovanför':109 'paj':117,131,145 'pajform':43,76 'placer':133 'plattan':59 'potatismjöl':23 'rabarb':9 'rabarberbit':74 'rabarberpaj':2 'rest':62 'risker':124 'rör':24,51,71 'server':151,156 'sirap':48 'ska':118 'sked':89 'skär':11 'smet':66,81 'smält':29,38 'små':13 'smöret':30,39,50 'smörj':41 'sock':21 'steg':108 'stäng':57 'stå':28 'svaln':144,150 'sätt':3 'ta':34 'till':100 'tillsät':20,61 'tip':132 'ugn':4,94,113,137 'undervärm':116 'varm':80
0789d29d-8a27-496d-a4d1-c662200a6281	2022-12-29 12:52:59.448915	2023-08-24 20:17:14.087893	Mammas blåbärsbakelser	Ingmarie Stenberg	16	formar	0	0	\N		0789d29d-8a27-496d-a4d1-c662200a6281.webp	\N	jonas@stenberg.io	'0':69 '12':79 '16':31 '2':65 '225':75 '4':21,28 '5':70 'aluminiumform':53 'bakbord':41 'bit':36 'bland':3 'blåbärsbak':2 'bär':62 'ca':78 'deg':15 'degbit':50 'del':19,22,26,29,32 'elvisp':9 'frusn':61 'färsk':59 'grad':76 'grädd':73 'ingrediens':5 'lägg':51,57 'mamm':1 'minut':80 'mjöl':40,46 'msk':66,71 'ner':12 'platt':33 'potatismjöl':72 'rull':14,18 'rör':10 'sidan':47 'sock':67 'strö':63 'taget':38 'totalt':30 'tryck':54 'uppåt':48 'utom':6 'vänd':42,43 'ägget':7,13
a644a7d4-a57f-45ae-97d4-1ae39a0638a5	2022-12-29 12:40:19.597625	2023-08-24 20:17:14.087893	Mammas kardemummaskorpor	Ingmarie Stenberg	4	portioner	0	0	\N		a644a7d4-a57f-45ae-97d4-1ae39a0638a5.webp	\N	jonas@stenberg.io	'-250':21 '150':31 '225':20 '8':24 'bland':3,11 'bull':16,27 'ca':23 'del':26 'finfördel':8 'grad':22,32 'grädd':18 'gör':14 'ingrediens':6 'kardemummaskorp':2 'mamm':1 'minut':25 'mjölk':13 'rost':29 'små':15 'smöret':9 'torr':5
043263df-ef4d-4694-b989-8b01821706a2	2022-05-29 13:23:13.093179	2023-08-24 20:17:14.087893	Mammas dillkött	Ingmarie Stenberg	4	portioner	0	0	\N		043263df-ef4d-4694-b989-8b01821706a2.webp	\N	jonas@stenberg.io	'annan':68 'buljong':72 'citron':78 'dill':79 'dillköt':2 'eventuellt':91 'fortsät':29 'gryt':13 'grädd':81 'gör':64 'halv':51 'häll':22 'kastrull':69 'klyft':38 'kok':3 'kokt':103 'krydd':42 'köttet':5,59,98 'lägg':96 'låt':61 'lök':39 'mamm':1 'mer':27 'morotsbit':100 'moröt':40 'ner':93,97 'pannan':87 'potatis':104 'press':77 'salt':16 'saltet':24 'sen':43 'server':101 'sidan':55 'sil':70 'sjud':46 'ska':44 'skum':28 'skumm':14,30,34 'ställ':53 'svaln':62 'sås':65,83 'ta':57 'tag':19 'timm':52 'toppred':74 'täck':10 'vatt':7 'visp':92 'äggul':95
8ecc7ec6-54e8-466b-bd41-36d4a05539e7	2022-12-29 12:57:11.352181	2023-08-24 20:17:14.087893	Mammas äppelkaka i svampskogen	Ingmarie Stenberg	8	bitar	0	0	\N		8ecc7ec6-54e8-466b-bd41-36d4a05539e7.webp	\N	jonas@stenberg.io	'-40':24 '175':27 '30':23 'bland':5 'grad':28 'grädd':21 'ingrediens':7 'kanel':20 'lägg':9,13,16 'mamm':1 'minut':25 'pajform':12 'smörklick':18 'svampskog':4 'äppelkak':2 'äppelklyft':15
68bc2e69-483e-497d-b422-bb311f53de8b	2021-01-12 08:48:02.680444	2023-08-24 20:18:44.817448	Torsk med äggsås	Ingmarie Stenberg	4	portioner	0	0	\N		68bc2e69-483e-497d-b422-bb311f53de8b.webp	\N	jonas@stenberg.io	'1':37,44,59,89,125 '2':55 'bland':112 'bädd':133 'ca':20,36 'del':81,84 'dijonsenap':91 'dl':45 'dygn':22 'fräs':23,54,122 'genom':6 'gnid':8 'grädd':68 'gräddmjölk':66 'gullök':80 'halv':79 'hälft':67,69 'häll':39 'in':9 'kastrull':64,109 'klar':101 'kokt':141 'kyl':18 'lit':41,85 'lock':52 'låg':26 'låt':15,48 'lök':94 'mindr':42 'minut':38 'mjölk':70 'msk':56,60,126 'muskot':87 'nedåt':34 'nästan':99 'peppr':76 'persiljan':105 'potatis':142 'rimm':4 'riv':86 'runt':11,73 'rör':120 'salt':10,74,128 'server':129 'sidan':144 'skinnsidan':33 'smör':29,57,127 'spadet':114 'spen':136 'spenat':123 'spis':111 'stekt':135 'stå':16 'sås':96,118 'ta':92,107 'tillsät':65,77,102 'torsk':1,5,24,49,98,116,130,140 'traktörpan':32 'tsk':90 'två':83 'ur':95 'vatt':46 'vetemjöl':61 'visp':72 'värm':27 'ägg':103 'äggsås':3,138 'ångkok':50
69ff89cd-3722-4d25-b9f4-c6818ee7b531	2023-08-24 08:45:22.562168	2023-08-28 19:55:49.153178	Festsill	Jonas Stenberg	4	portioner	0	0	\N		eb580cc6-92e6-4fcd-8f25-aa2512f5517c.webp	\N	jonas@stenberg.io	\N
a7f351df-a980-49b4-b5b5-38d6f191a3b6	2023-08-04 12:31:16.591547	2023-08-26 13:30:47.474433	Inlagda gurkor	Ingmarie Stenberg	2	mellanstora glasburkar	0	0	\N		a7f351df-a980-49b4-b5b5-38d6f191a3b6.webp	\N	jonas@stenberg.io	'1':3 '10':46 '2':18 '3':29 '4':60 'behöv':66 'bland':30 'bort':88 'burk':28,64 'ca':45 'cm':15 'cm-stor':14 'dag':91 'del':12 'dillkron':21 'gurk':2,5 'gurkan':84 'gurkskiv':20,69 'gärn':76 'häll':61 'ibland':49 'ihop':31 'inlag':1 'innan':53 'kub':17 'lag':32,62 'lit':50 'lägg':75 'längr':51 'löst':40,58 'minut':47 'ner':83 'nog':6 'pepparrot':10,22 'potatis':79 'press':82 'rengjord':27 'rör':34 'saft':72 'salt':38,54 'senapsfrön':24 'själv':74 'skal':9,78 'skiv':8 'sock':36,56 'stor':16 'tar':44 'tas':86 'tid':52 'tvätt':4 'täck':68 'varv':19 'väl':26,42 'överst':80
44687753-8723-45cf-b025-c07fe64d1a05	2020-12-30 20:12:09.175593	2023-08-26 13:29:57.153231	Vit chokladmousse med lakrits	Jonas Stenberg	4	portioner	0	0	\N	Recept från boken ”Lakrits: godis, bakverk, desserter, mat & dryck” av Elisabeth Johansson. Fotograf: Helén Pe. Bonnier Fakta.	44687753-8723-45cf-b025-c07fe64d1a05.webp	\N	jonas@stenberg.io	'1':5 '100':102 '12':75 '15':168 '2':23 '20':169 '3':57 '4':77 '5':98 '6':121 '7':149 '8':190 'bakplåtspapp':162 'bakverk':11 'bok':8 'bonni':21 'brun':183 'bunk':33,56,65,80 'börj':181 'choklad':27,61 'chokladcookies':192 'chokladmouss':2 'citronsaft':107 'dessert':12 'dryck':14 'elisabeth':16 'elvisp':84,114 'engångsspritspås':152 'eventuellt':207 'fakt':22 'florsockret':136 'fotograf':18 'fram':79 'fyll':150 'färg':189 'fördel':93,195 'försvin':186 'garner':203 'godis':10 'grad':103 'grovt':193 'grädd':36,163 'gräddblandning':88 'hack':24 'hallon':205 'hallonpurén':148 'hast':112,127 'helén':19 'hälft':118 'häll':52 'håll':171 'in':141 'johansson':17 'kall':87 'kok':34 'koll':172 'kross':191 'kyl':72 'lakrit':4,9 'lakritsgranul':38,209 'lit':208 'luft':91 'lägg':29,199 'låt':46,69 'löst':44 'maräng':109,138,157,174,201 'mat':13 'minst':74 'minut':50,133,170 'mouss':92,94,198 'ner':54,117,135,147 'par':132 'pe':20 'plastfoli':67 'plåt':160 'portionsgl':97 'pulvret':42 'recept':6 'rest':123 'ros':188 'rör':58 'samt':206 'sikt':134 'skumm':110 'slickepot':145 'slutet':176 'smul':196 'smält':63 'små':96,156 'sockret':125 'sprits':154 'strösockret':120 'stå':70 'svaln':47 'sänk':111 'sätt':99 'ta':78 'till':41,60 'tillsät':122 'timm':76 'täck':64 'ugn':100,166 'visp':40,82,104,116,129 'vit':1,26 'vänd':140,146 'äggvit':105 'öka':126
24194bad-e62c-49a3-8e4b-3b8a35e8c724	2023-08-05 10:08:37.352644	2023-08-28 06:00:48.048344	Mommakakor	Ingmarie Stenberg	4	längder	0	0	\N		24194bad-e62c-49a3-8e4b-3b8a35e8c724.webp	\N	jonas@stenberg.io	'15':34 '200':31 '4':17 'bakplåtspapp':22 'bland':11 'ca':33 'deg':14 'dom':20,26 'fingr':28 'grad':32 'grädd':29 'gyllenbrun':40 'ingrediens':9 'jämn':13 'kak':38 'lägg':19 'läng':18 'minut':35 'mommakak':1 'poröst':6 'rull':15 'rör':2 'skär':41 'smör':5 'sock':3 'storlek':45 'till':37 'tillsät':7 'tryck':24 'önsk':47 'övr':8
4a3133ca-f9ca-46f6-aa88-071dafca2e0e	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	Ugnsbakade rotfrukter med ostcreme och stekt halloumi	Elin Pennegård	4	portioner	0	0	\N			\N	jonas@stenberg.io	\N
\.


--
-- TOC entry 3413 (class 0 OID 19306)
-- Dependencies: 214
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (id, date_published, date_modified, recipe_id, name, measurement, quantity, owner) FROM stdin;
0728a381-9914-444a-a2b5-952ef861e967	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	salt			jonas@stenberg.io
4bf0bb2a-288a-427b-8cbb-0dfba414601a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	gul lök		1	jonas@stenberg.io
f93fbd2b-c23f-4b71-b5cb-65c413905174	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	trattkantareller eller kantareller	dl	4	jonas@stenberg.io
ca486252-033f-491f-b544-e1f3f626c6af	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	mortlad kryddpeppar	tsk	0.5	jonas@stenberg.io
07e562fd-b59f-4f43-8b7b-117db3862f4e	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	grovhackade hasselnötter	dl	0.5	jonas@stenberg.io
d1c10a2d-a0ac-40ec-b5de-24e4b65a0601	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Lax			jonas@stenberg.io
32e53c4a-3797-40ad-a3c4-936a51188c8c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Pepparrotscreme			jonas@stenberg.io
277ffb04-9d30-4af2-9906-8566777988e3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Potatis			jonas@stenberg.io
b6870fd6-5e40-46eb-9d92-eca68446ea41	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	# Sötpotatisbiffar			jonas@stenberg.io
8db97509-2c98-47a6-ad62-115646f5fd61	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	# Tzatziki			jonas@stenberg.io
f294cc86-9446-4ebb-b0c9-4c618a2d486d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	# Bönsallad			jonas@stenberg.io
7c7fcd0c-01ba-4a15-8597-1b6eedc55681	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	#Till 4-5 personer:			jonas@stenberg.io
0704e81c-e646-4716-b084-fd7d33802fdb	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	laxfileér eller 500g laxsida		4	jonas@stenberg.io
0cdfb281-4037-4219-adb8-dac82b8b16df	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	philadelphiaost eller liknande	pkt	1	jonas@stenberg.io
81fb02a6-bfc2-4b8f-b82a-edd2b40ec2ea	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	finriven pepparrot	msk	2.5	jonas@stenberg.io
61ea5985-9efd-44d8-816b-84d711556393	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	salt	tsk	1	jonas@stenberg.io
c1338719-4ada-4127-9fa6-1ceee8411fe2	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	svartpeppar	krm	1	jonas@stenberg.io
03b60732-51c2-4222-98ac-44e1a74f0dcd	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	fast potatis	g	500	jonas@stenberg.io
11a5f41a-74f5-40e8-a264-2f6a552f4b67	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	olivolja	dl	0.5	jonas@stenberg.io
0d92b7e6-a3b7-4482-9712-5e1128cb4f47	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	salt	tsk	1	jonas@stenberg.io
340a82c0-2fd0-4c95-9a33-7fa0e2a82f30	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	svartpeppar	krm	1	jonas@stenberg.io
b6c3bda1-6a6f-4b36-b4d3-a46e8e18d192	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	sötpotatis	g	700	jonas@stenberg.io
bb1e5765-692f-43a3-817b-5941a90c3b59	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	ägg		3	jonas@stenberg.io
358eab5c-bf89-4ee4-83a8-af0b45f2797e	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	havremjöl	dl	3	jonas@stenberg.io
eb52d1a8-18bd-48ac-b6d0-a3e1fd1c4eb3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	salt	tsk	1.5	jonas@stenberg.io
9edda102-f9cd-493b-aaed-38cedf2a295c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	peppar	krm	2	jonas@stenberg.io
0b9bdb43-c90c-42e1-a913-150b1226535c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	spiskummin	tsk	1.5	jonas@stenberg.io
08e81378-802c-46fa-9116-83fa5d091ef3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	starkt paprikapulver	tsk	2	jonas@stenberg.io
c5b0eff7-fee5-493d-a183-5a25890f8488	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	rapsolja	msk	2	jonas@stenberg.io
8841ea29-a343-4dae-a8cf-26698ab751bb	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	gurka		1	jonas@stenberg.io
573fa33a-3081-4363-a01e-4e4ed2926c7b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	matyoghurt	dl	2	jonas@stenberg.io
7b34166d-4123-454a-b45b-3f14bee02f8a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	salt			jonas@stenberg.io
f9d68261-d482-4d7f-b0b9-3f246a8f5a7f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	peppar			jonas@stenberg.io
37a2e522-4cdf-4998-a565-e49d723a71b9	2023-08-18 07:52:50.043752	2023-08-20 19:09:53.419641	8f4f0cd3-b2b8-4e78-8110-15459b651d18	blåbär	dl	1.5	jonas@stenberg.io
3e09ce65-70b8-42f0-bb11-50dd355aca05	2023-08-18 07:52:50.043752	2023-08-20 19:09:53.419641	8f4f0cd3-b2b8-4e78-8110-15459b651d18	socker	msk	1	jonas@stenberg.io
293eb809-b7dc-47d4-a1dd-d9374bfa5ce9	2023-08-18 07:52:50.043752	2023-08-20 19:09:53.419641	8f4f0cd3-b2b8-4e78-8110-15459b651d18	vatten	dl	2	jonas@stenberg.io
a843ceb4-b9e6-4e50-8ac1-a7a7f72b6d7c	2023-08-18 07:52:50.043752	2023-08-20 19:09:53.419641	8f4f0cd3-b2b8-4e78-8110-15459b651d18	grahamsgryn	dl	1	jonas@stenberg.io
6a91b65e-5c97-4c4f-a26a-ea3bed008405	2023-08-18 07:52:50.043752	2023-08-20 19:09:53.419641	8f4f0cd3-b2b8-4e78-8110-15459b651d18	salt	kryddmått	1	jonas@stenberg.io
43693931-b9f5-46e4-940c-d99abc6531ce	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	vitlöksklyfta		1	jonas@stenberg.io
fff0393b-516b-4844-b98b-c0e361a196e8	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	burkar med bönmix		2	jonas@stenberg.io
77084adb-3dfb-4a05-b5ce-91fc2c25ce0a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	körsbärstomater	g	250	jonas@stenberg.io
0367dc84-4ba6-44f3-a7a9-d1ce188d7fee	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	påse salladslök (à 125 g)		0.5	jonas@stenberg.io
e91440d8-e5b0-4926-8397-3035b4d4ef25	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	citron		0.5	jonas@stenberg.io
4ebca37b-c6cc-454d-9c69-ea913ccba794	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49bd57fd-c569-43cf-b69c-0bc1371ce407	rapsolja	msk	1	jonas@stenberg.io
5871f4c2-8e88-47b6-8bbd-de3e91b0fe67	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	socker	dl	1.5	jonas@stenberg.io
56aba4e3-204b-4b3a-924f-751e0660a571	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	vetemjöl	dl	7	jonas@stenberg.io
d41a730f-949e-4891-9f12-0d36f44c04d9	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	bakpulver	tsk	3	jonas@stenberg.io
ce5d6f05-700e-4718-893b-d9021e0e8e35	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	kardemumma	tsk	1	jonas@stenberg.io
65061c58-42d0-40aa-a665-bb9057413a21	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	smör	g	150	jonas@stenberg.io
3f9f9942-d9fc-4a9e-8d3e-8cd81d4ac278	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	mjölk	dl	1.5	jonas@stenberg.io
1b0f86d4-9e17-4a35-8ee0-480a09eb17b1	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	gös eller torsk, eller bara 600 g laxfilé utan skinn (eller lite av varje)	g	800	jonas@stenberg.io
05bb6f97-9ad8-46a8-a3ba-e06e1e37e8ca	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	gullökar	st	2	jonas@stenberg.io
295d7fd8-092f-4ff5-85ef-e109df7ab844	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	vitlöksklyftor		3	jonas@stenberg.io
947a9567-5334-4587-90c0-958ce9a8d567	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	medelstora potatisar	st	8	jonas@stenberg.io
64caaaa4-905d-409a-b57c-dfb18fa29a2b	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	smör	msk	2	jonas@stenberg.io
9fbb1ceb-8276-431c-b3ac-715cc284ae97	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	vetemjöl	msk	1	jonas@stenberg.io
e28e0583-d06e-4eac-beef-7390d6a65788	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	grädde	dl	1	jonas@stenberg.io
9c4d0cb0-3568-4976-b377-06360962f2a7	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	mjölk	dl	2	jonas@stenberg.io
c5495550-9917-49c7-930d-27e156353fca	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	finhackad dill	dl	1	jonas@stenberg.io
b8106020-c191-4fa5-8653-49f759856c8c	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	muskotnöt			jonas@stenberg.io
3935d500-55d7-46b5-947e-198b2b3ef950	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	Salt och peppar			jonas@stenberg.io
51cab49c-d54b-4ea2-8650-96bb2b94bcd4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	morötter i slantar		2	jonas@stenberg.io
efd0b810-7fa0-4daa-a9e7-c2cb0c4d60df	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	fasta potatisar		5	jonas@stenberg.io
4a337c08-ed34-459c-a60a-2dbacfec7be6	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	fänkål		0.5	jonas@stenberg.io
1f1bb4d2-e181-4be8-b8fc-b02a31a6169b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	tomater		5	jonas@stenberg.io
7361840c-d0d8-4329-b5db-0fadb9773fb4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	olivolja	msk	2	jonas@stenberg.io
9109af7a-7d78-40eb-a381-89d8495d927c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	saffran	kuvert	1	jonas@stenberg.io
89181ab0-fd95-477a-932f-2685d24cd964	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	torkad timjan	tsk	2	jonas@stenberg.io
418ed952-625b-4eae-b838-b9cdc97150a1	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	cayennepeppar	kryddmått	1	jonas@stenberg.io
65b79ba0-866b-4029-9035-0ff54f866992	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	rosmarin	tsk	1	jonas@stenberg.io
6d9d3202-40b4-4e26-b91c-da0b6ca739e4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	salt	tsk	2	jonas@stenberg.io
dc967d2c-c140-4b9f-ab92-fe6b6b1cd672	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	svartpeppar efter smak			jonas@stenberg.io
a37ea577-7d87-4860-b496-a29afa526e53	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	vatten	liter	1.2	jonas@stenberg.io
09b8a4b3-d2c8-444a-808a-357ab9843849	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	torrt vitt vin	dl	2	jonas@stenberg.io
b9523ba8-e2f9-4521-aa3b-5ff6e029e22e	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	hummerfond	msk	2.5	jonas@stenberg.io
7861f9d4-d739-4204-9030-5332f5e7dfb1	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	fiskbuljongtärning		1	jonas@stenberg.io
43d4eabd-7535-4ac1-ba0b-29f43fb932a2	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	creme fraiche till servering	dl	2	jonas@stenberg.io
fc5bf143-6c04-4f94-9dcd-1cc6cc48e811	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fc52748c-181d-4c2b-916b-08332cdcb473	bröd			jonas@stenberg.io
448d8d00-f121-4682-addd-9761d7d43c2f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	b844bebc-62e6-43d8-92f3-af8033543f16	potatis	kg	1	jonas@stenberg.io
bfa08797-b320-4e9a-a85f-3e57b05edf01	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	b844bebc-62e6-43d8-92f3-af8033543f16	morötter		5	jonas@stenberg.io
ac1ac0a0-3c47-4b32-8ad7-dd4a3113ece0	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	b844bebc-62e6-43d8-92f3-af8033543f16	kålrot		1	jonas@stenberg.io
02cc919b-b912-4f3d-b5df-9b6d06fa720f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	b844bebc-62e6-43d8-92f3-af8033543f16	palsternacka		1	jonas@stenberg.io
0914cfa1-e5ab-40d5-81f4-861be6a30d35	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	b844bebc-62e6-43d8-92f3-af8033543f16	Olivolja			jonas@stenberg.io
65424d53-ec54-44dd-8f86-3599a6832323	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	b844bebc-62e6-43d8-92f3-af8033543f16	Inlagda rödbetor			jonas@stenberg.io
d2dfe922-3499-4e53-8ef2-4e6dd2171bc3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	b844bebc-62e6-43d8-92f3-af8033543f16	Ägg			jonas@stenberg.io
5d0b42df-06f6-4acd-9915-90ac83797919	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	b844bebc-62e6-43d8-92f3-af8033543f16	Salt			jonas@stenberg.io
2e0e7fb9-a273-449f-a6e8-bd9d7bc55497	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	b844bebc-62e6-43d8-92f3-af8033543f16	Peppar			jonas@stenberg.io
70f8d296-27a9-4fb6-a068-cd6cb1fc9b6b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	# Pesto			jonas@stenberg.io
f010511c-cc96-4207-9375-2e0050023782	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49d79c70-f086-4339-b5c5-df189a86074f	#Till 4 personer:			jonas@stenberg.io
d7f483dd-a36a-46c7-a014-ead9bb729b22	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	#Topping			jonas@stenberg.io
e6272baf-31d6-4df2-a38c-a970d6623601	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	#Toppingar, förslag			jonas@stenberg.io
7dfb35f7-9f10-4c62-8b5a-0962fe2d5a32	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Pressgurka			jonas@stenberg.io
bbd8f4d5-c97f-4337-8601-a57454c27b5e	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Rårörda lingon			jonas@stenberg.io
cc12ce07-0fba-4414-aaf2-b62e7bc265da	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Grönpepparsås			jonas@stenberg.io
7062a6b0-2bce-4785-899a-bd07fa3ffb41	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Köttbullar			jonas@stenberg.io
3c2192fe-75a0-4cc0-988d-6e562a694fda	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	Quinoa till 4 personer			jonas@stenberg.io
b3d09136-4a8d-46cf-8eac-53c77dfc679a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	bladspenat	pkt	1	jonas@stenberg.io
2cce12e0-27a2-4a2a-87b2-0c454782c52c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	fetaost	pkt	1	jonas@stenberg.io
a895de6c-287c-4fa6-a675-d855a0a8b3da	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	basilika	kruka	1	jonas@stenberg.io
e57ef913-6aff-4705-89e0-6f4bfa17212a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	solrosfrön, mandel, pinjenötter, valnötter (använd det du har)	dl	1	jonas@stenberg.io
6785bca1-6901-4049-95c0-3afd0e2af7e1	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	riven parmesan	dl	2	jonas@stenberg.io
e4f59045-e065-41a9-b9a1-1d2e83223acd	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	vitlöksklyftor		1.5	jonas@stenberg.io
49376c95-f223-4fed-9633-74b413da6427	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	olivolja	dl	2	jonas@stenberg.io
e246e79f-2c71-4600-9672-9a7e65bdec4d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	salt och peppar			jonas@stenberg.io
d70a886c-822b-4c5f-94d7-75c0bb058f70	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49d79c70-f086-4339-b5c5-df189a86074f	mellanstora tomater		6	jonas@stenberg.io
5aee77c2-4471-41c7-8407-bd66355ba79b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49d79c70-f086-4339-b5c5-df189a86074f	salladslökar		3	jonas@stenberg.io
489d502d-077d-4727-82f0-2df5321ec447	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49d79c70-f086-4339-b5c5-df189a86074f	lime		0.5	jonas@stenberg.io
4e9d9c77-5abc-459f-a8ef-3904c35291f4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49d79c70-f086-4339-b5c5-df189a86074f	chili flakes	tsk	1	jonas@stenberg.io
f68a7909-24ac-4318-9ebf-861b8e17f45f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49d79c70-f086-4339-b5c5-df189a86074f	Blad från 1 kruka koriander			jonas@stenberg.io
60f5c962-767a-4e3d-bc00-1810532bf6c3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	49d79c70-f086-4339-b5c5-df189a86074f	( mango)		0.5	jonas@stenberg.io
495ad67c-b7e8-463b-9a61-ad40c4892959	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	morötter, i stavar	kg	1	jonas@stenberg.io
a3065bc4-eeb9-4d8e-a250-619e365866c6	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	vatten	dl	9	jonas@stenberg.io
1de65433-77a8-4fd9-9fcd-08ef8d5e1cc1	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	syrad grädde	dl	3	jonas@stenberg.io
d774ceba-905d-40ac-867c-bd5a62d811ad	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	grönsaksbuljongtärningar		2	jonas@stenberg.io
2381ebac-dea5-46ee-92f6-d54a064e90e4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	spiskummin	tsk	1	jonas@stenberg.io
e1823714-1aa1-4de1-9478-3a703bd44908	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	curry	tsk	1.5	jonas@stenberg.io
8889b6b7-949c-4610-949e-9abb949d4885	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	citron, saft		0.5	jonas@stenberg.io
224278c7-2776-42eb-b0b9-18fc15eb60fe	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	rapsolja, till stekning			jonas@stenberg.io
97c9de2d-4a5f-4123-9b63-90bab13c97d5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	små yoghurtbollar, alternativt 75 g smulad fetaost		8	jonas@stenberg.io
fca1eca3-6d3e-46d5-b7b0-37ee53a7e192	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	granatäpple, kärnor		0.5	jonas@stenberg.io
c5efbd6a-56fb-4c5f-8da2-36e512786248	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	litet knippe färsk dill		1	jonas@stenberg.io
da9d568a-57a5-4eb0-8edd-9eb8c06f7590	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	salta pistagenötter, grovhackade	dl	1	jonas@stenberg.io
b3fef9bf-b01a-4ad6-b919-0b2bd68eb246	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	god valfri olja, att toppa med	tsk	2.5	jonas@stenberg.io
c693993f-dfd0-4a9b-8ed3-a8863850bed2	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	burkar finkrossade tomater à 400 g		2	jonas@stenberg.io
246b6d17-bba1-4809-9ba6-30d0908ab95c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	vitlöksklyftor, finhackade		2	jonas@stenberg.io
58266375-496f-4e03-8f6b-6aa94432672a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	grönsaksbuljongtärning		1	jonas@stenberg.io
7e55de2b-23ad-4cf7-9832-514eb4eb618d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	soltorkade tomater i olja, finhackade		10	jonas@stenberg.io
1082f30d-915b-46d3-8f16-a07c29feab86	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	torkad timjan	tsk	2.5	jonas@stenberg.io
acf98676-ae5d-4ae0-9768-4eb9cf8f70ac	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	balsamvinäger	tsk	2	jonas@stenberg.io
b388023e-e874-41c4-96b2-8825a5e3794c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	flytande honung eller 1 nypa strösocker	tsk	1	jonas@stenberg.io
e67a9616-bd51-471e-8855-8406fcde0a0f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	liten nypa chiliflakes		1	jonas@stenberg.io
6095847b-6aea-432d-b588-eea6d53cc7d3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	havregrädde eller crème fraiche	dl	2.5	jonas@stenberg.io
cc66b689-b268-43ce-bd4f-18282e2e8ee4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	vatten, till spädning	dl	2.5	jonas@stenberg.io
a631766c-4c82-4349-aa78-bd533854d276	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	salt och svartpeppar			jonas@stenberg.io
9b577bce-23c0-4a63-a146-9d650c4474b3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	matvete, kokt	dl	2	jonas@stenberg.io
10702591-4f8c-469d-af18-b8688b3cbd0d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	rostade solroskärnor	msk	1	jonas@stenberg.io
d4983466-3662-406f-aaab-d903685b8f3a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	krutonger			jonas@stenberg.io
69adb787-3c40-4d40-9d24-79fe2d1335f8	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	svarta och/eller vita sesamfrön			jonas@stenberg.io
2d3cbbd6-4815-48c3-bde2-0c6fb194e1d6	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	smulad fetaost			jonas@stenberg.io
d85068e7-2881-4133-b0a2-f31997ce9d98	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	a27b18c2-7351-4818-bb33-c1387e76e307	extra chiliflakes			jonas@stenberg.io
bc4202ea-daf4-495d-98ab-cf3438cb7fc0	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	gurka		1	jonas@stenberg.io
fc4a291b-0e35-434a-b664-88935e98699a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	ättika	msk	2	jonas@stenberg.io
25200228-fe2b-4f90-b0cd-10d3c0366ead	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	socker	msk	2	jonas@stenberg.io
42a43875-50f0-48ba-809c-da9b41e6962a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	hackad persilja	msk	2	jonas@stenberg.io
946bd360-466e-439f-b3a9-4352168c1a00	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	lingon	g	250	jonas@stenberg.io
d38fb000-c2c7-4a2a-9ea7-b8232c81bd44	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	socker	dl	1	jonas@stenberg.io
0a79ea4b-7ecc-4092-854f-fb3f235f0878	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	vispgrädde	dl	3	jonas@stenberg.io
fd6c083a-0952-4288-a0e9-672f6e590e8c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	skogschampinjoner		10	jonas@stenberg.io
ca24483e-d81f-4a90-b473-abf22402db2f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	grönpepparkorn (minst)		20	jonas@stenberg.io
3c7f04ae-2457-4bc2-a5c7-051bd2a3ee4d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	kinesisk soja	tsk	1.5	jonas@stenberg.io
e7e171b1-5593-44ce-b1e8-35bb0df40290	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	formbar färs från Anamma	g	500	jonas@stenberg.io
e03a5da0-93bb-414d-ab67-7b1d28391324	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	mjölk	dl	1.5	jonas@stenberg.io
d4aaee4b-5bdd-480e-8ff5-9aef360c3702	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	ströbröd	dl	1	jonas@stenberg.io
de280c25-5a26-42ee-a5e2-2af3e117bb9d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	gullök		1	jonas@stenberg.io
9e54388b-c6f9-4c6a-8b2e-3348a4de3339	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	ägg		1	jonas@stenberg.io
f15cb09b-8d45-4f16-88c1-5554950e2f3c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	svartpeppar			jonas@stenberg.io
4a2247be-d38c-4f17-bd78-6f80bff4fa10	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Tillbehör			jonas@stenberg.io
7d77768e-9b6d-464d-822e-b3e7cbf3bd1d	2023-08-09 18:06:48.469823	2023-08-20 19:09:53.419641	234950c8-2db3-4aa6-9bfa-20c38b52af85	riven parmesan	dl	2	jonas@stenberg.io
c497508c-e719-4c7a-9299-50267b23d203	2023-08-09 18:06:48.469823	2023-08-20 19:09:53.419641	234950c8-2db3-4aa6-9bfa-20c38b52af85	dl olivolja	dl	1.5	jonas@stenberg.io
9ba80f76-7100-4e66-948a-fa5e7c301034	2023-08-09 18:06:48.469823	2023-08-20 19:09:53.419641	234950c8-2db3-4aa6-9bfa-20c38b52af85	vitlöksklyftor		1	jonas@stenberg.io
bc392cef-2f3c-476b-92af-d7df1061a632	2023-08-09 18:06:48.469823	2023-08-20 19:09:53.419641	234950c8-2db3-4aa6-9bfa-20c38b52af85	solroskärnor, mandlar, pinjenötter eller valnötter	dl	1	jonas@stenberg.io
8ecee1b8-c692-47ad-9064-1acf7aa2b0cb	2023-08-09 18:06:48.469823	2023-08-20 19:09:53.419641	234950c8-2db3-4aa6-9bfa-20c38b52af85	honung	tsk	0.5	jonas@stenberg.io
9009e0ab-764e-4890-9008-e016719e05cf	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Potatis			jonas@stenberg.io
09fcc20b-df34-4db9-8085-eaab194f1d23	2023-08-09 18:06:48.469823	2023-08-20 19:09:53.419641	234950c8-2db3-4aa6-9bfa-20c38b52af85	Grönkål			jonas@stenberg.io
5b48891a-d9a1-4d1c-93bc-35edca58309b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	linfrön	dl	2.5	jonas@stenberg.io
044055f9-4202-459d-92ae-091eafaee0da	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	sesamfrön	dl	0.5	jonas@stenberg.io
38c3bac9-aeab-4e44-baac-049af6137b72	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	pumpafrön	dl	1	jonas@stenberg.io
600c051d-c8b4-4610-b2ad-ba8d0d073bef	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	solrosfrön	dl	1	jonas@stenberg.io
4498d12a-053e-4f8d-864d-93a804729f62	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	vatten	dl	3.5	jonas@stenberg.io
f20a7f38-587d-48ba-839b-67522316be83	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	havssalt	msk	1	jonas@stenberg.io
d846f64a-ea0e-4ef4-bc83-1c99514498d9	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	rabarber	kg	1	jonas@stenberg.io
a4aa84a3-ae0d-4094-b28b-278eb42c4be7	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	citron(er)	st	1	jonas@stenberg.io
472aaa59-06c5-4f3e-9d8e-1ca59b849fd8	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	apelsin(er)	st	1	jonas@stenberg.io
17b3cd42-aeaa-4d97-a189-0bcfac8bdd72	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	socker, (ca 11 dl)	kg	1	jonas@stenberg.io
8c5a3833-a08d-42f8-8f4c-826bf61deb6f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	ingefära, mald	msk	1	jonas@stenberg.io
a41dfde6-afcd-41fb-abca-518f373def78	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dbecf460-5460-40c4-89a4-d7d704148456	smör	g	100	jonas@stenberg.io
8897572b-b98e-45e6-957b-d605631c59f4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dbecf460-5460-40c4-89a4-d7d704148456	socker	g	100	jonas@stenberg.io
0a707d72-3322-47a8-a164-88af03b0c2ce	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dbecf460-5460-40c4-89a4-d7d704148456	sirap	msk	1	jonas@stenberg.io
95870fde-bda8-454d-abce-c008384f11c5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dbecf460-5460-40c4-89a4-d7d704148456	grädde	dl	0.5	jonas@stenberg.io
6f134792-584d-4e5d-8f91-5e9beb6a2e1c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dbecf460-5460-40c4-89a4-d7d704148456	kanel	tsk	1	jonas@stenberg.io
d7227e07-5e1a-4807-88dc-789ee2d54e0c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dbecf460-5460-40c4-89a4-d7d704148456	nejlikor			jonas@stenberg.io
b24b837a-a9e5-421b-b5ca-affb28899df1	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dbecf460-5460-40c4-89a4-d7d704148456	ingefära			jonas@stenberg.io
0f3a6595-1817-4de1-8010-8c033b190945	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dbecf460-5460-40c4-89a4-d7d704148456	bikarbonat			jonas@stenberg.io
d197cd37-5b09-4802-9779-ea5cae214688	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dbecf460-5460-40c4-89a4-d7d704148456	vetemjöl (ska också användas till utbakningen)	g	250	jonas@stenberg.io
bfb397f0-b6a8-4848-ac0b-1ea377440f3a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	# Hummus			jonas@stenberg.io
e512c22d-4912-4889-93dd-a7617ee8a340	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	# Tabbouleh			jonas@stenberg.io
e2b41e42-ef53-4a87-8128-7f778bd07325	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	# Potatispuré			jonas@stenberg.io
37db53c9-e44c-494d-bf8f-5dbc93c83c3c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	Halloumi			jonas@stenberg.io
167c28b6-c28d-4acf-aa0e-5b6a15867c12	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	vitlöksklyfta		1	jonas@stenberg.io
b39a7c0a-78b8-40cc-8a0b-79921812ce5f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	burk kikärter		1	jonas@stenberg.io
17e67dd9-e62d-4d34-81a7-9f851b4922c0	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	chilifrukt		1	jonas@stenberg.io
1586b395-bb67-4ece-9af1-a00fbcbbe17e	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	spiskummin	tsk	1	jonas@stenberg.io
db9ade6f-5862-4878-ba24-9cdda3fd5236	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	olivolja	msk	3	jonas@stenberg.io
3ddaeda6-4b9e-4893-b990-7630d0811a64	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	tahini (sesampaste)	msk	2	jonas@stenberg.io
e632f201-c5ce-4698-a7c8-91f05921d556	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	salt och peppar			jonas@stenberg.io
63f2544e-daf1-4c9c-9d14-594730051ba9	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	bulgur	dl	1	jonas@stenberg.io
a2ddb20d-3dec-4df2-b74f-3756fc8296fd	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	hackad persilja	dl	2	jonas@stenberg.io
c8ee1382-0ee6-471d-89a8-51e6c4d4f21a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	gul lök		1	jonas@stenberg.io
31b61476-925f-4384-a97d-5a7c2aa2babc	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	tomater		3	jonas@stenberg.io
282e09b2-24b9-48c0-8fb0-fe8ad92e20e0	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	färskpressad citronjuice	msk	2	jonas@stenberg.io
eea925db-20db-4159-8444-8ce8b9ed1832	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	olivolja	dl	1	jonas@stenberg.io
89e8fb7a-6c0d-41c7-b990-e85aac84e031	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	salt	tsk	1	jonas@stenberg.io
3f2c2ecd-b626-48f7-bf56-8887c29cfda2	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	peppar	krm	2	jonas@stenberg.io
514ba50a-521c-4fe0-9fdc-6b55c5c1c4da	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	avokado		1.5	jonas@stenberg.io
8029e60c-7ca4-423c-aa53-b9be9c6f45ac	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	laxfilé utan skinn	g	250	jonas@stenberg.io
755018cb-d432-4616-9f37-09b957523cad	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	torskfilé eller annan	g	250	jonas@stenberg.io
1503d1ad-473d-47e2-8250-11599537e253	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	vit fisk utan skinn			jonas@stenberg.io
e9544110-76fc-4c27-af76-5706bb845a76	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	vitpeppar	krm	1	jonas@stenberg.io
426c98e7-4118-4391-8c63-73e047d709f7	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	dI vispgrädde		4	jonas@stenberg.io
5a01bd84-7f76-4e09-ade4-cd8ff180def3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	ströbröd eller panko	dl	2	jonas@stenberg.io
173eea21-3561-467e-aa25-b95e30ace0bc	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	rapsolja, smör			jonas@stenberg.io
67f68338-9919-4cdf-835a-7b5d69ddaa79	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	salt			jonas@stenberg.io
769d54f8-2e5a-40f3-aafc-7e3a90a2ddc8	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	rärörda lingon, kokta			jonas@stenberg.io
347a60be-3320-44e9-9ce6-e54e53eff752	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	gröna ärtor och citron.			jonas@stenberg.io
d176e439-c813-456c-8bab-f88c1e22cd20	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	klyftor till servering			jonas@stenberg.io
e38de14d-c596-446c-bc8a-d57adf165f4d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	mjölig potatis	g	900	jonas@stenberg.io
b606aab3-3183-4077-9f8e-a79b69e314ca	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	mjölk	dl	1.5	jonas@stenberg.io
ec46b1cb-f0f3-48cb-bec9-bffa124fcb4e	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	vispgrädde	dl	1.5	jonas@stenberg.io
a26aebeb-def3-470a-a5f0-cfc75c8b3a00	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	smör	msk	3	jonas@stenberg.io
e4cd7899-c7e2-42b4-830d-998110599fe7	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	cm riven ingefära		2	jonas@stenberg.io
244371a0-4435-434f-b5de-39f2e33ad8a1	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	stor morot	st	1	jonas@stenberg.io
fcb44312-99b0-43d8-9d59-c6cc76634a23	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	gul lök	st	1	jonas@stenberg.io
5dbd7584-2544-43b1-884c-b59a1af706d9	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	# Tortillachips			jonas@stenberg.io
ea90c729-b0ce-40cb-8e72-b042b1b755df	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	# Till servering			jonas@stenberg.io
83767541-5151-4363-a3ef-6bf60d3d0b7d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	# 6 portioner			jonas@stenberg.io
8385183b-3529-48c1-8a73-47a8d57edf9c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	# Brynt smör			jonas@stenberg.io
7659b7ee-4b7e-49e0-ac3d-7b3c8aaa35be	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	# Potatispuré			jonas@stenberg.io
4064f48d-8fa5-4ba4-a437-ec6110f4da9d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	stor sötpotatis		1	jonas@stenberg.io
dda356e6-f551-4a21-8952-6af020f7a971	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	ml kokosmjölk		400	jonas@stenberg.io
8d31c85b-0f00-4f72-9137-e34d48c3ef04	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	spenat	pkt	1	jonas@stenberg.io
89c0aca5-3839-4b2d-a93f-cdaba9e06f60	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	röda linser	dl	1	jonas@stenberg.io
d655dcf7-c563-4e88-80cd-7e79ebcf7c60	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	belugalinser	dl	1	jonas@stenberg.io
d8687f98-97a8-4420-ab90-98cc81b7a584	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	citron	st	0.25	jonas@stenberg.io
61afe38c-4c80-435b-bc37-a4a3a7f7b7c0	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	garam masala	tsk	2	jonas@stenberg.io
8ee002e4-2e1b-43d9-b0c9-cc9dd4236920	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	curry	tsk	2	jonas@stenberg.io
c3aca8a8-1f09-4674-b7f9-f4a54b6135dd	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	grönsaksbuljongpulver	msk	1	jonas@stenberg.io
094fbd46-3c98-460d-823d-93f3966566cc	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Olivolja			jonas@stenberg.io
766cc011-6009-455a-a2f2-a595b8376782	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Tortillabröd			jonas@stenberg.io
5c86cdb7-5ee1-40b3-9908-37aadf3f917d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Olivolja			jonas@stenberg.io
c1f078c1-053e-4984-8119-ff428a5ca49d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Koriander			jonas@stenberg.io
7a1d0e99-5eda-45ef-89dd-ec561d6e7163	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Yoghurt			jonas@stenberg.io
457ec09c-3272-4215-9901-0ddbc970102a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	vispgrädde	dl	5	jonas@stenberg.io
b7b3dd15-f735-4b88-bf51-f820c2bcf368	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	strösocker	dl	1.5	jonas@stenberg.io
113e0f0b-14c0-426e-b1a1-01f37ff354fa	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	12905e60-8310-45f0-8507-ad5334662b3a	smör	g	150	jonas@stenberg.io
9ebe260e-1fa9-40a1-86be-f93e67915a95	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	12905e60-8310-45f0-8507-ad5334662b3a	socker	dl	1	jonas@stenberg.io
dae8403e-957c-4107-957e-366f9c25707c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	12905e60-8310-45f0-8507-ad5334662b3a	bittermandlar		2	jonas@stenberg.io
6752bfa8-a979-4453-b844-55c3c1d6ad19	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	12905e60-8310-45f0-8507-ad5334662b3a	skorpmjöl	dl	2	jonas@stenberg.io
9afd97ce-b702-4d17-9a71-8b88a0fa1fe0	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	12905e60-8310-45f0-8507-ad5334662b3a	vetemjöl	msk	1	jonas@stenberg.io
158fca0f-ca8f-4b2c-b546-648e5d208184	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	12905e60-8310-45f0-8507-ad5334662b3a	äpplen		7	jonas@stenberg.io
188bab59-5356-41b8-9ead-2514de805a25	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	smör	g	150	jonas@stenberg.io
0f1043b7-98f8-408e-a28e-5bdab8a28e4c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	vetemjöl	dl	3	jonas@stenberg.io
b1505fd9-96fe-42dd-a670-4644f2803c49	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	socker	dl	1	jonas@stenberg.io
c772e9dc-7dc3-4517-b944-ac56ff0e9f7c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	drygt 0,5 tsk bakpulver			jonas@stenberg.io
5389e4a9-3dd6-4bbb-bcb4-bd2780ec545b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	ägg		1	jonas@stenberg.io
bad078b7-d293-427f-8523-6de117a1bf85	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	sej-, kolja- eller torskfilé	g	600	jonas@stenberg.io
acf49d96-b08f-4325-aefe-1dafcbd06f8f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	salt	msk	0.5	jonas@stenberg.io
509921cc-079c-452a-81ff-b1ac3c37ebbf	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	smör	msk	2	jonas@stenberg.io
fce1f9ed-f1fc-4076-bf39-8671d3b0022b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	smör	g	100	jonas@stenberg.io
ece5995e-6db1-431a-81d7-fd2b80bfcac1	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	mjölig potatis	g	400	jonas@stenberg.io
b2b1704b-0897-4d64-bcd7-ceac90b80d2b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	mjölk	dl	2	jonas@stenberg.io
34b39e1c-e2de-4df6-8af8-ea4c19611d8e	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	smör	g	50	jonas@stenberg.io
d56a9115-d2cc-4099-874d-71760c24bcf4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	# Äppelsallad			jonas@stenberg.io
a64534d1-da10-46c3-b507-1d7a26fd4cd9	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	# Till servering			jonas@stenberg.io
11d2cecc-3d01-4fa7-aeda-11c0300c9d22	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	# För 4 personer			jonas@stenberg.io
e6f5d592-b48c-454b-a537-4803d7c249ff	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	# Lag av			jonas@stenberg.io
1d9ccbb8-a960-479c-8c3f-b91faa6baec9	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	gulbetor, skalade, tärnade och lätt kokta	g	400	jonas@stenberg.io
ecfe3d2c-6b08-4a7f-9f73-68f8ce47bf4e	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	äpplen, tärnade		2	jonas@stenberg.io
1d1ed904-0587-44e2-887d-f048aeb789bd	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	citron, finrivet zest och saft		1	jonas@stenberg.io
cfcbbc1e-a002-420c-9325-bee0e890c907	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	hackad persilja	dl	1	jonas@stenberg.io
1aa9da13-13dc-4a78-95c4-1adef187f312	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	ruccola	g	35	jonas@stenberg.io
54c5c208-fd46-483f-8191-986addf4030b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	kapris	msk	4	jonas@stenberg.io
9457eb43-1570-470c-9973-13f0eee3caed	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	olivolja	msk	1	jonas@stenberg.io
d25b2c8a-b836-4261-a4e7-160ed618412f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	salt och peppar			jonas@stenberg.io
0659dd0f-8922-4314-acbf-6abb37cb63cc	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	Krasse			jonas@stenberg.io
c9be4706-ab65-47cd-8ded-0114e538ed70	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9b6996db-e837-44a4-bd55-46f9ed31f515	Finriven pepparrot			jonas@stenberg.io
84834a7c-7659-4608-94df-bd08e59d88a5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	stora filéer saltsill (ca 400g)		4	jonas@stenberg.io
e026e065-92fb-4377-bc44-e611d3551b8a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	gula lökar		2	jonas@stenberg.io
5d01e103-1d33-4863-8e81-98e0bb47ad96	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	kryddpepparkorn	msk	1	jonas@stenberg.io
47ca608e-ce72-4f2a-9a92-c3ffedc12744	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	lagerblad		1.5	jonas@stenberg.io
c5e920be-6327-4721-bb3f-d57b8137f268	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	purjolök		0.5	jonas@stenberg.io
75f0f6b7-1081-4b8c-894a-0bebeb82a656	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	skalad morot i bitar		1	jonas@stenberg.io
0ad4756b-edbd-4f70-8d7a-113afabc1468	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	rödlök till garnering			jonas@stenberg.io
1bdd010d-7c13-477c-882e-d968a9b7d2a4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	ättiksprit	dl	1	jonas@stenberg.io
540ba7ea-4f68-44bf-9d48-e3a796fa56bc	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	vatten	dl	2	jonas@stenberg.io
bf68b439-17d1-4c2f-8cb6-db87d708af22	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	socker	dl	1.5	jonas@stenberg.io
f9f7da2b-700d-4c93-aed9-934b8db3d586	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	05bb7c8d-c879-41cb-aad0-44ce505db2ae	kardemummakärnor	tsk	1	jonas@stenberg.io
5c75c413-5426-473d-83c8-80fa6ab6470d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	05bb7c8d-c879-41cb-aad0-44ce505db2ae	hel svartpeppar	tsk	1	jonas@stenberg.io
f29076a0-f608-4b80-a89d-c93e934484fb	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	05bb7c8d-c879-41cb-aad0-44ce505db2ae	malen gurkmeja	msk	2	jonas@stenberg.io
77d0e717-3fa3-4239-a612-233662f7babc	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	05bb7c8d-c879-41cb-aad0-44ce505db2ae	malen kanel	tsk	2	jonas@stenberg.io
936a87c1-fcc8-450f-b99c-5c978eebe223	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	05bb7c8d-c879-41cb-aad0-44ce505db2ae	riven ingefäraa	msk	2	jonas@stenberg.io
1737a27d-0340-42c4-bda3-e984a8ba67ef	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	# Till servering			jonas@stenberg.io
eb1bbb0d-96fe-4820-ba84-521b2b9608c6	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Laxen:			jonas@stenberg.io
5999a736-aeed-4292-b56d-049a842bd92b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Paprikasås:			jonas@stenberg.io
a595b5dd-a369-40d2-ba37-110c20c25c19	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Mango salsa:			jonas@stenberg.io
6ecb5380-d56f-434f-a27f-c021e6c98b35	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Picklad rödlök:			jonas@stenberg.io
81a68678-1a87-4af7-a107-3a8886c9be86	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Grönt:			jonas@stenberg.io
c4b10524-d359-49e5-9931-4022e552bcbe	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	# Sås			jonas@stenberg.io
1e83c836-9b16-4bd6-ae92-09b71e9c7237	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	# Potatis			jonas@stenberg.io
915465d7-de9c-4097-9e1a-b52b68cbf41d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	# Lammsteken			jonas@stenberg.io
16cd22fa-23e2-4a32-8665-e08770b48806	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	05bb7c8d-c879-41cb-aad0-44ce505db2ae	havremjölk	dl	8	jonas@stenberg.io
77336792-2ac5-4f13-a3a9-53ecdf9951bc	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	gul lök		1	jonas@stenberg.io
4979c6c5-26b1-433c-a2ba-ec4429333d5b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	morötter		2	jonas@stenberg.io
6d8291b6-2493-4ec8-960d-427752152582	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	halloumi (2 paket)	g	400	jonas@stenberg.io
d1f3aa49-c2a4-4c8b-ace6-546cd09f522f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	olivolja till stekningen			jonas@stenberg.io
dcf7288f-dfe1-4861-bb63-69bdd693f5c9	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	paprikapulver	msk	2	jonas@stenberg.io
a133b226-6549-4104-b052-c77989494453	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	tomatpuré	dl	1	jonas@stenberg.io
bbbebe7f-c653-4753-a106-f8877b2ab19c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	dijonsenap	tsk	2	jonas@stenberg.io
0fdec946-f9d2-4674-8398-b236354b08fd	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	tärning grönsaksbuljong		1	jonas@stenberg.io
359d8e2f-94e6-43c4-bf94-92c6cfeb6d36	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	di vatten		3.5	jonas@stenberg.io
5f771912-d0bf-4373-b3c0-3671a8fb5228	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	grädde	dl	2.5	jonas@stenberg.io
b07fe36b-973a-4939-8f55-aa0a457725f5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	salt och peppar			jonas@stenberg.io
dbd1208f-db6e-4212-96e7-66d23a1ab981	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	Nykokt ris			jonas@stenberg.io
5b3cbf2c-46d2-48d7-bfa9-7ae70131dc75	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	Rucola			jonas@stenberg.io
39d95495-fa5e-4e41-a728-c23ace3d5c66	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	Hasselnötter			jonas@stenberg.io
12de06ec-bd67-40aa-bf1d-e4bad87aafea	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	647d6e35-8369-4e00-8146-7d0587c28478	Ev aioli			jonas@stenberg.io
9aa63994-1e29-45c0-8e62-41af2b8d5d25	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	lax	g	350	jonas@stenberg.io
0e7c2712-4a5e-45e6-afad-6e05eab8304c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	chiliflakes	tsk	2	jonas@stenberg.io
72e6cc48-542e-4d06-bbb2-45c1dfe1178c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	paprikapulver	tsk	2	jonas@stenberg.io
e2a75c98-8aa9-4ab7-ac34-6089c280c6be	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	torkad koriander	tsk	2	jonas@stenberg.io
c1cfcdc4-4b5a-40fa-83d3-a9e8d7f01c73	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	farinsocker	tsk	2	jonas@stenberg.io
a109341b-39f3-496e-b60f-7556433bd00c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	salt	tsk	1	jonas@stenberg.io
c2664466-f408-4ea4-8495-7b500e563a73	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	grillade paprikor på burk	st	2	jonas@stenberg.io
e3426617-bd42-4b84-b13f-8bf78f2b7616	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	majonäs	dl	1	jonas@stenberg.io
2038bcd5-e4e1-4219-9f1a-7e06bd2b79b6	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	paprikapulver	msk	1	jonas@stenberg.io
20afac99-bfc6-4051-8def-50cc3060a4e3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	smoked paprika	tsk	1	jonas@stenberg.io
de6dc805-b988-4a6f-9730-2e4280fe46f2	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	mango		1	jonas@stenberg.io
41d24e33-22a2-4b21-95c3-8a29a0670413	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	tomater utan kärnhus		2	jonas@stenberg.io
8c473387-cc68-40aa-adf4-fc5daf12c165	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	rödlök, superfinhackad		0.25	jonas@stenberg.io
91ab78c8-ab95-44c3-bd53-9452d818575b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	knippe koriander		1	jonas@stenberg.io
94499375-d16a-42fd-b20b-a1c49b871017	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	salladslök (frivilligt)		2	jonas@stenberg.io
ea311c48-14c5-48bd-aa7e-f7d058129eaa	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	rödlök	st	2	jonas@stenberg.io
e84af36d-20c6-4b38-ba5a-c526777dcca6	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	vatten	dl	5	jonas@stenberg.io
c789cbdb-55b0-4538-829d-09a7805876db	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	ättiksprit	dl	2	jonas@stenberg.io
2e63ded0-0bea-4206-9407-02f66d9c93c0	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	socker	dl	1.5	jonas@stenberg.io
eccd4d30-5b14-4ab4-a387-07a6efb44e90	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	knippe räddisor		1	jonas@stenberg.io
29b621a1-4f01-46b4-a8b3-71b4fbb79ac5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	Finriven spetskål			jonas@stenberg.io
b52b6d30-8d0a-4da7-8573-d050a029b741	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	lök		1	jonas@stenberg.io
c88ea892-a16a-4262-8b32-555c963f7330	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	rejäla morötter i bitar		3	jonas@stenberg.io
46c9ed1f-0f08-4e97-9ff3-7edd5eddcdb4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	lagerblad		1	jonas@stenberg.io
4e9e90e7-9a20-45b1-9803-511049b8e86f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	Kryddpeppar			jonas@stenberg.io
bc83885d-b1d5-41b3-8bbd-189dbc55fadf	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	Vitpeppar			jonas@stenberg.io
bc0500bc-f895-4116-abdc-7049a89dc58b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	Citron			jonas@stenberg.io
02bc8d55-e67c-47cc-8c30-271ceca345b2	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	Dill			jonas@stenberg.io
094dfbda-6527-4be1-a9ca-ae22e9f141da	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	Halv dl grädde			jonas@stenberg.io
b919a3a1-1a33-4b57-8c83-eb37db20675f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	043263df-ef4d-4694-b989-8b01821706a2	Potatis			jonas@stenberg.io
1b80089e-7c92-4a24-8b7a-1caa18761eaa	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	Lammstek			jonas@stenberg.io
f8096600-ab01-4224-a754-4927c5b2a247	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	# Potatis			jonas@stenberg.io
ff44eb9f-8076-4042-bc96-e99fb60c4c05	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	# Vitlökssmör			jonas@stenberg.io
81ba9329-95ca-47a3-b0d4-b36e87635374	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	#topping			jonas@stenberg.io
2bf1176b-d903-4b45-b434-9b0a615926c0	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	# Fyllning			jonas@stenberg.io
c5de600c-07c3-4607-8912-660e10d01335	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	# Till servering			jonas@stenberg.io
298c0051-5ee0-4b43-b471-39625cf23b5e	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	timjan	tsk	1	jonas@stenberg.io
8d371d72-8293-4711-ba43-c85ae86dfbc7	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	rosmarin	tsk	1	jonas@stenberg.io
60dd7156-14c5-4919-b943-728514f453dd	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	Tunt skivad potatis			jonas@stenberg.io
7026e281-1af6-4ebf-8d15-c5f6a8086970	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	Buljong från steken			jonas@stenberg.io
b698a17a-5fad-424d-83aa-2b09e4adfe27	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	gram smör		100	jonas@stenberg.io
f33d231d-d885-4748-bb3f-7b6bff0ded8b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	vitlöksklyftor		1.5	jonas@stenberg.io
556e717d-0241-4391-94aa-f8114e2957f3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	finhackad persilja	dl	1	jonas@stenberg.io
e26a2d9a-060f-422f-824b-7885cae5fc34	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	salt och peppar			jonas@stenberg.io
2416cb9f-be0f-4bcb-b717-d48d98c44eab	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	olivolja	msk	2	jonas@stenberg.io
495a07de-88f6-4ebc-8773-f49969476e22	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	hackad gul lök		1	jonas@stenberg.io
27526684-4c65-4fa8-9de1-0e16a3ce1fe3	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	skivade morötter	g	500	jonas@stenberg.io
befd3683-f40c-433e-9494-231405490f22	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	spiskummin	tsk	1	jonas@stenberg.io
dd235aaa-3715-443c-bdb8-f8fd1a1325c6	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	- 2 msk riven ingefära		1	jonas@stenberg.io
5e852247-6d49-4d40-b778-fbf7a383592b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	chiliflakes	krm	1	jonas@stenberg.io
1d24faad-6327-49a1-85ac-50c8b6cd2c31	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	burk kokosmjölk (400 ml)		1	jonas@stenberg.io
86fca0f3-1d67-4e0c-a595-c0c232348ceb	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	konc grönsaksfond	msk	2	jonas@stenberg.io
b14eba4d-9f83-4dc2-9bae-959a3067cd6f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	vatten	dl	6	jonas@stenberg.io
99c86d2a-a86b-4956-a4fd-9a9223eeef58	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	färskpressad limejuice	msk	1	jonas@stenberg.io
c2921aaa-39ec-41ff-a870-9fd396ec78d2	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	salt och svartpeppar			jonas@stenberg.io
82e28693-c1c4-4a21-b564-31d70a2a1b73	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	pumpafrön			jonas@stenberg.io
94dcf1c5-ed97-41b3-a519-637eff587248	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	purjolök		0.5	jonas@stenberg.io
a30e62be-e430-4ce6-a87c-941e5ee223eb	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	röd chili		1	jonas@stenberg.io
a2ac674c-3fd7-4e9f-a080-1379de0a342b	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	tomatpure	msk	2	jonas@stenberg.io
0e0a7ada-fecc-4e39-a47b-1dc13646d8a5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	körsbärstomater	g	250	jonas@stenberg.io
8aff65ce-722d-41d4-bf6d-094a855fb4ef	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	vitlöksklyfta		1	jonas@stenberg.io
ad506298-aac4-4698-9d1a-334e828e67c5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	olivolja	msk	2	jonas@stenberg.io
4356de22-2acd-4c8e-8c5d-f4ddc226614a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	vispgrädde	dl	2	jonas@stenberg.io
26ed20cf-3d17-41c3-b931-779fc8ed583a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	finrivet citronskal	tsk	2	jonas@stenberg.io
2f7100ec-fe68-4c7c-8974-2440a7929302	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	skalade räkor	g	200	jonas@stenberg.io
83672e06-4eb9-44f6-bd28-d843c5131c47	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	finriven parmesanost	dl	1.5	jonas@stenberg.io
b6503d7f-0d79-4ddf-894b-5e0e8ba2cdca	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	salt			jonas@stenberg.io
5d59c0a0-93bd-4be7-ba85-99899b5cea88	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	svartpeppar			jonas@stenberg.io
285cc0f3-cd56-4c2b-8945-507cf4b85677	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	spaghetti			jonas@stenberg.io
2531e71e-f20d-4cc9-97c4-1628a24396fc	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	anammafärs	g	400	jonas@stenberg.io
3fc41a83-c91c-4fa2-bbf4-183808ed13b5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	gullök		1.5	jonas@stenberg.io
f36874e6-b3e7-4587-8863-8f2503cd936c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	vitlöksklyftor		4.5	jonas@stenberg.io
f801e4e1-11a1-4195-9efa-f358396f31b9	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	morötter		2.5	jonas@stenberg.io
c6802ac9-7b80-4cb9-ac38-1f36d56d6f7c	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	liten bit rotselleri		1	jonas@stenberg.io
12cffaca-2c7d-44da-bdbe-4b6841fdd817	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	olivolja	dl	0.5	jonas@stenberg.io
1c61dc62-b5d9-4b35-b651-76607e9b0736	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	vin	dl	1.5	jonas@stenberg.io
c511b1c3-3c8b-454c-921d-61589547993a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	tomatpuré	msk	2	jonas@stenberg.io
fdda6376-d9d6-4364-b0df-ef04b69bf3ca	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	torkad basilika	tsk	2	jonas@stenberg.io
cf111e2c-6d18-410e-9f90-22933e08762d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	salt och peppar			jonas@stenberg.io
8f4ca82d-602c-487f-b00c-3fffb58f4cf4	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	spaghetti			jonas@stenberg.io
f8f21f9e-cf7c-4db9-b49b-c89a75052e83	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	mjölig potatis	kg	1	jonas@stenberg.io
ac5635ab-8bfd-4a90-8789-1e741724340f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	ägg		1	jonas@stenberg.io
c9ce91fd-c36b-4101-9123-119792db8183	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	vetemjöl	dl	2.5	jonas@stenberg.io
1bea176d-5c8c-4761-a296-794c6649287a	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	smör			jonas@stenberg.io
3eeaafdf-1050-41d2-aac8-3e569f1297ef	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Rårörda lingon			jonas@stenberg.io
08641374-825a-4838-aace-7acabe3bc348	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Brynt smör			jonas@stenberg.io
f01505f9-f58e-4f82-a7cd-0f8399a0e990	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	efb431d6-38ea-417c-b197-b92b346e5fbb	rödbetor	kg	1	jonas@stenberg.io
619553c4-0aa1-4971-a9bf-f404976fd6e5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	harissa (eller efter smak) - går att ersätta med chiliflakes eller färsk röd chili	tsk	2.5	jonas@stenberg.io
7ad250ed-49d5-405f-9232-adf0d7123ce5	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	1642372e-2a7a-445d-be6f-2474be5b8586	pressad citronjuice	msk	1	jonas@stenberg.io
499fb73f-9dfb-462a-9967-f5b4c707e41c	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	hela tomater plus 1 burk vatten	burk	1	jonas@stenberg.io
de62e101-c2e3-4efe-b764-874bc29c3f64	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	vitlöksklyftor	st	2	jonas@stenberg.io
f3b94a20-f254-477f-9073-11abae5c9f49	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	färskpressad citronjuice	dl	0.75	jonas@stenberg.io
34289e5a-3c73-4931-a4c2-a5a0856555eb	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	05bb7c8d-c879-41cb-aad0-44ce505db2ae	vatten	dl	1.5	jonas@stenberg.io
b79ab0d7-2d98-42f2-a9ed-a80ecc10fe80	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	malen ingefära	tsk	2	jonas@stenberg.io
51222264-83db-4f25-850d-a0e33e79bce9	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Hackad persilja			jonas@stenberg.io
baf2098d-b58d-4b4a-8dac-70d70d889667	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	gullök		1	jonas@stenberg.io
7f9b53e2-2488-41fa-86ca-c7562c83c495	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	vitlöksklyftor		3.5	jonas@stenberg.io
5cd4ee09-4ef6-4eea-8b47-e56574aa6628	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	olivolja	msk	3	jonas@stenberg.io
0e55edf8-68d5-477a-be2f-a64b457da72f	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	chiliflakes	tsk	2	jonas@stenberg.io
19fceec2-86aa-4cc0-9a28-141f0cf9940d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	kapris	msk	2.5	jonas@stenberg.io
181c9d93-0542-4414-8d84-a9f0e66c3ddf	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	burkar tonfisk i olja (Abba är bra!)		2	jonas@stenberg.io
3ecc3f22-8732-4c13-90b7-38a8f8ec5b56	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	citron		1	jonas@stenberg.io
b9fc78db-a40d-4490-aa2b-c9333df0b1ba	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	hackad persilja	dl	1	jonas@stenberg.io
147af33b-43a0-431a-bddd-368c20f15bd2	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	riven parmesan	dl	2	jonas@stenberg.io
3fc97ca9-5192-4d61-a823-221466defbec	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	Spaghetti			jonas@stenberg.io
1faf03de-8402-4d0b-997a-323ab2f861be	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	f26e4739-19bc-48f4-91ed-e87268a69423	oregano	tsk	1	jonas@stenberg.io
d5c4fd14-d9a7-4c46-9726-7881e3a5f43d	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	fb5328c4-5e22-41d7-a1e1-35448e96b4af	hackade vitlöksklyftor		2	jonas@stenberg.io
eaea66e3-0c67-45d5-88d0-ec0db1ad3873	2023-08-03 22:18:51.869911	2023-08-20 19:09:53.419641	dd534f07-426c-4dcc-87e0-8174d44d03f7	burkar tomater, hela eller körsbärstomater		2	jonas@stenberg.io
a6c271f2-4522-4bee-9ced-3483f32432fd	2023-08-11 19:04:28.724055	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	smör	g	150	jonas@stenberg.io
303e6bba-67f9-4e9a-a206-95ab091b60a2	2023-08-11 19:04:28.724055	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	vetemjöl	dl	3	jonas@stenberg.io
7b392905-e09f-416c-bbbb-bcb3f7068aca	2023-08-11 19:04:28.724055	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	socker	dl	1	jonas@stenberg.io
245e7a1c-7ee6-41ba-ba13-9697f3601e7a	2023-08-11 19:04:28.724055	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	drygt 0,5 tsk bakpulver			jonas@stenberg.io
88e14b4b-0dd7-480c-8883-237f1ef39206	2023-08-11 19:04:28.724055	2023-08-20 19:09:53.419641	0789d29d-8a27-496d-a4d1-c662200a6281	ägg		1	jonas@stenberg.io
5200a11f-956b-44ef-919a-d87340d35e87	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Lax			jonas@stenberg.io
46c0abdd-5afd-4fd7-8e11-55b3efc3ee9d	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Pepparrotscreme			jonas@stenberg.io
c4530d6f-ecf8-4b8b-9465-04de43133a86	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Potatis			jonas@stenberg.io
e907f2c8-a80a-4ed8-9988-405bac9bdaa9	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	laxfileér eller 500g laxsida		4	jonas@stenberg.io
3439fb9e-0eb2-4808-a0c6-d002756cb89c	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	philadelphiaost eller liknande	pkt	1	jonas@stenberg.io
1e7dc9e4-994a-4023-ab41-2d3599ba5b1d	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	finriven pepparrot	msk	2.5	jonas@stenberg.io
3c5a3640-4237-4893-910a-f815a4241e32	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	salt	tsk	1	jonas@stenberg.io
191277ad-c598-4758-9848-8e6408ad6877	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	svartpeppar	krm	1	jonas@stenberg.io
2578b140-da83-44b0-ae0b-2ce5e537fcda	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	fast potatis	g	500	jonas@stenberg.io
540ebb59-7790-494b-b403-f90b486a0eea	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	olivolja	dl	0.5	jonas@stenberg.io
833fc8fd-f232-44e7-9365-a07048dec87f	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	salt	tsk	1	jonas@stenberg.io
5c5ed76e-6493-4c26-b2d0-0e87fc7f2186	2023-08-12 14:24:33.506243	2023-08-20 19:09:53.419641	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	svartpeppar	krm	1	jonas@stenberg.io
4ce954c1-7f1d-431b-9c8d-e76fb080fb83	2023-08-13 20:01:47.49987	2023-08-20 19:09:53.419641	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	# 6 portioner			jonas@stenberg.io
75753763-6383-4e9c-ac9e-2df23adadbb1	2023-08-13 20:01:47.49987	2023-08-20 19:09:53.419641	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	vispgrädde	dl	5	jonas@stenberg.io
7a6ade8f-7a24-41d6-abe6-b2a01b16ea6c	2023-08-13 20:01:47.49987	2023-08-20 19:09:53.419641	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	strösocker	dl	1.5	jonas@stenberg.io
a4b41dfc-fa39-4b05-a8ee-a4fb770b0cad	2023-08-13 20:01:47.49987	2023-08-20 19:09:53.419641	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	färskpressad citronjuice	dl	0.75	jonas@stenberg.io
b1d891a6-ff1f-4490-9e85-c0f97e20a843	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	smör			jonas@stenberg.io
d97c8d64-bc0b-4abd-bee1-6d2216d178fa	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	salt			jonas@stenberg.io
30ed0e11-be8c-4893-a179-f4d98dfe0e5a	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	peppar			jonas@stenberg.io
bee1b1db-6815-4e6e-8f87-85bdaf5e69f8	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	bakpotatis		6	jonas@stenberg.io
b458a1df-deb1-42c8-bb2c-ac9a95d143cf	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	#Tonfiskröra			jonas@stenberg.io
06196ade-b072-41b9-8c37-a2095a4f1ed8	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	tonfisk i vatten	burkar	2	jonas@stenberg.io
e827cda9-8516-4c42-a710-973098f3a32f	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	rödlök		0.5	jonas@stenberg.io
2963abe7-e4c2-43b9-bdef-6ebe3d975a71	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	selleristjälk		2	jonas@stenberg.io
976c4884-6bed-4618-9850-a748ccd796bd	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	majonnäs	dl	1	jonas@stenberg.io
20f9c881-4264-420f-b624-bea87f753324	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	crème fraîche	dl	5	jonas@stenberg.io
48114f96-a7c9-414e-b568-19f58b7066a3	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	dijonsenap	msk	2	jonas@stenberg.io
5ee0e70b-cf0d-4353-bd2f-7ac492004c9e	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	citron, färskpressad	msk	1	jonas@stenberg.io
aafa8114-7e28-4be9-a327-0f9364150856	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	hackad dill	dl	1	jonas@stenberg.io
38e731e7-8412-4212-a3e0-2672ba0ca30a	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	kidneybönor (380 g) sköljda	paket	1	jonas@stenberg.io
5f003b02-921c-4a62-8f4f-b0935069742c	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	oregano	tsk	1	jonas@stenberg.io
97c93443-6364-4783-885d-281c99a62a31	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	timjan	tsk	1	jonas@stenberg.io
55eff331-2d0c-42b6-ad48-cf40d9d43251	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	paprikapulver	tsk	1	jonas@stenberg.io
13563c0e-bcf4-424b-92c4-493d78bfe7fd	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	spiskummin	tsk	2	jonas@stenberg.io
65a3f8a0-11e5-4ac3-8ba1-5cd133dddd3a	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	kakao	msk	1	jonas@stenberg.io
1017fff6-e48d-4f55-ba23-09ef82d4a49c	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	färsk koriander	kruka	1	jonas@stenberg.io
a3d7f2a2-dfd9-420a-9ca4-8ac9ed9e2329	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	olivolja till stekning			jonas@stenberg.io
0bb6c89c-12b2-4292-a8f8-66af59b7e809	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	salt och svartpeppar			jonas@stenberg.io
8cb16c24-6eb6-4955-b38a-5e5c38ef286b	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	nachos och creme fraiche till servering			jonas@stenberg.io
a780dfaa-05de-4a87-864a-c70623b1e4b0	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	gul lök		1	jonas@stenberg.io
080ccc4e-3f77-4806-a5af-e651c57f4c63	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	vitlöksklyftor		2	jonas@stenberg.io
c3f1727d-096c-4b96-9c43-00cc27b79b1c	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	röd chili		1	jonas@stenberg.io
ab08217e-2ee2-4d7f-b46e-ed6bf7215a4e	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	morot		1	jonas@stenberg.io
0295ca03-788b-474a-88f8-e32210b8f6f7	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	blekselleri	stjälk	1	jonas@stenberg.io
28bcc355-96c7-458a-a019-785e4806223b	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	tomatpuré	msk	2	jonas@stenberg.io
cfab8a24-91ed-455d-8901-cc20a3b43b9b	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	svarta bönor (380 g) sköljda	paket	1	jonas@stenberg.io
327545f1-8e74-4de4-9c20-0be0aac075c5	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	vetesurdegsgrund (ca 0.5 dl)	g	50	jonas@stenberg.io
b9459f0b-1990-4328-8789-0bc029629aa4	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	vatten (2.5 dl)	g	250	jonas@stenberg.io
ccf6ec7a-ccf2-4ced-8fd5-3c8b1d399ad2	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	jäst	g	3	jonas@stenberg.io
16c34e8e-57c0-4c33-b199-8b8108169833	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	vetemjöl special (6 dl)	g	350	jonas@stenberg.io
14ac416b-8b81-421d-819d-5d94ced3015e	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	salt (1 tsk)	g	7	jonas@stenberg.io
c93393c3-3867-4e31-9264-7827a54452d5	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	hela linfrön	msk	1	jonas@stenberg.io
ac624e51-0117-49d7-a01f-7e3b7a1350eb	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	solroskärnor	msk	2	jonas@stenberg.io
7c42883e-47f8-4adf-a7ff-b722a9ab2a38	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	gula lökar		2	jonas@stenberg.io
c696038a-d7bb-404a-a8f1-5bdc0ab84faf	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	vitlöksklyftor		5	jonas@stenberg.io
f1d00027-0085-4423-b540-fdcd8d389ec5	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	ingefära	cm	2	jonas@stenberg.io
92c2929d-a030-4c4a-aef7-dde76cf543ab	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	kokosolja	msk	2	jonas@stenberg.io
0a56b4fc-a8e7-49ec-a569-80dd8b13b1ec	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	tomatpure	msk	2	jonas@stenberg.io
ca891c59-a0bf-4007-a97b-e0b3779a8327	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	adobo chipotle	msk	2	jonas@stenberg.io
2041f29b-080d-4459-bbe7-bd85999d3b72	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	krossade tomater	burkar	2	jonas@stenberg.io
dc41ec3f-42b3-47b6-b3b1-86b1c659bb94	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	morötter		3	jonas@stenberg.io
863478a8-5b20-4ac7-a69e-fd00ac670246	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	kokosmjölk	burk	1	jonas@stenberg.io
bd15eed5-b09c-45e1-ac41-09802e81e0a9	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	röda linser	dl	2	jonas@stenberg.io
8bbe67a1-26db-4ebc-b966-c884363f7334	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	helt bovete (snabbt blötlagt)	dl	2	jonas@stenberg.io
93e0f938-16c9-4006-b397-90f5727d903d	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	pumpakärnor	dl	1	jonas@stenberg.io
24a8bb3f-5c37-4866-a0ee-c8d94e94193f	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	hela linfrön	dl	0.5	jonas@stenberg.io
7ea7bf61-fbd2-449c-9a7f-6cfff3779c8c	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	solrosfrön	dl	1	jonas@stenberg.io
452e1ace-c5e0-4ee1-9092-a09f1d9f27db	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	chiafrön	dl	1	jonas@stenberg.io
a881c8d0-0479-4408-be21-7674453fac82	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	hackade mandlar	dl	1	jonas@stenberg.io
1311a99a-807b-490a-805a-3fa2a43e23a5	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	hackade valfria nötter	dl	1	jonas@stenberg.io
0c0aa8cc-b177-41f4-8e53-b5b52c402d59	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	kanel	tsk	2	jonas@stenberg.io
019b7c44-d57e-40f6-bb71-4b55686c7f56	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	kardemumma	tsk	2	jonas@stenberg.io
ba1bd435-37a2-4472-8609-142d2cf7c67b	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	honung	msk	2	jonas@stenberg.io
22b7f304-0cac-4742-893f-e842bd2a0c96	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	kokosolja	msk	3	jonas@stenberg.io
2369a804-11bd-42e6-bf7d-3b1406ec7fcb	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	ml kokosmjölk		400	jonas@stenberg.io
497d945f-9864-436c-9ac8-a68393db587c	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	kikärtor	g	400	jonas@stenberg.io
abe14e4f-e653-4aa0-a280-6e347d1fb36a	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	basilika (ca 10 g färska blad)	kruka	1	jonas@stenberg.io
a7b00836-684e-432f-aa8e-65f17e3e6c0a	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	vitlöksklyftor		2	jonas@stenberg.io
edb8dadf-d496-4d28-b229-c51568394719	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	gullök		1	jonas@stenberg.io
99bd55ec-8880-4efb-b9be-ec49a242840e	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	röd currypasta	msk	2	jonas@stenberg.io
bbd8923b-cd26-4d7e-a0fc-ef40b733abf8	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	curry	msk	0.5	jonas@stenberg.io
240df116-4dbe-4acc-b0cf-0648887854ce	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	cocktailtomater	g	200	jonas@stenberg.io
a6628951-8357-490f-af16-4f4e7485b64f	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Saften från  lime		0.25	jonas@stenberg.io
9fe74435-8934-4668-8387-c851d5e4ce50	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Salt			jonas@stenberg.io
7f1c2932-0f05-414c-acb1-14bb29f7b0fa	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Ris			jonas@stenberg.io
27b3a5f7-8946-49c5-b54a-a61f50e09812	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	rumstempererat smör	g	150	jonas@stenberg.io
64742450-9d13-4add-9bb9-4fdfac7e3b76	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	socker	dl	2	jonas@stenberg.io
cbfb2639-089e-42af-a22a-39abe72ad34b	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	ägg		2	jonas@stenberg.io
935e4cfc-256a-439d-a7ed-423ff02a6f5f	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	vaniljsocker	tsk	1	jonas@stenberg.io
23620c55-47e3-46a0-88c0-e1aab6f6fedc	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	mjölk	dl	0.5	jonas@stenberg.io
2d0eba1d-0eee-4fa9-a538-4f8f710c1ec2	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	vetemjöl	dl	3	jonas@stenberg.io
c5156263-0ea9-4334-9030-86f8ce1b7ded	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	bakpulver	tsk	1	jonas@stenberg.io
47242631-c660-4792-8110-5cea7ce6d245	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	blåbär	dl	2	jonas@stenberg.io
332bc72e-9634-4462-b994-414ada04bc5b	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Vatten			jonas@stenberg.io
446389a9-de74-4822-b865-de11f7ad5a62	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Fiskkrydda			jonas@stenberg.io
1e2c4fa8-821e-4638-9c52-e1da21b78cf9	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Kryddpepparkorn			jonas@stenberg.io
456c657a-1c36-4989-a4c5-e5a6994d6307	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Salt			jonas@stenberg.io
8ee5ace2-d0cb-49d8-8afd-a9852388692c	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Torskrygg			jonas@stenberg.io
e8d4f3aa-28e0-4109-bd20-90b88a8d4346	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Citron			jonas@stenberg.io
03493cbf-a2d7-4593-962d-b71633d1cfc5	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Dragon			jonas@stenberg.io
3d461012-75fb-4579-b841-61e29c581d80	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Vispgrädde			jonas@stenberg.io
68d24ced-65cd-4bb2-bf89-dabbec9f8e70	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	färsk jäst (ca 6 g)	tsk	2	jonas@stenberg.io
7738ec90-dd75-463e-8b5d-90c7b50ff63b	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	kallt vatten	dl	4	jonas@stenberg.io
c18bd58e-6499-4a58-b791-0edbfab3c89e	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	dI fint rågmjöl (110 g)		3	jonas@stenberg.io
deb8477a-319d-47da-a7f6-f56c1acecc67	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	dI vetemjöl (480 g)		8	jonas@stenberg.io
abf7859a-b0d8-4220-aa7f-cc48a1f68285	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	salt	tsk	2	jonas@stenberg.io
60634f8b-cc65-4bfb-892d-c7012a214246	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	finrivna morötter (ca 70 g)	dl	2	jonas@stenberg.io
3ac582f5-b766-447f-b5a4-5f189ce7291c	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	dI rivet äpple (ca 60 g)		2	jonas@stenberg.io
6d6686ed-b473-4e8c-963d-d505803cf66d	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	rabarber	g	450	jonas@stenberg.io
435d4c1e-c789-4677-9b65-83ba25766e7a	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	socker	dl	0.5	jonas@stenberg.io
16fa864a-0c14-4d1c-8dbc-f63fbf783378	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	potatismjöl	msk	0.5	jonas@stenberg.io
ad4e0b71-fd08-48f6-ab8b-a02e4aa13057	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	smör	g	200	jonas@stenberg.io
eec9a7da-ee22-4b53-b9a4-484e348e7602	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	grädde	dl	0.75	jonas@stenberg.io
5673e171-e47e-425c-bdfa-40647247a8f9	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	ljus sirap	dl	0.75	jonas@stenberg.io
4010cd1a-db80-4216-8ee6-2fe861b98be0	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	socker	dl	2	jonas@stenberg.io
18c65779-9394-4d2f-aeb5-27271beed970	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	havregryn	dl	4	jonas@stenberg.io
09bb1ab1-f33f-4627-8f7e-f88f98f7f0ce	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	vetemjöl	dl	2	jonas@stenberg.io
5b7eb69d-b6df-486a-9a51-35b3a2fd2801	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	bakpulver	tsk	0.5	jonas@stenberg.io
e6058e00-40cb-4c37-b5f0-0cf3a988d253	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	salt	tsk	0.5	jonas@stenberg.io
9334c64d-e15f-4af7-ac8c-5afa7b3815e2	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	lövbiff	g	500	jonas@stenberg.io
7aebd8c4-c8d5-4119-a343-84d5dafbc742	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	smör, till stekning	msk	2	jonas@stenberg.io
5f4c5b66-3793-440f-b66c-cc7a8b012eb3	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	salt	tsk	1	jonas@stenberg.io
e5bb8012-aeb6-4ac7-8198-05965026dc83	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	svartpeppar	tsk	0.5	jonas@stenberg.io
6faf52af-1678-4e82-9eec-3b8715081686	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	gul lök, hackad		1	jonas@stenberg.io
54661e59-4adf-40f3-9ce0-76812132732d	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	vitlöksklyfta, finriven		1	jonas@stenberg.io
fcacdbfd-fb31-48ca-a51e-cdc098f17b5f	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	grädde	dl	3	jonas@stenberg.io
98d59f25-78fd-4056-9ee5-14a38f229fbc	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	dijonsenap	msk	2	jonas@stenberg.io
421fd7bf-98f5-4b06-ad63-1e9fae812ed1	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	japansk soja	msk	1	jonas@stenberg.io
657c248c-70c1-48f7-9162-4dc77ace8e25	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Sockerärtor eller haricots verts			jonas@stenberg.io
f0390039-6c7c-4e42-88d1-05a049cfcacc	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Ris eller potatis			jonas@stenberg.io
c3ebb856-7b28-449c-92eb-d672ef1648ae	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	ägg	st	2	jonas@stenberg.io
27be8b89-0ea3-445b-b37b-6afc00e14245	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	socker	dl	2	jonas@stenberg.io
6d570a43-bccc-4e49-9d22-d0b1ea8c787c	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	vetemjöl	dl	3	jonas@stenberg.io
355f34a0-c033-4ed9-a65e-c496080b2155	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	bakpulver	tsk	2	jonas@stenberg.io
17388165-1d25-4d25-bd24-d2fc0059ab0b	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	smält smör	g	50	jonas@stenberg.io
893f1326-a89b-4aa7-9777-4d8a2dcdf3c7	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	vaniljsocker	tsk	2	jonas@stenberg.io
8e0daaf2-909c-4810-908a-6eaaadc50f6d	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	ägg	st	2	jonas@stenberg.io
8781a0c1-7cd8-4508-9418-95a570ef7442	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	socker	dl	2	jonas@stenberg.io
f4e698d1-5a92-40e5-a18f-079068147224	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	vetemjöl	dl	3	jonas@stenberg.io
6242bc44-2370-4f69-a182-a248295313b1	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	bakpulver	tsk	2	jonas@stenberg.io
e5249768-eebb-46c5-ae24-79d5b4998804	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	smält smör	g	50	jonas@stenberg.io
a0f0fd21-d612-41ab-be59-2b01032322d8	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	vaniljsocker	tsk	2	jonas@stenberg.io
8ffa0738-3914-49d7-984d-24b264087767	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	# ca 8 port			jonas@stenberg.io
235590ae-f4a7-4fa3-9591-1b38ffa97973	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	# Örtsås			jonas@stenberg.io
2e2930e8-c016-4d40-841b-63e4b9e14545	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	strömmingsfilé	kg	0.5	jonas@stenberg.io
2ba698db-d8cd-4c7c-8376-79dc334ffa04	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	vatten	dl	5	jonas@stenberg.io
c54c8d3a-82c0-43a0-b670-fc4fd3440181	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	ättiksprit	dl	1	jonas@stenberg.io
c74ba41a-f982-4c9b-b74e-17c7ce94ee84	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	salt	msk	1.5	jonas@stenberg.io
26a29e71-6179-46bc-a169-126d2ae9724e	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	gräddfil	dl	3	jonas@stenberg.io
5f33611d-9c3f-4171-bc1b-e6e88929cf90	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	majonnäs	dl	1	jonas@stenberg.io
11ffbced-9abf-4dbb-95c3-e52235934ab5	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	svensk senap	msk	2	jonas@stenberg.io
162d067f-143d-4610-a077-34641027ab4c	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	pressad vitlöksklyfta		1	jonas@stenberg.io
bf664b09-24b6-4f42-9d78-09347be51afa	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	hackad dill	dl	0.5	jonas@stenberg.io
5a5fb59d-173a-448f-974b-87893921cde9	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	torkad dragon	tsk	0.5	jonas@stenberg.io
227271c5-21b7-4aaf-a168-03322570137f	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	# ca 8 port			jonas@stenberg.io
e8974b19-4a99-43d7-9dfd-bc7f126e5866	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	# Senapssås			jonas@stenberg.io
8c33530d-93fc-4351-a6af-4bffffd177cc	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	strömmingsfilé	kg	0.5	jonas@stenberg.io
58ed00dd-991f-4920-8155-413b2a03faf4	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	vatten	dl	5	jonas@stenberg.io
0f823b20-c670-4f33-8b00-1ffacfb18dbf	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	ättiksprit	dl	1	jonas@stenberg.io
41f2162d-8fb5-4ece-9b82-20b22cd97bb5	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	salt	msk	1.5	jonas@stenberg.io
4b2d3958-bb0c-4c11-9a64-f7d078fc9c33	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	socker	msk	4	jonas@stenberg.io
5eebce20-2339-40b9-8b7e-a941d96c7b3c	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	gräddfil	dl	3	jonas@stenberg.io
42b6bad6-ef79-40be-8e52-f784c9e83744	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	svensk senap	dl	1.5	jonas@stenberg.io
c48b31d7-60fb-4d07-afd1-3858ef0882a1	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	salt	tsk	0.5	jonas@stenberg.io
ad86eb98-d8de-4860-8c48-a04fd0ff88d8	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	vitpeppar	krm	1	jonas@stenberg.io
b1137cf7-647a-45c0-b17b-470a0a0e169b	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	finhackad dill	dl	1	jonas@stenberg.io
211f32fc-4a79-4172-bead-2c8aa0c8f5bc	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	# Såsen			jonas@stenberg.io
7a17fcf9-30aa-4ae8-8f21-a73200942347	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	Nötfransyska			jonas@stenberg.io
aa30546a-4f7b-4bb2-8efe-67e4db70ecce	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	små lökar		2	jonas@stenberg.io
aaa1c744-8daa-4e88-a995-985999bc9e03	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	lagerblad		1.5	jonas@stenberg.io
301f3d73-0575-46c0-ab31-1a667583cec5	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	kryddpepparkorn		6.5	jonas@stenberg.io
98099267-1f35-4c2a-8b77-13cbf2f36242	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	vitpepparkorn		8	jonas@stenberg.io
01f9c786-1dc0-47c0-8b7b-2653d16ff920	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	anjovisfiléer		4	jonas@stenberg.io
f2e76ae8-7753-4194-85b6-83ca988f3296	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	,5 msk sirap		1	jonas@stenberg.io
a4cc85cd-5d1f-4fdb-8699-62de634db028	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	ättika	msk	1	jonas@stenberg.io
ee4fc646-a4c6-4f04-8c52-afd65b5951e0	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	vatten	dl	1	jonas@stenberg.io
a1f41264-d40b-487b-bf30-20524b2e385b	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	Salt och peppar			jonas@stenberg.io
423a7ded-03f7-426c-b661-19cb8f2f0773	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	vispgrädde	dl	2	jonas@stenberg.io
5a78ba1d-dcde-4618-86be-6c2678fbf9a7	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	gula lökar		2	jonas@stenberg.io
e0a0fa06-6e77-43d6-850b-0983133efcd6	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	vitlöksklyftor		2	jonas@stenberg.io
a0d095dc-7cf3-4643-b31e-984f46f3a629	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	socker	msk	2	jonas@stenberg.io
1ab6b49c-501e-4250-b2e5-f5037458f8bb	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	paprikapulver	tsk	1	jonas@stenberg.io
c39d5864-d5d8-43b3-9aa7-93a612616866	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	grön paprika		1	jonas@stenberg.io
742df814-921c-43c2-b4ca-31d04c06f32d	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	vatten	liter	1	jonas@stenberg.io
cb6635a7-350e-493c-8316-74478bce0833	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	burk tomater		1	jonas@stenberg.io
1e624937-9b9a-4482-89f5-ca68e75512e8	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	buljongtärningar		2	jonas@stenberg.io
488881f5-7d83-4cdb-9a56-2fce3a754618	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	timjan	msk	0.5	jonas@stenberg.io
4e141f1f-9a20-449c-83c9-66c89eda606d	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	kokta vita bönor	dl	5.5	jonas@stenberg.io
a465bad5-2601-4fff-af6f-f59e90527df4	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Muskotnöt			jonas@stenberg.io
3aaf3141-4ff6-4138-b4c7-43d1e7f2d395	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	kokt potatis	g	600	jonas@stenberg.io
c4ea082c-16f7-4e4c-b8f9-d5933fbfeb72	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	hårdkokta ägg		3	jonas@stenberg.io
17e829b1-17b3-4c97-ba3c-40b719ef55ed	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	torskrygg	g	500	jonas@stenberg.io
f25e981c-bc98-4b90-8298-765d0288dacd	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	gullök		0.5	jonas@stenberg.io
50a20fbf-7fb6-4b53-b23c-6b744bc363fc	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	mjöl	msk	1	jonas@stenberg.io
f693aaf4-5e16-4367-bcbd-aebbafd6da34	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	vispgrädde	dl	2	jonas@stenberg.io
2457c93f-ba0c-493f-915e-1782dee3ae2f	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	mjölk	dl	2	jonas@stenberg.io
9d5d333a-207f-47b8-8108-ed73a0c76d08	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Finriven pepparrot			jonas@stenberg.io
6827782f-8b1d-4751-8870-85d060aa5309	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	dijonsenap	tsk	1.5	jonas@stenberg.io
9b8990f7-018a-4dd0-b3d1-a4a910533f03	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	hackad persilja	dl	0.5	jonas@stenberg.io
03aa5e7e-64e7-4752-81aa-8c20445906e6	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Salt och peppar			jonas@stenberg.io
67a93198-c1f9-4124-97a6-4a525b910922	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	En halv påse bladspenat			jonas@stenberg.io
cb7b5648-3192-4143-afbf-4d95c0df2fbd	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	#Minihallonmaränger			jonas@stenberg.io
47b88035-8360-4d86-ad7e-1a200aab6562	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	gram äggvita(or)		30	jonas@stenberg.io
24e63449-b741-43ca-8395-06a70e697584	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	citronsaft, 3 - 4 droppar, pressad	st	4	jonas@stenberg.io
a39b8bf9-f124-420e-a6b3-f10fb2599894	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	strösocker	msk	2	jonas@stenberg.io
7514db9a-5911-4bbb-af92-69cbe3ea031b	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	florsocker	msk	3.5	jonas@stenberg.io
fd0d65f5-9185-4d0d-ac88-af7c8e9dd09d	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	chokladcookies, att strö över	st	2	jonas@stenberg.io
23812aa3-ecb1-4ebf-9c66-092b3a9fab5a	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	hallon, färska, att garnera med	dl	1	jonas@stenberg.io
75940eb3-afce-4a5a-8d3e-feb89a82f75d	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	lakritsgranulat, ev. lite att strö över		1	jonas@stenberg.io
3840212e-2074-4a91-87b7-d7bd4ea58baf	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	#Vit chokladmousse			jonas@stenberg.io
96772676-4418-4657-acb7-2fbc1ee432d4	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	gram vit choklad		100	jonas@stenberg.io
cb3f443c-a6b0-45e0-8e2e-5c19dcc5694a	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	vispgrädde	dl	2.5	jonas@stenberg.io
257a3161-3a36-4403-bb08-37f4b9e6704b	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	lakritsgranulat, eller 2 tsk lakritspulver	tsk	2	jonas@stenberg.io
d177be1b-735d-4b43-a3d7-66bf79b31d20	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	#Tillbehör			jonas@stenberg.io
8d11ee1f-65b4-4a91-baf8-857f68d96016	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	hallon, puré, 1 - 1,5 msk (mixade färska eller frysta och tinade hallon)	msk	1.5	jonas@stenberg.io
3c2db420-2efb-4059-9650-52211a181c62	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	dillkronor	knippa(en)	1	jonas@stenberg.io
2c4d7e95-5cff-4ca2-bb8f-836563fc9a3d	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	västerårsgurka(or)	kg	1	jonas@stenberg.io
589d18e1-e270-4802-88a5-adc6ec075248	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	senapsfrön, gula	msk	3	jonas@stenberg.io
7447f918-d273-4c3c-b311-333471336499	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	ättiksprit, 12%	dl	2.5	jonas@stenberg.io
69601239-0861-4840-8b43-48c84a252aa1	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	vatten	dl	2.5	jonas@stenberg.io
39fe5eac-334e-4c74-b2fe-e99af768e342	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	socker	dl	4.5	jonas@stenberg.io
51d4fd21-c9b1-45be-ab0d-7ca511154475	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	salt	dl	1	jonas@stenberg.io
73bb88cf-9076-4b05-ae29-2fc2d52197e2	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	pepparrot		1	jonas@stenberg.io
7ea96257-21e8-4e9c-8886-e17dabbce822	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	smör	g	200	jonas@stenberg.io
18af71eb-2712-4764-9cd1-455687c23a44	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	socker	dl	2.25	jonas@stenberg.io
4e863f38-ee27-45ba-80d1-4327609c21d1	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	sirap	msk	1	jonas@stenberg.io
5747e81f-74ba-40f6-9bf3-4bb7dc566782	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	vaniljsocker	tsk	1	jonas@stenberg.io
9f6abaca-5b51-4bf8-be22-166e7311fad2	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	bakpulver	tsk	2	jonas@stenberg.io
2ca8dbf1-03fa-4570-9951-ed5be1dba94f	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	vetemjöl	dl	5	jonas@stenberg.io
a8b699ee-d8fd-4b8d-a271-25643dc47038	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	solroskärnor	dl	1	jonas@stenberg.io
3f4da059-0199-4cf5-948a-547a7f54d6f8	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	askar matjesill		2	jonas@stenberg.io
4371e12f-0129-4be3-b613-db907fef3095	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	tub (150g) majonäs		1	jonas@stenberg.io
f743f764-9903-4607-84e4-614d6a9b334e	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	vispgrädde	dl	0.75	jonas@stenberg.io
36706b63-1bd3-48a5-b227-81539b021017	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	gräddfil	dl	1	jonas@stenberg.io
173243fb-cf01-42a2-a758-3cdbf90c8179	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	tomatpure			jonas@stenberg.io
224b679e-e95a-44d3-ad4f-c6fb532be46a	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	hårdkokta ägg		4	jonas@stenberg.io
fe0b68d8-5f2f-4a54-b77f-77fe2a471048	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	klippt dill	dl	1.5	jonas@stenberg.io
15e256cb-ad6e-4940-b71f-ccd47a0c391f	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	hårdkokt ägg		1	jonas@stenberg.io
10f542b4-3ce5-47f1-acc1-a9eebce38995	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	# Till garnering			jonas@stenberg.io
bb269d1b-7b9f-4b07-a2c6-8848b33ffcd5	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	dillkvistar			jonas@stenberg.io
a4ba7065-8748-4bfb-8bdc-2d0ce9ec3ab8	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	# Ugnsbakade rotfrukter			jonas@stenberg.io
bdae1c35-e2f6-4f5f-aacc-0bfc3ff988a6	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	potatisar		8	jonas@stenberg.io
9b03e4c2-d358-4fbf-ace5-3e7af9f1bd52	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	morötter		4	jonas@stenberg.io
f984dfaf-80d8-42a3-b757-530c7731fa06	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	palsternackor		2	jonas@stenberg.io
cf62f1bc-a587-4f8c-91aa-791123557829	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	rödlökar		2	jonas@stenberg.io
2496021d-a3a9-4509-b161-d7a4f251900f	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	# Ostcreme			jonas@stenberg.io
09474b85-37ff-4404-958a-ba226be80ff7	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	Vitost	g	200	jonas@stenberg.io
37425507-3dc1-420d-9980-dcafd3adde79	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	creme fraiche	dl	3	jonas@stenberg.io
6c3b48ca-0ea2-4d18-9652-60df1bffc304	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	pressad citron		0.5	jonas@stenberg.io
0bab5ee2-17fe-4ba6-9066-eb2f592d543d	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	# Grönkålssallad			jonas@stenberg.io
8c82c17a-6b2a-4614-8034-895f8e130e02	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	Grönkål		100g	jonas@stenberg.io
0b1b2374-d248-4181-b234-721cd994cd13	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	Citron		0.5	jonas@stenberg.io
a8ebd30d-c93a-4a49-98b1-dbb0d8bfdb1f	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	Äpple		1	jonas@stenberg.io
06c5393e-7115-4ff5-8bf2-8b69c63020f1	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	# Tillbehör			jonas@stenberg.io
6aed6517-fb0e-4e3f-b808-99bd78b7316b	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	Halloumi			jonas@stenberg.io
\.


--
-- TOC entry 3414 (class 0 OID 19327)
-- Dependencies: 215
-- Data for Name: instructions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructions (id, date_publised, date_modified, recipe_id, step, owner) FROM stdin;
98be6521-bce6-46a5-9ad2-7cd25c4d2803	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Koka ris enl.	jonas@stenberg.io
86ef8055-b4d8-4729-8371-041b1fac24ab	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	anvisningarna på paketet.	jonas@stenberg.io
89db3f74-d76c-4531-bdce-c8b94adb5689	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Hacka lök och vitlök och fräs i olja.	jonas@stenberg.io
88fe49ee-0fff-4a42-aac0-40043624cdb6	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Hacka basilikan och tillsätt tillsammans med kokosmjölk, curry, currypasta och kikärtor.	jonas@stenberg.io
f4a9235b-831a-4462-a0f9-ca9b4efb7509	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Smaka av med salt.	jonas@stenberg.io
8c0e2b7c-b9ca-4545-a93f-737d73032287	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Koka upp och låt puttra i ca 5 minuter.	jonas@stenberg.io
ba33c38a-683f-494d-bffc-3b3cfaeb794f	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Dela tomaterna på mitten och häll i grytan.	jonas@stenberg.io
f009663c-61ef-43d5-8504-f77cc50886fc	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Tillsätt saften från 1/4 lime.	jonas@stenberg.io
24101b4c-1a02-43d3-ba23-f70f72adcf4f	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Låt koka tills tomaterna är mjuka.	jonas@stenberg.io
6987b83f-3900-4eaf-aca6-885ba63b62fa	2023-08-24 07:26:52.673329	2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	Servera med ris och toppa med färsk basilika.	jonas@stenberg.io
6fa4e72b-5b40-4e6a-ac67-f3a4038622ef	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	Blötlägg bovetet i ca. 30 minuter.	jonas@stenberg.io
4a91fda3-47a9-47d6-bba0-ac365fd575ba	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	Blötlägg alla fröer i ca. 30 minuter.	jonas@stenberg.io
011ed9d2-8d04-468a-be79-8fafc9ce008f	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	Häll av vattnet från bovetet och skölj noga i kallt vatten.	jonas@stenberg.io
5a270bd9-e1ff-45ca-80c9-5441d8bf6c5b	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	Sila av vattnet från fröerna och låt rinna av i cirka 5 minuter.	jonas@stenberg.io
1921002f-3182-4a9d-8185-dda06c555e2e	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	Värm ugnen till 100 grader.	jonas@stenberg.io
3e144b13-ad31-42ea-9246-b68e31b63573	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	Blanda runt alla ingredienser i en bunke.	jonas@stenberg.io
169af39f-1a38-4371-b2a1-a493bba171a2	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	Bred ut hela klabbet på ett bakplåtspapper och rosta mitt i ugnen i cirka 75-90 (mer om du dubblar receptet) minuter, tills granolan är krispig och gyllene.	jonas@stenberg.io
b41f55cc-f3b8-41cc-9c7d-ec335c21843b	2023-08-24 07:42:33.586989	2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	Tillsätt kokos, kakaonibs och/eller torkad frukt/bär.	jonas@stenberg.io
dfd85141-8c7d-4f72-ba40-01998942105f	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	Finhacka gullöken, vitlöken och chilin. Skär morötterna och bleksellerin i små kuber.	jonas@stenberg.io
5c1c1cba-bdc3-49dc-92c7-7592b57e3be5	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	Stek alla grönsaker i rikligt med olivolja. Ha i tomatpurén när löken är genomskinlig och låt fräsa med någon minut. Blanda ner timjan, oregano, paprikapulver och spiskummit.	jonas@stenberg.io
e6b195df-f7b9-439e-8063-669b53180f75	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	5 cm stora bitar.	jonas@stenberg.io
4691a01f-e09d-484d-bc68-1409fafe2904	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	Ha i burktomaterna och en burk vatten och låt koka upp.	jonas@stenberg.io
aeabb756-ba85-4a27-b04c-598b4a99c362	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	Blanda ner bönorna och kakaon och låt koka ca. 10 minuter. Salta och peppra.	jonas@stenberg.io
25aafab1-8b47-45a2-aac2-4740a010a077	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	Skär bort båda stammen och bladen på koriandern. Finhacka stammen och lägg ner i grytan innan servering.	jonas@stenberg.io
556e55ae-65ee-4b71-a09d-a74b3a93b869	2023-08-24 07:01:13.692423	2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	Grovhacka bladen och servera vid sidan om. Eller i en Pico de gallo.	jonas@stenberg.io
4c3464d1-9c35-4017-8353-145cd1c56a04	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	Sätt ugnen på 200 grader.	jonas@stenberg.io
6bc01a4b-8e69-4d7d-92d8-00b7000a3336	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	Tvätta bakpotatisarna och gör sedan ett kryss på toppen eller nagga dem med en gaffel så att de inte spricker i ugnen. Baka potatisarna mitt i ugnen ca 1 timme.	jonas@stenberg.io
2355c079-1368-4439-b125-0459760ca0e2	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	Häll av vätskan från tonfisken. Skala löken och finhacka den och sellerin. Blanda ihop tonfisk, lök, selleri, majonäs, creme fraich, dijonsenap, citron och dill. Smaka av med salt och peppar. Låt stå i kylen medan du bakar potatisarna.	jonas@stenberg.io
2245d93d-6acb-41ac-9234-198293576650	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	För att se om de är klara kan du sticka en kniv i mitten och känna om de är helt mjuka. Ta ut och låt svalna något.	jonas@stenberg.io
b14153ef-b832-4e20-aff0-e57b48b189a9	2023-08-24 07:35:50.847349	2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	Öppna upp potatisen, klick i lite smör och fyll med tonfiskröran. Bjud gärna med en sallad till.	jonas@stenberg.io
a5873de5-3aa0-47f4-bd5a-c7429bab64cc	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	Hacka gullökarna, vitlöksklyftorna och ingefäran fint.	jonas@stenberg.io
8d048ca1-bb20-492e-8a2d-b1d05c986b41	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	Fräs i kokosolja i några minuter tills löken är genomskinlig.	jonas@stenberg.io
1de98c20-5a9e-48bf-b54f-32a90633dc68	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	Tillsätt tomatpuren och adobo chipotlen och fräs ytterliggare en minut.	jonas@stenberg.io
08974641-9777-4d5c-a4f7-760f6232ad86	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	Grovriv morötterna under tiden.	jonas@stenberg.io
3afa65ab-e8ee-4988-bd30-11714c8eca55	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	Ha i krossade tomater och morötterna och puttra i minst 30 minuter.	jonas@stenberg.io
28985cce-6c5e-4bc6-be3c-82b7e7a3060b	2023-08-24 07:36:29.651365	2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	Tillsätt kokosmjölken och de röda linserna och koka tills linserna är klara.	jonas@stenberg.io
309a2128-30b2-49a9-9ee4-d48c67cb21e7	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	Rör ihop allt utom salt for hand i en bunke.	jonas@stenberg.io
b11cc324-7cb4-4121-bc43-dc19373ae57f	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	Låt vila några minuter (max 30), tillsätt salt och blanda någon minut.	jonas@stenberg.io
cbddb0df-e3a7-4677-bdad-d0659eded552	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	Stjälp upp degen på ett mjölat bakbord och dela den i sex bitar.	jonas@stenberg.io
7029773b-5e99-4755-a8de-792935cdb963	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	Rundriv bitarna, lägg dem på ett bakplåtspapper på en bricka och ställ in i en avstängd och kall ugn med några kylklampar och isbitar på en plåt i botten.	jonas@stenberg.io
ff7a4f34-3e95-4646-82b1-dcf811f11bf0	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	Dag 2, morgon Ta fram bullarna ur ugnen och sätt den på 275 grader med en plåt i mitten och en oöm plåt på nedersta hyllan. Låt ugnen bli riktigt varm.	jonas@stenberg.io
ebc6ae24-401e-4e21-b99d-9605ed283722	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	Pensla eller spreja på lite vatten och strö på lite solroskärnor och linfrön.	jonas@stenberg.io
aa3060d7-1e6e-4b96-bb1d-ef611e70bd28	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	Sätt in bröden i ugnen och lägg några isbitar på den nedre plåten.	jonas@stenberg.io
8edc827d-b4c5-407e-a61e-89174ec624c7	2023-08-24 07:13:44.960691	2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	Sänk värmen till 250 grader och låt bröden stå 15-20 minuter eller tills de fått fin färg.	jonas@stenberg.io
57d7b75c-c569-4cd9-a4e2-d177f781f78a	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	Koka potatisarna så de nästan är klara och låt svalna.	jonas@stenberg.io
ffe729ca-c91c-44d4-a7d3-647bee9a768c	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	Värm på smöret och ha ner vetemjölet och rör om tills det blir klumpfritt.	jonas@stenberg.io
2e89b258-b984-4ca5-84a6-1dd9fe4044ec	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	Blanda ner hälften och grädden och hälften av mjölken och vispa runt.	jonas@stenberg.io
9b0e9e64-04a4-4388-9097-176c3b9dd104	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	Ha i resten av grädden och mjölken.	jonas@stenberg.io
85676f67-9d3c-4c88-86f9-6098326f477b	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	Riv i muskot efter smak och salta och peppra.	jonas@stenberg.io
25c826a9-7d8a-46d0-b130-54ee058c8769	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	Hacka potatisen i lagom stora bitar.	jonas@stenberg.io
9c7e6859-07d1-4e87-a38d-89d01e3da15f	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	Vänd ner potatisen och dillen och rör runt.	jonas@stenberg.io
8419ee09-dad1-4f4f-9512-e57460ae3440	2023-08-24 07:37:48.002149	2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	Servera med gravad lax.	jonas@stenberg.io
20e4f3ae-3f4b-46de-a070-10f7fec8d39f	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Ställ in bunken och kniven till en matberedare i frysen minst 30 minuter.	jonas@stenberg.io
adff2f46-1341-43a7-b9a8-f5cd8d6995a4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Potatispuré: Skala potatisen och koka mjuk i lättsaltat vatten.	jonas@stenberg.io
e690dbfb-e771-4552-baed-e32f5c87ab4c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Häll av.	jonas@stenberg.io
cc1ebb2c-14c8-4228-ac56-60222d0ba330	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Värm mjölk och grädde i en kastrull.	jonas@stenberg.io
a49de0e3-3c55-44f5-a398-c522778dcec8	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Pressa potatisen och blanda med smör och gräddmjölken till en puré.	jonas@stenberg.io
662a51f0-2ebe-4a83-a43c-cbbe0104193d	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Smaka av med salt.	jonas@stenberg.io
b23f2788-e01e-46b1-8138-6f0a1a7d35b5	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Skär fisken i mindre bitar och lägg i den kalla bunken med 1 tsk salt och peppar.	jonas@stenberg.io
163d006b-fa6f-4653-8e0f-8ead7f932cb8	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Mixa så att fisken finfordelas, tillsätt grädden i en tunn stråle under fortsatt mixning.	jonas@stenberg.io
235e48fb-0a97-46fa-aa97-60e814e95138	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Sätt ugnen pa 125 °C.	jonas@stenberg.io
094f6c5e-172f-4692-804b-61d02c737913	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Forma smeten till 4 stora eller 8 mindre runda bollar och lägg på ett fat med ströbröd.	jonas@stenberg.io
b68e55bb-71d1-4a56-a29c-94a6c605b5b0	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Tryck till försiktigt och vänd runt i ströbrödet.	jonas@stenberg.io
206f7444-f2be-4123-9e96-5d65da5967f0	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Stek wallenbergarna i rikligt med olja och smör tills de är gyllene.	jonas@stenberg.io
826bb0e1-f787-4e76-846b-a6f652ffcce4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Lägg i en ugnsform och stall in i mitten av ugnen ca 10 minuter tills innertemperaturen är 58 °C.	jonas@stenberg.io
c6c4e61a-6557-4769-ac0a-dbb8e65d6a39	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Servera med potatispure, rårörda lingon, ärtor och citronklyftor.	jonas@stenberg.io
505f7220-b426-4aec-aa80-aec7bbbe62d6	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	Toppa gärna med dill.	jonas@stenberg.io
ffd9bd62-be7c-41fc-bb57-5c9259042afe	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Sätt ugnen på 220 grader.	jonas@stenberg.io
a08465bd-c0ab-4b9e-ac25-b1dceb91d0ba	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Tärna sötpotatis i 2 cm stora bitar.	jonas@stenberg.io
d48a07d3-40b9-4deb-864d-b380d27d9983	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Blanda med olivolja, salt och peppar på en blåt med bakplåtspapper.	jonas@stenberg.io
fbb93fbb-9fd6-4259-80c4-197d7539ced6	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Sprid ut och rosta i ugnen i ca 20 min, eller tills mjuka.	jonas@stenberg.io
4954705b-3d00-4ef0-91b3-14e91d9f676d	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Skölj linser.	jonas@stenberg.io
b5559574-6f02-49c7-9d81-722500b272ea	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Finhacka lök, vitlök.	jonas@stenberg.io
8b0621fc-074e-4669-93e1-eb6af531e364	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Finriv ingefära och grovriv moroten.	jonas@stenberg.io
63855715-6377-4fea-b53e-f3d766e329bc	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Hetta upp olivolja i en traktörpanna eller kastrull på medelhög värme.	jonas@stenberg.io
d85542c3-311a-4e74-a09f-387c472a8f44	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Fräs lök och vitlök i 2-3 min.	jonas@stenberg.io
4c4f613b-deb5-443a-8119-801fa05771de	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Tillsätt ingefära, garam masala och curry, och fräs i 1-2 min.	jonas@stenberg.io
b9fdc164-0da9-436c-8df2-647dc0876b90	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Rör i kokosmjölk, 4 dl vatten och grönsaksbuljongen.	jonas@stenberg.io
4b16dd4b-b516-4a28-a247-12f8c4ee9ca8	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Tillsätt först belugalinser, ca 5 minuter innan de röda linserna.	jonas@stenberg.io
c51132c8-46c8-4fdf-a0ac-c6588275a7b4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Koka upp.	jonas@stenberg.io
77b319ca-fde6-45ec-9618-6ce322f52f6f	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Sänk sedan värmen och sjud under lock tills linserna har mjuknat, ca 20-25 min.	jonas@stenberg.io
12796976-5b0c-48e9-9023-6e06d7e3e05f	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Smaka av med några droppar citronsaft, salt och peppar.	jonas@stenberg.io
54176043-52e4-4294-85a1-b45fb888dc9f	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Finhacka koriander och blanda med olivolja, salt och peppar i en skål.	jonas@stenberg.io
1adc79fa-6058-46b3-9faf-ea07ee55b550	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	När det återstår 10 min koktid på dhalen, skär tortillas i 3 cm breda band och placera på en plåt.	jonas@stenberg.io
45da9f31-54d2-470e-82d7-b61e905850e4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Pensla över korianderoljan och rosta i ugnen tills gyllene och krispiga, ca 4-6 min.	jonas@stenberg.io
47b1d514-7266-4de8-9543-29752d9c69ad	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Skölj spenat och rör ner tillsammans med sötpotatis.	jonas@stenberg.io
7ec249b1-b490-46bf-9a01-612eb8f36aec	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Koka upp så spenaten tappar sin spänst.	jonas@stenberg.io
49524e3e-ec92-4d45-9ec6-6d03feee8dbc	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Servera med en klick yoghurt och krispiga korianderchips.	jonas@stenberg.io
e800b679-d51c-4d79-96e2-39bb45e0c113	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	Hacka lök och vitlök.	jonas@stenberg.io
13b21991-7169-49e4-b2d9-c21b78011c48	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	Fräs i olivoljan.	jonas@stenberg.io
e6ae1063-e68d-448c-a939-ecd2ad5aa71c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	Låt chiliflaksen och kaprisen fräsa med mot slutet.	jonas@stenberg.io
76de389f-e991-42a0-ada7-98778b74cd50	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	Tillsätt tonfisken och några droppar citronsaft.	jonas@stenberg.io
29dff210-129b-4afc-8931-3ccbd82a3c3e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	Koka spaghettin och spara 1 dl pastavatten.	jonas@stenberg.io
19ba5314-f9c1-45ec-8bf2-77f0d2534e7c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	När pastan nästan är klar, ha i rivet citronskal från en halv citron och persiljan.	jonas@stenberg.io
ae154c0c-4040-44de-a8a5-f4d2cec759a9	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	Börja med en halv dl pastavatten och känn efter hur konsistensen blir, tillsätt mer om det behövs.	jonas@stenberg.io
479c20bc-d563-460c-b262-8145c8e2d000	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	Vänd ner pastan och servera med parmesanen vid sidan om.	jonas@stenberg.io
bb192826-7fba-4b33-a976-c77103958ab4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	Koka upp grädde och socker, låt koka 1 minut.	jonas@stenberg.io
1ff33da0-4614-4293-94bb-2ae7ea69b7ae	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	Ta från värmen och rör ner citronjuice.	jonas@stenberg.io
34b80f37-9d57-4307-9e6c-c820420df331	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	Häll upp i 6 formar eller glas (för 6 port) och ställ i kylen minst 4 timmar eller tills de stelnat.	jonas@stenberg.io
4c7ca138-2f0c-47b0-a940-46755ed0703f	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	Till servering: Toppa med hallon vid servering.	jonas@stenberg.io
d21b2b5c-5a5f-4513-a2ae-83f182368f96	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Hacka gullök.	jonas@stenberg.io
8d82f43c-ebfd-4d1d-a2b8-83e8b80ce160	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Skiva morötter och rotselleri i ca.	jonas@stenberg.io
f6975212-7a53-4937-8505-4368cf7c5282	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	0.	jonas@stenberg.io
f4391476-a10c-4915-aaf9-34b6b3b811d5	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Finhacka vitlöken.	jonas@stenberg.io
3b62fe05-ace7-40de-a5dc-22d6583ff87d	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Fräs gullöken, vitlöken, morötterna och rotselleri i olivoljan tills löken är genomskinlig.	jonas@stenberg.io
eda06bd5-69bd-47cc-bb2a-b5c36f269401	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Ha i anammafärsen och fräs med ytterliggare några minuter.	jonas@stenberg.io
cf2e437f-b070-4fe4-84c4-e275dc76fb2a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Ha i tomatpuren och fräs med en minut.	jonas@stenberg.io
18330a01-a7e9-4599-8925-fa5dd62c737a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Ha i vinet och låt det vätskan puttra bort någon minut.	jonas@stenberg.io
daa02af2-6d52-4be1-b3de-b42306ab4ac5	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Tillsätt burktomaterna och den torkade basilikan och låt puttra.	jonas@stenberg.io
5969d607-1c21-4de4-8172-e1629e32280a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Desto längre desto bättre.	jonas@stenberg.io
ba489a65-50cf-4f4d-ba22-3efe190eb9f8	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Tillsätt vatten om det blir torrt.	jonas@stenberg.io
1c09d6a0-6c78-4d88-9cbb-ada16ac562ed	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd534f07-426c-4dcc-87e0-8174d44d03f7	Smaka av med salt och peppar.	jonas@stenberg.io
553726c7-1b1b-4109-b062-51bf21e67f60	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8f4f0cd3-b2b8-4e78-8110-15459b651d18	Koka först blåbär, vatten och socker.	jonas@stenberg.io
a53bb013-c0a9-4544-9519-888161b44d30	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8f4f0cd3-b2b8-4e78-8110-15459b651d18	Sedan ner med grahamsgrynen och saltet och koka i cirka 5 minuter.	jonas@stenberg.io
267af4ba-4315-4d4f-9d52-bd5e5c76afa7	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	8f4f0cd3-b2b8-4e78-8110-15459b651d18	Servera gärna med rostade kokosflakes, hackade hasselnötter och en klick honung.	jonas@stenberg.io
ed576d57-be74-4a39-916f-a632bd73249b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Blanda alla ingredienserna utom ägget med elvisp.	jonas@stenberg.io
fa356ecb-1761-4d2d-8829-d85a833ab8dc	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Rör sedan ner ägget.	jonas@stenberg.io
e78611b5-cc33-44da-98ac-336ee6225021	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Rulla degen till en rulle.	jonas@stenberg.io
12526330-8793-40ba-afef-f03cde1aaec7	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Dela i 4 delar, och sedan varje del i 4 delar.	jonas@stenberg.io
61d5802e-506b-43df-941b-b54f1eae989f	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Totalt 16 delar.	jonas@stenberg.io
2ddca1b7-87b6-4195-b777-a67a78bc830f	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Platta ut en bit i taget på mjölat bakbord, vänd vänd sedan den mjöliga sidan uppåt när degbiten läggs i aluminiumformen.	jonas@stenberg.io
63b57776-72ff-44b6-bfb3-23ba8afbe197	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Tryck ut den.	jonas@stenberg.io
ef25c0c9-e7e4-4ce9-8594-1c7eeaf4b217	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Lägg i färska eller frusna bär.	jonas@stenberg.io
e0d68cd7-7d00-4ccc-a708-93219340d5c9	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Strö över 2 msk socker och 0,5 msk potatismjöl.	jonas@stenberg.io
dc07269a-fedd-46ca-98be-9bd47d082e67	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	Grädda i 225 grader i ca.	jonas@stenberg.io
ba2c1353-83d2-46d8-bf68-c86d121e8255	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	0789d29d-8a27-496d-a4d1-c662200a6281	12 minuter.	jonas@stenberg.io
f5c0ea13-982c-41f3-8af3-e0dacd195da7	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	Varva gärna den inlagda sillen med gula lökringar och garnera sedan med rödlöksringar.	jonas@stenberg.io
b153eac4-9b91-46f6-a23b-6d373e7c7d93	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	Tar man rödlök från början blir sillen lätt rosagrå och trist i färgen.	jonas@stenberg.io
cbc71602-cbb9-408c-b7c0-629e8357d71e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	Lägg morötterna på en klädd plåt.	jonas@stenberg.io
58fc54ab-8bdd-4a68-be57-553436214ec6	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	Ringla över olja, placera i mitten av ugnen och rosta mjukt på 220 grader varmluft i cirka 20 minuter.	jonas@stenberg.io
a953eecf-5156-496a-bea7-ae9ad274b84e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	Koka under tiden upp vatten, syrad grädde och buljontärningarna.	jonas@stenberg.io
59bbe0e1-e65a-48db-82d0-6205d21a42c1	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	Vänd i de rostade morötterna och mixa slätt.	jonas@stenberg.io
7d3522f8-063a-4521-9dec-8eca1584c922	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	Späd eventuellt med mer vatten om du vill ha en tunnare soppa.	jonas@stenberg.io
7bd787ac-f7a7-4e5a-a979-f60fa523e2c2	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	Smaksätt med kryddorna och låt koka i ytterliggare cirka 5 minuter.	jonas@stenberg.io
a3af1297-57dc-46fa-909a-00a88ed1cbc9	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	Toppa soppan med yoghurtbollar, granatäpplekärnor, plockad dill och pistagenötter.	jonas@stenberg.io
37823183-f021-4a6d-8e3a-06a0c2e7c398	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	Avsluta med att ringa över lite olja.	jonas@stenberg.io
df85fbd4-e9ce-4973-b1b2-2ca7f44f7730	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	234950c8-2db3-4aa6-9bfa-20c38b52af85	Mixa allt.	jonas@stenberg.io
5841e642-d422-4f08-9ace-1285cf970774	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	a27b18c2-7351-4818-bb33-c1387e76e307	Häll över samtliga ingredienser till soppan i en medelstor kastrull.	jonas@stenberg.io
75e0e0b1-4820-4c6d-b1e9-93477df29ccd	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	a27b18c2-7351-4818-bb33-c1387e76e307	Låt koka i cirka 15 minuter.	jonas@stenberg.io
a8ca30f3-79b1-484e-b2c4-ac819ce71ac6	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	a27b18c2-7351-4818-bb33-c1387e76e307	Mixa slätt med en stavmixer.	jonas@stenberg.io
6b39cc38-02d1-4127-a52e-0f8e34f231b2	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	a27b18c2-7351-4818-bb33-c1387e76e307	Smaka av med salt och svartpeppar.	jonas@stenberg.io
5d81618a-b724-4c44-9c00-658da5f34d6c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	a27b18c2-7351-4818-bb33-c1387e76e307	Servera med kokt matvete, solroskärnor och eventuellt andra knapriga toppingar som krutonger, sesamfrön och kanske lite fetaost.	jonas@stenberg.io
e26356f7-0475-44cf-a589-c8398aa3411a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Finhacka löken och vitlöken.	jonas@stenberg.io
7416c4c7-5145-41e2-88bc-fa53bee683c9	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Skär grönsakerna i lagom stora munsbitar.	jonas@stenberg.io
0cdd2cae-090b-4ff5-81da-b35eae25f43b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Tomaterna behöver inte skalas men skär bort fästet och dela tomaterna i stora bitar.	jonas@stenberg.io
f6f73981-0d25-4c6f-97f8-6547fb7117a6	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Fräs löken och vitlöken varsamt i olja i en kastrull eller gryta.	jonas@stenberg.io
24463834-db09-4cbd-930f-6d5fb508e8c9	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Smaksätt med saffran, cayennepeppar, timjan och rosmarin och rör om.	jonas@stenberg.io
2b8cf483-2d5f-415b-8b8b-7538223d6e1a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Lägg ner potatis, morötter, fänkål och tomater.	jonas@stenberg.io
5cd9d064-709e-4738-952d-56c7f8c918f1	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Späd med vatten och vin, lägg i fiskbuljongtärningen och hummerfonden och koka i ca.	jonas@stenberg.io
0d696e40-27f6-4172-83a5-275fc33772be	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	10-15 minuter, eller tills potatisen är lagom mjuk.	jonas@stenberg.io
9c89984a-d1ac-470a-af49-0c9776eac480	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Krydda med salt och peppar efter smak.	jonas@stenberg.io
0b034c68-4cde-4a9c-bfd8-c250115dd768	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Skär den benfria fisken i 3 cm stora kuber.	jonas@stenberg.io
933d20c9-de8a-46aa-8cfb-88cb6bf598b9	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Lägg i fiskbitarna och sjud dom i soppan 3-4 minuter (tunna fiskfiléer som exempelvis spättafiléer behöver bara 1-2 minuter).	jonas@stenberg.io
fdf103da-9eec-400d-af10-5f52b3f5f232	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fc52748c-181d-4c2b-916b-08332cdcb473	Servera med gott bröd och en klick creme fraiche.	jonas@stenberg.io
7a250bec-c15f-4704-aea7-2c63f92bf13c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	b844bebc-62e6-43d8-92f3-af8033543f16	Sätt ugnen på 225 grader.	jonas@stenberg.io
071379f3-f192-432f-a054-3a84f934a4d0	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	b844bebc-62e6-43d8-92f3-af8033543f16	Skala och tärna potatis, morötter, kålrot och palsternacka i ca 1x1 cm stora bitar.	jonas@stenberg.io
b7c7874f-a751-4ec9-abd9-f79ae1bb57bf	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	b844bebc-62e6-43d8-92f3-af8033543f16	Lägg på en plåt, ringla över olivolja, salta och peppra.	jonas@stenberg.io
73062200-ec16-44a9-9160-c7ca2d8187d9	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	b844bebc-62e6-43d8-92f3-af8033543f16	Rosta mitt i ugnen ca 20-25 minuter.	jonas@stenberg.io
699bfbe1-106b-4597-9aba-44caf1fa5016	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	b844bebc-62e6-43d8-92f3-af8033543f16	Stek ägg under tiden.	jonas@stenberg.io
c623dc69-cb96-440c-934b-669d493029d3	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	b844bebc-62e6-43d8-92f3-af8033543f16	Servera med inlagda rödbetor.	jonas@stenberg.io
967fd540-38fa-40f4-b38b-81e7b62dfb6c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	efb431d6-38ea-417c-b197-b92b346e5fbb	Rödbetarsallad med hemgjord (grönkål) pesto och quinoa: Koka rödbetor med skal på tills de är nästan mjuka inuti i saltat vatten.	jonas@stenberg.io
53ea14ca-4642-4ffb-9b57-a3a2b04b24b4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	efb431d6-38ea-417c-b197-b92b346e5fbb	Låt dem svalna eller skölj dem med skal på i kallt vatten och dra av skalet med händerna.	jonas@stenberg.io
f13dc24d-f541-485c-9e04-2e18301ab8c7	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	efb431d6-38ea-417c-b197-b92b346e5fbb	Pesto: Om jag gör det med valnötter eller grönkål lägger jag vanligtvis till en tsk honung för att sötas upp.	jonas@stenberg.io
e29cd50a-9a19-477f-bd8d-1c96e2222d94	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	efb431d6-38ea-417c-b197-b92b346e5fbb	Mixa allt.	jonas@stenberg.io
b80e47d7-387d-4178-9e82-e9998871fbd4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Rör ner resten av sockret lite i taget.	jonas@stenberg.io
b240c343-305f-4adc-a9d7-61104220af10	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	efb431d6-38ea-417c-b197-b92b346e5fbb	Skär rödbetor i 1/2 cm skivor och lägg babyspenat och rödbetor i lager, tillsätt fetaost på toppen och servera med kokt quinoa och pesto.	jonas@stenberg.io
3b47a016-d1b8-4fa0-9d9f-065e7cf92326	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	49d79c70-f086-4339-b5c5-df189a86074f	Skiva tomaterna i ca.	jonas@stenberg.io
4b9e7b2d-47f8-465e-a3ec-b071004967f9	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	49d79c70-f086-4339-b5c5-df189a86074f	1 cm stora bitar.	jonas@stenberg.io
d09b883f-5332-46c3-a611-4c5886c32e58	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	49d79c70-f086-4339-b5c5-df189a86074f	Hacka salladslöken tunt.	jonas@stenberg.io
7166c83c-c1ba-41ee-99e4-156fa53497aa	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	49d79c70-f086-4339-b5c5-df189a86074f	Grovhacka koriandern.	jonas@stenberg.io
d4ed0a88-4e9a-49b3-8a3e-d2689f2d21bd	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	49d79c70-f086-4339-b5c5-df189a86074f	Blanda allt i en skål och pressa över en halv lime.	jonas@stenberg.io
c706a7fd-e581-4d13-8046-ddff8f619ea6	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	49d79c70-f086-4339-b5c5-df189a86074f	Även gott att blanda i en halv finhackad mango.	jonas@stenberg.io
cebdf5b4-5bdc-4024-8a13-95d58f609ba2	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Skiva/mandolina/osthyvla en gurka.	jonas@stenberg.io
551125f2-3650-4ca8-99c1-fec346719ce2	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Blanda ner 3 kryddmått salt i en skål.	jonas@stenberg.io
061135cd-2b48-42f4-af05-3165a61c92eb	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Lägg ett fat med en tyngd över och låt stå ca 30 minuter, häll av spadet.	jonas@stenberg.io
95411db7-8b7d-4344-9651-c6f526f289b7	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Gör en lag av 2 msk ättika, 1 dl vatten, 2 msk socker och 2 msk hackad persilja.	jonas@stenberg.io
2147c86b-e652-4dee-9dd6-f21da1945298	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Lägg gurkan i en burk och häll över lagen och låt stå minst en timme innan servering.	jonas@stenberg.io
1460176b-969a-474c-b8f6-98ec9cd3a1e8	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Ta fram den frusna vegfärsen och tina några timmar.	jonas@stenberg.io
b9be7e82-7f17-4498-80e6-878ca7ceee34	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Tina ett paket frysta lingon, rör ner lite mindre än 1 dl socker och rör om.	jonas@stenberg.io
73245270-55ba-49e0-9814-50a6eb8fa6c6	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Låt stå minst 1 timme.	jonas@stenberg.io
943b0cfa-76d6-4350-8673-0125671af1ac	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Till ca 4 pers: Grönpepparsåsen: Krossa grönpepparkorn i en mortel, får gärna ha lite bitar kvar så det inte bara blir ett pulver.	jonas@stenberg.io
39b01b99-8a75-4040-b36a-f10c3321814c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Grovhacka ett gäng skogschampinjoner och stek i matfett i en kastrull tills de fått färg.	jonas@stenberg.io
e930a329-e96d-4ac0-b604-fc68d1e744f2	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Ha i den grovmalna grönpepparen halvvägs in på stekningen.	jonas@stenberg.io
71f54a1b-a2a1-4a43-b8a9-cc39579bf658	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Häll på grädde och en skvätt soja (jag tycker kinesisk är god men funkar nog med vilken som) och låt koka upp.	jonas@stenberg.io
bbdd168e-7edd-4416-82fd-9817a8f3a4f3	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Smaka av med mer grönpeppar och salt.	jonas@stenberg.io
0e0dcc66-9b4c-4f86-af0a-f501ff6bf111	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Om man vill lyxa kan man hälla på 2 msk konjak innan man har i grädden.	jonas@stenberg.io
70098162-ca00-4c27-b4ee-7764e0740e61	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Blir också godare om såsen får koka upp en stund.	jonas@stenberg.io
076592b3-c3f8-4e25-b983-651bb6380deb	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Koka potatisen.	jonas@stenberg.io
ade1e25b-e61f-4673-9dca-75184e573b93	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Köttbullarna: Blanda 1.	jonas@stenberg.io
ce89e51c-b700-4158-9c8d-9dd7c974573a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	5 dl mjölk och 1 dl ströbröd i en stor skål, låt stå ca 10 minuter.	jonas@stenberg.io
00170454-9ad5-4f50-931f-586890772e97	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Tillsätt en grovriven stor gullök, 1 ägg, 500 g färs, 1-2 tsk salt och rätt mycket malen svartpeppar.	jonas@stenberg.io
26fa9769-298f-4290-98bf-b429488de71b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Forma till köttbullar och lägg på ett fat (tips, ha kallt vatten på händerna när du gör köttbullarna).	jonas@stenberg.io
59ea1f14-474f-4478-a99a-7f8ed34b05aa	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Stek på medelhög temperatur tills de blivit genomstekta och fått rejält med färg.	jonas@stenberg.io
e93aa6c1-2978-47c4-bf96-ea3fba87a0ff	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	Blanda alla frön, häll på vatten och ställt kallt i 4 timmar.	jonas@stenberg.io
7a4237c6-7685-47e3-bfd2-7a0f6537ecc2	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	Rör om en gång i timmen.	jonas@stenberg.io
1d1fc338-6a86-445a-91e0-a5b323d3ef8c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	Sätt ugnen på 125 grader.	jonas@stenberg.io
4b0abef6-bbf5-456d-bbab-e1a3341ba86c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	Bred ut frömassan i ett jämt tunt lager på en plåt med bakplåtspapper.	jonas@stenberg.io
f0e861a3-62f4-4737-a6a5-58ab9c436443	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	Strö över saltet.	jonas@stenberg.io
fe65f648-0e22-4ac7-9814-23b9fb6df8b5	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	Grädda mitt i ugnen i 1 timme.	jonas@stenberg.io
15c1b2c4-0aa0-45ac-af5c-e7d55123118b	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Sätt ugnen på 220 grader.	jonas@stenberg.io
1a4c7c05-a93e-4681-bfa8-742f275af820	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	Låt ugnsluckan vara öppen med någon centimeters glipa eller öppna var tionde minut och släpp ut ångan.	jonas@stenberg.io
26b2e78c-393d-4aa2-b5bc-d34154d8ea6b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	Sänk temperaturen och grädda ytterligare 1 timme.	jonas@stenberg.io
e0f6c9fc-1093-4235-b9d4-16c80594805c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	Låt svalna och bryt i bitar.	jonas@stenberg.io
e424fac3-c755-4e07-adcb-d0edd509c5e3	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Skölj rabarbern och skiva den i 1-2 cm stora bitar.	jonas@stenberg.io
1baf6e76-7963-4f18-9b66-99999633867e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Borsta citron och apelsin rena i varmt vatten.	jonas@stenberg.io
ec2cece6-c243-4c2d-ae8d-961ae4a44466	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Riv skalet och pressa ur saften.	jonas@stenberg.io
15b91139-9ef7-412c-a7dc-cb16338cd150	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Blanda rabarbern med hälften av sockret samt skal och saft av citron och apelsin i en bunke.	jonas@stenberg.io
1bb27829-be38-4966-8d2e-798dc807c18c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Täck med plastfolie och låt stå ca 12 timmar i rumstemperatur.	jonas@stenberg.io
dcf443e4-1bcb-49ba-ac4f-7430347901d3	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Häll över i en gryta och koka ca 20 minuter.	jonas@stenberg.io
aacdaadd-a763-460e-8125-8c47f290e536	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Rör om då och då.	jonas@stenberg.io
b109ccc0-e107-4f71-86b4-04c5b170a0b4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Koka upp igen och koka kraftigt utan lock i 15–20 minuter till en temperatur på 107–108 grader.	jonas@stenberg.io
2028378b-81e7-47de-9143-84bee9d59dc7	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Rör ut ingefäran i lite av marmeladen och rör sedan ner det i grytan.	jonas@stenberg.io
6b2b3b19-9a1b-4e17-9f5a-dbc2c9722cd2	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Ös upp i rena varma burkar.	jonas@stenberg.io
e820f379-339b-4697-bfbc-0d5b1a70268e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	Sätt genast på lock och ställ burkarna upp och ner tills marmeladen har kallnat.	jonas@stenberg.io
573ec7e9-89e4-474b-80e4-e090b4793a7a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dbecf460-5460-40c4-89a4-d7d704148456	Smält smöret och blanda i socker, sirap och grädde.	jonas@stenberg.io
50b00bd1-6a18-478f-8d22-0d25434de4df	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dbecf460-5460-40c4-89a4-d7d704148456	Blanda vetemjölet och kryddorna.	jonas@stenberg.io
20eec727-e280-4232-b0ba-51a8bcaa5eaa	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dbecf460-5460-40c4-89a4-d7d704148456	Rör ihop alltsammans.	jonas@stenberg.io
6adcb25d-54c8-402a-9dd7-8620ea43190b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dbecf460-5460-40c4-89a4-d7d704148456	Låt degen stå över natten i kylskåpet.	jonas@stenberg.io
f9a3673f-19d9-46aa-8918-edcb23186e45	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	dbecf460-5460-40c4-89a4-d7d704148456	Baka ut och grädda i ugnen på 200 grader.	jonas@stenberg.io
1bdd8305-b5b6-45b5-9827-e2c612519335	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	Laxen Olja en ugnssäker form och lägg ner laxen med skinnsidan neråt Mortla alla kryddor och "massera" in dom på ovansidan av laxen Sätt ugnen på 175 grader och sätt in laxen i 20-30 minuter (kolla lite då och då, osäker på exakt tid) Picklad rödlök Värm upp allt utom rödlöken så sockret smälter Strimla rödlöken I med allt i en burk och sätt in i kylen nån timme innan.	jonas@stenberg.io
5ba38494-26d9-4b2c-bfdd-66a3e1ce5b9c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	12905e60-8310-45f0-8507-ad5334662b3a	Rör smör och socker.	jonas@stenberg.io
c8d99b4b-9299-460b-bc2e-149cf0126d79	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	12905e60-8310-45f0-8507-ad5334662b3a	Blanda i mandlar, skorpmjöl och vetemjöl.	jonas@stenberg.io
e6df87b6-260f-40e7-af83-9716004d078b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	12905e60-8310-45f0-8507-ad5334662b3a	Riv äpplen grovt och varva deg och äpplen.	jonas@stenberg.io
cc9d0da5-421e-4ae6-9c78-18350086f8f5	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	12905e60-8310-45f0-8507-ad5334662b3a	Grädda i ugnen på 225 grader.	jonas@stenberg.io
ec72dc20-d0cc-4de8-8777-492a2d4ab8a4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	12905e60-8310-45f0-8507-ad5334662b3a	Servera med vaniljsås.	jonas@stenberg.io
952a4058-19fa-4b38-b664-df4f53a3647f	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Koka upp köttet i vatten, så det täcker i en gryta.	jonas@stenberg.io
7583ff20-c031-4a8c-966a-27fbf1b44ef5	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Skumma av.	jonas@stenberg.io
a5e6cc1d-ddcd-4b66-a673-6563b786d468	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Salta efter ett tag.	jonas@stenberg.io
5c394cc8-3051-4979-93e3-a1f9b4876d3b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	När man häller i saltet blir det mer skum, fortsätt skumma av.	jonas@stenberg.io
f932c8b9-9e34-44b5-855d-2ff340bcdbef	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	När man skummat av ha i klyftad lök, morötterna och kryddorna.	jonas@stenberg.io
c94bf144-6b5c-4b55-959e-68106eebda21	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Sen ska det sjuda i en och en halv timme.	jonas@stenberg.io
a9e579c8-09e6-4b7d-8804-ace86d4ba962	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Ställ åt sidan och ta upp köttet och låt svalna av.	jonas@stenberg.io
6571840f-139b-42fd-8be7-e1d52805d73c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Gör såsen i en annan kastrull.	jonas@stenberg.io
58229444-6401-40fb-ab2c-2e73254915a1	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Sila av buljongen, och toppred.	jonas@stenberg.io
bd6f6c0d-01ef-455a-946e-dca45da3ac22	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Ha i pressad citron, dill och grädde.	jonas@stenberg.io
fa34a84d-ac04-4859-942c-1337b31e2e90	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	När såsen är av från pannan så kan man eventuellt vispa ner en äggula.	jonas@stenberg.io
38d0f43a-06e6-452d-aae0-8d4ffb13e3e3	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Lägg ner köttet och morotsbitarna.	jonas@stenberg.io
c363a04d-194b-4f83-b008-f059bf389811	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	043263df-ef4d-4694-b989-8b01821706a2	Servera med kokt potatis.	jonas@stenberg.io
d7fa3efe-d232-49a8-b261-6a6e6255f70c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	Strö salt på fisken och låt vila i 20 minuter.	jonas@stenberg.io
4387f6e1-bf67-4eca-8b64-ba3bb9505245	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	Brynt smör: Bryn smöret i en kastrull till gyllene och nötig doft Potatispuré: Skala potatisen och koka mjuk i lättsaltat vatten.	jonas@stenberg.io
76f1105d-6171-48f6-b526-5fc90041328b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	Värm upp mjölk och smor tillsammans.	jonas@stenberg.io
a1a4afbe-61c0-45f1-a879-5155a8f068b0	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	Vispa samman potatisen med den varma mjölken till luftig konsistens.	jonas@stenberg.io
0d957075-0aae-4a25-b458-dba7bb505238	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	Smaka av med salt.	jonas@stenberg.io
bee81634-f868-4ad9-9dc9-43d369d414ba	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	(Vispa inte för länge, dà blir det klistrigt.	jonas@stenberg.io
f3c192c5-9cef-4b3b-a345-f7b3c0a788e7	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	) Äppelsallad: Blanda gulbetor, äpple, citronskal och saft, persilja, rucola, kapris och olivolia.	jonas@stenberg.io
36799cc1-bf9f-4312-82c5-efe765b3d623	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	Smaka av med salt och peppar.	jonas@stenberg.io
757f4de7-c6e9-415c-8c61-0d2686371101	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	Klappa fisken torr och stek i smör ca 3 min pà varie sida, beroende pà tjocklek.	jonas@stenberg.io
1a197c92-6b6d-4778-b8e9-9ab5ddcb3e0b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	Servera fisken med puré, sallad.	jonas@stenberg.io
b2f799a0-d717-4149-8e14-07b9695963d6	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9b6996db-e837-44a4-bd55-46f9ed31f515	brynt smör och pepparrot blandat med krasse.	jonas@stenberg.io
076d4cf5-2fbe-4cf9-86ef-bdf44d81e033	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	05bb7c8d-c879-41cb-aad0-44ce505db2ae	Mortla kardemumma och svartpeppar fint.	jonas@stenberg.io
6157ced6-91ec-43a2-8cc7-023298fb1fd1	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	05bb7c8d-c879-41cb-aad0-44ce505db2ae	Blanda med övriga ingredienser till pastan i en kastrull.	jonas@stenberg.io
458a5ae8-efff-48b9-a234-d337ce73d2e0	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	05bb7c8d-c879-41cb-aad0-44ce505db2ae	Koka upp försiktigt och låt sjuda under omrörning 1-2 minuter till det tjocknat.	jonas@stenberg.io
19f98005-9ec5-42a6-8c35-458e4ba304cc	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	05bb7c8d-c879-41cb-aad0-44ce505db2ae	Värm upp mjölken och tillsätt 1-2 msk guldmjölkspasta eller efter smak.	jonas@stenberg.io
b3303a1b-cc1c-447e-bc21-1144be0b45bb	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	05bb7c8d-c879-41cb-aad0-44ce505db2ae	Tips: För att göra ingefärajuice utan grönsakscentrifug river du ingefära på fina sidan av rivjärnet och kramar ur saften.	jonas@stenberg.io
9cd9e0ad-c34a-4762-828c-acecf78b90b0	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Skala och hacka löken.	jonas@stenberg.io
5cb3affe-6301-4abf-a8d5-d3632a7b75e4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Skala och skär morötterna i mindre bitar eller riv dem grovt med ett riviärn.	jonas@stenberg.io
22bc1849-76c4-48b7-a914-4e9abeb75680	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Skär halloumin i stavar.	jonas@stenberg.io
be78e004-cfc2-4d22-a8fd-7423bc40ad1d	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Stek osten i olja i en stekpanna tills de har fin färg runt om.	jonas@stenberg.io
fde3c56f-a2aa-4136-9a18-b0f640013e30	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Lägg över på ett fat.	jonas@stenberg.io
a2c27a1f-fcc6-4e15-a4c0-838174716b0c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Stek lök och morot i pannan.	jonas@stenberg.io
04a3030b-35a0-47c1-822c-bf22a5e62ccf	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Tillsätt paprikapulver, tomatpuré, dijonsenap och smulad buljongtärning.	jonas@stenberg.io
ae2b215c-d988-4397-8ff1-fd651bd0ea81	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Rör om och låt fräsa i 1 min.	jonas@stenberg.io
a3badbd7-c7cb-4e79-9224-e0bf73dcba8a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Häll på vatten, rör om och låt puttra i någon minut.	jonas@stenberg.io
2e038afb-2843-4b9d-bb17-93c8f44f3093	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Vänd ner halloumin och slå pa grädden, lät koka upp.	jonas@stenberg.io
321eee65-dab0-4ec4-8c09-e3de65dd37ea	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Vill du ha en mer säsig stroganoff, tillsätt lite mer grädde eller vatten.	jonas@stenberg.io
eca3dfbf-f914-4604-ada1-9b3f9f3fcc8e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Smaka av med salt och peppar.	jonas@stenberg.io
c751c63c-fbad-48d4-a249-bfe918f27a7e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Server tillsammans med kokt ris, rucola och hackade hasselnötter.	jonas@stenberg.io
8c17d2f1-3066-4b24-9a28-46bc57594c87	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	647d6e35-8369-4e00-8146-7d0587c28478	Lite hemlagad aioli är gott till.	jonas@stenberg.io
26c3d599-8518-482a-9f8b-b0a8f1d8a6ca	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Sätt ugnen på 175 grader.	jonas@stenberg.io
6e538793-ddc5-469b-acd7-ebf790c50f0e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Gnid in steken med salt, peppar och kryddorna.	jonas@stenberg.io
d31cc831-e038-4807-ab05-c548cde64d30	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Stick in vitlöksklyftorna med hjälp av en vass kniv i steken.	jonas@stenberg.io
18ddfee7-ce3f-461d-862d-e52b71da3d3a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Bryn steken i en stekpanna eller gryta till den fått färg.	jonas@stenberg.io
68e1bf85-f4d3-4bb6-9909-465790908a40	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Om den är för stor så skippa detta steget.	jonas@stenberg.io
91987aa3-0725-4f97-8b0e-d5b636f6507c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Sätt in en aluminiumfolie-klädd form eller plåt i botten av ugnen med 1 dl vatten i.	jonas@stenberg.io
1245800f-c6bb-42a5-8457-8dc20ad1dfc4	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Sätt in steken på ett galler i mitten av ugnen till den fått en innertemperatur på 65 grader.	jonas@stenberg.io
6c6db8a1-192b-45d2-98c7-949e9a6e6e26	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Se till att det alltid finns vätska i formen eller plåten i botten av ugnen så det inte bränner vid.	jonas@stenberg.io
a5ad2c05-3049-42d5-b972-b98814685122	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Sätt ugnen på 200 grader.	jonas@stenberg.io
ea984c77-5eed-4a89-b657-c89974b6aa8d	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Skiva potatisen tunt och lägg i en långpanna.	jonas@stenberg.io
99a83e44-7608-4910-88de-a2f6d792cca1	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	f26e4739-19bc-48f4-91ed-e87268a69423	Häll över vätskan från formen eller plåten över potatisen och sätt in i ugnen till potatisen blivit gyllenbrun.	jonas@stenberg.io
cdded263-0328-441d-b5ca-7c7b042ab17f	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fb5328c4-5e22-41d7-a1e1-35448e96b4af	Hetta upp olivolja i en stor gryta och fräs lök, vitlök, morötter, spiskummin, ingefära och chiliflakes tills de får lite färg.	jonas@stenberg.io
bc2cf06f-b042-4c8e-95d8-3588e0928eae	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fb5328c4-5e22-41d7-a1e1-35448e96b4af	Häll i nästan all kokosmjölk i grytan ihop med grönsaksfond och vatten.	jonas@stenberg.io
0ec71755-6fda-460e-bb80-a76f897e5e5a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fb5328c4-5e22-41d7-a1e1-35448e96b4af	Låt sjuda utan lock cirka 15–20 minuter eller tills morötterna är mjuka.	jonas@stenberg.io
f9fb242d-89a0-4825-887f-b76ab9ec7cd7	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fb5328c4-5e22-41d7-a1e1-35448e96b4af	Mixa soppan slät och tillsätt limejuice, salt och svartpeppar.	jonas@stenberg.io
230fd2c3-104a-4b32-a0ed-ec797b13ae28	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fb5328c4-5e22-41d7-a1e1-35448e96b4af	Späd ev med vatten.	jonas@stenberg.io
4141db59-308f-42cc-8beb-391418903f8c	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	fb5328c4-5e22-41d7-a1e1-35448e96b4af	Till servering: Ringla över resten av kokosmjölken och toppa gärna med pumpafrön vid servering.	jonas@stenberg.io
a851de59-4a7a-476f-8208-0df78160bd42	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Ansa och skölj purjolöken noga.	jonas@stenberg.io
1ee3d5a2-d549-4fd2-953c-49bd2deb929b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Skiva den tunt.	jonas@stenberg.io
c8ce48f8-0d55-4d17-9cfc-fa543cf6866e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Finhacka chilin och halvera tomaterna.	jonas@stenberg.io
e6203bbb-0961-457c-b517-5dd3ef528be9	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Koka pastan enligt anvisning på förpackningen.	jonas@stenberg.io
34664bcb-21bd-49aa-bc1b-95569d145062	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Fräs purjolök, vitlök och chili i oljan ca 5 minuter tills löken mjuknar.	jonas@stenberg.io
dc3f399e-1429-44b1-b5ca-4631a83dab70	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Tillsätt tomatpure och fräs med i en minut.	jonas@stenberg.io
768fb973-cd34-4ae6-a47f-b771a4fe438d	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Tillsätt tomaterna och fräs ytterligare 2 minuter.	jonas@stenberg.io
85a8d0a8-bb03-48bd-bfc7-7a8f48e9fb9e	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Häll på grädde och låt koka ihop.	jonas@stenberg.io
55ddbc88-40f1-4593-a204-f44d99044d57	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Smaka av med citronskal, salt och peppar.	jonas@stenberg.io
b2513f04-7ebb-43fc-9b6c-2bd3c8789547	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Vänd ner räkorna.	jonas@stenberg.io
f48a3681-8d0b-448c-9725-e4211b484cfd	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Blanda pastan med såsen och hälften av osten.	jonas@stenberg.io
01216a3a-5336-436c-a0b0-0e93c5befa9a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	Servera med resten av parmesanen vid sidan av.	jonas@stenberg.io
0a305b6e-124e-48e9-adad-1a5852ad73b8	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	Blanda alla torra ingredienserna och finfördela smöret i.	jonas@stenberg.io
d1c35bb1-319d-4412-a362-a1f5f7353192	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	Blanda i mjölken.	jonas@stenberg.io
d2b8a493-910d-4195-8c50-fa1e89c2e641	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	Gör små bullar som gräddas i 225-250 grader, ca 8 minuter.	jonas@stenberg.io
4705aa30-4060-4748-9b32-21b9f3ee5826	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	Dela bullarna och rosta i 150 grader.	jonas@stenberg.io
f373b50a-def3-4f50-8dc5-0c6d20425960	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Skala och koka potatisen i lättsaltat vatten.	jonas@stenberg.io
afe0952b-cf43-4bf1-be71-47ef461f2c03	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Pressa genom en potatispress och låt svalna.	jonas@stenberg.io
df94b421-21c5-45e1-8486-2d6117ff7384	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Vispa ihop ägget.	jonas@stenberg.io
0c95c7ad-6bcf-448d-ad8b-bbd98202f0aa	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Blanda potatis, ägg, mjöl och 1 tsk salt till en jämn deg.	jonas@stenberg.io
1181c385-864d-48b3-a4a6-2d93d6848004	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Fyllning: Skala och finhacka löken.	jonas@stenberg.io
eeea63b6-a483-4129-9b38-9eb0fceacd85	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Fräs löken i 2 msk smör på låg värme tills den mjuknar ca 10 minuter.	jonas@stenberg.io
bbc88a46-544c-4009-9eeb-3c19c3b08d79	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Höj värmen och tillsätt svamp, kryddpeppar, ½ tsk salt och stek vtterligare några minuter.	jonas@stenberg.io
2f0f5dfe-ac5f-4ad7-87ed-b6641455ed74	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Rör ner nötterna.	jonas@stenberg.io
97e31a25-d542-4453-a940-c91f8c076158	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	Sätt ugnen på 200 grader.	jonas@stenberg.io
53eaa31d-0030-435c-8fad-9c80e345e266	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	### Ugnsrostad potatis Skala och skär potatisen i mindre klyftor.	jonas@stenberg.io
7c6d7878-5ce2-4679-8419-c34135ce93eb	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	Blanda med olivolja, salt och peppar och lägg ut på en plåt med bakplåtspapper.	jonas@stenberg.io
3d17ca5c-c0f3-4c41-8e45-64a02fe46fca	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	Sätt in i ugnen i ca 25 minuter eller tills potatisen är gyllenbrun.	jonas@stenberg.io
e062d9d0-b380-4e53-986a-e6f6fcb9fd80	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	### Pepparrotscreme Blanda alla ingredienser i en skål och bred ut ovanpå laxfiléerna eller laxsidan.	jonas@stenberg.io
9fdf19b2-85f3-40e3-8775-41e5e876946b	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	Sätt in i ugnen ca.	jonas@stenberg.io
00f5d5d5-9f25-4f2d-8c73-8aad7c38dfcd	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	15-20 minuter eller till laxen har en innertemperatur på 55-57 grader.	jonas@stenberg.io
0d417ddb-c9f7-4a89-9c0e-e8958dc75b4a	2023-08-24 06:51:58.952622	2023-08-24 06:51:58.952622	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	Servera med sallad.	jonas@stenberg.io
3124c78d-f2ee-464c-9d04-ef3298de1b82	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	Vispa smör och socker vitt och pösigt. Rör i äggen, ett i taget. Tillsätt vaniljsocker och mjölk.	jonas@stenberg.io
45ac8d98-ab24-4d34-82e7-6a25ec83f1f2	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	Blanda mjöl och bakpulver och rör i smeten.	jonas@stenberg.io
bcc9dc26-076a-4edb-b2f8-57ad815d1f0d	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	Fyll formarna med smeten. Tryck i blåbären med en sked.	jonas@stenberg.io
bffdb27e-b453-44b6-a55d-af060820d940	2023-08-24 20:14:33.252537	2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	Grädda mitt i ugnen på 200° i ca 15 min.	jonas@stenberg.io
cbd00395-d27d-4cbf-987c-22198afbda99	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Sjud fisken i 2-3 cm saltat vatten med fiskkrydd och kryddpepparkorn i en traktörpanna tills den precis börjar bli vit runt om.	jonas@stenberg.io
9bc5612f-5dc9-4701-876c-8927871a910e	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Plocka upp och lägg i en ugnssäker form.	jonas@stenberg.io
3f94f41d-823f-45e1-8cf7-c59537dc360a	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Behåll buljongen.	jonas@stenberg.io
1cf91b86-e1b7-42da-82c9-f043792748b7	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Fräs smör tillsammans med mjölet i en annan kastrull, vispa ner buljongen, pressa citron, ha i dragonen och grädden, koka ihop.	jonas@stenberg.io
af6225b1-fdf9-4887-a3ec-667037833f8d	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Ta av och vispa ner en äggula Häll såsen på fisken, på med lite riven ost och gratinera i ugnen ca 10 minuter.	jonas@stenberg.io
9aa9013a-397d-4f30-80d0-643a31ac11d0	2023-08-24 20:14:49.819859	2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	Servera med potatismos.	jonas@stenberg.io
a2ed2411-0445-4997-847f-5b3f59e6de93	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	Sätt ugnen på 175 grader.	jonas@stenberg.io
127b0af2-e117-4c16-9f13-e9f81b0a5266	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	Ansa rabarbern och skär i små bitar. Lägg i en bunke och tillsätt socker och potatismjöl. Rör om och låt stå.	jonas@stenberg.io
e139fe03-df52-4116-a3ca-948bbc546a67	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	Smält smöret i en kastrull. Ta lite av det smälta smöret och smörj in pajformen. Häll i grädde och sirap i smöret. Rör om och låt koka upp.	jonas@stenberg.io
21500825-807a-4c4a-83e8-a2dd4a8cb753	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	Stäng av plattan och tillsätt resten av ingredienserna till smeten direkt ner i kastrullen. Rör om.	jonas@stenberg.io
c309524d-954f-4e8e-89cd-86cf27259874	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	Lägg rabarberbitarna i pajformen. Häll över den varma smeten och bre ut med hjälp av en sked. Grädda i mitten av ugnen i 30-35 min eller tills den fått färg. (Jag gräddar min ett steg ovanför mitten eftersom min ugn har mer undervärme.) Pajen ska ha ordentligt med färg annars riskerar du att inte få en knäckig paj.\n\nTips: Placera lite folie i ugnen om det skulle droppa fruktsaft.	jonas@stenberg.io
561ec71a-8ab7-4547-a4a7-b1264f6186bc	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	Låt svalna. Pajen blir knäckigare när den svalnat.	jonas@stenberg.io
c9a395eb-7eda-426b-8bd0-62297c8db9c0	2023-08-24 20:15:31.669279	2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	Serveras med glass. Du kan servera glassen bredvid.	jonas@stenberg.io
9a35623b-2a08-49db-956d-48c80a2a054e	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Vispa hop jästen med vattnet i en bunke.	jonas@stenberg.io
04a98d3d-1096-4271-9959-c70d9ee3888c	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Tillsätt rägmjöl, vetemjöl och salt.	jonas@stenberg.io
49ec79db-5361-4416-be01-93c2b56cbbb8	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Rör hop till en lös deg.	jonas@stenberg.io
ca9749c1-511c-4627-b9d0-d8db6b2f7e90	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Tillsätt morot och äpple och blanda hop.	jonas@stenberg.io
43d76019-d93e-487e-995b-4505fe2f2ebb	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Lät jäsa övertäckt i rumstemperatur över natten, eller ca 10 timmar.	jonas@stenberg.io
845e0459-0d90-4f71-a7cf-dd954fb1b0f8	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Sätt ugnen pà 250°C.	jonas@stenberg.io
3886f211-d37c-4dd3-8ebe-f9f8397260b5	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Ställ in en plåt så att den blir het.	jonas@stenberg.io
fb632810-fc3f-434c-a08f-d856dc122946	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Klicka ut degen till frallor på ett bakplåtspapper med mjölade händer.	jonas@stenberg.io
23a62222-8cf5-40b0-a18f-11c797d1fdcd	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Ta ut den varma plåten och skjut över bakplåtspappret med frallorna på plåten.	jonas@stenberg.io
847dbbee-97dc-42d5-9948-a3bdb0effc78	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Grädda i mitten av ugnen 12-15 minuter eller tills frallorna fått fin färg.	jonas@stenberg.io
d9edcaaa-728e-40e8-b776-58cb18c1cb45	2023-08-24 20:15:23.530407	2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	Låt svalna på galler.	jonas@stenberg.io
7dfac247-d36f-4a8b-bca6-643b07ba1ed6	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Strimla köttet tunt och hetta upp en stekpanna.	jonas@stenberg.io
f464d6a9-ac60-4513-92ff-6bab67134942	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Klicka i smör och lägg i hälften av köttet.	jonas@stenberg.io
9eeee94e-3364-46a6-95cb-e92a9503ce00	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Stek på hög värme under omrörning.	jonas@stenberg.io
1baefcf1-6f55-4914-8351-c39b54e7ccfc	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Salta och peppra.	jonas@stenberg.io
950ec745-3ce7-488c-9049-4eb3e3d70ab5	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Flytta över köttet på en tallrik när det fått stekyta.	jonas@stenberg.io
e7382cba-94e0-4570-820c-ea2febcaceb6	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Stek resten av köttet.	jonas@stenberg.io
215a9d6f-a695-4f91-be46-32b439274acf	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Stek lök och vitlök tills löken är mjuk.	jonas@stenberg.io
fe575ead-f9b3-477c-b21a-023f267c4749	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Häll tillbaka allt kött.	jonas@stenberg.io
f271ae50-8de6-4980-8589-bee4ce672eff	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Häll i grädde, senap och soja.	jonas@stenberg.io
965a35e6-7682-4116-8715-1d4c3b456f77	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Lät småputtra några minuter.	jonas@stenberg.io
8d550b1e-6dd9-4836-92cb-0df9c72b14fe	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Lägg bönorna i saltat kokande vatten och låt koka ca 2 min.	jonas@stenberg.io
ce83747f-ff1d-4ac8-ad9f-932af70dce97	2023-08-24 20:15:45.261953	2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Servera grytan med ris eller potatis samt bönorna.	jonas@stenberg.io
510c684d-343a-4335-842f-6b8df2d4e739	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	Blanda alla ingredienser och lägg i en pajform.	jonas@stenberg.io
2ea6698c-8d33-47d9-bdcb-948810d76d8e	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	Lägg på äppelklyftorna.	jonas@stenberg.io
8e066161-5433-40f1-862f-a99f26406442	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	Lägg på smörklickar och kanel.	jonas@stenberg.io
abb4b629-1e40-47e0-8cd4-d5c3bdb5f879	2023-08-24 20:15:53.602008	2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	Grädda i 30-40 minuter på 175 grader.	jonas@stenberg.io
81adb27f-9fa8-4b30-908b-82515902f014	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Blanda vatten och ättikssprit i en skål.	jonas@stenberg.io
33219bfb-3317-4156-8884-7f05279f1526	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Tillsätt saltet och rör tills det har löst sig.	jonas@stenberg.io
ec17374a-efc9-4e88-82a8-03404c20156d	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Lägg ner filéerna i lagen.	jonas@stenberg.io
9c8f1ebf-698d-4ef4-afb4-52cc439d5396	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Ställ in i kyl och låt dem ligga där tills köttet blivit vitt och fast, ca 6 timmar.	jonas@stenberg.io
9351d0bc-7256-4bcc-8697-fc8763d9ed4a	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Häll bort lagen.	jonas@stenberg.io
94716e1c-2db0-45ab-afe5-e3abd36150b9	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Drag skinnet av strömmingen.	jonas@stenberg.io
ebb70985-00e7-4509-a49a-7562ecc6ceb9	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Blanda alla ingredienser till örtsåsen.	jonas@stenberg.io
296af345-be5b-48fe-b95a-b61a2ee4bf4e	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Varva strömming och sås i en burk eller krus.	jonas@stenberg.io
50d8bd88-2b37-43c0-8a81-b742588867e8	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Ställ in den i kylen för att mogna, ca 1 dygn före servering.	jonas@stenberg.io
13813db6-ffc1-4b44-8baa-570b22f6442b	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	Blanda vatten och ättiksprit i en skål.	jonas@stenberg.io
2cf84ac1-4cac-4436-a0c5-a5a2ff96b0c0	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	Tillsätt salt och socker och rör tills det har löst sig.	jonas@stenberg.io
1552eb98-1d6a-4924-a925-c65c29ca1dd2	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	Lägg ner filéerna i lagen.	jonas@stenberg.io
33800742-e220-4548-8de8-69c909b9edc5	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	Ställ in dem i kyl och låt dem ligga tills köttet blivit vitt och fast, ca 6 timmar.	jonas@stenberg.io
2694ab9d-6578-464d-b576-3522a16e0880	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	Häll bort lagen och drag skinnet av strömmingen.	jonas@stenberg.io
e4bc28d0-9f27-4c39-8adb-ccfaa4f82568	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	Blanda alla ingredienserna till senapssåsen.	jonas@stenberg.io
1da9c914-bd4c-4f21-bafd-8b7f3041f81e	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	Varva strömming och senapssås i en burk eller ett krus.	jonas@stenberg.io
8c179e26-2c35-4302-a612-3b7d30c4b3fb	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	Ställ in i kyl för att mogna ca 1 dygn före servering.	jonas@stenberg.io
c8c3c245-ee01-4863-a0e5-06bf20810d94	2023-08-24 20:18:14.721337	2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	Hållbar 1 vecka i kyl.	jonas@stenberg.io
2769ae47-6f56-4c3a-93a3-dfd1aa581c90	2023-08-24 20:17:50.366811	2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	Hållbar ca 1 vecka i kyl.	jonas@stenberg.io
76ad54e3-b1b7-4be8-bf80-50cc78bcccf7	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	Bryn köttet, i smör och olja.	jonas@stenberg.io
739a6a8a-1097-4318-903c-dc8bfd768111	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	Bryn löken.	jonas@stenberg.io
64718784-fe6b-487b-88ab-54960896c41c	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	Blanda alla ingredienser i grytan och koka på låg värme under lock till köttet är mört.	jonas@stenberg.io
2a7f6309-e578-4e9c-96d2-47c852027614	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	# Såsen Ta upp köttet och linda in i aluminiumfolie.	jonas@stenberg.io
c133e082-2908-4c76-b5ad-6b863aca2b5f	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	Sila av skyn och red den med maizena.	jonas@stenberg.io
df7a0c45-529b-454a-b652-fbd426e3fdb3	2023-08-24 20:18:21.816892	2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	Tillsätt grädden och smaka av med svartvinbärsgele.	jonas@stenberg.io
76824162-c63a-4716-b93c-a17237ddfe6e	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	Skala och hacka lök och vitlök.	jonas@stenberg.io
0dcffeb2-187a-417a-bad6-ca6f8d21016c	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	Fräs hacket i smör i en gryta tillsammans med paprikapulvret.	jonas@stenberg.io
3870ace6-3ffd-49dd-a5ad-7198fe8beaf9	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	Hacka paprikan och låt den fräsa med.	jonas@stenberg.io
49e04274-cc3c-45a2-9c51-130c2fc77d4c	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	Tillsätt tomater, vatten, buljongtärningarna och timjanen.	jonas@stenberg.io
ac6e5476-a7b4-431b-8678-4cd35a062c2f	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	Koka på svag värme ca.	jonas@stenberg.io
e8187d76-f91c-42b9-8a08-aa28f97151c6	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	10 minuter.	jonas@stenberg.io
683620a1-8e98-4bc8-8660-f8d7bfe21039	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	Lägg i bönorna och låt den koka upp.	jonas@stenberg.io
5b0c08fd-1d89-4dc2-a7b4-a8bf6af84fa5	2023-08-24 20:18:30.179113	2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	Smaka av med lite socker och vinäger.	jonas@stenberg.io
ab049d89-5bf8-4193-9ce1-dbcfe9f6dfdc	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Rimma torsken genom att gnida in salt runt om den och låt stå i kylen i ca.	jonas@stenberg.io
c302b979-a1ba-42d6-8ff5-22c957bbd211	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	ett dygn.	jonas@stenberg.io
8ddcad8b-fa75-4d23-8706-39d079e519d4	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Fräs torsken på låg värme i smör i en traktörpanna, skinnsidan nedåt i ca.	jonas@stenberg.io
3fd17148-36ba-40dc-8370-7aa3005d99b3	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	1 minut.	jonas@stenberg.io
198fe155-9f0a-42d1-b818-fd5f26b6c6ef	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Häll på lite mindre än 1 dl vatten och låt torsken ångkokas med lock på.	jonas@stenberg.io
77c6fecf-9e48-4516-9fd5-b7a22085a5d1	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Fräs 2 msk smör och 1 msk vetemjöl i en kastrull.	jonas@stenberg.io
8f847e44-8b73-4257-9cff-7e80faaaa904	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Tillsätt gräddmjölken (hälften grädde, hälften mjölk) och vispa runt.	jonas@stenberg.io
f1ada1cb-4e1d-4e36-9a68-d64d49a84b6a	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Salta och peppra.	jonas@stenberg.io
c2b84cd1-17d6-45e9-91d7-849039346dad	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Tillsätt en halv gullök delad i två delar, lite riven muskot och 1 tsk dijonsenap.	jonas@stenberg.io
16284ec2-ac3a-4a9a-8328-c0ad57cf699a	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Ta upp löken ur såsen när torsken nästan är klar.	jonas@stenberg.io
a684ee16-d3f7-4e60-99b3-dfb71c5b2af1	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Tillsätt äggen och persiljan och ta av kastrullen från spisen.	jonas@stenberg.io
f087fed9-a775-406d-b04c-e7bd6eee85b7	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Blanda i spadet från torsken i såsen och rör om.	jonas@stenberg.io
b53ce63d-55ea-4d38-b34a-4e8acfcb4b9e	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Fräs spenaten i 1 msk smör.	jonas@stenberg.io
50e6f5c7-030c-4db2-9acf-4fda5f9d8a31	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Salta.	jonas@stenberg.io
83a50a80-3140-4a55-a865-a8d82722d631	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Servera torsken på en bädd av stekt spenat med äggsåsen på torsken.	jonas@stenberg.io
800db1ff-65ee-46c6-b31a-3377631c7cd1	2023-08-24 20:18:44.817448	2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	Kokt potatis vid sidan om.	jonas@stenberg.io
d4c42efc-066b-4c47-b120-cf42e4558387	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Hacka den vita chokladen och lägg den i en bunke.	jonas@stenberg.io
4b861af4-5791-491e-97b3-7ab263d14317	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Koka upp grädde och lakritsgranulat och vispa tills pulvret har lösts upp.	jonas@stenberg.io
f3daa82f-2cc4-4e75-a96c-03f9e7909f06	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Låt svalna i några minuter och häll sedan ner i bunken.	jonas@stenberg.io
4684e3e3-ed29-4777-9364-b719da590ad7	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Rör om tills chokladen har smält.	jonas@stenberg.io
d7959250-061a-4a72-9376-66a7e9e07d75	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Täck bunken med plastfolie och låt stå i kylen i minst 12 timmar.	jonas@stenberg.io
07899a17-379b-4757-9e49-8d89bab5ea82	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Ta fram bunken och vispa med elvisp upp den kalla gräddblandningen till en luftig mousse.	jonas@stenberg.io
db5cf8de-ef33-4288-b1bb-104fd205e97d	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Fördela moussen i små portionsglas.	jonas@stenberg.io
d625756f-adc1-42d2-9a4c-571d26181f9a	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Sätt ugnen på 100 grader.	jonas@stenberg.io
ce1fa695-5c97-479d-8d45-954c66e3784f	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Vispa äggvitorna och citronsaften till marängerna skummigt.	jonas@stenberg.io
ed29edde-aff3-451d-a671-efc580b18c36	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Sänk hastigheten på elvispen och vispa ner hälften av strösockret.	jonas@stenberg.io
e5c80464-2bff-4a27-accf-43c30f1075dc	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Tillsätt resten av sockret, öka hastigheten och vispa i ett par minuter.	jonas@stenberg.io
5e2e7f64-cb65-4ed5-a6a8-15610186755f	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Sikta ner florsockret i marängen och vänd in det med en slickepott.	jonas@stenberg.io
e7fc8b86-8568-407d-8129-be202f91ae33	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Vänd ner hallonpurén.	jonas@stenberg.io
5402ff3f-e014-49f5-9a18-30a91b59dda4	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Fyll en engångsspritspåse och spritsa ut små maränger på en plåt med bakplåtspapper.	jonas@stenberg.io
6b4cbc72-f84b-467c-a0df-d3fc28dcc9ce	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Grädda mitt i ugnen i 15 –20 minuter.	jonas@stenberg.io
0845dc35-6724-46e5-8ae4-8e001d2b3236	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Håll koll på marängerna mot slutet så att de inte börjar bli bruna, för då försvinner den rosa färgen.	jonas@stenberg.io
e69ef000-f120-42a6-8d33-7dcf5660608a	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Krossa chokladcookiesarna grovt och fördela smulorna över moussen.	jonas@stenberg.io
548d4562-22e8-4d8f-b7b9-0dd921c5227f	2023-08-26 13:29:57.153231	2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	Lägg på maränger och garnera med hallon samt eventuellt lite lakritsgranulat.	jonas@stenberg.io
80ec2a98-c081-426b-977f-2dc2c04a93bf	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	Tvätta gurkorna noga och skiva.	jonas@stenberg.io
7431978f-394d-499c-a0c1-e271b39b3386	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	Skala pepparroten och dela i cm-stora kuber.	jonas@stenberg.io
eac1d404-76e5-4450-9adb-12e70d0e2888	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	Varva gurkskivor, dillkronor, pepparrot och senapsfrön i väl rengjorda burkar.	jonas@stenberg.io
10150c64-ebd8-4f37-9f51-fe9491ee99a2	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	Blanda ihop lagen och rör till socker och salt har löst sig väl.	jonas@stenberg.io
14dd0437-6710-46df-8312-449f0d7837cc	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	Det tar ca 10 minuter och ibland lite längre tid innan salt och socker har löst sig.	jonas@stenberg.io
97d43d0a-53b8-4453-9646-6fb0b950ed51	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	Häll lagen i burkarna.	jonas@stenberg.io
f2978681-711d-4cf5-ad16-0924829c93c8	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	Den behöver inte täcka gurkskivorna för de saftar sig själva.	jonas@stenberg.io
d8ecc913-ecce-4ec8-af8a-d4a5faad9960	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	Lägg gärna en skalad potatis överst som pressar ner gurkan.	jonas@stenberg.io
0390552a-9e7d-48c5-a2de-6a4ac1093087	2023-08-26 13:30:47.474433	2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	Den tas sedan bort efter några dagar.	jonas@stenberg.io
8dfedbd8-ae48-45e2-a0db-cab3ec170ffc	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	Rör socker och smör poröst.	jonas@stenberg.io
6b2338f3-c6d0-4950-96fd-5df2bfddf297	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	Tillsätt övriga ingredienser och blanda till jämn deg.	jonas@stenberg.io
879fabf5-1ea8-47da-9295-35b4128a163e	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	Rulla ut 4 längder, lägg dom på bakplåtspapper och tryck ut dom med fingrarna.	jonas@stenberg.io
232408d7-2aed-4f29-a48a-f67c6d5beeb0	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	Grädda i 200 grader, ca 15 minuter eller tills kakorna blivit gyllenbruna.	jonas@stenberg.io
5d9d021d-8258-4c33-93d1-3968d1f9b55b	2023-08-28 06:00:48.048344	2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	Skär dem i den storlek som önskas.	jonas@stenberg.io
ca172935-500f-448d-93af-ce0a41fb6ef7	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	Dela sillen i bitar och blanda alla ingredienser.	jonas@stenberg.io
82b2df45-18d1-4600-b68e-67ec09c79e77	2023-08-28 19:55:49.153178	2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	Häll över i en glasburk och låt stå i kylen över natten.	jonas@stenberg.io
3f464200-4d1b-4c36-8ffc-7849a592aaaa	2023-08-31 10:52:17.641815	2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	aa	jonas@stenberg.io
\.


--
-- TOC entry 3416 (class 0 OID 19366)
-- Dependencies: 217
-- Data for Name: recipe_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_categories (date_published, recipe, category, owner) FROM stdin;
2020-11-24 20:36:56.762465	fc52748c-181d-4c2b-916b-08332cdcb473	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:36:56.773322	fc52748c-181d-4c2b-916b-08332cdcb473	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2020-11-25 19:51:42.533503	49d79c70-f086-4339-b5c5-df189a86074f	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:37:15.095521	1642372e-2a7a-445d-be6f-2474be5b8586	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:37:27.377815	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2020-11-24 20:39:50.751708	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:39:50.776957	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2020-11-24 20:44:55.771897	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:45:03.887343	b844bebc-62e6-43d8-92f3-af8033543f16	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:45:26.635304	efb431d6-38ea-417c-b197-b92b346e5fbb	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:45:44.287553	dd534f07-426c-4dcc-87e0-8174d44d03f7	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:45:53.754289	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:46:05.471745	dd36e4c5-da23-408b-8f45-2b6a349ebddc	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:46:05.496936	dd36e4c5-da23-408b-8f45-2b6a349ebddc	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2020-12-01 12:18:08.55448	49bd57fd-c569-43cf-b69c-0bc1371ce407	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-12-26 15:34:30.530335	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-12-26 15:38:10.629565	a27b18c2-7351-4818-bb33-c1387e76e307	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-12-26 15:51:02.393424	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
2020-12-26 15:51:14.88455	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	ffa8c20f-3293-418e-a89f-200018197bab	jonas@stenberg.io
2020-12-30 16:33:18.468548	05bb7c8d-c879-41cb-aad0-44ce505db2ae	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
2022-05-01 21:19:23.785033	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-05-29 13:23:13.19343	043263df-ef4d-4694-b989-8b01821706a2	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-05-29 13:23:13.20807	043263df-ef4d-4694-b989-8b01821706a2	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2022-12-29 12:37:33.9919	f26e4739-19bc-48f4-91ed-e87268a69423	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 15:19:30.573741	12905e60-8310-45f0-8507-ad5334662b3a	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2022-12-29 15:19:52.434597	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2022-12-29 15:20:12.57993	dbecf460-5460-40c4-89a4-d7d704148456	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2022-12-29 17:21:28.407604	9b6996db-e837-44a4-bd55-46f9ed31f515	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 17:29:34.324537	647d6e35-8369-4e00-8146-7d0587c28478	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 17:32:14.472276	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 17:32:14.473083	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2022-12-29 17:35:36.211233	9bbf4e07-645f-44a4-88e2-ca7d23f31746	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2022-12-29 17:35:36.211965	9bbf4e07-645f-44a4-88e2-ca7d23f31746	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-06-05 09:23:32.834338	fb5328c4-5e22-41d7-a1e1-35448e96b4af	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-11 19:04:28.724055	0789d29d-8a27-496d-a4d1-c662200a6281	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-13 20:01:47.49987	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	ffa8c20f-3293-418e-a89f-200018197bab	jonas@stenberg.io
2023-08-13 20:01:47.49987	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-18 07:52:50.043752	8f4f0cd3-b2b8-4e78-8110-15459b651d18	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-24 07:01:13.692423	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-24 07:13:44.960691	bc0a6a05-bc49-49dc-89e3-37933fc145e9	73f14622-6755-4c5a-a610-ad8bf0f28071	jonas@stenberg.io
2023-08-24 07:26:52.673329	e93d25fa-4339-4a26-87d4-5329921b5786	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-24 07:35:50.847349	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-24 07:36:29.651365	41bc608a-d07b-45f2-a533-2085726ae280	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-24 07:37:48.002149	d08968af-bbdc-4102-8dfe-650cb9d30e83	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-24 07:42:33.586989	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
2023-08-24 20:14:33.252537	04ecefde-1b56-44df-9aef-401c9e48c34a	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-24 20:14:49.819859	076be509-1a06-41b5-946a-31693a6a8079	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-24 20:15:23.530407	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
2023-08-24 20:15:31.669279	1312646e-45e1-407b-a46e-ed3b60bc1405	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-24 20:15:45.261953	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-24 20:15:53.602008	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-24 20:17:50.366811	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2023-08-24 20:18:14.721337	39223e98-f9b2-4217-957c-58a43ab3cbe7	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2023-08-24 20:18:21.816892	57be7a15-9cc3-437c-a189-21b0c11b203b	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-24 20:18:30.179113	6675697a-c45c-495c-af13-2180ae68113a	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-24 20:18:44.817448	68bc2e69-483e-497d-b422-bb311f53de8b	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-26 13:29:57.153231	44687753-8723-45cf-b025-c07fe64d1a05	ffa8c20f-3293-418e-a89f-200018197bab	jonas@stenberg.io
2023-08-26 13:30:47.474433	a7f351df-a980-49b4-b5b5-38d6f191a3b6	fcbddad5-f66b-4142-949f-af475423a834	jonas@stenberg.io
2023-08-28 06:00:48.048344	24194bad-e62c-49a3-8e4b-3b8a35e8c724	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-28 19:55:49.153178	69ff89cd-3722-4d25-b9f4-c6818ee7b531	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-31 10:52:17.641815	4a3133ca-f9ca-46f6-aa88-071dafca2e0e	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
\.


--
-- TOC entry 3411 (class 0 OID 19266)
-- Dependencies: 212
-- Data for Name: user_passwords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_passwords (email, password, owner) FROM stdin;
jonas@stenberg.io	$2a$06$UFa2NQyoGEFrOuHzv6KVp.j8G.qnnujXLi5/9fTol98CsNRWCc2Nq	jonas@stenberg.io
\.


-- Completed on 2023-09-05 02:01:44 CEST

--
-- PostgreSQL database dump complete
--

