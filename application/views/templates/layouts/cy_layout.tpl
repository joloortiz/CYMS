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

        <script data-main="{$base_url}{$smarty.const.SCRIPTS_DIR}/cy layout/bootloader" src="{$base_url}{$smarty.const.SCRIPTS_DIR}{$layout_js}"></script>

    </head>
    <body base-url="{$base_url}">
    	{block name=body}{/block}

    	<footer>
    		{include file="segments/scripts.tpl"}
    	</footer>
    </body>
</html>