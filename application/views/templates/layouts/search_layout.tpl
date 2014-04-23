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
    <header>
		<div class="container-fluid">
			<div class="col-xs-4">
				<a id="companyname" class="" href="#" title="Home">Oroport Cargoholding Services Inc.<span>Port Area, Puntod, Cagayan de Oro</span>	
				</a>
			</div>
			<div class="pull-right col-xs-2">
				<div class="btn-group pull-right">
					<a class="btn btn-oroport"><span class="glyphicon glyphicon-cog"></span></a>
					<a href="{$base_url}logout" class="btn btn-oroport"><span class="glyphicon glyphicon-remove"></span> Logout</a>
				</div>
			</div>
		</div>
	</header>
		<div id="main">
			<div class="container-fluid">
					{block name=body}{/block}
			        {include file="segments/scripts.tpl"}
			</div>
		</div>
	</body>
</html>