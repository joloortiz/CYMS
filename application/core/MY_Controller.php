<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

   /**
    * Index Page for this controller.
    *
    * Maps to the following URL
    * 		http://example.com/index.php/welcome
    *	- or -  
    * 		http://example.com/index.php/welcome/index
    *	- or -
    * Since this controller is set as the default controller in 
    * config/routes.php, it's displayed at http://example.com/
    *
    * So any other public methods not prefixed with an underscore will
    * map to /index.php/welcome/<method_name>
    * @see http://codeigniter.com/user_guide/general/urls.html
    */
   
    public function __construct() {
		parent::__construct();
		
		// Set Default timezone
		date_default_timezone_set('Asia/Manila');
        
		// Check templates_c
		$this->check_temp_cache();

		// Validate Session
		$this->validateSession();
		
		// Check for Admin Access
		$this->check_admin_access();
		

        // CSS
		$css = array(
			'style.css'
		);
      
		// JS
		$js = array(
			'jquery-1.9.1.min.js'
		);
        
		$this->smarty->assign('base_url', base_url());
        $this->smarty->assign('default_css', $css);
		$this->smarty->assign('default_js', $js);
    }
    
    // Check templates_c (cache)
    function check_temp_cache() {
    
    	if( !file_exists(APPPATH. "views/templates_c") ) {
    
    		mkdir(APPPATH. "views/templates_c", 0777);
    		chmod(APPPATH. "views/templates_c", 0777);
    	}
    }
    
    function validateSession() {
    	$session = $this->session->userdata(SESSION_VAR);
    	$uri_segement = $this->uri->segment(1);
    
    	$allowed_uri_access = $this->_get_allowed_access();
    
    	if( !in_array($uri_segement, $allowed_uri_access) ) {
    		// Check If Logged In
    		if($uri_segement == 'login') {
    			if($session) {
    				redirect(base_url() + 'CYMS');
    			}
    		} else {
    			if(!$session) redirect(base_url() . 'login');
    		}
    	}
    }
    
    function check_admin_access() {
    	$session = $this->session->userdata(SESSION_VAR);
    	$userIsAdmin = $session['u_isadmin'];
    	$pageRequiresAdmin = property_exists($this->router->fetch_class(), 'adminRequired');
    	
    	if( $pageRequiresAdmin && !$userIsAdmin ) {
    		redirect(base_url(). 'dashboard');
    	}
    }
    
    
    /* PRIVATE FUNCTIONS */
    
    private function _get_allowed_access() {
    	// controllers that can be accessed whether validated or not
    		
    	$allowed = array('home');
    		
    	return $allowed;
    }
}