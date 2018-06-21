--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: second; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.second (
    i integer NOT NULL,
    s text
);


--
-- Name: simple; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.simple (
    i integer NOT NULL,
    s text,
    b bytea
);


--
-- Data for Name: second; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.second VALUES (0, '0');
INSERT INTO public.second VALUES (1, '1');
INSERT INTO public.second VALUES (2, '2');
INSERT INTO public.second VALUES (3, '3');
INSERT INTO public.second VALUES (4, '4');
INSERT INTO public.second VALUES (5, '5');
INSERT INTO public.second VALUES (6, '6');


--
-- Data for Name: simple; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.simple VALUES (0, 'str', NULL);
INSERT INTO public.simple VALUES (1, '', NULL);
INSERT INTO public.simple VALUES (2, ' ', NULL);
INSERT INTO public.simple VALUES (3, ',', NULL);
INSERT INTO public.simple VALUES (4, '
', NULL);
INSERT INTO public.simple VALUES (5, '\n', NULL);
INSERT INTO public.simple VALUES (6, '
', NULL);
INSERT INTO public.simple VALUES (7, '
INSERT INTO public.simple VALUES (9, '"', NULL);
INSERT INTO public.simple VALUES (10, NULL, NULL);
INSERT INTO public.simple VALUES (11, '\N', NULL);
INSERT INTO public.simple VALUES (12, 'NULL', NULL);
INSERT INTO public.simple VALUES (13, '¢', NULL);
INSERT INTO public.simple VALUES (14, ' ¢ ', NULL);
INSERT INTO public.simple VALUES (15, '✅', NULL);
INSERT INTO public.simple VALUES (16, '","\n,™¢', NULL);
INSERT INTO public.simple VALUES (19, '✅¢©ƒƒƒƒåß∂√œ∫∑∆πœ∑˚¬≤µµç∫ø∆œ∑∆¬œ∫œ∑´´†¥¨ˆˆπ‘“æ…¬…¬˚ß∆å˚˙ƒ∆©˙©∂˙≥≤Ω˜˜µ√∫∫Ω¥∑', NULL);
INSERT INTO public.simple VALUES (20, 'a quote " or two quotes "" and a quote-comma ", , and then a quote and newline "
', NULL);
INSERT INTO public.simple VALUES (21, '"a slash \, a double slash \\, a slash+quote \",  \
', NULL);
INSERT INTO public.simple VALUES (100, '<ॹ	\"	ᐿ\π�✅<✅
�a
ॹ	"	"\�;,
;<,

ॹa

\ᐿᐿ,✅πa;;��
a✅✅;"
<;,✅,✅✅�\,ॹ,		ॹ,a<a<
\ॹॹaπ
";a,<
ᐿ\
✅
<	
"	ॹ
"✅ᐿ
✅<a✅
		\

\"	<	;a<�;,\,π,,,<\�,aπ\;
	
ॹπ
"✅πᐿaaॹ✅,,,,"ᐿ;ॹ\	
ᐿ

"ᐿ
,\✅

"✅π


",
<ᐿᐿ✅

\ॹ
"�"ॹॹॹ✅	<<ᐿ�\"ᐿ
ॹॹ;�;"✅
ᐿॹ;"\\π
aॹ	ᐿ
ᐿ
;
	;	
"

;<�π<<a<<

	<�
�
<

<�
<�ॹ
;\✅
π
a<,ππ,a�ॹ"
<π
ᐿ
✅,
	\\���ᐿ",

	<ॹ✅	ᐿa\<ॹ
;"
π	<,✅ॹ<�<�,,,✅✅		ᐿ	
✅,�aॹ
a
;ᐿ	�	�	;;,


"	
	a
π,

\	πaॹ�✅,\"<

\;;a�;
"
ᐿ✅ॹ�ᐿaa
ॹ<
",<<�ᐿa,ॹ<
;π	ᐿa
<<	,;π

aa
;�	<ॹᐿ	ॹ<<ᐿ"<<
,	,a;�ᐿ
�✅�\ᐿ""a

	π✅<
��a,""
✅ॹ�\,	,
;	�""ॹᐿ	\��<ॹ\ᐿ	�\�aa✅ᐿ
ॹ"<;;
;ॹ<;<"<�<ᐿ"\�ॹ,,✅\\	,
π
,	
<	<a
ॹa\
	ᐿ"�✅�ॹa✅<✅π;πᐿa"ॹ\	
�,
,"\a✅,<a\"a;✅"a;
a;,;ॹॹ✅
�✅✅,""✅\ᐿ
	πa✅\;π,ᐿa"ॹa"	π<�ᐿ
	ᐿ,



	
;π,\
"ᐿ;ॹ
\ᐿ✅	ᐿ
\a
	
�";	✅ᐿ	"ᐿ;\
', '\x0194fdc2fa2ffcc041d3ff12045b73c86e4ff95ff662a5eee82abdf44a2d0b75fb180daf48a79ee0b10d394651850fd4a178892ee285ece1511455780875d64ee2d3d0d0de6bf8f9b44ce85ff044c6b1f83b8e883bbf857aab99c5b252c7429c32f3a8aeb79ef856f659c18f0dcecc77c75e7a81bfde275f67cfe242cf3cc354f3ede2d6becc4ea3ae5e88526a9f4a578bcb9ef2d4a65314768d6d299761ea9e4f5aa6aec3fc78c6aae081ac8120c720efcd6cea84b6925e607be063716f96ddcdd01d75045c3f00');
INSERT INTO public.simple VALUES (101, 'a;,

✅
ॹ;a
aa

	
ᐿ
	ॹ✅<ᐿ;\,,<ᐿ
"		
<	;

\ππa<,ᐿ;
✅<
<
<
<<
�\


π;""\ᐿ
�a,;\
✅ॹ
<
\�ॹ<ॹᐿ
<ॹa;	π
,π;;
π\<✅
ππ�✅✅a

πa�ᐿ\,
a�"\;	<"a✅ॹ✅,
;\<"
"
a
	,ᐿ	""π�;<
ॹ✅,✅
<"✅;
ᐿᐿ
ᐿ\a
✅

,\,\,
ᐿ,
;	,
✅
a
ॹॹ<"ᐿπ;

";,,;aॹa✅
;;π✅ᐿ\<<aॹॹ	ॹ"
\\


a

,	π;"a"π;\
	a;
✅�
"

;π
ᐿॹᐿ
✅πᐿπॹ"<,
<✅

"�ᐿॹ"�a�	\�a
	
aaπ<ॹ
	;ॹॹπ
"πॹ	;
;\	
,;;,✅ᐿa
;
		<\π
ᐿ

�✅,,πᐿ\π<a

ᐿ<,aᐿᐿ;
ॹ<<<✅π

aa,π✅<ॹπ"ॹ	
,;\aπ<",�\πᐿππ�,
ᐿ�	
,ᐿ
<�ᐿᐿ
ॹ	,aa<


ᐿ<✅"
�ᐿ
\
	\ॹ"		<,"<
;	<	π;;;✅
;,�✅ॹᐿ	"πॹπ�<ᐿ
a
�\",✅aa"<ππ,	\,;a<<<	",✅	";
,�
π;✅ᐿ"
;
<✅<	

",�


a
�ᐿ
,;,<"
ᐿ
πᐿπ<ॹॹ✅,
a	�aa
;
✅
ॹ,
				
	�
<

π
✅;�✅	
π<;✅
	";	ॹ<,
\\
\"	

<",<✅a✅✅"<
a	ᐿ"\"ॹ', '\x52fdfc072182654f163f5f0f9a621d729566c74d10037c4d7bbb0407d1e2c64981855ad8681d0d86d1e91e00167939cb6694d2c422acd208a0072939487f6999eb9d18a44784045d87f3c67cf22746e995af5a25367951baa2ff6cd471c483f15fb90badb37c5821b6d95526a41a9504680b4e7c8b763a1b1d49d4955c8486216325253fec738dd7a9e28bf921119c160f0702448615bbda08313f6a8eb668d20bf5059875921e668a5bdf2c7fc4844592d2572bcd0668d2d6c52f5054e2d0836bf84c7174cb7476');
INSERT INTO public.simple VALUES (102, '"aπ"ᐿ;"�ᐿ

"<ॹ"<,

<�
�	";
<\;✅✅π\

,✅��"""�
,ॹॹ
""π
	
,\,ॹॹ�<ॹ
a\ᐿᐿ✅✅a"\
π
;\
\
�
�
�
��	�	
;ᐿa
π,

,	<�;✅πᐿ�aa
,;<✅	",;",�
ᐿ�	π<

<	<ᐿ\ॹ✅<�
"π\,�a
,�π�,
π

<π,
	ॹ<π
"\	"ॹ"ॹ✅\ᐿ,;ॹ�<✅
"ᐿ<
ॹ✅
"
"a,\✅\
<✅
πॹa\
ॹ";,	"✅,,,
"",,"
ॹᐿaπ,ॹ,ॹ,ᐿ\,aॹ,
a✅π\✅"πॹ

ॹ�

a\aॹॹ
"�ॹ✅ॹa✅ᐿaπ
"	,"
,,,a
	✅
<;�πॹ",πaa�
ॹπ	\<\
ᐿ✅,	,ॹπ
\✅ᐿ,	
\
<;
ᐿ✅πa,<<"ॹ\\�	ॹ
;a,
\<π
✅
✅
	"
ॹa<ॹ,\
<ᐿaᐿ"�<aᐿ\\\a�



<✅"<ॹ
,	π<

	ॹ,ॹ�,π"\aa

<<"<ॹ
π
;\<�
ॹ;,"�<ॹ"
"aॹ�
π,<ᐿᐿ<πᐿ\	<π✅
;
,"a

;π�ॹπ"

,
	
\
	"ᐿ\
ॹ	"✅
π
�
	π,\,✅a<<aᐿ<
πππ	
,π\;<ᐿ	"�<

✅;πa
ᐿ;,

;<";ॹᐿ✅;\
ᐿπ"
;
ॹ
ππa<ॹπ
ᐿ	a\
ॹᐿ

<,ᐿ�a�πππ\<<a"ॹ\<\ᐿ

;;�ᐿ\<ॹ	,�ॹ
aa<	
"	\ᐿ<ᐿ
;ᐿ,ᐿᐿ
;\a
�<✅�		;✅

ᐿπ;π	<ॹ,<ॹ	

	<π<<a\
ᐿ

<"✅			\"�✅

	"a
;"�,<π
	<
"<ᐿ
"π"✅a
	✅
,✅ᐿ"
;
;✅
✅<π✅
\",<a\
<"
"�,,
✅', '\x2f8282cbe2f9696f3144c0aa4ced56dbd967dc2897806af3bed8a63aca16e18b686ba0dc208cfece65bd70a23da0026b66108fbad0844363fe09dd6a773e21b8236a37f8283efb27367f6ee35437869c4043725d5ea2c63b01af2fcbb387de40daac6225423c14a994dda08f399b7888fcb6c84703dd101ac77cf000e49b2a33f748a9d6993340fe25a5f58f01766fd3466668e9e02d727a2b49f44691178d97e75e4fc0a9ca5103b928c58066d2aaf55a4ecaefd462a35a1fab5f8e47e865b0f7f37aa169dd0c93');
INSERT INTO public.simple VALUES (103, 'π�<a

<<\
"	
"
�\<\<\�πaπॹᐿ"
�
	
	<
<π
�π;a		
\

;a�
<"	✅ॹ	,✅
�;��<"\\π�;✅;<	
\
;a�✅
ᐿ
	,�
�

	�,<ॹॹ\,;
	ᐿπ
<aॹ
a;ππ
ᐿ
aॹa\\<a	ᐿ"ᐿᐿ"
";,,✅ᐿ
\<ॹ";✅a<	a	;✅

,\
"

"
✅�	;�π\ॹ;ॹ"πॹ,,
<ᐿ,	�
	
",	
�
;<ॹaᐿ";<
�;;ᐿ
,ᐿ�ᐿ<	�aᐿ


;ॹ",<
;\"a

;✅"✅a;aπ
π<✅ᐿ<

<
"a,�
a\✅

✅✅
aॹa
✅<\✅"	π\ॹ,
✅

;\ᐿπ✅a

aaπ	,a\

,	
,"�	π
\,,
;�	

,aॹπॹ�
	✅;ॹ<a✅�	

;aa\
",a<
�<�
π
\
<;ᐿπ
�
"
ॹ
<,"
ॹ<a��;aᐿa;\��
,	;<ॹ
ᐿ\
ᐿॹ✅�✅

	✅
π�
;π
✅,ᐿᐿ;


�
π�✅

;";a	"
\
"	
",ᐿ�	✅<;,ᐿπ
",�ॹ
,ॹ✅ᐿ
ᐿ";;
✅ᐿ;<✅
;✅
ॹ
aa
ᐿ�
�<	
π
ॹॹ\
;�<�"πᐿ\\π
�✅ॹ\"a
✅a�;"
ᐿ✅
ॹ<

ᐿ
;
\,
\\<;ᐿ�;✅

�
,<
π<ॹ
,\<
\<",ᐿ"ॹπᐿ✅π

π	ॹπᐿ;�;
ᐿᐿ�;��

INSERT INTO public.simple VALUES (104, ';π,\✅✅ᐿπ✅,�a
πᐿॹ;π\,✅
ᐿॹ✅�,

ᐿaπ
a,a\<✅"✅\,,a"π
�✅π"ॹπ;
π;<,<
;<
	ॹ

\ᐿa		

π	\
\πa;π
�
ᐿᐿ\,ᐿᐿ
a"ᐿ""aa
;✅π
ॹ\""�✅ॹॹ\
ॹ	
ॹ✅,
"πᐿ

;<<;




π�;
;,"✅
\;aa


;

<<ॹ�
πa�πॹaॹ
;✅✅,;ᐿ
;π"\πᐿ
"
\a\aπ✅ᐿ
<",	ॹ
ππ"�

	,π\\<\	;ॹπ\,;�✅ॹ,
✅�;ᐿ",;✅

ॹॹ
✅
<<
"",a	


ᐿ
<\
π
<✅ᐿaॹ�✅
	,π"

π	π✅
<\πॹaᐿ	;�ॹॹ,"
\a
,"πॹ,
\π✅
"ππ
✅�πॹ,
;π;ᐿ"
ᐿ✅
"ॹ"�"a

<
	"aπ	;\
";"π,	a	

ᐿ<,;�<ᐿ"\ᐿᐿa,
;;ॹॹ	ॹπa�ᐿ
,✅
<;ᐿ"�;ᐿ;�;✅	\<\<;πa✅
;
\
	π✅""<
,\✅ᐿᐿ�	�,ππ;ᐿ	�"\ππ"ॹ,πa<

<��

;\ॹ;π<"�	�<"ᐿॹॹ;
<

a	�ॹᐿa
,"	
,
<,;<"	

ᐿ,ᐿ	π✅
,
	<,�\;<\a
π	,	�ॹ	
�a✅
✅
ॹ";
	ᐿॹ✅"

,	\	\;"a	,ॹॹ"aॹ
,
✅�	
ॹᐿ

✅	ॹ"ॹ"�

ᐿ<
,
;π
ॹ	a✅
�;ᐿ"a�✅π

",✅
ᐿ
<�
πᐿ"πॹᐿ
<,✅a\ॹ
✅<;\�	ॹ



ᐿaॹaॹ\

�	a,
ॹॹᐿ
,π✅<;\
πॹπᐿॹ<;"a
<✅ॹॹ	ᐿ
\ॹ<"π	
	a	,<ππ;
\
,

\ᐿa
ॹᐿa
	
	
✅"ᐿ"

"�

<<π

✅�a✅�', '\xe2807d9c1dce26af00ca81d4fe11c23e8eb6752e1f9ad716c61fc24f2d80c04189b3a4c3f477689d0ac9a542f9b174192a2c16da483de16a3a093f9107cdc35f97f4378037ad8aa15ea7c95db087c51c99644230bb8f8b6243b21cdcc015237564a9fb2ac359aa7ab99544cd62e240885533aed411c87c530b7107321db580938d8b78eb063b5c3c4f18926cba3bc05a65244dab6d79345fe5e99adf9ddd3d1dbfe5db7f8f20aacd5ce70992f8161755f872054a64703dbfbab3be3dc57fcb075ef625033f810cda');
INSERT INTO public.simple VALUES (105, '<a✅ᐿ<


ॹ",
"πॹᐿ,
ॹ�ॹ<
aᐿᐿ,"ॹ"\✅
�✅<

,�✅,	;\"π,;ᐿa
ॹ✅
;ॹ<\
;<ᐿॹ

�\",ॹ✅,
"✅ᐿ

	;�π<,",ᐿ<ᐿ\ᐿ✅;	<π""ॹ<	
,,π"	�✅
ᐿ
\;

πa<✅aπ	;✅
✅ππ	
\<✅✅<
;
""��ॹ
aॹᐿπ\π

,�	<�a
π\✅,πॹ",πᐿa,ᐿᐿa
ॹ

<✅"a	�
aᐿॹᐿ
"
π✅✅
\ॹ	;ᐿ"a,ॹ"aॹᐿᐿ
,\
ॹॹ,;ॹ;\

	
,
aॹπ
	✅ॹ
πᐿ<ॹ	ᐿ
a
ᐿ	ππ<<π	✅;

a�<ᐿ
ᐿᐿ";a<

ᐿπ;	;;✅ᐿ✅✅<�ॹ;	ᐿ,,	,π✅
ᐿॹ;
ॹ<aॹ
πa�
\
"ᐿππ
✅ॹπ
	<;πᐿᐿ✅ॹ	�a✅
\
ॹ"π"π	a�<π�
a<
ॹ\\
\<�\�aπa;
ॹ"✅;"
✅ᐿ✅a
<ππ	π<a	�\<"✅\
ᐿ;
",ᐿ;ॹ
ᐿ
aa"
	<,✅<a\
"ॹᐿ
\		

a	
π;\π\✅
	"\
�✅�
�\



�a
\ॹॹ	;
<	\<ॹॹ�✅π	"<
	ᐿπᐿ""�;	;ॹ<π<✅
ππ<"

ᐿᐿ✅
;�;
,;✅ᐿ,\
<,<\	
;<\aᐿ
;\
,	a✅
\	
ᐿ✅\"
aᐿ\\";
"	aᐿ
a
πᐿ
ॹ	π,π
,�
a;�\✅,<""�
ππ	
πaॹaa✅\;\a
\�
a		<

✅π
ᐿ✅\<,
π
✅ॹ\�
\�
ॹ\<\<


', '\xc00913e02a63e4cf532d9b2ce282fad85af699815c18c595ea804462a794f75123135cc728c43daa5aa248d5a17dde4906843049a995cbd0b80d23694897467e10e43cb2ef4662aceef9304835d744e43af04165e3d13cd1f7b9adead9e072bca6ae92fbb52cc2f48f89ae44e020c506fa047bf7e8bf5a51a3054dbba8bef4c40fe97c737b7c8f72adda57c4a29edf179f02f3d0bfd3eafd8e7733b84037ea87984e250ae0406a71b3b02679e34b30c8bc5f731e1598e7bf36ebef7d2464642faaf1cb2e558fd472');
INSERT INTO public.simple VALUES (106, 'ॹॹ;,✅
π<	
π	ॹπ✅a
,
ᐿ�
ॹ✅�ॹ�"✅ॹ\<"
;a\
,✅π
<
<
ॹπᐿ�ᐿ;,�	ᐿ
ᐿaᐿ,
π�	\<ॹ\π;π�π"<;"�\<�,<�\a�<
ॹaᐿaॹ�\ᐿπ,✅ᐿ"<✅✅a	�ॹ	<π;�ॹ\ᐿ;✅
ॹᐿππ
ᐿ
ᐿaπ\
π
π
π;ॹ✅
;ॹ,�
π
�,
ᐿ✅
<�ᐿ""✅,,"
<
✅
<\ॹ
ॹ�;
,	�;,π<
✅

,
ॹ✅π
,
✅	,�<
π	;aπ
<a<
	π


<ᐿπaπ\�"<✅\a,✅
✅
<""



\

";
"✅ππ✅�	�ᐿ	ᐿ\
ᐿπ✅	ॹ<π	a"✅	,ॹa✅ᐿ;\
<ॹ\
<"π\\ᐿ
✅
ᐿ
,


<aᐿ;ᐿ;ᐿ
\ππ\"✅
\a
	πa<
✅\π<ॹ,	;<aaaπॹᐿaॹaॹ�,"	,ॹ;\<✅a
ᐿ"
π\aᐿ�ᐿ<ॹ;\<ᐿ
ᐿ
"aᐿᐿπ,"
,<
<<,ᐿᐿa,
ππ�,✅;�
<	
	<aॹ	ᐿ
"ॹᐿ	✅✅�ॹ;;<�	,


	a"\<
a;	"
π<πॹ
<
✅ᐿॹ✅�<,;✅"
<�π<✅<<✅\;
"


π",a""<�	\πॹ
	aॹᐿ	πॹ,
✅

ᐿ;	\<	ᐿ

�"ॹ<

ᐿ
�

πᐿ;
ॹ
"π<"

	ᐿ	,ॹ✅�ᐿ✅	ᐿ,ॹ✅;;�
✅ᐿ�
πa;\,✅ॹ<ᐿ
π
"
;a	\π
<

ᐿ<<ᐿ"
,
"ॹπaᐿπ��
�ᐿॹ,
a

	
,π
�,<ॹ,<
<�✅ᐿ
ॹ<\<✅ॹ"
ॹ

✅"
π
��<,	a
ॹπ
ᐿॹ✅;
ॹ	
ᐿ�ᐿ
	ᐿ,
π<a"ॹ\aa
ॹ
π', '\x158fe87f5cf3dff06e50dbd3e81b2242314ba86c2b962f6c0b9e0e91a04496c04af1a1cda0d2cc8305e3e23f4554e89b8200e5b01a8e135a75fdf281775eb7bd48b8e4079cfd997bb422e5519c178597f7c38b620fffb02d766d4fe1fbc3f3ab30a005751cb07b42ea6d70bd8f993f870fb265e3d8bf324c4e0317a79fd30f15240249d2d7045219339ddd587f0141ccde60506d3adb65fda607f86988a7eeacd3b8bf328479cd0ae65d4c29cad96078b41b7ce813821a282f2a2033604ae1d9b0e641644e212dd9');
INSERT INTO public.simple VALUES (107, ';,	""
\<a<πa;\;	\<\a✅	✅ॹ	�✅	
\<ॹ
	ॹ	
✅
,<\<�
ᐿπ
"ᐿ";,�	;\"
ᐿ	"ᐿ	;",;
�	
π�
"ᐿππ	,�aa
"
a\�<\ॹ;

,\
		ᐿ✅ॹ	<�aπ"ᐿ\"a
a
��;a<\;
ॹ	π�"
π
"\
;�a,\"
a;<\
a
,\ॹ

\	ॹ
,	;a"π�;

"	
	ᐿ
��	✅π<✅�aॹ	<
�\;,\π
""ॹa;�;


;πaπ�ॹ	aॹ,
"	
�	
ᐿ

a;"ॹπ,	ॹ
\aᐿᐿ
✅
"ᐿa;aa,ॹ	
""✅\	;ॹ;πॹॹ�,π;


π
✅�
�
	✅✅aॹ
<",π✅ॹ�,a;
πᐿ"
,π
ॹ<πaॹ<ᐿॹᐿ	✅<aᐿᐿ

	ॹ
	
ᐿ
\


ᐿ;\�ᐿ	"a;"
ॹa
ᐿ
ᐿॹ,
	�;π"a�,

ᐿ
✅<
\,
		ॹ,
;<
	�ॹॹॹ✅"aॹπ	ᐿπ

aπ
ॹ,"
"�
ᐿ\

�;;	"a✅<,
�
�
aॹπ�	�

"a,,;ॹ✅
ॹ;\�
ᐿπ�\;ॹ<	ᐿ	"\;ᐿ
π<
	;\
,π,�a;
ॹ;	,"ॹa;✅
	,
ॹ�ॹᐿ✅,"
aa✅
π		✅	��
a;✅\";ᐿॹॹ
ᐿπ
✅✅"""ॹ	ॹᐿ
\
π"

ॹᐿ;�

ॹ,✅
<
π
ॹ\
ᐿॹ
ॹ;π<
π✅a<,;
	π✅	



";π�✅ॹॹᐿ	,<a";✅a	,
aᐿ
	,,
✅

✅
<✅✅
\ᐿπ<ᐿ
,;
✅"ᐿ
;ᐿ,✅<a	a"a�;
\ॹᐿ"a�	;"<π
INSERT INTO public.simple VALUES (108, '	"ᐿ;
π"�\
✅π\\

a
a<
	ॹπ✅	✅;a�✅,

;
	<
a,
"<ᐿ

ᐿ

�<�<"	aπ,✅;\�;
;"
�<	,;✅ᐿπ\
ॹ;a	✅�","
	,"��
✅

<
✅"π\,�;
✅

<,;<
a
";,<✅aa<�"<a�
	<		�;,
�
�""\✅<,,πॹ;aa",ॹ✅ᐿ";
π<"a
,ॹ
ॹ
✅π;ᐿa";
ॹ
ππ,ॹ\	�
	a�	;a�<	<ॹ;a;,ॹ\aॹa	"�π�\,\ᐿ
a;π\<	"
\a		�;π

✅a,πᐿ;�;�,	
	
ॹ\


a	<,
\
"✅
\ᐿ�<ᐿ�
	π�ᐿ✅	
,\π\\\π,	✅ᐿ✅
a,aa<�aa"\
\✅ᐿ"�"<�
"	

	;ॹ

	π
ॹ
ᐿ\ॹ	
	�\"✅	a��,✅<
;ॹ
π	
;π;;ᐿ

"ᐿॹa,πॹ
✅\ᐿ
ॹॹa<;aᐿ";ᐿ\		;aπ\✅πॹ
,�
πa
,<;<✅✅a

ॹॹॹॹ,	π
✅�
ᐿ"a"ᐿ<ᐿ,✅;\;π	<<
,
<ᐿ
	�
ॹᐿᐿ	a

�,
,✅	<<
�"	
�ᐿॹ

		✅;<a
ॹ,✅
,,ᐿ\✅a;;,�a,ॹॹπ<�<a
"π
\<�
ॹ"<π";"�;\,ᐿ"
<,<ᐿa
<;�
\,ππa"ॹॹ;
a"ॹa;",�


ॹ
;
�ॹ<;�\


�;;
	<
\<ॹ<<;,;π	\\ᐿ

	,<
a
;
ᐿ

	ᐿ<	ॹ"ᐿ
<<	a

✅		\
\ᐿ

✅"ॹ
"ᐿ
ᐿa�π✅✅
ॹᐿ		
	πॹ
π	ᐿॹ;\<a	,aॹ
\
	ᐿॹ<"��<a
INSERT INTO public.simple VALUES (109, '✅,<ᐿ

πॹ�

ॹ�ॹॹ<<�
ᐿ	;ॹ
�
	;ᐿ✅\�"<"<
ᐿ,	

;ᐿ\
<ᐿॹ
<aa\;"✅✅
	\,,
�ॹa
"✅\<�
πॹᐿa
ᐿ<✅
✅;
ᐿ
ॹॹ�<,	π,a	✅
ॹ<


aॹ\✅<
ॹ

<✅,a;\	
✅"a
a�
"�
�ᐿπ��
ᐿ✅
,ᐿ�;�
	a;""�ᐿ

,πᐿ,ᐿ�ᐿ✅
a"π,;
\	\,<<ᐿ�
✅ॹ,
a,;
���π
"<;a<✅

��ᐿ
",	;
"ॹ✅;ॹ
�a��a,πॹπᐿ
�;ᐿa	;ᐿ<	

"
a"

ॹ✅

"π\a<✅
π\	"✅
✅π

ॹᐿ✅\
ᐿ�
✅"
π	ᐿ
;ॹॹ"ॹπ�a<
\,✅
π\aॹ
,\ᐿa,,ᐿ<ᐿ,✅a<
,
a
a,ᐿ<ॹaπ""✅,✅π✅	ॹ;

"ॹ	<✅"
π
ππ�\ॹa\\�	ॹ;,π	,;,ॹaπ

a�\ॹ✅π"	�a\


ᐿᐿ
"ᐿ\
,

ॹ<ॹ
a"aᐿ\\✅�
"✅	<✅ॹ�	✅,	ᐿ
a
;a
ᐿ;ॹ	;π
	ᐿॹ"�;\
,;
	""aᐿ	ॹ�a\aa
<✅"a✅	\ॹ��"<"a,�✅\ॹ
;
✅

;✅
✅π;πᐿ
"
ॹ;
πᐿa✅	✅�
"
�

"

,;
�\ॹ
,
ॹπ;	<aॹॹ;✅		
�	\
,


\<a;
ᐿπᐿॹaπᐿॹ

,
✅	π"
ᐿπa
,

;"

πᐿ�"<,;;�aᐿ;,\a<ᐿ,✅�<;ᐿ✅✅ॹ"
π
,

a"ॹ<<"
✅ᐿ✅�\aॹ\✅

<

�
;
\ᐿaᐿ<<a�
a
,ॹa	,;"<,
"<✅ᐿ
<aᐿ✅

\ॹπ
,
\
	;�π�<aᐿ\	"

', '\xa6fe18955d8177702fc91d5829f4464feef626abe35e0a4ff22575ba7dc2e583259865b82a6b975a76c3aa8119b3a3a72c369836771e1bc52f01797838894c0ff61f190400e00fc0acfad9abd67e485f7470aa7f841f6d18f9d8eba9234daa2071283413e05c0d8be8197e6c201eda08f413e610bf947684ec3b465f40fdc9869ee29c5b74ed20bfb692ff8518faf01335fdbc5c21c35e8f51f4371f48c3b34b84291599ec1fe67db0e51e084756f5c81d7cbff7d1a71e15f5a5ae0a5ea6d721e5e442ed09bb961a');


--
-- Name: second second_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.second
    ADD CONSTRAINT second_pkey PRIMARY KEY (i);


--
-- Name: simple simple_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.simple
    ADD CONSTRAINT simple_pkey PRIMARY KEY (i);


--
-- Name: simple_b_s_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX simple_b_s_idx ON public.simple USING btree (b, s);


--
-- Name: simple_s_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX simple_s_idx ON public.simple USING btree (s);


--
-- PostgreSQL database dump complete
--
