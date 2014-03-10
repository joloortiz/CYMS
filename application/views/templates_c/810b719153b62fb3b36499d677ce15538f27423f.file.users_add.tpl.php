<?php /* Smarty version Smarty-3.1.13, created on 2014-03-07 09:29:44
         compiled from "application\views\templates\pages\users_add.tpl" */ ?>
<?php /*%%SmartyHeaderCode:248005319373746fd47-01895236%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '810b719153b62fb3b36499d677ce15538f27423f' => 
    array (
      0 => 'application\\views\\templates\\pages\\users_add.tpl',
      1 => 1394176868,
      2 => 'file',
    ),
    'f029f73a84fa2a99f5d7a55dbe11c466cb920102' => 
    array (
      0 => 'application\\views\\templates\\layouts\\crud_pages_layout.tpl',
      1 => 1394097389,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '248005319373746fd47-01895236',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_531937375570b1_82884218',
  'variables' => 
  array (
    'layout' => 0,
    'base_url' => 0,
    'page' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_531937375570b1_82884218')) {function content_531937375570b1_82884218($_smarty_tpl) {?><!DOCTYPE html> 
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
				

		<h1><?php echo $_smarty_tpl->tpl_vars['page_title']->value;?>
</h1>

		<form class="form-horizontal" role="form">
			<div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
			    <div class="col-xs-4">
			    	<input type="text" class="form-control" id="lastname" placeholder="Last Name">
			    </div>
			   	<div class="col-xs-4 padding-left-0">
			    	<input type="text" class="form-control" id="firstname" placeholder="First Name">
			    </div>
			    <div class="col-xs-1 padding-left-0">
			    	<input type="text" class="form-control" id="mi" placeholder="MI">
			    </div>
		  	</div>
			<div class="form-group has-feedback">
			    <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
			    <div class="col-xs-4">
			    	<input type="text" class="form-control" id="username">
			    	<span class="glyphicon glyphicon-ok form-control-feedback hide"></span>
			    	<span class="glyphicon glyphicon-remove form-control-feedback hide"></span>
			    </div>
		  	</div>
			<div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
			    <div class="col-xs-4">
			    	<input type="password" class="form-control" id="password">
			    </div>
			</div>
			<div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">Contact No</label>
			    <div class="col-xs-4">
			    	<input type="text" class="form-control" id="contactno">
			    </div>
			 </div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			    	<button type="submit" class="btn btn-primary">Submit</button>
			    </div>
		  	</div>
		</form>

		        <?php echo $_smarty_tpl->getSubTemplate ("segments/scripts.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

        	</div>
		  </div>
		</div>
	</body>
</html><?php }} ?>