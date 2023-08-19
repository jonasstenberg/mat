--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Debian 14.8-1.pgdg100+1)
-- Dumped by pg_dump version 14.8 (Debian 14.8-1.pgdg100+1)

-- Started on 2023-08-19 02:02:20 CEST

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
-- TOC entry 3413 (class 1262 OID 17460)
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
-- TOC entry 3414 (class 0 OID 0)
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
-- TOC entry 3402 (class 0 OID 17784)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.users (id, name, email, provider, owner) FROM stdin;
e708ff15-722c-4177-ac55-405fff35b30f	Jonas Stenberg	jonas@stenberg.io	\N	jonas@stenberg.io
93eb6174-e2e2-478c-9433-072b0befbbea	Jonas Stenberg	jonas.d.stenberg@gmail.com	google	jonas.d.stenberg@gmail.com
592fd113-c3e6-48c2-8c17-4a0c32323676	Svante Richter	svante.richter@gmail.com	google	svante.richter@gmail.com
7c619dec-8b65-4197-a251-cd8558f08e18	Andreas Wilnerzon	awgobeat@gmail.com	google	awgobeat@gmail.com
\.


--
-- TOC entry 3403 (class 0 OID 17799)
-- Dependencies: 213
-- Data for Name: user_passwords; Type: TABLE DATA; Schema: auth; Owner: postgres
--

COPY auth.user_passwords (email, password) FROM stdin;
jonas@stenberg.io	$2a$06$UFa2NQyoGEFrOuHzv6KVp.j8G.qnnujXLi5/9fTol98CsNRWCc2Nq
\.


--
-- TOC entry 3406 (class 0 OID 17859)
-- Dependencies: 216
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, date_added, date_updated, name, owner) FROM stdin;
1e92d3e7-8a5e-4d0d-a52e-737a519666c5	2020-11-24 20:22:39.496212	2020-11-24 20:22:39.496212	Frukost	jonas@stenberg.io
008625e8-ada4-4412-b20f-feb6f2f5c6ed	2020-11-24 20:36:47.070808	2020-11-24 20:36:47.070808	Middag	jonas@stenberg.io
5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	2020-11-24 20:36:47.085581	2020-11-24 20:36:47.085581	Fest	jonas@stenberg.io
2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	2020-11-24 20:37:27.306155	2020-11-24 20:37:27.306155	Högtid	jonas@stenberg.io
ffa8c20f-3293-418e-a89f-200018197bab	2020-11-24 20:37:34.635708	2020-11-24 20:37:34.635708	Dessert	jonas@stenberg.io
74b57792-fa68-4efb-be46-e8d194d86ed3	2022-12-29 15:17:14.471522	2022-12-29 15:17:14.471522	Bakelse	jonas@stenberg.io
fcbddad5-f66b-4142-949f-af475423a834	2023-08-04 12:31:16.591547	2023-08-04 12:31:16.591547	Tillbehör	jonas@stenberg.io
73f14622-6755-4c5a-a610-ad8bf0f28071	2023-08-04 16:56:05.373362	2023-08-04 16:56:05.373362	Matbröd	jonas@stenberg.io
8e001f6e-a09a-48ce-9121-35052b342431	2023-08-13 20:13:25.614442	2023-08-13 20:13:25.614442	{"name": "Frukost"}	jonas@stenberg.io
\.


