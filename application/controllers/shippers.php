<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Shippers extends MY_Controller {
	
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
		// page js

		$config['base_url'] = BASE_URL . 'shippers/';
		$config['total_rows'] = $this->shippers_model->record_count();
		$config['per_page'] = 5; 
		$config['uri_segment'] = 2;


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$shippers = $this->shippers_model->p_shippers($config['per_page'], $offset);

		$pagination = $this->pagination->create_links();

		$js = array(
				'pages/shippers.js'
		);
		$this->smarty->assign('page_js', $js);
		
		// Data
		$data['page_title'] = "Shippers";
		
		$this->smarty->assign('pagination', $pagination);
		$this->smarty->assign('shippers', $shippers);
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'shippers');
		$this->smarty->view('pages/shippers.tpl', $data);
	}
	
	/* FUNCTION */
	
	/**
	 * @return json Save status and exceptions if there are any.
	 * 
	 * POST data:
	 * <ul>
	 *	<li><b>action</b>		<i>required</i>	Determines the save type. The function can only indentify two types (i.e. "create" and "update")</li>
	 *	<li><b>shipper-name</b>					Shipper name. This data is also required but the form validation will be the one to enforce it. Data will be transformed to upper case.</li> 
	 *	<li><b>shipper-color</b>				Shipper color indentifier. A hexademical color representation. Data will be transformed to upper case.</li>
	 *	<li><b>shipper_id</b>					Shipper ID. This data is required when trying to update a record. ID will be validated before updating record.</li>
	 * </ul>
	 *
	 * Accessed through ajax.
	 * 
	 */
	function save() {
		try {
	
			$action = $this->input->post('action');
	
			$name = $this->input->post('shipper-name');
			$color = $this->input->post('shipper-color');
			$id = $this->input->post('shipper_id');
	
			$result = NULL;
	
			$data = array(
					's_name' => strtoupper( $name ),
					's_color' => strtoupper( $color )
			);
	
			if( $action == 'create' ) {
				$result = $this->shippers_model->new_shipper($data);
					
			}elseif( $action == 'update' && $this->_validate_shipper($id) ) {
				$result = $this->shippers_model->update_shipper($id, $data);
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
	 * <b>shipper_ids<b>	An array of IDs of the records that will be deleted.
	 *
	 * Accessed through ajax.
	 *
	 */
	function delete() {
		try {
			$ids = $this->input->post('shipper_ids');
			
			if( is_array($ids) ) {
				foreach($ids as $shipper_id) {
					$this->shippers_model->purge_shipper($shipper_id);
				}
			}
			
			$var['done'] = TRUE;
			
		} catch (Exception $e) {
			$var['done'] = FALSE;
		}
		
		echo json_encode( $var );
	}
	
	/**
	 * @return json Shipper details or exceptions if unsuccessful.
	 *
	 * POST data:
	 * <b>id<b>		Shipper ID.
	 *
	 * Accessed through ajax.
	 *
	 */
	function get_shipper_details() {
		try {
			$id = $this->input->post('id');
			$details = $this->shippers_model->get_shipper_by_id($id);
				
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
				$var['form_errors']['shipper-name'] = form_error('shipper-name') ? form_error('shipper-name') : NULL;
				$var['form_errors']['shipper-color'] = form_error('shipper-color') ? form_error('shipper-color') : NULL;
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
	 * Validates the record existence of the shipper by its ID
	 *
	 * */
	private function _validate_shipper($id) {
		$returnVal = FALSE;
	
		try {
			$shipper = $this->shippers_model->get_shipper_by_id($id);
				
			if( $shipper ) {
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
				'shipper-name' => 'required|xss_clean',
				'shipper-color' => 'required|xss_clean'
		);
	
		$this->form_validation->set_rules('shipper-name', 'Shipper Name', $rules['shipper-name']);
		$this->form_validation->set_rules('shipper-color', 'Shipper Color Indicator', $rules['shipper-color']);
	
	}
}