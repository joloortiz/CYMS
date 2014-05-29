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
				'container-yard.css'
		);
		$this->smarty->assign('page_css', $css);
		
		// JS
		$js = array(
				'jquery-ui-1.10.4.smoothness.js',
				'generic-datepicker.js',
				'jquery.nicescroll.min.js',
				'timepicker.js',
				'select2.min.js',
				'pages/container-yard.js',
				'pages/cy-tcard.js',
				'pages/cy-exitpass.js',
				'pages/cy-tcard-filter.js',
				'checknumeric.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Materials (Outgoing)
		$materials = $this->materials_model->get_materials();
		$this->smarty->assign('materials', $materials);
		
		// Materials (Incoming)
		$incoming_materials = $this->incoming_materials_model->get_incoming_materials();
		$this->smarty->assign('incoming_materials', $incoming_materials);
		
		// Vans
		$vans = $this->vans_model->get_vans();
		$this->smarty->assign('vans', $vans);
		
		// Van types
		$van_types = $this->van_types_model->get_van_types();
		$this->smarty->assign('van_types', $van_types);
		
		// T-card types
		$tcard_types = $this->tcard_model->get_types();
		$this->smarty->assign('tcard_types', $tcard_types);
		
		// Checkers
		$checkers = $this->checkers_model->get_checkers();
		$this->smarty->assign('checkers', $checkers);
		
		// Shippers
		$shippers = $this->shippers_model->get_shippers();
		$this->smarty->assign('shippers', $shippers);
		
		// Truckers
		$truckers = $this->truckers_model->get_truckers();
		$this->smarty->assign('truckers', $truckers);
		
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
			
			$shipper = $this->input->post($forms->shipper);
			$trucker = $this->input->post($forms->trucker);
			$bin_no = $this->input->post($forms->bin_no);
			$van = $this->input->post($forms->van_no);
			$tcard_type = $this->input->post($forms->card_type);
			$material_no = $this->input->post($forms->material_no);
			$incoming_materials = $this->input->post('incoming-materials');
			$van_type = $this->input->post($forms->van_type);
			$batch_code = $this->input->post($forms->batch_code);
			$status = $this->input->post($forms->status);
			$qty_cases = $this->input->post($forms->qty_cases);
			$qty_bags = $this->input->post($forms->qty_bags);
			$date_stuffed = $this->input->post($forms->date_stuffed);
			$stuffing_controller = $this->input->post($forms->stuff_controller);
			$date_stripped = $this->input->post($forms->date_stripped);
			$stripping_controller = $this->input->post($forms->strip_controller);
			$checker = $this->input->post($forms->checker);
			$entry_date = $this->input->post($forms->entry_date);
			$time_out = $this->input->post($forms->time_out);
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
			$material_no = isset($material_no) && $material_no != '' ? $material_no : '1';
			$shipper = isset($shipper) && $shipper != '' ? $shipper : '1';
			$trucker = isset($trucker) && $trucker != '' ? $trucker : '1';
			$checker = isset($checker) && $checker != '' ? $checker : '1';
			
 			// Get T-card block status
 			$current_block_status = $action == 'update' ? $this->tcard_model->get_tcard_block_status($id)->is_blocked : 0;
 			$date_blocked = $is_blocked == 1 && $current_block_status == 0 ? date("Y-m-d H:i:s") : NULL;
			
			// Van ID
			$matching_van = $this->vans_model->get_van_by_no($van);
			if( $matching_van ) {
				$van_id = $matching_van->v_id;
			}else {
				$data = array('v_no' => strtoupper($van));
				$van_id = $this->vans_model->new_van($data);
			}
			
			// Incoming Materials
			$incoming_materials = $this->_udpate_incoming_materials($id, $incoming_materials);
			
			$data = array(
					's_id' => $shipper,
					't_id' => $trucker,
					'tc_bin' => strtoupper( $bin_no ),
					'v_id' => $van_id,
					'c_id' => $checker,
					'm_id' => $material_no,
					'vt_id' => $van_type,
					'tt_id' => $tcard_type,
					'tc_batchcode' => strtoupper( $batch_code ),
					'tc_status' => strtoupper( $status ),
					'tc_qcases' => $qty_cases,
					'tc_qbags' => $qty_bags,
					'tc_datestuffed' => $date_stuffed != '' ? date("Y-m-d H:i:s", strtotime($date_stuffed)) : NULL,
					'tc_stucontroller' => $stuffing_controller,
					'tc_datestripped' => $date_stripped != '' ? date("Y-m-d H:i:s", strtotime($date_stripped)) : NULL,
					'tc_dateblocked' => $date_blocked,
					'tc_strcontroller' => $stripping_controller,
					'tc_entrydate' => $entry_date != '' ? date("Y-m-d H:i:s", strtotime($entry_date)) : NULL,
					'tc_dn' => strtoupper($dn),
					'tc_datesealed' => $date_sealed != '' ? date("Y-m-d", strtotime($date_sealed)) : NULL,
					'tc_sealno' => strtoupper( $seal_no ),
					'tc_remarks' => strtoupper( $remarks ),
					'tc_block_reason' => strtoupper( $block_reason ),
					'is_blocked' => $is_blocked,
					'is_defective' => $is_defective,
					'u_id' => $user['u_id']
			);
			
			if( $action == 'create' ) {
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
			
			// Update time out
			if( $time_out && trim( $time_out ) != '' ) {
				$this->tcard_model->update_tcard_exitpass( $id, array( 'e_timeout' => $time_out ) );
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
					's_name' => $tcard->s_name,
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
			
			if( $this->_validate_card_id( $id ) && !$this->_check_tcard_exitpass( $id ) ) {
				$data = array(
						'tc_id' => $id,
						'e_van_class' => strtoupper( $van_class ),
						'e_date' => date('Y-m-d'),
						'e_destination' => strtoupper( $destination ),
						'e_plateno' => strtoupper( $plate_no ),
						'e_particulars' => strtoupper( $particulars ),
						'e_driver' => strtoupper( $driver )
				);
				
				// Save
				$this->tcard_model->new_tcard_exitpass( $data );
				
				
				$var['success'] = TRUE;
			}
			
		} catch (Exception $e) {
			unset($e);
		}
		
		echo json_encode( $var );
	}
	
	function get_exit_pass() {
		$data['success'] = FALSE;
		
		
		try {
			$id = $this->input->post('id');
				
			$pass = $this->tcard_model->get_tcard_exit_pass($id);
			if( $pass ) {
				$e = (array)$pass;
				$e['e_date'] = date('M d, Y', strtotime($pass->e_date));
				$e['e_van_class'] = $this->_get_van_class_name($pass->e_van_class);
				
				$data['success'] = TRUE;
			}
			
			$data['exit_pass'] = $e;
				
		} catch (Exception $e) {
			unset($e);
		}
		
		echo json_encode( $data );
	}
	
	function get_empty_vans() {
		try {
			$vans = $this->tcard_model->get_empty_vans();
			
			if( $vans ) {
				$var['list'] = $vans;
				$var['success'] = TRUE;				
			}
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode( $var );
	}
	
	function filter_vans() {
		
		die();
		
		try {
			$existing_only = $this->input->post('existing_only');
			$tcard_type = $this->input->post('tcard_type');
			$van_type = $this->input->post('van_type');
			$van_no = $this->input->post('van_no');
			$bin_no = $this->input->post('bin_no');
			$shipper = $this->input->post('shipper');
			$trucker = $this->input->post('trucker');
			$batch_code = $this->input->post('batch_code');
			$seal_no = $this->input->post('seal_no');
			$dn = $this->input->post('dn');
			$entry_from = $this->input->post('entry_from');
			$entry_to = $this->input->post('entry_to');
			$exit_from = $this->input->post('exit_from');
			$exit_to = $this->input->post('exit_to');
			$stuff_from = $this->input->post('stuff_from');
			$stuff_to = $this->input->post('stuff_to');
			$seal_from = $this->input->post('seal_from');
			$seal_to = $this->input->post('seal_to');
			$block_from = $this->input->post('block_from');
			$block_to = $this->input->post('block_to');
			
			$data = array(
					'existing_only' => ($existing_only == 'true' ? true : false),
					'tcard_type' => $tcard_type,
					'van_type' => $van_type,
					'van_no' => strtoupper($van_no),
					'bin_no' => strtoupper($bin_no),
					'shipper' => strtoupper($shipper),
					'trucker' => strtoupper($trucker),
					'batch_code' => strtoupper($batch_code),
					'seal_no' => strtoupper($seal_no),
					'dn' => strtoupper($dn),
					'entry_from' => $entry_from,
					'entry_to' => $entry_to,
					'exit_from' => $exit_from,
					'exit_to' => $exit_to,
					'stuff_from' => $stuff_from,
					'stuff_to' => $stuff_to,
					'seal_from' => $seal_from,
					'seal_to' => $seal_to,
					'block_from' => $block_from,
					'block_to' => $block_to
			);
			
			$vans = $this->tcard_model->filter_tcard($data);

			$var['vans'] = $vans;
			$var['success'] = TRUE;
			
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode( $var );
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
	
		$rules = array(
				'card_type' => 'required|xss_clean',
				'bin_no' => 'xss_clean',
				'van_no' => 'required|xss_clean',
				'material_no' => 'xss_clean',
				'incoming_materials' => 'xss_clean',
				'van_type' => 'required|xss_clean',
				'batch_code' => 'xss_clean',
				'status' => 'xss_clean',
				'shipper' => 'xss_clean',
				'trucker' => 'xss_clean',
				'qty_cases' => 'integer|xss_clean',
				'qty_bags' => 'integer|xss_clean',
				'date_stuffed' => 'callback_is_date|xss_clean',
				'stuff_controller' => 'xss_clean',
				'date_stripped' => 'callback_is_date|xss_clean',
				'strip_controller' => 'xss_clean',
				'checker' => 'xss_clean',
				'entry_date' => 'callback_is_date|xss_clean',
				'time_out' => 'xss_clean',
				'dn_no' => 'xss_clean',
				'date_sealed' => 'callback_is_date|xss_clean',
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
			$card[$forms->material_no] = $details->m_id;
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
			$card[$forms->checker] = $details->tc_checker;
			$card[$forms->entry_date] = $details->tc_entrydate;
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
			$t['dayspan'] = $this->_get_dayspan(new DateTime( $t['tc_entrydate'] ), new DateTime());
			$t['timespan'] = $this->_get_timespan( mysql_to_unix( $t['tc_entrydate'] ), time() );
			
			$card = (object)$t;
		}
		
		return $card;
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
}