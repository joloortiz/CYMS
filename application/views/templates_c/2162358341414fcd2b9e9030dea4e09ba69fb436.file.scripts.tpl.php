<?php /* Smarty version Smarty-3.1.13, created on 2014-03-12 09:50:12
         compiled from "application\views\templates\segments\scripts.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7100531fc434522cb1-53498875%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2162358341414fcd2b9e9030dea4e09ba69fb436' => 
    array (
      0 => 'application\\views\\templates\\segments\\scripts.tpl',
      1 => 1394614211,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7100531fc434522cb1-53498875',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_531fc43455f611_35228377',
  'variables' => 
  array (
    'default_js' => 0,
    'base_url' => 0,
    'v' => 0,
    'page_js' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_531fc43455f611_35228377')) {function content_531fc43455f611_35228377($_smarty_tpl) {?><div id="scripts">
	<!-- Scripts -->
	<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['default_js']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
?>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
<?php echo @constant('SCRIPTS_DIR');?>
<?php echo $_smarty_tpl->tpl_vars['v']->value;?>
"></script>
	<?php } ?>
    
    <?php if (isset($_smarty_tpl->tpl_vars['page_js']->value)){?>
        <?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['page_js']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
?>
            <script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
<?php echo @constant('SCRIPTS_DIR');?>
<?php echo $_smarty_tpl->tpl_vars['v']->value;?>
"></script>
        <?php } ?>
    <?php }?>

    <script src="/cyms/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/cyms/assets/js/jquery.tablesorter.js"></script> 
<div><?php }} ?>