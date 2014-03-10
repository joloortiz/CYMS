{extends file="layouts/"|cat:$layout}
{block name=body}
	<div class="container">
		<div class="login-cont">
			<div class="alert alert-danger hide"></div>
			<form action='{$base_url}login/validate_user' method="post" class="form-signin" role="form">
		        <h2 class="form-signin-heading">Please sign in</h2>
		        <input type="text" class="form-control" placeholder="Username" required="" autofocus="" id="username" name="username">
		        <input type="password" class="form-control" placeholder="Password" required="" id="password" name="password">
		        <a class="btn btn-lg btn-primary btn-block" data-loading-text="Validating..." id="login-btn">Sign in</a>
	     	</form>
	     </div>
	</div>
	<script>
	</script>
{/block}