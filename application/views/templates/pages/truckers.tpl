{extends file="layouts/"|cat:$layout}
{block name=body}
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<table id="trucker-table" class="table">
					<thead>
						<th style="width: 10px;"><input id="select-all-check" class="check-selection" type="checkbox"></th>
						<th>Truckers</th>
						<th>Code</th>
						<th style="width: 130px">
							<button id="delete-trucker-btn" class="btn absolute-hide"><i class="glyphicon glyphicon-trash"></i></button>
							<button id="new-trucker-btn" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
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
			<div class="col-sm-4">
				<div id="control-form-container" class="well faded disabled">
					<input name="active-trucker-id" class="input-with-value" type="hidden">
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
							<a id="cancel-trucker" href="#" class="btn interactive-element" title="Cancel"><span class="glyphicon glyphicon-remove"></span></a>
							<a id="save-trucker" href="#" class="btn interactive-element" title="Save"><span class="glyphicon glyphicon-floppy-disk"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}