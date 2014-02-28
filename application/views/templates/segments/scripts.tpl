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

    <script src="/cyms/assets/js/bootstrap.min.js"></script>
<div>