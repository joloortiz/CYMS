<div id="scripts">
	<!-- Scripts -->
	{foreach from=$default_js item=v}
		<script type="text/javascript" src="{$base_url}{$smarty.const.SCRIPTS_DIR}{$v}"></script>
	{/foreach}
    
    {if isset($page_js)}
        {foreach from=$page_js item=v}
            <script type="text/javascript" src="{$base_url}{$smarty.const.SCRIPTS_DIR}{$v}"></script>
        {/foreach}
    {/if}

    <script src="{$base_url}{$smarty.const.SCRIPTS_DIR}bootstrap.min.js"></script>
    <script type="text/javascript" src="{$base_url}{$smarty.const.SCRIPTS_DIR}jquery.tablesorter.js"></script> 
    <script type="text/javascript" src="{$base_url}{$smarty.const.SCRIPTS_DIR}loading-overlay.js"></script> 
    <script type="text/javascript" src="{$base_url}{$smarty.const.SCRIPTS_DIR}global.js"></script> 
<div>