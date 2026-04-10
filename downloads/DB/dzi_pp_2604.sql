-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране: 10 апр 2026 в 16:44
-- Версия на сървъра: 10.4.32-MariaDB
-- Версия на PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данни: `dzi_pp_2604`
--

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add document', 7, 'add_document'),
(26, 'Can change document', 7, 'change_document'),
(27, 'Can delete document', 7, 'delete_document'),
(28, 'Can view document', 7, 'view_document');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$GcvyhJMAnEBzV0YfQotcO3$JtVll7lKCxsapkzMwXJHXJTqFNNsVF9v+8PqdxXXHcI=', '2026-04-09 22:53:44.524347', 1, 'user_26', '', '', '', 1, 1, '2026-02-08 22:16:04.702728');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'document'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-02-08 22:15:23.353555'),
(2, 'auth', '0001_initial', '2026-02-08 22:15:23.826419'),
(3, 'admin', '0001_initial', '2026-02-08 22:15:23.929936'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-02-08 22:15:23.940975'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-02-08 22:15:23.949970'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-02-08 22:15:24.004649'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-02-08 22:15:24.047957'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-02-08 22:15:24.058469'),
(9, 'auth', '0004_alter_user_username_opts', '2026-02-08 22:15:24.065993'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-02-08 22:15:24.099984'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-02-08 22:15:24.102986'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-02-08 22:15:24.109502'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-02-08 22:15:24.120014'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-02-08 22:15:24.131540'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-02-08 22:15:24.144087'),
(16, 'auth', '0011_update_proxy_permissions', '2026-02-08 22:15:24.151094'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-02-08 22:15:24.162127'),
(18, 'sessions', '0001_initial', '2026-02-08 22:15:24.189677'),
(19, 'main', '0001_initial', '2026-04-09 18:55:23.613792');

-- --------------------------------------------------------

--
-- Структура на таблица `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('z07sogqw39wt61xvm7tvf7zw98p8wupr', '.eJxVjEEOwiAQAP_C2ZCyCxQ8eu8bCLAgVQNJaU_GvxuSHvQ6M5k3c_7Yizt62txK7MoEu_yy4OMz1SHo4eu98djqvq2Bj4SftvOlUXrdzvZvUHwvY2sl5IRGRYMkEYSabAaRCQUkA0LMSoMKUqugASFSsKQNTCgB1aw9-3wBqHQ2Gg:1wAyFs:I26gB-KwXrKrJSc61qoSDpJWxLq_VMs0Vr745JLClfg', '2026-04-23 22:53:44.526439');

-- --------------------------------------------------------

--
-- Структура на таблица `main_document`
--

CREATE TABLE `main_document` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `extracted_text` longtext DEFAULT NULL,
  `uploaded_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_document`
--

INSERT INTO `main_document` (`id`, `image`, `extracted_text`, `uploaded_at`) VALUES
(1, 'documents/Untitled_pZNrpub.jpg', 'ystem check identified no issues (@ silenced).\narch 17, 2026 - 13:13:00\nDjango version 4.2.18, using settings \'DP.settings\n\nStarting development server at http://127.0.0.1:8000/\nQuit the server with CTRL-BREAK\n\n[17/Mar/2026 13:13:07] \"GET / HTTP/1.1\" 200 5442\n\n', '2026-04-09 18:56:14.696625'),
(2, 'documents/Untitled_6qSIn6E.jpg', 'ystem check identified no issues (@ silenced).\narch 17, 2026 - 13:13:00\nDjango version 4.2.18, using settings \'DP.settings\n\nStarting development server at http://127.0.0.1:8000/\nQuit the server with CTRL-BREAK\n\n[17/Mar/2026 13:13:07] \"GET / HTTP/1.1\" 200 5442\n\n', '2026-04-09 18:56:35.371493'),
(3, 'documents/Untitled_qE0MoVz.jpg', 'ystem check identified no issues (@ silenced).\narch 17, 2026 - 13:13:00\nDjango version 4.2.18, using settings \'DP.settings\n\nStarting development server at http://127.0.0.1:8000/\nQuit the server with CTRL-BREAK\n\n[17/Mar/2026 13:13:07] \"GET / HTTP/1.1\" 200 5442\n\n', '2026-04-09 18:56:41.850708'),
(4, 'documents/Untitled_1fKbSj9.jpg', 'ystem check identified no issues (@ silenced).\narch 17, 2026 - 13:13:00\nDjango version 4.2.18, using settings \'DP.settings\n\nStarting development server at http://127.0.0.1:8000/\nQuit the server with CTRL-BREAK\n\n[17/Mar/2026 13:13:07] \"GET / HTTP/1.1\" 200 5442\n\n', '2026-04-09 18:56:42.666167'),
(5, 'documents/img_xq9E3Qz.png', 'OGeminisirrov O\n\n3. Kopexuua BbB Bana HTML / Vue,\n\nBoe dalina, kpgeTo e Vue MakeTeT, TpAGBa Aa NpomeHuTe src Ha NZ06pAxKeHNETO Aa COUN KEM\n\ndesign.gallery image , BMECTO KbM CTapoTo design. image .\n\nHamepere Tosm pea 8 HTML-a\n\n<img :src=\"design.image\" :alt=\"design.title” width=\"1e0\">\n\nViro npomenere Ha\n\n<img :src=\"design.gellery image” :al \"160\">\n\njesign.title” widtl\n\nKakBo cnegBa?\n\nCera npe3 Aamui naHena ( http: //127.0.@.1:8000/admin/ ) 3a BceKu AV3aiiH We KauBaTe NO\naba ¢aiina: eavH npeactaBuTeneH 3a NoTpebuTens Mu equ paboTek (npospaueH PNG) 3a\nanropyreMa.\n\nKaxkeTe Mv, KoraTO CTe OTOBM C Te3n KOpeKLMH HM CTe KauMNAM MoHe 1-2 TecToBN AusaiiHa C nO\nAbe CHUMKM, 38 a NPeMMHeM KbM Hali-BarxkHaTa UaCT Cnopeg 3aMaHveTo: API-To 3a KauBaHe Ha\npbka 1 KommorppHoTo spere (Landmarks + Affine transforms + Alpha blending)!\n\n4 Cpasnn cGPT-4o |v\n\nc«\n\n', '2026-04-09 18:57:00.859388'),
(6, 'documents/IMG_20180127_183107.jpg', '', '2026-04-09 18:57:32.711509'),
(7, 'documents/IMG_20180127_183107_JV8GOR9.jpg', '', '2026-04-09 18:59:41.417177'),
(8, 'documents/IMG_20180127_183107_GViyqSR.jpg', '', '2026-04-09 19:05:16.324105'),
(9, 'documents/Untitled_NKXmFJv.jpg', 'ystem check identified no issues (@ silenced).\narch 17, 2026 - 13:13:00\nDjango version 4.2.18, using settings \'DP.settings\n\nStarting development server at http://127.0.0.1:8000/\nQuit the server with CTRL-BREAK\n\n[17/Mar/2026 13:13:07] \"GET / HTTP/1.1\" 200 5442\n\n', '2026-04-09 19:06:04.008420'),
(10, 'documents/img_VNu8AoL.png', 'OGeminisirrov O\n\n3. Kopexuua BbB Bana HTML / Vue,\n\nBoe dalina, kpgeTo e Vue MakeTeT, TpAGBa Aa NpomeHuTe src Ha NZ06pAxKeHNETO Aa COUN KEM\n\ndesign.gallery image , BMECTO KbM CTapoTo design. image .\n\nHamepere Tosm pea 8 HTML-a\n\n<img :src=\"design.image\" :alt=\"design.title” width=\"1e0\">\n\nViro npomenere Ha\n\n<img :src=\"design.gellery image” :al \"160\">\n\njesign.title” widtl\n\nKakBo cnegBa?\n\nCera npe3 Aamui naHena ( http: //127.0.@.1:8000/admin/ ) 3a BceKu AV3aiiH We KauBaTe NO\naba ¢aiina: eavH npeactaBuTeneH 3a NoTpebuTens Mu equ paboTek (npospaueH PNG) 3a\nanropyreMa.\n\nKaxkeTe Mv, KoraTO CTe OTOBM C Te3n KOpeKLMH HM CTe KauMNAM MoHe 1-2 TecToBN AusaiiHa C nO\nAbe CHUMKM, 38 a NPeMMHeM KbM Hali-BarxkHaTa UaCT Cnopeg 3aMaHveTo: API-To 3a KauBaHe Ha\npbka 1 KommorppHoTo spere (Landmarks + Affine transforms + Alpha blending)!\n\n4 Cpasnn cGPT-4o |v\n\nc«\n\n', '2026-04-09 19:06:21.567329'),
(11, 'documents/Untitled_1g7cXqv.jpg', 'ystem check identified no issues (@ silenced).\narch 17, 2026 - 13:13:00\nDjango version 4.2.18, using settings \'DP.settings\n\nStarting development server at http://127.0.0.1:8000/\nQuit the server with CTRL-BREAK\n\n[17/Mar/2026 13:13:07] \"GET / HTTP/1.1\" 200 5442\n\n', '2026-04-09 19:07:35.342392'),
(12, 'documents/img_Dt0L9nr.png', '3. Kopexuna aes sawna HTML / Vue js\nKakno caeasa?\nphere commoripes ts tends (aacretks 6 Atine Gansleens + lpr b ending?\ne : » @ og\n', '2026-04-09 20:33:33.667057'),
(13, 'documents/img_VoUwPGn.png', '3. Корекция във вашия HTML / Уие.5\nКакво следва?\nръва мн commoripes ts tends Г. алататку « Ат (тапети + Ара b ending?\ne и те og\n', '2026-04-09 20:49:12.125598'),
(14, 'documents/Untitled_Ywxrhcy.jpg', '', '2026-04-09 20:50:24.024875'),
(15, 'documents/Untitled_ftHs8iM.jpg', '', '2026-04-09 20:50:33.158661'),
(16, 'documents/Untitled_LWA7eoX.jpg', '', '2026-04-09 20:57:33.165214'),
(17, 'documents/img_Io3s86w.png', '3. Корекция във вашия HTML / Уие.5\nКакво следва?\nръва мн commoripes ts tends Г. алататку « Ат (тапети + Ара b ending?\ne и те og\n', '2026-04-09 20:57:46.461278'),
(18, 'documents/img_tnYp422.png', '3. Корекция във вашия HTML / Уие 5\n\n-\n\nм\n\nга\n\nА\n\nbs\n\nА\n\ntas\n\nма\n\nА\n\n-\n\n-\n\nat\n\nbe\n\nipa села\n\nА\n\nte\n\nire\n\nLs\n\nспа\n\nalte\n\nа\n\nае\n\nire\n\nLs\n\neuler\n\nпар\n\nа\n\nви\n\nам\n\nКакво следва?\n\n.\n\n,\n\nА\n\nn\n\n2\n\n:\n\nve\n\nAne Gaara кен\n\n5\n\n“\n\nsoe\n\nЖ\n\n5\n\nЩЕ\n\n,\n\n.\n\n-\n\nbe\n\n.\n\n”\n\nК\n\nre\n\n.\n\n“\n\nbe\n\nie\n\n.\n\nкаже\n\n-\n\nА\n\nя\n\nАР\n\nто\n\nwe eat\n\nne\n\nae бала\n\npreaw «\n\nтър\n\nКо « Ати transgenes « Alpag be\n\nng?\n\n“\n\n:\n\n.\n\n“\n\nPe\n\n@\n\n<\n\nза\n', '2026-04-09 20:58:23.649259'),
(19, 'documents/Untitled_4CsCn4L.jpg', '', '2026-04-09 20:58:44.586716'),
(20, 'documents/Untitled_tZvnEMP.jpg', '', '2026-04-09 20:58:46.589404'),
(21, 'documents/Untitled_7ZvydtW.jpg', 'System check identified no issues (0 silenced)\nMarch 17, 2026 13:13:60\n\nOjango version 4.2.18, using settings \'OP.settings’\'\nStarting development server at http 12 1\nQuit the server with CTRL-BREAK\n\n(17/Mar/2026 13:13:07) “GET / HTTP/1.1\" 200 5442\n', '2026-04-09 20:59:41.221270'),
(22, 'documents/img_ZPEcfuf.png', '3. Корекция във вашия HTML / Vuejs\nВъв файла. където в Vue макетът, трябва да промичките те на изображението да сочи «към\nбеба gallery iauge , ме 10 към старото design, ewe\nНамерете толи ред в НТМЕ а\nВЕТ АА wteth-niae >\nИ го промените ма\n<img го design gallery image” са дела titte™ ма ат аа\nКакво следва?\nCora през Админ панела ( мтр (7127 в.в.1 нава/азвали ) за всеки дизайн ща качкате по\nдва файла един предсънителен а потребителя и един работен (про рани РМС) за\nзлгоратъма\nКажете ми, «снгато сте готови с теди корекции и сте кая поне 1-2 теч поти диззина с по\nARE скичаки. за да премине към най-важната част според заданието. API-10 за качване на\nръка и компютърното зрение (Landmarks « Affine transforms « Alpha blending)!\n(geen с СТ do\nac «&\nOGerasror @ on\nхе овес >\n', '2026-04-09 20:59:51.546381'),
(23, 'documents/img_5nKu88e.png', '3. Корекция във вашия HTML / Vuejs\n\nБък файла къдета © Vue макетът, трабва да промени\n\nее\n\nма изображението да сочи към\n\nGevign gallery ез\n\npec TO към старото й\n\nмл ie.\n\nНамерете толи pean HTM\n\n“\n\nign ims\n\nau\n\nПак title” wieth-\"18a7>\n\nVico променете ма\n\nи\n\nи\n\nnee design gallery 4\n\nalt—desiga.tit\n\nwigth-\"1ae7>\n\nКакво следва?\n\nCora през Админ панела (atte\n\n(7227.08.82 BBB / ade ins) всеки дизаин ща\" качвате по\n\nдва файла един представителен за потре\n\nпеля и един\n\nн (прозрачен PNG\n\nма\n\nалгоритъма\n\nКаж\n\n1\n\nе ми, когато сте готови с тели корекции и сте KEAN TORE\n\n2 тестови дизаина с\n\nдве снимки. та да премине към най-важната част според\n\nдан\n\nто API-10 за качи\n\nме ма\n\nръка и компютърното зрение (Landmarks « Affine transforms « Alpha blending)!\n\nhoe\n\nат 4\n\nе\n\n“\n\nO Gort Pov\n\noo\n\nх\n\nе\n\noe\n', '2026-04-09 21:01:30.929618'),
(24, 'documents/img_1.png', 'В практическата част разработих уеб базирано приложение „Дигитален\n\nскенер”, което позволява качване на изображение на документ и\n\nизвличане на текст OT него чрез OCR технология. За бекенд използвах\n\nPython с Django и Django REST Framework, а за фронтенд - Vue.js чрез СОМи\n\nАжю5 за комуникация със сървъра\n', '2026-04-09 21:14:53.649140'),
(25, 'documents/img_2.png', 'Os\n\nom\n\nчаст\n\nлом\n\nформулира ce\n\nCATA ма ди\n\nроскт и задачите,\n\nоито грябва да\n\nбъдат решеми, за да сс\n\nостигис тази цел Съдържа: описание и\n\nмали ма известните:\n\nамис\n\nумсита\n\nия\n\nоло\n\nме\n\nи\n\nия за ко\n\nта\n\nи ар\n\nа избора ма TEX\n\nалгоритми\n\nрограмни решк\n\nper\n\nразработка:\n\nри\n\nосите н\n\nди\n\nми\n\nя проск\n\nтис\n\n2\n\nста м\n\nизпълмс:\n\nte\n\nоставен\n\nete зада\n', '2026-04-09 21:16:50.924925'),
(26, 'documents/img_2_QhkLyF5.png', 'Os\n\nom\n\nчаст\n\nлом\n\nформулира ce\n\nCATA ма ди\n\nроскт и задачите,\n\nоито грябва да\n\nбъдат решеми, за да сс\n\nостигис тази цел Съдържа: описание и\n\nмали ма известните:\n\nамис\n\nумсита\n\nия\n\nоло\n\nме\n\nи\n\nия за ко\n\nта\n\nи ар\n\nа избора ма TEX\n\nалгоритми\n\nрограмни решк\n\nper\n\nразработка:\n\nри\n\nосите н\n\nди\n\nми\n\nя проск\n\nтис\n\n2\n\nста м\n\nизпълмс:\n\nte\n\nоставен\n\nete зада\n', '2026-04-09 21:16:58.922328'),
(27, 'documents/Untitled_UT1QwTq.jpg', 'stem check\n\nent\n\nss\n\nes\n\nence\n\nм\n\n03\n\nvers\n\nsett\n\n‘DP.set\n\nart\n\npve\n\nment\n\nserv\n\nat\n\nw\n\n0\n\n>\n\nMar/2\n\n2)\n\nET\n\nHTTP/1\n\n42\n', '2026-04-09 21:17:19.849131'),
(28, 'documents/Untitled_gmqBD54.jpg', 'stem check\n\nent\n\nss\n\nes\n\nence\n\nм\n\n03\n\nvers\n\nsett\n\n‘DP.set\n\nart\n\npve\n\nment\n\nserv\n\nat\n\nw\n\n0\n\n>\n\nMar/2\n\n2)\n\nET\n\nHTTP/1\n\n42\n', '2026-04-09 21:17:39.424756'),
(29, 'documents/img_qRgv56p.png', '3. Корекция във вашия HTML / Vuejs\n\nБък файла къдета © Vue макетът, трабва да промени\n\nее\n\nма изображението да сочи към\n\nGevign gallery ез\n\npec TO към старото й\n\nмл ie.\n\nНамерете толи pean HTM\n\n“\n\nign ims\n\nau\n\nПак title” wieth-\"18a7>\n\nVico променете ма\n\nи\n\nи\n\nnee design gallery 4\n\nalt—desiga.tit\n\nwigth-\"1ae7>\n\nКакво следва?\n\nCora през Админ панела (atte\n\n(7227.08.82 BBB / ade ins) всеки дизаин ща\" качвате по\n\nдва файла един представителен за потре\n\nпеля и един\n\nн (прозрачен PNG\n\nма\n\nалгоритъма\n\nКаж\n\n1\n\nе ми, когато сте готови с тели корекции и сте KEAN TORE\n\n2 тестови дизаина с\n\nдве снимки. та да премине към най-важната част според\n\nдан\n\nто API-10 за качи\n\nме ма\n\nръка и компютърното зрение (Landmarks « Affine transforms « Alpha blending)!\n\nhoe\n\nат 4\n\nе\n\n“\n\nO Gort Pov\n\noo\n\nх\n\nе\n\noe\n', '2026-04-09 21:17:49.547995'),
(30, 'documents/Untitled_EMkIlNS.jpg', 'stem check\n\nent\n\nss\n\nes\n\nence\n\nм\n\n03\n\nvers\n\nsett\n\n‘DP.set\n\nart\n\npve\n\nment\n\nserv\n\nat\n\nw\n\n0\n\n>\n\nMar/2\n\n2)\n\nET\n\nHTTP/1\n\n42\n', '2026-04-09 21:18:18.651888'),
(31, 'documents/img_0bg2AuS.png', '3. Корекция във вашия HTML / Vuejs\n\nБък файла къдета © Vue макетът, трабва да промени\n\nее\n\nма изображението да сочи към\n\nGevign gallery ез\n\npec TO към старото й\n\nмл ie.\n\nНамерете толи pean HTM\n\n“\n\nign ims\n\nau\n\nПак title” wieth-\"18a7>\n\nVico променете ма\n\nи\n\nи\n\nnee design gallery 4\n\nalt—desiga.tit\n\nwigth-\"1ae7>\n\nКакво следва?\n\nCora през Админ панела (atte\n\n(7227.08.82 BBB / ade ins) всеки дизаин ща\" качвате по\n\nдва файла един представителен за потре\n\nпеля и един\n\nн (прозрачен PNG\n\nма\n\nалгоритъма\n\nКаж\n\n1\n\nе ми, когато сте готови с тели корекции и сте KEAN TORE\n\n2 тестови дизаина с\n\nдве снимки. та да премине към най-важната част според\n\nдан\n\nто API-10 за качи\n\nме ма\n\nръка и компютърното зрение (Landmarks « Affine transforms « Alpha blending)!\n\nhoe\n\nат 4\n\nе\n\n“\n\nO Gort Pov\n\noo\n\nх\n\nе\n\noe\n', '2026-04-09 21:18:38.953287'),
(32, 'documents/Untitled_usdeBkE.jpg', 'System check identified no issues (0 silenced)\nMarch 17, 2026 13:13:60\n\nOjango version 4.2.18, using settings \'OP.settings’\'\nStarting development server at http 12 1\nQuit the server with CTRL-BREAK\n\n(17/Mar/2026 13:13:07) “GET / HTTP/1.1\" 200 5442\n', '2026-04-09 21:19:36.547389'),
(33, 'documents/img_2_fYehXNV.png', 'Осмовма част формулира ce целта ма дипломния проскт и задачите, които грябва да\nбъдат решени, за да сс постите тази цел Съдържа: описание и амалит ма известните; описание\nи аргумсктация ма избора ма тсхмологии, алгоритми и програмни решения за конкретната\nразработка: приносите ма дипломмия проскт и стспсита ма изпълнсмис ма поставените задачи.\n', '2026-04-09 21:19:47.344265'),
(34, 'documents/img_7GaOwWN.png', '3. Корекция във вашия HTML / Vuejs\nВъв файла. където в Vue макетът, трябва да промичките те на изображението да сочи «към\nбеба gallery iauge , ме 10 към старото design, ewe\nНамерете толи ред в НТМЕ а\nВЕТ АА wteth-niae >\nИ го промените ма\n<img го design gallery image” са дела titte™ ма ат аа\nКакво следва?\nCora през Админ панела ( мтр (7127 в.в.1 нава/азвали ) за всеки дизайн ща качкате по\nдва файла един предсънителен а потребителя и един работен (про рани РМС) за\nзлгоратъма\nКажете ми, «снгато сте готови с теди корекции и сте кая поне 1-2 теч поти диззина с по\nARE скичаки. за да премине към най-важната част според заданието. API-10 за качване на\nръка и компютърното зрение (Landmarks « Affine transforms « Alpha blending)!\n(geen с СТ do\nac «&\nOGerasror @ on\nхе овес >\n', '2026-04-09 21:20:15.882492'),
(35, 'documents/img_2_btQEy4Q.png', 'Основна част - формулира се целта на дипломния проект и задачите. които тряова да\nОоъдат решени. за да се постигне тази цел. Съдържа: описание и анализ на известните: описание\nи аргументация на избора на технологии. алгоритми и програмни решения за конкретната\nразработка: приносите на дипломния проект и степента на изпълнение на поставените задачи.', '2026-04-09 21:28:47.897744'),
(36, 'documents/Untitled_M6ZHPmH.jpg', 'System check identified no issues (0 silenced).\nMarch 17, 2026 - 13:13:00\nDjango version 4.2.18, using settings \'DP.settings\'\n\nStarting development server at http://127.% 1:15:\nQuit the server with CTRL-BREAK.\n\n[17/Mar/2026 13:13:07] \"GET / HTTP/1.1\" 200 5442', '2026-04-09 21:34:57.623086'),
(37, 'documents/img_2_a0nfd26.png', 'Основна част - формулира се целта на дипломния проект и задачите. които тряова да\nОоъдат решени. за да се постигне тази цел. Съдържа: описание и анализ на известните: описание\nи аргументация на избора на технологии. алгоритми и програмни решения за конкретната\nразработка: приносите на дипломния проект и степента на изпълнение на поставените задачи.', '2026-04-09 21:35:31.727822'),
(38, 'documents/img_3.png', '1. Тема:\n\nОптическо разпознаване на символи и дигитализация. Разработване на приложение\n„Дигитален скенер“. при което потребителят качва снимка на документ. а системата извлича\nтекста чрез OCR и го записва в база данни и/или го предлага за редакция в HTML форма.', '2026-04-09 21:36:45.565707'),
(39, 'documents/img_slXjzUo.png', '3. Корекция във вашия HTML / УМие.)5\n\nВъв файла, където е Vue макетът, трябва да промените src на изображението да сочи към\ndesign.gallery_image , вместо към старото design.image .\n\nНамерете този ред в HTML-a:\n\n<img :5гс«\"де53 ап. image” :alte\"design.title” width=\"100\">\n\nИ ro npomenrete на:\n\n<img :src=\"design.gallery_image” :alt=\"design.title” width=\"100\">\n\nКакво следва?\n\nСега през Админ панела ( http: //127.06.е.1:8600/зат:п/ ) за всеки дизайн ще качвате по\nдва файла: един представителен за потребителя и един работен (прозрачен РМС) за\nалгоритъма.\n\nКажете ми, когато сте готови с тези корекции и сте качили поне 1-2 тестови дизайна с по\nдве снимки, за да преминем към най-важната част според заданието: API-To за качване на\nръка и компютърното зрение (Landmarks + Affine transforms + Alpha blending)!\n\n+? Сравни с GPT-40 v\n\nбо C 6\n\n@Geminiziprov G@ оо\n\nпо Our >', '2026-04-09 21:42:52.378032'),
(40, 'documents/img_3_kpywFRh.png', '1. Тема:\n\nОптическо разпознаване на символи и дигитализация. Разработване на приложение\n„Дигитален скенер“, при което потребителят качва снимка на документ, а системата извлича\nтекста чрез OCR и го записва в база данни и/или го предлага за редакция в HTML форма.', '2026-04-09 21:43:50.253886'),
(41, 'documents/img_bCZtb50.png', '3. Корекция във вашия HTML / УМие.)5\n\nВъв файла, където е Vue макетът, трябва да промените src на изображението да сочи към design.gallery_image, вместо към старото design.image.\n\nНамерете този ред в HTML-a:\n\n<img:5гс«\"де53 ап. image”:alte\"design.title” width=\"100\">\n\nИ ro npomenrete на:\n\n<img:src=\"design.gallery_image”:alt=\"design.title” width=\"100\">\n\nКакво следва?\n\nСега през Админ панела ( http: //127.06.е.1:8600/зат:п/ ) за всеки дизайн ще качвате по два файла: един представителен за потребителя и един работен (прозрачен РМС) за алгоритъма.\n\nКажете ми, когато сте готови с тези корекции и сте качили поне 1-2 тестови дизайна с по две снимки, за да преминем към най-важната част според заданието: API-To за качване на ръка и компютърното зрение (Landmarks + Affine transforms + Alpha blending)!\n\n+? Сравни с GPT-40 v\n\nбо C 6\n\n@Geminiziprov G@ оо\n\nпо Our >', '2026-04-09 21:54:31.865155'),
(42, 'documents/img_eEN60JV.png', '3. Корекция във вашия HTML / УМие.)5\n\nВъв файла, където е Vue макетът, трябва да промените src на изображението да сочи към design.gallery_image, вместо към старото design.image.\n\nНамерете този ред в HTML-a:\n\n<img:5гс«\"де53 ап. image”:alte\"design.title” width=\"100\">\n\nИ ro npomenrete на:\n\n<img:src=\"design.gallery_image”:alt=\"design.title” width=\"100\">\n\nКакво следва?\n\nСега през Админ панела (http: //127.06.е.1:8600/зат:п/) за всеки дизайн ще качвате по два файла: един представителен за потребителя и един работен (прозрачен РМС) за алгоритъма.\n\nКажете ми, когато сте готови с тези корекции и сте качили поне 1-2 тестови дизайна с по две снимки, за да преминем към най-важната част според заданието: API-To за качване на ръка и компютърното зрение (Landmarks + Affine transforms + Alpha blending)!\n\n+? Сравни с GPT-40 v\n\nбо C 6\n\n@Geminiziprov G@ оо\n\nпо Our >', '2026-04-09 21:57:32.884403'),
(43, 'documents/img_3_mUsJdsC.png', '1. Тема:\n\nОптическо разпознаване на символи и дигитализация. Разработване на приложение „Дигитален скенер“, при което потребителят качва снимка на документ, а системата извлича текста чрез OCR и го записва в база данни и/или го предлага за редакция в HTML форма.', '2026-04-09 22:05:42.714850'),
(44, 'documents/img_3_lj5TroC.png', '1. Тема:\n\nОптическо разпознаване на символи и дигитализация. Разработване на приложение „Дигитален скенер“, при което потребителят качва снимка на документ, а системата извлича текста чрез OCR и го записва в база данни и/или го предлага за редакция в HTML форма.', '2026-04-09 22:09:44.716049'),
(45, 'documents/1775772604766663981395526510880.jpg', 'Небилет\n\n5 та таблетки | Небиволол\n\n28 таблетки - Г. лно приложение\n\n| BERLIN-CHEMIE MENARINI', '2026-04-09 22:11:06.442713'),
(46, 'documents/1775772604766663981395526510880_bddi1n3.jpg', 'Небилет\n\n5 та таблетки | Небиволол\n\n28 таблетки - Г. лно приложение\n\n| BERLIN-CHEMIE MENARINI', '2026-04-09 22:11:12.585273'),
(47, 'documents/img_ak5T4C1.png', '3. Корекция във вашия HTML / УМие.)5\n\nВъв файла, където е Vue макетът, трябва да промените src на изображението да сочи към design.gallery_image, вместо към старото design.image.\n\nНамерете този ред в HTML-a:\n\n<img:5гс«\"де53 ап. image”:alte\"design.title” width=\"100\">\n\nИ ro npomenrete на:\n\n<img:src=\"design.gallery_image”:alt=\"design.title” width=\"100\">\n\nКакво следва?\n\nСега през Админ панела (http: //127.06.е.1:8600/зат:п/) за всеки дизайн ще качвате по два файла: един представителен за потребителя и един работен (прозрачен РМС) за алгоритъма.\n\nКажете ми, когато сте готови с тези корекции и сте качили поне 1-2 тестови дизайна с по две снимки, за да преминем към най-важната част според заданието: API-To за качване на ръка и компютърното зрение (Landmarks + Affine transforms + Alpha blending)!\n\n+? Сравни с GPT-40 v\n\nбо C 6\n\n@Geminiziprov G@ оо\n\nпо Our >', '2026-04-09 22:33:17.710270'),
(48, 'documents/17757740158663900313055000107388.jpg', 'И И NP изт И 12 74? SU) PAGO SD V4 AL\n\nSHNLULLS HMevarory\n\nSHNHOL HOdG MOG\n\nи епифтем енгеидолийа»ж ‘LOML-Ndh войн \"апен) хапох ве иийзлийахж XBL 2 иноу и инакопайано OHOK оп OLHTIMHOHA вн BNEIdE енаед00 BARLOOVOdU LKLOLMh, Md SAHSHOKOO BE BHIDLEGLO евняаилжафо вена OHCU РвЯаенопеИ LBIOLUh A ‘OLMMIMHOHA BH OLOHedHOEed ен eNdogodu и онеаквн\n\n(omedundod) ве eanor/ado иткпохгоп и инееддоонева влепийпн LbYaLAhA ‘eNoOdA BH кваж я и OLUHEIVE OLD аиненеЕ OLOPCHC\n\nен DHEARINKAAELVE и OHVALTTIQOQO PE илеяхон иньиева BAELOLIEN LBL OLHhA ‘eNOdA BH OLHLON 2 OHBEd1AD “OHH\n\nO.LOWOH HUheH Woednoeed и HOO оп вдиеинедХеия и кяв1огоан зкиминА \"иийолийд» иноагегве онголидванойн оп анеяаен:\n\nOHWHPES и BXHOTIOOWRD ве то0нжоиеча каваоогойн и кинзид вяияева авкаиьд. ‘(WAL\'G BH вяин ALOHA оп) ана\n\nOHShHOOUALVE DLUTIMHOHA LO LUANOHEN OLHOW “изоониан PINKME Tod LBISLKh £\n\n‘eLoged eHuMMd ве игой индзииайан и eLoOgeEd ен WLLHGOULe вяввЕ 0.\n\n‘OP. LODHHHTAdLL9 онаичмжафо и пих я BLOQE ве KHAOLOA BABEL LELOLAh A тояиж BHHLeod я QHHBHE oLos\n\n«>. oe 4 y\n\nен зинажокийи 9 excada ияеди o1en “ипойдх итеаяктеаве вас ома,\n\n‘BIOdA BH охоинежаачтчо и BLEGALHAGLO BE OHHOHN #, ate:\n\nel и вхечаа BH.LEdQO LKeeLoOadu BY охипинаь BHEOLOA вавюечо LOE\n\nиа АГ als +t ate ee\n\nМИ ра А. | he aN gg Sa Чеч Й', '2026-04-09 22:34:54.712126'),
(49, 'documents/17757740158663900313055000107388_IkJjE9c.jpg', 'И И NP изт И 12 74? SU) PAGO SD V4 AL\n\nSHNLULLS HMevarory\n\nSHNHOL HOdG MOG\n\nи епифтем енгеидолийа»ж ‘LOML-Ndh войн \"апен) хапох ве иийзлийахж XBL 2 иноу и инакопайано OHOK оп OLHTIMHOHA вн BNEIdE енаед00 BARLOOVOdU LKLOLMh, Md SAHSHOKOO BE BHIDLEGLO евняаилжафо вена OHCU РвЯаенопеИ LBIOLUh A ‘OLMMIMHOHA BH OLOHedHOEed ен eNdogodu и онеаквн\n\n(omedundod) ве eanor/ado иткпохгоп и инееддоонева влепийпн LbYaLAhA ‘eNoOdA BH кваж я и OLUHEIVE OLD аиненеЕ OLOPCHC\n\nен DHEARINKAAELVE и OHVALTTIQOQO PE илеяхон иньиева BAELOLIEN LBL OLHhA ‘eNOdA BH OLHLON 2 OHBEd1AD “OHH\n\nO.LOWOH HUheH Woednoeed и HOO оп вдиеинедХеия и кяв1огоан зкиминА \"иийолийд» иноагегве онголидванойн оп анеяаен:\n\nOHWHPES и BXHOTIOOWRD ве то0нжоиеча каваоогойн и кинзид вяияева авкаиьд. ‘(WAL\'G BH вяин ALOHA оп) ана\n\nOHShHOOUALVE DLUTIMHOHA LO LUANOHEN OLHOW “изоониан PINKME Tod LBISLKh £\n\n‘eLoged eHuMMd ве игой индзииайан и eLoOgeEd ен WLLHGOULe вяввЕ 0.\n\n‘OP. LODHHHTAdLL9 онаичмжафо и пих я BLOQE ве KHAOLOA BABEL LELOLAh A тояиж BHHLeod я QHHBHE oLos\n\n«>. oe 4 y\n\nен зинажокийи 9 excada ияеди o1en “ипойдх итеаяктеаве вас ома,\n\n‘BIOdA BH охоинежаачтчо и BLEGALHAGLO BE OHHOHN #, ate:\n\nel и вхечаа BH.LEdQO LKeeLoOadu BY охипинаь BHEOLOA вавюечо LOE\n\nиа АГ als +t ate ee\n\nМИ ра А. | he aN gg Sa Чеч Й', '2026-04-09 22:34:56.843534'),
(50, 'documents/17757740158663900313055000107388_lhmPxVR.jpg', 'И И NP изт И 12 74? SU) PAGO SD V4 AL\n\nSHNLULLS HMevarory\n\nSHNHOL HOdG MOG\n\nи епифтем енгеидолийа»ж ‘LOML-Ndh войн \"апен) хапох ве иийзлийахж XBL 2 иноу и инакопайано OHOK оп OLHTIMHOHA вн BNEIdE енаед00 BARLOOVOdU LKLOLMh, Md SAHSHOKOO BE BHIDLEGLO евняаилжафо вена OHCU РвЯаенопеИ LBIOLUh A ‘OLMMIMHOHA BH OLOHedHOEed ен eNdogodu и онеаквн\n\n(omedundod) ве eanor/ado иткпохгоп и инееддоонева влепийпн LbYaLAhA ‘eNoOdA BH кваж я и OLUHEIVE OLD аиненеЕ OLOPCHC\n\nен DHEARINKAAELVE и OHVALTTIQOQO PE илеяхон иньиева BAELOLIEN LBL OLHhA ‘eNOdA BH OLHLON 2 OHBEd1AD “OHH\n\nO.LOWOH HUheH Woednoeed и HOO оп вдиеинедХеия и кяв1огоан зкиминА \"иийолийд» иноагегве онголидванойн оп анеяаен:\n\nOHWHPES и BXHOTIOOWRD ве то0нжоиеча каваоогойн и кинзид вяияева авкаиьд. ‘(WAL\'G BH вяин ALOHA оп) ана\n\nOHShHOOUALVE DLUTIMHOHA LO LUANOHEN OLHOW “изоониан PINKME Tod LBISLKh £\n\n‘eLoged eHuMMd ве игой индзииайан и eLoOgeEd ен WLLHGOULe вяввЕ 0.\n\n‘OP. LODHHHTAdLL9 онаичмжафо и пих я BLOQE ве KHAOLOA BABEL LELOLAh A тояиж BHHLeod я QHHBHE oLos\n\n«>. oe 4 y\n\nен зинажокийи 9 excada ияеди o1en “ипойдх итеаяктеаве вас ома,\n\n‘BIOdA BH охоинежаачтчо и BLEGALHAGLO BE OHHOHN #, ate:\n\nel и вхечаа BH.LEdQO LKeeLoOadu BY охипинаь BHEOLOA вавюечо LOE\n\nиа АГ als +t ate ee\n\nМИ ра А. | he aN gg Sa Чеч Й', '2026-04-09 22:35:06.489673'),
(51, 'documents/17757740158663900313055000107388_vHU4c4y.jpg', 'И И NP изт И 12 74? SU) PAGO SD V4 AL\n\nSHNLULLS HMevarory\n\nSHNHOL HOdG MOG\n\nи епифтем енгеидолийа»ж ‘LOML-Ndh войн \"апен) хапох ве иийзлийахж XBL 2 иноу и инакопайано OHOK оп OLHTIMHOHA вн BNEIdE енаед00 BARLOOVOdU LKLOLMh, Md SAHSHOKOO BE BHIDLEGLO евняаилжафо вена OHCU РвЯаенопеИ LBIOLUh A ‘OLMMIMHOHA BH OLOHedHOEed ен eNdogodu и онеаквн\n\n(omedundod) ве eanor/ado иткпохгоп и инееддоонева влепийпн LbYaLAhA ‘eNoOdA BH кваж я и OLUHEIVE OLD аиненеЕ OLOPCHC\n\nен DHEARINKAAELVE и OHVALTTIQOQO PE илеяхон иньиева BAELOLIEN LBL OLHhA ‘eNOdA BH OLHLON 2 OHBEd1AD “OHH\n\nO.LOWOH HUheH Woednoeed и HOO оп вдиеинедХеия и кяв1огоан зкиминА \"иийолийд» иноагегве онголидванойн оп анеяаен:\n\nOHWHPES и BXHOTIOOWRD ве то0нжоиеча каваоогойн и кинзид вяияева авкаиьд. ‘(WAL\'G BH вяин ALOHA оп) ана\n\nOHShHOOUALVE DLUTIMHOHA LO LUANOHEN OLHOW “изоониан PINKME Tod LBISLKh £\n\n‘eLoged eHuMMd ве игой индзииайан и eLoOgeEd ен WLLHGOULe вяввЕ 0.\n\n‘OP. LODHHHTAdLL9 онаичмжафо и пих я BLOQE ве KHAOLOA BABEL LELOLAh A тояиж BHHLeod я QHHBHE oLos\n\n«>. oe 4 y\n\nен зинажокийи 9 excada ияеди o1en “ипойдх итеаяктеаве вас ома,\n\n‘BIOdA BH охоинежаачтчо и BLEGALHAGLO BE OHHOHN #, ate:\n\nel и вхечаа BH.LEdQO LKeeLoOadu BY охипинаь BHEOLOA вавюечо LOE\n\nиа АГ als +t ate ee\n\nМИ ра А. | he aN gg Sa Чеч Й', '2026-04-09 22:35:07.508612'),
(52, 'documents/17757740976703730646338259027511.jpg', '', '2026-04-09 22:35:52.940279'),
(53, 'documents/17757740976703730646338259027511_itWyEIJ.jpg', '', '2026-04-09 22:36:03.686576'),
(54, 'documents/17757740976703730646338259027511_6TV4tZ1.jpg', '', '2026-04-09 22:36:16.128938'),
(55, 'documents/17757741663975720359818914336880.jpg', '', '2026-04-09 22:37:01.985963'),
(56, 'documents/17757741663975720359818914336880_dTKZMDR.jpg', '', '2026-04-09 22:37:14.366959'),
(57, 'documents/Untitled_54ZAtdG.jpg', 'System check identified no issues (0 silenced). March 17, 2026 - 13:13:00 Django version 4.2.18, using settings \'DP.settings\'\n\nStarting development server at http: /, Quit the server with CTRL-BREAK.\n\n[17/Mar/2026 13:13:07) \"GET / HTTP/1.1\" 200 5442', '2026-04-10 11:58:28.138222'),
(58, 'documents/Untitled_UiQ4Zpu.jpg', 'System check identified no issues (0 silenced). March 17, 2026 - 13:13:00 Django version 4.2.18, using settings \'DP.settings\'\n\nStarting development server at http: /, Quit the server with CTRL-BREAK.\n\n[17/Mar/2026 13:13:07) \"GET / HTTP/1.1\" 200 5442', '2026-04-10 12:43:39.274863'),
(59, 'documents/img_3_sU8RF1X.png', '1. Тема:\n\nОптическо разпознаване на символи и дигитализация. Разработване на приложение „Дигитален скенер“, при което потребителят качва снимка на документ, а системата извлича текста чрез OCR и го записва в база данни и/или го предлага за редакция в HTML форма.', '2026-04-10 12:44:04.127154');

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индекси за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индекси за таблица `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индекси за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индекси за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индекси за таблица `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индекси за таблица `main_document`
--
ALTER TABLE `main_document`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `main_document`
--
ALTER TABLE `main_document`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
