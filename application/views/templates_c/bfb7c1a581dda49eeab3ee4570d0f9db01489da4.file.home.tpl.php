<?php /* Smarty version Smarty-3.1.13, created on 2014-03-24 10:04:59
         compiled from "application\views\templates\pages\home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:31625531fc433a016b0-90092190%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bfb7c1a581dda49eeab3ee4570d0f9db01489da4' => 
    array (
      0 => 'application\\views\\templates\\pages\\home.tpl',
      1 => 1393896469,
      2 => 'file',
    ),
    '03165d5a3348cfc07fa5b39e20575fc5b1e89f47' => 
    array (
      0 => 'application\\views\\templates\\layouts\\plain_layout.tpl',
      1 => 1394437901,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '31625531fc433a016b0-90092190',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_531fc433d4e238_05379733',
  'variables' => 
  array (
    'layout' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_531fc433d4e238_05379733')) {function content_531fc433d4e238_05379733($_smarty_tpl) {?><!DOCTYPE html> 
<html lang="en">
    <?php echo $_smarty_tpl->getSubTemplate ("segments/head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	<body base-url="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
">
		
	<div class="container">


	</div>
	<script>
		function print(frame) {
			frame.focus();
			frame.print();
		}
	</script>


		<footer>
			<?php echo $_smarty_tpl->getSubTemplate ("segments/scripts.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

		</footer>
	</body>
</html><?php }} ?>