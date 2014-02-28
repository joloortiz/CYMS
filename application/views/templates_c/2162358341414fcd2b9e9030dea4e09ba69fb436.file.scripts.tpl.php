<?php /* Smarty version Smarty-3.1.13, created on 2014-02-26 06:49:52
         compiled from "application\views\templates\segments\scripts.tpl" */ ?>
<?php /*%%SmartyHeaderCode:203305195e0c95925a2-61043814%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2162358341414fcd2b9e9030dea4e09ba69fb436' => 
    array (
      0 => 'application\\views\\templates\\segments\\scripts.tpl',
      1 => 1393393791,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '203305195e0c95925a2-61043814',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5195e0c960c098_13307798',
  'variables' => 
  array (
    'default_js' => 0,
    'base_url' => 0,
    'v' => 0,
    'page_js' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5195e0c960c098_13307798')) {function content_5195e0c960c098_13307798($_smarty_tpl) {?><div id="scripts">
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
<div><?php }} ?>