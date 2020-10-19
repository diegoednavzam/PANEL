-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-10-2020 a las 20:29:00
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pagos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id_accounts` int(11) NOT NULL AUTO_INCREMENT,
  `name_accounts` varchar(400) NOT NULL COMMENT 'nombre de la cuenta ',
  `tipe_accounts` varchar(300) NOT NULL COMMENT 'tipo de cuenta',
  `num_accounts` varchar(300) NOT NULL COMMENT 'numero de cuenta',
  `name_bank_accounts` varchar(400) NOT NULL COMMENT 'nombre del banco',
  `ci_accounts` varchar(300) NOT NULL COMMENT 'cedula de la cuenta',
  `mail_accounts` varchar(300) NOT NULL COMMENT 'correo de la cuenta',
  `id_admin_accound` int(11) NOT NULL,
  PRIMARY KEY (`id_accounts`),
  KEY `id_admin_accound` (`id_admin_accound`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id_accounts`, `name_accounts`, `tipe_accounts`, `num_accounts`, `name_bank_accounts`, `ci_accounts`, `mail_accounts`, `id_admin_accound`) VALUES
(10, 'Navas Diego', 'Ahorro', '123456789101112', 'Banco Pichincha', 'v-2000000', 'navas.diego@gmail.com', 1),
(11, 'Pacheco Kevin', 'otro', '', 'Banco del Pacífico', '01201210220', 'pacheco.kevin@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `id_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `apellido` varchar(300) NOT NULL,
  `correo` varchar(300) NOT NULL,
  `nivel` int(11) NOT NULL,
  `pw` varchar(300) NOT NULL,
  PRIMARY KEY (`id_administrador`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `nombre`, `apellido`, `correo`, `nivel`, `pw`) VALUES
(1, 'Luis', 'Carranza', 'carranza.luis@gmail.com', 1, '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `id_car` int(11) NOT NULL AUTO_INCREMENT,
  `id_service_car` int(11) NOT NULL COMMENT 'relacion con el servicio',
  `cantidacar` int(11) NOT NULL,
  `id_payment_id_car` int(11) NOT NULL,
  `costo_car` int(11) NOT NULL,
  PRIMARY KEY (`id_car`),
  KEY `id_service_car` (`id_service_car`),
  KEY `codigo_fac` (`id_payment_id_car`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `car`
--

INSERT INTO `car` (`id_car`, `id_service_car`, `cantidacar`, `id_payment_id_car`, `costo_car`) VALUES
(22, 54, 1, 65, 1300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisas`
--

CREATE TABLE IF NOT EXISTS `divisas` (
  `id_divisas` int(11) NOT NULL AUTO_INCREMENT,
  `name_divisa` varchar(100) NOT NULL,
  `simbolo_divisa` varchar(100) NOT NULL,
  PRIMARY KEY (`id_divisas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `divisas`
--

INSERT INTO `divisas` (`id_divisas`, `name_divisa`, `simbolo_divisa`) VALUES
(1, 'dolar', '$'),
(2, 'euros', '€'),
(3, 'libra', '£');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `name_empresa` varchar(300) NOT NULL,
  `tel_empresa` varchar(300) NOT NULL,
  `rif_empresa` varchar(300) NOT NULL,
  `dir_empresa` varchar(300) NOT NULL,
  `id_admin_id_empresa` int(11) NOT NULL,
  `logo_empresa` varchar(1000) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `id_admin_id_empresa` (`id_admin_id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `name_empresa`, `tel_empresa`, `rif_empresa`, `dir_empresa`, `id_admin_id_empresa`, `logo_empresa`) VALUES
(1, 'HeavyDeveloper', '0276-3480995', 'j-21545412-0', 'centro calle 12', 1, 'logoc3.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE IF NOT EXISTS `ingresos` (
  `id_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `id_service_id_ingreso` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `id_proveedor_id_ingreso` int(11) NOT NULL,
  `cantida_movimiento` int(11) NOT NULL,
  `motivo` varchar(500) NOT NULL,
  PRIMARY KEY (`id_ingreso`),
  UNIQUE KEY `fecha_ingreso` (`fecha_ingreso`),
  KEY `id_proveedor_id_ingreso` (`id_proveedor_id_ingreso`),
  KEY `id_service_id_ingreso` (`id_service_id_ingreso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id_ingreso`, `id_service_id_ingreso`, `fecha_ingreso`, `id_proveedor_id_ingreso`, `cantida_movimiento`, `motivo`) VALUES
(40, 54, '2017-10-21 02:00:00', 1, 3, 'este es el motivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientosaldo`
--

CREATE TABLE IF NOT EXISTS `movimientosaldo` (
  `id_msaldo` int(11) NOT NULL AUTO_INCREMENT,
  `id_msaldo_id_saldo` int(11) NOT NULL,
  `cantida_msaldo` int(11) NOT NULL,
  `fecha_msaldo` datetime NOT NULL,
  `motivo_msaldo` varchar(500) NOT NULL,
  `movimiento_emisor` int(11) DEFAULT NULL,
  `tipo_mmovimiento` varchar(100) NOT NULL COMMENT 'tipo de movimiento',
  PRIMARY KEY (`id_msaldo`),
  UNIQUE KEY `fecha_msaldo` (`fecha_msaldo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id_payments` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de tabla de pagos ',
  `state_payment` varchar(300) NOT NULL COMMENT 'estado del pago si vensido o n proceso y pagado ',
  `date_payment` datetime NOT NULL COMMENT 'fecha de pago ',
  `id_user_id_payments` int(11) NOT NULL COMMENT 'relacion con el usuario que pago o que se esta procesando ',
  `id_accounts_id_payments` int(11) NOT NULL COMMENT 'relacion con bancos',
  `date_pago` datetime NOT NULL COMMENT 'fecha de registro de pago',
  PRIMARY KEY (`id_payments`),
  KEY `id_user_id_payments` (`id_user_id_payments`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id_payments`, `state_payment`, `date_payment`, `id_user_id_payments`, `id_accounts_id_payments`, `date_pago`) VALUES
(65, 'aceptado', '2017-10-22 00:10:45', 8, 10, '2017-10-22 01:10:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(500) NOT NULL,
  `telefono_proveedor` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre_proveedor`, `telefono_proveedor`, `correo`) VALUES
(1, 'no a aplica', '0426-1454751', 'popotas@popotas.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldo`
--

CREATE TABLE IF NOT EXISTS `saldo` (
  `id_saldo` int(11) NOT NULL AUTO_INCREMENT,
  `cantida_saldo` int(11) NOT NULL,
  `id_saldo_id_accounts` int(11) NOT NULL,
  `id_divisa_id_saldo` int(11) NOT NULL,
  PRIMARY KEY (`id_saldo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `saldo`
--

INSERT INTO `saldo` (`id_saldo`, `cantida_saldo`, `id_saldo_id_accounts`, `id_divisa_id_saldo`) VALUES
(1, 18, 10, 1),
(2, 10, 10, 2),
(3, 25, 11, 3),
(4, 5, 11, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE IF NOT EXISTS `salida` (
  `id_salida` int(11) NOT NULL AUTO_INCREMENT,
  `id_service_id_salida` int(11) NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `id_user_id_salida` int(11) NOT NULL COMMENT 'id de usuarios en caso de que haya sido una venta ',
  `cantida_salida` int(11) NOT NULL,
  `motivo_salida` varchar(100) NOT NULL,
  PRIMARY KEY (`id_salida`),
  KEY `id_user_id_salida` (`id_user_id_salida`),
  KEY `id_service_id_salida` (`id_service_id_salida`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `name_service` varchar(300) NOT NULL COMMENT 'nombre del servicio',
  `price_service` bigint(20) NOT NULL COMMENT 'precio del servicio',
  `date_ven_service` datetime NOT NULL COMMENT 'fecha de vencimiento del servicio',
  `info_service` varchar(500) NOT NULL COMMENT 'informacion adicional del servicio',
  `cantida` int(11) NOT NULL COMMENT 'cantida de productos',
  `date_registro_pro` datetime NOT NULL COMMENT 'fecha de registro del producto ',
  `tipo_producto` varchar(100) NOT NULL COMMENT 'tipo de producto  si es servicio o producto',
  `imagen` varchar(1000) NOT NULL COMMENT 'imagen principal del producto',
  `costo` int(11) NOT NULL COMMENT 'costo del producto o servicio',
  `state_service` int(11) NOT NULL COMMENT 'estado del servicio si es producto o entrada de  dinero',
  PRIMARY KEY (`id_service`),
  UNIQUE KEY `name_service` (`name_service`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Volcado de datos para la tabla `service`
--

INSERT INTO `service` (`id_service`, `name_service`, `price_service`, `date_ven_service`, `info_service`, `cantida`, `date_registro_pro`, `tipo_producto`, `imagen`, `costo`, `state_service`) VALUES
(54, 'sistema php full', 1300, '0000-00-00 00:00:00', 'estees un sistema web', 3, '2017-10-22 00:10:50', 'servicio ', 'producto_heavydeveloperstext.pngsistemaphp', 1200, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name_user` varchar(300) NOT NULL,
  `last_name_user` varchar(300) NOT NULL,
  `mail_user` varchar(300) NOT NULL,
  `phone_user` int(11) NOT NULL,
  `ci_user` varchar(300) NOT NULL,
  `pw_user` varchar(300) NOT NULL,
  `direccion` varchar(1000) NOT NULL,
  `id_admin_id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_admin_id_user` (`id_admin_id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `last_name_user`, `mail_user`, `phone_user`, `ci_user`, `pw_user`, `direccion`, `id_admin_id_user`) VALUES
(8, 'yon', 'cacadsd', 'y@y.com', 424762061, '23134135', '123456', 'calle 12 carrera 9-10', 1),
(11, 'Kevin', 'Pacheco', 'david3797@hotmail.com', 959614811, '1314877075', 'Rkoviper3.', 'Andrés de Vera, Portoviejo', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`id_admin_accound`) REFERENCES `administrador` (`id_administrador`);

--
-- Filtros para la tabla `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`id_service_car`) REFERENCES `service` (`id_service`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`id_payment_id_car`) REFERENCES `payments` (`id_payments`);

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_admin_id_empresa`) REFERENCES `administrador` (`id_administrador`);

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`id_proveedor_id_ingreso`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`id_service_id_ingreso`) REFERENCES `service` (`id_service`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`id_service_id_salida`) REFERENCES `service` (`id_service`),
  ADD CONSTRAINT `salida_ibfk_2` FOREIGN KEY (`id_user_id_salida`) REFERENCES `user` (`id_user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
