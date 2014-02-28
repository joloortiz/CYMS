<?php /* Smarty version Smarty-3.1.13, created on 2014-02-28 07:49:29
         compiled from "application\views\templates\segments\head.tpl" */ ?>
<?php /*%%SmartyHeaderCode:187735195e0c93cb475-36724393%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c6163da88fb8240a64967e81b476ad5f858cabdc' => 
    array (
      0 => 'application\\views\\templates\\segments\\head.tpl',
      1 => 1393566768,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '187735195e0c93cb475-36724393',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5195e0c9469262_32293785',
  'variables' => 
  array (
    'default_css' => 0,
    'base_url' => 0,
    'v' => 0,
    'page_css' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5195e0c9469262_32293785')) {function content_5195e0c9469262_32293785($_smarty_tpl) {?><head>
	<meta charset="utf-8">
	<title>Oroport</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Style Sheets -->
	<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['default_css']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
?>
		<link type="text/css" rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
<?php echo @constant('STYLESHEETS_DIR');?>
<?php echo $_smarty_tpl->tpl_vars['v']->value;?>
">
	<?php } ?>
    
    <?php if (isset($_smarty_tpl->tpl_vars['page_css']->value)){?>
        <?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['page_css']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
?>
            <link type="text/css" rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
<?php echo @constant('STYLESHEETS_DIR');?>
<?php echo $_smarty_tpl->tpl_vars['v']->value;?>
">
        <?php } ?>
    <?php }?>

	<link href="/cyms/assets/css/bootstrap.min.css" rel="stylesheet">

</head><?php }} ?>