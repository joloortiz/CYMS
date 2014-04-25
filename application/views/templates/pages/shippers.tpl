{extends file="layouts/"|cat:$layout}
{block name=body}

		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div id="control-form-container" class="well faded disabled">
					<input name="active-shipper-id" class="input-with-value" type="hidden">
					<div class="row">
						<div class="col-sm-12">
							<ul class="help-inline">
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<input name="shipper-name" class="form-control input-with-value interactive-element" type="text" placeholder="Shipper Name">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-5">
							<input name="shipper-color" class="form-control" type="color">
						</div>
						<div class="col-sm-7 text-center">
							<div class="pull-right">
								<button id="cancel-shipper" href="#" class="btn btn-default interactive-element" title="Cancel"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
								<button id="save-shipper" href="#" class="btn btn-default interactive-element" title="Save"><span class="glyphicon glyphicon-floppy-disk"></span></button>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<table id="shipper-table" class="table">
				<thead>
					<th style="width: 10px;"><input id="select-all-check" class="check-selection" type="checkbox"></th>
					<th>Shippers</th>
					<th style="width: 140px">
						<button id="new-shipper-btn" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
						<button id="delete-shipper-btn" class="btn absolute-hide" title="Delete Selected"><i class="glyphicon glyphicon-trash"></i></button>
					</th>
				</thead>
				<tbody>
					{if $shippers}
						{foreach $shippers as $shipper}
							<tr class="shipper action">
								<td><input class="check-selection single-select" type="checkbox"></td>
								<td class="clickable">
									{$shipper->s_name}
									<input name="shipper-id" type="hidden" value="{$shipper->s_id}">
								</td>
								<td class="clickable">
									<div class="color-swatch" style="background: {$shipper->s_color};"></div>
								</td>
							</tr>
						{/foreach}
					{else}
						<tr>
							<td colspan="3"><em>No records found.</em></td>
						</tr>
					{/if}
				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col-pagination">
				{$pagination}
			</div>
		</div>

{/block}