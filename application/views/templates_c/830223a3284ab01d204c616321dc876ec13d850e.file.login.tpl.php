<?php /* Smarty version Smarty-3.1.13, created on 2014-02-28 09:37:52
         compiled from "application\views\templates\pages\login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:81553100623872737-72690016%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '830223a3284ab01d204c616321dc876ec13d850e' => 
    array (
      0 => 'application\\views\\templates\\pages\\login.tpl',
      1 => 1393576670,
      2 => 'file',
    ),
    '03165d5a3348cfc07fa5b39e20575fc5b1e89f47' => 
    array (
      0 => 'application\\views\\templates\\layouts\\plain_layout.tpl',
      1 => 1368776890,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '81553100623872737-72690016',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_531006238d0ad7_81402381',
  'variables' => 
  array (
    'layout' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_531006238d0ad7_81402381')) {function content_531006238d0ad7_81402381($_smarty_tpl) {?><!DOCTYPE html> 
<html lang="en">
    <?php echo $_smarty_tpl->getSubTemplate ("segments/head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	<body base-url="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
">
		
	<div class="container">
		<div class="login-cont">
			<form class="form-signin" role="form">
		        <h2 class="form-signin-heading">Please sign in</h2>
		        <input type="text" class="form-control" placeholder="Username" required="" autofocus="" id="username">
		        <input type="password" class="form-control" placeholder="Password" required="" id="password">
		        <button class="btn btn-lg btn-primary btn-block" type="submit" data-loading-text="Validating..." id="login-btn" onclick="return false;">Sign in</button>
	     	</form>
	     </div>
	</div>
	<script>
	</script>

        <?php echo $_smarty_tpl->getSubTemplate ("segments/scripts.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	</body>
</html><?php }} ?>