-- Restart all the autoincrement sequence

ALTER TABLE `users` AUTO_INCREMENT = 1;
ALTER TABLE `checkers` AUTO_INCREMENT = 1;
ALTER TABLE `exit_passes` AUTO_INCREMENT = 1;
ALTER TABLE `incoming_materials` AUTO_INCREMENT = 1;
ALTER TABLE `materials` AUTO_INCREMENT = 1;
ALTER TABLE `shippers` AUTO_INCREMENT = 1;
ALTER TABLE `tcards` AUTO_INCREMENT = 1;
ALTER TABLE `tcards_exit_passes` AUTO_INCREMENT = 1;
ALTER TABLE `tcards_history` AUTO_INCREMENT = 1;
ALTER TABLE `tcard_incoming_materials` AUTO_INCREMENT = 1;
ALTER TABLE `tcard_outgoing_materials` AUTO_INCREMENT = 1;
ALTER TABLE `tcard_position` AUTO_INCREMENT = 1;
ALTER TABLE `tcard_types` AUTO_INCREMENT = 1;
ALTER TABLE `tcard_type_group` AUTO_INCREMENT = 1;
ALTER TABLE `truckers` AUTO_INCREMENT = 1;
ALTER TABLE `vans` AUTO_INCREMENT = 1;
ALTER TABLE `van_types` AUTO_INCREMENT = 1;


INSERT INTO `checkers` (`c_id`, `c_firstname`, `c_lastname`, `c_mi`, `is_deleted`) VALUES
(1, 'None', '', '', 0);

INSERT INTO `materials` (`m_id`, `m_name`, `m_description`, `m_type`, `m_category`, `is_deleted`) VALUES
(1, 'None', '', '', '', 0);

INSERT INTO `materials` (`m_name`, `m_description`, `m_type`, `m_category`, `is_deleted`) VALUES
('12191359', 'NESTLE BEAR BRAND WITH IRON 16(8X33G) PH', 'MILK', 'FG', 0),
('12176151', 'NESTLE BEAR BRAND WITH IRON 30X300GN1 PH', 'MILK', 'FG', 0),
('12176152', 'NESTLE BEAR BRAND WITH IRON 14X680GN1 PH', 'MILK', 'FG', 0),
('12191358', 'NESTLE BEAR BRAND WITH IRON 72X150GN3 PH', 'MILK', 'FG', 0),
('12176072', 'NESTLE BEAR BRAND WITH IRON 120X80GN1 PH', 'MILK', 'FG', 0),
('43396373', 'NESTLE BEAR BRAND MILK POWDER 700KG BULK', 'MILK', 'FG', 0),
('12248410', 'BEAR BRAND W IRON+ZINC+VITC 120X80G PH', 'MILK', 'FG', 0),
('12248412', 'BEAR BRAND W IRON+ZINC+VITC 72X150G PH', 'MILK', 'FG', 0),
('12248411', 'BEAR BRAND W IRON+ZINC+VITC 128X33G PH', 'MILK', 'FG', 0),
('12248414', 'BEAR BRAND W IRON+ZINC+VITC 14X700G PH', 'MILK', 'FG', 0),
('12248413', 'BEAR BRAND W IRON+ZINC+VITC 30X320G PH', 'MILK', 'FG', 0),
('12248415', 'BEAR BRAND W IRON+ZINC+VITC 14X900G PH', 'MILK', 'FG', 0),
('12248417', 'BEAR BRAND W IRON+ZINC+VITC 12X1.2KG PH', 'MILK', 'FG', 0),
('43574723', 'BEAR BRAND MILK POWDER MQAV008A-2 700KG', 'MILK', 'FG', 0),
('12179638', 'NC 25G', 'COFFEE', 'FG', 0),
('12180259', 'NC 100G', 'COFFEE', 'FG', 0),
('12180270', 'NC 50G', 'COFFEE', 'FG', 0),
('12184132', 'NC REFILL 25G', 'COFFEE', 'FG', 0),
('43545752', 'KERF533 BIGBAG 230KG', 'COFFEE', 'FG', 0),
('43545408', 'KERF 583 BIGBAG GAUDI', 'COFFEE', 'FG', 0);

INSERT INTO `shippers` (`s_id`, `s_name`, `s_code`, `s_color`, `is_deleted`) VALUES
(1, 'None', NULL, '#ffffff', 1);

INSERT INTO `shippers` (`s_name`, `s_code`, `s_color`, `is_deleted`) VALUES
('NMC', NULL, '#DF00B3', 0),
('SOLID', NULL, '#1C1CCE', 0),
('2GO', NULL, '#FB4B06', 0),
('GS', NULL, '#2EFF00', 0),
('SSR', NULL, '#671CE7', 0),
('COFIPAC', NULL, '#008080', 0),
('CDC', NULL, '#800080', 0),
('TST', NULL, '#2ECA00', 0),
('TW', NULL, '#DB4673', 0),
('MSKU', NULL, '#008484', 0),
('FCTC', NULL, '#ffffff', 0),
('SKMTI', NULL, '#183922', 0),
('XPCL', NULL, '#FBB51F', 0),
('PSACC', NULL, '#FEFF0A', 0),
('APL', NULL, '#FFFFFF', 0),
('NNCU', NULL, '#FFFFFF', 0),
('MAERSK', NULL, '#FFFFFF', 0);

