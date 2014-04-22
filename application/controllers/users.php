<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this->smarty->assign('layout', 'crud_pages_layout.tpl');
		$this->smarty->assign('page', 'users');
		$this->smarty->assign('page_css', 'admin.css');
		$this->smarty->assign('page_js', 'users_crud.js');
	}
	


	# Index
	function index() {
		$session = $this->session->userdata(SESSION_VAR);

		#Initialize Notification Variables
		$opt = '';
		$msg = '';

		#Load Users Model
		$this->load->model('users_model');
		
		#Check for notification messages
		if($this->input->get('add') == 'success'){
			$opt = 'add';
			$msg = '<strong>Well done!</strong> A new user is successfully added.';
		}


		$config['base_url'] = BASE_URL . 'users/';
		$config['total_rows'] = $this->users_model->p_count($session['u_id'], $session['u_isadmin']);
		$config['per_page'] = 5; 
		$config['uri_segment'] = 2;


		$this->pagination->initialize($config); 

		$offset = $this->uri->segment(2);


		$users = $this->users_model->p_users($session['u_id'], $session['u_isadmin'], $config['per_page'], $offset);

		$pagination = $this->pagination->create_links();


		$this->smarty->assign('pagination', $pagination);
		$this->smarty->assign('opt', $opt);
		$this->smarty->assign('msg', $msg);
		$this->smarty->assign('users', $users);
		$this->smarty->assign('page_title', 'Users');
		$this->smarty->view('pages/users.tpl');

	}

	public function add() {
		$this->smarty->assign('page_title', 'Add User');
		$this->smarty->view('pages/users_add.tpl');
	}

	public function save() {
		$id = $this->input->post('id');
		$firstname = $this->input->post('firstname');
		$lastname = $this->input->post('lastname');
		$mi = $this->input->post('mi');
		$username = $this->input->post('username');
		$password = md5($this->input->post('password'));
		$contactno = $this->input->post('contactno');
		$opt = $this->input->post('opt');
		//$added_by_username = $this->session->userdata['cyms']['u_username'];

        try {
            // Load Users Model
            $this->load->model('users_model');
            
            if($opt == 'add') {
                $insertData = array(
                    'u_firstname' => $firstname,
                    'u_lastname' => $lastname,
                    'u_mi' => $mi,
                    'u_username' => $username,
                    'u_password' => $password,
                    'u_contactno' => $contactno
                    //'u_addedby' => $added_by_username
                );
                $this->users_model->Insert($insertData);
            } else if($opt == 'edit') {
                $updateData = array(
                	'u_id' => $id,
                    'u_firstname' => $firstname,
                    'u_lastname' => $lastname,
                    'u_mi' => $mi,
                    'u_username' => $username,
                    'u_contactno' => $contactno
                );
                if($password != '') $updateData['u_password'] = $password;
                $this->users_model->Update($updateData, $id);
            } else if($opt == 'delete') {
                $this->users_model->Delete($uId);
            }
            
            $data['success'] = true;
        } catch (Exception $e) {
            $data['success'] = false;
            $data['msg'] = $e->getMessage();
        }
        
        echo json_encode($data);
	}

	public function is_username_existing() {
		$id = $this->input->post('id');
		$username = $this->input->post('username');
		$opt = $this->input->post('opt');

		$this->load->model('users_model');

		if($opt == 'add'){
			$data['success'] = $this->users_model->is_username_existing($username);
		} elseif($opt == 'edit') {
			$data['success'] = $this->users_model->is_username_existing_edit($username, $id);
		}

		echo json_encode($data);
	}

	public function get_user_by_id() {
		$id = $this->input->post('id');

		$this->load->model('users_model');

		$data = $this->users_model->get_user_by_id($id);

		if($data){
			$data['success'] = true;
			echo json_encode($data);
		}else {
			$data['success'] = false;
			echo json_encode($data);
		}

	}


	public function change_password() {
		$id = $this->input->post('id');
		$updateData = array(
				'u_password' => md5($this->input->post('password'))
		);

		$this->load->model('users_model');

		$this->users_model->Update($updateData, $id);

		$data['success'] = true;
		echo json_encode($data);
	}

	public function test() {
		$session = $this->session->userdata(SESSION_VAR);

		echo $session['u_id'];
	}
}

?>