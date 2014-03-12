{extends file="layouts/"|cat:$layout}
{block name=body}

		<h1>{$page_title}</h1>
		<div class="alert alert-danger hide"></div>
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
			    	<a type="submit" class="btn btn-primary" id="submit" data-loading-text="Loading...">Submit</a>
			    </div>
		  	</div>
		</form>
{/block}