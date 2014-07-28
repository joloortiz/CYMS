-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 21, 2014 at 12:20 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cyms`
--

DELIMITER $$
--
-- Functions
--
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

CREATE TABLE IF NOT EXISTS `checkers` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_firstname` varchar(100) DEFAULT NULL,
  `c_lastname` varchar(100) DEFAULT NULL,
  `c_mi` varchar(5) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `checkers`
--

INSERT INTO `checkers` (`c_id`, `c_firstname`, `c_lastname`, `c_mi`, `is_deleted`) VALUES
(1, 'None', '', '', 0),
(2, 'RUEL', 'AMPARO', 'M.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exit_passes`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `exit_passes`
--

INSERT INTO `exit_passes` (`e_id`, `tc_id`, `e_serial`, `e_van_class`, `e_date`, `e_timeout`, `e_destination`, `e_plateno`, `e_particulars`, `e_driver`) VALUES
(1, '201407-00003', '2014-00001', 'E', '2014-07-02', '13:31:10', 'MEYCAUAYAN', 'BYE 143', 'VERY PARTICULAR', 'MANG KANOR'),
(2, '201407-00051', '2014-00002', 'FG', '2014-07-02', '18:21:16', 'MEYCAUAYAN', 'BYE 213', 'VERY PARTICULAR', 'MANG KANOR'),
(3, '201407-00001', '2014-00003', 'FG', '2014-07-04', '07:21:09', 'MEYCAUYAN', 'BYE 471', 'VERY PARTICULAR', 'MANG KANOR'),
(4, '201407-00061', '2014-00004', 'FG', '2014-07-04', '08:30:19', 'DF', 'GDF', 'ASDFGDFS', 'GDFG'),
(5, '201407-00062', '2014-00005', 'FG', '2014-07-04', '08:34:12', 'ASDF', 'SADF', 'ASDFSADF', 'ASDF'),
(6, '201407-00060', '2014-00006', 'FG', '2014-07-04', '08:38:50', 'F', 'F', 'ADSF', 'F'),
(7, '201407-00063', '2014-00007', 'FG', '2014-07-04', '10:14:57', 'S', 'S', 'S', 'S'),
(8, '201407-00067', '2014-00008', 'E', '2014-07-04', '11:18:33', 'MEYCAUAYAN', 'BYE123', 'VERY PARTICULAR', 'MANG KANOR'),
(9, '201407-00069', '2014-00009', 'FG', '2014-07-09', '13:51:59', 'MEYCAUAYAN', 'BYE 123', 'VERY PARTICULAR', 'DRAYBER'),
(10, '201407-00071', '2014-00010', 'FG', '2014-07-09', NULL, 'MEYCAUAYAN', '', 'VERY PARTICULAR', ''),
(11, '201407-00075', '2014-00011', 'FG', '2014-07-14', '12:01:04', 'MEYCAUAYAN', 'PLA 123', 'PARTICULAR', 'DRAYBER KOYA'),
(12, '201407-00080', '2014-00012', 'FG', '2014-07-14', '12:03:22', 'MEYCAUAYAN', 'MLS 321', 'PARTIKULARES', 'KOYA DRAYBERS');

-- --------------------------------------------------------

--
-- Table structure for table `incoming_materials`
--

CREATE TABLE IF NOT EXISTS `incoming_materials` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT,
  `im_name` varchar(100) NOT NULL,
  `im_category` varchar(50) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`im_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `incoming_materials`
--

INSERT INTO `incoming_materials` (`im_id`, `im_name`, `im_category`, `is_deleted`) VALUES
(1, 'DECAF', 'IMPORTED', 0),
(2, 'SLIPSHEETS', 'IMPORTED', 0),
(3, 'LAMINATES', 'IMPORTED', 0),
(4, 'BBI 680G KDC', 'LOCAL', 0),
(5, 'BBI 80G KDC', 'LOCAL', 0),
(6, 'BBI 100G KDC', 'LOCAL', 0),
(7, 'BBI 150G KDC', 'LOCAL', 0),
(8, 'BBI 320G KDC', 'LOCAL', 0),
(9, 'BBI 33G KDC', 'LOCAL', 0),
(10, 'SLEEVES 80G', 'LOCAL', 0),
(11, 'SLEEVES 300 KDC', 'LOCAL', 0),
(12, 'SLEEVES 330G AUTO', 'LOCAL', 0),
(13, 'KDC 750/900', 'LOCAL', 0),
(14, 'NESCAFE 25G KDF', 'LOCAL', 0),
(15, 'POLYTHYLENE', 'LOCAL', 0),
(16, 'NESCAFE 150G KDC', 'LOCAL', 0),
(17, 'DECAF 20G KDC', 'LOCAL', 0),
(18, 'DECAF 40G KDC', 'LOCAL', 0),
(19, 'DECAF 80G KDC', 'LOCAL', 0),
(20, 'BBI IC-150', 'LOCAL', 0),
(21, 'UNPRINTED LAMINATES', 'LOCAL', 0),
(22, 'EMPTY MEGA BAG', 'LOCAL', 0),
(23, 'ADHESIVE GLUE', 'LOCAL', 0),
(24, 'GLUCOSE FLEXITANK', 'IMPORTED', 0),
(25, 'GLUCOSE POWER(GLUCIDEX)', 'IMPORTED', 0),
(26, 'GLUCOSE DRUMS(SYRUP)', 'IMPORTED', 0),
(27, 'MSK MEDIUM HEAT', 'IMPORTED', 0),
(28, 'SBMP', 'IMPORTED', 0),
(29, 'MILK BUDS', 'IMPORTED', 0),
(30, 'K-CASIENATE', 'IMPORTED', 0),
(31, 'TRACE ELEMENTS', 'IMPORTED', 0),
(32, 'AMF', 'IMPORTED', 0),
(33, 'BUTTER MILK', 'IMPORTED', 0),
(34, 'DIMODAN', 'LOCAL', 0),
(35, 'SUGAR', 'LOCAL', 0),
(36, 'VITAMIN PREMIX', 'LOCAL', 0),
(37, 'SODIUM CITRATE', 'LOCAL', 0),
(38, 'CALCIUM CITRATE', 'LOCAL', 0),
(39, 'MALTO POWDER', 'TEMPLOAD', 0),
(40, 'MSK MEDIUM HEAT (TEMPLOAD)', 'TEMPLOAD', 0),
(41, 'AMF/DRUMS/SBMP (TEMPLOAD)', 'TEMPLOAD', 0),
(42, 'KAPE PURO', 'IMPORTED', 0),
(43, 'STAR BUKO', 'LOCAL', 0);

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(100) DEFAULT NULL,
  `m_description` text NOT NULL,
  `m_type` varchar(100) DEFAULT NULL,
  `m_category` varchar(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`m_id`, `m_name`, `m_description`, `m_type`, `m_category`, `is_deleted`) VALUES
(1, 'None', '', '', '', 0),
(2, '12191359', 'NESTLE BEAR BRAND WITH IRON 16(8X33G) PH', 'MILK', 'FG', 0),
(3, '12176151', 'NESTLE BEAR BRAND WITH IRON 30X300GN1 PH', 'MILK', 'FG', 0),
(4, '12176152', 'NESTLE BEAR BRAND WITH IRON 14X680GN1 PH', 'MILK', 'FG', 0),
(5, '12191358', 'NESTLE BEAR BRAND WITH IRON 72X150GN3 PH', 'MILK', 'FG', 0),
(6, '12176072', 'NESTLE BEAR BRAND WITH IRON 120X80GN1 PH', 'MILK', 'FG', 0),
(7, '43396373', 'NESTLE BEAR BRAND MILK POWDER 700KG BULK', 'MILK', 'FG', 0),
(8, '12248410', 'BEAR BRAND W IRON+ZINC+VITC 120X80G PH', 'MILK', 'FG', 0),
(9, '12248412', 'BEAR BRAND W IRON+ZINC+VITC 72X150G PH', 'MILK', 'FG', 0),
(10, '12248411', 'BEAR BRAND W IRON+ZINC+VITC 128X33G PH', 'MILK', 'FG', 0),
(11, '12248414', 'BEAR BRAND W IRON+ZINC+VITC 14X700G PH', 'MILK', 'FG', 0),
(12, '12248413', 'BEAR BRAND W IRON+ZINC+VITC 30X320G PH', 'MILK', 'FG', 0),
(13, '12248415', 'BEAR BRAND W IRON+ZINC+VITC 14X900G PH', 'MILK', 'FG', 0),
(14, '12248417', 'BEAR BRAND W IRON+ZINC+VITC 12X1.2KG PH', 'MILK', 'FG', 0),
(15, '43574723', 'BEAR BRAND MILK POWDER MQAV008A-2 700KG', 'MILK', 'FG', 0),
(16, '12179638', 'NC 25G', 'COFFEE', 'FG', 0),
(17, '12180259', 'NC 100G', 'COFFEE', 'FG', 0),
(18, '12180270', 'NC 50G', 'COFFEE', 'FG', 0),
(19, '12184132', 'NC REFILL 25G', 'COFFEE', 'FG', 0),
(20, '43545752', 'KERF533 BIGBAG 230KG', 'COFFEE', 'FG', 0),
(21, '43545408', 'KERF 583 BIGBAG GAUDI', 'COFFEE', 'FG', 0),
(22, '123435661', 'A WILD SEMI-FG', 'MILK', 'SFG', 0),
(23, '123456123', 'A WILD KUPI', 'COFFEE', 'SFG', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shippers`
--

CREATE TABLE IF NOT EXISTS `shippers` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) DEFAULT NULL,
  `s_code` varchar(20) DEFAULT NULL,
  `s_color` varchar(10) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `shippers`
