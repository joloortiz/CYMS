-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2014 at 04:35 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cyms`
--
CREATE DATABASE IF NOT EXISTS `cyms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cyms`;

DELIMITER $$
--
-- Functions
--
DROP FUNCTION IF EXISTS `fnExitPassNo`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fnExitPassNo`() RETURNS varchar(20) CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE ExitpassSerial VARCHAR(20);
    DECLARE IDDatedSequence INT(5); /* RECENTLY USED 'DATED' SEQUENCE */
    DECLARE DateSequence VARCHAR(6);
    DECLARE DateSequenceFormat VARCHAR(6);
    DECLARE IDDatedSequenceFormat VARCHAR(5);

    SET DateSequenceFormat = '0000';
    SET IDDatedSequenceFormat = '00000';

    SELECT IFNULL(
                CONVERT(
                    RIGHT(
                            ( SELECT MAX(e_serial) FROM exit_passes WHERE LEFT(DATE_FORMAT(NOW(), '%Y'), LENGTH(DateSequenceFormat)) = LEFT(e_serial, LENGTH(DateSequenceFormat)) )
                            , LENGTH(IDDatedSequenceFormat)
                    ), SIGNED
                ), 0
            ) INTO IDDatedSequence;

    SELECT DATE_FORMAT(NOW(), '%Y') INTO DateSequence;

    SELECT CONCAT(
            DateSequence,
            '-',
            LEFT(
                IDDatedSequenceFormat,
                (
                    LENGTH(IDDatedSequenceFormat)
                    -
                    LENGTH(
                        CONVERT(
                            (
                                IDDatedSequence + 1
                            ),
                            CHAR
                        )
                    )
                )
            ),
            CONVERT(
                (
                    IDDatedSequence + 1
                ),
                CHAR
            )
        )INTO ExitpassSerial;
    
    RETURN ExitpassSerial;
END$$

DROP FUNCTION IF EXISTS `fnTcardID`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fnTcardID`() RETURNS varchar(20) CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE TcardID VARCHAR(20);
    DECLARE IDDatedSequence INT(5); /* RECENTLY USED 'DATED' SEQUENCE */
    DECLARE DateSequence VARCHAR(6);
    DECLARE DateSequenceFormat VARCHAR(6);
    DECLARE IDDatedSequenceFormat VARCHAR(5);

    SET DateSequenceFormat = '000000';
    SET IDDatedSequenceFormat = '00000';

    SELECT IFNULL(
                CONVERT(
                    RIGHT(
                            ( SELECT MAX(tc_id) FROM tcards WHERE LEFT(DATE_FORMAT(NOW(), '%Y%m'), LENGTH(DateSequenceFormat)) = LEFT(tc_id, LENGTH(DateSequenceFormat)) )
                            , LENGTH(IDDatedSequenceFormat)
                    ), SIGNED
                ), 0
            ) INTO IDDatedSequence;

    SELECT DATE_FORMAT(NOW(), '%Y%m') INTO DateSequence;

    SELECT CONCAT(
            DateSequence,
            '-',
            LEFT(
                IDDatedSequenceFormat,
                (
                    LENGTH(IDDatedSequenceFormat)
                    -
                    LENGTH(
                        CONVERT(
                            (
                                IDDatedSequence + 1
                            ),
                            CHAR
                        )
                    )
                )
            ),
            CONVERT(
                (
                    IDDatedSequence + 1
                ),
                CHAR
            )
        )INTO TcardID;
    
    RETURN TcardID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `checkers`
--

DROP TABLE IF EXISTS `checkers`;
CREATE TABLE IF NOT EXISTS `checkers` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_firstname` varchar(100) DEFAULT NULL,
  `c_lastname` varchar(100) DEFAULT NULL,
  `c_mi` varchar(5) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `exit_passes`
--

DROP TABLE IF EXISTS `exit_passes`;
CREATE TABLE IF NOT EXISTS `exit_passes` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_id` varchar(20) NOT NULL,
  `e_serial` varchar(45) DEFAULT NULL,
  `e_van_class` varchar(100) NOT NULL,
  `e_date` date NOT NULL,
  `e_timeout` time DEFAULT NULL,
  `e_destination` varchar(255) NOT NULL,
  `e_plateno` varchar(15) NOT NULL,
  `e_particulars` text NOT NULL,
  `e_driver` varchar(50) NOT NULL,
  PRIMARY KEY (`e_id`),
  UNIQUE KEY `tc_id` (`tc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `incoming_materials`
--

DROP TABLE IF EXISTS `incoming_materials`;
CREATE TABLE IF NOT EXISTS `incoming_materials` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT,
  `im_name` varchar(100) NOT NULL,
  `im_category` varchar(50) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`im_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
CREATE TABLE IF NOT EXISTS `materials` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(100) DEFAULT NULL,
  `m_description` text NOT NULL,
  `m_type` varchar(100) DEFAULT NULL,
  `m_category` varchar(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
CREATE TABLE IF NOT EXISTS `shippers` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) DEFAULT NULL,
  `s_code` varchar(20) DEFAULT NULL,
  `s_color` varchar(10) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcards`
