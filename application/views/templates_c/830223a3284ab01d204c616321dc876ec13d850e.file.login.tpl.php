<?php /* Smarty version Smarty-3.1.13, created on 2014-03-25 04:19:42
         compiled from "application\views\templates\pages\login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:11504531fc58ff3a896-50850008%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '830223a3284ab01d204c616321dc876ec13d850e' => 
    array (
      0 => 'application\\views\\templates\\pages\\login.tpl',
      1 => 1394438645,
      2 => 'file',
    ),
    '03165d5a3348cfc07fa5b39e20575fc5b1e89f47' => 
    array (
      0 => 'application\\views\\templates\\layouts\\plain_layout.tpl',
      1 => 1394437901,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11504531fc58ff3a896-50850008',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_531fc5901e9405_68958257',
  'variables' => 
  array (
    'layout' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_531fc5901e9405_68958257')) {function content_531fc5901e9405_68958257($_smarty_tpl) {?><!DOCTYPE html> 
<html lang="en">
    <?php echo $_smarty_tpl->getSubTemplate ("segments/head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	<body base-url="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
">
		
	<div class="container">
		<div class="login-cont">
			<div class="alert alert-danger hide"></div>
			<form action='<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
login/validate_user' method="post" class="form-signin" role="form">
		        <h2 class="form-signin-heading">Please sign in</h2>
		        <input type="text" class="form-control" placeholder="Username" required="" autofocus="" id="username" name="username">
		        <input type="password" class="form-control" placeholder="Password" required="" id="password" name="password">
		        <a class="btn btn-lg btn-primary btn-block" data-loading-text="Validating..." id="login-btn">Sign in</a>
	     	</form>
	     </div>
	</div>
	<script>
	</script>


		<footer>
			<?php echo $_smarty_tpl->getSubTemplate ("segments/scripts.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

		</footer>
	</body>
</html><?php }} ?>