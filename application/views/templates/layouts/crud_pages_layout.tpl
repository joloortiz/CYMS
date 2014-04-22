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
			    <div class="col-md-3">
				     <ul class="nav nav-pills nav-stacked">
						<li {if $page == 'home'} class="active" {/if}><a href="{if $page == 'home'}#{else}{$base_url}dashboard{/if}">Home</a></li>
						<li {if $page == 'users'} class="active" {/if}><a href="{if $page == 'users'}#{else}{$base_url}users{/if}">Users</a></li>
						<li {if $page == 'tcard_types'} class="active" {/if}><a href="{if $page == 'tcard-types'}#{else}{$base_url}tcard-types{/if}">T-Card Types</a></li>
						<li {if $page == 'shippers'} class="active" {/if}><a href="{if $page == 'shippers'}#{else}{$base_url}shippers{/if}">Shippers</a></li>
						<li {if $page == 'truckers'} class="active" {/if}><a href="{if $page == 'truckers'}#{else}{$base_url}truckers{/if}">Truckers</a></li>
						<li {if $page == 'materials'} class="active" {/if}><a href="{if $page == 'materials'}#{else}{$base_url}materials{/if}">Materials</a></li>
						<li {if $page == 'van_types'} class="active" {/if}><a href="{if $page == 'van-types'}#{else}{$base_url}van-types{/if}">Van Types</a></li>
					</ul>
			    </div>
			    <div class="col-md-9">
					{block name=body}{/block}
			        {include file="segments/scripts.tpl"}
	        	</div>
			</div>
		</div>
	</body>
</html>