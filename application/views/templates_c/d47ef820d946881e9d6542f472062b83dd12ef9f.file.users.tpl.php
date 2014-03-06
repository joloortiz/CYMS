<?php /* Smarty version Smarty-3.1.13, created on 2014-03-06 10:48:30
         compiled from "application\views\templates\pages\users.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1145453183cc05bfb97-65379511%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd47ef820d946881e9d6542f472062b83dd12ef9f' => 
    array (
      0 => 'application\\views\\templates\\pages\\users.tpl',
      1 => 1394099308,
      2 => 'file',
    ),
    'f029f73a84fa2a99f5d7a55dbe11c466cb920102' => 
    array (
      0 => 'application\\views\\templates\\layouts\\crud_pages_layout.tpl',
      1 => 1394097389,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1145453183cc05bfb97-65379511',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_53183cc069f739_34245058',
  'variables' => 
  array (
    'layout' => 0,
    'base_url' => 0,
    'page' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53183cc069f739_34245058')) {function content_53183cc069f739_34245058($_smarty_tpl) {?><!DOCTYPE html> 
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
				

		<h1>Users</h1>

		<table class="table">
			<thead>
				<tr>
					<th>Username</th>
					<th>Name</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Sample1231241</td>
					<td>Sampler I. Am</td>
				</tr>
			</tbody>
		</table>

		        <?php echo $_smarty_tpl->getSubTemplate ("segments/scripts.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        	</div>
		  </div>
		</div>
	</body>
</html><?php }} ?>