<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tcard_types extends MY_Controller {
	
	/**
	 * @var boolean
	 * 
	 * Class property that the function <code>check_admin_access()</code> from MY_Controller will be looking for
	 * to check if a module requires an administrator access.
	 */
	public $adminRequired = TRUE;
		
	/* PAGES */
	
	/**
	 * Page Index
	 */
	function index() {
		$config['module_base_url'] = base_url() . 'tcard-types/';
		$config['total_rows'] = $this->tcard_model->record_count();
		$config['per_page'] = 5; 
		$config['uri_segment'] = 2;


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$types = $this->tcard_model->p_types($config['per_page'], $offset);

		$pagination = $this->pagination->create_links();
		
		// Get type groups
		$groups = $this->tcard_model->get_type_groups();
		$this->smarty->assign('type_groups', $groups);

		// page js
		$js = array(
				'pages/tcard_types.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Data
		$data['page_title'] = "T-Card Types";
		
		$this->smarty->assign('types', $types);
		$this->smarty->assign('pagination', $pagination);
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'tcard_types');
		$this->smarty->view('pages/tcard_types.tpl', $data);
	}
	
	/* FUNCTIONS */
	
	/**
	 * @return json Save status and exceptions if there are any.
	 * 
	 * POST data:
	 * <ul>
	 *	<li><b>action</b>		<i>required</i>	Determines the save type. The function can only indentify two types (i.e. "create" and "update")</li>
	 *	<li><b>type-name</b>					T-card type name. This data is also required but the form validation will be the one to enforce it. Data will be transformed to upper case.</li> 
	 *	<li><b>type-color</b>					T-card type color indentifier. A hexademical color representation. Data will be transformed to upper case.</li>
	 *	<li><b>group</b>						T-card type group.</li>
	 *	<li><b>type_id</b>						T-card type ID. This data is required when trying to update a record. ID will be validated before updating record.</li>
	 * </ul>
	 *
	 * Accessed through ajax.
	 * 
	 */
	function save() {
		try {
				
			$action = $this->input->post('action');
				
			$name = $this->input->post('type-name');
			$color = $this->input->post('type-color');
			$group = $this->input->post('group');
			$is_exfac = $this->input->post('exfactory');
			$id = $this->input->post('type_id');
				
			$result = NULL;
			
			if( $is_exfac == 'true' ) {
				$is_exfac = 1;
				$this->tcard_model->unset_exfac_types();
			}else {
				$is_exfac = 0;
			}

			$data = array(
					'tt_name' => strtoupper( $name ),
					'tt_color' => strtoupper( $color ),
					'ttg_id' => $group,
					'is_exfactory' => $is_exfac
			);
				
			if( $action == 'create' ) {
				$result = $this->tcard_model->new_type($data);
					
			}elseif( $action == 'update' && $this->_validate_type($id) ) {
				$result = $this->tcard_model->update_type($id, $data);
			}
				
			$var['done'] = $result ? TRUE : FALSE;
				
		} catch (Exception $e) {
			$var['done'] = FALSE;
			$var['exception'] = $e->getMessage();
		}
		
		echo json_encode($var);
	}
	
	/**
	 * @return json Delete status and exceptions if there are any.
	 * 
	 * POST data:
	 * <b>type_ids<b>	An array of IDs of the records that will be deleted.
	 * 
	 * Accessed through ajax.
	 * 
	 */
	function delete() {
		try {
			$ids = $this->input->post('type_ids');
				
			if( is_array($ids) ) {
				foreach($ids as $type_id) {
					$this->tcard_model->purge_type($type_id);
				}
			}
				
			$var['done'] = TRUE;
				
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	/**
	 * @return json Card type details or exceptions if unsuccessful.
	 *
	 * POST data:
	 * <b>id<b>		T-card type ID.
	 *
	 * Accessed through ajax.
	 * 
	 */
	function get_type_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->tcard_model->get_type_by_id($id);
			
			$var['details'] = $details;			
			$var['success'] = TRUE;
		} catch (Exception $e) {
			$var['success'] = FALSE;
		}
		
		echo json_encode( $var );
	}
	
	/**
	 * @return json Form validation result with validation errors if validation failed.
	 * 
	 * <code>_set_form_rules()</code> will set the form validation rules. Visit function declaration for more info.
	 * <code>$this->form_validation->run()</code> will evaluate all POST data according to the form rules set by <code>_set_form_rules()</code>.
	 * 
	 * Accessed through ajax.
	 * 
	 */
	function validate_form() {
	
		try {
			$var['success'] = TRUE;
	
			$this->_set_form_rules();
	
			if( !$this->form_validation->run() ) {
				$var['success'] = FALSE;
	
				$this->form_validation->set_error_delimiters('', '');
	
				// form errors
				$var['form_errors']['type-name'] = form_error('type-name') ? form_error('type-name') : NULL;
				$var['form_errors']['type-color'] = form_error('type-color') ? form_error('type-color') : NULL;
			}
		} catch (Exception $e) {
			$var['success'] = FALSE;
			$var['exception'] = $e->getMessage();
		}
	
		echo json_encode( $var );
	}
	
	/* PRIVATES */
	
	/**
	 * 
	 * @param int|string $id
	 * @return boolean
	 * 
	 * Validates the record existence of the T-card Type by its ID
	 * 
	 * */
	private function _validate_type($id) {
		$returnVal = FALSE;
		
		try {
			$type = $this->tcard_model->get_type_by_id($id);
			
			if( $type ) {
				$returnVal = TRUE;
			}
			
		} catch (Exception $e) {
			unset($e);
		}
		
		return $returnVal;
	}
	
	/**
	 * 
	 * Sets the form validation rules.
	 * The rules are stored in an array with its rule name as the key.
	 * 
	 * This function is utilizing the built-in form validation helper library of Codeigniter. For more information about the
	 * library please refer to the official documentation :D
	 */
	private function _set_form_rules() {
	
		$rules = array(
				'type-name' => 'required|xss_clean',
				'type-color' => 'required|xss_clean'
		);
	
		$this->form_validation->set_rules('type-name', 'T-card Type Name', $rules['type-name']);
		$this->form_validation->set_rules('type-color', 'T-card Type Color Indicator', $rules['type-color']);
	
	}
}