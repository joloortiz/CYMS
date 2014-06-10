<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Van_types extends MY_Controller {
	
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
		$config['module_base_url'] = base_url() . 'van-types/';
		$config['total_rows'] = $this->van_types_model->record_count();
		$config['per_page'] = CRUD_PAGE_DISPLAY_LIMIT; 
		$config['uri_segment'] = 2;
		$config['base_url'] = base_url() . 'van-types';


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$van_types = $this->van_types_model->p_van_types($config['per_page'], $offset);

		$pagination = $this->pagination->create_links();

		// page js
		$js = array(
				'pages/van_types.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Data
		$data['page_title'] = "Van Types";
		
		$this->smarty->assign('van_types', $van_types);
		$this->smarty->assign('pagination', $pagination);		
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'van_types');
		$this->smarty->view('pages/van_types.tpl', $data);
	}
	
	
	/* FUNCTIONS */
	
	/**
	 * @return json Save status and exceptions if there are any.
	 *
	 * POST data:
	 * <ul>
	 *	<li><b>action</b>		<i>required</i>		Determines the save type. The function can only indentify two types (i.e. "create" and "update")</li>
	 *	<li><b>van-type-name</b>					Van type name. This data is also required but the form validation will be the one to enforce it. Data will be transformed to upper case.</li>
	 *	<li><b>van_type_id</b>						Van type ID. This data is required when trying to update a record. ID will be validated before updating record.</li>
	 * </ul>
	 *
	 * Accessed through ajax.
	 *
	 */
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('van-type-name');
			$id = $this->input->post('van_type_id');
	
			$result = NULL;
	
			$data = array(
					'vt_name' => strtoupper( $name )
			);
	
			if( $action == 'create' ) {
				$result = $this->van_types_model->new_van_type($data);
					
			}elseif( $action == 'update' && $this->_validate_van_type($id) ) {
				$result = $this->van_types_model->update_van_type($id, $data);
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
	 * <b>van_type_ids<b>	An array of IDs of the records that will be deleted.
	 *
	 * Accessed through ajax.
	 *
	 */
	function delete() {
		try {
			$ids = $this->input->post('van_type_ids');
				
			if( is_array($ids) ) {
				foreach($ids as $type_id) {
					$this->van_types_model->purge_type($type_id);
				}
			}
				
			$var['done'] = TRUE;
				
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
	
		echo json_encode( $var );
	}
	
	/**
	 * @return json Van type details or exceptions if unsuccessful.
	 *
	 * POST data:
	 * <b>id<b>		Van type ID.
	 *
	 * Accessed through ajax.
	 *
	 */
	function get_van_type_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->van_types_model->get_van_type_by_id($id);
				
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
				$var['form_errors']['van-type-name'] = form_error('van-type-name') ? form_error('van-type-name') : NULL;
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
	 * Validates the record existence of the Van Type by its ID
	 *
	 * */
	private function _validate_van_type($id) {
		$returnVal = FALSE;
	
		try {
			$van_type = $this->van_types_model->get_van_type_by_id($id);
				
			if( $van_type ) {
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
				'van-type-name' => 'required|xss_clean'
		);
	
		$this->form_validation->set_rules('van-type-name', 'Van Type Name', $rules['van-type-name']);
	
	}
}