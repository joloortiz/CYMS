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
	    	{include file="segments/body_header.tpl"}

			<div id="main">
			<div class="container-fluid">
			    <div class="col-md-3">
			    </div>
			    <div class="col-md-9">
					{block name=body}{/block}
			        {include file="segments/scripts.tpl"}
	        	</div>
			</div>
		</div>
	</body>
</html>