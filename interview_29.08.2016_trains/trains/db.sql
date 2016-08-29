-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 29, 2016 at 02:54 PM
-- Server version: 5.7.13-0ubuntu0.16.04.2
-- PHP Version: 7.0.8-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trains`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add group', 4, 'add_group'),
(11, 'Can change group', 4, 'change_group'),
(12, 'Can delete group', 4, 'delete_group'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add city', 7, 'add_city'),
(20, 'Can change city', 7, 'change_city'),
(21, 'Can delete city', 7, 'delete_city'),
(22, 'Can add place', 8, 'add_place'),
(23, 'Can change place', 8, 'change_place'),
(24, 'Can delete place', 8, 'delete_place'),
(25, 'Can add path node', 9, 'add_pathnode'),
(26, 'Can change path node', 9, 'change_pathnode'),
(27, 'Can delete path node', 9, 'delete_pathnode'),
(28, 'Can add train place interval', 10, 'add_trainplaceinterval'),
(29, 'Can change train place interval', 10, 'change_trainplaceinterval'),
(30, 'Can delete train place interval', 10, 'delete_trainplaceinterval'),
(31, 'Can add train', 11, 'add_train'),
(32, 'Can change train', 11, 'change_train'),
(33, 'Can delete train', 11, 'delete_train'),
(34, 'Can add passenger', 12, 'add_passenger'),
(35, 'Can change passenger', 12, 'change_passenger'),
(36, 'Can delete passenger', 12, 'delete_passenger'),
(37, 'Can add vagon', 13, 'add_vagon'),
(38, 'Can change vagon', 13, 'change_vagon'),
(39, 'Can delete vagon', 13, 'delete_vagon'),
(40, 'Can add date train', 14, 'add_datetrain'),
(41, 'Can change date train', 14, 'change_datetrain'),
(42, 'Can delete date train', 14, 'delete_datetrain'),
(43, 'Can add node inter val price', 15, 'add_nodeintervalprice'),
(44, 'Can change node inter val price', 15, 'change_nodeintervalprice'),
(45, 'Can delete node inter val price', 15, 'delete_nodeintervalprice');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$30000$2hIm0nUs71Se$CgMvx8DHbW5zbrr9gChMDMXGIekZBdQC+VyMymclVYU=', '2016-08-28 11:08:37.724806', 1, 'root', '', '', 'webdevmail@yandex.ru', 1, 1, '2016-08-28 11:08:17.038672');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-08-28 11:15:37.559020', '1', 'City object', 1, '[{"added": {}}]', 7, 1),
(2, '2016-08-28 11:15:40.337567', '2', 'City object', 1, '[{"added": {}}]', 7, 1),
(3, '2016-08-28 11:16:17.599291', '3', '3', 1, '[{"added": {}}]', 7, 1),
(4, '2016-08-28 11:16:19.413308', '4', '4', 1, '[{"added": {}}]', 7, 1),
(5, '2016-08-28 11:16:25.836382', '5', '5', 1, '[{"added": {}}]', 7, 1),
(6, '2016-08-28 11:16:28.921683', '6', '6', 1, '[{"added": {}}]', 7, 1),
(7, '2016-08-28 11:47:28.153449', '7', 'a', 1, '[{"added": {}}]', 7, 1),
(8, '2016-08-28 11:47:30.159103', '8', 'b', 1, '[{"added": {}}]', 7, 1),
(9, '2016-08-28 11:47:33.958752', '9', 'c', 1, '[{"added": {}}]', 7, 1),
(10, '2016-08-28 11:47:35.483318', '10', 'd', 1, '[{"added": {}}]', 7, 1),
(11, '2016-08-28 11:49:12.746732', '2', '1:1-6', 1, '[{"added": {}}]', 11, 1),
(12, '2016-08-28 11:49:38.060224', '3', '2:a-d', 1, '[{"added": {}}]', 11, 1),
(13, '2016-08-28 11:51:45.750956', '2', '1:1-6:1:0', 1, '[{"added": {}}]', 9, 1),
(14, '2016-08-28 11:52:18.497441', '3', '1:1-6:2:10', 1, '[{"added": {}}]', 9, 1),
(15, '2016-08-28 11:52:25.854000', '4', '1:1-6:3:20', 1, '[{"added": {}}]', 9, 1),
(16, '2016-08-28 11:52:33.801138', '5', '1:1-6:3:40', 1, '[{"added": {}}]', 9, 1),
(17, '2016-08-28 11:52:53.972093', '6', '1:1-6:5:50', 1, '[{"added": {}}]', 9, 1),
(18, '2016-08-28 11:53:06.814139', '7', '1:1-6:6:70', 1, '[{"added": {}}]', 9, 1),
(19, '2016-08-28 11:55:25.092379', '2', '1:из 1 в 6', 2, '[{"changed": {"fields": ["name"]}}]', 11, 1),
(20, '2016-08-28 11:55:37.149491', '3', '2:из a в d', 2, '[{"changed": {"fields": ["name"]}}]', 11, 1),
(21, '2016-08-28 11:56:00.501852', '8', '2:из a в d. узел: a время: 0 минут', 1, '[{"added": {}}]', 9, 1),
(22, '2016-08-28 11:56:08.630928', '9', '2:из a в d. узел: b время: 10 минут', 1, '[{"added": {}}]', 9, 1),
(23, '2016-08-28 11:56:20.393309', '10', '2:из a в d. узел: 4 время: 35 минут', 1, '[{"added": {}}]', 9, 1),
(24, '2016-08-28 11:56:30.466857', '11', '2:из a в d. узел: c время: 55 минут', 1, '[{"added": {}}]', 9, 1),
(25, '2016-08-28 11:56:40.883388', '12', '2:из a в d. узел: d время: 75 минут', 1, '[{"added": {}}]', 9, 1),
(26, '2016-08-28 12:05:25.733383', '1', '1:из 1 в 6:2016-08-28 12:00:00+00:00', 1, '[{"added": {}}]', 14, 1),
(27, '2016-08-28 12:05:43.848636', '2', '1:из 1 в 6:2016-08-29 12:00:00+00:00', 1, '[{"added": {}}]', 14, 1),
(28, '2016-08-28 12:06:04.408214', '3', '1:из 1 в 6:2016-08-30 12:00:00+00:00', 1, '[{"added": {}}]', 14, 1),
(29, '2016-08-28 12:06:27.725630', '4', '2:из a в d:2016-08-28 15:00:00+00:00', 1, '[{"added": {}}]', 14, 1),
(30, '2016-08-28 12:06:44.055862', '5', '2:из a в d:2016-08-29 15:00:00+00:00', 1, '[{"added": {}}]', 14, 1),
(31, '2016-08-28 12:06:51.995510', '6', '2:из a в d:2016-08-30 15:00:00+00:00', 1, '[{"added": {}}]', 14, 1),
(32, '2016-08-28 12:07:43.013003', '1', '1:из 1 в 6:2016-08-28 12:00:00+00:00:1', 1, '[{"added": {}}]', 13, 1),
(33, '2016-08-28 12:07:47.692001', '2', '1:из 1 в 6:2016-08-29 12:00:00+00:00:1', 1, '[{"added": {}}]', 13, 1),
(34, '2016-08-28 12:07:53.820723', '3', '1:из 1 в 6:2016-08-30 12:00:00+00:00:1', 1, '[{"added": {}}]', 13, 1),
(35, '2016-08-28 12:08:04.390790', '4', '2:из a в d:2016-08-28 15:00:00+00:00:2', 1, '[{"added": {}}]', 13, 1),
(36, '2016-08-28 12:08:06.911276', '5', '2:из a в d:2016-08-29 15:00:00+00:00:2', 1, '[{"added": {}}]', 13, 1),
(37, '2016-08-28 12:08:09.734871', '6', '2:из a в d:2016-08-30 15:00:00+00:00:2', 1, '[{"added": {}}]', 13, 1),
(38, '2016-08-28 12:08:27.291282', '1', '1:из 1 в 6:2016-08-28 12:00:00+00:00:1:1', 1, '[{"added": {}}]', 8, 1),
(39, '2016-08-28 12:08:31.940891', '2', '1:из 1 в 6:2016-08-28 12:00:00+00:00:1:2', 1, '[{"added": {}}]', 8, 1),
(40, '2016-08-28 12:08:34.871516', '3', '1:из 1 в 6:2016-08-28 12:00:00+00:00:1:3', 1, '[{"added": {}}]', 8, 1),
(41, '2016-08-28 12:09:31.861885', '4', 'вагон: 2:из a в d:2016-08-28 15:00:00+00:00:2, место:1', 1, '[{"added": {}}]', 8, 1),
(42, '2016-08-28 12:09:35.553060', '5', 'вагон: 2:из a в d:2016-08-28 15:00:00+00:00:2, место:2', 1, '[{"added": {}}]', 8, 1),
(43, '2016-08-28 12:09:38.166151', '6', 'вагон: 2:из a в d:2016-08-28 15:00:00+00:00:2, место:3', 1, '[{"added": {}}]', 8, 1),
(44, '2016-08-28 12:09:42.291043', '7', 'вагон: 2:из a в d:2016-08-28 15:00:00+00:00:2, место:4', 1, '[{"added": {}}]', 8, 1),
(45, '2016-08-28 12:10:22.914505', '1', 'Иванов И.А', 1, '[{"added": {}}]', 12, 1),
(46, '2016-08-28 12:10:29.070611', '2', 'Петров С.Е', 1, '[{"added": {}}]', 12, 1),
(47, '2016-08-28 12:12:36.468695', '1', 'Иванов И.А:вагон: 1:из 1 в 6:2016-08-28 12:00:00+00:00:1, место:1:1:из 1 в 6. узел: 2 время: 10 минут:1:из 1 в 6. узел: 3 время: 20 минут', 1, '[{"added": {}}]', 10, 1),
(48, '2016-08-28 12:13:35.135372', '5', '1:из 1 в 6. узел: 4 время: 40 минут', 2, '[{"changed": {"fields": ["city"]}}]', 9, 1),
(49, '2016-08-28 12:37:21.231181', '4', 'поезд 3 (из 6 в 1)', 1, '[{"added": {}}]', 11, 1),
(50, '2016-08-28 12:37:35.453489', '13', 'поезд 3 (из 6 в 1). узел: 6 время: 0 минут', 1, '[{"added": {}}]', 9, 1),
(51, '2016-08-28 12:37:41.642826', '14', 'поезд 3 (из 6 в 1). узел: 2 время: 10 минут', 1, '[{"added": {}}]', 9, 1),
(52, '2016-08-28 12:37:47.212879', '15', 'поезд 3 (из 6 в 1). узел: 3 время: 20 минут', 1, '[{"added": {}}]', 9, 1),
(53, '2016-08-28 12:37:53.995854', '16', 'поезд 3 (из 6 в 1). узел: 4 время: 35 минут', 1, '[{"added": {}}]', 9, 1),
(54, '2016-08-28 12:39:00.189657', '14', 'поезд 3 (из 6 в 1). узел: 5 время: 10 минут', 2, '[{"changed": {"fields": ["city"]}}]', 9, 1),
(55, '2016-08-28 12:39:06.097045', '15', 'поезд 3 (из 6 в 1). узел: 4 время: 20 минут', 2, '[{"changed": {"fields": ["city"]}}]', 9, 1),
(56, '2016-08-28 12:39:15.679800', '16', 'поезд 3 (из 6 в 1). узел: 3 время: 35 минут', 2, '[{"changed": {"fields": ["city"]}}]', 9, 1),
(57, '2016-08-28 12:39:22.689924', '16', 'поезд 3 (из 6 в 1). узел: 3 время: 35 минут', 2, '[]', 9, 1),
(58, '2016-08-28 12:39:35.662870', '17', 'поезд 3 (из 6 в 1). узел: 2 время: 50 минут', 1, '[{"added": {}}]', 9, 1),
(59, '2016-08-28 12:39:51.975522', '18', 'поезд 3 (из 6 в 1). узел: 1 время: 70 минут', 1, '[{"added": {}}]', 9, 1),
(60, '2016-08-28 12:44:51.942895', '1', 'NodeIntervalPrice object', 1, '[{"added": {}}]', 15, 1),
(61, '2016-08-28 13:39:09.035458', '2', 'поезд 2 (из 1 в 6)', 2, '[{"changed": {"fields": ["number"]}}]', 11, 1),
(62, '2016-08-28 13:39:16.787429', '3', 'поезд 3 (из a в d)', 2, '[{"changed": {"fields": ["number"]}}]', 11, 1),
(63, '2016-08-28 13:39:21.796596', '4', 'поезд 4 (из 6 в 1)', 2, '[{"changed": {"fields": ["number"]}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(4, 'auth', 'group'),
(2, 'auth', 'permission'),
(3, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'city'),
(14, 'main', 'datetrain'),
(15, 'main', 'nodeintervalprice'),
(12, 'main', 'passenger'),
(9, 'main', 'pathnode'),
(8, 'main', 'place'),
(11, 'main', 'train'),
(10, 'main', 'trainplaceinterval'),
(13, 'main', 'vagon'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-08-28 10:57:42.989606'),
(2, 'auth', '0001_initial', '2016-08-28 10:57:43.642251'),
(3, 'admin', '0001_initial', '2016-08-28 10:57:43.792593'),
(4, 'admin', '0002_logentry_remove_auto_add', '2016-08-28 10:57:43.817595'),
(5, 'contenttypes', '0002_remove_content_type_name', '2016-08-28 10:57:43.942089'),
(6, 'auth', '0002_alter_permission_name_max_length', '2016-08-28 10:57:44.012578'),
(7, 'auth', '0003_alter_user_email_max_length', '2016-08-28 10:57:44.080655'),
(8, 'auth', '0004_alter_user_username_opts', '2016-08-28 10:57:44.097792'),
(9, 'auth', '0005_alter_user_last_login_null', '2016-08-28 10:57:44.148954'),
(10, 'auth', '0006_require_contenttypes_0002', '2016-08-28 10:57:44.154124'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2016-08-28 10:57:44.174947'),
(12, 'auth', '0008_alter_user_username_max_length', '2016-08-28 10:57:44.240959'),
(13, 'sessions', '0001_initial', '2016-08-28 10:57:44.287738'),
(14, 'main', '0001_initial', '2016-08-28 11:03:19.469365'),
(15, 'main', '0002_train_name', '2016-08-28 11:35:15.932120'),
(16, 'main', '0003_auto_20160828_1151', '2016-08-28 11:51:13.358488'),
(17, 'main', '0004_trainplaceinterval_paid', '2016-08-28 12:35:20.954340'),
(18, 'main', '0005_nodeintervalprice', '2016-08-28 12:43:09.200638');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('v5v78qlwf2k4hv2l8ktb9h735nfz3zc3', 'ZDI0OWZmODg5ZTRiYWFkYzZmOTdmNzUxNmY5YjY3NzQyOGM4NGY4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhMDY3NzIxZmU4ZTk4MDMxNzJiYTA4YjYyZjlhZjE2NWNhNDdjZmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-09-11 11:08:37.729314');

-- --------------------------------------------------------

--
-- Table structure for table `main_city`
--

CREATE TABLE `main_city` (
  `id` int(11) NOT NULL,
  `city` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_city`