--

DROP TABLE IF EXISTS `tcards`;
CREATE TABLE IF NOT EXISTS `tcards` (
  `tc_id` varchar(20) NOT NULL,
  `v_id` int(11) NOT NULL,
  `tt_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `vt_id` int(11) NOT NULL,
  `tc_entrydate` timestamp NULL DEFAULT NULL,
  `tc_rdd` date DEFAULT NULL,
  `tc_bin` varchar(100) DEFAULT NULL,
  `tc_batchcode` varchar(100) DEFAULT NULL,
  `tc_remarks` text,
  `tc_checker` varchar(150) DEFAULT NULL,
  `tc_status` varchar(100) DEFAULT NULL,
  `tc_position` varchar(100) DEFAULT NULL,
  `tc_datestuffed` date DEFAULT NULL,
  `tc_dn` varchar(50) DEFAULT NULL,
  `tc_sealno` varchar(50) DEFAULT NULL,
  `tc_datesealed` date DEFAULT NULL,
  `tc_qcases` varchar(45) DEFAULT NULL,
  `tc_qbags` varchar(45) DEFAULT NULL,
  `tc_datestripped` date DEFAULT NULL,
  `tc_dateblocked` timestamp NULL DEFAULT NULL,
  `tc_stucontroller` int(11) DEFAULT NULL,
  `tc_strcontroller` int(11) DEFAULT NULL,
  `tc_block_reason` text,
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `is_defective` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tc_id`),
  KEY `fk_tcards_vans1_idx` (`v_id`),
  KEY `fk_tcards_tcard_types1_idx` (`tt_id`),
  KEY `fk_tcards_shippers1_idx` (`s_id`),
  KEY `fk_tcards_truckers1_idx` (`t_id`),
  KEY `fk_tcards_users1_idx` (`u_id`),
  KEY `fk_tcards_checkers1_idx` (`c_id`),
  KEY `fk_tcards_van_types1_idx` (`vt_id`),
  KEY `fk_tcards_users_str_idx` (`tc_strcontroller`),
  KEY `fk_tcards_users_stu_idx` (`tc_stucontroller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tcards_exit_passes`
--

DROP TABLE IF EXISTS `tcards_exit_passes`;
CREATE TABLE IF NOT EXISTS `tcards_exit_passes` (
  `tcards_exit_passes_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_id` varchar(20) NOT NULL,
  `e_id` int(11) NOT NULL,
  PRIMARY KEY (`tcards_exit_passes_id`),
  KEY `fk_tcards_exit_passes_tcards1_idx` (`tc_id`),
  KEY `fk_tcards_exit_passes_exit_passes1_idx` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcards_history`
--

DROP TABLE IF EXISTS `tcards_history`;
CREATE TABLE IF NOT EXISTS `tcards_history` (
  `tch_id` int(11) NOT NULL,
  `v_id` int(11) NOT NULL,
  `tt_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `vt_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `tc_entrydate` timestamp NULL DEFAULT NULL,
  `tc_bin` varchar(100) DEFAULT NULL,
  `tc_remarks` text,
  `tc_checker` varchar(150) DEFAULT NULL,
  `tc_status` varchar(100) DEFAULT NULL,
  `tc_position` varchar(100) DEFAULT NULL,
  `tc_exitdate` timestamp NULL DEFAULT NULL,
  `tc_datestuffed` timestamp NULL DEFAULT NULL,
  `tc_dn` varchar(50) DEFAULT NULL,
  `tc_qcases` varchar(45) DEFAULT NULL,
  `tc_qbags` varchar(45) DEFAULT NULL,
  `tc_datestripped` timestamp NULL DEFAULT NULL,
  `tc_stucontroller` varchar(250) DEFAULT NULL,
  `tc_strcontroller` varchar(250) DEFAULT NULL,
  `tc_id` varchar(20) NOT NULL,
  PRIMARY KEY (`tch_id`),
  KEY `fk_tcards_history_tcards1_idx` (`tc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tcard_incoming_materials`
--

DROP TABLE IF EXISTS `tcard_incoming_materials`;
CREATE TABLE IF NOT EXISTS `tcard_incoming_materials` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_id` varchar(20) NOT NULL,
  `im_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tim_id`),
  KEY `tcard_incomin_materials_fkey_idx` (`im_id`),
  KEY `tcard_incoming_materials_tcard_fkey_idx` (`tc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcard_outgoing_materials`
--

DROP TABLE IF EXISTS `tcard_outgoing_materials`;
CREATE TABLE IF NOT EXISTS `tcard_outgoing_materials` (
  `tom_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_id` varchar(20) NOT NULL,
  `m_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tom_id`),
  KEY `tcard_outgoing_materials_materials_fkey_idx` (`m_id`),
  KEY `tcard_outgoing_materials_tcards_fkey_idx` (`tc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcard_position`
--

DROP TABLE IF EXISTS `tcard_position`;
CREATE TABLE IF NOT EXISTS `tcard_position` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_id` varchar(20) NOT NULL,
  `tp_position` varchar(50) DEFAULT NULL,
  `tp_left` varchar(100) DEFAULT NULL,
  `tp_top` varchar(100) DEFAULT NULL,
  `tp_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tp_id`),
  KEY `fk_tcard_position_tcads_idx` (`tc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcard_types`
--

DROP TABLE IF EXISTS `tcard_types`;
CREATE TABLE IF NOT EXISTS `tcard_types` (
  `tt_id` int(11) NOT NULL AUTO_INCREMENT,
  `tt_name` varchar(100) DEFAULT NULL,
  `tt_color` varchar(10) DEFAULT NULL,
  `ttg_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tt_id`),
  KEY `fk_tcard_types_tcard_type_group_idx` (`ttg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- Table structure for table `tcard_type_group`
--

DROP TABLE IF EXISTS `tcard_type_group`;
CREATE TABLE IF NOT EXISTS `tcard_type_group` (
  `ttg_id` int(11) NOT NULL AUTO_INCREMENT,
  `ttg_name` varchar(20) NOT NULL,
  PRIMARY KEY (`ttg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `truckers`
--

DROP TABLE IF EXISTS `truckers`;
CREATE TABLE IF NOT EXISTS `truckers` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(255) DEFAULT NULL,
  `t_code` varchar(20) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_username` varchar(45) DEFAULT NULL,
  `u_password` varchar(100) DEFAULT NULL,
  `u_firstname` varchar(100) DEFAULT NULL,
  `u_lastname` varchar(100) DEFAULT NULL,
  `u_mi` varchar(45) DEFAULT NULL,
  `u_isactive` tinyint(1) DEFAULT '1',
  `u_addedby` varchar(100) DEFAULT NULL,
  `u_dateadded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `u_contactno` varchar(20) DEFAULT NULL,
  `u_isadmin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Table structure for table `vans`
--

DROP TABLE IF EXISTS `vans`;
CREATE TABLE IF NOT EXISTS `vans` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- Table structure for table `van_types`
--

DROP TABLE IF EXISTS `van_types`;
CREATE TABLE IF NOT EXISTS `van_types` (
  `vt_id` int(11) NOT NULL AUTO_INCREMENT,
  `vt_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vt_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exit_passes`
--
ALTER TABLE `exit_passes`
  ADD CONSTRAINT `exit_passes_tcards_fkey` FOREIGN KEY (`tc_id`) REFERENCES `tcards` (`tc_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tcards`
--
ALTER TABLE `tcards`
  ADD CONSTRAINT `fk_tcards_checkers1` FOREIGN KEY (`c_id`) REFERENCES `checkers` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcards_shippers1` FOREIGN KEY (`s_id`) REFERENCES `shippers` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcards_tcard_types1` FOREIGN KEY (`tt_id`) REFERENCES `tcard_types` (`tt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcards_truckers1` FOREIGN KEY (`t_id`) REFERENCES `truckers` (`t_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcards_users1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcards_users_str` FOREIGN KEY (`tc_strcontroller`) REFERENCES `users` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcards_users_stu` FOREIGN KEY (`tc_stucontroller`) REFERENCES `users` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcards_vans1` FOREIGN KEY (`v_id`) REFERENCES `vans` (`v_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcards_van_types1` FOREIGN KEY (`vt_id`) REFERENCES `van_types` (`vt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tcards_exit_passes`
--
ALTER TABLE `tcards_exit_passes`
  ADD CONSTRAINT `fk_tcards_exit_passes_exit_passes1` FOREIGN KEY (`e_id`) REFERENCES `exit_passes` (`e_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tcards_exit_passes_tcards1` FOREIGN KEY (`tc_id`) REFERENCES `tcards` (`tc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tcards_history`
--
ALTER TABLE `tcards_history`
  ADD CONSTRAINT `fk_tcards_history_tcards` FOREIGN KEY (`tc_id`) REFERENCES `tcards` (`tc_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tcard_incoming_materials`
--
ALTER TABLE `tcard_incoming_materials`
  ADD CONSTRAINT `tcard_incoming_materials_incoming_materials_fkey` FOREIGN KEY (`im_id`) REFERENCES `incoming_materials` (`im_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tcard_incoming_materials_tcard_fkey` FOREIGN KEY (`tc_id`) REFERENCES `tcards` (`tc_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tcard_outgoing_materials`
--
ALTER TABLE `tcard_outgoing_materials`
  ADD CONSTRAINT `tcard_outgoing_materials_materials_fkey` FOREIGN KEY (`m_id`) REFERENCES `materials` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tcard_outgoing_materials_tcards_fkey` FOREIGN KEY (`tc_id`) REFERENCES `tcards` (`tc_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tcard_position`
--
ALTER TABLE `tcard_position`
  ADD CONSTRAINT `fk_tcard_position_tcards` FOREIGN KEY (`tc_id`) REFERENCES `tcards` (`tc_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tcard_types`
--
ALTER TABLE `tcard_types`
  ADD CONSTRAINT `fk_tcard_types_tcard_type_group` FOREIGN KEY (`ttg_id`) REFERENCES `tcard_type_group` (`ttg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