--

INSERT INTO `shippers` (`s_id`, `s_name`, `s_code`, `s_color`, `is_deleted`) VALUES
(1, 'None', NULL, '#ffffff', 1),
(2, 'NMC', NULL, '#DF00B3', 0),
(3, 'SOLID', NULL, '#1C1CCE', 0),
(4, '2GO', NULL, '#FB4B06', 0),
(5, 'GS', NULL, '#2EFF00', 0),
(6, 'SSR', NULL, '#671CE7', 0),
(7, 'COFIPAC', NULL, '#008080', 0),
(8, 'CDC', NULL, '#800080', 0),
(9, 'TST', NULL, '#2ECA00', 1),
(10, 'TW', NULL, '#DB4673', 1),
(11, 'MSKU', NULL, '#008484', 0),
(12, 'FCTC', NULL, '#ffffff', 0),
(13, 'SKMTI', NULL, '#183922', 0),
(14, 'XPCL', NULL, '#FBB51F', 0),
(15, 'PSACC', NULL, '#FEFF0A', 0),
(16, 'APL', NULL, '#FFFFFF', 0),
(17, 'NNCU', NULL, '#FFFFFF', 0),
(18, 'MAERSK', NULL, '#50739F', 0),
(19, 'SLI', NULL, '#FFFFFF', 0),
(20, 'ATG', NULL, '#ffffff', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcards`
--

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
  `tc_tempload_status` varchar(250) DEFAULT NULL,
  `is_tempload` tinyint(1) DEFAULT NULL,
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

--
-- Dumping data for table `tcards`
--

INSERT INTO `tcards` (`tc_id`, `v_id`, `tt_id`, `s_id`, `t_id`, `u_id`, `c_id`, `vt_id`, `tc_entrydate`, `tc_rdd`, `tc_bin`, `tc_batchcode`, `tc_remarks`, `tc_checker`, `tc_status`, `tc_position`, `tc_datestuffed`, `tc_dn`, `tc_sealno`, `tc_datesealed`, `tc_qcases`, `tc_qbags`, `tc_datestripped`, `tc_dateblocked`, `tc_stucontroller`, `tc_strcontroller`, `tc_block_reason`, `is_blocked`, `is_defective`, `tc_tempload_status`, `is_tempload`) VALUES
('201407-00001', 6, 3, 8, 8, 0, 1, 1, '2014-07-02 16:23:26', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-04', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00002', 7, 4, 2, 8, 0, 1, 4, '2014-07-02 17:04:35', NULL, '', '', '', '', 'EMPTY', NULL, '0000-00-00', '', '', '0000-00-00', '', '', '0000-00-00', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00003', 8, 4, 1, 1, 0, 1, 3, '2014-07-02 17:04:35', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00004', 9, 3, 4, 3, 0, 1, 2, '2014-07-02 17:45:26', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00005', 10, 3, 16, 8, 0, 1, 2, '2014-07-02 17:49:02', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00006', 11, 3, 7, 3, 0, 1, 2, '2014-07-02 17:49:27', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00007', 12, 3, 7, 3, 0, 1, 1, '2014-07-02 17:49:47', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00008', 13, 3, 8, 8, 0, 1, 1, '2014-07-02 17:54:47', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00009', 14, 3, 8, 8, 0, 1, 2, '2014-07-02 17:55:10', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00010', 15, 3, 11, 3, 0, 1, 1, '2014-07-02 17:56:24', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00011', 16, 3, 18, 2, 0, 1, 1, '2014-07-02 17:57:02', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00012', 17, 3, 18, 2, 0, 1, 1, '2014-07-02 17:57:24', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00013', 18, 3, 18, 2, 0, 1, 1, '2014-07-02 17:57:56', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00014', 19, 3, 18, 2, 0, 1, 1, '2014-07-02 17:59:59', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00015', 20, 3, 18, 2, 0, 1, 1, '2014-07-02 18:00:22', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00016', 21, 3, 18, 2, 0, 1, 1, '2014-07-02 18:00:40', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-03', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00017', 22, 3, 18, 2, 0, 1, 1, '2014-07-02 18:01:09', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-03', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00018', 23, 3, 16, 7, 0, 1, 1, '2014-07-02 18:01:31', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-04', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00019', 24, 3, 7, 2, 0, 1, 1, '2014-07-02 18:03:39', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00020', 25, 3, 16, 2, 0, 1, 1, '2014-07-02 18:04:03', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00021', 26, 3, 18, 2, 0, 1, 1, '2014-07-02 18:12:14', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-03', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00022', 27, 3, 16, 2, 0, 1, 1, '2014-07-02 18:12:51', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00023', 28, 3, 7, 2, 0, 1, 1, '2014-07-02 18:13:44', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00024', 29, 3, 7, 2, 0, 1, 2, '2014-07-02 18:14:03', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00025', 30, 3, 16, 8, 0, 1, 1, '2014-07-02 18:14:41', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00026', 31, 3, 7, 2, 0, 1, 2, '2014-07-02 18:15:10', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-03', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00027', 32, 3, 7, 2, 0, 1, 1, '2014-07-02 18:19:11', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00028', 33, 3, 7, 7, 0, 1, 1, '2014-07-02 18:19:38', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00029', 34, 3, 4, 7, 0, 1, 1, '2014-07-02 18:23:17', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00030', 35, 3, 8, 2, 0, 1, 1, '2014-07-02 18:39:37', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00031', 36, 3, 16, 2, 0, 1, 1, '2014-07-02 18:46:01', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, '', 0),
('201407-00032', 37, 3, 8, 2, 0, 1, 2, '2014-07-02 18:46:54', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00033', 38, 3, 8, 2, 0, 1, 1, '2014-07-02 18:48:13', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00034', 39, 3, 1, 2, 0, 1, 4, '2014-07-02 18:48:41', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-03', NULL, 0, 0, '', 0, 0, '', 0),
('201407-00035', 40, 4, 5, 8, 0, 1, 1, '2014-07-02 19:04:50', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, '2014-07-07 09:41:41', 0, 0, 'ASDSAD', 1, 1, NULL, 0),
('201407-00036', 41, 4, 11, 8, 0, 1, 1, '2014-07-02 19:05:25', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00037', 42, 4, 8, 8, 0, 1, 1, '2014-07-02 20:33:29', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00038', 43, 4, 5, 3, 0, 1, 2, '2014-07-02 20:35:34', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00039', 44, 4, 5, 3, 0, 1, 1, '2014-07-02 20:36:07', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00040', 45, 4, 14, 3, 0, 1, 1, '2014-07-02 20:38:30', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00041', 46, 4, 14, 7, 0, 1, 1, '2014-07-02 20:38:58', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-04', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00042', 47, 6, 14, 8, 0, 1, 2, '2014-07-02 20:42:17', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00043', 48, 4, 11, 8, 0, 1, 2, '2014-07-02 20:44:06', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-04', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00044', 49, 4, 10, 3, 0, 1, 1, '2014-07-02 20:44:51', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, '2014-07-03 14:26:11', 0, 0, '', 1, 1, NULL, 0),
('201407-00045', 50, 4, 11, 3, 0, 1, 1, '2014-07-02 20:45:23', NULL, '', '', '', '', 'EMPTY', NULL, '0000-00-00', '', '', '0000-00-00', '', '', '0000-00-00', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00046', 51, 4, 3, 2, 0, 1, 1, '2014-07-02 20:49:36', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00047', 52, 4, 8, 2, 0, 1, 1, '2014-07-02 21:46:14', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-03', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00048', 53, 4, 5, 3, 0, 1, 1, '2014-07-02 21:47:03', NULL, '', '', '', '', 'EMPTY', NULL, '0000-00-00', '', '', '0000-00-00', '', '', '0000-00-00', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00049', 54, 4, 5, 3, 0, 1, 1, '2014-07-02 21:47:26', NULL, '', '', '', '', 'EMPTY', NULL, '0000-00-00', '', '', '0000-00-00', '', '', '0000-00-00', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00050', 55, 4, 8, 2, 0, 1, 1, '2014-07-02 21:48:00', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00051', 56, 2, 2, 3, 0, 2, 2, '2014-07-02 22:20:49', '2014-07-04', 'ZFA214', '', '', NULL, 'FULLS', NULL, '2014-07-02', 'DN2135', 'ZGSDH12', '2014-07-02', '23', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00052', 57, 6, 4, 5, 0, 2, 1, '2014-07-02 22:24:20', '2014-07-05', 'ZFTG53', '', '', NULL, 'FULLS', NULL, '2014-07-02', 'A14DG', '', NULL, '23', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00053', 58, 4, 2, 8, 0, 1, 1, '2014-07-03 02:35:09', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00054', 59, 4, 3, 3, 0, 1, 1, '2014-07-03 02:37:17', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00055', 60, 4, 2, 2, 0, 1, 1, '2014-07-03 03:09:55', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00056', 61, 4, 3, 3, 0, 1, 1, '2014-07-03 03:10:27', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00057', 62, 4, 2, 2, 0, 1, 1, '2014-07-03 03:10:54', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-03', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00058', 63, 2, 2, 6, 0, 1, 1, '2014-07-03 21:55:44', '2014-07-08', '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', NULL, '2014-07-03 23:47:33', 0, 0, 'DEPEKTADO', 1, 1, NULL, 0),
('201407-00059', 64, 6, 16, 2, 0, 1, 1, '2014-07-03 21:57:38', '2014-07-08', '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', NULL, '2014-07-07 09:39:27', 0, 0, 'DEFECTIVE KAT', 1, 1, NULL, 0),
('201407-00060', 65, 4, 2, 8, 0, 1, 1, '2014-07-04 00:19:41', '2014-07-04', '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00061', 8, 4, 1, 1, 0, 1, 3, '2014-07-02 20:45:23', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00062', 8, 4, 1, 1, 0, 1, 3, '2014-07-02 21:47:03', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00063', 8, 4, 1, 1, 0, 1, 3, '2014-07-02 21:47:26', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00064', 66, 1, 2, 3, 0, 1, 1, '2014-07-04 03:03:56', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00065', 67, 1, 18, 8, 0, 1, 1, '2014-07-04 03:04:40', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00066', 68, 1, 8, 4, 0, 1, 1, '2014-07-04 03:05:51', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00067', 69, 1, 4, 9, 0, 1, 1, '2014-07-04 03:16:59', NULL, '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', '2014-07-04', NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00068', 70, 1, 3, 10, 0, 1, 1, '2014-07-06 09:04:23', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00069', 71, 2, 3, 11, 0, 2, 1, '2014-07-07 09:30:30', '2014-07-11', 'BSDFSD1', '', '', NULL, 'FULLS', NULL, '2014-07-07', 'SADASV314', '', NULL, '23', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00070', 72, 4, 3, 2, 0, 1, 1, '2014-07-07 09:37:06', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00071', 73, 6, 3, 5, 0, 2, 1, '2014-07-07 09:54:53', '2014-07-11', 'ZXFASIOJ213', '', '', NULL, 'FULLS', NULL, '2014-07-07', 'ASDSAFDG', 'SELYO 452', '2014-07-09', '23', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00072', 74, 6, 2, 3, 0, 2, 1, '2014-07-07 10:12:35', '2014-07-11', 'SADZXC1', '', '', NULL, 'FULLS', NULL, '2014-07-07', 'ASDASD', '', '2014-07-07', '23', '', NULL, '2014-07-08 10:23:18', 0, 0, '', 1, 0, NULL, 0),
('201407-00073', 75, 2, 14, 2, 0, 2, 1, '2014-07-07 10:13:58', '2014-07-12', 'ASDXCVV', '', '', NULL, 'FULLS', NULL, '2014-07-07', 'SADADASD', '', NULL, '23', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00074', 76, 6, 14, 7, 0, 2, 1, '2014-07-07 10:16:09', '2014-07-10', 'ZXZC2134', '', '', NULL, 'FULLS', NULL, '2014-07-18', 'SADASDAS', '', NULL, '23', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00075', 77, 2, 14, 10, 0, 2, 1, '2014-07-08 03:03:58', '2014-07-10', 'ZZXCAS', '', '', NULL, 'FULLS', NULL, '2014-07-08', 'ASDASD', 'ASDASDAD', '2014-07-08', '12', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00076', 78, 2, 19, 9, 0, 2, 1, '2014-07-08 03:05:53', '2014-07-10', 'ZZASD', '', '', NULL, 'FULLS', NULL, '2014-07-08', 'ASDASD', '', NULL, '12', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00077', 79, 2, 19, 2, 0, 2, 1, '2014-07-08 03:07:54', '2014-07-10', 'ZXCZXC', '', '', NULL, 'FULLS', NULL, '2014-07-17', 'ASDASDASD', '', NULL, '23', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00078', 80, 2, 3, 7, 0, 2, 1, '2014-07-08 03:23:22', '2014-07-11', '123213ASFD', '', '', NULL, 'FULLS', NULL, '2014-07-08', '123123ASDF', '', NULL, '23', '', NULL, NULL, 0, 0, '', 0, 0, NULL, 0),
('201407-00079', 81, 6, 14, 2, 0, 1, 1, '2014-07-09 09:52:56', '2014-07-12', '', '', '', NULL, 'EMPTY', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, '', 0),
('201407-00080', 82, 6, 4, 2, 0, 2, 1, '2014-07-09 09:54:00', '2014-07-12', '', '', '', NULL, 'FULLS', NULL, '2014-07-14', 'AWDS123', 'SELYOASD123', '2014-07-14', '23', '23', NULL, NULL, 0, 0, '', 0, 0, '', 0),
('201407-00081', 83, 2, 19, 6, 0, 2, 1, '2014-07-11 01:24:20', NULL, 'ZTAG123N', '', '', NULL, 'FULLS', NULL, '2014-07-11', '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, 'REWORK', 0),
('201407-00082', 84, 6, 2, 6, 0, 2, 1, '2014-07-11 01:26:44', '2014-07-18', 'ZTAGGF22', '', '', NULL, 'FULLS', NULL, '2014-07-11', 'DNDNDND', 'SEALYOASD', '2014-07-11', '23', '', NULL, NULL, 0, 0, '', 0, 0, '', 0),
('201407-00083', 86, 2, 19, 8, 0, 2, 1, '2014-07-11 01:41:33', '2014-07-19', '', '', '', NULL, 'FULLS', NULL, '2014-07-11', '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, 'REWORK', 0),
('201407-00084', 87, 6, 14, 7, 0, 2, 1, '2014-07-11 01:47:12', '2014-07-18', '', '', '', NULL, 'FULLS', NULL, '2014-07-11', '', '', NULL, '23', '', NULL, NULL, 0, 0, '', 0, 0, 'REWORK', 0),
('201407-00085', 88, 4, 2, 6, 0, 1, 1, '2014-07-11 06:25:36', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, 'HOUSEKEEPING', 0),
('201407-00086', 89, 4, 14, 2, 0, 1, 1, '2014-07-11 07:28:04', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, 'HOUSEKEEPING', 0),
('201407-00087', 90, 4, 14, 2, 0, 1, 1, '2014-07-11 07:31:37', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, 'HOUSEKEEPING', 0),
('201407-00088', 91, 4, 2, 8, 0, 1, 1, '2014-07-14 10:37:21', NULL, '', '', '', NULL, 'FULLS', NULL, NULL, '', '', NULL, '', '', NULL, NULL, 0, 0, '', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcards_exit_passes`
--

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

CREATE TABLE IF NOT EXISTS `tcard_incoming_materials` (
  `tim_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_id` varchar(20) NOT NULL,
  `im_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tim_id`),
  KEY `tcard_incomin_materials_fkey_idx` (`im_id`),
  KEY `tcard_incoming_materials_tcard_fkey_idx` (`tc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `tcard_incoming_materials`
--

INSERT INTO `tcard_incoming_materials` (`tim_id`, `tc_id`, `im_id`, `is_deleted`) VALUES
(1, '201407-00001', 1, 0),
(2, '201407-00003', 24, 0),
(3, '201407-00004', 1, 0),
(4, '201407-00005', 2, 0),
(5, '201407-00006', 3, 0),
(6, '201407-00007', 3, 0),
(7, '201407-00008', 3, 0),
(8, '201407-00009', 3, 0),
(9, '201407-00010', 1, 0),
(10, '201407-00011', 4, 0),
(11, '201407-00012', 5, 0),
(12, '201407-00013', 6, 0),
(13, '201407-00014', 7, 0),
(14, '201407-00015', 7, 1),
(15, '201407-00016', 8, 0),
(16, '201407-00017', 9, 0),
(17, '201407-00018', 10, 0),
(18, '201407-00019', 12, 0),
(19, '201407-00020', 12, 0),
(20, '201407-00015', 11, 0),
(21, '201407-00022', 13, 0),
(22, '201407-00023', 14, 0),
(23, '201407-00024', 14, 0),
(24, '201407-00025', 15, 0),
(25, '201407-00026', 16, 0),
(26, '201407-00027', 17, 0),
(27, '201407-00028', 18, 0),
(28, '201407-00029', 19, 0),
(29, '201407-00030', 20, 0),
(30, '201407-00031', 21, 0),
(31, '201407-00032', 21, 0),
(32, '201407-00033', 22, 0),
(33, '201407-00034', 23, 0),
(34, '201407-00035', 24, 0),
(35, '201407-00036', 25, 0),
(36, '201407-00037', 26, 0),
(37, '201407-00038', 27, 0),
(38, '201407-00039', 27, 0),
(39, '201407-00040', 28, 0),
(40, '201407-00041', 29, 0),
(41, '201407-00060', 30, 0),
(42, '201407-00043', 31, 0),
(43, '201407-00044', 32, 0),
(44, '201407-00061', 33, 0),
(45, '201407-00046', 34, 0),
(46, '201407-00047', 35, 0),
(47, '201407-00062', 36, 0),
(48, '201407-00063', 37, 0),
(49, '201407-00050', 38, 0),
(50, '201407-00053', 39, 0),
(51, '201407-00054', 39, 0),
(52, '201407-00055', 40, 0),
(53, '201407-00056', 40, 0),
(54, '201407-00057', 41, 0),
(55, '201407-00064', 42, 0),
(56, '201407-00065', 42, 0),
(57, '201407-00066', 42, 0),
(58, '201407-00067', 43, 0),
(59, '201407-00068', 43, 0),
(60, '201407-00070', 34, 0),
(61, '201407-00085', 27, 0),
(62, '201407-00086', 32, 0),
(63, '201407-00087', 28, 0),
(64, '201407-00088', 24, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcard_outgoing_materials`
--

CREATE TABLE IF NOT EXISTS `tcard_outgoing_materials` (
  `tom_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_id` varchar(20) NOT NULL,
  `m_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tom_id`),
  KEY `tcard_outgoing_materials_materials_fkey_idx` (`m_id`),
  KEY `tcard_outgoing_materials_tcards_fkey_idx` (`tc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tcard_outgoing_materials`
--

INSERT INTO `tcard_outgoing_materials` (`tom_id`, `tc_id`, `m_id`, `is_deleted`) VALUES
(1, '201407-00051', 4, 0),
(2, '201407-00052', 3, 0),
(3, '201407-00052', 5, 0),
(4, '201407-00069', 6, 0),
(5, '201407-00071', 4, 0),
(6, '201407-00072', 16, 0),
(7, '201407-00073', 18, 0),
(8, '201407-00074', 19, 0),
(9, '201407-00075', 22, 0),
(10, '201407-00076', 23, 0),
(11, '201407-00077', 23, 0),
(12, '201407-00078', 23, 0),
(13, '201407-00081', 6, 0),
(14, '201407-00082', 4, 0),
(15, '201407-00083', 5, 0),
(16, '201407-00084', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcard_position`
--

CREATE TABLE IF NOT EXISTS `tcard_position` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_id` varchar(20) NOT NULL,
  `tp_position` varchar(50) DEFAULT NULL,
  `tp_left` varchar(100) DEFAULT NULL,
  `tp_top` varchar(100) DEFAULT NULL,
  `tp_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tp_id`),
  KEY `fk_tcard_position_tcads_idx` (`tc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

--
-- Dumping data for table `tcard_position`
--

INSERT INTO `tcard_position` (`tp_id`, `tc_id`, `tp_position`, `tp_left`, `tp_top`, `tp_timestamp`) VALUES
(1, '201407-00001', 'pending', NULL, NULL, '2014-07-02 04:23:26'),
(2, '201407-00002', 'pending', NULL, NULL, '2014-07-02 05:04:35'),
(3, '201407-00001', 'O62', '141px', '59px', '2014-07-02 05:22:06'),
(4, '201407-00002', 'O61', '141px', '28px', '2014-07-02 05:22:09'),
(5, '201407-00002', 'pending', NULL, NULL, '2014-07-02 05:30:32'),
(6, '201407-00003', 'pending', NULL, NULL, '2014-07-02 05:30:46'),
(7, '201407-00004', 'pending', NULL, NULL, '2014-07-02 05:45:26'),
(8, '201407-00005', 'pending', NULL, NULL, '2014-07-02 05:49:02'),
(9, '201407-00006', 'pending', NULL, NULL, '2014-07-02 05:49:27'),
(10, '201407-00007', 'pending', NULL, NULL, '2014-07-02 05:49:47'),
(11, '201407-00008', 'pending', NULL, NULL, '2014-07-02 05:54:47'),
(12, '201407-00009', 'pending', NULL, NULL, '2014-07-02 05:55:10'),
(13, '201407-00010', 'pending', NULL, NULL, '2014-07-02 05:56:24'),
(14, '201407-00011', 'pending', NULL, NULL, '2014-07-02 05:57:02'),
(15, '201407-00012', 'pending', NULL, NULL, '2014-07-02 05:57:24'),
(16, '201407-00013', 'pending', NULL, NULL, '2014-07-02 05:57:56'),
(17, '201407-00004', '5A', '1071px', '955px', '2014-07-02 05:58:48'),
(18, '201407-00013', '59', '1071px', '924px', '2014-07-02 05:58:51'),
(19, '201407-00012', '48', '1102px', '893px', '2014-07-02 05:58:53'),
(20, '201407-00011', '22', '1164px', '707px', '2014-07-02 05:58:58'),
(21, '201407-00002', '12', '1195px', '707px', '2014-07-02 05:59:01'),
(22, '201407-00007', '34', '1133px', '769px', '2014-07-02 05:59:04'),
(23, '201407-00005', 'C1C', '1040px', '524px', '2014-07-02 05:59:07'),
(24, '201407-00006', 'C1A', '1009px', '524px', '2014-07-02 05:59:10'),
(25, '201407-00008', 'C18', '978px', '524px', '2014-07-02 05:59:13'),
(26, '201407-00009', 'D14', '1164px', '524px', '2014-07-02 05:59:16'),
(27, '201407-00010', 'D13', '1164px', '493px', '2014-07-02 05:59:19'),
(28, '201407-00014', 'pending', NULL, NULL, '2014-07-02 05:59:59'),
(29, '201407-00015', 'pending', NULL, NULL, '2014-07-02 06:00:22'),
(30, '201407-00016', 'pending', NULL, NULL, '2014-07-02 06:00:40'),
(31, '201407-00017', 'pending', NULL, NULL, '2014-07-02 06:01:09'),
(32, '201407-00018', 'pending', NULL, NULL, '2014-07-02 06:01:31'),
(33, '201407-00010', 'CE2', '1629px', '400px', '2014-07-02 06:02:34'),
(34, '201407-00019', 'pending', NULL, NULL, '2014-07-02 06:03:39'),
(35, '201407-00020', 'pending', NULL, NULL, '2014-07-02 06:04:03'),
(36, '201407-00021', 'pending', NULL, NULL, '2014-07-02 06:12:14'),
(37, '201407-00022', 'pending', NULL, NULL, '2014-07-02 06:12:51'),
(38, '201407-00023', 'pending', NULL, NULL, '2014-07-02 06:13:44'),
(39, '201407-00024', 'pending', NULL, NULL, '2014-07-02 06:14:04'),
(40, '201407-00025', 'pending', NULL, NULL, '2014-07-02 06:14:41'),
(41, '201407-00026', 'pending', NULL, NULL, '2014-07-02 06:15:10'),
(42, '201407-00027', 'pending', NULL, NULL, '2014-07-02 06:19:11'),
(43, '201407-00028', 'pending', NULL, NULL, '2014-07-02 06:19:38'),
(44, '201407-00029', 'pending', NULL, NULL, '2014-07-02 06:23:17'),
(45, '201407-00030', 'pending', NULL, NULL, '2014-07-02 06:39:37'),
(46, '201407-00031', 'pending', NULL, NULL, '2014-07-02 06:46:01'),
(47, '201407-00032', 'pending', NULL, NULL, '2014-07-02 06:46:54'),
(48, '201407-00033', 'pending', NULL, NULL, '2014-07-02 06:48:13'),
(49, '201407-00034', 'pending', NULL, NULL, '2014-07-02 06:48:41'),
(50, '201407-00035', 'pending', NULL, NULL, '2014-07-02 07:04:50'),
(51, '201407-00036', 'pending', NULL, NULL, '2014-07-02 07:05:25'),
(52, '201407-00037', 'pending', NULL, NULL, '2014-07-02 08:33:29'),
(53, '201407-00038', 'pending', NULL, NULL, '2014-07-02 08:35:34'),
(54, '201407-00039', 'pending', NULL, NULL, '2014-07-02 08:36:07'),
(55, '201407-00040', 'pending', NULL, NULL, '2014-07-02 08:38:31'),
(56, '201407-00041', 'pending', NULL, NULL, '2014-07-02 08:38:58'),
(57, '201407-00042', 'pending', NULL, NULL, '2014-07-02 08:42:17'),
(58, '201407-00043', 'pending', NULL, NULL, '2014-07-02 08:44:06'),
(59, '201407-00044', 'pending', NULL, NULL, '2014-07-02 08:44:51'),
(60, '201407-00045', 'pending', NULL, NULL, '2014-07-02 08:45:23'),
(61, '201407-00046', 'pending', NULL, NULL, '2014-07-02 08:49:36'),
(62, '201407-00047', 'pending', NULL, NULL, '2014-07-02 09:46:14'),
(63, '201407-00048', 'pending', NULL, NULL, '2014-07-02 09:47:03'),
(64, '201407-00049', 'pending', NULL, NULL, '2014-07-02 09:47:26'),
(65, '201407-00050', 'pending', NULL, NULL, '2014-07-02 09:48:00'),
(66, '201407-00051', 'pending', NULL, NULL, '2014-07-02 10:20:49'),
(67, '201407-00051', 'O52', '141px', '152px', '2014-07-02 10:20:53'),
(68, '201407-00052', 'pending', NULL, NULL, '2014-07-02 10:24:20'),
(69, '201407-00053', 'pending', NULL, NULL, '2014-07-03 02:35:09'),
(70, '201407-00054', 'pending', NULL, NULL, '2014-07-03 02:37:18'),
(71, '201407-00055', 'pending', NULL, NULL, '2014-07-03 03:09:55'),
(72, '201407-00056', 'pending', NULL, NULL, '2014-07-03 03:10:27'),
(73, '201407-00057', 'pending', NULL, NULL, '2014-07-03 03:10:54'),
(74, '201407-00058', 'pending', NULL, NULL, '2014-07-03 21:55:44'),
(75, '201407-00059', 'pending', NULL, NULL, '2014-07-03 21:57:38'),
(76, '201407-00060', 'pending', NULL, NULL, '2014-07-04 00:19:41'),
(77, '201407-00061', 'pending', NULL, NULL, '2014-07-04 00:29:34'),
(78, '201407-00062', 'pending', NULL, NULL, '2014-07-04 00:32:43'),
(79, '201407-00063', 'pending', NULL, NULL, '2014-07-04 02:14:51'),
(80, '201407-00064', 'pending', NULL, NULL, '2014-07-04 03:03:56'),
(81, '201407-00065', 'pending', NULL, NULL, '2014-07-04 03:04:40'),
(82, '201407-00066', 'pending', NULL, NULL, '2014-07-04 03:05:52'),
(83, '201407-00067', 'pending', NULL, NULL, '2014-07-04 03:16:59'),
(84, '201407-00068', 'pending', NULL, NULL, '2014-07-06 09:04:23'),
(85, '201407-00069', 'pending', NULL, NULL, '2014-07-07 09:30:30'),
(86, '201407-00070', 'pending', NULL, NULL, '2014-07-07 09:37:06'),
(87, '201407-00071', 'pending', NULL, NULL, '2014-07-07 09:54:54'),
(88, '201407-00072', 'pending', NULL, NULL, '2014-07-07 10:12:35'),
(89, '201407-00073', 'pending', NULL, NULL, '2014-07-07 10:13:58'),
(90, '201407-00074', 'pending', NULL, NULL, '2014-07-07 10:16:09'),
(91, '201407-00075', 'pending', NULL, NULL, '2014-07-08 03:03:58'),
(92, '201407-00076', 'pending', NULL, NULL, '2014-07-08 03:05:53'),
(93, '201407-00077', 'pending', NULL, NULL, '2014-07-08 03:07:54'),
(94, '201407-00078', 'pending', NULL, NULL, '2014-07-08 03:23:22'),
(95, '201407-00079', 'pending', NULL, NULL, '2014-07-09 09:52:56'),
(96, '201407-00080', 'pending', NULL, NULL, '2014-07-09 09:54:00'),
(97, '201407-00081', 'pending', NULL, NULL, '2014-07-11 01:24:20'),
(98, '201407-00082', 'pending', NULL, NULL, '2014-07-11 01:26:44'),
(99, '201407-00083', 'pending', NULL, NULL, '2014-07-11 01:41:33'),
(100, '201407-00084', 'pending', NULL, NULL, '2014-07-11 01:47:12'),
(101, '201407-00085', 'pending', NULL, NULL, '2014-07-11 06:25:36'),
(102, '201407-00086', 'pending', NULL, NULL, '2014-07-11 07:28:05'),
(103, '201407-00087', 'pending', NULL, NULL, '2014-07-11 07:31:37'),
(104, '201407-00088', 'pending', NULL, NULL, '2014-07-14 10:37:21'),
(105, '201407-00009', 'D16', '1195px', '524px', '2014-07-15 01:36:39'),
(106, '201407-00059', 'C12', '885px', '524px', '2014-07-15 01:36:51'),
(107, '201407-00066', 'C14', '916px', '524px', '2014-07-15 01:36:53'),
(108, '201407-00076', 'B1A', '761px', '524px', '2014-07-15 01:36:56'),
(109, '201407-00046', 'A22', '389px', '431px', '2014-07-15 01:37:52'),
(110, '201407-00068', 'A26', '451px', '431px', '2014-07-15 01:37:57'),
(111, '201407-00057', 'A28', '482px', '431px', '2014-07-15 01:37:59'),
(112, '201407-00065', 'A21', '389px', '400px', '2014-07-15 01:38:02'),
(113, '201407-00079', 'O4C', '296px', '245px', '2014-07-15 01:38:14'),
(114, '201407-00048', 'A44', '420px', '245px', '2014-07-15 01:38:17'),
(115, '201407-00052', 'A46', '451px', '245px', '2014-07-15 01:38:20'),
(116, '201407-00029', 'O62', '141px', '59px', '2014-07-15 01:38:23'),
(117, '201407-00018', 'O42', '141px', '245px', '2014-07-15 01:38:26'),
(118, '201407-00031', 'O64', '172px', '59px', '2014-07-15 01:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `tcard_types`
--

CREATE TABLE IF NOT EXISTS `tcard_types` (
  `tt_id` int(11) NOT NULL AUTO_INCREMENT,
  `tt_name` varchar(100) DEFAULT NULL,
  `tt_color` varchar(10) DEFAULT NULL,
  `ttg_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tt_id`),
  KEY `fk_tcard_types_tcard_type_group_idx` (`ttg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tcard_types`
--

INSERT INTO `tcard_types` (`tt_id`, `tt_name`, `tt_color`, `ttg_id`, `is_deleted`) VALUES
(1, 'GREEN COFFEE', '#0DF02B', 2, 0),
(2, 'RESUPPLY', '#FFFF8C', 3, 0),
(3, 'PACK MATS', '#FF60A6', 2, 0),
(4, 'RAW MATS', '#078BF5', 2, 0),
(5, 'TEMPLOAD', '#FC3904', 1, 0),
(6, 'EXFACTORY', '#FFFF00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcard_type_group`
--

CREATE TABLE IF NOT EXISTS `tcard_type_group` (
  `ttg_id` int(11) NOT NULL AUTO_INCREMENT,
  `ttg_name` varchar(20) NOT NULL,
  PRIMARY KEY (`ttg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tcard_type_group`
--

INSERT INTO `tcard_type_group` (`ttg_id`, `ttg_name`) VALUES
(1, 'None'),
(2, 'Stripping'),
(3, 'Stuffing');

-- --------------------------------------------------------

--
-- Table structure for table `truckers`
--

CREATE TABLE IF NOT EXISTS `truckers` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(255) DEFAULT NULL,
  `t_code` varchar(20) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `truckers`
--

INSERT INTO `truckers` (`t_id`, `t_name`, `t_code`, `is_deleted`) VALUES
(1, 'None', '', 0),
(2, 'TRANSPECIAL', 'TST', 0),
(3, 'TRANSWORLD', 'TWBC', 0),
(4, 'SULTAN ', 'SKMTI', 0),
(5, 'DTS', 'DTS', 0),
(6, 'KMG ', 'KMG', 0),
(7, 'FAST CARGO', 'FCTC', 0),
(8, 'INLAND', 'INLAND', 0),
(9, 'ONESTOP', 'ONESTOP', 0),
(10, 'RC', 'RC', 0),
(11, 'KMI', 'KMI', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `u_username`, `u_password`, `u_firstname`, `u_lastname`, `u_mi`, `u_isactive`, `u_addedby`, `u_dateadded`, `u_contactno`, `u_isadmin`) VALUES
(0, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', '', '', 1, NULL, '2014-04-23 23:07:40', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vans`
--

CREATE TABLE IF NOT EXISTS `vans` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `vans`
--

INSERT INTO `vans` (`v_id`, `v_no`) VALUES
(1, 'SOLID 314FGD'),
(2, ''),
(3, 'SOLID ASFJKL1234'),
(4, 'SOLID SDAF12'),
(5, 'SOLID SAFQ124'),
(6, 'SOLID ASFADSF13'),
(7, 'NMC DAF92134'),
(8, 'WINGVAN'),
(9, '2GO 214GDF'),
(10, 'APL SDFG24'),
(11, 'COFIPAC ASDF42'),
(12, 'COFIPAC SDGFWT4'),
(13, 'CDC RG3245'),
(14, 'CDC FDG356THD'),
(15, 'MSKU SDGDFGLKJ314'),
(16, 'MAERSK SDGDFYT234'),
(17, 'MAERSK ADFGSDFG4'),
(18, 'MAERSK DGFDG'),
(19, 'MAERSK DSGRET34'),
(20, 'MAERSK DSGER534'),
(21, 'MAESRK SDG35462'),
(22, 'MAERSK DSFG3456'),
(23, 'APL FDGDFG43'),
(24, 'COFIPAC DSGDFHGFH43'),
(25, 'APL DFGDFGH'),
(26, 'MAESKG FHDN34'),
(27, 'APL DSGDFGVCB'),
(28, 'COFIPAC SFGBFBNVBV54'),
(29, 'COFIPAC DFHGFGH5T'),
(30, 'APL BVCBRTY546'),
(31, 'COFIPAC VCXDF34'),
(32, 'COFIPAC VCBMERTJKL32'),
(33, 'COFIPAC DCVBRGY534'),
(34, '2GO DFMK345ASD'),
(35, 'CDC FDHO345M'),
(36, 'APL VCBMLI34'),
(37, 'CDC SDGLJKDBM245'),
(38, 'CDC VCB5ERYT'),
(39, 'GS FDBDKLJ235'),
(40, 'GS BVCMFDGJ'),
(41, 'MSKU VCXJISDFGMKN2'),
(42, 'CDC CXBVDOIJNM1'),
(43, 'GS CXVASFOI12'),
(44, 'GS XCBOIFSDG123'),
(45, 'XPCL LGF23MK-1'),
(46, 'XPCL 324HJH1-2'),
(47, 'XPCL FGSDG-24'),
(48, 'MSKU ASFKL12-1'),
(49, 'TW SDFS-DJK213'),
(50, 'MSKU DFSADF123-5'),
(51, 'SOLID SDFGSRT11-2'),
(52, 'CDC SDFSKL123'),
(53, 'GS SDGVGS34'),
(54, 'GS ASDN123'),
(55, 'CDC ASDASD123'),
(56, 'NMC ASDAS124'),
(57, '2GO ADS134'),
(58, 'NMC SADFLK314'),
(59, 'SOLID  DSFG324'),
(60, 'NMC DSG234 '),
(61, 'SOLID SDGSDG1-2'),
(62, 'NMC SDFGXCB-12'),
(63, 'NMC ASDOIJ134'),
(64, 'APL DSFJ123'),
(65, 'NMC CHUASHDUSANK12'),
(66, 'NMC SAD213'),
(67, 'MAERSK ASFOJIANKL21'),
(68, 'CDC ASFDLKJ134MN'),
(69, '2GO SDAFGM12'),
(70, 'SOLID 123SDFLK12'),
(71, 'SOLID DSF23325'),
(72, 'SOLID DSFSDF1234'),
(73, 'SOLID SDFG2341'),
(74, 'NMC ASDFOPASDML13'),
(75, 'XPCL SAD12231'),
(76, 'XPCL ASDASD'),
(77, 'XPCL -ASDSDF-12'),
(78, 'SLI ASDASD1'),
(79, 'SLI CHUCHUASD'),
(80, 'SOLID ASDASDKLSFD'),
(81, 'XPCL ASDSAD12213'),
(82, '2GO DSF1324'),
(83, 'SLI ASDASN213'),
(84, 'NMC ASDKL213'),
(85, 'XPCL DSFSR123'),
(86, 'SLI ASD123'),
(87, 'XPCL ASD123'),
(88, 'NMC ASD213132'),
(89, 'XPACL SADASD123'),
(90, 'XPCL ASDQWE123'),
(91, 'NMC ASD123ADS');

-- --------------------------------------------------------

--
-- Table structure for table `van_types`
--

CREATE TABLE IF NOT EXISTS `van_types` (
  `vt_id` int(11) NOT NULL AUTO_INCREMENT,
  `vt_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vt_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `van_types`
--

INSERT INTO `van_types` (`vt_id`, `vt_name`, `is_deleted`) VALUES
(1, '20', 0),
(2, '40', 0),
(3, 'WINGVAN', 0),
(4, '10', 0);

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