--
-- TOC entry 3404 (class 0 OID 17815)
-- Dependencies: 214
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes (id, date_added, date_updated, name, servings, servings_name, prep_time, cook_time, description, image, thumbnail, owner, tsv) FROM stdin;
3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	2020-12-03 20:31:07.082067	2023-08-11 14:59:22.94574	Bakpotatis med tonfiskröra	4	portioner	\N	\N	### Gör så här\n\nHäll av vätskan från tonfisken. Skala löken. Finhacka sellerin och löken.\n\nBlanda ihop alla ingredienser. Smaka av med salt och peppar. Låt stå i kylen medan du bakar potatisarna.\n\n### Baka potatis i ugn\n\nVärm ugnen till 200 grader.\n\nTvätta bakpotatisarna och gör sedan ett kryss på toppen eller nagga dem med en gaffel så att de inte spricker i ugnen.\n\nBaka potatisarna mitt i ugnen ca 1 timme. För att se om de är klara kan du sticka en kniv i mitten och känna om de är helt mjuka.\n\nTa ut och låt svalna något. Öppna upp potatisen, klick i lite smör och fyll med tonfiskröran. Bjud gärna med en sallad till.	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4.webp	\N	jonas@stenberg.io	'1':73 '200':43 'bak':34,36,67 'bakpotatis':1,46 'bjud':113 'bland':18 'ca':72 'finhack':14 'fyll':110 'gaffel':59 'grad':44 'gärn':114 'gör':4,48 'helt':94 'häll':7 'ihop':19 'ingrediens':21 'klar':81 'klick':105 'kniv':86 'kryss':51 'kyl':31 'känn':90 'lit':107 'låt':28,99 'lök':13,17 'medan':32 'mitt':88 'mjuk':95 'nagg':55 'pepp':27 'potatis':35,37,68,104 'sall':117 'salt':25 'se':77 'sellerin':15 'skal':12 'smak':22 'smör':108 'sprick':64 'stick':84 'stå':29 'svaln':100 'ta':96 'timm':74 'tonfisk':11 'tonfiskrör':3 'tonfiskröran':112 'topp':53 'tvätt':45 'ugn':39,41,66,71 'värm':40 'vätskan':9 'öppn':102
bc0a6a05-bc49-49dc-89e3-37933fc145e9	2023-08-04 16:56:05.373362	2023-08-11 19:03:17.81186	Enkla frukostfrallor	6	frallor	15	25	Rör ihop allt utom salt for hand i en bunke. Låt vila några minuter (max 30), tillsätt salt och blanda någon minut.  Stjälp upp degen på ett mjölat bakbord och dela den i sex bitar. Rundriv bitarna, lägg dem på ett bakplåtspapper på en bricka och ställ in i en avstängd och kall ugn med några kylklampar och isbitar på en plåt i botten.\n\nDag 2, morgon\nTa fram bullarna ur ugnen och sätt den på 275 grader med en plåt i mitten och en oöm plåt på nedersta hyllan. Låt ugnen bli riktigt varm. Pensla eller spreja på lite vatten och strö på lite solroskärnor och linfrön. Sätt in bröden i ugnen och lägg några isbitar på den nedre plåten. Sänk värmen till 250 grader och låt bröden stå 15-20 minuter eller tills de fått fin färg.	bc0a6a05-bc49-49dc-89e3-37933fc145e9.webp	\N	jonas@stenberg.io	'-20':134 '15':133 '2':68 '250':127 '275':79 '30':18 'avstäng':53 'bakbord':31 'bakplåtspapp':44 'bit':37,39 'bland':22 'bott':66 'brick':47 'bröd':113,131 'bull':72 'bunk':12 'dag':67 'deg':27 'del':33 'enkl':1 'fin':140 'for':8 'fram':71 'frukostfrall':2 'färg':141 'fått':139 'grad':80,128 'hand':9 'hyllan':92 'ihop':4 'in':50,112 'isbit':61,119 'kall':55 'kylklamp':59 'linfrön':110 'lit':102,107 'lägg':40,117 'låt':13,93,130 'max':17 'minut':16,24,135 'mitt':85 'mjöl':30 'morgon':69 'nederst':91 'nedr':122 'oöm':88 'pensl':98 'plåt':64,83,89,123 'rikt':96 'rundriv':38 'rör':3 'salt':7,20 'sex':36 'solroskärn':108 'sprej':100 'stjälp':25 'strö':105 'ställ':49 'stå':132 'sänk':124 'sätt':76,111 'ta':70 'till':137 'tillsät':19 'ugn':56,74,94,115 'ur':73 'utom':6 'varm':97 'vatt':103 'vil':14 'värm':125
0789d29d-8a27-496d-a4d1-c662200a6281	2022-12-29 12:52:59.448915	2023-08-11 19:04:28.724055	Mammas blåbärsbakelser	16	formar	\N	\N	Blanda alla ingredienserna utom ägget med elvisp. Rör sedan ner ägget.\nRulla degen till en rulle. Dela i 4 delar, och sedan varje del i 4 delar. Totalt 16 delar.\nPlatta ut en bit i taget på mjölat bakbord, vänd vänd sedan den mjöliga sidan uppåt när degbiten läggs i aluminiumformen. Tryck ut den.\nLägg i färska eller frusna bär.\nStrö över 2 msk socker och 0,5 msk potatismjöl.\n\nGrädda i 225 grader i ca. 12 minuter.	0789d29d-8a27-496d-a4d1-c662200a6281.webp	\N	jonas@stenberg.io	'0':69 '12':79 '16':31 '2':65 '225':75 '4':21,28 '5':70 'aluminiumform':53 'bakbord':41 'bit':36 'bland':3 'blåbärsbak':2 'bär':62 'ca':78 'deg':15 'degbit':50 'del':19,22,26,29,32 'elvisp':9 'frusn':61 'färsk':59 'grad':76 'grädd':73 'ingrediens':5 'lägg':51,57 'mamm':1 'minut':80 'mjöl':40,46 'msk':66,71 'ner':12 'platt':33 'potatismjöl':72 'rull':14,18 'rör':10 'sidan':47 'sock':67 'strö':63 'taget':38 'totalt':30 'tryck':54 'uppåt':48 'utom':6 'vänd':42,43 'ägget':7,13
6675697a-c45c-495c-af13-2180ae68113a	2022-12-29 12:44:07.979499	2023-08-11 14:48:54.654293	Soppa med vita bönor	4	portioner	\N	\N	Skala och hacka lök och vitlök. Fräs hacket i smör i en gryta tillsammans med paprikapulvret.\n\nHacka paprikan och låt den fräsa med. Tillsätt tomater, vatten, buljongtärningarna och timjanen.\n\nKoka på svag värme ca. 10 minuter.\n\nLägg i bönorna och låt den koka upp.\n\nSmaka av med lite socker och vinäger.	6675697a-c45c-495c-af13-2180ae68113a.webp	\N	jonas@stenberg.io	'10':39 'buljongtärning':31 'bön':4,43 'ca':38 'fräs':11,26 'gryt':17 'hack':7,21 'hacket':12 'kok':34,47 'lit':52 'lägg':41 'låt':24,45 'lök':8 'minut':40 'paprikan':22 'paprikapulvret':20 'skal':5 'smak':49 'smör':14 'sock':53 'sopp':1 'svag':36 'tillsamman':18 'tillsät':28 'timjan':33 'tomat':29 'vatt':30 'vinäg':55 'vit':3 'vitlök':10 'värm':37
33c62ccb-4f03-4528-8d4e-e29b0b71bf16	2020-11-17 17:59:25.323289	2023-08-11 14:48:54.654293	Inlagd sill	4	portioner	\N	\N	Varva gärna den inlagda sillen med gula lökringar och garnera sedan med rödlöksringar. Tar man rödlök från början blir sillen lätt rosagrå och trist i färgen.	33c62ccb-4f03-4528-8d4e-e29b0b71bf16.webp	\N	jonas@stenberg.io	'början':20 'färg':28 'garner':12 'gul':9 'gärn':4 'inlag':1,6 'lätt':23 'lökring':10 'rosagrå':24 'rödlök':18 'rödlöksring':15 'sill':2,7,22 'tar':16 'trist':26 'varv':3
83726276-170e-44ac-82bd-34d0087cee43	2022-12-29 17:12:14.620424	2023-08-11 14:48:54.654293	Festsill	4	portioner	\N	\N	 	83726276-170e-44ac-82bd-34d0087cee43.webp	\N	jonas@stenberg.io	'festsill':1
66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	2020-12-26 15:34:30.466289	2023-08-11 14:48:54.654293	Rostad morotssoppa	4	portioner	\N	\N	Lägg morötterna på en klädd plåt. Ringla över olja, placera i mitten av ugnen och rosta mjukt på 220 grader varmluft i cirka 20 minuter. Koka under tiden upp vatten, syrad grädde och buljontärningarna. Vänd i de rostade morötterna och mixa slätt. Späd eventuellt med mer vatten om du vill ha en tunnare soppa. Smaksätt med kryddorna och låt koka i ytterliggare cirka 5 minuter.\n\nToppa soppan med yoghurtbollar, granatäpplekärnor, plockad dill och pistagenötter. Avsluta med att ringa över lite olja.	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a.webp	\N	jonas@stenberg.io	'20':26 '220':21 '5':66 'avslut':77 'buljontärning':36 'cirk':25,65 'dill':74 'eventuellt':46 'grad':22 'granatäpplekärn':72 'grädd':34 'klädd':7 'kok':28,62 'krydd':59 'lit':82 'lägg':3 'låt':61 'mer':48 'minut':27,67 'mitt':14 'mix':43 'mjukt':19 'morotssopp':2 'moröt':4,41 'olj':11,83 'pistagenöt':76 'placer':12 'plock':73 'plåt':8 'ring':80 'ringl':9 'rost':1,18,40 'slätt':44 'smaksät':57 'sopp':56 'soppan':69 'späd':45 'syr':33 'tid':30 'topp':68 'tunn':55 'ugn':16 'varmluft':23 'vatt':32,49 'vill':52 'vänd':37 'yoghurtboll':71 'ytterligg':64
234950c8-2db3-4aa6-9bfa-20c38b52af85	2020-11-16 20:34:25.331545	2023-08-11 14:48:54.654293	Grönkålspesto	4	portioner	\N	\N	Mixa allt.	234950c8-2db3-4aa6-9bfa-20c38b52af85.webp	\N	jonas@stenberg.io	'grönkålspesto':1 'mix':2
a27b18c2-7351-4818-bb33-c1387e76e307	2020-12-26 15:38:10.569088	2023-08-11 14:48:54.654293	Snabb tomatsoppa med soltorkad tomat och matvete	4	portioner	\N	\N	Häll över samtliga ingredienser till soppan i en medelstor kastrull. Låt koka i cirka 15 minuter. Mixa slätt med en stavmixer. Smaka av med salt och svartpeppar.\n\nServera med kokt matvete, solroskärnor och eventuellt andra knapriga toppingar som krutonger, sesamfrön och kanske lite fetaost.	a27b18c2-7351-4818-bb33-c1387e76e307.webp	\N	jonas@stenberg.io	'15':22 'andr':42 'cirk':21 'eventuellt':41 'fetaost':51 'häll':8 'ingrediens':11 'kansk':49 'kastrull':17 'knapr':43 'kok':19 'kokt':37 'krutong':46 'lit':50 'låt':18 'matvet':7,38 'medelst':16 'minut':23 'mix':24 'salt':32 'samt':10 'server':35 'sesamfrön':47 'slätt':25 'smak':29 'snabb':1 'solroskärn':39 'soltork':4 'soppan':13 'stavmix':28 'svartpepp':34 'tom':5 'tomatsopp':2 'topping':44
49bd57fd-c569-43cf-b69c-0bc1371ce407	2020-12-01 12:18:08.492246	2023-08-11 14:48:54.654293	Sötpotatisbiffar med tzatziki och bönsallad	4	portioner	\N	\N	### Sätt ugnen på 150°C och sätt in en plåt.\n### Sötpotatisbiffar\nSkala och riv sötpotatisen, hälften grovt och hälften fint. Vispa ihop ägg, äggvita, mjöl och kryddor och vänd ner i sötpotatisen. Låt smeten svälla i några minuter.\n### Tzatziki\nRiv gurkan och pressa ur lite vätska. Blanda med yoghurt, salt, peppar och pressad vitlök.\n### Sötpotatisbiffar\nForma 8 biffar av sötpotatissmeten och stek dem i oljan i en stekpanna på medelvärme. Lägg in biffarna några minuter på den varma plåten i ugnen.\n### Bönsallad\nHäll bönorna i ett durkslag, spola dem i kallt vatten och låt rinna av. Skär tomaterna i halvor och strimla salladslöken. Blanda tomat och lök med bönor, pressa över citronsaft och ringla över olja. Krydda med salt och peppar.\n### Servera biffarna med bönsallad och tzatziki.\n	49bd57fd-c569-43cf-b69c-0bc1371ce407.webp	\N	jonas@stenberg.io	'150':9 '8':62 'biff':63,78,128 'bland':52,109 'bön':89,114 'bönsall':5,87,130 'c':10 'citronsaft':117 'durkslag':92 'fint':25 'form':61 'grovt':22 'gurkan':46 'halv':105 'hälft':21,24 'häll':88 'ihop':27 'in':13,77 'kallt':96 'krydd':32,122 'lit':50 'lägg':76 'låt':38,99 'lök':112 'medelvärm':75 'minut':43,80 'mjöl':30 'ner':35 'olj':121 'oljan':70 'pepp':56,126 'plåt':15,84 'press':48,58,115 'ringl':119 'rinn':100 'riv':19,45 'salladslök':108 'salt':55,124 'server':127 'skal':17 'skär':102 'smet':39 'spol':93 'stek':67 'stekpan':73 'striml':107 'sväll':40 'sätt':6,12 'sötpotatis':20,37 'sötpotatisbiff':1,16,60 'sötpotatissmet':65 'tom':110 'tomat':103 'tzatziki':3,44,132 'ugn':7,86 'ur':49 'varm':83 'vatt':97 'visp':26 'vitlök':59 'vänd':34 'vätsk':51 'yoghurt':54 'ägg':28 'äggvit':29
fc52748c-181d-4c2b-916b-08332cdcb473	2020-11-22 14:01:13.827309	2023-08-11 14:48:54.654293	Fisksoppa	4	portioner	\N	\N	Finhacka löken och vitlöken.\nSkär grönsakerna i lagom stora munsbitar. Tomaterna behöver inte skalas men skär bort fästet och dela tomaterna i stora bitar.\n\nFräs löken och vitlöken varsamt i olja i en kastrull eller gryta. Smaksätt med saffran, cayennepeppar, timjan och rosmarin och rör om. Lägg ner potatis, morötter, fänkål och tomater.\nSpäd med vatten och vin, lägg i fiskbuljongtärningen och hummerfonden och koka i ca. 10-15 minuter, eller tills potatisen är lagom mjuk. Krydda med salt och peppar efter smak.\n\nSkär den benfria fisken i 3 cm stora kuber.\n\nLägg i fiskbitarna och sjud dom i soppan 3-4 minuter (tunna fiskfiléer som exempelvis spättafiléer behöver bara 1-2 minuter).\n\nServera med gott bröd och en klick creme fraiche.	fc52748c-181d-4c2b-916b-08332cdcb473.webp	\N	jonas@stenberg.io	'-15':70 '-2':113 '-4':103 '1':112 '10':69 '3':90,102 'bar':111 'behöv':13,110 'benfri':87 'bit':25 'bort':18 'bröd':118 'ca':68 'cayennepepp':41 'cm':91 'crem':122 'del':21 'dom':99 'exempelvis':108 'finhack':2 'fisk':88 'fiskbit':96 'fiskbuljongtärning':62 'fiskfilé':106 'fisksopp':1 'fraich':123 'fräs':26 'fänkål':52 'fästet':19 'gott':117 'gryt':37 'grönsak':7 'hummerfond':64 'kastrull':35 'klick':121 'kok':66 'krydd':78 'kub':93 'lagom':9,76 'lägg':48,60,94 'lök':3,27 'minut':71,104,114 'mjuk':77 'moröt':51 'munsbit':11 'ner':49 'olj':32 'pepp':82 'potatis':50,74 'rosmarin':44 'rör':46 'saffran':40 'salt':80 'server':115 'sjud':98 'skal':15 'skär':6,17,85 'smak':84 'smaksät':38 'soppan':101 'späd':55 'spättafilé':109 'stor':10,24,92 'till':73 'timjan':42 'tomat':12,22,54 'tunn':105 'varsamt':30 'vatt':57 'vin':59 'vitlök':5,29
b844bebc-62e6-43d8-92f3-af8033543f16	2020-11-17 09:48:17.339654	2023-08-11 14:48:54.654293	Pytt i panna	4	portioner	\N	\N	Sätt ugnen på 225 grader.\nSkala och tärna potatis, morötter, kålrot och palsternacka i ca 1x1 cm stora bitar.\n\nLägg på en plåt, ringla över olivolja, salta och peppra.\nRosta mitt i ugnen ca 20-25 minuter.\n\nStek ägg under tiden.\n\nServera med inlagda rödbetor.	b844bebc-62e6-43d8-92f3-af8033543f16.webp	\N	jonas@stenberg.io	'-25':39 '1x1':19 '20':38 '225':7 'bit':22 'ca':18,37 'cm':20 'grad':8 'inlag':47 'kålrot':14 'lägg':23 'minut':40 'moröt':13 'olivolj':29 'palsternack':16 'pann':3 'peppr':32 'plåt':26 'potatis':12 'pytt':1 'ringl':27 'rost':33 'rödbet':48 'salt':30 'server':45 'skal':9 'stek':41 'stor':21 'sätt':4 'tid':44 'tärn':11 'ugn':5,36 'ägg':42
efb431d6-38ea-417c-b197-b92b346e5fbb	2020-11-17 17:33:36.72893	2023-08-11 14:48:54.654293	Rödbetssallad med hemgjord pesto och quinoa	4	portioner	\N	\N	Rödbetarsallad med hemgjord (grönkål) pesto och quinoa:\nKoka rödbetor med skal på tills de är nästan mjuka inuti i saltat vatten.\nLåt dem svalna eller skölj dem med skal på i kallt vatten och dra av skalet med händerna.\n\nPesto:\nOm jag gör det med valnötter eller grönkål lägger jag vanligtvis till en tsk honung för att sötas upp.\nMixa allt!\n\nSkär rödbetor i 1/2 cm skivor och lägg babyspenat och rödbetor i lager, tillsätt fetaost på toppen och servera med kokt quinoa och pesto!	efb431d6-38ea-417c-b197-b92b346e5fbb.webp	\N	jonas@stenberg.io	'1/2':71 'babyspen':76 'cm':72 'dra':41 'fetaost':82 'grönkål':10,54 'gör':49 'hemgjord':3,9 'honung':61 'händ':45 'inuti':24 'kallt':38 'kok':14 'kokt':88 'lag':80 'lägg':55,75 'låt':28 'mix':66 'mjuk':23 'nästan':22 'pesto':4,11,46,91 'quino':6,13,89 'rödbet':15,69,78 'rödbetarsall':7 'rödbetssall':1 'salt':26 'server':86 'skal':17,35 'skalet':43 'skiv':73 'skär':68 'skölj':32 'svaln':30 'söt':64 'till':19 'tillsät':81 'topp':84 'tsk':60 'valnöt':52 'vanligtvis':57 'vatt':27,39
49d79c70-f086-4339-b5c5-df189a86074f	2020-11-25 19:51:42.46462	2023-08-11 14:48:54.654293	Pico de gallo	4	portioner	\N	\N	Skiva tomaterna i ca. 1 cm stora bitar. Hacka salladslöken tunt. Grovhacka koriandern.\n\nBlanda allt i en skål och pressa över en halv lime.\n\nÄven gott att blanda i en halv finhackad mango.	49d79c70-f086-4339-b5c5-df189a86074f.webp	\N	jonas@stenberg.io	'1':8 'bit':11 'bland':17,31 'ca':7 'cm':9 'finhack':35 'gallo':3 'gott':29 'grovhack':15 'hack':12 'halv':26,34 'koriand':16 'lim':27 'mango':36 'pico':1 'press':23 'salladslök':13 'skiv':4 'skål':21 'stor':10 'tomat':5 'tunt':14 'även':28
ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	2020-12-26 17:32:55.258401	2023-08-11 14:48:54.654293	Granola	4	portioner	\N	\N	Blötlägg bovetet i ca. 30 minuter. Blötlägg alla fröer i ca. 30 minuter.\n\nHäll av vattnet från bovetet och skölj noga i kallt vatten.\nSila av vattnet från fröerna och låt rinna av i cirka 5 minuter.\n\nVärm ugnen till 100 grader. Blanda runt alla ingredienser i en bunke. Bred ut hela klabbet på ett bakplåtspapper och rosta mitt i ugnen i cirka 75-90 (mer om du dubblar receptet) minuter, tills granolan är krispig och gyllene. Tillsätt kokos, kakaonibs och/eller torkad frukt/bär.	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d.webp	\N	jonas@stenberg.io	'-90':66 '100':42 '30':6,13 '5':37 '75':65 'bakplåtspapp':57 'bland':44 'blötlägg':2,8 'bovetet':3,19 'bred':51 'bunk':50 'ca':5,12 'cirk':36,64 'dubbl':70 'frukt/b':84 'fröer':10 'fröern':30 'grad':43 'granol':1 'granolan':74 'gyllen':78 'hel':53 'häll':15 'ingrediens':47 'kakaonib':81 'kallt':24 'klabbet':54 'koko':80 'krisp':76 'låt':32 'mer':67 'minut':7,14,38,72 'nog':22 'och/eller':82 'receptet':71 'rinn':33 'rost':59 'runt':45 'sil':26 'skölj':21 'till':73 'tillsät':79 'tork':83 'ugn':40,62 'vatt':25 'vattnet':17,28 'värm':39
dd36e4c5-da23-408b-8f45-2b6a349ebddc	2020-11-16 20:50:47.924138	2023-08-11 14:48:54.654293	Vegköttbullar med grönpepparsås, pressgurka och rårörda lingon	4	portioner	\N	\N	Skiva/mandolina/osthyvla en gurka. Blanda ner 3 kryddmått salt i en skål. Lägg ett fat med en tyngd över och låt stå ca 30 minuter, häll av spadet. Gör en lag av 2 msk ättika, 1 dl vatten, 2 msk socker och 2 msk hackad persilja. Lägg gurkan i en burk och häll över lagen och låt stå minst en timme innan servering.\n\nTa fram den frusna vegfärsen och tina några timmar.\n\nTina ett paket frysta lingon, rör ner lite mindre än 1 dl socker och rör om. Låt stå minst 1 timme.\n\nTill ca 4 pers:\nGrönpepparsåsen:\nKrossa grönpepparkorn i en mortel, får gärna ha lite bitar kvar så det inte bara blir ett pulver. \nGrovhacka ett gäng skogschampinjoner och stek i matfett i en kastrull tills de fått färg. Ha i den grovmalna grönpepparen halvvägs in på stekningen. Häll på grädde och en skvätt soja (jag tycker kinesisk är god men funkar nog med vilken som) och låt koka upp. Smaka av med mer grönpeppar och salt. \nOm man vill lyxa kan man hälla på 2 msk konjak innan man har i grädden.\nBlir också godare om såsen får koka upp en stund.\n\nKoka potatisen.\n\nKöttbullarna:\nBlanda 1.5 dl mjölk och 1 dl ströbröd i en stor skål, låt stå ca 10 minuter. Tillsätt en grovriven stor gullök, 1 ägg, 500 g färs, 1-2 tsk salt och rätt mycket malen svartpeppar. Forma till köttbullar och lägg på ett fat (tips, ha kallt vatten på händerna när du gör köttbullarna).\nStek på medelhög temperatur tills de blivit genomstekta och fått rejält med färg.	dd36e4c5-da23-408b-8f45-2b6a349ebddc.webp	\N	jonas@stenberg.io	'-2':233 '1':42,89,98,210,227,232 '1.5':206 '10':220 '2':39,45,49,184 '3':13 '30':30 '4':102 '500':229 'ägg':228 'än':88 'är':157 'ättik':41 'bar':119 'bit':114 'bland':11,205 'burk':57 'ca':29,101,219 'dl':43,90,207,211 'fat':21,248 'fär':231 'färg':137,271 'får':110,197 'fåt':136,268 'form':241 'fram':71 'frusn':73 'fryst':82 'funk':160 'g':230 'gäng':125 'gärn':111 'genomstek':266 'god':158,194 'gör':35,257 'gräd':149,191 'grovhack':123 'grovmaln':141 'grovriv':224 'grönpepp':142,173 'grönpepparkorn':106 'grönpepparsås':104 'grönpepparsås':3 'gullök':226 'gurk':10 'gurkan':54 'hack':51 'halvväg':143 'häll':32,59,147,182 'händ':254 'in':144 'innan':68,187 'kallt':251 'kastrull':133 'kinesisk':156 'kok':167,198,202 'konjak':186 'köttbull':204,243,258 'kross':105 'kryddmåt':14 'kvar':115 'lag':37,61 'lägg':19,53,245 'låt':27,63,95,166,217 'lingon':7,83 'lit':86,113 'lyx':179 'mal':239 'matfet':130 'medelhög':261 'mer':172 'mindr':87 'minst':65,97 'minut':31,221 'mjölk':208 'mortel':109 'msk':40,46,50,185 'när':255 'någr':77 'ner':12,85 'nog':161 'också':193 'öv':25,60 'paket':81 'på':145,148,183,246,253,260 'per':103 'persilj':52 'potatis':203 'pressgurk':4 'pulv':122 'rät':237 'rejält':269 'rör':84,93 'rårörd':6 'salt':15,175,235 'så':116 'sås':196 'servering':69 'skål':18,216 'skiva/mandolina/osthyvla':8 'skogschampinjon':126 'skvät':152 'smak':169 'sock':47,91 'soj':153 'spadet':34 'stå':28,64,96,218 'stek':128,259 'stekning':146 'stor':215,225 'ströbröd':212 'stund':201 'svartpepp':240 'ta':70 'temperatur':262 'till':134,263 'tillsät':222 'timm':67,78,99 'tin':76,79 'tip':249 'tsk':234 'tyck':155 'tyng':24 'vatt':44,252 'vegfärs':74 'vegköttbull':1 'vill':178
f0d97e79-a8e3-46c0-a72d-4134cfb774c8	2020-12-26 15:51:02.332474	2023-08-11 14:48:54.654293	Linfröknäcke	4	portioner	\N	\N	Blanda alla frön, häll på vatten och ställt kallt i 4 timmar. \nRör om en gång i timmen.\nSätt ugnen på 125 grader. \nBred ut frömassan i ett jämt tunt lager på en plåt med bakplåtspapper. \nStrö över saltet. \nGrädda mitt i ugnen i 1 timme. \nLåt ugnsluckan vara öppen med någon centimeters glipa eller öppna var tionde minut och släpp ut ångan. \nSänk temperaturen och grädda ytterligare 1 timme. \nLåt svalna och bryt i bitar.	f0d97e79-a8e3-46c0-a72d-4134cfb774c8.webp	\N	jonas@stenberg.io	'1':46,70 '125':23 '4':12 'bakplåtspapp':37 'bit':77 'bland':2 'bred':25 'bryt':75 'centimeter':54 'frömassan':27 'frön':4 'glip':55 'grad':24 'grädd':41,68 'gång':17 'häll':5 'jämt':30 'kallt':10 'lag':32 'linfröknäck':1 'låt':48,72 'minut':60 'plåt':35 'rör':14 'saltet':40 'släpp':62 'strö':38 'ställt':9 'svaln':73 'sänk':65 'sätt':20 'temperatur':66 'timm':13,19,47,71 'tiond':59 'tunt':31 'ugn':21,44 'ugnsluckan':49 'vatt':7 'ytter':69 'ångan':64 'öpp':51 'öppn':57
d08968af-bbdc-4102-8dfe-650cb9d30e83	2021-01-10 19:30:03.04069	2023-08-11 14:48:54.654293	Dillstuvad potatis	4	portioner	\N	\N	Koka potatisarna så de nästan är klara och låt svalna.\n\nVärm på smöret och ha ner vetemjölet och rör om tills det blir klumpfritt. Blanda ner hälften och grädden och hälften av mjölken och vispa runt. Ha i resten av grädden och mjölken.\n\nRiv i muskot efter smak och salta och peppra.\n\nHacka potatisen i lagom stora bitar.\n\nVänd ner potatisen och dillen och rör runt.\n\nServera med gravad lax.	d08968af-bbdc-4102-8dfe-650cb9d30e83.webp	\N	jonas@stenberg.io	'bit':60 'bland':27 'dill':65 'dillstuv':1 'grav':71 'grädd':31,43 'hack':55 'hälft':29,33 'klar':9 'klumpfrit':26 'kok':3 'lagom':58 'lax':72 'låt':11 'mjölk':35,45 'muskot':48 'ner':18,28,62 'nästan':7 'peppr':54 'potatis':2,4,56,63 'rest':41 'riv':46 'runt':38,68 'rör':21,67 'salt':52 'server':69 'smak':50 'smöret':15 'stor':59 'svaln':12 'till':23 'vetemjölet':19 'visp':37 'vänd':61 'värm':13
e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	2020-11-17 17:53:32.881259	2023-08-11 14:48:54.654293	Rabarbermarmelad med ingefära	4	portioner	\N	\N	Skölj rabarbern och skiva den i 1-2 cm stora bitar. Borsta citron och apelsin rena i varmt vatten. Riv skalet och pressa ur saften.\nBlanda rabarbern med hälften av sockret samt skal och saft av citron och apelsin i en bunke. Täck med plastfolie och låt stå ca 12 timmar i rumstemperatur.\n\nHäll över i en gryta och koka ca 20 minuter. Rör om då och då.\nRör ner resten av sockret lite i taget. Koka upp igen och koka kraftigt utan lock i 15–20 minuter till en temperatur på 107–108 grader.\nRör ut ingefäran i lite av marmeladen och rör sedan ner det i grytan.\nÖs upp i rena varma burkar. Sätt genast på lock och ställ burkarna upp och ner tills marmeladen har kallnat.	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab.webp	\N	jonas@stenberg.io	'-2':11 '1':10 '107':96 '108':97 '12':53 '15':89 '20':65,90 'apelsin':18,42 'bit':14 'bland':29 'borst':15 'bunk':45 'burk':118,125 'ca':52,64 'citron':16,40 'cm':12 'gen':120 'grad':98 'gryt':61 'grytan':112 'hälft':32 'häll':57 'igen':82 'ingefär':3 'ingefäran':101 'kalln':132 'kok':63,80,84 'kraft':85 'lit':77,103 'lock':87,122 'låt':50 'marmelad':105,130 'minut':66,91 'ner':73,109,128 'plastfoli':48 'press':26 'rabarb':5,30 'rabarbermarmel':1 'ren':19,116 'rest':74 'riv':23 'rumstemperatur':56 'rör':67,72,99,107 'saft':28,38 'samt':35 'skal':36 'skalet':24 'skiv':7 'skölj':4 'sockret':34,76 'stor':13 'ställ':124 'stå':51 'sätt':119 'taget':79 'temperatur':94 'till':129 'timm':54 'täck':46 'ur':27 'varm':117 'varmt':21 'vatt':22 'ös':113
dbecf460-5460-40c4-89a4-d7d704148456	2022-12-29 12:47:34.459066	2023-08-11 14:48:54.654293	Mammas pepparkaksdeg	4	portioner	\N	\N	Smält smöret och blanda i socker, sirap och grädde.\n\nBlanda vetemjölet och kryddorna.\n\nRör ihop alltsammans. Låt degen stå över natten i kylskåpet.\n\nBaka ut och grädda i ugnen på 200 grader.	dbecf460-5460-40c4-89a4-d7d704148456.webp	\N	jonas@stenberg.io	'200':33 'alltsamman':18 'bak':26 'bland':6,12 'deg':20 'grad':34 'grädd':11,29 'ihop':17 'krydd':15 'kylskåpet':25 'låt':19 'mamm':1 'natt':23 'pepparkaksdeg':2 'rör':16 'sirap':9 'smält':3 'smöret':4 'sock':8 'stå':21 'ugn':31 'vetemjölet':13
57be7a15-9cc3-437c-a189-21b0c11b203b	2022-12-29 17:16:54.57467	2023-08-11 14:48:54.654293	Slottsstek	4	portioner	\N	\N	Bryn köttet, i smör och olja. Bryn löken.\nBlanda alla ingredienser i grytan och koka på låg värme under lock till köttet är mört.\n\n# Såsen\nTa upp köttet och linda in i aluminiumfolie.\nSila av skyn och red den med maizena. Tillsätt grädden och smaka av med svartvinbärsgele.	57be7a15-9cc3-437c-a189-21b0c11b203b.webp	\N	jonas@stenberg.io	'aluminiumfoli':34 'bland':10 'bryn':2,8 'grytan':14 'grädd':44 'in':32 'ingrediens':12 'kok':16 'köttet':3,23,29 'lind':31 'lock':21 'låg':18 'lök':9 'maizen':42 'mört':25 'olj':7 'red':39 'sil':35 'skyn':37 'slottsstek':1 'smak':46 'smör':5 'svartvinbärsgel':49 'sås':26 'ta':27 'tillsät':43 'värm':19
40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	2020-11-16 18:45:35.354003	2023-08-11 14:48:54.654293	Laxtaco	4	portioner	\N	\N	Laxen\nOlja en ugnssäker form och lägg ner laxen med skinnsidan neråt\nMortla alla kryddor och "massera" in dom på ovansidan av laxen\nSätt ugnen på 175 grader och sätt in laxen i 20-30 minuter (kolla lite då och då, osäker på exakt tid)\n\nPicklad rödlök\nVärm upp allt utom rödlöken så sockret smälter\nStrimla rödlöken\nI med allt i en burk och sätt in i kylen nån timme innan	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1.webp	\N	jonas@stenberg.io	'-30':36 '175':28 '20':35 'burk':64 'dom':20 'exak':45 'form':6 'grad':29 'in':19,32,67 'innan':72 'koll':38 'krydd':16 'kyl':69 'lax':2,10,24,33 'laxtaco':1 'lit':39 'lägg':8 'masser':18 'minut':37 'mortl':14 'ner':9 'neråt':13 'nån':70 'olj':3 'osäk':43 'ovansidan':22 'pickl':47 'rödlök':48,53,58 'skinnsidan':12 'smält':56 'sockret':55 'striml':57 'sätt':25,31,66 'tid':46 'timm':71 'ugn':26 'ugnssäk':5 'utom':52 'värm':49
68bc2e69-483e-497d-b422-bb311f53de8b	2021-01-12 08:48:02.680444	2023-08-11 14:48:54.654293	Torsk med äggsås	4	portioner	\N	\N	Rimma torsken genom att gnida in salt runt om den och låt stå i kylen i ca. ett dygn.\n\nFräs torsken på låg värme i smör i en traktörpanna, skinnsidan nedåt i ca. 1 minut. Häll på lite mindre än 1 dl vatten och låt torsken ångkokas med lock på.\n\nFräs 2 msk smör och 1 msk vetemjöl i en kastrull. Tillsätt gräddmjölken (hälften grädde, hälften mjölk) och vispa runt. Salta och peppra.\nTillsätt en halv gullök delad i två delar, lite riven muskot och 1 tsk dijonsenap.\nTa upp löken ur såsen när torsken nästan är klar. Tillsätt äggen och persiljan och ta av kastrullen från spisen. Blanda i spadet från torsken i såsen och rör om.\n\nFräs spenaten i 1 msk smör. Salta.\n\nServera torsken på en bädd av stekt spenat med äggsåsen på torsken. Kokt potatis vid sidan om.	68bc2e69-483e-497d-b422-bb311f53de8b.webp	\N	jonas@stenberg.io	'1':37,44,59,89,125 '2':55 'bland':112 'bädd':133 'ca':20,36 'del':81,84 'dijonsenap':91 'dl':45 'dygn':22 'fräs':23,54,122 'genom':6 'gnid':8 'grädd':68 'gräddmjölk':66 'gullök':80 'halv':79 'hälft':67,69 'häll':39 'in':9 'kastrull':64,109 'klar':101 'kokt':141 'kyl':18 'lit':41,85 'lock':52 'låg':26 'låt':15,48 'lök':94 'mindr':42 'minut':38 'mjölk':70 'msk':56,60,126 'muskot':87 'nedåt':34 'nästan':99 'peppr':76 'persiljan':105 'potatis':142 'rimm':4 'riv':86 'runt':11,73 'rör':120 'salt':10,74,128 'server':129 'sidan':144 'skinnsidan':33 'smör':29,57,127 'spadet':114 'spen':136 'spenat':123 'spis':111 'stekt':135 'stå':16 'sås':96,118 'ta':92,107 'tillsät':65,77,102 'torsk':1,5,24,49,98,116,130,140 'traktörpan':32 'tsk':90 'två':83 'ur':95 'vatt':46 'vetemjöl':61 'visp':72 'värm':27 'ägg':103 'äggsås':3,138 'ångkok':50
1642372e-2a7a-445d-be6f-2474be5b8586	2020-11-17 17:51:55.475259	2023-08-11 14:48:54.654293	Hummus, tabbouleh och stekt halloumi	4	portioner	\N	\N	### Hummus\nSkala och finhacka vitlöksklyftan. Hälla av och skölj kikärterna, låt rinna av. Lägg vitklök, kikärter, chilifrukt, spiskummin, pressad citronjuice, olivolja och tahini i en matberedare.\nMixa till en jämn smet. Smaksätt med salt och peppar. Förvara kallt till servering.\n\n### Tabbouleh\nKoka bulgurn enligt anvisning på förpackningen. Låt svalna.\nFinhacka persiljan. Skala och finhacka löken. Tärna tomaterna.\nBlanda alla ingredienser med bulgurn. Krydda med salt och peppar.\n\nStek halloumin.	1642372e-2a7a-445d-be6f-2474be5b8586.webp	\N	jonas@stenberg.io	'anvisning':50 'bland':63 'bulgurn':48,67 'chilifruk':22 'citronjuic':25 'enl':49 'finhack':9,55,59 'förpackning':52 'förvar':42 'halloumi':5 'halloumin':74 'hummus':1,6 'häll':11 'ingrediens':65 'jämn':35 'kallt':43 'kikärt':15,21 'kok':47 'krydd':68 'lägg':19 'låt':16,53 'lök':60 'matbered':31 'mix':32 'olivolj':26 'pepp':41,72 'persiljan':56 'press':24 'rinn':17 'salt':39,70 'servering':45 'skal':7,57 'skölj':14 'smaksät':37 'smet':36 'spiskummin':23 'stek':73 'stekt':4 'svaln':54 'tabbouleh':2,46 'tahini':28 'tomat':62 'tärn':61 'vitklök':20 'vitlöksklyftan':10
39223e98-f9b2-4217-957c-58a43ab3cbe7	2020-11-17 18:04:33.936906	2023-08-11 14:48:54.654293	Senapsgravad strömming	4	portioner	\N	\N	Blanda vatten och ättiksprit i en skål.\nTillsätt salt och socker och rör tills det har löst sig. Lägg ner filéerna i lagen.\nStäll in dem i kyl och låt dem ligga tills köttet blivit vitt och fast, ca 6 timmar. Häll bort lagen och drag skinnet av strömmingen. Blanda alla ingredienserna till senapssåsen. Varva strömming och senapssås i en burk eller ett krus. Ställ in i kyl för att mogna ca 1 dygn före servering. \nHållbar 1 vecka i kyl.	39223e98-f9b2-4217-957c-58a43ab3cbe7.webp	\N	jonas@stenberg.io	'1':75,80 '6':42 'bland':3,52 'bort':45 'burk':63 'ca':41,74 'drag':48 'dygn':76 'fast':40 'filé':23 'för':77 'häll':44 'hållb':79 'in':27,68 'ingrediens':54 'krus':66 'kyl':30,70,83 'köttet':36 'lag':25,46 'ligg':34 'lägg':21 'låt':32 'löst':19 'mogn':73 'ner':22 'rör':15 'salt':11 'senapsgrav':1 'senapssås':56,60 'servering':78 'skinnet':49 'skål':9 'sock':13 'strömming':2,51,58 'ställ':26,67 'till':16,35 'tillsät':10 'timm':43 'varv':57 'vatt':4 'veck':81 'vitt':38 'ättiksprit':6
44687753-8723-45cf-b025-c07fe64d1a05	2020-12-30 20:12:09.175593	2023-08-11 14:48:54.654293	Vit chokladmousse med lakrits	4	portioner	\N	\N	1. Recept från boken ”Lakrits: godis, bakverk, desserter, mat & dryck” av Elisabeth Johansson. Fotograf: Helén Pe. Bonnier Fakta.\n\n2. Hacka den vita chokladen och lägg den i en bunke. Koka upp grädde och lakritsgranulat och vispa tills pulvret har lösts upp. Låt svalna i några minuter och häll sedan ner i bunken.\n\n3. Rör om tills chokladen har smält. Täck bunken med plastfolie och låt stå i kylen i minst 12 timmar.\n\n4. Ta fram bunken och vispa med elvisp upp den kalla gräddblandningen till en luftig mousse. Fördela moussen i små portionsglas.\n\n5. Sätt ugnen på 100 grader. Vispa äggvitorna och citronsaften till marängerna skummigt. Sänk hastigheten på elvispen och vispa ner hälften av strösockret.\n\n6. Tillsätt resten av sockret, öka hastigheten och vispa i ett par minuter. Sikta ner florsockret i marängen och vänd in det med en slickepott. Vänd ner hallonpurén.\n\n7. Fyll en engångsspritspåse och spritsa ut små maränger på en plåt med bakplåtspapper. Grädda mitt i ugnen i 15 –20 minuter. Håll koll på marängerna mot slutet så att de inte börjar bli bruna, för då försvinner den rosa färgen.\n\n8. Krossa chokladcookiesarna grovt och fördela smulorna över moussen. Lägg på maränger och garnera med hallon samt eventuellt lite lakritsgranulat.	44687753-8723-45cf-b025-c07fe64d1a05.webp	\N	jonas@stenberg.io	'1':5 '100':102 '12':75 '15':168 '2':23 '20':169 '3':57 '4':77 '5':98 '6':121 '7':149 '8':190 'bakplåtspapp':162 'bakverk':11 'bok':8 'bonni':21 'brun':183 'bunk':33,56,65,80 'börj':181 'choklad':27,61 'chokladcookies':192 'chokladmouss':2 'citronsaft':107 'dessert':12 'dryck':14 'elisabeth':16 'elvisp':84,114 'engångsspritspås':152 'eventuellt':207 'fakt':22 'florsockret':136 'fotograf':18 'fram':79 'fyll':150 'färg':189 'fördel':93,195 'försvin':186 'garner':203 'godis':10 'grad':103 'grovt':193 'grädd':36,163 'gräddblandning':88 'hack':24 'hallon':205 'hallonpurén':148 'hast':112,127 'helén':19 'hälft':118 'häll':52 'håll':171 'in':141 'johansson':17 'kall':87 'kok':34 'koll':172 'kross':191 'kyl':72 'lakrit':4,9 'lakritsgranul':38,209 'lit':208 'luft':91 'lägg':29,199 'låt':46,69 'löst':44 'maräng':109,138,157,174,201 'mat':13 'minst':74 'minut':50,133,170 'mouss':92,94,198 'ner':54,117,135,147 'par':132 'pe':20 'plastfoli':67 'plåt':160 'portionsgl':97 'pulvret':42 'recept':6 'rest':123 'ros':188 'rör':58 'samt':206 'sikt':134 'skumm':110 'slickepot':145 'slutet':176 'smul':196 'smält':63 'små':96,156 'sockret':125 'sprits':154 'strösockret':120 'stå':70 'svaln':47 'sänk':111 'sätt':99 'ta':78 'till':41,60 'tillsät':122 'timm':76 'täck':64 'ugn':100,166 'visp':40,82,104,116,129 'vit':1,26 'vänd':140,146 'äggvit':105 'öka':126
93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	2022-12-29 17:32:14.415375	2023-08-11 14:48:54.654293	Havets wallenbergare	4	portioner	\N	\N	Ställ in bunken och kniven till en matberedare i frysen\nminst 30 minuter.\n\nPotatispuré: Skala potatisen och koka mjuk i lättsaltat vatten. Häll av. Värm mjölk och grädde i en kastrull. Pressa potatisen och blanda med smör och gräddmjölken till en puré. Smaka av med salt.\n\nSkär fisken i mindre bitar och lägg i den kalla bunken med 1 tsk salt och peppar. Mixa så att fisken finfordelas, tillsätt grädden i en tunn stråle under fortsatt mixning.\n\nSätt ugnen pa 125 °C. Forma smeten till 4 stora eller 8 mindre runda bollar och lägg på ett fat med ströbröd. Tryck till försiktigt\noch vänd runt i ströbrödet.\nStek wallenbergarna i rikligt med olja och smör tills de är gyllene. Lägg i en ugnsform och stall in i mitten av ugnen\nca 10 minuter tills innertemperaturen är 58 °C.\n\nServera med potatispure, rårörda lingon, ärtor och citronklyftor. Toppa gärna med dill.	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d.webp	\N	jonas@stenberg.io	'1':61 '10':134 '125':83 '30':14 '4':88 '58':139 '8':91 'bit':53 'bland':37 'boll':94 'bunk':5,59 'c':84,140 'ca':133 'citronklyft':148 'dill':152 'fat':99 'finfordel':70 'fisk':50,69 'form':85 'fortsat':78 'frys':12 'försikt':104 'grädd':30,72 'gräddmjölk':41 'gyllen':121 'gärn':150 'havet':1 'häll':25 'in':4,128 'innertemperatur':137 'kall':58 'kastrull':33 'kniv':7 'kok':20 'lingon':145 'lägg':55,96,122 'lättsalt':23 'matbered':10 'mindr':52,92 'minst':13 'minut':15,135 'mitt':130 'mix':66 'mixning':79 'mjuk':21 'mjölk':28 'olj':115 'pa':82 'pepp':65 'potatis':18,35 'potatispur':143 'potatispuré':16 'press':34 'puré':44 'rik':113 'rund':93 'runt':107 'rårörd':144 'salt':48,63 'server':141 'skal':17 'skär':49 'smak':45 'smet':86 'smör':39,117 'stall':127 'stek':110 'stor':89 'strål':76 'ströbröd':101 'ströbrödet':109 'ställ':3 'sätt':80 'till':118,136 'tillsät':71 'topp':149 'tryck':102 'tsk':62 'tunn':75 'ugn':81,132 'ugnsform':125 'vatt':24 'vänd':106 'värm':27 'wallenberg':2,111 'ärt':146
8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	2022-05-01 21:19:23.701127	2023-08-11 14:48:54.654293	Krämig sötpotatisdhal	4	portioner	\N	\N	Sätt ugnen på 220 grader.\nTärna sötpotatis i 2 cm stora bitar. Blanda med olivolja, salt och peppar på en blåt med bakplåtspapper. Sprid ut och rosta i ugnen i ca 20 min, eller tills mjuka.\nSkölj linser. Finhacka lök, vitlök. Finriv ingefära och grovriv moroten.\nHetta upp olivolja i en traktörpanna eller kastrull på medelhög värme. Fräs lök och vitlök i 2-3 min.\nTillsätt ingefära, garam masala och curry, och fräs i 1-2 min.\nRör i kokosmjölk, 4 dl vatten och grönsaksbuljongen.\nTillsätt först belugalinser, ca 5 minuter innan de röda linserna. Koka upp. Sänk sedan värmen och sjud under lock tills linserna har mjuknat, ca 20-25 min. Smaka av med några droppar citronsaft, salt och peppar.\n\nFinhacka koriander och blanda med olivolja, salt och peppar i en skål.\nNär det återstår 10 min koktid på dhalen, skär tortillas i 3 cm breda band och placera på en plåt.\nPensla över korianderoljan och rosta i ugnen tills gyllene och krispiga, ca 4-6 min.\n\nSkölj spenat och rör ner tillsammans med sötpotatis. Koka upp så spenaten tappar sin spänst.\nServera med en klick yoghurt och krispiga korianderchips.	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62.webp	\N	jonas@stenberg.io	'-2':78 '-25':113 '-3':66 '-6':169 '1':77 '10':139 '2':11,65 '20':34,112 '220':6 '3':147 '4':83,168 '5':92 'bakplåtspapp':25 'band':150 'belugalins':90 'bit':14 'bland':15,127 'blåt':23 'bred':149 'ca':33,91,111,167 'citronsaft':120 'cm':12,148 'curry':73 'dhal':143 'dl':84 'dropp':119 'finhack':41,124 'finriv':44 'fräs':60,75 'först':89 'garam':70 'grad':7 'grovriv':47 'grönsaksbuljong':87 'gyllen':164 'hett':49 'ingefär':45,69 'innan':94 'kastrull':56 'klick':189 'kok':98,179 'kokosmjölk':82 'koktid':141 'koriand':125 'korianderchip':193 'korianderoljan':158 'krisp':166,192 'kräm':1 'lins':40,97,108 'lock':106 'lök':42,61 'masal':71 'medelhög':58 'minut':93 'mjuk':38 'mjukn':110 'morot':48 'ner':175 'olivolj':17,51,129 'pensl':156 'pepp':20,123,132 'placer':152 'plåt':155 'rost':29,160 'röd':96 'rör':80,174 'salt':18,121,130 'server':186 'sjud':104 'skär':144 'skål':135 'skölj':39,171 'smak':115 'spen':172 'spenat':182 'sprid':26 'spänst':185 'stor':13 'sänk':100 'sätt':3 'sötpotatis':9,178 'sötpotatisdhal':2 'tapp':183 'till':37,107,163 'tillsamman':176 'tillsät':68,88 'tortill':145 'traktörpan':54 'tärn':8 'ugn':4,31,162 'vatt':85 'vitlök':43,63 'värm':59,102 'yoghurt':190 'återstår':138
1312646e-45e1-407b-a46e-ed3b60bc1405	2020-11-17 17:55:13.522796	2023-08-11 14:48:54.654293	Knäckig rabarberpaj	4	portioner	\N	\N	Sätt ugnen på 175 grader.\n\nAnsa rabarbern och skär i små bitar. Lägg i en bunke och tillsätt socker och potatismjöl. Rör om och låt stå.\n\nSmält smöret i en kastrull. Ta lite av det smälta smöret och smörj in pajformen.\n\nHäll i grädde och sirap i smöret. Rör om och låt koka upp.\n\nStäng av plattan och tillsätt resten av ingredienserna till smeten direkt ner i kastrullen. Rör om.\n\nLägg rabarberbitarna i pajformen. Häll över den varma smeten och bre ut med hjälp av en sked.\n\nGrädda i mitten av ugnen i 30-35 min eller tills den fått färg. (Jag gräddar min ett steg ovanför mitten eftersom min ugn har mer undervärme.) Pajen ska ha ordentligt med färg annars riskerar du att inte få en knäckig paj. Tips! Placera lite folie i ugnen om det skulle droppa fruktsaft.\n\nLåt svalna! Pajen blir knäckigare när den svalnat.\n\nServeras med glass! Du kan servera glassen bredvid. 	1312646e-45e1-407b-a46e-ed3b60bc1405.webp	\N	jonas@stenberg.io	'-35':97 '175':6 '30':96 'annar':123 'ans':8 'bit':14 'bre':83 'bredvid':158 'bunk':18 'direk':67 'dropp':141 'eftersom':111 'foli':135 'fruktsaft':142 'färg':103,122 'få':128 'fått':102 'glass':153,157 'grad':7 'grädd':46,90,105 'hjälp':86 'häll':44,77 'in':42 'ingrediens':64 'kastrull':33,70 'knäck':1,130,147 'kok':55 'lit':35,134 'lägg':15,73 'låt':27,54,143 'mer':115 'mitt':92,110 'ner':68 'ordent':120 'ovanför':109 'paj':117,131,145 'pajform':43,76 'placer':133 'plattan':59 'potatismjöl':23 'rabarb':9 'rabarberbit':74 'rabarberpaj':2 'rest':62 'risker':124 'rör':24,51,71 'server':151,156 'sirap':48 'ska':118 'sked':89 'skär':11 'smet':66,81 'smält':29,38 'små':13 'smöret':30,39,50 'smörj':41 'sock':21 'steg':108 'stäng':57 'stå':28 'svaln':144,150 'sätt':3 'ta':34 'till':100 'tillsät':20,61 'tip':132 'ugn':4,94,113,137 'undervärm':116 'varm':80
12905e60-8310-45f0-8507-ad5334662b3a	2022-12-29 12:55:19.256035	2023-08-11 14:48:54.654293	Mammas äppelkaka med vaniljsås	4	portioner	\N	\N	Rör smör och socker. Blanda i mandlar, skorpmjöl och vetemjöl. \nRiv äpplen grovt och varva deg och äpplen. \nGrädda i ugnen på 225 grader.\n\nServera med vaniljsås.	12905e60-8310-45f0-8507-ad5334662b3a.webp	\N	jonas@stenberg.io	'225':27 'bland':9 'deg':20 'grad':28 'grovt':17 'grädd':23 'mamm':1 'mandl':11 'riv':15 'rör':5 'server':29 'skorpmjöl':12 'smör':6 'sock':8 'ugn':25 'vaniljsås':4,31 'varv':19 'vetemjöl':14 'äppelkak':2 'äppl':16,22
043263df-ef4d-4694-b989-8b01821706a2	2022-05-29 13:23:13.093179	2023-08-11 14:48:54.654293	Mammas dillkött	4	portioner	\N	\N	Koka upp köttet i vatten, så det täcker i en gryta. Skumma av.\nSalta efter ett tag.\nNär man häller i saltet blir det mer skum, fortsätt skumma av.\n\nNär man skummat av ha i klyftad lök, morötterna och kryddorna. Sen ska det sjuda i en och en halv timme.\n\nStäll åt sidan och ta upp köttet och låt svalna av.\n\nGör såsen i en annan kastrull. Sila av buljongen, och toppred.\nHa i pressad citron, dill och grädde. När såsen är av från pannan så kan man eventuellt vispa ner en äggula.\n\nLägg ner köttet och morotsbitarna.\n\nServera med kokt potatis.	043263df-ef4d-4694-b989-8b01821706a2.webp	\N	jonas@stenberg.io	'annan':68 'buljong':72 'citron':78 'dill':79 'dillköt':2 'eventuellt':91 'fortsät':29 'gryt':13 'grädd':81 'gör':64 'halv':51 'häll':22 'kastrull':69 'klyft':38 'kok':3 'kokt':103 'krydd':42 'köttet':5,59,98 'lägg':96 'låt':61 'lök':39 'mamm':1 'mer':27 'morotsbit':100 'moröt':40 'ner':93,97 'pannan':87 'potatis':104 'press':77 'salt':16 'saltet':24 'sen':43 'server':101 'sidan':55 'sil':70 'sjud':46 'ska':44 'skum':28 'skumm':14,30,34 'ställ':53 'svaln':62 'sås':65,83 'ta':57 'tag':19 'timm':52 'toppred':74 'täck':10 'vatt':7 'visp':92 'äggul':95
9b6996db-e837-44a4-bd55-46f9ed31f515	2022-12-29 17:21:28.347914	2023-08-11 14:48:54.654293	Rimmad torsk med brynt smör och potatispuré	4	portioner	\N	\N	Strö salt på fisken och låt vila i 20 minuter.\n\nBrynt smör: Bryn smöret i en kastrull till gyllene och nötig doft\n\nPotatispuré: Skala potatisen och koka mjuk i lättsaltat vatten.\nVärm upp mjölk och smor tillsammans. Vispa samman potatisen med den varma mjölken till luftig konsistens. Smaka av med salt. (Vispa inte för länge, dà blir det klistrigt.)\n\nÄppelsallad: Blanda gulbetor, äpple, citronskal och saft, persilja, rucola, kapris och olivolia. Smaka av med salt och peppar.\n\nKlappa fisken torr och stek i smör ca 3 min pà varie sida, beroende pà tjocklek.\n\nServera fisken med puré, sallad. brynt smör och pepparrot blandat med krasse.	9b6996db-e837-44a4-bd55-46f9ed31f515.webp	\N	jonas@stenberg.io	'20':16 '3':93 'beroend':98 'bland':68,110 'bryn':20 'brynt':4,18,106 'ca':92 'citronskal':71 'doft':29 'dà':63 'fisk':11,86,102 'gulbet':69 'gyllen':26 'kapris':76 'kastrull':24 'klapp':85 'klistr':66 'kok':34 'konsist':54 'krass':112 'luft':53 'läng':62 'lättsalt':37 'låt':13 'minut':17 'mjuk':35 'mjölk':41,51 'nöt':28 'olivoli':78 'pepp':84 'pepparrot':109 'persilj':74 'potatis':32,47 'potatispuré':7,30 'puré':104 'pà':95,99 'rimm':1 'rucol':75 'saft':73 'sall':105 'salt':9,58,82 'samman':46 'server':101 'sid':97 'skal':31 'smak':55,79 'smor':43 'smör':5,19,91,107 'smöret':21 'stek':89 'strö':8 'tillsamman':44 'tjocklek':100 'torr':87 'torsk':2 'vari':96 'varm':50 'vatt':38 'vil':14 'visp':45,59 'värm':39 'äppelsall':67 'äppl':70
076be509-1a06-41b5-946a-31693a6a8079	2020-12-22 17:02:27.059205	2023-08-11 14:48:54.654293	Fisk i ugn	4	portioner	\N	\N	Sätt ugnen på 220 grader.\n\nSjud fisken i 2-3 cm saltat vatten med fiskkrydd och kryddpepparkorn i en traktörpanna tills den precis börjar bli vit runt om. Plocka upp och lägg i en ugnssäker form. Behåll buljongen!\n\nFräs smör tillsammans med mjölet i en annan kastrull, vispa ner buljongen, pressa citron, ha i dragonen och grädden, koka ihop.\nTa av och vispa ner en äggula\n\nHäll såsen på fisken, på med lite riven ost och gratinera i ugnen ca 10 minuter.\n\nServera med potatismos.	076be509-1a06-41b5-946a-31693a6a8079.webp	\N	jonas@stenberg.io	'-3':13 '10':84 '2':12 '220':7 'annan':49 'behåll':40 'buljong':41,53 'börj':27 'ca':83 'citron':55 'cm':14 'dragon':58 'fisk':1,10,73 'fiskkryd':18 'form':39 'fräs':42 'grad':8 'gratiner':80 'grädd':60 'häll':70 'ihop':62 'kastrull':50 'kok':61 'kryddpepparkorn':20 'lit':76 'lägg':35 'minut':85 'mjölet':46 'ner':52,67 'ost':78 'plock':32 'potatismo':88 'precis':26 'press':54 'riv':77 'runt':30 'salt':15 'server':86 'sjud':9 'smör':43 'sätt':4 'sås':71 'ta':63 'till':24 'tillsamman':44 'traktörpan':23 'ugn':3,5,82 'ugnssäk':38 'vatt':16 'visp':51,66 'vit':29 'äggul':69
05bb7c8d-c879-41cb-aad0-44ce505db2ae	2020-12-26 15:55:40.087658	2023-08-11 14:48:54.654293	Guldmjölk	4	portioner	\N	\N	Mortla kardemumma och svartpeppar fint.\nBlanda med övriga ingredienser till pastan i en kastrull.\nKoka upp försiktigt och låt sjuda under omrörning 1-2 minuter till det tjocknat.\nVärm upp mjölken och tillsätt 1-2 msk guldmjölkspasta eller efter smak.\n\nTips: För att göra ingefärajuice utan grönsakscentrifug river du ingefära på fina sidan av rivjärnet och kramar ur saften.	05bb7c8d-c879-41cb-aad0-44ce505db2ae.webp	\N	jonas@stenberg.io	'-2':25,36 '1':24,35 'bland':7 'fin':53 'fint':6 'försikt':18 'grönsakscentrifug':48 'guldmjölk':1 'guldmjölkspast':38 'gör':45 'ingefär':51 'ingefärajuic':46 'ingrediens':10 'kardemumm':3 'kastrull':15 'kok':16 'kram':58 'låt':20 'minut':26 'mjölk':32 'mortl':2 'msk':37 'omrörning':23 'pastan':12 'riv':49 'rivjärnet':56 'saft':60 'sidan':54 'sjud':21 'smak':41 'svartpepp':5 'tillsät':34 'tip':42 'tjockn':29 'ur':59 'värm':30 'övr':9
647d6e35-8369-4e00-8146-7d0587c28478	2022-12-29 17:29:34.277671	2023-08-11 14:48:54.654293	Halloumi stroganof	4	portioner	\N	\N	Skala och hacka löken. Skala och skär morötterna i mindre bitar eller riv dem grovt med ett riviärn. Skär halloumin i stavar.\n\nStek osten i olja i en stekpanna tills de har fin färg runt om. Lägg över på ett fat.\n\nStek lök och morot i pannan. Tillsätt paprikapulver, tomatpuré, dijonsenap och smulad buljongtärning. Rör om och låt fräsa i 1 min. Häll på vatten, rör om och låt puttra i någon minut.\n\nVänd ner halloumin och slå pa grädden, lät koka upp. Vill du ha en mer säsig stroganoff, tillsätt lite mer grädde eller vatten. Smaka av med salt och peppar.\n\nServer tillsammans med kokt ris, rucola och hackade hasselnötter. \n\nLite hemlagad aioli är gott till.	647d6e35-8369-4e00-8146-7d0587c28478.webp	\N	jonas@stenberg.io	'1':63 'aioli':116 'bit':13 'buljongtärning':56 'dijonsenap':53 'fat':43 'fin':35 'fräs':61 'färg':36 'gott':118 'grovt':17 'grädd':82,96 'hack':5,112 'halloumi':1 'halloumin':22,78 'hasselnöt':113 'hemlag':115 'häll':65 'kok':84 'kokt':108 'lit':94,114 'lägg':39 'lät':83 'låt':60,71 'lök':6,45 'mer':90,95 'mindr':12 'minut':75 'morot':47 'moröt':10 'ner':77 'olj':28 'ost':26 'pa':81 'pannan':49 'paprikapulv':51 'pepp':104 'puttr':72 'ris':109 'riv':15 'riviärn':20 'rucol':110 'runt':37 'rör':57,68 'salt':102 'serv':105 'skal':3,7 'skär':9,21 'slå':80 'smak':99 'smul':55 'stav':24 'stek':25,44 'stekpan':31 'stroganof':2 'stroganoff':92 'säs':91 'till':32 'tillsamman':106 'tillsät':50,93 'tomatpuré':52 'vatt':67,98 'vill':86 'vänd':76
e93d25fa-4339-4a26-87d4-5329921b5786	2021-01-16 09:28:04.555309	2023-08-11 14:48:54.654293	Kikärtsgryta med röd curry och kokosmjölk	4	portioner	\N	\N	Koka ris enl. anvisningarna på paketet.\nHacka lök och vitlök och fräs i olja.\nHacka basilikan och tillsätt tillsammans med kokosmjölk, curry, currypasta och kikärtor. Smaka av med salt.\nKoka upp och låt puttra i ca 5 minuter.\nDela tomaterna på mitten och häll i grytan.\nTillsätt saften från 1/4 lime.\nLåt koka tills tomaterna är mjuka.\nServera med ris och toppa med färsk basilika	e93d25fa-4339-4a26-87d4-5329921b5786.webp	\N	jonas@stenberg.io	'1/4':56 '5':43 'anvisning':10 'basilik':71 'basilikan':22 'ca':42 'curry':4,28 'currypast':29 'del':45 'enl':9 'fräs':18 'färsk':70 'grytan':52 'hack':13,21 'häll':50 'kikärt':31 'kikärtsgryt':1 'kok':7,36,59 'kokosmjölk':6,27 'lim':57 'låt':39,58 'lök':14 'minut':44 'mitt':48 'mjuk':63 'olj':20 'paketet':12 'puttr':40 'ris':8,66 'röd':3 'saft':54 'salt':35 'server':64 'smak':32 'till':60 'tillsamman':25 'tillsät':24,53 'tomat':46,61 'topp':68 'vitlök':16
f26e4739-19bc-48f4-91ed-e87268a69423	2022-12-29 12:37:33.928328	2023-08-11 14:48:54.654293	Mammas lammstek	4	portioner	\N	\N	Sätt ugnen på 175 grader.\n\nGnid in steken med salt, peppar och kryddorna. Stick in vitlöksklyftorna med hjälp av en vass kniv i steken. \n\nBryn steken i en stekpanna eller gryta till den fått färg. Om den är för stor så skippa detta steget.\n\nSätt in en aluminiumfolie-klädd form eller plåt i botten av ugnen med 1 dl vatten i. Sätt in steken på ett galler i mitten av ugnen till den fått en innertemperatur på 65 grader. Se till att det alltid finns vätska i formen eller plåten i botten av ugnen så det inte bränner vid.\n\nSätt ugnen på 200 grader.\n\nSkiva potatisen tunt och lägg i en långpanna. Häll över vätskan från formen eller plåten över potatisen och sätt in i ugnen till potatisen blivit gyllenbrun.	f26e4739-19bc-48f4-91ed-e87268a69423.webp	\N	jonas@stenberg.io	'1':61 '175':6 '200':106 '65':81 'alltid':87 'aluminiumfoli':51 'aluminiumfolie-kläd':50 'bott':57,95 'bryn':27 'bränn':101 'dl':62 'finn':88 'form':53,91,120 'färg':37 'fått':36,77 'gall':70 'gnid':8 'grad':7,82,107 'gryt':33 'gyllenbrun':133 'hjälp':20 'häll':116 'in':9,17,48,66,127 'innertemperatur':79 'klädd':52 'kniv':24 'krydd':15 'lammstek':2 'lägg':112 'långpan':115 'mamm':1 'mitt':72 'pepp':13 'plåt':55,93,122 'potatis':109,124,131 'salt':12 'se':83 'skipp':44 'skiv':108 'steget':46 'stek':10,26,28,67 'stekpan':31 'stick':16 'stor':42 'sätt':3,47,65,103,126 'tunt':110 'ugn':4,59,74,97,104,129 'vass':23 'vatt':63 'vitlöksklyft':18 'vätsk':89 'vätskan':118
fb5328c4-5e22-41d7-a1e1-35448e96b4af	2020-12-26 15:40:43.094303	2023-08-11 14:48:54.654293	Morotssoppa med kokos	4	portioner	\N	\N	Hetta upp olivolja i en stor gryta och fräs lök, vitlök, morötter, spiskummin, ingefära och chiliflakes tills de får lite färg.\nHäll i nästan all kokosmjölk i grytan ihop med grönsaksfond och vatten. Låt sjuda utan lock cirka 15–20 minuter eller tills morötterna är mjuka.\nMixa soppan slät och tillsätt limejuice, salt och svartpeppar. Späd ev med vatten.\nTill servering: Ringla över resten av kokosmjölken och toppa gärna med pumpafrön vid servering.	fb5328c4-5e22-41d7-a1e1-35448e96b4af.webp	\N	jonas@stenberg.io	'15':42 '20':43 'all':28 'chiliflak':19 'cirk':41 'ev':60 'fräs':12 'färg':24 'får':22 'gryt':10 'grytan':31 'grönsaksfond':34 'gärn':72 'hett':4 'häll':25 'ihop':32 'ingefär':17 'koko':3 'kokosmjölk':29,69 'limejuic':55 'lit':23 'lock':40 'låt':37 'lök':13 'minut':44 'mix':50 'mjuk':49 'morotssopp':1 'moröt':15,47 'nästan':27 'olivolj':6 'pumpafrön':74 'rest':67 'ringl':65 'salt':56 'servering':64,76 'sjud':38 'slät':52 'soppan':51 'spiskummin':16 'späd':59 'stor':9 'svartpepp':58 'till':20,46 'tillsät':54 'topp':71 'vatt':36,62 'vitlök':14
1cb4d94c-8104-47ee-8849-c11bbdc60c1b	2020-11-17 18:06:35.71147	2023-08-11 14:48:54.654293	Ört- och vitlöksgravad strömming	4	portioner	\N	\N	Blanda vatten och ättikssprit i en skål. Tillsätt saltet och rör tills det har löst sig. Lägg ner filéerna i lagen. Ställ in i kyl och låt dem ligga där tills köttet blivit vitt och fast, ca 6 timmar. Häll bort lagen. Drag skinnet av strömmingen. Blanda alla ingredienser till örtsåsen. Varva strömming och sås i en burk eller krus. Ställ in den i kylen för att mogna, ca 1 dygn före servering. Hållbar ca 1 vecka i kyl.	1cb4d94c-8104-47ee-8849-c11bbdc60c1b.webp	\N	jonas@stenberg.io	'1':74,80 '6':42 'bland':5,51 'bort':45 'burk':62 'ca':41,73,79 'drag':47 'dygn':75 'fast':40 'filé':23 'för':76 'häll':44 'hållb':78 'in':27,66 'ingrediens':53 'krus':64 'kyl':29,69,83 'köttet':36 'lag':25,46 'ligg':33 'lägg':21 'låt':31 'löst':19 'mogn':72 'ner':22 'rör':15 'saltet':13 'servering':77 'skinnet':48 'skål':11 'strömming':4,50,57 'ställ':26,65 'sås':59 'till':16,35 'tillsät':12 'timm':43 'varv':56 'vatt':6 'veck':81 'vitlöksgrav':3 'vitt':38 'ättikssprit':8 'ört':1 'örtsås':55
e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	2020-11-17 09:47:13.881733	2023-08-11 14:48:54.654293	Pasta med räkor, chili och tomat	4	portioner	\N	\N	Ansa och skölj purjolöken noga. Skiva den tunt. Finhacka chilin och halvera tomaterna.\n\nKoka pastan enligt anvisning på förpackningen.\n\nFräs purjolök, vitlök och chili i oljan ca 5 minuter tills löken mjuknar. Tillsätt tomatpure och fräs med i en minut. Tillsätt tomaterna och fräs ytterligare 2 minuter. Häll på grädde och låt koka ihop. Smaka av med citronskal, salt och peppar. Vänd ner räkorna.\n\nBlanda pastan med såsen och hälften av osten.\nServera med resten av parmesanen vid sidan av.\n	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b.webp	\N	jonas@stenberg.io	'2':52 '5':34 'ans':7 'anvisning':23 'bland':71 'ca':33 'chili':4,30 'chilin':16 'citronskal':64 'enl':22 'finhack':15 'fräs':26,42,50 'förpackning':25 'grädd':56 'halver':18 'hälft':76 'häll':54 'ihop':60 'kok':20,59 'låt':58 'lök':37 'minut':35,46,53 'mjukn':38 'ner':69 'nog':11 'oljan':32 'ost':78 'parmesan':83 'past':1 'pastan':21,72 'pepp':67 'purjolök':10,27 'rest':81 'räk':3,70 'salt':65 'server':79 'sidan':85 'skiv':12 'skölj':9 'smak':61 'sås':74 'till':36 'tillsät':39,47 'tom':6 'tomat':19,48 'tomatpur':40 'tunt':14 'vitlök':28 'vänd':68 'ytter':51
7f4502e4-b154-4bfe-b0ae-a4f762c7a910	2020-11-16 20:56:04.321388	2023-08-11 14:48:54.654293	Tonfiskpasta med chili, citron och kapris	4	portioner	\N	\N	Hacka lök och vitlök. Fräs i olivoljan. Låt chiliflaksen och kaprisen fräsa med mot slutet.\nTillsätt tonfisken och några droppar citronsaft.\n\nKoka spaghettin och spara 1 dl pastavatten.\n\nNär pastan nästan är klar, ha i rivet citronskal från en halv citron och persiljan. Börja med en halv dl pastavatten och känn efter hur konsistensen blir, tillsätt mer om det behövs.\n\nVänd ner pastan och servera med parmesanen vid sidan om.	7f4502e4-b154-4bfe-b0ae-a4f762c7a910.webp	\N	jonas@stenberg.io	'1':32 'behöv':66 'börj':50 'chili':3 'chiliflaks':15 'citron':4,47 'citronsaft':27 'citronskal':43 'dl':33,54 'dropp':26 'fräs':11,18 'hack':7 'halv':46,53 'kapris':6,17 'klar':39 'kok':28 'konsistens':60 'känn':57 'låt':14 'lök':8 'mer':63 'ner':68 'nästan':37 'olivoljan':13 'parmesan':73 'pastan':36,69 'pastavat':34,55 'persiljan':49 'rivet':42 'server':71 'sidan':75 'slutet':21 'spaghettin':29 'spar':31 'tillsät':22,62 'tonfisk':23 'tonfiskpast':1 'vitlök':10 'vänd':67
1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	2022-12-29 17:24:19.424081	2023-08-11 14:48:54.654293	Kalljästa morotsfrallor med äpple	4	portioner	\N	\N	1. Vispa hop jästen med vattnet i en bunke. Tillsätt rägmjöl, vetemjöl och salt. Rör hop till en lös deg. Tillsätt morot och äpple och blanda hop. Lät jäsa övertäckt i rumstemperatur över natten, eller ca 10 timmar.\n\n2. Sätt ugnen pà 250°C. Ställ in en plåt så att den blir het.\nKlicka ut degen till frallor på ett bakplåtspapper med mjölade\nhänder. Ta ut den varma plåten och skjut över bakplåtspappret\nmed frallorna på plåten. Grädda i mitten av ugnen 12-15 minuter eller tills frallorna fått fin färg. Låt svalna på galler.	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50.webp	\N	jonas@stenberg.io	'-15':88 '1':5 '10':41 '12':87 '2':43 '250':47 'bakplåtspapp':65 'bakplåtspappret':77 'bland':30 'bunk':13 'c':48 'ca':40 'deg':24,60 'fin':94 'frall':62,79,92 'färg':95 'fått':93 'gall':99 'grädd':82 'het':57 'hop':7,20,31 'händ':68 'in':50 'jäs':33 'jäst':8 'kalljäst':1 'klick':58 'lät':32 'låt':96 'lös':23 'minut':89 'mitt':84 'mjöl':67 'morot':26 'morotsfrall':2 'natt':38 'plåt':52,73,81 'pà':46 'rumstemperatur':36 'rägmjöl':15 'rör':19 'salt':18 'skjut':75 'ställ':49 'svaln':97 'sätt':44 'ta':69 'till':91 'tillsät':14,25 'timm':42 'ugn':45,86 'varm':72 'vattnet':10 'vetemjöl':16 'visp':6 'äppl':4,28 'övertäck':34
ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	2020-11-24 20:51:42.560464	2023-08-11 14:48:54.654293	Bönchili med koriander och nachos	4	portioner	15	60	Finhacka gullöken, vitlöken och chilin. Skär morötterna och bleksellerin i små kuber.\n\nStek alla grönsaker i rikligt med olivolja. Ha i tomatpurén när löken är genomskinlig och låt fräsa med någon minut.\nBlanda ner timjan, oregano, paprikapulver och spiskummit. Ha i burktomaterna och en burk vatten.\n\nLåt koka upp.\n\nBlanda ner bönorna och kakaon och låt koka ca. 10 minuter.\n\nSalta och peppra.\n\nSkär bort båda stammen och bladen på koriandern. Finhacka stammen och lägg ner i grytan innan servering.\nGrovhacka bladen och servera vid sidan om.	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9.webp	\N	jonas@stenberg.io	'10':64 'blad':74,87 'bland':38,55 'bleksellerin':14 'bort':70 'burk':50 'burktomat':47 'båd':71 'bön':57 'bönchili':1 'ca':63 'chilin':10 'finhack':6,77 'fräs':34 'genomskin':31 'grovhack':86 'grytan':83 'grönsak':20 'gullök':7 'innan':84 'kakaon':59 'kok':53,62 'koriand':3,76 'kub':17 'lägg':80 'låt':33,52,61 'lök':29 'minut':37,65 'moröt':12 'nacho':5 'ner':39,56,81 'olivolj':24 'oregano':41 'paprikapulv':42 'peppr':68 'rik':22 'salt':66 'server':89 'servering':85 'sidan':91 'skär':11,69 'små':16 'spiskummit':44 'stamm':72,78 'stek':18 'timjan':40 'tomatpurén':27 'vatt':51 'vitlök':8
41bc608a-d07b-45f2-a533-2085726ae280	2020-11-16 20:46:51.50334	2023-08-11 14:48:54.654293	Chipotlegryta	4	portioner	\N	\N	Hacka gullökarna, vitlöksklyftorna och ingefäran fint.\nFräs i kokosolja i några minuter tills löken är genomskinlig.\nTillsätt tomatpuren och adobo chipotlen och fräs ytterliggare en minut.\n\nGrovriv morötterna under tiden.\n\nHa i krossade tomater och morötterna och puttra i minst 30 minuter. Tillsätt kokosmjölken och de röda linserna och koka tills linserna är klara.	41bc608a-d07b-45f2-a533-2085726ae280.webp	\N	jonas@stenberg.io	'30':42 'adobo':21 'chipotl':22 'chipotlegryt':1 'fint':7 'fräs':8,24 'genomskin':17 'grovriv':28 'gullök':3 'hack':2 'ingefäran':6 'klar':55 'kok':51 'kokosmjölk':45 'kokosolj':10 'kross':34 'lins':49,53 'lök':15 'minst':41 'minut':13,27,43 'moröt':29,37 'puttr':39 'röd':48 'tid':31 'till':14,52 'tillsät':18,44 'tomat':35 'tomatpur':19 'vitlöksklyft':4 'ytterligg':25
a644a7d4-a57f-45ae-97d4-1ae39a0638a5	2022-12-29 12:40:19.597625	2023-08-11 14:48:54.654293	Mammas kardemummaskorpor	4	portioner	\N	\N	Blanda alla torra ingredienserna och finfördela smöret i. Blanda i mjölken.\nGör små bullar som gräddas i 225-250 grader, ca 8 minuter.\nDela bullarna och rosta i 150 grader.	a644a7d4-a57f-45ae-97d4-1ae39a0638a5.webp	\N	jonas@stenberg.io	'-250':21 '150':31 '225':20 '8':24 'bland':3,11 'bull':16,27 'ca':23 'del':26 'finfördel':8 'grad':22,32 'grädd':18 'gör':14 'ingrediens':6 'kardemummaskorp':2 'mamm':1 'minut':25 'mjölk':13 'rost':29 'små':15 'smöret':9 'torr':5
a7f351df-a980-49b4-b5b5-38d6f191a3b6	2023-08-04 12:31:16.591547	2023-08-11 19:03:45.426149	Inlagda gurkor	2	mellanstora glasburkar	\N	\N	1. Tvätta gurkorna noga och skiva. Skala pepparroten och dela i cm-stora kuber.\n2. Varva gurkskivor, dillkronor, pepparrot och senapsfrön i väl rengjorda burkar.\n3. Blanda ihop lagen och rör till socker och salt har löst sig väl. Det tar ca 10 minuter och ibland lite längre tid innan salt och socker har löst sig.\n4. Häll lagen i burkarna. Den behöver inte täcka gurkskivorna för de saftar sig själva.\nLägg gärna en skalad potatis överst som pressar ner gurkan. Den tas sedan bort efter några dagar.	a7f351df-a980-49b4-b5b5-38d6f191a3b6.webp	\N	jonas@stenberg.io	'1':3 '10':46 '2':18 '3':29 '4':60 'behöv':66 'bland':30 'bort':88 'burk':28,64 'ca':45 'cm':15 'cm-stor':14 'dag':91 'del':12 'dillkron':21 'gurk':2,5 'gurkan':84 'gurkskiv':20,69 'gärn':76 'häll':61 'ibland':49 'ihop':31 'inlag':1 'innan':53 'kub':17 'lag':32,62 'lit':50 'lägg':75 'längr':51 'löst':40,58 'minut':47 'ner':83 'nog':6 'pepparrot':10,22 'potatis':79 'press':82 'rengjord':27 'rör':34 'saft':72 'salt':38,54 'senapsfrön':24 'själv':74 'skal':9,78 'skiv':8 'sock':36,56 'stor':16 'tar':44 'tas':86 'tid':52 'tvätt':4 'täck':68 'varv':19 'väl':26,42 'överst':80
24194bad-e62c-49a3-8e4b-3b8a35e8c724	2023-08-05 10:08:37.352644	2023-08-11 14:48:54.654293	Mommakakor	4	portioner	0	0	Rör socker och smör poröst. Tillsätt övriga ingredienser och blanda till jämn deg. Rulla ut 4 längder, lägg dom på bakplåtspapper och tryck ut dom med fingrarna. Grädda i 200 grader, ca 15 minuter eller tills kakorna blivit gyllenbruna. Skär dem i den storlek som önskas.	24194bad-e62c-49a3-8e4b-3b8a35e8c724.webp	\N	jonas@stenberg.io	'15':34 '200':31 '4':17 'bakplåtspapp':22 'bland':11 'ca':33 'deg':14 'dom':20,26 'fingr':28 'grad':32 'grädd':29 'gyllenbrun':40 'ingrediens':9 'jämn':13 'kak':38 'lägg':19 'läng':18 'minut':35 'mommakak':1 'poröst':6 'rull':15 'rör':2 'skär':41 'smör':5 'sock':3 'storlek':45 'till':37 'tillsät':7 'tryck':24 'önsk':47 'övr':8
dd534f07-426c-4dcc-87e0-8174d44d03f7	2020-11-21 15:32:01.748489	2023-08-11 14:48:54.654293	Spaghetti och (veg)köttfärssås	4	portioner	\N	\N	Hacka gullök. Skiva morötter och rotselleri i ca. 0.5 cm stora bitar. Finhacka vitlöken.\nFräs gullöken, vitlöken, morötterna och rotselleri i olivoljan tills löken är genomskinlig. Ha i anammafärsen och fräs med ytterliggare några minuter. Ha i tomatpuren och fräs med en minut.\nHa i vinet och låt det vätskan puttra bort någon minut.\nTillsätt burktomaterna och den torkade basilikan och låt puttra. Desto längre desto bättre. Tillsätt vatten om det blir torrt. \nSmaka av med salt och peppar.	dd534f07-426c-4dcc-87e0-8174d44d03f7.webp	\N	jonas@stenberg.io	'0.5':13 'anammafärs':33 'basilikan':64 'bit':16 'bort':56 'burktomat':60 'bättr':71 'ca':12 'cm':14 'desto':68,70 'finhack':17 'fräs':19,35,44 'genomskin':30 'gullök':6,20 'hack':5 'köttfärssås':4 'längr':69 'låt':52,66 'lök':28 'minut':39,47,58 'moröt':8,22 'olivoljan':26 'pepp':83 'puttr':55,67 'rotselleri':10,24 'salt':81 'skiv':7 'smak':78 'spaghetti':1 'stor':15 'till':27 'tillsät':59,72 'tomatpur':42 'tork':63 'torrt':77 'vatt':73 'veg':3 'vinet':50 'vitlök':18,21 'vätskan':54 'ytterligg':37
9bbf4e07-645f-44a4-88e2-ca7d23f31746	2022-12-29 17:35:36.149884	2023-08-11 14:48:54.654293	Stekta kroppkakor med svamp och hasselnötter	4	portioner	\N	\N	Skala och koka potatisen i lättsaltat vatten. Pressa genom en potatispress och låt svalna. Vispa ihop ägget.\nBlanda potatis, ägg, mjöl och 1 tsk salt till en jämn deg.\n\nFyllning: Skala och finhacka löken. Fräs löken i 2 msk smör på låg värme tills den mjuknar ca 10 minuter. Höj värmen och tillsätt svamp, kryddpeppar, ½ tsk salt och stek vtterligare några minuter. Rör ner nötterna.	9bbf4e07-645f-44a4-88e2-ca7d23f31746.webp	\N	jonas@stenberg.io	'1':29 '10':54 '2':44 'bland':24 'ca':53 'deg':35 'finhack':39 'fräs':41 'fyllning':36 'genom':15 'hasselnöt':6 'höj':56 'ihop':22 'jämn':34 'kok':9 'kroppkak':2 'kryddpepp':61 'lättsalt':12 'låg':48 'låt':19 'lök':40,42 'minut':55,68 'mjukn':52 'mjöl':27 'msk':45 'ner':70 'nött':71 'potatis':10,25 'potatispress':17 'press':14 'rör':69 'salt':31,63 'skal':7,37 'smör':46 'stek':65 'stekt':1 'svaln':20 'svamp':4,60 'till':50 'tillsät':59 'tsk':30,62 'vatt':13 'visp':21 'vtter':66 'värm':49,57 'ägg':26 'ägget':23
8ecc7ec6-54e8-466b-bd41-36d4a05539e7	2022-12-29 12:57:11.352181	2023-08-11 19:04:07.103485	Mammas äppelkaka i svampskogen	8	bitar	\N	\N	Blanda alla ingredienser och lägg i en pajform.\nLägg på äppelklyftorna. Lägg på smörklickar och kanel.\n\nGrädda i 30-40 minuter på 175 grader.	8ecc7ec6-54e8-466b-bd41-36d4a05539e7.webp	\N	jonas@stenberg.io	'-40':24 '175':27 '30':23 'bland':5 'grad':28 'grädd':21 'ingrediens':7 'kanel':20 'lägg':9,13,16 'mamm':1 'minut':25 'pajform':12 'smörklick':18 'svampskog':4 'äppelkak':2 'äppelklyft':15
4aa69da1-cda1-46cb-b386-6fd0e5251b6e	2020-11-21 15:16:22.100787	2023-08-12 14:24:33.506243	Lax med pepparrotscreme och ugnsrostad potatis	4	portioner	\N	\N	Sätt ugnen på 200 grader.\n\n### Ugnsrostad potatis\nSkala och skär potatisen i mindre klyftor. Blanda med olivolja, salt och peppar och lägg ut på en plåt med bakplåtspapper. Sätt in i ugnen i ca 25 minuter eller tills potatisen är gyllenbrun.\n\n### Pepparrotscreme\nBlanda alla ingredienser i en skål och bred ut ovanpå laxfiléerna eller laxsidan. Sätt in i ugnen ca. 15-20 minuter eller till laxen har en innertemperatur på 55-57 grader.\n\nServera med sallad.	\N	\N	jonas@stenberg.io	'-20':68 '-57':78 '15':67 '200':10 '25':41 '55':77 'bakplåtspapp':34 'bland':21,49 'bred':56 'ca':40,66 'grad':11,79 'gyllenbrun':47 'in':36,63 'ingrediens':51 'innertemperatur':75 'klyft':20 'lax':1,72 'laxfilé':59 'laxsidan':61 'lägg':28 'mindr':19 'minut':42,69 'olivolj':23 'ovanpå':58 'pepp':26 'pepparrotscrem':3,48 'plåt':32 'potatis':6,13,17,45 'sall':82 'salt':24 'server':80 'skal':14 'skär':16 'skål':54 'sätt':7,35,62 'till':44 'ugn':8,38,65 'ugnsrost':5,12
e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	2022-09-22 19:54:14.424542	2023-08-13 20:01:47.49987	Lemon posset med hallon	4	portioner	10	240	Koka upp grädde och socker, låt koka 1 minut. Ta från värmen och rör ner citronjuice.\n\nHäll upp i 6 formar eller glas (för 6 port) och ställ i kylen minst 4 timmar eller tills de stelnat.\n\nTill servering: Toppa med hallon vid servering.	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b.webp	\N	jonas@stenberg.io	'1':12 '4':36 '6':24,29 'citronjuic':20 'form':25 'glas':27 'grädd':7 'hallon':4,46 'häll':21 'kok':5,11 'kyl':34 'lemon':1 'låt':10 'minst':35 'minut':13 'ner':19 'port':30 'posset':2 'rör':18 'servering':43,48 'sock':9 'steln':41 'ställ':32 'ta':14 'till':39 'timm':37 'topp':44 'värm':16
04ecefde-1b56-44df-9aef-401c9e48c34a	2023-08-04 11:15:45.48476	2023-08-14 09:21:12.57946	Amerikanska blåbärsmuffins	12	muffins	15	15	Vispa smör och socker vitt och pösigt. Rör i äggen , ett i taget. Tillsätt vaniljsocker och mjölk. Blanda mjöl och bakpulver och rör i smeten. Fyll formarna med\nsmeten.\n\nTryck i blåbären med en sked.\nGrädda mitt i ugnen på 200° i ca 15 min.	04ecefde-1b56-44df-9aef-401c9e48c34a.webp	\N	jonas@stenberg.io	'15':46 '200':43 'amerikansk':1 'bakpulv':23 'bland':20 'blåbär':34 'blåbärsmuffin':2 'ca':45 'form':29 'fyll':28 'grädd':38 'mjöl':21 'mjölk':19 'pös':9 'rör':10,25 'sked':37 'smet':27,31 'smör':4 'sock':6 'taget':15 'tillsät':16 'tryck':32 'ugn':41 'vaniljsock':17 'visp':3 'vitt':7 'ägg':12
d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	2022-12-29 17:26:36.816902	2023-08-13 20:14:30.366565	Lövbiffsgryta	4	portioner	\N	\N	Strimla köttet tunt och hetta upp en stekpanna. Klicka i smör och lägg i hälften av köttet. Stek på hög värme under omrörning. Salta och peppra. Flytta över köttet på en tallrik när det fått stekyta. Stek resten av köttet.\n\nStek lök och vitlök tills löken är mjuk. Häll tillbaka allt kött.\n\nHäll i grädde, senap och soja. Lät småputtra några minuter.\nLägg bönorna i saltat kokande vatten och låt koka ca 2 min.\nServera grytan med ris eller potatis samt bönorna.	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e.webp	\N	jonas@stenberg.io	'2':74 'bön':65,83 'ca':73 'flytt':28 'fått':36 'grytan':77 'grädd':56 'hett':6 'hälft':16 'häll':50,54 'hög':21 'klick':10 'kok':68,72 'kött':53 'köttet':3,18,30,41 'lägg':14,64 'lät':60 'låt':71 'lök':43,47 'lövbiffsgryt':1 'minut':63 'mjuk':49 'omrörning':24 'peppr':27 'potatis':81 'rest':39 'ris':79 'salt':25,67 'samt':82 'senap':57 'server':76 'småputtr':61 'smör':12 'soj':59 'stek':19,38,42 'stekpan':9 'stekyt':37 'striml':2 'tallrik':33 'till':46 'tillbak':51 'tunt':4 'vatt':69 'vitlök':45 'värm':22
8f4f0cd3-b2b8-4e78-8110-15459b651d18	2020-11-17 17:43:49.165456	2023-08-18 07:52:50.043752	Blåbärsgröt	2	portioner	5	5	Koka först blåbär, vatten och socker. Sedan ner med grahamsgrynen och saltet och koka i cirka 5 minuter.\n\nServera gärna med rostade kokosflakes, hackade hasselnötter och en klick honung.	8f4f0cd3-b2b8-4e78-8110-15459b651d18.webp	\N	jonas@stenberg.io	'5':18 'blåbär':4 'blåbärsgröt':1 'cirk':17 'först':3 'grahamsgryn':11 'gärn':21 'hack':25 'hasselnöt':26 'honung':30 'klick':29 'kok':2,15 'kokosflak':24 'minut':19 'ner':9 'rost':23 'saltet':13 'server':20 'sock':7 'vatt':5
\.


