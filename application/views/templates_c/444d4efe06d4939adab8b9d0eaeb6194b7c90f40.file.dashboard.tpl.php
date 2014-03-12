<?php /* Smarty version Smarty-3.1.13, created on 2014-03-12 03:21:22
         compiled from "application\views\templates\pages\dashboard.tpl" */ ?>
<?php /*%%SmartyHeaderCode:16345531fc4a279ff40-44268796%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '444d4efe06d4939adab8b9d0eaeb6194b7c90f40' => 
    array (
      0 => 'application\\views\\templates\\pages\\dashboard.tpl',
      1 => 1394097216,
      2 => 'file',
    ),
    'f029f73a84fa2a99f5d7a55dbe11c466cb920102' => 
    array (
      0 => 'application\\views\\templates\\layouts\\crud_pages_layout.tpl',
      1 => 1394097389,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '16345531fc4a279ff40-44268796',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'layout' => 0,
    'base_url' => 0,
    'page' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_531fc4a2894b46_79269786',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_531fc4a2894b46_79269786')) {function content_531fc4a2894b46_79269786($_smarty_tpl) {?><!DOCTYPE html> 
<html lang="en">
    <?php echo $_smarty_tpl->getSubTemplate ("segments/head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

	<body base-url="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
">
		<div class="container">
		  <div class="row-fluid top-spacer73">
		    <div class="col-md-3">
			     <ul class="nav nav-pills nav-stacked">
					<li <?php if ($_smarty_tpl->tpl_vars['page']->value=='home'){?> class="active" <?php }?>><a href="<?php if ($_smarty_tpl->tpl_vars['page']->value=='home'){?>#<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
dashboard<?php }?>">Home</a></li>
					<li <?php if ($_smarty_tpl->tpl_vars['page']->value=='users'){?> class="active" <?php }?>><a href="<?php if ($_smarty_tpl->tpl_vars['page']->value=='users'){?>#<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
users<?php }?>">Users</a></li>
					<li <?php if ($_smarty_tpl->tpl_vars['page']->value=='t-card_types'){?> class="active" <?php }?>><a href="<?php if ($_smarty_tpl->tpl_vars['page']->value=='t-card_types'){?>#<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
t-card-types<?php }?>">T-Card Types</a></li>
					<li <?php if ($_smarty_tpl->tpl_vars['page']->value=='shippers'){?> class="active" <?php }?>><a href="<?php if ($_smarty_tpl->tpl_vars['page']->value=='shippers'){?>#<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
shippers<?php }?>">Shippers</a></li>
					<li <?php if ($_smarty_tpl->tpl_vars['page']->value=='truckers'){?> class="active" <?php }?>><a href="<?php if ($_smarty_tpl->tpl_vars['page']->value=='truckers'){?>#<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
truckers<?php }?>">Truckers</a></li>
					<li <?php if ($_smarty_tpl->tpl_vars['page']->value=='materials'){?> class="active" <?php }?>><a href="<?php if ($_smarty_tpl->tpl_vars['page']->value=='materials'){?>#<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
materials<?php }?>">Materials</a></li>
					<li <?php if ($_smarty_tpl->tpl_vars['page']->value=='van_types'){?> class="active" <?php }?>><a href="<?php if ($_smarty_tpl->tpl_vars['page']->value=='van_types'){?>#<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
van-types<?php }?>">Van Types</a></li>
				</ul>
		    </div>
		    <div class="col-md-9">
				

		<h1>DASHBOARD HERE!</h1>


		        <?php echo $_smarty_tpl->getSubTemplate ("segments/scripts.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        	</div>
		  </div>
		</div>
	</body>
</html><?php }} ?>