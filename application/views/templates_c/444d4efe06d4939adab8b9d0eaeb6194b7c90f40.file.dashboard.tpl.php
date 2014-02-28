<?php /* Smarty version Smarty-3.1.13, created on 2014-02-28 04:44:02
         compiled from "application\views\templates\pages\dashboard.tpl" */ ?>
<?php /*%%SmartyHeaderCode:24196531006024bf698-18338695%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '444d4efe06d4939adab8b9d0eaeb6194b7c90f40' => 
    array (
      0 => 'application\\views\\templates\\pages\\dashboard.tpl',
      1 => 1393558217,
      2 => 'file',
    ),
    '03165d5a3348cfc07fa5b39e20575fc5b1e89f47' => 
    array (
      0 => 'application\\views\\templates\\layouts\\plain_layout.tpl',
      1 => 1368776890,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '24196531006024bf698-18338695',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'layout' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5310060251bec6_58092336',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5310060251bec6_58092336')) {function content_5310060251bec6_58092336($_smarty_tpl) {?><!DOCTYPE html> 
<html lang="en">
    <?php echo $_smarty_tpl->getSubTemplate ("segments/head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	<body base-url="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
">
		
	<div class="container">
		<h1>DASHBOARD HERE!</h1>
	</div>
	<script>
		function print(frame) {
			frame.focus();
			frame.print();
		}
	</script>

        <?php echo $_smarty_tpl->getSubTemplate ("segments/scripts.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	</body>
</html><?php }} ?>