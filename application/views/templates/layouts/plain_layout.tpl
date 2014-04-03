<!DOCTYPE html> 
<html lang="en">
    {include file="segments/head.tpl"}
	<body base-url="{$base_url}">
		<div class="spinner hide">
		  <div class="bounce1"></div>
		  <div class="bounce2"></div>
		  <div class="bounce3"></div>
		</div>
		{block name=body}{/block}

		<footer>
			{include file="segments/scripts.tpl"}
		</footer>
	</body>
</html>