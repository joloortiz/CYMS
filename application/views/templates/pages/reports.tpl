{extends file="layouts/"|cat:$layout}
{block name=body}
	<div class="row">
		<h1>{$page_title}</h1>
	</div>

		<div class="row">
			<div class="list-group">
				<a id="daily-inventory-report" href="#" class="list-group-item">DAILY INVENTORY REPORT</a>
				<a id="fsc-outbound-report" href="#" class="list-group-item">FSC OUTBOUND REPORT</a>
				<a id="defective-vans-report" href="#" class="list-group-item">DEFECTIVE VANS</a>
				<a id="empty-vans-report" href="#" class="list-group-item">EMPTY VANS</a>
		</div>


	<!-- FSC Outbound Report Modal -->
	{include file="pages/_reports_fsc_outbound_modal.tpl"}

	<!-- Defective Vans Report Modal -->
	{include file="pages/_reports_defective_vans_modal.tpl"}
	
	<!-- Empty Vans Report Modal -->
	{include file="pages/_reports_empty_vans_modal.tpl"}	

	<!-- Daily Inventory Report Modal -->
	{include file="pages/_reports_daily_inventory_modal.tpl"}

	<iframe id="reports-placeholder" style="width: 1000px;visibility: hidden;"></iframe> 
	<!-- <iframe id="reports-placeholder" style="width: 1000px; height: 2000px;"></iframe> -->
{/block}  