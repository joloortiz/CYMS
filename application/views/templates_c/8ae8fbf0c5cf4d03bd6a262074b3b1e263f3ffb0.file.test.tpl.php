<?php /* Smarty version Smarty-3.1.13, created on 2013-06-26 07:15:09
         compiled from "application\views\templates\pages\test.tpl" */ ?>
<?php /*%%SmartyHeaderCode:421751ca9331c181f2-38815349%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8ae8fbf0c5cf4d03bd6a262074b3b1e263f3ffb0' => 
    array (
      0 => 'application\\views\\templates\\pages\\test.tpl',
      1 => 1372230900,
      2 => 'file',
    ),
    '03165d5a3348cfc07fa5b39e20575fc5b1e89f47' => 
    array (
      0 => 'application\\views\\templates\\layouts\\plain_layout.tpl',
      1 => 1368776890,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '421751ca9331c181f2-38815349',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_51ca9331cce481_43551931',
  'variables' => 
  array (
    'layout' => 0,
    'base_url' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_51ca9331cce481_43551931')) {function content_51ca9331cce481_43551931($_smarty_tpl) {?><!DOCTYPE html> 
<html lang="en">
    <?php echo $_smarty_tpl->getSubTemplate ("segments/head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	<body base-url="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
">
		
	<div class="container">
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, rerum, consequatur ipsum hic temporibus dolores obcaecati asperiores veritatis illo quasi autem reprehenderit tenetur quibusdam dolor facilis nemo officiis. Impedit, rem!</p>

		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, rerum, consequatur ipsum hic temporibus dolores obcaecati asperiores veritatis illo quasi autem reprehenderit tenetur quibusdam dolor facilis nemo officiis. Impedit, rem!</p>

		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, rerum, consequatur ipsum hic temporibus dolores obcaecati asperiores veritatis illo quasi autem reprehenderit tenetur quibusdam dolor facilis nemo officiis. Impedit, rem!</p>

		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, rerum, consequatur ipsum hic temporibus dolores obcaecati asperiores veritatis illo quasi autem reprehenderit tenetur quibusdam dolor facilis nemo officiis. Impedit, rem!</p>
	</div>

        <?php echo $_smarty_tpl->getSubTemplate ("segments/scripts.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	</body>
</html><?php }} ?>