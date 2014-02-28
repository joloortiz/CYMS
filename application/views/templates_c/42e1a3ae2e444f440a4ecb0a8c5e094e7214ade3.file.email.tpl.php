<?php /* Smarty version Smarty-3.1.13, created on 2013-06-27 02:31:50
         compiled from "application\views\templates\pages\email.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2379651cba3158c1697-28266080%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '42e1a3ae2e444f440a4ecb0a8c5e094e7214ade3' => 
    array (
      0 => 'application\\views\\templates\\pages\\email.tpl',
      1 => 1372300177,
      2 => 'file',
    ),
    '03165d5a3348cfc07fa5b39e20575fc5b1e89f47' => 
    array (
      0 => 'application\\views\\templates\\layouts\\plain_layout.tpl',
      1 => 1368776890,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2379651cba3158c1697-28266080',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_51cba315acd064_61180483',
  'variables' => 
  array (
    'layout' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_51cba315acd064_61180483')) {function content_51cba315acd064_61180483($_smarty_tpl) {?><!DOCTYPE html> 
<html lang="en">
    <?php echo $_smarty_tpl->getSubTemplate ("segments/head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	<body base-url="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
">
		
	<div class="container">
		<button id="send-email-btn" class="btn btn-large" onclick="sendEmail()" data-loading-text="Sending...">Send Email</button>
	</div>

	<script>
		function sendEmail() {
			$('#send-email-btn').button('loading');
			$.ajax({
				url: $('body').attr('base-url') + 'email/send',
				type: 'POST',
				success: function (response) {
					$('#send-email-btn').button('reset');
					// do nothing
				}
			});
		}
	</script>

        <?php echo $_smarty_tpl->getSubTemplate ("segments/scripts.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	</body>
</html><?php }} ?>