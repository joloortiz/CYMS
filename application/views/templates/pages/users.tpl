{extends file="layouts/"|cat:$layout}
{block name=body}

		<h1>{$page_title}</h1>
		
		<div class="pull-right">

		</div>
		<div class="alert alert-success {if $opt == ''}hide{/if}">{if $opt != ''}{$msg}{/if}</div>
		<div class="row">
		<table id="tablesorter" class="table">
			<thead>
				<tr>
					<th>Username</th>
					<th>Name</th>
					<th>
						<a href="{$base_url}users/add" id="new-type-btn" class="btn btn-default pull-right"><span class="glyphicon glyphicon-plus"></span> Add</a>
					</th>

				</tr>
			</thead>
			<tbody>
			{if $users}
				{foreach from=$users item=v}
					<tr>
						<td>{$v['u_username']}</td>
						<td>{$v['u_lastname']}, {$v['u_firstname']} {$v['u_mi']}</td>
						<td><a id="edit-btn" data-uid="{$v['u_id']}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;<a id="purge-btn" data-uid="{$v['u_id']}" data-username="{$v['u_username']}"><span class="glyphicon glyphicon-trash"></a></span></td>
					</tr>
				{/foreach}
			{else}
					<tr>
						<td colspan="4"><em>No records found.</em></td>
					</tr>
			{/if}
			</tbody>

		</table>
		</div>
		
		<div class="row">
			<div class="col-pagination">
				{$pagination}
			</div>
		</div>



		<div class="modal fade user-edit-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    	<div class="modal-header">
		         	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		          	<h4 class="modal-title" id="myModalLabel">Edit User</h4>
	        	</div>
		      	<div class="modal-body">
		      		<div class="alert hide edit-user"></div>
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
						    	<input type="text" maxlength="2" class="form-control" id="mi" placeholder="M.I.">
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
						    <label for="inputPassword3" class="col-sm-2 control-label">Contact No</label>
						    <div class="col-xs-4">
						    	<input type="text" class="form-control" id="contactno">
						    </div>
						 </div>
						<div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						    	<a id="submit-edit" type="submit" class="btn btn-primary" data-loading-text="Loading...">Submit</a>
						    	<input type="hidden" id="u-id">
						    </div>
					  	</div>
					</form>

					<h4>Change Password</h4>
					<form class="form-horizontal" role="form">
						<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
						    <div class="col-xs-4">
						    	<input type="password" class="form-control" id="password">
						    </div>
						</div>
						<div class="form-group">
						    <label for="inputPassword3" class="col-sm-2 control-label">Re-enter Password</label>
						    <div class="col-xs-4">
						    	<input type="password" class="form-control" id="re-password">
						    </div>
						</div>
						<div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						    	<a id="submit-password" type="submit" class="btn btn-primary" data-loading-text="Loading...">Submit</a>
						    	<input type="hidden" id="u-id">
						    </div>
					  	</div>
					</form>
		      	</div>
		    </div>
		  </div>
		</div>

		<div class="modal fade user-purge-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="modal-header">
		         	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		          	<h4 class="modal-title" id="myModalLabel">Deactivate User</h4>
	        	</div>
		      	<div class="modal-body">
		      		<span>Are you sure you want to deactivate '<span id="username-placeholder"></span>'?</span>
		      	</div>
		      	<div class="modal-footer">
		      		<button id="purge-yes" type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
		      		<button id="purge-no" type="button" class="btn btn-default" data-dismiss="modal">No</button>
		      	</div>
		    </div>
		  </div>
		</div>
{/block}