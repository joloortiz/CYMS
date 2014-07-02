<!DOCTYPE html>
<html lang="en">
    <head>
    	<meta charset="utf-8">
		<title>Oroport</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        {foreach from=$default_css item=v}
            <link type="text/css" rel="stylesheet" href="{$base_url}{$smarty.const.STYLESHEETS_DIR}{$v}">
        {/foreach}

		{if isset($page_css)}
	        {foreach from=$page_css item=v}
	            <link type="text/css" rel="stylesheet" href="{$base_url}{$smarty.const.STYLESHEETS_DIR}{$v}" media="screen">
	        {/foreach}
	    {/if}
        <link href="/cyms/assets/css/global.css" rel="stylesheet">
        <link href="/cyms/assets/css/spinner.css" rel="stylesheet">

        <script data-main="{$base_url}{$smarty.const.SCRIPTS_DIR}/cy layout/bootloader" src="{$base_url}{$smarty.const.SCRIPTS_DIR}{$layout_js}"></script>

    </head>
    <body base-url="{$base_url}" onload="append_datetime();append_greeting();start_clock();">
    <div id="loading-overlay" class="loading-overlay hide">    
        <div class="spinner spinner-whole-page">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
            <h3>Working...</h3>
        </div>
    </div>
    	{block name=body}{/block}

    	<footer>
            <div class="footer-datetime-greeting pull-right"> 
                <h4 class="greeting"></h4>
                <h4 class="date-time"></h4>
            </div>
    		{include file="segments/scripts.tpl"}
    	</footer>
    </body>
</html>