INSERT INTO `tcard_type_group` (`ttg_id`, `ttg_name`) VALUES
(1, 'None'),  
(2, 'Stripping'),
(3, 'Stuffing');


INSERT INTO `truckers` (`t_id`, `t_name`, `t_code`, `is_deleted`) VALUES
(1, 'None', '', 0);

INSERT INTO `truckers` (`t_name`, `t_code`, `is_deleted`) VALUES
('TRANSPECIAL', 'TST', 0),
('TRANSWORLD', 'TWBC', 0),
('SULTAN ', 'SKMTI', 0),
('DTS', 'DTS', 0),
('KMG ', 'KMG', 0),
('FAST CARGO', 'FCTC', 0),
('INLAND', 'INLAND', 0),
('ONESTOP', 'ONESTOP', 0),
('RC', 'ONESTOP', 0);

INSERT INTO `users` (`u_id`, `u_username`, `u_password`, `u_firstname`, `u_lastname`, `u_mi`, `u_isactive`, `u_addedby`, `u_dateadded`, `u_contactno`, `u_isadmin`) VALUES
('', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', '', '', 1, NULL, '2014-04-23 19:07:40', '', 1);

INSERT INTO `van_types` (`vt_name`, `is_deleted`) VALUES
('20', 0),
('40', 0),
('WINGVAN', 0),
('10', 0);

INSERT INTO `incoming_materials` (`im_name`, `im_category`, `is_deleted`) VALUES
('DECAF', 'IMPORTED', 0),
('SLIPSHEETS', 'IMPORTED', 0),
('LAMINATES', 'IMPORTED', 0),
('BBI 680G KDC', 'LOCAL', 0),
('BBI 80G KDC', 'LOCAL', 0),
('BBI 100G KDC', 'LOCAL', 0),
('BBI 150G KDC', 'LOCAL', 0),
('BBI 320G KDC', 'LOCAL', 0),
('BBI 33G KDC', 'LOCAL', 0),
('SLEEVES 80G', 'LOCAL', 0),
('SLEEVES 300 KDC', 'LOCAL', 0),
('SLEEVES 330G AUTO', 'LOCAL', 0),
('KDC 750/900', 'LOCAL', 0),
('NESCAFE 25G KDF', 'LOCAL', 0),
('POLYTHYLENE', 'LOCAL', 0),
('NESCAFE 150G KDC', 'LOCAL', 0),
('DECAF 20G KDC', 'LOCAL', 0),
('DECAF 40G KDC', 'LOCAL', 0),
('DECAF 80G KDC', 'LOCAL', 0),
('BBI IC-150', 'LOCAL', 0),
('UNPRINTED LAMINATES', 'LOCAL', 0),
('EMPTY MEGA BAG', 'LOCAL', 0),
('ADHESIVE GLUE', 'LOCAL', 0),
('GLUCOSE FLEXITANK', 'IMPORTED', 0),
('GLUCOSE POWER(GLUCIDEX)', 'IMPORTED', 0),
('GLUCOSE DRUMS(SYRUP)', 'IMPORTED', 0),
('MSK MEDIUM HEAT', 'IMPORTED', 0),
('SBMP', 'IMPORTED', 0),
('MILK BUDS', 'IMPORTED', 0),
('K-CASIENATE', 'IMPORTED', 0),
('TRACE ELEMENTS', 'IMPORTED', 0),
('AMF', 'IMPORTED', 0),
('BUTTER MILK', 'IMPORTED', 0),
('DIMODAN', 'LOCAL', 0),
('SUGAR', 'LOCAL', 0),
('VITAMIN PREMIX', 'LOCAL', 0),
('SODIUM CITRATE', 'LOCAL', 0),
('CALCIUM CITRATE', 'LOCAL', 0),
('MALTO POWDER (TEMPLOAD)', 'TEMPLOAD', 0),
('MSK MEDIUM HEAT (TEMPLOAD)', 'TEMPLOAD', 0),
('AMF/DRUMS/SBMP (TEMPLOAD)', 'TEMPLOAD', 0);

INSERT INTO `tcard_types` (`tt_name`, `tt_color`, `ttg_id`, `is_deleted`) VALUES
('GREEN COFFEE', '#0DF02B', 2, 0),
('RESUPPLY', '#FFFF8C', 3, 0),
('PACK MATS', '#FF60A6', 2, 0),
('RAW MATS', '#078BF5', 2, 0),
('TEMPLOAD', '#FC3904', 1, 0),
('EXFAC', '#FFFF00', 3, 0);
