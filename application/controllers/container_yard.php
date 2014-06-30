<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Container_yard extends MY_Controller {
	
	function index() {
		
		$this->load->helper('date');
		
		// css
		$css = array(
				'select2.css',
				/* 'jquery-ui-1.8.16.bootstrap.css', */
				'jquery-ui-1.10.4.custom.css',
				'timepicker.css',
				'container-yard.css', 
				'reports.css'
		);
		$this->smarty->assign('page_css', $css);
		
		// JS
		$js = array(
				'jquery-ui-1.10.4.smoothness.js',
				'custom-datepicker.js',
				'jquery.nicescroll.min.js',
				'timepicker.js',
				'select2.min.js',
				'pages/container-yard.js',
				'pages/cy-tcard.js',
				'pages/cy-exitpass.js',
				'pages/cy-tcard-filter.js',
				'pages/cy-print-filter.js',
				'pages/cy-van-transfer.js',
				'checknumeric.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Active CY Controller
		$c = $this->session->userdata(SESSION_VAR);
		$c_data = $this->users_model->get_user_by_id( $c['u_id'] );
		$controller = $c_data[0]['u_firstname'] . ' ' . $c_data[0]['u_lastname'];
		$this->smarty->assign('active_controller', $controller);
		
		// Current Date
		$date_entry = date('d M Y');
		$this->smarty->assign('current_date_entry', $date_entry);
		
		// Form names
		$form_names = $this->_form_names();
		$this->smarty->assign('form', $form_names);
		
		// Get cards - segregated
		$cards = $this->_list_tcards();
		$tcards = array();
		$index = '';
		if( $cards ) {
			foreach($cards as $k => $card) {
				$row = (array)$card;
				$index = $row['tp_top'] || $row['tp_left'] ? 'positioned' : 'pending';
				// 				$row['display_chars'] = substr($row['v_no'], 0, 3);
		
				// 				$cards[$k] = (object) $row;
				
				$timespan = NULL;
				$dayspan = NULL;
				
				if( $row['tc_entrydate'] != '' ) {
					$timespan = $this->_get_timespan( mysql_to_unix( $row['tc_entrydate'] ), time() );
					$dayspan = $this->_get_dayspan(new DateTime( $row['tc_entrydate'] ), new DateTime());
				}
				
				$row['for_dispatch'] = $this->_is_ready_for_dispatch( $card->tc_id ) ? 'true' : 'false';
				$row['entry_timespan'] = $timespan;
				$row['entry_dayspan'] = $dayspan;
				
				$tcards[$index][] = (object) $row;
			}
		}
		$this->smarty->assign('tcards', $tcards);
		
		
		$data['layout_js'] = '';
		$data['company_name'] = 'Oroport Cargoholding Services Inc.';
		$data['company_address'] = 'Port Area, Puntod, Cagayan de Oro';
		
		$this->smarty->assign('layout', 'cy_layout.tpl');
		$this->smarty->view('pages/container_yard.tpl', $data);
	}
	
	function save_card() {
		$forms = $this->_form_names();
		
		try {
			
			$id = trim( $this->input->post('card_id') );
			$is_returned = $this->input->post('is-returned');
			$wingvan_transfer = $this->input->post('wingvan-transfer');
			
			if( $is_returned == '1' ) {
				
				$this->_force_return_van($id);
				$action = 'create';
				
			}else if( $wingvan_transfer == '1' ) {
				$action = 'create';
				
			}else {
				$shipper = $this->input->post($forms->shipper);
				$trucker = $this->input->post($forms->trucker);
				$bin_no = $this->input->post($forms->bin_no);
				$van = $this->input->post($forms->van_no);
				$tcard_type = $this->input->post($forms->card_type);
				$material_nos = $this->input->post($forms->material_no);
				$incoming_materials = $this->input->post('incoming-materials');
				$van_type = $this->input->post($forms->van_type);
				$batch_code = $this->input->post($forms->batch_code);
				$status = $this->input->post($forms->status);
				$qty_cases = $this->input->post($forms->qty_cases);
				$qty_bags = $this->input->post($forms->qty_bags);
				$date_stuffed = $this->input->post($forms->date_stuffed);
				$date_stripped = $this->input->post($forms->date_stripped);
				$checker = $this->input->post($forms->checker);
				$rdd = $this->input->post($forms->rdd);
				$dn = $this->input->post($forms->dn_no);
				$date_sealed = $this->input->post($forms->date_sealed);
				$seal_no = $this->input->post($forms->seal_no);
				$remarks = $this->input->post($forms->remarks);
					
				
				$is_blocked = $this->input->post($forms->is_blocked);
				$is_defective = $this->input->post($forms->is_defective);
				$block_reason = $this->input->post($forms->block_reason);
					
				$user = $this->session->userdata(SESSION_VAR);
				
				/* TRANSFORM DATA */
				$action = $id && $id != '' && $this->_validate_card_id($id) ? 'update' : 'create';
				$shipper = isset($shipper) && $shipper != '' ? $shipper : '1';
				$trucker = isset($trucker) && $trucker != '' ? $trucker : '1';
				$checker = isset($checker) && $checker != '' ? $checker : '1';
					
				// Get T-card block status
				$current_block_status = $action == 'update' ? $this->tcard_model->get_tcard_block_status($id)->is_blocked : 0;
				$date_blocked = $is_blocked == 1 && $current_block_status == 0 ? date("Y-m-d H:i:s") : NULL;
					
				// Van ID
				$van_id = $this->_get_van_id( $van );
					
				// Incoming Materials
				$incoming_materials = $this->_udpate_incoming_materials($id, $incoming_materials);
				
				// Outgoing Materials
				$outgoing_materials = $this->_udpate_outgoing_materials( $id, $material_nos );
					
				// Stuffing Controller
				$stu_data = array();
				if( $this->_card_value_changed($id, 'tc_datestuffed', $date_stuffed) ) {
					$stu_data = array(
							'tc_datestuffed' => $date_stuffed != '' ? date("Y-m-d", strtotime($date_stuffed)) : NULL,
							'tc_stucontroller' => $user['u_id']
					);
				}
					
				// Stripping Controller
				$str_data = array();
				if( $this->_card_value_changed($id, 'tc_datestripped', $date_stripped) ) {
					$str_data = array(
							'tc_datestripped' => $date_stripped != '' ? date("Y-m-d", strtotime($date_stripped)) : NULL,
							'tc_strcontroller' => $user['u_id']
					);
				}
					
				$data = array(
						's_id' => $shipper,
						't_id' => $trucker,
						'tc_bin' => strtoupper( $bin_no ),
						'v_id' => $van_id,
						'c_id' => $checker,
						'vt_id' => $van_type,
						'tt_id' => $tcard_type,
						'tc_batchcode' => strtoupper( $batch_code ),
						'tc_status' => strtoupper( $status ),
						'tc_qcases' => $qty_cases,
						'tc_qbags' => $qty_bags,
						'tc_dateblocked' => $date_blocked,
						'tc_rdd' => $rdd != '' ? date("Y-m-d", strtotime($rdd)) : NULL,
						'tc_dn' => strtoupper($dn),
						'tc_datesealed' => $date_sealed != '' ? date("Y-m-d", strtotime($date_sealed)) : NULL,
						'tc_sealno' => strtoupper( $seal_no ),
						'tc_remarks' => strtoupper( $remarks ),
						'tc_block_reason' => strtoupper( $block_reason ),
						'is_blocked' => $is_blocked,
						'is_defective' => $is_defective,
						'u_id' => $user['u_id']
				);
					
				$data = array_merge($data, $stu_data, $str_data);
					
				if( $action == 'create' ) {
					// add entry date
					$data['tc_entrydate'] = date("Y-m-d H:i:s");
					
					$id = $this->tcard_model->new_card($data);
				
					$tp_data = array(
							'tc_id' => $id,
							'tp_position' => 'pending'
					);
				
					$tp_id = $this->tcard_model->new_card_position($tp_data);
				}elseif( $action == 'update' ) {
					$this->tcard_model->update_tcard($id, $data);
				}
					
				// Insert new incoming materials
				if( $incoming_materials ) {
					foreach( $incoming_materials as $k => $mat ) {
						$mat_data = array(
								'tc_id' => $id,
								'im_id' => $mat
						);
							
						$this->tcard_model->new_tcard_incoming_material( $mat_data );
					}
				}
				
				// Insert new outgoing materials
				if( $outgoing_materials ) {
					foreach( $outgoing_materials as $k => $mat ) {
						$mat_data = array(
								'tc_id' => $id,
								'm_id' => $mat
						);
							
						$this->tcard_model->new_tcard_outgoing_material( $mat_data );
					}
				}
			}
			
			
			$tcard = $this->_get_tcard_by_id($id);
			
			$var['tcard'] = $tcard;
			$var['action'] = $action;
			$var['success'] = TRUE;
			
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode( $var );
	}
	
	function get_vans() {
		try {
			$vans = $this->_get_van_list();
			$var['success'] = TRUE;
			$var['vans'] = $vans;
			
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		
		echo json_encode($var);
	}
	
	function get_form_names() {
		try {
			$var['form_names'] = $this->_form_names();
			$var['success'] = TRUE;
				
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode($var);
	}
	
	function validate_form() {
	
		$forms = $this->_form_names();
	
		try {
			$var['success'] = TRUE;
				
			$this->_set_form_rules();
				
			if( !$this->form_validation->run() ) {
				$var['success'] = FALSE;
	
				// form errors
				$var['form_errors'] = array();
				
				foreach( $forms as $form ) {
					$var['form_errors'][$form] = form_error($form) ? form_error($form) : NULL; 
				}
			}
		} catch (Exception $e) {
			$var['success'] = FALSE;
			$var['exception'] = $e->getMessage();
		}
	
		echo json_encode( $var );
	}
	
	function is_date($date_str) {
		$is_date = FALSE;
	
		// assuming the js format yy-mm-dd
		$date = explode("-", $date_str, 3);
		if( $date_str == '' || (isset($date[0]) && isset($date[1]) && isset($date[2]) && checkdate( intval($date[1]), intval($date[2]), intval($date[0]) )) ) {
			$is_date = TRUE;
		}else {
			$this->form_validation->set_message('is_date', 'Invalid date.');
		}
	
		return $is_date;
	}
	
	function van_unique( $van_no, $trucker_shipper_ids ) {
		$is_unique = TRUE;
		
		$id_array = explode(',', $trucker_shipper_ids);
		$id_array = array(
			'trucker' => trim($id_array[0]) ? trim($id_array[0]) : 1,
			'shipper' => trim($id_array[1]) ? trim($id_array[1]) : 1,
			'tcard_id' => $id_array[2] ? trim($id_array[2]) : ''
		);
		
		$card = $this->tcard_model->get_card_by_van_shipper_trucker( $van_no, $id_array['shipper'], $id_array['trucker'], $id_array['tcard_id'] );
		
		if( $card ) {
			$is_unique = FALSE;
			$this->form_validation->set_message('van_unique', 'This van number along with the selected shipper and/or trucker is already present inside the yard.');
		}
		
		return $is_unique;
	}
	
	function get_card_details() {
		$id = trim($this->input->post('id'));
		
		try {
			$details = $this->_get_card_details_by_id($id);
			
			$var['details'] = $details;
			$var['success'] = !empty($details) ? TRUE : FALSE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode($var);
	}
	
	function save_position() {
		$id = $this->input->post('id');
		$dataposition = $this->input->post('dataposition');
		$top = $this->input->post('top');
		$left = $this->input->post('left');

		$data = array(
				'tc_id' => $id,
				'tp_position' => $dataposition,
				'tp_top' => $top,
				'tp_left' => $left
		);

		$tp_id = $this->tcard_model->new_card_position($data);

		if($tp_id){
			$data['success'] = TRUE;
		} else {
			$data['success'] = FALSE;
		}

		echo json_encode($data);
	}
	
	function new_exit_pass() {
		$data['success'] = FALSE;
		
		
		try {
			$id = $this->input->post('id');
			
			$tcard = $this->tcard_model->get_tcard_by_id($id);
			if( $tcard ) {
				$details = array(
					'tc_id' => $tcard->tc_id,
					'vt_name' => $tcard->vt_name,
					'v_no' => $tcard->v_no,
					'tc_sealno' => $tcard->tc_sealno,
					'tc_dn' => $tcard->tc_dn,
					'tp_position' => $tcard->tp_position,
					's_name' => $tcard->s_name,
					'e_serial' => $this->tcard_model->exitpass_serial(),
					'date' => date('M d, Y')
				);
				
				$data['details'] = $details;
				$data['success'] = TRUE;
			}
			
		} catch (Exception $e) {
			unset($e);
		}
		
		echo json_encode( $data );
	}
	
	function save_exit_pass() {
		$var['success'] = FALSE;
			
		try {
			$id = $this->input->post('id');
			$destination = $this->input->post('destination');
			$plate_no = $this->input->post('plate-no');
			$particulars = $this->input->post('particulars');
			$driver = $this->input->post('driver');
			$van_class = $this->input->post('van-class');
			
			if( $this->_validate_card_id( $id ) ) {
				$data = array(
						'e_van_class' => strtoupper( $van_class ),
						'e_date' => date('Y-m-d'),
						'e_destination' => strtoupper( $destination ),
						'e_plateno' => strtoupper( $plate_no ),
						'e_particulars' => strtoupper( $particulars ),
						'e_driver' => strtoupper( $driver )
				);
				
				// Save
				if( $plate_no != '' && $driver != '' ) {
					$timeout = date('H:i:s');
					$data['e_timeout'] = $timeout;
				}
				if( $this->_check_tcard_exitpass( $id ) ) {
					$this->tcard_model->update_tcard_exitpass( $id, $data );
				}else {
					$data['tc_id'] = $id;
					$this->tcard_model->new_tcard_exitpass( $data );
				}
				
				$var['serial'] = $this->tcard_model->get_tcard_exit_pass($id)->e_serial;
				$var['timeout'] = isset($timeout) ? true : false;
				$var['success'] = TRUE;
			}
			
		} catch (Exception $e) {
// 			unset($e);
			$var['error'] = $e;
		}
		
		echo json_encode( $var );
	}
	
	function get_exit_pass() {
		$data['success'] = FALSE;
		
		
		try {
			$id = $this->input->post('id');
				
			$pass = $this->tcard_model->get_tcard_exit_pass($id);
			$tcard = $this->tcard_model->get_tcard_by_id($id);
			
			if( $pass ) {
				$e = (array)$pass;
				$e['e_date'] = date('M d, Y', strtotime($pass->e_date));
				$e['e_van_class'] = $this->_get_van_class_name($pass->e_van_class);
				$e['e_van_class_code'] = $pass->e_van_class;
				$e['tp_position'] = $tcard->tp_position;
				
				$data['success'] = TRUE;
			}
			
			$data['exit_pass'] = $e;
				
		} catch (Exception $e) {
			unset($e);
		}
		
		echo json_encode( $data );
	}
	
	function get_empty_vans() {
		$var['success'] = FALSE;
		
		try {
			$exempted_id = $this->input->post('except');
			
			$vans = $this->tcard_model->get_empty_vans( $exempted_id );
			
			if( $vans ) {
				$var['list'] = $vans;
				$var['success'] = TRUE;				
			}
		} catch (Exception $e) {
			unset( $e );
		}
		
		echo json_encode( $var );
	}
	
	function filter_vans() {
		
		try {
			$van_presence = $this->input->post('van_presence');
			$tcard_type = $this->input->post('tcard_type');
			$van_type = $this->input->post('van_type');
			$van_no = $this->input->post('van_no');
			$bin_no = $this->input->post('bin_no');
			$shipper = $this->input->post('shipper');
			$trucker = $this->input->post('trucker');
			$batch_code = $this->input->post('batch_code');
			$seal_no = $this->input->post('seal_no');
			$dn = $this->input->post('dn');
			$status = $this->input->post('status');
			$entry_from = $this->input->post('entry_from');
			$entry_to = $this->input->post('entry_to');
			$exit_from = $this->input->post('exit_from');
			$exit_to = $this->input->post('exit_to');
			$stuff_from = $this->input->post('stuff_from');
			$stuff_to = $this->input->post('stuff_to');
			$strip_from = $this->input->post('strip_from');
			$strip_to = $this->input->post('strip_to');			
			$seal_from = $this->input->post('seal_from');
			$seal_to = $this->input->post('seal_to');
			$rdd_from = $this->input->post('rdd_from');
			$rdd_to = $this->input->post('rdd_to');
			$block_from = $this->input->post('block_from');
			$block_to = $this->input->post('block_to');
			$incoming_mat = $this->input->post('incoming_mat');
			$outgoing_mat = $this->input->post('outgoing_mat');
			
			$data = array(
					'existing_only' => ($van_presence == '1' ? true : false),
					'previous_only' => ($van_presence == '2' ? true : false),
					'tcard_type' => $tcard_type,
					'van_type' => $van_type,
					'van_no' => strtoupper($van_no),
					'bin_no' => strtoupper($bin_no),
					'shipper' => strtoupper($shipper),
					'trucker' => strtoupper($trucker),
					'batch_code' => strtoupper($batch_code),
					'seal_no' => strtoupper($seal_no),
					'dn' => strtoupper($dn),
					'status' => strtoupper($status),
					'entry_from' => $entry_from != '' ? date("Y-m-d", strtotime($entry_from)) : NULL,
					'entry_to' => $entry_to != '' ? date("Y-m-d", strtotime($entry_to)) : NULL,
					'exit_from' => $exit_from != '' ? date("Y-m-d", strtotime($exit_from)) : NULL,
					'exit_to' => $exit_to != '' ? date("Y-m-d", strtotime($exit_to)) : NULL,
					'stuff_from' => $stuff_from != '' ? date("Y-m-d", strtotime($stuff_from)) : NULL,
					'stuff_to' => $stuff_to != '' ? date("Y-m-d", strtotime($stuff_to)) : NULL,
					'strip_from' => $strip_from != '' ? date("Y-m-d", strtotime($strip_from)) : NULL,
					'strip_to' => $strip_to != '' ? date("Y-m-d", strtotime($strip_to)) : NULL,
					'seal_from' => $seal_from != '' ? date("Y-m-d", strtotime($seal_from)) : NULL,
					'seal_to' => $seal_to,
					'rdd_from' => $rdd_from,
					'rdd_to' => $rdd_to,
					'block_from' => $block_from,
					'block_to' => $block_to,
					'incoming_mat' => $incoming_mat,
					'outgoing_mat' => $outgoing_mat
			);
			
			$vans = $this->tcard_model->filter_tcard($data);

			$var['vans'] = $vans;
			$var['success'] = TRUE;
			
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode( $var );
	}
	
	function tcard_types_for_select() {
		try {
			
			$type_mod = array();
			
			$types = $this->tcard_model->get_types();
			if( $types ) {
				foreach( $types as $k => $type ) {
					$type_mod[] = array(
						'id' => $type->tt_id,
						'text' => $type->tt_name,
						'color' => $type->tt_color,
						'group' => $type->ttg_id
					);
				}
			}
			
			
			$var['list'] = $type_mod;
			$var['success'] = $types ? TRUE : FALSE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode( $var );
	}
	
	function shippers_for_select() {
		try {
				
			$shippers_mod = array();
				
			$shippers = $this->shippers_model->get_shippers();
			if( $shippers ) {
				foreach( $shippers as $k => $v ) {
					$shippers_mod[] = array(
							'id' => $v->s_id,
							'text' => $v->s_name . ($v->s_code && $v->s_code != '' ? ' ('. $v->s_code .')' : '')
					);
				}
			}
				
				
			$var['list'] = $shippers_mod;
			$var['success'] = $shippers ? TRUE : FALSE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode( $var );
	}
	
	function truckers_for_select() {
		try {
	
			$truckers_mod = array();
	
			$truckers = $this->truckers_model->get_truckers();
			if( $truckers ) {
				foreach( $truckers as $k => $v ) {
					$truckers_mod[] = array(
							'id' => $v->t_id,
							'text' => $v->t_name . ($v->t_code && $v->t_code != '' ? ' ('. $v->t_code .')' : '')
					);
				}
			}
	
	
			$var['list'] = $truckers_mod;
			$var['success'] = $truckers ? TRUE : FALSE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function van_types_for_select() {
		try {
	
			$vt_mod = array();
	
			$van_types = $this->van_types_model->get_van_types();
			if( $van_types ) {
				foreach( $van_types as $k => $v ) {
					$vt_mod[] = array(
							'id' => $v->vt_id,
							'text' => $v->vt_name
					);
				}
			}
	
	
			$var['list'] = $vt_mod;
			$var['success'] = $van_types ? TRUE : FALSE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function checkers_for_select() {
		try {
	
			$checkers_mod = array();
	
			$checkers = $this->checkers_model->get_checkers();
			if( $checkers ) {
				foreach( $checkers as $k => $v ) {
					$checkers_mod[] = array(
							'id' => $v->c_id,
							'text' => $v->c_firstname . ($v->c_mi && $v->c_mi != '' ? ' '. $v->c_mi : '') . ($v->c_lastname && $v->c_lastname != '' ? ' '. $v->c_lastname : '')
					);
				}
			}
	
	
			$var['list'] = $checkers_mod;
			$var['success'] = $checkers ? TRUE : FALSE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function mat_nos_for_select() {
		try {
	
			$mat_nos = array();
	
			$materials = $this->materials_model->get_materials();
			if( $materials ) {
				foreach( $materials as $k => $v ) {
					$mat_nos[] = array(
							'id' => $v->m_id,
							'text' => $v->m_name . ($v->m_type && $v->m_type != '' ? ' ('. $v->m_type .')' : '')
					);
				}
			}
	
	
			$var['list'] = $mat_nos;
			$var['success'] = $materials ? TRUE : FALSE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function incoming_mats_for_select() {
		try {
	
			$mats_mod = array();
	
			$materials = $this->incoming_materials_model->get_incoming_materials();
			if( $materials ) {
				foreach( $materials as $k => $v ) {
					$mats_mod[] = array(
							'id' => $v->im_id,
							'text' => $v->im_name
					);
				}
			}
	
	
			$var['list'] = $mats_mod;
			$var['success'] = $materials ? TRUE : FALSE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	function initiate_van_transfer() {
		$success = FALSE;
		
		try {
			$orig_tc_id = $this->input->post('orig_card');
			$target_tc_id = $this->input->post('target_card');
			$van_type = $this->_validate_card_id( $target_tc_id ) ? 'cv' : 'wv';
			
			$orig_card = $this->tcard_model->get_simple_tcard_by_id( $orig_tc_id );
			$target_card = $this->tcard_model->get_simple_tcard_by_id( $target_tc_id );
			
			if( $this->_validate_card_id($orig_tc_id) && $van_type == 'cv') {
				
				// Switch card details except for van-related ones
				$orig_switched = clone $target_card;
				$orig_switched->vt_id = $orig_card->vt_id;
				$orig_switched->v_id = $orig_card->v_id;
				$orig_switched->s_id = $orig_card->s_id;
				$orig_switched->t_id = $orig_card->t_id;
				$orig_switched->tc_entrydate = $orig_card->tc_entrydate;
				$orig_switched->tc_rdd = $orig_card->tc_rdd;
				$orig_switched->tc_status = 'EMPTY';
				unset( $orig_switched->tc_id );
				
				$orig_switched = (array)$orig_switched;
				$this->tcard_model->update_tcard( $orig_card->tc_id, $orig_switched );
				
				$target_switched = clone $orig_card;
				$target_switched->vt_id = $target_card->vt_id;
				$target_switched->v_id = $target_card->v_id;
				$target_switched->s_id = $target_card->s_id;
				$target_switched->t_id = $target_card->t_id;
				$target_switched->tc_entrydate = $target_card->tc_entrydate;
				$target_switched->tc_rdd = $target_card->tc_rdd;
				unset( $target_switched->tc_id );
				
				$target_switched = (array)$target_switched;
				$this->tcard_model->update_tcard( $target_card->tc_id, $target_switched );
				
				$this->tcard_model->purge_tcard_exit_pass( $target_card->tc_id );
				$this->tcard_model->flush_tcard_incoming_materials( $target_card->tc_id );
				$this->tcard_model->flush_tcard_outgoing_materials( $target_card->tc_id );
				
				$this->tcard_model->update_tcard_exitpass( $orig_card->tc_id, array('tc_id' => $target_card->tc_id) );
				$this->tcard_model->update_tcard_incoming_materials( $orig_card->tc_id, array('tc_id' => $target_card->tc_id) );
				$this->tcard_model->update_tcard_outgoing_materials( $orig_card->tc_id, array('tc_id' => $target_card->tc_id) );

				$var['new_id'] = $target_card->tc_id;
				$success = TRUE;
				
			}else if( $this->_validate_card_id($orig_tc_id) && $van_type == 'wv') {
				$card_for_wv = clone $orig_card;
				$card_for_wv->vt_id = '3';	// Wingvan
				$card_for_wv->s_id = '1';	// Set shipper to none
				$card_for_wv->t_id = '1';	// Set trucker to none
				$card_for_wv->v_id = $this->_get_van_id( 'WINGVAN' );
				unset( $card_for_wv->tc_id );
				
				$card_for_wv = (array)$card_for_wv;
				$new_id = $this->tcard_model->new_card( $card_for_wv );
				
				$pos_data = array(
						'tc_id' => $new_id,
						'tp_position' => 'pending',
						'tp_top' => NULL,
						'tp_left' => NULL
				);
				$this->tcard_model->new_card_position( $pos_data );
				
				$this->tcard_model->update_tcard_exitpass( $orig_card->tc_id, array('tc_id' => $new_id) );
				$this->tcard_model->update_tcard_incoming_materials( $orig_card->tc_id, array('tc_id' => $new_id) );
				$this->tcard_model->update_tcard_outgoing_materials( $orig_card->tc_id, array('tc_id' => $new_id) );
				
				
				$orig_van = clone $orig_card;
				$orig_van->tc_bin = '';
				$orig_van->tc_batchcode = '';
				$orig_van->tc_checker = '';
				$orig_van->tc_status = 'EMPTY';
				$orig_van->tc_datestuffed = '';
				$orig_van->tc_dn = '';
				$orig_van->tc_sealno = '';
				$orig_van->tc_datesealed = '';
				$orig_van->tc_qcases = '';
				$orig_van->tc_qbags = '';
				$orig_van->tc_datestripped = '';
				$orig_van->tc_strcontroller = '';
				$orig_van->tc_stucontroller = '';
				
				unset( $orig_van->tc_id );
				unset( $orig_van->v_id );
				unset( $orig_van->tt_id );
				unset( $orig_van->s_id );
				unset( $orig_van->t_id );
				unset( $orig_van->u_id );
				unset( $orig_van->c_id );
				unset( $orig_van->tc_strcontroller );
				unset( $orig_van->tc_stucontroller );
				
				$orig_van = (array)$orig_van;
				$this->tcard_model->update_tcard( $orig_card->tc_id, $orig_van );
				
				$var['new_card_id'] = $new_id;
				$var['details'] = $card_for_wv;
				$success = TRUE;
			}
			
			$var['van_type'] = $van_type;
		} catch (Exception $e) {
			unset($e);
		}
		

		$var['success'] = $success;
		echo json_encode( $var );
	}
	
	function print_filter() {
		/*
			$val1 = "SOLID-G4592J";
		$val2 = "SOLID 5730";
	
		$foo = array();
	
		array_push($foo, $val1, $val2);
		*/

		$session = $this->session->userdata(SESSION_VAR);

		$id = $this->input->post('id');
	
		$results = $this->tcard_model->print_filter($id);

		$current_user_fullname = $session['u_lastname'] . ', ' . $session['u_firstname'] . ' ' . $session['u_mi'];

		array_push($results, $current_user_fullname);

		echo json_encode($results);
	
	}
	
	public function check_user_auth() {
		
		try {
			$user = $this->session->userdata( SESSION_VAR );
			
			$is_admin = $user ? $user['u_isadmin'] : FALSE;
			
		} catch (Exception $e) {
			$is_admin = FALSE;
		}
		
		$data['is_admin'] = $is_admin;
		echo json_encode( $data );
	}
	
	/* PRIVATES */
	
	private function _validate_card_id( $id ) {
		
		$returnVal = FALSE;
		
		try {
			$card = $this->tcard_model->get_tcard_by_id($id);
			
			$returnVal = $card ? TRUE : FALSE;
		} catch (Exception $e) {
			unset($e);
		}
		
		return $returnVal;
	}
	
	private function _get_van_list() {
		$returnVal = NULL;
		
		try {
		
			$returnVal = $this->vans_model->get_vans();
// 			$returnVal = $this->vans_model->get_unused_vans();
			
		} catch (Exception $e) {
			unset($e);
		}
		
		return $returnVal;
	}
	
	private function _form_names() {
		$forms = array(
				'card_type' => 'card-type',
				'bin_no' => 'bin-no',
				'van_no' => 'van-no',
				'material_no' => 'mat-no',
				'incoming_materials' => 'incoming-materials',
				'van_type' => 'van-type',
				'batch_code' => 'batch-code',
				'status' => 'status',
				'shipper' => 'shipper',
				'trucker' => 'trucker',
				'qty_cases' => 'qty-cases',
				'qty_bags' => 'qty-bags',
				'date_stuffed' => 'date-stuffed',
				'stuff_controller' => 'stu-controller',
				'date_stripped' => 'date-stripped',
				'strip_controller' => 'str-controller',
				'checker' => 'checker',
				'entry_date' => 'entry-date',
				'rdd' => 'rdd',
				'time_out' => 'time-out',
				'dn_no' => 'dn-no',
				'date_sealed' => 'date-sealed',
				'seal_no' => 'seal-no',
				'is_blocked' => 'is-blocked',
				'is_defective' => 'is-defective',
				'block_reason' => 'block-reason',
				'remarks' => 'remarks'
		);
		
		return (object) $forms;
	} 
	
	private function _set_form_rules() {
	
		$forms = $this->_form_names();
		$tc_id = trim( $this->input->post('card_id') );
		$trucker = $this->input->post($forms->trucker);
		$shipper = $this->input->post($forms->shipper);
	
		$rules = array(
				'card_type' => 'required|xss_clean',
				'bin_no' => 'xss_clean',
				'van_no' => 'required|callback_van_unique['. $trucker. ','. $shipper .', '. $tc_id .']|xss_clean',
				'material_no' => 'xss_clean',
				'incoming_materials' => 'xss_clean',
				'van_type' => 'required|xss_clean',
				'batch_code' => 'xss_clean',
				'status' => 'required|xss_clean',
				'shipper' => 'xss_clean',
				'trucker' => 'xss_clean',
				'qty_cases' => 'integer|xss_clean',
				'qty_bags' => 'integer|xss_clean',
				'date_stuffed' => 'xss_clean',
				'stuff_controller' => 'xss_clean',
				'date_stripped' => 'xss_clean',
				'strip_controller' => 'xss_clean',
				'checker' => 'xss_clean',
				'entry_date' => 'xss_clean',
				'rdd' => 'xss_clean',
				'time_out' => 'xss_clean',
				'dn_no' => 'xss_clean',
				'date_sealed' => 'xss_clean',
				'seal_no' => 'xss_clean',
				'block_reason' => 'xss_clean',
				'remarks' => 'xss_clean'
		);
	
		$this->form_validation->set_rules($forms->card_type, 'Card Type', $rules['card_type']);
		$this->form_validation->set_rules($forms->bin_no, 'Bin No.', $rules['bin_no']);
		$this->form_validation->set_rules($forms->van_no, 'Van No.', $rules['van_no']);
		$this->form_validation->set_rules($forms->material_no, 'Material No.', $rules['material_no']);
		$this->form_validation->set_rules($forms->van_type, 'Van Type', $rules['van_type']);
		$this->form_validation->set_rules($forms->batch_code, 'Batch Code', $rules['batch_code']);
		$this->form_validation->set_rules($forms->status, 'Status', $rules['status']);
		$this->form_validation->set_rules($forms->shipper, 'Shipper', $rules['shipper']);
		$this->form_validation->set_rules($forms->trucker, 'Trucker', $rules['trucker']);
		$this->form_validation->set_rules($forms->qty_cases, 'Quantity in cases', $rules['qty_cases']);
		$this->form_validation->set_rules($forms->qty_bags, 'Quantity in bags', $rules['qty_bags']);
		$this->form_validation->set_rules($forms->date_stuffed, 'Date Stuffed', $rules['date_stuffed']);
		$this->form_validation->set_rules($forms->stuff_controller, 'Stuffing Controller', $rules['stuff_controller']);
		$this->form_validation->set_rules($forms->date_stripped, 'Date Stripped', $rules['date_stripped']);
		$this->form_validation->set_rules($forms->strip_controller, 'Stripping Controller', $rules['strip_controller']);
		$this->form_validation->set_rules($forms->checker, 'Checker', $rules['checker']);
		$this->form_validation->set_rules($forms->entry_date, 'Entry Date', $rules['entry_date']);
		$this->form_validation->set_rules($forms->rdd, 'RDD', $rules['rdd']);
		$this->form_validation->set_rules($forms->time_out, 'Time Out', $rules['time_out']);
		$this->form_validation->set_rules($forms->dn_no, 'DN No.', $rules['dn_no']);
		$this->form_validation->set_rules($forms->date_sealed, 'Date Sealed', $rules['date_sealed']);
		$this->form_validation->set_rules($forms->seal_no, 'Seal No.', $rules['seal_no']);
		$this->form_validation->set_rules($forms->block_reason, 'Block Reason', $rules['block_reason']);
		$this->form_validation->set_rules($forms->remarks, 'Remarks', $rules['remarks']);
	
	}
	
	private function _get_card_details_by_id( $id ) {
		
		$details = $this->_get_tcard_by_id($id);
		
		$forms = $this->_form_names();
		$card = array();
		
		if( $details ) {
			$card[$forms->card_type] = $details->tt_id;
			$card[$forms->bin_no] = $details->tc_bin;
			$card[$forms->van_no] = $details->v_no;
			$card[$forms->material_no] = $this->_get_card_outgoing_materials_id($details->tc_id);
			$card[$forms->van_type] = $details->vt_id;
			$card[$forms->batch_code] = $details->tc_batchcode;
			$card[$forms->status] = $details->tc_status;
			$card[$forms->shipper] = $details->s_id;
			$card[$forms->trucker] = $details->t_id;
			$card[$forms->qty_cases] = $details->tc_qcases;
			$card[$forms->qty_bags] = $details->tc_qbags;
			$card[$forms->date_stuffed] = $details->tc_datestuffed;
			$card[$forms->stuff_controller] = $details->tc_stucontroller;
			$card[$forms->date_stripped] = $details->tc_datestripped;
			$card[$forms->strip_controller] = $details->tc_strcontroller;
			$card[$forms->checker] = $details->c_id;
			$card[$forms->entry_date] = date('d M Y', strtotime($details->tc_entrydate));
			$card[$forms->rdd] = $details->tc_rdd;
			$card[$forms->time_out] = $details->e_timeout;
			$card[$forms->dn_no] = $details->tc_dn;
			$card[$forms->date_sealed] = $details->tc_datesealed;
			$card[$forms->seal_no] = $details->tc_sealno;
			$card[$forms->block_reason] = $details->tc_block_reason;
			$card[$forms->is_blocked] = $details->is_blocked;
			$card[$forms->is_defective] = $details->is_defective;
			$card[$forms->remarks] = $details->tc_remarks;
			
			// Special Cases
			$card['card-id'] = $details->tc_id;
			$card['exitpass-serial'] = $details->e_serial;
			$card['incoming-materials'] = $this->_get_card_incoming_materials_id($details->tc_id);
			$card['exitpass-id'] = $details->e_id;
			$card['daypsan'] = $details->dayspan;
			$card['timepsan'] = $details->timespan;
		}
		
		return $card;
	}
	
	private function _udpate_incoming_materials( $tcard_id, $new_mats ) {
		
		if( $this->_validate_card_id($tcard_id) ) {
			
			$old_mats = array();
			
			$this->tcard_model->flush_tcard_incoming_materials($tcard_id);
			
			$previous_material = $this->tcard_model->get_card_incoming_materials($tcard_id);
			
			if( $previous_material ) {
				foreach( $previous_material as $k => $mat ) {
					$old_mats[$mat->tim_id] = $mat->im_id;
				}
			}			
			
			if( $new_mats && !empty( $new_mats ) ) {
				foreach( $new_mats as $k => $new_mat ) {
					if( in_array($new_mat, $old_mats) ) {
						$this->incoming_materials_model->unpurge_tcard_incoming_material( array_search($new_mat, $old_mats) );
						unset( $new_mats[$k] );
					}
				}
			}
			
			
			$returnVal = $new_mats;
			
		}
		
		$returnVal = $new_mats;
		
		return $returnVal;		
		
	}
	
	private function _udpate_outgoing_materials( $tcard_id, $new_mats ) {
	
		if( $this->_validate_card_id($tcard_id) ) {
				
			$old_mats = array();
				
			$this->tcard_model->flush_tcard_outgoing_materials($tcard_id);
				
			$previous_material = $this->tcard_model->get_card_outgoing_materials($tcard_id);
				
			if( $previous_material ) {
				foreach( $previous_material as $k => $mat ) {
					$old_mats[$mat->tom_id] = $mat->m_id;
				}
			}
				
			if( $new_mats && !empty( $new_mats ) ) {
				foreach( $new_mats as $k => $new_mat ) {
					if( in_array($new_mat, $old_mats) ) {
						$this->materials_model->unpurge_tcard_outgoing_material( array_search($new_mat, $old_mats) );
						unset( $new_mats[$k] );
					}
				}
			}
				
				
			$returnVal = $new_mats;
				
		}
	
		$returnVal = $new_mats;
	
		return $returnVal;
	
	}
	
	private function _get_card_incoming_materials_id( $tcard_id ) {
		$returnVal = array();
		
		$materials = $this->tcard_model->get_card_current_incoming_materials($tcard_id);
		
		if( $materials ) {
			foreach( $materials as $k => $mat ) {
				$returnVal[] = $mat->im_id;
			}
		}
		
		return $returnVal;
	}
	
	private function _get_card_outgoing_materials_id( $tcard_id ) {
		$returnVal = array();
	
		$materials = $this->tcard_model->get_card_current_outgoing_materials($tcard_id);
	
		if( $materials ) {
			foreach( $materials as $k => $mat ) {
				$returnVal[] = $mat->m_id;
			}
		}
	
		return $returnVal;
	}
	
	private function _force_return_van( $id ) {
		
		if( $this->_validate_card_id( $id ) ) {
			$exit_pass = $this->tcard_model->get_tcard_exit_pass($id);
				
			if( $exit_pass && $exit_pass->e_timeout ) {
				$ep_data = array(
						'e_timeout' => NULL,
						'e_driver' => '',
						'e_plateno' => ''
				);
				$this->tcard_model->update_tcard_exitpass( $id, $ep_data );
		
		
				$pos_data = array(
						'tc_id' => $id,
						'tp_position' => 'pending',
						'tp_top' => NULL,
						'tp_left' => NULL
				);
				$this->tcard_model->new_card_position( $pos_data );
			}
				
		}
	}
	
	private function _check_tcard_exitpass( $tcard_id ) {
		$exit_pass = $this->tcard_model->get_tcard_exit_pass( $tcard_id );
		
		$existing = $exit_pass ? TRUE : FALSE;
		
		return $existing;
	}
	
	private function _get_timespan( $earlier_date, $later_date ) {
		
		// Dates must be in UNIX
		
		$timespan = NULL;
		
		if( $earlier_date != '' && $later_date != '' ) {
			$timespan = timespan( $earlier_date, $later_date );
		}
		
		return $timespan;
		
	}
	
	private function _get_dayspan( $earlier_date, $later_date ) {
		
		// Dates must be in DateTime format
		
		$dayspan = NULL;
		
		if( $earlier_date != '' && $later_date != '' ) {
			
			$interval = $earlier_date->diff($later_date);
			$dayspan = $interval->format('%a ' . (intval($interval->format('%a')) == 1 ? 'day' : 'days'));
		}
		
		return $dayspan;
	}
	
	// Function that appends some of the required information but is still using the db columns as keys
	// NOTE: this function may not always be used 
	private function _get_tcard_by_id( $id ) {
		$this->load->helper('date');
		
		$card = $this->tcard_model->get_tcard_by_id( $id );
		
		if( $card ) {
			$t = (array)$card;
			
			$session = $this->session->userdata(SESSION_VAR);
			
			$stu_id = $t['tc_stucontroller'] ? $t['tc_stucontroller'] : $session['u_id'];
			$str_id = $t['tc_strcontroller'] ? $t['tc_strcontroller'] : $session['u_id'];
			
			$stu_record = $this->users_model->get_user_by_id($stu_id);
			$str_record = $this->users_model->get_user_by_id($str_id);
			
			$t['tc_stucontroller'] = $stu_record[0]['u_firstname'] . ' ' . $stu_record[0]['u_lastname'];
			$t['tc_strcontroller'] = $str_record[0]['u_firstname'] . ' ' . $str_record[0]['u_lastname'];
			$t['for_dispatch'] = $this->_is_ready_for_dispatch( $id ) ? 'true' : 'false';
			$t['dayspan'] = $this->_get_dayspan(new DateTime( $t['tc_entrydate'] ), new DateTime());
			$t['timespan'] = $this->_get_timespan( mysql_to_unix( $t['tc_entrydate'] ), time() );

			$t['tc_entrydate'] = $t['tc_entrydate'] ? date( "d M Y", strtotime( $t['tc_entrydate'] ) ) : NULL;
			$t['tc_rdd'] = $t['tc_rdd'] ? date( "d M Y", strtotime( $t['tc_rdd'] ) ) : NULL;
			$t['tc_datestuffed'] = $t['tc_datestuffed'] ? date( "d M Y", strtotime( $t['tc_datestuffed'] ) ) : NULL;
			$t['tc_datesealed'] = $t['tc_datesealed'] ? date( "d M Y", strtotime( $t['tc_datesealed'] ) ) : NULL;
			$t['tc_datestripped'] = $t['tc_datestripped'] ? date( "d M Y", strtotime( $t['tc_datestripped'] ) ) : NULL;
			$t['tc_dateblocked'] = $t['tc_dateblocked'] ? date( "d M Y", strtotime( $t['tc_dateblocked'] ) ) : NULL;
			
			$card = (object)$t;
		}
		
		return $card;
	}
	
	private function _is_ready_for_dispatch( $card_id ) {
		$returnVal = FALSE;
		
		$card = $this->tcard_model->get_tcard_by_id($card_id);
		$exit_pass = $this->tcard_model->get_tcard_exit_pass( $card_id );
		if( ($card && $card->ttg_id == 3 && $card->tc_dn != null && $card->tc_dn != '' && $card->tc_sealno != null && $card->tc_sealno != '') || $exit_pass ) {
			$returnVal = TRUE;
		}
		
		return $returnVal;
	}
	
	private function _list_tcards() {
		$cards = $this->tcard_model->list_tcards();
		
		if( $cards ) {
			foreach( $cards as $k => $card ) {
				$t = (array)$card;
				$t['dayspan'] = $this->_get_dayspan(new DateTime( $t['tc_entrydate'] ), new DateTime());
				$t['timespan'] = $this->_get_timespan( mysql_to_unix( $t['tc_entrydate'] ), time() );
					
				$cards[$k] = (object)$t;				
			}
		}
		
		return $cards;
	}
	
	private function _get_van_class_name( $code ) {
		
		$full_name = $code;
		
		$names = array(
			'FG' => 'Finished Goods',
			'SFG' => 'Semi-finished Goods',
			'S' => 'Srap',
			'TPM' => 'Trailer / Prime mover',
			'E' => 'Empty Vans'
		);
		
		if( isset($names[$code]) ) {
			$full_name = $names[$code];
		}
		
		return $full_name;
	}
	
	private function _card_value_changed($card_id, $card_column, $value) {
		$changed = TRUE;
		
		$card_details = $this->tcard_model->get_tcard_by_id($card_id);
		
		if( $card_details ) {
			// cast as array for easier dynamic comparison
			$card_details = (array)$card_details;
			
			if( $card_details[$card_column] && $card_details[$card_column] == $value ) {
				$changed = FALSE;
			}
		}
		
		return $changed;
	}
	
	private function _get_van_id( $van_no ) {

		$matching_van = $this->vans_model->get_van_by_no($van_no);
		if( $matching_van ) {
			$van_id = $matching_van->v_id;
		}else {
			$data = array('v_no' => strtoupper($van_no));
			$van_id = $this->vans_model->new_van($data);
		}
		
		return $van_id;
	}
}