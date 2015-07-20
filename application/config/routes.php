<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/

$route['default_controller'] = "dashboard";
$route['404_override'] = '';

$route['users/(:num)'] = 'users/index/$1';
$route['shippers/(:num)'] = 'shippers/index/$1';
$route['tcard-types'] = 'tcard_types';
$route['tcard-types/(:num)'] = 'tcard_types/index/$1';
$route['truckers/(:num)'] = 'truckers/index/$1';
$route['materials/(:num)'] = 'materials/index/$1';
$route['van-types'] = 'van_types';
$route['van-types/(:num)'] = 'van_types/index/$1';
$route['materials-incoming'] = 'incoming_materials';
$route['materials-incoming/(:num)'] = 'incoming_materials/index/$1';
$route['checkers/(:num)'] = 'checkers/index/$1';

$route['logout'] = 'login/logout';

/* End of file routes.php */
/* Location: ./application/config/routes.php */