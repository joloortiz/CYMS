<!DOCTYPE html> 
<html lang="en">
    {include file="segments/head.tpl"}
	<body base-url="{$base_url}">
	<div id="loading-overlay" class="loading-overlay hide">    
        <div class="spinner spinner-whole-page">
          <div class="bounce1"></div>
          <div class="bounce2"></div>
          <div class="bounce3"></div>
        </div>
    </div>	
		{block name=body}{/block}

		<footer>
			{include file="segments/scripts.tpl"}
		</footer>
	</body>
</html>