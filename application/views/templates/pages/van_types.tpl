{extends file="layouts/"|cat:$layout}
{block name=body}

		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div id="control-form-container" class="well faded disabled">
					<input name="active-van-type-id" class="input-with-value" type="hidden">
					<div class="row">
						<div class="col-sm-12">
							<input name="van-type-name" class="form-control input-with-value interactive-element" type="text" placeholder="Van Type">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-7"></div>
						<div class="col-sm-5 text-center">
							<div class="pull-right">
								<button id="cancel-van-type" href="#" class="btn btn-default interactive-element" title="Cancel"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
								<button id="save-van-type" href="#" class="btn btn-default interactive-element" title="Save"><span class="glyphicon glyphicon-floppy-disk"></span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<table id="van-type-table" class="table">
				<thead>
					<th style="width: 10px;"><input id="select-all-check" class="check-selection" type="checkbox"></th>
					<th>Van Types</th>
					<th style="width: 140px">
						<button id="new-van-type-btn" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
						<button id="delete-van-type-btn" class="btn absolute-hide"><i class="glyphicon glyphicon-trash" title="Delete Selected"></i></button>
					</th>
				</thead>
				<tbody>
					{if $van_types}
						{foreach $van_types as $van_type}
							<tr class="van-type action">
								<td><input class="check-selection single-select" type="checkbox"></td>
								<td class="clickable" colspan="2">
									{$van_type->vt_name}
									<input name="van-type-id" type="hidden" value="{$van_type->vt_id}">
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