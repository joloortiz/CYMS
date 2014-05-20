{extends file="layouts/"|cat:$layout}
{block name=body}
	<div class="row">
		<h1>{$page_title}</h1>
	</div>

		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div id="control-form-container" class="well faded disabled">
					<input name="active-trucker-id" class="input-with-value" type="hidden">
					<div class="row">
						<div class="col-sm-12">
							<ul class="help-inline">
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<input name="trucker-name" class="form-control input-with-value interactive-element" type="text" placeholder="Trucker Name">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-12">
							<input name="trucker-code" class="form-control input-with-value interactive-element" type="text" placeholder="Code">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-7"></div>
						<div class="col-sm-5 text-center">
							<div class="pull-right">
								<button id="cancel-trucker" href="#" class="btn btn-default interactive-element" title="Cancel"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
								<button id="save-trucker" href="#" class="btn btn-default interactive-element" title="Save"><span class="glyphicon glyphicon-floppy-disk"></span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<table id="trucker-table" class="table">
				<thead>
					<th style="width: 10px;"><input id="select-all-check" class="check-selection" type="checkbox"></th>
					<th><strong>Truckers</strong></th>
					<th><strong>Code</strong></th>
					<th style="width: 140px">
						<button id="new-trucker-btn" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
						<button id="delete-trucker-btn" class="btn absolute-hide"><i class="glyphicon glyphicon-trash" title="Delete Selected"></i></button>
					</th>
				</thead>
				<tbody>
					{if $truckers}
						{foreach $truckers as $trucker}
							<tr class="trucker action">
								<td><input class="check-selection single-select" type="checkbox"></td>
								<td class="clickable">
									{$trucker->t_name}
									<input name="trucker-id" type="hidden" value="{$trucker->t_id}">
								</td>
								<td class="clickable" colspan="2">
									{$trucker->t_code}
								</td>
							</tr>
						{/foreach}
					{else}
						<tr>
							<td colspan="4"><em>No records found.</em></td>
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