<!DOCTYPE html>
<html lang="en">
    <head>
    	<meta charset="utf-8">
		<title>Oroport</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		{if isset($page_css)}
	        {foreach from=$page_css item=v}
	            <link type="text/css" rel="stylesheet" href="{$base_url}{$smarty.const.STYLESHEETS_DIR}{$v}" media="screen">
	        {/foreach}
	    {/if}
        <link href="/cyms/assets/css/global.css" rel="stylesheet">
        <link href="/cyms/assets/css/spinner.css" rel="stylesheet">

        <script data-main="{$base_url}{$smarty.const.SCRIPTS_DIR}/cy layout/bootloader" src="{$base_url}{$smarty.const.SCRIPTS_DIR}{$layout_js}"></script>

    </head>
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