--

INSERT INTO `main_city` (`id`, `city`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, 'a'),
(8, 'b'),
(9, 'c'),
(10, 'd');

-- --------------------------------------------------------

--
-- Table structure for table `main_datetrain`
--

CREATE TABLE `main_datetrain` (
  `id` int(11) NOT NULL,
  `start` datetime(6) NOT NULL,
  `train_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_datetrain`
--

INSERT INTO `main_datetrain` (`id`, `start`, `train_id`) VALUES
(1, '2016-08-28 12:00:00.000000', 2),
(2, '2016-08-29 12:00:00.000000', 2),
(3, '2016-08-30 12:00:00.000000', 2),
(4, '2016-08-28 15:00:00.000000', 3),
(5, '2016-08-29 15:00:00.000000', 3),
(6, '2016-08-30 15:00:00.000000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `main_nodeintervalprice`
--

CREATE TABLE `main_nodeintervalprice` (
  `id` int(11) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `node1_id` int(11) NOT NULL,
  `node2_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_nodeintervalprice`
--

INSERT INTO `main_nodeintervalprice` (`id`, `price`, `node1_id`, `node2_id`) VALUES
(1, 22, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `main_passenger`
--

CREATE TABLE `main_passenger` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_passenger`
--

INSERT INTO `main_passenger` (`id`, `fio`) VALUES
(1, 'Иванов И.А'),
(2, 'Петров С.Е');

-- --------------------------------------------------------

--
-- Table structure for table `main_pathnode`
--

CREATE TABLE `main_pathnode` (
  `id` int(11) NOT NULL,
  `time_delta_minutes` int(10) UNSIGNED NOT NULL,
  `city_id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_pathnode`
--

INSERT INTO `main_pathnode` (`id`, `time_delta_minutes`, `city_id`, `train_id`) VALUES
(2, 0, 1, 2),
(3, 10, 2, 2),
(4, 20, 3, 2),
(5, 40, 4, 2),
(6, 50, 5, 2),
(7, 70, 6, 2),
(8, 0, 7, 3),
(9, 10, 8, 3),
(10, 35, 4, 3),
(11, 55, 9, 3),
(12, 75, 10, 3),
(13, 0, 6, 4),
(14, 10, 5, 4),
(15, 20, 4, 4),
(16, 35, 3, 4),
(17, 50, 2, 4),
(18, 70, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `main_place`
--

CREATE TABLE `main_place` (
  `id` int(11) NOT NULL,
  `number` smallint(5) UNSIGNED NOT NULL,
  `vagon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_place`
--

INSERT INTO `main_place` (`id`, `number`, `vagon_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 4),
(5, 2, 4),
(6, 3, 4),
(7, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `main_train`
--

CREATE TABLE `main_train` (
  `id` int(11) NOT NULL,
  `number` int(10) UNSIGNED NOT NULL,
  `name` varchar(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_train`
--

INSERT INTO `main_train` (`id`, `number`, `name`) VALUES
(2, 2, 'из 1 в 6'),
(3, 3, 'из a в d'),
(4, 4, 'из 6 в 1');

-- --------------------------------------------------------

--
-- Table structure for table `main_trainplaceinterval`
--

CREATE TABLE `main_trainplaceinterval` (
  `id` int(11) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `datetrain_id` int(11) NOT NULL,
  `end_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `start_id` int(11) NOT NULL,
  `paid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_trainplaceinterval`
--

INSERT INTO `main_trainplaceinterval` (`id`, `start_time`, `end_time`, `datetrain_id`, `end_id`, `passenger_id`, `place_id`, `start_id`, `paid`) VALUES
(1, '2016-08-28 12:10:00.000000', '2016-08-28 12:20:00.000000', 1, 4, 1, 1, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `main_vagon`
--

CREATE TABLE `main_vagon` (
  `id` int(11) NOT NULL,
  `number` smallint(5) UNSIGNED NOT NULL,
  `datetrain_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `main_vagon`
--

INSERT INTO `main_vagon` (`id`, `number`, `datetrain_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `main_city`
--
ALTER TABLE `main_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_datetrain`
--
ALTER TABLE `main_datetrain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_datetrain_f78b5793` (`train_id`);

--
-- Indexes for table `main_nodeintervalprice`
--
ALTER TABLE `main_nodeintervalprice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_nodeintervalprice_node1_id_e24d5016_fk_main_city_id` (`node1_id`),
  ADD KEY `main_nodeintervalprice_node2_id_b579825b_fk_main_city_id` (`node2_id`);

--
-- Indexes for table `main_passenger`
--
ALTER TABLE `main_passenger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_pathnode`
--
ALTER TABLE `main_pathnode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_pathnode_city_id_599af3cb_fk_main_city_id` (`city_id`),
  ADD KEY `main_pathnode_f78b5793` (`train_id`);

--
-- Indexes for table `main_place`
--
ALTER TABLE `main_place`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_place_814135a2` (`vagon_id`);

--
-- Indexes for table `main_train`
--
ALTER TABLE `main_train`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_trainplaceinterval`
--
ALTER TABLE `main_trainplaceinterval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_trainplaceinterv_datetrain_id_ec438e82_fk_main_datetrain_id` (`datetrain_id`),
  ADD KEY `main_trainplaceinterval_end_id_58064ca6_fk_main_pathnode_id` (`end_id`),
  ADD KEY `main_trainplaceinterv_passenger_id_a5a1c13b_fk_main_passenger_id` (`passenger_id`),
  ADD KEY `main_trainplaceinterval_place_id_b00345c1_fk_main_place_id` (`place_id`),
  ADD KEY `main_trainplaceinterval_start_id_2e4aad7a_fk_main_pathnode_id` (`start_id`);

--
-- Indexes for table `main_vagon`
--
ALTER TABLE `main_vagon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_vagon_datetrain_id_2b1f0cfd_fk_main_datetrain_id` (`datetrain_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `main_city`
--
ALTER TABLE `main_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `main_datetrain`
--
ALTER TABLE `main_datetrain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `main_nodeintervalprice`
--
ALTER TABLE `main_nodeintervalprice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `main_passenger`
--
ALTER TABLE `main_passenger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `main_pathnode`
--
ALTER TABLE `main_pathnode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `main_place`
--
ALTER TABLE `main_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `main_train`
--
ALTER TABLE `main_train`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `main_trainplaceinterval`
--
ALTER TABLE `main_trainplaceinterval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `main_vagon`
--
ALTER TABLE `main_vagon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `main_datetrain`
--
ALTER TABLE `main_datetrain`
  ADD CONSTRAINT `main_datetrain_train_id_3e3b284b_fk_main_train_id` FOREIGN KEY (`train_id`) REFERENCES `main_train` (`id`);

--
-- Constraints for table `main_nodeintervalprice`
--
ALTER TABLE `main_nodeintervalprice`
  ADD CONSTRAINT `main_nodeintervalprice_node1_id_e24d5016_fk_main_city_id` FOREIGN KEY (`node1_id`) REFERENCES `main_city` (`id`),
  ADD CONSTRAINT `main_nodeintervalprice_node2_id_b579825b_fk_main_city_id` FOREIGN KEY (`node2_id`) REFERENCES `main_city` (`id`);

--
-- Constraints for table `main_pathnode`
--
ALTER TABLE `main_pathnode`
  ADD CONSTRAINT `main_pathnode_city_id_599af3cb_fk_main_city_id` FOREIGN KEY (`city_id`) REFERENCES `main_city` (`id`),
  ADD CONSTRAINT `main_pathnode_train_id_2e345123_fk_main_train_id` FOREIGN KEY (`train_id`) REFERENCES `main_train` (`id`);

--
-- Constraints for table `main_place`
--
ALTER TABLE `main_place`
  ADD CONSTRAINT `main_place_vagon_id_1a92705c_fk_main_vagon_id` FOREIGN KEY (`vagon_id`) REFERENCES `main_vagon` (`id`);

--
-- Constraints for table `main_trainplaceinterval`
--
ALTER TABLE `main_trainplaceinterval`
  ADD CONSTRAINT `main_trainplaceinterv_datetrain_id_ec438e82_fk_main_datetrain_id` FOREIGN KEY (`datetrain_id`) REFERENCES `main_datetrain` (`id`),
  ADD CONSTRAINT `main_trainplaceinterv_passenger_id_a5a1c13b_fk_main_passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `main_passenger` (`id`),
  ADD CONSTRAINT `main_trainplaceinterval_end_id_58064ca6_fk_main_pathnode_id` FOREIGN KEY (`end_id`) REFERENCES `main_pathnode` (`id`),
  ADD CONSTRAINT `main_trainplaceinterval_place_id_b00345c1_fk_main_place_id` FOREIGN KEY (`place_id`) REFERENCES `main_place` (`id`),
  ADD CONSTRAINT `main_trainplaceinterval_start_id_2e4aad7a_fk_main_pathnode_id` FOREIGN KEY (`start_id`) REFERENCES `main_pathnode` (`id`);

--
-- Constraints for table `main_vagon`
--
ALTER TABLE `main_vagon`
  ADD CONSTRAINT `main_vagon_datetrain_id_2b1f0cfd_fk_main_datetrain_id` FOREIGN KEY (`datetrain_id`) REFERENCES `main_datetrain` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