--
-- TOC entry 3405 (class 0 OID 17838)
-- Dependencies: 215
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (id, date_added, date_updated, recipe_id, name, measurement, quantity, owner) FROM stdin;
d1c10a2d-a0ac-40ec-b5de-24e4b65a0601	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Lax			postgres
32e53c4a-3797-40ad-a3c4-936a51188c8c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Pepparrotscreme			postgres
277ffb04-9d30-4af2-9906-8566777988e3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Potatis			postgres
b6870fd6-5e40-46eb-9d92-eca68446ea41	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	# Sötpotatisbiffar			postgres
8db97509-2c98-47a6-ad62-115646f5fd61	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	# Tzatziki			postgres
f294cc86-9446-4ebb-b0c9-4c618a2d486d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	# Bönsallad			postgres
7c7fcd0c-01ba-4a15-8597-1b6eedc55681	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	#Till 4-5 personer:			postgres
0704e81c-e646-4716-b084-fd7d33802fdb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	laxfileér eller 500g laxsida		4	postgres
0cdfb281-4037-4219-adb8-dac82b8b16df	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	philadelphiaost eller liknande	pkt	1	postgres
81fb02a6-bfc2-4b8f-b82a-edd2b40ec2ea	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	finriven pepparrot	msk	2.5	postgres
61ea5985-9efd-44d8-816b-84d711556393	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	salt	tsk	1	postgres
c1338719-4ada-4127-9fa6-1ceee8411fe2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	svartpeppar	krm	1	postgres
03b60732-51c2-4222-98ac-44e1a74f0dcd	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	fast potatis	g	500	postgres
11a5f41a-74f5-40e8-a264-2f6a552f4b67	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	olivolja	dl	0.5	postgres
0d92b7e6-a3b7-4482-9712-5e1128cb4f47	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	salt	tsk	1	postgres
340a82c0-2fd0-4c95-9a33-7fa0e2a82f30	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	svartpeppar	krm	1	postgres
b6c3bda1-6a6f-4b36-b4d3-a46e8e18d192	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	sötpotatis	g	700	postgres
bb1e5765-692f-43a3-817b-5941a90c3b59	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	ägg		3	postgres
358eab5c-bf89-4ee4-83a8-af0b45f2797e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	havremjöl	dl	3	postgres
eb52d1a8-18bd-48ac-b6d0-a3e1fd1c4eb3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	salt	tsk	1.5	postgres
9edda102-f9cd-493b-aaed-38cedf2a295c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	peppar	krm	2	postgres
0b9bdb43-c90c-42e1-a913-150b1226535c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	spiskummin	tsk	1.5	postgres
08e81378-802c-46fa-9116-83fa5d091ef3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	starkt paprikapulver	tsk	2	postgres
c5b0eff7-fee5-493d-a183-5a25890f8488	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	rapsolja	msk	2	postgres
8841ea29-a343-4dae-a8cf-26698ab751bb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	gurka		1	postgres
573fa33a-3081-4363-a01e-4e4ed2926c7b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	matyoghurt	dl	2	postgres
7b34166d-4123-454a-b45b-3f14bee02f8a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	salt			postgres
f9d68261-d482-4d7f-b0b9-3f246a8f5a7f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	peppar			postgres
43693931-b9f5-46e4-940c-d99abc6531ce	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	vitlöksklyfta		1	postgres
fff0393b-516b-4844-b98b-c0e361a196e8	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	burkar med bönmix		2	postgres
77084adb-3dfb-4a05-b5ce-91fc2c25ce0a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	körsbärstomater	g	250	postgres
0367dc84-4ba6-44f3-a7a9-d1ce188d7fee	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	påse salladslök (à 125 g)		0.5	postgres
e91440d8-e5b0-4926-8397-3035b4d4ef25	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	citron		0.5	postgres
4ebca37b-c6cc-454d-9c69-ea913ccba794	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49bd57fd-c569-43cf-b69c-0bc1371ce407	rapsolja	msk	1	postgres
5871f4c2-8e88-47b6-8bbd-de3e91b0fe67	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	socker	dl	1.5	postgres
56aba4e3-204b-4b3a-924f-751e0660a571	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	vetemjöl	dl	7	postgres
d41a730f-949e-4891-9f12-0d36f44c04d9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	bakpulver	tsk	3	postgres
ce5d6f05-700e-4718-893b-d9021e0e8e35	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	kardemumma	tsk	1	postgres
65061c58-42d0-40aa-a665-bb9057413a21	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	smör	g	150	postgres
3f9f9942-d9fc-4a9e-8d3e-8cd81d4ac278	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	mjölk	dl	1.5	postgres
1b0f86d4-9e17-4a35-8ee0-480a09eb17b1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	gös eller torsk, eller bara 600 g laxfilé utan skinn (eller lite av varje)	g	800	postgres
05bb6f97-9ad8-46a8-a3ba-e06e1e37e8ca	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	gullökar	st	2	postgres
295d7fd8-092f-4ff5-85ef-e109df7ab844	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	vitlöksklyftor		3	postgres
51cab49c-d54b-4ea2-8650-96bb2b94bcd4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	morötter i slantar		2	postgres
efd0b810-7fa0-4daa-a9e7-c2cb0c4d60df	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	fasta potatisar		5	postgres
4a337c08-ed34-459c-a60a-2dbacfec7be6	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	fänkål		0.5	postgres
1f1bb4d2-e181-4be8-b8fc-b02a31a6169b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	tomater		5	postgres
7361840c-d0d8-4329-b5db-0fadb9773fb4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	olivolja	msk	2	postgres
9109af7a-7d78-40eb-a381-89d8495d927c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	saffran	kuvert	1	postgres
89181ab0-fd95-477a-932f-2685d24cd964	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	torkad timjan	tsk	2	postgres
418ed952-625b-4eae-b838-b9cdc97150a1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	cayennepeppar	kryddmått	1	postgres
65b79ba0-866b-4029-9035-0ff54f866992	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	rosmarin	tsk	1	postgres
6d9d3202-40b4-4e26-b91c-da0b6ca739e4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	salt	tsk	2	postgres
dc967d2c-c140-4b9f-ab92-fe6b6b1cd672	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	svartpeppar efter smak			postgres
a37ea577-7d87-4860-b496-a29afa526e53	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	vatten	liter	1.2	postgres
09b8a4b3-d2c8-444a-808a-357ab9843849	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	torrt vitt vin	dl	2	postgres
b9523ba8-e2f9-4521-aa3b-5ff6e029e22e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	hummerfond	msk	2.5	postgres
7861f9d4-d739-4204-9030-5332f5e7dfb1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	fiskbuljongtärning		1	postgres
43d4eabd-7535-4ac1-ba0b-29f43fb932a2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	creme fraiche till servering	dl	2	postgres
fc5bf143-6c04-4f94-9dcd-1cc6cc48e811	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fc52748c-181d-4c2b-916b-08332cdcb473	bröd			postgres
448d8d00-f121-4682-addd-9761d7d43c2f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	b844bebc-62e6-43d8-92f3-af8033543f16	potatis	kg	1	postgres
bfa08797-b320-4e9a-a85f-3e57b05edf01	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	b844bebc-62e6-43d8-92f3-af8033543f16	morötter		5	postgres
ac1ac0a0-3c47-4b32-8ad7-dd4a3113ece0	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	b844bebc-62e6-43d8-92f3-af8033543f16	kålrot		1	postgres
02cc919b-b912-4f3d-b5df-9b6d06fa720f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	b844bebc-62e6-43d8-92f3-af8033543f16	palsternacka		1	postgres
0914cfa1-e5ab-40d5-81f4-861be6a30d35	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	b844bebc-62e6-43d8-92f3-af8033543f16	Olivolja			postgres
65424d53-ec54-44dd-8f86-3599a6832323	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	b844bebc-62e6-43d8-92f3-af8033543f16	Inlagda rödbetor			postgres
d2dfe922-3499-4e53-8ef2-4e6dd2171bc3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	b844bebc-62e6-43d8-92f3-af8033543f16	Ägg			postgres
5d0b42df-06f6-4acd-9915-90ac83797919	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	b844bebc-62e6-43d8-92f3-af8033543f16	Salt			postgres
2e0e7fb9-a273-449f-a6e8-bd9d7bc55497	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	b844bebc-62e6-43d8-92f3-af8033543f16	Peppar			postgres
70f8d296-27a9-4fb6-a068-cd6cb1fc9b6b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	# Pesto			postgres
f010511c-cc96-4207-9375-2e0050023782	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49d79c70-f086-4339-b5c5-df189a86074f	#Till 4 personer:			postgres
d7f483dd-a36a-46c7-a014-ead9bb729b22	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	#Topping			postgres
e6272baf-31d6-4df2-a38c-a970d6623601	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	#Toppingar, förslag			postgres
7dfb35f7-9f10-4c62-8b5a-0962fe2d5a32	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Pressgurka			postgres
bbd8f4d5-c97f-4337-8601-a57454c27b5e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Rårörda lingon			postgres
cc12ce07-0fba-4414-aaf2-b62e7bc265da	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Grönpepparsås			postgres
e41d2422-b0a2-4ced-90a3-8ee562992492	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	Muskotnöt			postgres
7062a6b0-2bce-4785-899a-bd07fa3ffb41	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Köttbullar			postgres
3c2192fe-75a0-4cc0-988d-6e562a694fda	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	Quinoa till 4 personer			postgres
b3d09136-4a8d-46cf-8eac-53c77dfc679a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	bladspenat	pkt	1	postgres
2cce12e0-27a2-4a2a-87b2-0c454782c52c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	fetaost	pkt	1	postgres
a895de6c-287c-4fa6-a675-d855a0a8b3da	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	basilika	kruka	1	postgres
e57ef913-6aff-4705-89e0-6f4bfa17212a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	solrosfrön, mandel, pinjenötter, valnötter (använd det du har)	dl	1	postgres
6785bca1-6901-4049-95c0-3afd0e2af7e1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	riven parmesan	dl	2	postgres
e4f59045-e065-41a9-b9a1-1d2e83223acd	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	vitlöksklyftor		1.5	postgres
49376c95-f223-4fed-9633-74b413da6427	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	olivolja	dl	2	postgres
e246e79f-2c71-4600-9672-9a7e65bdec4d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	salt och peppar			postgres
d70a886c-822b-4c5f-94d7-75c0bb058f70	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49d79c70-f086-4339-b5c5-df189a86074f	mellanstora tomater		6	postgres
5aee77c2-4471-41c7-8407-bd66355ba79b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49d79c70-f086-4339-b5c5-df189a86074f	salladslökar		3	postgres
489d502d-077d-4727-82f0-2df5321ec447	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49d79c70-f086-4339-b5c5-df189a86074f	lime		0.5	postgres
4e9d9c77-5abc-459f-a8ef-3904c35291f4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49d79c70-f086-4339-b5c5-df189a86074f	chili flakes	tsk	1	postgres
f68a7909-24ac-4318-9ebf-861b8e17f45f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49d79c70-f086-4339-b5c5-df189a86074f	Blad från 1 kruka koriander			postgres
60f5c962-767a-4e3d-bc00-1810532bf6c3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	49d79c70-f086-4339-b5c5-df189a86074f	( mango)		0.5	postgres
495ad67c-b7e8-463b-9a61-ad40c4892959	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	morötter, i stavar	kg	1	postgres
a3065bc4-eeb9-4d8e-a250-619e365866c6	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	vatten	dl	9	postgres
1de65433-77a8-4fd9-9fcd-08ef8d5e1cc1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	syrad grädde	dl	3	postgres
d774ceba-905d-40ac-867c-bd5a62d811ad	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	grönsaksbuljongtärningar		2	postgres
2381ebac-dea5-46ee-92f6-d54a064e90e4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	spiskummin	tsk	1	postgres
e1823714-1aa1-4de1-9478-3a703bd44908	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	curry	tsk	1.5	postgres
8889b6b7-949c-4610-949e-9abb949d4885	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	citron, saft		0.5	postgres
224278c7-2776-42eb-b0b9-18fc15eb60fe	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	rapsolja, till stekning			postgres
97c9de2d-4a5f-4123-9b63-90bab13c97d5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	små yoghurtbollar, alternativt 75 g smulad fetaost		8	postgres
fca1eca3-6d3e-46d5-b7b0-37ee53a7e192	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	granatäpple, kärnor		0.5	postgres
c5efbd6a-56fb-4c5f-8da2-36e512786248	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	litet knippe färsk dill		1	postgres
da9d568a-57a5-4eb0-8edd-9eb8c06f7590	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	salta pistagenötter, grovhackade	dl	1	postgres
b3fef9bf-b01a-4ad6-b919-0b2bd68eb246	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	god valfri olja, att toppa med	tsk	2.5	postgres
c693993f-dfd0-4a9b-8ed3-a8863850bed2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	burkar finkrossade tomater à 400 g		2	postgres
246b6d17-bba1-4809-9ba6-30d0908ab95c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	vitlöksklyftor, finhackade		2	postgres
58266375-496f-4e03-8f6b-6aa94432672a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	grönsaksbuljongtärning		1	postgres
7e55de2b-23ad-4cf7-9832-514eb4eb618d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	soltorkade tomater i olja, finhackade		10	postgres
1082f30d-915b-46d3-8f16-a07c29feab86	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	torkad timjan	tsk	2.5	postgres
acf98676-ae5d-4ae0-9768-4eb9cf8f70ac	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	balsamvinäger	tsk	2	postgres
b388023e-e874-41c4-96b2-8825a5e3794c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	flytande honung eller 1 nypa strösocker	tsk	1	postgres
e67a9616-bd51-471e-8855-8406fcde0a0f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	liten nypa chiliflakes		1	postgres
6095847b-6aea-432d-b588-eea6d53cc7d3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	havregrädde eller crème fraiche	dl	2.5	postgres
cc66b689-b268-43ce-bd4f-18282e2e8ee4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	vatten, till spädning	dl	2.5	postgres
a631766c-4c82-4349-aa78-bd533854d276	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	salt och svartpeppar			postgres
9b577bce-23c0-4a63-a146-9d650c4474b3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	matvete, kokt	dl	2	postgres
10702591-4f8c-469d-af18-b8688b3cbd0d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	rostade solroskärnor	msk	1	postgres
d4983466-3662-406f-aaab-d903685b8f3a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	krutonger			postgres
69adb787-3c40-4d40-9d24-79fe2d1335f8	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	svarta och/eller vita sesamfrön			postgres
2d3cbbd6-4815-48c3-bde2-0c6fb194e1d6	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	smulad fetaost			postgres
d85068e7-2881-4133-b0a2-f31997ce9d98	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	a27b18c2-7351-4818-bb33-c1387e76e307	extra chiliflakes			postgres
bc4202ea-daf4-495d-98ab-cf3438cb7fc0	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	gurka		1	postgres
fc4a291b-0e35-434a-b664-88935e98699a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	ättika	msk	2	postgres
25200228-fe2b-4f90-b0cd-10d3c0366ead	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	socker	msk	2	postgres
42a43875-50f0-48ba-809c-da9b41e6962a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	hackad persilja	msk	2	postgres
946bd360-466e-439f-b3a9-4352168c1a00	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	lingon	g	250	postgres
d38fb000-c2c7-4a2a-9ea7-b8232c81bd44	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	socker	dl	1	postgres
0a79ea4b-7ecc-4092-854f-fb3f235f0878	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	vispgrädde	dl	3	postgres
fd6c083a-0952-4288-a0e9-672f6e590e8c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	skogschampinjoner		10	postgres
ca24483e-d81f-4a90-b473-abf22402db2f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	grönpepparkorn (minst)		20	postgres
3c7f04ae-2457-4bc2-a5c7-051bd2a3ee4d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	kinesisk soja	tsk	1.5	postgres
e7e171b1-5593-44ce-b1e8-35bb0df40290	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	formbar färs från Anamma	g	500	postgres
e03a5da0-93bb-414d-ab67-7b1d28391324	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	mjölk	dl	1.5	postgres
d4aaee4b-5bdd-480e-8ff5-9aef360c3702	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	ströbröd	dl	1	postgres
de280c25-5a26-42ee-a5e2-2af3e117bb9d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	gullök		1	postgres
9e54388b-c6f9-4c6a-8b2e-3348a4de3339	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	ägg		1	postgres
f15cb09b-8d45-4f16-88c1-5554950e2f3c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	svartpeppar			postgres
4a2247be-d38c-4f17-bd78-6f80bff4fa10	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	# Tillbehör			postgres
7d77768e-9b6d-464d-822e-b3e7cbf3bd1d	2023-08-09 18:06:48.469823	2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	riven parmesan	dl	2	jonas@stenberg.io
c497508c-e719-4c7a-9299-50267b23d203	2023-08-09 18:06:48.469823	2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	dl olivolja	dl	1.5	jonas@stenberg.io
9ba80f76-7100-4e66-948a-fa5e7c301034	2023-08-09 18:06:48.469823	2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	vitlöksklyftor		1	jonas@stenberg.io
bc392cef-2f3c-476b-92af-d7df1061a632	2023-08-09 18:06:48.469823	2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	solroskärnor, mandlar, pinjenötter eller valnötter	dl	1	jonas@stenberg.io
8ecee1b8-c692-47ad-9064-1acf7aa2b0cb	2023-08-09 18:06:48.469823	2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	honung	tsk	0.5	jonas@stenberg.io
9009e0ab-764e-4890-9008-e016719e05cf	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd36e4c5-da23-408b-8f45-2b6a349ebddc	Potatis			postgres
09fcc20b-df34-4db9-8085-eaab194f1d23	2023-08-09 18:06:48.469823	2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	Grönkål			jonas@stenberg.io
5b48891a-d9a1-4d1c-93bc-35edca58309b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	linfrön	dl	2.5	postgres
044055f9-4202-459d-92ae-091eafaee0da	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	sesamfrön	dl	0.5	postgres
38c3bac9-aeab-4e44-baac-049af6137b72	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	pumpafrön	dl	1	postgres
600c051d-c8b4-4610-b2ad-ba8d0d073bef	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	solrosfrön	dl	1	postgres
ea52dc8a-27d2-4b91-a94c-9b5adc75fe41	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	# Såsen			postgres
4498d12a-053e-4f8d-864d-93a804729f62	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	vatten	dl	3.5	postgres
f20a7f38-587d-48ba-839b-67522316be83	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	havssalt	msk	1	postgres
2aac94c3-7dae-472d-b46c-30e864ca7626	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d08968af-bbdc-4102-8dfe-650cb9d30e83	medelstora potatisar	st	8	postgres
77ed54bd-722f-4239-ad81-c298cef10856	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d08968af-bbdc-4102-8dfe-650cb9d30e83	smör	msk	2	postgres
d809c53b-b477-4e36-b2c2-b96b43220779	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d08968af-bbdc-4102-8dfe-650cb9d30e83	vetemjöl	msk	1	postgres
521308e1-81e3-49cc-ba35-a47e0dc0b7bc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d08968af-bbdc-4102-8dfe-650cb9d30e83	grädde	dl	1	postgres
cd49f200-74b9-4f20-aa62-eb8f4ce12784	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d08968af-bbdc-4102-8dfe-650cb9d30e83	mjölk	dl	2	postgres
e1f50002-2215-4135-a038-17dec0e386a8	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d08968af-bbdc-4102-8dfe-650cb9d30e83	finhackad dill	dl	1	postgres
d16c3458-2fe6-4b84-bf21-c6a1faa26651	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d08968af-bbdc-4102-8dfe-650cb9d30e83	muskotnöt			postgres
4d4a15c5-591d-4ae2-86fc-4eee1ccfd692	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d08968af-bbdc-4102-8dfe-650cb9d30e83	Salt och peppar			postgres
d846f64a-ea0e-4ef4-bc83-1c99514498d9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	rabarber	kg	1	postgres
a4aa84a3-ae0d-4094-b28b-278eb42c4be7	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	citron(er)	st	1	postgres
472aaa59-06c5-4f3e-9d8e-1ca59b849fd8	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	apelsin(er)	st	1	postgres
17b3cd42-aeaa-4d97-a189-0bcfac8bdd72	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	socker, (ca 11 dl)	kg	1	postgres
8c5a3833-a08d-42f8-8f4c-826bf61deb6f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	ingefära, mald	msk	1	postgres
9e868c69-7207-48b9-a145-1462063ff903	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	helt bovete (snabbt blötlagt)	dl	2	postgres
3c625565-95a1-4251-beab-c5ab00ca87fc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	pumpakärnor	dl	1	postgres
3c479e65-e4f1-4ea8-b9e0-ccda0d7cc7c1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	hela linfrön	dl	0.5	postgres
e3cbc35f-5180-4e10-9b47-4326473f8385	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	solrosfrön	dl	1	postgres
b41c2b79-ada0-440f-bfcc-648c4a128a93	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	chiafrön	dl	1	postgres
c2864369-aaa1-461b-a602-548b81e5f3ae	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	hackade mandlar	dl	1	postgres
110863e4-7335-4461-ba30-a9b24dd057eb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	hackade valfria nötter	dl	1	postgres
400a6cf8-a270-4f6d-8298-09752d8bcbed	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	kanel	tsk	2	postgres
16e7e669-193c-481d-97cf-7f16ab1742d8	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	kardemumma	tsk	2	postgres
31076832-62df-428e-8c13-4f3339723367	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	honung	msk	2	postgres
0eb11e8a-eb56-4120-843e-ab4c7df9e434	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	kokosolja	msk	3	postgres
a41dfde6-afcd-41fb-abca-518f373def78	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dbecf460-5460-40c4-89a4-d7d704148456	smör	g	100	postgres
8897572b-b98e-45e6-957b-d605631c59f4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dbecf460-5460-40c4-89a4-d7d704148456	socker	g	100	postgres
0a707d72-3322-47a8-a164-88af03b0c2ce	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dbecf460-5460-40c4-89a4-d7d704148456	sirap	msk	1	postgres
95870fde-bda8-454d-abce-c008384f11c5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dbecf460-5460-40c4-89a4-d7d704148456	grädde	dl	0.5	postgres
6f134792-584d-4e5d-8f91-5e9beb6a2e1c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dbecf460-5460-40c4-89a4-d7d704148456	kanel	tsk	1	postgres
d7227e07-5e1a-4807-88dc-789ee2d54e0c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dbecf460-5460-40c4-89a4-d7d704148456	nejlikor			postgres
b24b837a-a9e5-421b-b5ca-affb28899df1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dbecf460-5460-40c4-89a4-d7d704148456	ingefära			postgres
0f3a6595-1817-4de1-8010-8c033b190945	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dbecf460-5460-40c4-89a4-d7d704148456	bikarbonat			postgres
d197cd37-5b09-4802-9779-ea5cae214688	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dbecf460-5460-40c4-89a4-d7d704148456	vetemjöl (ska också användas till utbakningen)	g	250	postgres
baa3c315-6871-42ad-b233-23b4bd119a33	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	Nötfransyska			postgres
919cb662-33d3-43eb-8dde-ac7a1c37c843	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	små lökar		2	postgres
bac8aae8-9c4b-464f-9eaf-de4945cd829c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	lagerblad		1.5	postgres
b040a6d6-5074-4eef-a7bf-6881faf2eba1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	kryddpepparkorn		6.5	postgres
ff9f0f11-5646-4fcf-86f2-05562cc9cd3a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	vitpepparkorn		8	postgres
fbce5991-99dd-4d4c-aaf9-45860cd21052	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	anjovisfiléer		4	postgres
92ec4cf9-fe76-445b-89c5-58da4ae915e1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	,5 msk sirap		1	postgres
67e35891-98cd-4ad1-9720-e1409bef5f1c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	ättika	msk	1	postgres
ce58b611-3d98-46ba-9f86-9b4297d116be	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	vatten	dl	1	postgres
7d770a11-ebb4-4951-8385-b1c6ddd0fd01	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	Salt och peppar			postgres
20a7100d-bd67-47cd-a300-634e571cd57b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	57be7a15-9cc3-437c-a189-21b0c11b203b	vispgrädde	dl	2	postgres
2141669a-94a7-4d28-8e24-9eea19ab2022	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	kokt potatis	g	600	postgres
4db7b9ef-477c-4de2-962f-3ff44faba7b4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	hårdkokta ägg		3	postgres
a2d2da3a-0ad6-4ea8-ae3c-64ead96bcd9a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	torskrygg	g	500	postgres
5707ef74-b161-4f8c-a73b-07250a8ed31d	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	ml kokosmjölk		400	jonas@stenberg.io
eae145ea-84ad-42a9-a290-1ebbd266c98f	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	kikärtor	g	400	jonas@stenberg.io
bd36cf7b-7dab-4338-91cb-97f2fcd2a219	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	basilika ca 10 g färska blad	kruka	1	jonas@stenberg.io
3f0dd22a-5685-4438-8899-b2e4d18bb682	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	vitlöksklyftor		2	jonas@stenberg.io
a1fb9cf5-dae5-400d-8203-71791aaa42df	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	gullök		1	jonas@stenberg.io
31a82433-6580-4b88-95b8-867ffba526c9	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	röd currypasta	msk	2	jonas@stenberg.io
6a76ecdb-3112-4fc9-aac5-bfb0b5287d59	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	curry	msk	0.5	jonas@stenberg.io
4d4af4e6-ba9e-475a-9c8f-f86297abb5e8	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	cocktailtomater	g	200	jonas@stenberg.io
7cdf1f48-0775-43f9-825d-baea41ccdedc	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	Saften från  lime		0.25	jonas@stenberg.io
45eb5fa1-25ab-4a0a-bf3a-8702e7b69d0e	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	Salt			jonas@stenberg.io
bfb397f0-b6a8-4848-ac0b-1ea377440f3a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	# Hummus			postgres
e512c22d-4912-4889-93dd-a7617ee8a340	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	# Tabbouleh			postgres
5347890b-b177-498d-b67b-65c9c914c284	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	# ca 8 port			postgres
bee7f868-eff0-42da-854c-225336162b64	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	# Senapssås			postgres
df7c0576-52c1-45c6-ad63-ea90b0e7b2cb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	#Minihallonmaränger			postgres
0370bf20-5886-4c0e-9256-56b4ba6a4ddf	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	#Tillbehör			postgres
cab46a9a-e5f7-461f-aa0e-9e9d944634d4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	#Vit chokladmousse			postgres
e2b41e42-ef53-4a87-8128-7f778bd07325	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	# Potatispuré			postgres
07ebd2fd-8f8e-4172-8308-ecf502aae7a5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	gullök		0.5	postgres
e59b5024-03fb-4466-aea8-4d18d05256c9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	mjöl	msk	1	postgres
1ef5d5a4-39ae-4286-b8f0-e103341d156c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	vispgrädde	dl	2	postgres
91daecbc-b36b-413e-817b-592009f48c6b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	mjölk	dl	2	postgres
1c7bff9c-2bfa-45c4-99f7-19a692498aa3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	Finriven pepparrot			postgres
cdccb0ec-4df8-4b5b-a42f-69017e6021d4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	dijonsenap	tsk	1.5	postgres
aa91d79d-7ced-4e89-951d-be93893d4cf0	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	hackad persilja	dl	0.5	postgres
9c36bcfa-5dd9-4c87-b61e-d439adb6362c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	Salt och peppar			postgres
37db53c9-e44c-494d-bf8f-5dbc93c83c3c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	Halloumi			postgres
167c28b6-c28d-4acf-aa0e-5b6a15867c12	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	vitlöksklyfta		1	postgres
b39a7c0a-78b8-40cc-8a0b-79921812ce5f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	burk kikärter		1	postgres
17e67dd9-e62d-4d34-81a7-9f851b4922c0	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	chilifrukt		1	postgres
1586b395-bb67-4ece-9af1-a00fbcbbe17e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	spiskummin	tsk	1	postgres
db9ade6f-5862-4878-ba24-9cdda3fd5236	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	olivolja	msk	3	postgres
3ddaeda6-4b9e-4893-b990-7630d0811a64	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	tahini (sesampaste)	msk	2	postgres
e632f201-c5ce-4698-a7c8-91f05921d556	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	salt och peppar			postgres
63f2544e-daf1-4c9c-9d14-594730051ba9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	bulgur	dl	1	postgres
a2ddb20d-3dec-4df2-b74f-3756fc8296fd	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	hackad persilja	dl	2	postgres
c8ee1382-0ee6-471d-89a8-51e6c4d4f21a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	gul lök		1	postgres
31b61476-925f-4384-a97d-5a7c2aa2babc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	tomater		3	postgres
282e09b2-24b9-48c0-8fb0-fe8ad92e20e0	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	färskpressad citronjuice	msk	2	postgres
eea925db-20db-4159-8444-8ce8b9ed1832	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	olivolja	dl	1	postgres
89e8fb7a-6c0d-41c7-b990-e85aac84e031	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	salt	tsk	1	postgres
3f2c2ecd-b626-48f7-bf56-8887c29cfda2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	peppar	krm	2	postgres
a2ba0603-8f8c-448a-a64a-ae27b585e19c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	strömmingsfilé	kg	0.5	postgres
f25259ac-4d98-421f-8d5e-23e39bc86159	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	vatten	dl	5	postgres
e9152b7b-42fb-4070-8f36-2591463efaaa	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	ättiksprit	dl	1	postgres
e15870dc-3292-4d92-8c04-4151806a1246	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	salt	msk	1.5	postgres
41f8832b-29e5-4a41-9d1f-911b5c510b4d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	socker	msk	4	postgres
b2d7b1dd-24bd-455e-ac57-2b760a9493fe	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	gräddfil	dl	3	postgres
bad2dad9-3bd2-4273-981a-1186447e19ec	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	svensk senap	dl	1.5	postgres
b9f44e15-da93-4305-9330-3fa7efba890e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	salt	tsk	0.5	postgres
1e2365c3-efb2-43e8-869c-2e7dbadd80f5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	vitpeppar	krm	1	postgres
4c6d6be6-fe86-4844-9fae-c7523389e5e9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	39223e98-f9b2-4217-957c-58a43ab3cbe7	finhackad dill	dl	1	postgres
a2df3fbe-ce9b-4531-97e4-69f3ec6a6453	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	gram äggvita(or)		30	postgres
f0d48f37-42ff-4335-b677-cab0003644ee	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	citronsaft, 3 - 4 droppar, pressad	st	4	postgres
ad8d77bc-b6b8-40ff-9515-544813131379	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	strösocker	msk	2	postgres
9b4f011c-1717-4ee8-92d1-1b2e85b3f46f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	florsocker	msk	3.5	postgres
3ba355da-0d33-40ec-91ca-56dab42088b3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	chokladcookies, att strö över	st	2	postgres
ecf4ddd1-1da4-4634-8345-d053c160b74f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	hallon, färska, att garnera med	dl	1	postgres
dbaef254-7ffe-40d0-9bc1-c08ed25dc504	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	lakritsgranulat, ev. lite att strö över		1	postgres
d9b9098c-a1c4-48f0-86ef-b19233aa52a2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	gram vit choklad		100	postgres
b556d526-c3db-4f2e-a2d2-4beda999c07a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	vispgrädde	dl	2.5	postgres
7bb204c4-0416-45e5-8a31-2a9652ac350e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	lakritsgranulat, eller 2 tsk lakritspulver	tsk	2	postgres
8029e60c-7ca4-423c-aa53-b9be9c6f45ac	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	laxfilé utan skinn	g	250	postgres
755018cb-d432-4616-9f37-09b957523cad	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	torskfilé eller annan	g	250	postgres
1503d1ad-473d-47e2-8250-11599537e253	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	vit fisk utan skinn			postgres
e9544110-76fc-4c27-af76-5706bb845a76	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	vitpeppar	krm	1	postgres
426c98e7-4118-4391-8c63-73e047d709f7	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	dI vispgrädde		4	postgres
5a01bd84-7f76-4e09-ade4-cd8ff180def3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	ströbröd eller panko	dl	2	postgres
173eea21-3561-467e-aa25-b95e30ace0bc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	rapsolja, smör			postgres
67f68338-9919-4cdf-835a-7b5d69ddaa79	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	salt			postgres
769d54f8-2e5a-40f3-aafc-7e3a90a2ddc8	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	rärörda lingon, kokta			postgres
347a60be-3320-44e9-9ce6-e54e53eff752	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	gröna ärtor och citron.			postgres
d176e439-c813-456c-8bab-f88c1e22cd20	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	klyftor till servering			postgres
e38de14d-c596-446c-bc8a-d57adf165f4d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	mjölig potatis	g	900	postgres
b606aab3-3183-4077-9f8e-a79b69e314ca	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	mjölk	dl	1.5	postgres
ec46b1cb-f0f3-48cb-bec9-bffa124fcb4e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	vispgrädde	dl	1.5	postgres
a26aebeb-def3-470a-a5f0-cfc75c8b3a00	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	smör	msk	3	postgres
e4cd7899-c7e2-42b4-830d-998110599fe7	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	cm riven ingefära		2	postgres
244371a0-4435-434f-b5de-39f2e33ad8a1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	stor morot	st	1	postgres
fcb44312-99b0-43d8-9d59-c6cc76634a23	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	gul lök	st	1	postgres
5dbd7584-2544-43b1-884c-b59a1af706d9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	# Tortillachips			postgres
ea90c729-b0ce-40cb-8e72-b042b1b755df	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	# Till servering			postgres
83767541-5151-4363-a3ef-6bf60d3d0b7d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	# 6 portioner			postgres
9d6295fa-deb1-4639-858d-1f20580a8430	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	# Fyllning			postgres
8fc421f6-873f-42b2-8464-f19c18b1377c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	# Smet			postgres
d2e4a9b7-ff97-41b5-88a2-6922ec680c7f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	# Till servering			postgres
8385183b-3529-48c1-8a73-47a8d57edf9c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	# Brynt smör			postgres
7659b7ee-4b7e-49e0-ac3d-7b3c8aaa35be	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	# Potatispuré			postgres
4064f48d-8fa5-4ba4-a437-ec6110f4da9d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	stor sötpotatis		1	postgres
dda356e6-f551-4a21-8952-6af020f7a971	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	ml kokosmjölk		400	postgres
8d31c85b-0f00-4f72-9137-e34d48c3ef04	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	spenat	pkt	1	postgres
89c0aca5-3839-4b2d-a93f-cdaba9e06f60	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	röda linser	dl	1	postgres
d655dcf7-c563-4e88-80cd-7e79ebcf7c60	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	belugalinser	dl	1	postgres
d8687f98-97a8-4420-ab90-98cc81b7a584	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	citron	st	0.25	postgres
61afe38c-4c80-435b-bc37-a4a3a7f7b7c0	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	garam masala	tsk	2	postgres
8ee002e4-2e1b-43d9-b0c9-cc9dd4236920	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	curry	tsk	2	postgres
c3aca8a8-1f09-4674-b7f9-f4a54b6135dd	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	grönsaksbuljongpulver	msk	1	postgres
094fbd46-3c98-460d-823d-93f3966566cc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Olivolja			postgres
766cc011-6009-455a-a2f2-a595b8376782	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Tortillabröd			postgres
5c86cdb7-5ee1-40b3-9908-37aadf3f917d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Olivolja			postgres
c1f078c1-053e-4984-8119-ff428a5ca49d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Koriander			postgres
7a1d0e99-5eda-45ef-89dd-ec561d6e7163	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	Yoghurt			postgres
457ec09c-3272-4215-9901-0ddbc970102a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	vispgrädde	dl	5	postgres
b7b3dd15-f735-4b88-bf51-f820c2bcf368	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	strösocker	dl	1.5	postgres
cd792ec8-48f9-4614-b7da-5a6c56b86e3c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	gula lökar		2	postgres
55af7c25-a58d-449d-9125-d2ed4860ab9e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	vitlöksklyftor		2	postgres
8a1b1ca1-c679-4804-b721-37179d55e959	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	socker	msk	2	postgres
4784ee27-16e1-4003-bfa9-9256dee5789b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	paprikapulver	tsk	1	postgres
efe99337-6670-4746-91b6-b3a1449b9691	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	grön paprika		1	postgres
6ce176b9-d8f0-4bd8-8f6d-a0826e33d219	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	vatten	liter	1	postgres
5dbf1feb-09db-40e0-b79e-996bdad933b1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	burk tomater		1	postgres
dbb83d98-5eb6-49cd-aea8-69f45fae269d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	buljongtärningar		2	postgres
a4817035-5d7a-498a-8e7e-0c57c7654aba	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	timjan	msk	0.5	postgres
c84882b9-fd7b-4ae0-9efe-e8b7e93eb247	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	6675697a-c45c-495c-af13-2180ae68113a	kokta vita bönor	dl	5.5	postgres
ff839c11-ed28-4c8f-99b7-b15ce91fb5d5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	gr rabarber		450	postgres
eb53c6da-b9d2-4f96-b065-e0656fb74d35	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	socker	dl	0.5	postgres
89ebd127-bc92-4f80-bb43-2b8495662a38	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	potatismjöl	msk	0.5	postgres
6ff928da-eee1-4243-a4ae-0a304f2072bb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	gr smör		200	postgres
a4ccf37f-892a-4630-ae5d-c71e4da0f00e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	grädde	dl	0.75	postgres
972a61aa-7057-40d1-a578-2a88c387da61	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	ljus sirap	dl	0.75	postgres
40e886ed-aa02-42e0-b3af-f200a28f7863	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	socker	dl	2	postgres
5add95c0-b5e4-41a7-8ade-c07fbfa03843	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	havregryn	dl	4	postgres
300bb76e-3cad-42e6-8e7d-96244f793e0a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	vetemjöl	dl	2	postgres
5549783c-4f72-453a-9a9b-344182f5d5da	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	bakpulver	tsk	0.5	postgres
eb207212-bf55-468d-903d-c681cdc26f6b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1312646e-45e1-407b-a46e-ed3b60bc1405	salt	tsk	0.5	postgres
113e0f0b-14c0-426e-b1a1-01f37ff354fa	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	12905e60-8310-45f0-8507-ad5334662b3a	smör	g	150	postgres
9ebe260e-1fa9-40a1-86be-f93e67915a95	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	12905e60-8310-45f0-8507-ad5334662b3a	socker	dl	1	postgres
dae8403e-957c-4107-957e-366f9c25707c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	12905e60-8310-45f0-8507-ad5334662b3a	bittermandlar		2	postgres
6752bfa8-a979-4453-b844-55c3c1d6ad19	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	12905e60-8310-45f0-8507-ad5334662b3a	skorpmjöl	dl	2	postgres
9afd97ce-b702-4d17-9a71-8b88a0fa1fe0	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	12905e60-8310-45f0-8507-ad5334662b3a	vetemjöl	msk	1	postgres
158fca0f-ca8f-4b2c-b546-648e5d208184	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	12905e60-8310-45f0-8507-ad5334662b3a	äpplen		7	postgres
188bab59-5356-41b8-9ead-2514de805a25	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	0789d29d-8a27-496d-a4d1-c662200a6281	smör	g	150	postgres
0f1043b7-98f8-408e-a28e-5bdab8a28e4c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	0789d29d-8a27-496d-a4d1-c662200a6281	vetemjöl	dl	3	postgres
b1505fd9-96fe-42dd-a670-4644f2803c49	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	0789d29d-8a27-496d-a4d1-c662200a6281	socker	dl	1	postgres
c772e9dc-7dc3-4517-b944-ac56ff0e9f7c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	0789d29d-8a27-496d-a4d1-c662200a6281	drygt 0,5 tsk bakpulver			postgres
5389e4a9-3dd6-4bbb-bcb4-bd2780ec545b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	0789d29d-8a27-496d-a4d1-c662200a6281	ägg		1	postgres
60816161-ba4c-4d1f-9429-f4a727ba1996	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	lövbiff	g	500	postgres
e4668e27-4bcf-4239-a473-fb3a77b68c88	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	smör, till stekning	msk	2	postgres
f5d1307e-dfc8-4379-9365-b63ac77eb386	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	salt	tsk	1	postgres
b0f541e4-dd06-49a8-a010-4fea85396856	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	svartpeppar	tsk	0.5	postgres
4231d53c-a9d8-4220-ab2f-cf4401ce90f3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	gul lök, hackad		1	postgres
cf8bf713-c829-4eff-b2a2-b2c79e6a4e97	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	vitlöksklyfta, finriven		1	postgres
5c74bf5c-352d-4292-b08e-c1db4ad31aae	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	grädde	dl	3	postgres
3366c735-cdf9-405e-a78f-972029bf4057	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	dijonsenap	msk	2	postgres
5355c9c0-ced1-4c28-ac04-59294cce25b7	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	japansk soja	msk	1	postgres
a5fd7bfd-98ee-46c2-96a5-3f8b9efec938	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Sockerärtor eller haricots verts			postgres
6ed025f4-96d2-4bae-9604-c4e22fb1139d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	Ris eller potatis			postgres
bad078b7-d293-427f-8523-6de117a1bf85	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	sej-, kolja- eller torskfilé	g	600	postgres
acf49d96-b08f-4325-aefe-1dafcbd06f8f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	salt	msk	0.5	postgres
509921cc-079c-452a-81ff-b1ac3c37ebbf	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	smör	msk	2	postgres
fce1f9ed-f1fc-4076-bf39-8671d3b0022b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	smör	g	100	postgres
ece5995e-6db1-431a-81d7-fd2b80bfcac1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	mjölig potatis	g	400	postgres
b2b1704b-0897-4d64-bcd7-ceac90b80d2b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	mjölk	dl	2	postgres
34b39e1c-e2de-4df6-8af8-ea4c19611d8e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	smör	g	50	postgres
d56a9115-d2cc-4099-874d-71760c24bcf4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	# Äppelsallad			postgres
a64534d1-da10-46c3-b507-1d7a26fd4cd9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	# Till servering			postgres
11d2cecc-3d01-4fa7-aeda-11c0300c9d22	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	# För 4 personer			postgres
e6f5d592-b48c-454b-a537-4803d7c249ff	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	# Lag av			postgres
132939a1-97f1-47be-92cc-65cf387da115	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	# Till garnering			postgres
1d9ccbb8-a960-479c-8c3f-b91faa6baec9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	gulbetor, skalade, tärnade och lätt kokta	g	400	postgres
ecfe3d2c-6b08-4a7f-9f73-68f8ce47bf4e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	äpplen, tärnade		2	postgres
1d1ed904-0587-44e2-887d-f048aeb789bd	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	citron, finrivet zest och saft		1	postgres
cfcbbc1e-a002-420c-9325-bee0e890c907	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	hackad persilja	dl	1	postgres
1aa9da13-13dc-4a78-95c4-1adef187f312	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	ruccola	g	35	postgres
54c5c208-fd46-483f-8191-986addf4030b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	kapris	msk	4	postgres
9457eb43-1570-470c-9973-13f0eee3caed	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	olivolja	msk	1	postgres
d25b2c8a-b836-4261-a4e7-160ed618412f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	salt och peppar			postgres
0659dd0f-8922-4314-acbf-6abb37cb63cc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	Krasse			postgres
c9be4706-ab65-47cd-8ded-0114e538ed70	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9b6996db-e837-44a4-bd55-46f9ed31f515	Finriven pepparrot			postgres
84834a7c-7659-4608-94df-bd08e59d88a5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	stora filéer saltsill (ca 400g)		4	postgres
e026e065-92fb-4377-bc44-e611d3551b8a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	gula lökar		2	postgres
5d01e103-1d33-4863-8e81-98e0bb47ad96	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	kryddpepparkorn	msk	1	postgres
47ca608e-ce72-4f2a-9a92-c3ffedc12744	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	lagerblad		1.5	postgres
c5e920be-6327-4721-bb3f-d57b8137f268	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	purjolök		0.5	postgres
75f0f6b7-1081-4b8c-894a-0bebeb82a656	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	skalad morot i bitar		1	postgres
0ad4756b-edbd-4f70-8d7a-113afabc1468	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	rödlök till garnering			postgres
1bdd010d-7c13-477c-882e-d968a9b7d2a4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	ättiksprit	dl	1	postgres
540ba7ea-4f68-44bf-9d48-e3a796fa56bc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	vatten	dl	2	postgres
bf68b439-17d1-4c2f-8cb6-db87d708af22	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	socker	dl	1.5	postgres
2fac4dcf-ea09-46f9-ad84-8fc7f0834e87	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	076be509-1a06-41b5-946a-31693a6a8079	Vatten			postgres
a604391d-f29e-4e63-8d57-387a2df2656b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	076be509-1a06-41b5-946a-31693a6a8079	Fiskkrydda			postgres
e8cbe797-3a8d-4c34-9abf-3ecf3b596b06	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	076be509-1a06-41b5-946a-31693a6a8079	Kryddpepparkorn			postgres
dbb51e16-e8f7-4c26-a368-d5dd77e2f22a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	076be509-1a06-41b5-946a-31693a6a8079	Salt			postgres
0ebfe974-6b14-480c-988a-9d8d8c4134d2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	076be509-1a06-41b5-946a-31693a6a8079	Torskrygg			postgres
9f0fb7be-fe1d-413b-a9ae-72c83f62e205	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	076be509-1a06-41b5-946a-31693a6a8079	Citron			postgres
ccf475bb-a63d-4d54-8b91-b77637ab4509	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	076be509-1a06-41b5-946a-31693a6a8079	Dragon			postgres
2abf17af-f5a7-4fa2-a8ed-1a21ffb43bb8	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	076be509-1a06-41b5-946a-31693a6a8079	Vispgrädde			postgres
868b643f-9ee4-4367-b6cd-86e7b430dd2e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	askar matjesill		2	postgres
2148427b-dc3d-46fd-aaa1-de9cedb7fbcc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	tub (150g) majonäs		1	postgres
63072ab0-e28e-433c-a946-fa13db4527b4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	vispgrädde	dl	0.75	postgres
fe64d4e7-0473-42e2-b27c-6b72430c4c6f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	gräddfil	dl	1	postgres
2c650b32-1589-41c9-8809-40d77d13f00c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	tomatpure			postgres
00b275e5-83da-4a14-9e6b-d23ac5042034	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	hårdkokta ägg		4	postgres
646f186b-748c-4181-8c42-3692dd6d5c24	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	klippt dill	dl	1.5	postgres
83cd6833-3d0e-4254-b9a6-39395448d4f4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	hårdkokt ägg		1	postgres
dd6c89ff-e1f0-4505-8551-54c6e0e41f5f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	83726276-170e-44ac-82bd-34d0087cee43	dillkvistar			postgres
f9f7da2b-700d-4c93-aed9-934b8db3d586	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	05bb7c8d-c879-41cb-aad0-44ce505db2ae	kardemummakärnor	tsk	1	postgres
5c75c413-5426-473d-83c8-80fa6ab6470d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	05bb7c8d-c879-41cb-aad0-44ce505db2ae	hel svartpeppar	tsk	1	postgres
f29076a0-f608-4b80-a89d-c93e934484fb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	05bb7c8d-c879-41cb-aad0-44ce505db2ae	malen gurkmeja	msk	2	postgres
77d0e717-3fa3-4239-a612-233662f7babc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	05bb7c8d-c879-41cb-aad0-44ce505db2ae	malen kanel	tsk	2	postgres
936a87c1-fcc8-450f-b99c-5c978eebe223	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	05bb7c8d-c879-41cb-aad0-44ce505db2ae	riven ingefäraa	msk	2	postgres
224e6784-1efe-4f59-b856-515019c531c9	2023-08-10 00:30:07.041849	2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	Ris			jonas@stenberg.io
1737a27d-0340-42c4-bda3-e984a8ba67ef	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	# Till servering			postgres
eb1bbb0d-96fe-4820-ba84-521b2b9608c6	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Laxen:			postgres
5999a736-aeed-4292-b56d-049a842bd92b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Paprikasås:			postgres
a595b5dd-a369-40d2-ba37-110c20c25c19	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Mango salsa:			postgres
6ecb5380-d56f-434f-a27f-c021e6c98b35	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Picklad rödlök:			postgres
81a68678-1a87-4af7-a107-3a8886c9be86	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	# Grönt:			postgres
c4b10524-d359-49e5-9931-4022e552bcbe	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	# Sås			postgres
1e83c836-9b16-4bd6-ae92-09b71e9c7237	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	# Potatis			postgres
915465d7-de9c-4097-9e1a-b52b68cbf41d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	# Lammsteken			postgres
16cd22fa-23e2-4a32-8665-e08770b48806	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	05bb7c8d-c879-41cb-aad0-44ce505db2ae	havremjölk	dl	8	postgres
77336792-2ac5-4f13-a3a9-53ecdf9951bc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	gul lök		1	postgres
4979c6c5-26b1-433c-a2ba-ec4429333d5b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	morötter		2	postgres
6d8291b6-2493-4ec8-960d-427752152582	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	halloumi (2 paket)	g	400	postgres
d1f3aa49-c2a4-4c8b-ace6-546cd09f522f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	olivolja till stekningen			postgres
dcf7288f-dfe1-4861-bb63-69bdd693f5c9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	paprikapulver	msk	2	postgres
a133b226-6549-4104-b052-c77989494453	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	tomatpuré	dl	1	postgres
bbbebe7f-c653-4753-a106-f8877b2ab19c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	dijonsenap	tsk	2	postgres
0fdec946-f9d2-4674-8398-b236354b08fd	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	tärning grönsaksbuljong		1	postgres
359d8e2f-94e6-43c4-bf94-92c6cfeb6d36	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	di vatten		3.5	postgres
5f771912-d0bf-4373-b3c0-3671a8fb5228	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	grädde	dl	2.5	postgres
b07fe36b-973a-4939-8f55-aa0a457725f5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	salt och peppar			postgres
dbd1208f-db6e-4212-96e7-66d23a1ab981	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	Nykokt ris			postgres
5b3cbf2c-46d2-48d7-bfa9-7ae70131dc75	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	Rucola			postgres
39d95495-fa5e-4e41-a728-c23ace3d5c66	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	Hasselnötter			postgres
12de06ec-bd67-40aa-bf1d-e4bad87aafea	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	647d6e35-8369-4e00-8146-7d0587c28478	Ev aioli			postgres
9aa63994-1e29-45c0-8e62-41af2b8d5d25	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	lax	g	350	postgres
0e7c2712-4a5e-45e6-afad-6e05eab8304c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	chiliflakes	tsk	2	postgres
72e6cc48-542e-4d06-bbb2-45c1dfe1178c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	paprikapulver	tsk	2	postgres
e2a75c98-8aa9-4ab7-ac34-6089c280c6be	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	torkad koriander	tsk	2	postgres
c1cfcdc4-4b5a-40fa-83d3-a9e8d7f01c73	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	farinsocker	tsk	2	postgres
a109341b-39f3-496e-b60f-7556433bd00c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	salt	tsk	1	postgres
c2664466-f408-4ea4-8495-7b500e563a73	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	grillade paprikor på burk	st	2	postgres
e3426617-bd42-4b84-b13f-8bf78f2b7616	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	majonäs	dl	1	postgres
2038bcd5-e4e1-4219-9f1a-7e06bd2b79b6	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	paprikapulver	msk	1	postgres
20afac99-bfc6-4051-8def-50cc3060a4e3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	smoked paprika	tsk	1	postgres
de6dc805-b988-4a6f-9730-2e4280fe46f2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	mango		1	postgres
41d24e33-22a2-4b21-95c3-8a29a0670413	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	tomater utan kärnhus		2	postgres
8c473387-cc68-40aa-adf4-fc5daf12c165	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	rödlök, superfinhackad		0.25	postgres
91ab78c8-ab95-44c3-bd53-9452d818575b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	knippe koriander		1	postgres
94499375-d16a-42fd-b20b-a1c49b871017	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	salladslök (frivilligt)		2	postgres
ea311c48-14c5-48bd-aa7e-f7d058129eaa	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	rödlök	st	2	postgres
e84af36d-20c6-4b38-ba5a-c526777dcca6	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	vatten	dl	5	postgres
c789cbdb-55b0-4538-829d-09a7805876db	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	ättiksprit	dl	2	postgres
2e63ded0-0bea-4206-9407-02f66d9c93c0	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	socker	dl	1.5	postgres
eccd4d30-5b14-4ab4-a387-07a6efb44e90	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	knippe räddisor		1	postgres
514ba50a-521c-4fe0-9fdc-6b55c5c1c4da	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	avokado		1.5	postgres
29b621a1-4f01-46b4-a8b3-71b4fbb79ac5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	Finriven spetskål			postgres
6db290df-be4d-4a39-847f-04041c1e498a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	ägg	st	2	postgres
ec36d3cd-3f6d-42ff-879d-775f9a6bcac4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	socker	dl	2	postgres
41725c08-f176-43af-a8d6-f041b86f8195	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	vetemjöl	dl	3	postgres
7d0588d6-d625-46ea-aadd-9457dc11ee3d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	bakpulver	tsk	2	postgres
a86cc1ed-7cda-4538-b2f2-ff6d4c9ba840	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	smält smör	g	50	postgres
08997821-9f3a-44f5-af5d-69a13ade39a8	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	vaniljsocker	tsk	2	postgres
b52b6d30-8d0a-4da7-8573-d050a029b741	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	lök		1	postgres
c88ea892-a16a-4262-8b32-555c963f7330	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	rejäla morötter i bitar		3	postgres
46c9ed1f-0f08-4e97-9ff3-7edd5eddcdb4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	lagerblad		1	postgres
4e9e90e7-9a20-45b1-9803-511049b8e86f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	Kryddpeppar			postgres
bc83885d-b1d5-41b3-8bbd-189dbc55fadf	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	Vitpeppar			postgres
bc0500bc-f895-4116-abdc-7049a89dc58b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	Citron			postgres
02bc8d55-e67c-47cc-8c30-271ceca345b2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	Dill			postgres
094dfbda-6527-4be1-a9ca-ae22e9f141da	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	Halv dl grädde			postgres
b919a3a1-1a33-4b57-8c83-eb37db20675f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	043263df-ef4d-4694-b989-8b01821706a2	Potatis			postgres
1b80089e-7c92-4a24-8b7a-1caa18761eaa	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	Lammstek			postgres
f8096600-ab01-4224-a754-4927c5b2a247	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	# Potatis			postgres
ff44eb9f-8076-4042-bc96-e99fb60c4c05	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	# Vitlökssmör			postgres
81ba9329-95ca-47a3-b0d4-b36e87635374	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	#topping			postgres
a2cd6371-7cfa-4899-aee6-4633bc1d254e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	# ca 8 port			postgres
d4ad849b-40db-44a8-8fee-e38324cf9bb9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	# Örtsås			postgres
2bf1176b-d903-4b45-b434-9b0a615926c0	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	# Fyllning			postgres
c5de600c-07c3-4607-8912-660e10d01335	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	# Till servering			postgres
298c0051-5ee0-4b43-b471-39625cf23b5e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	timjan	tsk	1	postgres
8d371d72-8293-4711-ba43-c85ae86dfbc7	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	rosmarin	tsk	1	postgres
60dd7156-14c5-4919-b943-728514f453dd	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	Tunt skivad potatis			postgres
7026e281-1af6-4ebf-8d15-c5f6a8086970	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	Buljong från steken			postgres
b698a17a-5fad-424d-83aa-2b09e4adfe27	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	gram smör		100	postgres
f33d231d-d885-4748-bb3f-7b6bff0ded8b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	vitlöksklyftor		1.5	postgres
556e717d-0241-4391-94aa-f8114e2957f3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	finhackad persilja	dl	1	postgres
e26a2d9a-060f-422f-824b-7885cae5fc34	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	salt och peppar			postgres
2416cb9f-be0f-4bcb-b717-d48d98c44eab	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	olivolja	msk	2	postgres
495a07de-88f6-4ebc-8773-f49969476e22	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	hackad gul lök		1	postgres
27526684-4c65-4fa8-9de1-0e16a3ce1fe3	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	skivade morötter	g	500	postgres
befd3683-f40c-433e-9494-231405490f22	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	spiskummin	tsk	1	postgres
dd235aaa-3715-443c-bdb8-f8fd1a1325c6	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	- 2 msk riven ingefära		1	postgres
5e852247-6d49-4d40-b778-fbf7a383592b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	chiliflakes	krm	1	postgres
1d24faad-6327-49a1-85ac-50c8b6cd2c31	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	burk kokosmjölk (400 ml)		1	postgres
86fca0f3-1d67-4e0c-a595-c0c232348ceb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	konc grönsaksfond	msk	2	postgres
b14eba4d-9f83-4dc2-9bae-959a3067cd6f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	vatten	dl	6	postgres
99c86d2a-a86b-4956-a4fd-9a9223eeef58	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	färskpressad limejuice	msk	1	postgres
c2921aaa-39ec-41ff-a870-9fd396ec78d2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	salt och svartpeppar			postgres
82e28693-c1c4-4a21-b564-31d70a2a1b73	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	pumpafrön			postgres
f0aeabf6-bf75-4fb8-af71-d7064bbad703	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	strömmingsfilé	kg	0.5	postgres
7ef2b9e1-375a-4868-a495-5d70a3c20686	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	vatten	dl	5	postgres
461773b2-e74e-4a53-b020-13fe4c5ddb2a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	ättiksprit	dl	1	postgres
be3b0824-48f6-480a-927e-40f47c87ebce	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	salt	msk	1.5	postgres
d6b5c39a-5137-45e4-82e7-5989a78d41fb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	gräddfil	dl	3	postgres
6bc0a8d9-c96d-41f0-a0ee-b9e4c9d92944	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	majonnäs	dl	1	postgres
54776694-fde9-4bf2-b497-c814a3d668c2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	svensk senap	msk	2	postgres
9d9a7793-eee1-4e45-aa99-81ebf9bd0b26	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	pressad vitlöksklyfta		1	postgres
3622b059-71d4-42a1-adc8-78aae11f9dca	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	hackad dill	dl	0.5	postgres
63e30b35-fc66-476d-acad-3daf94d24254	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	torkad dragon	tsk	0.5	postgres
94dcf1c5-ed97-41b3-a519-637eff587248	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	purjolök		0.5	postgres
a30e62be-e430-4ce6-a87c-941e5ee223eb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	röd chili		1	postgres
a2ac674c-3fd7-4e9f-a080-1379de0a342b	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	tomatpure	msk	2	postgres
0e0a7ada-fecc-4e39-a47b-1dc13646d8a5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	körsbärstomater	g	250	postgres
8aff65ce-722d-41d4-bf6d-094a855fb4ef	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	vitlöksklyfta		1	postgres
ad506298-aac4-4698-9d1a-334e828e67c5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	olivolja	msk	2	postgres
4356de22-2acd-4c8e-8c5d-f4ddc226614a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	vispgrädde	dl	2	postgres
26ed20cf-3d17-41c3-b931-779fc8ed583a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	finrivet citronskal	tsk	2	postgres
2f7100ec-fe68-4c7c-8974-2440a7929302	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	skalade räkor	g	200	postgres
83672e06-4eb9-44f6-bd28-d843c5131c47	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	finriven parmesanost	dl	1.5	postgres
b6503d7f-0d79-4ddf-894b-5e0e8ba2cdca	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	salt			postgres
5d59c0a0-93bd-4be7-ba85-99899b5cea88	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	svartpeppar			postgres
285cc0f3-cd56-4c2b-8945-507cf4b85677	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	spaghetti			postgres
2531e71e-f20d-4cc9-97c4-1628a24396fc	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	anammafärs	g	400	postgres
3fc41a83-c91c-4fa2-bbf4-183808ed13b5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	gullök		1.5	postgres
f36874e6-b3e7-4587-8863-8f2503cd936c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	vitlöksklyftor		4.5	postgres
f801e4e1-11a1-4195-9efa-f358396f31b9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	morötter		2.5	postgres
c6802ac9-7b80-4cb9-ac38-1f36d56d6f7c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	liten bit rotselleri		1	postgres
12cffaca-2c7d-44da-bdbe-4b6841fdd817	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	olivolja	dl	0.5	postgres
1c61dc62-b5d9-4b35-b651-76607e9b0736	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	vin	dl	1.5	postgres
c511b1c3-3c8b-454c-921d-61589547993a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	tomatpuré	msk	2	postgres
fdda6376-d9d6-4364-b0df-ef04b69bf3ca	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	torkad basilika	tsk	2	postgres
cf111e2c-6d18-410e-9f90-22933e08762d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	salt och peppar			postgres
8f4ca82d-602c-487f-b00c-3fffb58f4cf4	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	spaghetti			postgres
f8f21f9e-cf7c-4db9-b49b-c89a75052e83	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	mjölig potatis	kg	1	postgres
ac5635ab-8bfd-4a90-8789-1e741724340f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	ägg		1	postgres
c9ce91fd-c36b-4101-9123-119792db8183	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	vetemjöl	dl	2.5	postgres
1bea176d-5c8c-4761-a296-794c6649287a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	smör			postgres
0728a381-9914-444a-a2b5-952ef861e967	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	salt			postgres
4bf0bb2a-288a-427b-8cbb-0dfba414601a	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	gul lök		1	postgres
f93fbd2b-c23f-4b71-b5cb-65c413905174	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	trattkantareller eller kantareller	dl	4	postgres
ca486252-033f-491f-b544-e1f3f626c6af	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	mortlad kryddpeppar	tsk	0.5	postgres
07e562fd-b59f-4f43-8b7b-117db3862f4e	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	grovhackade hasselnötter	dl	0.5	postgres
3eeaafdf-1050-41d2-aac8-3e569f1297ef	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Rårörda lingon			postgres
08641374-825a-4838-aace-7acabe3bc348	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Brynt smör			postgres
f7df67ac-fc40-4a7d-8261-3e05777dfda8	2023-08-05 17:21:27.999822	2023-08-05 17:21:27.999822	24194bad-e62c-49a3-8e4b-3b8a35e8c724	smör	g	200	jonas@stenberg.io
15b97d70-3768-4090-8981-26dc04cac010	2023-08-05 17:21:27.999822	2023-08-05 17:21:27.999822	24194bad-e62c-49a3-8e4b-3b8a35e8c724	socker	dl	2.25	jonas@stenberg.io
18acf536-b6bd-4f51-b71c-b4dd51c38bce	2023-08-05 17:21:27.999822	2023-08-05 17:21:27.999822	24194bad-e62c-49a3-8e4b-3b8a35e8c724	sirap	msk	1	jonas@stenberg.io
ad74fd67-4405-477c-8ce0-493d93eb6385	2023-08-05 17:21:27.999822	2023-08-05 17:21:27.999822	24194bad-e62c-49a3-8e4b-3b8a35e8c724	vaniljsocker	tsk	1	jonas@stenberg.io
9f2f4460-e9e3-4761-8821-ea4cb5f9862c	2023-08-05 17:21:27.999822	2023-08-05 17:21:27.999822	24194bad-e62c-49a3-8e4b-3b8a35e8c724	bakpulver	tsk	2	jonas@stenberg.io
e5ff56f6-e583-4590-9adf-55a3cf25ec49	2023-08-05 17:21:27.999822	2023-08-05 17:21:27.999822	24194bad-e62c-49a3-8e4b-3b8a35e8c724	vetemjöl	dl	5	jonas@stenberg.io
1698f45d-80ab-4c76-a284-f2727e0b42e4	2023-08-05 17:21:27.999822	2023-08-05 17:21:27.999822	24194bad-e62c-49a3-8e4b-3b8a35e8c724	solroskärnor	dl	1	jonas@stenberg.io
f01505f9-f58e-4f82-a7cd-0f8399a0e990	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	efb431d6-38ea-417c-b197-b92b346e5fbb	rödbetor	kg	1	postgres
619553c4-0aa1-4971-a9bf-f404976fd6e5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	harissa (eller efter smak) - går att ersätta med chiliflakes eller färsk röd chili	tsk	2.5	postgres
e62ade75-a364-46db-840b-bd0a0f514cbe	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	68bc2e69-483e-497d-b422-bb311f53de8b	En halv påse bladspenat			postgres
7ad250ed-49d5-405f-9232-adf0d7123ce5	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1642372e-2a7a-445d-be6f-2474be5b8586	pressad citronjuice	msk	1	postgres
98e1ba23-e60a-4105-a106-bf4dd07c8c1f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	44687753-8723-45cf-b025-c07fe64d1a05	hallon, puré, 1 - 1,5 msk (mixade färska eller frysta och tinade hallon)	msk	1.5	postgres
de62e101-c2e3-4efe-b764-874bc29c3f64	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	vitlöksklyftor	st	2	postgres
f3b94a20-f254-477f-9073-11abae5c9f49	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	färskpressad citronjuice	dl	0.75	postgres
34289e5a-3c73-4931-a4c2-a5a0856555eb	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	05bb7c8d-c879-41cb-aad0-44ce505db2ae	vatten	dl	1.5	postgres
b79ab0d7-2d98-42f2-a9ed-a80ecc10fe80	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	malen ingefära	tsk	2	postgres
51222264-83db-4f25-850d-a0e33e79bce9	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	9bbf4e07-645f-44a4-88e2-ca7d23f31746	Hackad persilja			postgres
baf2098d-b58d-4b4a-8dac-70d70d889667	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	gullök		1	postgres
7f9b53e2-2488-41fa-86ca-c7562c83c495	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	vitlöksklyftor		3.5	postgres
5cd4ee09-4ef6-4eea-8b47-e56574aa6628	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	olivolja	msk	3	postgres
0e55edf8-68d5-477a-be2f-a64b457da72f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	chiliflakes	tsk	2	postgres
19fceec2-86aa-4cc0-9a28-141f0cf9940d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	kapris	msk	2.5	postgres
181c9d93-0542-4414-8d84-a9f0e66c3ddf	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	burkar tonfisk i olja (Abba är bra!)		2	postgres
3ecc3f22-8732-4c13-90b7-38a8f8ec5b56	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	citron		1	postgres
b9fc78db-a40d-4490-aa2b-c9333df0b1ba	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	hackad persilja	dl	1	postgres
147af33b-43a0-431a-bddd-368c20f15bd2	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	riven parmesan	dl	2	postgres
3fc97ca9-5192-4d61-a823-221466defbec	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	Spaghetti			postgres
5320eff1-ae29-433b-829e-927035c0c02f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	färsk jäst ca 6 g	tsk	2	postgres
1c79bc4e-caed-4133-a686-3760ed199fd1	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	kallt vatten	dl	4	postgres
555dab2e-3733-4781-9e75-49a90cc86d87	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	dI fint rågmjöl 110 g		3	postgres
1db337ec-b008-423a-b50d-f3866826616f	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	dI vetemjöl 480 g		8	postgres
ad5c7107-6982-457b-91f5-9d1f55bc306c	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	salt	tsk	2	postgres
6bb0359c-9992-4684-b922-a28bec8acd11	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	finrivna morötter ca 70 g	dl	2	postgres
a7eb0bbd-8fc9-475e-aba3-b2dcf236bf50	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	dI rivet äpple ca 60 g		2	postgres
0880d438-cf82-444d-8acd-209b7edcdea6	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	gula lökar		2	jonas@stenberg.io
4e683623-90fe-4813-8af0-e2ba399e2db7	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	vitlöksklyftor		5	jonas@stenberg.io
d00ed5a5-b9ff-483a-9d6a-c6d02252ec03	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	ingefära	cm	2	jonas@stenberg.io
696dceac-66f4-483c-87b9-9c8e1e8c7baf	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	kokosolja	msk	2	jonas@stenberg.io
f68042f9-84e5-435c-a009-a787dbfb56e7	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	tomatpure	msk	2	jonas@stenberg.io
41971e06-4368-4671-9d6b-5a235d2d51c3	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	adobo chipotle	msk	2	jonas@stenberg.io
181f51fe-110d-45f4-a95a-cfd941d6d70b	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	krossade tomater	burkar	2	jonas@stenberg.io
6072a858-900a-46e5-b531-7b6232f76d4f	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	morötter		3	jonas@stenberg.io
ba8a5319-41bc-4100-a044-a40df9c76eaa	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	kokosmjölk	burk	1	jonas@stenberg.io
ceb19d1b-ded9-4deb-821b-df151996cc84	2023-08-04 12:52:14.680508	2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	röda linser	dl	2	jonas@stenberg.io
1faf03de-8402-4d0b-997a-323ab2f861be	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	f26e4739-19bc-48f4-91ed-e87268a69423	oregano	tsk	1	postgres
d5c4fd14-d9a7-4c46-9726-7881e3a5f43d	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	fb5328c4-5e22-41d7-a1e1-35448e96b4af	hackade vitlöksklyftor		2	postgres
eaea66e3-0c67-45d5-88d0-ec0db1ad3873	2023-08-03 22:18:51.869911	2023-08-03 22:18:51.869911	dd534f07-426c-4dcc-87e0-8174d44d03f7	burkar tomater, hela eller körsbärstomater		2	postgres
bc62a9b5-24d1-4635-b8d8-0160e6d8b8eb	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	olivolja till stekning			jonas@stenberg.io
808681e7-d342-440d-bd68-356f3fde1ec4	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	salt och svartpeppar			jonas@stenberg.io
97415119-b63c-493a-b499-4909f658891f	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	nachos och creme fraiche till servering			jonas@stenberg.io
6e3eb41e-06d3-431a-92c6-ec07a0c51f3f	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	gul lök		1	jonas@stenberg.io
b94c9ffa-9078-43a0-9e68-67f786229455	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	vitlöksklyftor		2	jonas@stenberg.io
846f56b2-6488-4fde-88ec-fc1a6fba097d	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	röd chili		1	jonas@stenberg.io
ffe5a981-e418-4289-b817-5d064802a0d4	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	morot		1	jonas@stenberg.io
e6f55d0a-4593-4507-aabb-d2efb08665e9	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	blekselleri	stjälk	1	jonas@stenberg.io
7003ff60-9693-45b2-8448-257ba26db557	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	tomatpuré	msk	2	jonas@stenberg.io
6fa977e3-289a-4530-bf07-e3eb9a3db7a1	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	hela tomater plus 1 burk vatten	burk	1	jonas@stenberg.io
3af523e2-c499-4313-99a8-87bf69d01525	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	svarta bönor (380 g) sköljda	paket	1	jonas@stenberg.io
35782b37-8908-4435-acfd-a36da94aed24	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	kidneybönor (380 g) sköljda	paket	1	jonas@stenberg.io
179edbb4-2330-45d7-b98e-2eabe89d3bb8	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	oregano	tsk	1	jonas@stenberg.io
f4f15d1d-3f91-443b-9947-aca4bb0bbd9e	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	timjan	tsk	1	jonas@stenberg.io
752e07e3-78ac-4123-9bf8-05b625434746	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	paprikapulver	tsk	1	jonas@stenberg.io
2ca3b9fd-e0de-4274-9e79-d6020bc4d46f	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	spiskummin	tsk	2	jonas@stenberg.io
8a485be3-8337-4ac0-920d-3f15144836ec	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	kakao	msk	1	jonas@stenberg.io
0eaa0dfb-5e4b-4e9b-9f1f-5deccace3a49	2023-08-04 13:31:07.810644	2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	färsk koriander	kruka	1	jonas@stenberg.io
cdf96721-e3f8-4790-94cd-d850171895e6	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	smör			jonas@stenberg.io
7711cc9d-987f-4301-b23e-3f2a9332a84a	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	salt			jonas@stenberg.io
0ef96b4a-10b7-4f94-ab4d-a42b6ab22da9	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	peppar			jonas@stenberg.io
5c847e1f-e75e-43ab-aaee-e85084af23d0	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	bakpotatis		6	jonas@stenberg.io
09c833a0-a85c-4aa6-b107-1c7af703f4db	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	#Tonfiskröra			jonas@stenberg.io
6f84506b-1a17-46a5-999a-6178299d2338	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	tonfisk i vatten	burkar	2	jonas@stenberg.io
4c5022d8-7d3c-4389-abc2-fbdb81f31f35	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	rödlök		0.5	jonas@stenberg.io
f3fdde74-3d02-440c-943d-75146aa0fd8f	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	selleristjälk		2	jonas@stenberg.io
d343e749-2f45-478f-9291-43fc0c39c092	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	majonnäs	dl	1	jonas@stenberg.io
f995a929-9601-4c24-9762-71945cad5b46	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	crème fraîche	dl	5	jonas@stenberg.io
abbb7691-c652-4fa5-9783-b64843ea6490	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	dijonsenap	msk	2	jonas@stenberg.io
b9a15361-6f8a-4462-9002-d93275b04c49	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	citron, färskpressad	msk	1	jonas@stenberg.io
bef2fd79-739a-444e-b283-0dde388a98b1	2023-08-11 14:59:22.94574	2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	hackad dill	dl	1	jonas@stenberg.io
7a2546f8-d837-4836-b369-7941223c41e3	2023-08-11 19:03:17.81186	2023-08-11 19:03:17.81186	bc0a6a05-bc49-49dc-89e3-37933fc145e9	vetesurdegsgrund (ca 0.5 dl)	g	50	jonas@stenberg.io
a93efa0c-4c95-4f11-9e91-f5f1f9bc826a	2023-08-11 19:03:17.81186	2023-08-11 19:03:17.81186	bc0a6a05-bc49-49dc-89e3-37933fc145e9	vatten (2.5 dl)	g	250	jonas@stenberg.io
11e41527-7369-4632-8421-072988a484c9	2023-08-11 19:03:17.81186	2023-08-11 19:03:17.81186	bc0a6a05-bc49-49dc-89e3-37933fc145e9	jäst	g	3	jonas@stenberg.io
47ef07a9-6cb3-4263-afb6-e32f26c8491e	2023-08-11 19:03:17.81186	2023-08-11 19:03:17.81186	bc0a6a05-bc49-49dc-89e3-37933fc145e9	vetemjöl special (6 dl)	g	350	jonas@stenberg.io
c000acf1-28e3-4d82-88c2-eccb133ee8cd	2023-08-11 19:03:17.81186	2023-08-11 19:03:17.81186	bc0a6a05-bc49-49dc-89e3-37933fc145e9	salt (1 tsk)	g	7	jonas@stenberg.io
1eef5b1c-f489-4ab5-b952-1115dd2f1c93	2023-08-11 19:03:17.81186	2023-08-11 19:03:17.81186	bc0a6a05-bc49-49dc-89e3-37933fc145e9	hela linfrön	msk	1	jonas@stenberg.io
f96eaaf8-2700-4a02-9f35-37ef26c88ece	2023-08-11 19:03:17.81186	2023-08-11 19:03:17.81186	bc0a6a05-bc49-49dc-89e3-37933fc145e9	solroskärnor	msk	2	jonas@stenberg.io
72d9e369-64cc-40f8-be9f-d130e1620e97	2023-08-11 19:03:45.426149	2023-08-11 19:03:45.426149	a7f351df-a980-49b4-b5b5-38d6f191a3b6	dillkronor	knippa(en)	1	jonas@stenberg.io
aad19896-2904-4ec6-955e-2b69af67bb03	2023-08-11 19:03:45.426149	2023-08-11 19:03:45.426149	a7f351df-a980-49b4-b5b5-38d6f191a3b6	västerårsgurka(or)	kg	1	jonas@stenberg.io
8367edeb-29b4-493f-9894-c0f3eb238f8a	2023-08-11 19:03:45.426149	2023-08-11 19:03:45.426149	a7f351df-a980-49b4-b5b5-38d6f191a3b6	senapsfrön, gula	msk	3	jonas@stenberg.io
e6b431c0-3b0e-4262-989c-a6a3dde029f9	2023-08-11 19:03:45.426149	2023-08-11 19:03:45.426149	a7f351df-a980-49b4-b5b5-38d6f191a3b6	ättiksprit, 12%	dl	2.5	jonas@stenberg.io
751d8965-c94c-41a2-a136-660a86747162	2023-08-11 19:03:45.426149	2023-08-11 19:03:45.426149	a7f351df-a980-49b4-b5b5-38d6f191a3b6	vatten	dl	2.5	jonas@stenberg.io
1854d211-a752-44df-811f-25cbdc738724	2023-08-11 19:03:45.426149	2023-08-11 19:03:45.426149	a7f351df-a980-49b4-b5b5-38d6f191a3b6	socker	dl	4.5	jonas@stenberg.io
1b92e8a7-39ab-49e3-9aa6-e91ec7c3c881	2023-08-11 19:03:45.426149	2023-08-11 19:03:45.426149	a7f351df-a980-49b4-b5b5-38d6f191a3b6	salt	dl	1	jonas@stenberg.io
b1a94312-2330-417f-bce9-023e1d5607c8	2023-08-11 19:03:45.426149	2023-08-11 19:03:45.426149	a7f351df-a980-49b4-b5b5-38d6f191a3b6	pepparrot		1	jonas@stenberg.io
ee70a105-031f-409b-a80d-6131bd2038f6	2023-08-11 19:04:07.103485	2023-08-11 19:04:07.103485	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	ägg	st	2	jonas@stenberg.io
055166de-e897-49c9-ade2-04f83c005c40	2023-08-11 19:04:07.103485	2023-08-11 19:04:07.103485	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	socker	dl	2	jonas@stenberg.io
20982721-f323-4ece-b97f-2fdf8671f982	2023-08-11 19:04:07.103485	2023-08-11 19:04:07.103485	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	vetemjöl	dl	3	jonas@stenberg.io
590fd7fc-9254-4ce3-81d1-cf41bb9a5b2e	2023-08-11 19:04:07.103485	2023-08-11 19:04:07.103485	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	bakpulver	tsk	2	jonas@stenberg.io
910270b5-1e0b-4425-a2d4-ff882d2c7936	2023-08-11 19:04:07.103485	2023-08-11 19:04:07.103485	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	smält smör	g	50	jonas@stenberg.io
9929415d-8668-4a11-ae06-2f6b20a96c07	2023-08-11 19:04:07.103485	2023-08-11 19:04:07.103485	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	vaniljsocker	tsk	2	jonas@stenberg.io
a6c271f2-4522-4bee-9ced-3483f32432fd	2023-08-11 19:04:28.724055	2023-08-11 19:04:28.724055	0789d29d-8a27-496d-a4d1-c662200a6281	smör	g	150	jonas@stenberg.io
303e6bba-67f9-4e9a-a206-95ab091b60a2	2023-08-11 19:04:28.724055	2023-08-11 19:04:28.724055	0789d29d-8a27-496d-a4d1-c662200a6281	vetemjöl	dl	3	jonas@stenberg.io
7b392905-e09f-416c-bbbb-bcb3f7068aca	2023-08-11 19:04:28.724055	2023-08-11 19:04:28.724055	0789d29d-8a27-496d-a4d1-c662200a6281	socker	dl	1	jonas@stenberg.io
245e7a1c-7ee6-41ba-ba13-9697f3601e7a	2023-08-11 19:04:28.724055	2023-08-11 19:04:28.724055	0789d29d-8a27-496d-a4d1-c662200a6281	drygt 0,5 tsk bakpulver			jonas@stenberg.io
88e14b4b-0dd7-480c-8883-237f1ef39206	2023-08-11 19:04:28.724055	2023-08-11 19:04:28.724055	0789d29d-8a27-496d-a4d1-c662200a6281	ägg		1	jonas@stenberg.io
5200a11f-956b-44ef-919a-d87340d35e87	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Lax			jonas@stenberg.io
46c0abdd-5afd-4fd7-8e11-55b3efc3ee9d	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Pepparrotscreme			jonas@stenberg.io
c4530d6f-ecf8-4b8b-9465-04de43133a86	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	# Potatis			jonas@stenberg.io
e907f2c8-a80a-4ed8-9988-405bac9bdaa9	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	laxfileér eller 500g laxsida		4	jonas@stenberg.io
3439fb9e-0eb2-4808-a0c6-d002756cb89c	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	philadelphiaost eller liknande	pkt	1	jonas@stenberg.io
1e7dc9e4-994a-4023-ab41-2d3599ba5b1d	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	finriven pepparrot	msk	2.5	jonas@stenberg.io
3c5a3640-4237-4893-910a-f815a4241e32	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	salt	tsk	1	jonas@stenberg.io
191277ad-c598-4758-9848-8e6408ad6877	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	svartpeppar	krm	1	jonas@stenberg.io
2578b140-da83-44b0-ae0b-2ce5e537fcda	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	fast potatis	g	500	jonas@stenberg.io
540ebb59-7790-494b-b403-f90b486a0eea	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	olivolja	dl	0.5	jonas@stenberg.io
833fc8fd-f232-44e7-9365-a07048dec87f	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	salt	tsk	1	jonas@stenberg.io
5c5ed76e-6493-4c26-b2d0-0e87fc7f2186	2023-08-12 14:24:33.506243	2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	svartpeppar	krm	1	jonas@stenberg.io
4ce954c1-7f1d-431b-9c8d-e76fb080fb83	2023-08-13 20:01:47.49987	2023-08-13 20:01:47.49987	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	# 6 portioner			jonas@stenberg.io
75753763-6383-4e9c-ac9e-2df23adadbb1	2023-08-13 20:01:47.49987	2023-08-13 20:01:47.49987	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	vispgrädde	dl	5	jonas@stenberg.io
7a6ade8f-7a24-41d6-abe6-b2a01b16ea6c	2023-08-13 20:01:47.49987	2023-08-13 20:01:47.49987	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	strösocker	dl	1.5	jonas@stenberg.io
a4b41dfc-fa39-4b05-a8ee-a4fb770b0cad	2023-08-13 20:01:47.49987	2023-08-13 20:01:47.49987	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	färskpressad citronjuice	dl	0.75	jonas@stenberg.io
fc851211-2589-4999-b3d9-c2ffdff12190	2023-08-13 20:14:30.366565	2023-08-13 20:14:30.366565	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	a			jonas@stenberg.io
64466328-f516-4978-ae12-f2960f976d5d	2023-08-14 09:21:12.57946	2023-08-14 09:21:12.57946	04ecefde-1b56-44df-9aef-401c9e48c34a	rumstempererat smör	g	150	jonas@stenberg.io
a73f790a-2515-49b9-a50c-ff883899321e	2023-08-14 09:21:12.57946	2023-08-14 09:21:12.57946	04ecefde-1b56-44df-9aef-401c9e48c34a	socker	dl	2	jonas@stenberg.io
7ea4468a-b150-4a17-a143-b15c0e030001	2023-08-14 09:21:12.57946	2023-08-14 09:21:12.57946	04ecefde-1b56-44df-9aef-401c9e48c34a	ägg		2	jonas@stenberg.io
5b82627b-55cd-4a70-b792-a57aa2f43463	2023-08-14 09:21:12.57946	2023-08-14 09:21:12.57946	04ecefde-1b56-44df-9aef-401c9e48c34a	vaniljsocker	tsk	1	jonas@stenberg.io
df870dbc-72a3-4bf1-96cf-05bf84dd0652	2023-08-14 09:21:12.57946	2023-08-14 09:21:12.57946	04ecefde-1b56-44df-9aef-401c9e48c34a	mjölk	dl	0.5	jonas@stenberg.io
9704448e-9fff-452a-8363-4b2929d829fd	2023-08-14 09:21:12.57946	2023-08-14 09:21:12.57946	04ecefde-1b56-44df-9aef-401c9e48c34a	vetemjöl	dl	3	jonas@stenberg.io
657ac7db-2116-46f6-9fa9-edd26b940588	2023-08-14 09:21:12.57946	2023-08-14 09:21:12.57946	04ecefde-1b56-44df-9aef-401c9e48c34a	bakpulver	tsk	1	jonas@stenberg.io
c4ee1938-4890-4c11-8e87-ba9027b5a286	2023-08-14 09:21:12.57946	2023-08-14 09:21:12.57946	04ecefde-1b56-44df-9aef-401c9e48c34a	blåbär	dl	2	jonas@stenberg.io
37a2e522-4cdf-4998-a565-e49d723a71b9	2023-08-18 07:52:50.043752	2023-08-18 07:52:50.043752	8f4f0cd3-b2b8-4e78-8110-15459b651d18	blåbär	dl	1.5	jonas@stenberg.io
3e09ce65-70b8-42f0-bb11-50dd355aca05	2023-08-18 07:52:50.043752	2023-08-18 07:52:50.043752	8f4f0cd3-b2b8-4e78-8110-15459b651d18	socker	msk	1	jonas@stenberg.io
293eb809-b7dc-47d4-a1dd-d9374bfa5ce9	2023-08-18 07:52:50.043752	2023-08-18 07:52:50.043752	8f4f0cd3-b2b8-4e78-8110-15459b651d18	vatten	dl	2	jonas@stenberg.io
a843ceb4-b9e6-4e50-8ac1-a7a7f72b6d7c	2023-08-18 07:52:50.043752	2023-08-18 07:52:50.043752	8f4f0cd3-b2b8-4e78-8110-15459b651d18	grahamsgryn	dl	1	jonas@stenberg.io
6a91b65e-5c97-4c4f-a26a-ea3bed008405	2023-08-18 07:52:50.043752	2023-08-18 07:52:50.043752	8f4f0cd3-b2b8-4e78-8110-15459b651d18	salt	kryddmått	1	jonas@stenberg.io
\.


