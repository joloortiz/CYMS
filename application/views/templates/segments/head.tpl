<head>
	<meta charset="utf-8">
	<title>Oroport</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Style Sheets -->
	{foreach from=$default_css item=v}
		<link type="text/css" rel="stylesheet" href="{$base_url}{$smarty.const.STYLESHEETS_DIR}{$v}">
	{/foreach}
    
    {if isset($page_css)}
        {foreach from=$page_css item=v}
            <link type="text/css" rel="stylesheet" href="{$base_url}{$smarty.const.STYLESHEETS_DIR}{$v}">
        {/foreach}
    {/if}

	<link href="/cyms/assets/css/bootstrap.min.css" rel="stylesheet">

</head>