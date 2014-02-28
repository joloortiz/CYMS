{extends file="layouts/"|cat:$layout}
{block name=body}
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
{/block}