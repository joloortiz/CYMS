<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Container_yard extends MY_Controller {
	
	function index() {
		
		// css
		$css = array(
				'select2.css',
				/* 'jquery-ui-1.8.16.bootstrap.css', */
				'jquery-ui-1.10.4.custom.css',
				'container-yard.css'
		);
		$this->smarty->assign('page_css', $css);
		
		// JS
		$js = array(
				'jquery-ui-1.10.4.smoothness.js',
				'generic-datepicker.js',
				'jquery.nicescroll.min.js',
				'select2.min.js',
				'pages/container-yard.js',
				'pages/cy-tcard.js',
				'checknumeric.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Materials
		$materials = $this->materials_model->get_materials();
		$this->smarty->assign('materials', $materials);
		
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
		$cards = $this->tcard_model->list_tcards();
		$tcards = array();
		$index = '';
		if( $cards ) {
			foreach($cards as $k => $card) {
				$row = (array)$card;
				$index = $row['tp_top'] || $row['tp_left'] ? 'positioned' : 'pending';
				// 				$row['display_chars'] = substr($row['v_no'], 0, 3);
		
				// 				$cards[$k] = (object) $row;
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
			$exit_date = $this->input->post($forms->exit_date);
			$date_blocked = $this->input->post($forms->date_blocked);
			$remarks = $this->input->post($forms->remarks);
			
 			/* $user = $this->session->userdata('cyms'); */
			$user = array('u_id' => 5);
			
			/* TRANSFORM DATA */
			$action = $id && $id != '' && $this->_validate_card_id($id) ? 'update' : 'create';
			$material_no = isset($material_no) && $material_no != '' ? $material_no : '1';
			$shipper = isset($shipper) && $shipper != '' ? $shipper : '1';
			$trucker = isset($trucker) && $trucker != '' ? $trucker : '1';
			$checker = isset($checker) && $checker != '' ? $checker : '1';
			
			// Van ID
			$matching_van = $this->vans_model->get_van_by_no($van);
			if( $matching_van ) {
				$van_id = $matching_van->v_id;
			}else {
				$data = array('v_no' => strtoupper($van));
				$van_id = $this->vans_model->new_van($data);
			}
			
			$data = array(
					's_id' => $shipper,
					't_id' => $trucker,
					'tc_bin' => $bin_no,
					'v_id' => $van_id,
					'c_id' => $checker,
					'm_id' => $material_no,
					'vt_id' => $van_type,
					'tt_id' => $tcard_type,
					'tc_batchcode' => $batch_code,
					'tc_status' => $status,
					'tc_qcases' => $qty_cases,
					'tc_qbags' => $qty_bags,
					'tc_datestuffed' => $date_stuffed != '' ? date("Y-m-d H:i:s", strtotime($date_stuffed)) : NULL,
					'tc_stucontroller' => $stuffing_controller,
					'tc_datestripped' => $date_stripped != '' ? date("Y-m-d H:i:s", strtotime($date_stripped)) : NULL,
					'tc_dateblocked' => $date_blocked != '' ? date("Y-m-d H:i:s", strtotime($date_blocked)) : NULL,
					'tc_strcontroller' => $stripping_controller,
					'tc_entrydate' => $entry_date != '' ? date("Y-m-d H:i:s", strtotime($entry_date)) : NULL,
					'tc_exitdate' => $exit_date != '' ? date("Y-m-d H:i:s", strtotime($exit_date)) : NULL,
					'tc_remarks' => $remarks,
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
			
			$var['tcard'] = $this->tcard_model->get_tcard_by_id($id);
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
			$details = $this->_get_card_details_by_form_name($id);
			
			$var['details'] = $details;
			$var['success'] = !empty($details) ? TRUE : FALSE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode($var);
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
				'exit_date' => 'exit-date',
				'date_blocked' => 'block-date',
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
				'exit_date' => 'callback_is_date|xss_clean',
				'date_blocked' => 'callback_is_date|xss_clean',
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
		$this->form_validation->set_rules($forms->exit_date, 'Exit Date', $rules['exit_date']);
		$this->form_validation->set_rules($forms->date_blocked, 'Date Blocked', $rules['date_blocked']);
		$this->form_validation->set_rules($forms->remarks, 'Remarks', $rules['remarks']);
	
	}
	
	private function _get_card_details_by_form_name( $id ) {
		
		$details = $this->tcard_model->get_tcard_by_id($id);
		
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
			$card[$forms->exit_date] = $details->tc_exitdate;
			$card[$forms->date_blocked] = $details->tc_dateblocked;
			$card[$forms->remarks] = $details->tc_remarks;
			
			// Special Case (not in form names)
			$card['card-id'] = $details->tc_id;
		}
		
		return $card;
	}
	
}