--
-- TOC entry 3407 (class 0 OID 17877)
-- Dependencies: 217
-- Data for Name: recipe_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_categories (date_added, recipe, category, owner) FROM stdin;
2020-11-24 20:36:56.762465	fc52748c-181d-4c2b-916b-08332cdcb473	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:36:56.773322	fc52748c-181d-4c2b-916b-08332cdcb473	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2020-11-25 19:51:42.533503	49d79c70-f086-4339-b5c5-df189a86074f	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:37:15.095521	1642372e-2a7a-445d-be6f-2474be5b8586	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:37:27.377815	33c62ccb-4f03-4528-8d4e-e29b0b71bf16	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2020-11-24 20:39:50.751708	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:39:50.776957	40b0ea90-96bb-4c1d-ba4b-29eea6419ea1	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2020-11-24 20:44:48.236592	1cb4d94c-8104-47ee-8849-c11bbdc60c1b	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2020-11-24 20:44:55.771897	e7e6ba02-26e6-4e54-af66-5afb58f6bd4b	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:45:03.887343	b844bebc-62e6-43d8-92f3-af8033543f16	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:45:26.635304	efb431d6-38ea-417c-b197-b92b346e5fbb	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:45:36.919975	39223e98-f9b2-4217-957c-58a43ab3cbe7	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2020-11-24 20:45:44.287553	dd534f07-426c-4dcc-87e0-8174d44d03f7	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:45:53.754289	7f4502e4-b154-4bfe-b0ae-a4f762c7a910	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:46:05.471745	dd36e4c5-da23-408b-8f45-2b6a349ebddc	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-11-24 20:46:05.496936	dd36e4c5-da23-408b-8f45-2b6a349ebddc	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2020-12-01 12:18:08.55448	49bd57fd-c569-43cf-b69c-0bc1371ce407	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-12-26 15:34:30.530335	66cf92d6-c4c1-4c1e-9a5f-fe59283c762a	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-12-26 15:38:10.629565	a27b18c2-7351-4818-bb33-c1387e76e307	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2020-12-26 15:51:02.393424	f0d97e79-a8e3-46c0-a72d-4134cfb774c8	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
2020-12-26 15:51:14.88455	e35f9be3-7cc2-4d4d-9144-cf7bccf070ab	ffa8c20f-3293-418e-a89f-200018197bab	jonas@stenberg.io
2020-12-26 17:32:55.316208	ad8aeebd-5f05-49fa-bbe8-a29ecf6e166d	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
2020-12-30 16:33:18.468548	05bb7c8d-c879-41cb-aad0-44ce505db2ae	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
2020-12-30 20:12:09.236758	44687753-8723-45cf-b025-c07fe64d1a05	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2020-12-30 20:12:09.253879	44687753-8723-45cf-b025-c07fe64d1a05	ffa8c20f-3293-418e-a89f-200018197bab	jonas@stenberg.io
2021-01-10 19:30:03.099448	d08968af-bbdc-4102-8dfe-650cb9d30e83	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2021-01-12 08:48:02.736981	68bc2e69-483e-497d-b422-bb311f53de8b	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-05-01 21:19:23.785033	8aa6fb8a-705b-4c9c-92d1-ac9066ddde62	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-05-29 13:23:13.19343	043263df-ef4d-4694-b989-8b01821706a2	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-05-29 13:23:13.20807	043263df-ef4d-4694-b989-8b01821706a2	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2022-12-29 12:37:33.9919	f26e4739-19bc-48f4-91ed-e87268a69423	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 12:44:08.039468	6675697a-c45c-495c-af13-2180ae68113a	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 15:18:50.796992	1312646e-45e1-407b-a46e-ed3b60bc1405	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2022-12-29 15:19:30.573741	12905e60-8310-45f0-8507-ad5334662b3a	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2022-12-29 15:19:52.434597	a644a7d4-a57f-45ae-97d4-1ae39a0638a5	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2022-12-29 15:20:12.57993	dbecf460-5460-40c4-89a4-d7d704148456	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2022-12-29 17:12:14.681569	83726276-170e-44ac-82bd-34d0087cee43	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2022-12-29 17:12:14.695224	83726276-170e-44ac-82bd-34d0087cee43	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 17:16:54.664782	57be7a15-9cc3-437c-a189-21b0c11b203b	2f8c4fd1-7a96-4df8-b38b-7949deec6ce5	jonas@stenberg.io
2022-12-29 17:16:54.665051	57be7a15-9cc3-437c-a189-21b0c11b203b	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 17:21:28.407604	9b6996db-e837-44a4-bd55-46f9ed31f515	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 17:24:19.479464	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2022-12-29 17:29:34.324537	647d6e35-8369-4e00-8146-7d0587c28478	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 17:32:14.472276	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2022-12-29 17:32:14.473083	93fa5cd7-4c61-42e5-91a5-c60728a1ba0d	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2022-12-29 17:35:36.211233	9bbf4e07-645f-44a4-88e2-ca7d23f31746	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2022-12-29 17:35:36.211965	9bbf4e07-645f-44a4-88e2-ca7d23f31746	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-06-05 09:23:32.834338	fb5328c4-5e22-41d7-a1e1-35448e96b4af	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-06-05 19:39:47.740156	1ff2ca0d-e96e-4256-b9e6-2aa2dd53ea50	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-04 12:52:14.680508	41bc608a-d07b-45f2-a533-2085726ae280	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-04 13:31:07.810644	ae627ce3-5e81-48b1-a04e-4a3216d9f6b9	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-05 17:21:27.999822	24194bad-e62c-49a3-8e4b-3b8a35e8c724	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-09 18:06:48.469823	234950c8-2db3-4aa6-9bfa-20c38b52af85	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-10 00:30:07.041849	e93d25fa-4339-4a26-87d4-5329921b5786	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-11 14:59:22.94574	3b6206a8-4ed8-4228-a66b-1e0c05ac2af4	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-11 19:03:17.81186	bc0a6a05-bc49-49dc-89e3-37933fc145e9	73f14622-6755-4c5a-a610-ad8bf0f28071	jonas@stenberg.io
2023-08-11 19:03:45.426149	a7f351df-a980-49b4-b5b5-38d6f191a3b6	fcbddad5-f66b-4142-949f-af475423a834	jonas@stenberg.io
2023-08-11 19:04:07.103485	8ecc7ec6-54e8-466b-bd41-36d4a05539e7	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-11 19:04:28.724055	0789d29d-8a27-496d-a4d1-c662200a6281	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-12 14:24:33.506243	4aa69da1-cda1-46cb-b386-6fd0e5251b6e	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-13 20:01:47.49987	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	ffa8c20f-3293-418e-a89f-200018197bab	jonas@stenberg.io
2023-08-13 20:01:47.49987	e6800c24-b01f-4d28-baf1-3dfa25fcfa4b	5a9ca809-e24a-40f0-bf36-dfb3c56e9e10	jonas@stenberg.io
2023-08-13 20:14:30.366565	d6f52463-0949-4b7d-801e-7aa4c2e6fe8e	008625e8-ada4-4412-b20f-feb6f2f5c6ed	jonas@stenberg.io
2023-08-14 09:21:12.57946	04ecefde-1b56-44df-9aef-401c9e48c34a	74b57792-fa68-4efb-be46-e8d194d86ed3	jonas@stenberg.io
2023-08-18 07:52:50.043752	8f4f0cd3-b2b8-4e78-8110-15459b651d18	1e92d3e7-8a5e-4d0d-a52e-737a519666c5	jonas@stenberg.io
\.


-- Completed on 2023-08-19 02:02:20 CEST

--
-- PostgreSQL database dump complete
--

