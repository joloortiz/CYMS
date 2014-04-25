{extends file="layouts/"|cat:$layout}
{block name=body}

		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div id="control-form-container" class="well faded disabled">
					<input name="active-material-id" class="input-with-value" type="hidden">
					<div class="row">
						<div class="col-sm-12">
							<ul class="help-inline">
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<input name="material-name" class="form-control input-with-value interactive-element" type="text" placeholder="Material Name">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-12">
							<input name="material-type" class="form-control input-with-value interactive-element" type="text" placeholder="Type">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-5"></div>
						<div class="col-sm-7 text-center">
							<div class="pull-right">
								<button id="cancel-material" class="btn btn-default interactive-element" title="Cancel"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
								<button id="save-material" class="btn btn-default interactive-element" title="Save"><span class="glyphicon glyphicon-floppy-disk"></span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<table id="material-table" class="table">
					<thead>
						<th style="width: 10px;"><input id="select-all-check" class="check-selection" type="checkbox"></th>
						<th>Materials</th>
						<th>Type</th>
						<th style="width: 140px">
							<button id="new-material-btn" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
							<button id="delete-material-btn" class="btn absolute-hide"><i class="glyphicon glyphicon-trash" title="Delete Selected"></i></button>
						</th>
					</thead>
					<tbody>
						{if $materials}
							{foreach $materials as $material}
								<tr class="material action">
									<td><input class="check-selection single-select" type="checkbox"></td>
									<td class="clickable">
										{$material->m_name}
										<input name="material-id" type="hidden" value="{$material->m_id}">
									</td>
									<td class="clickable" colspan="2">
										{$material->m_type}
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
		</div>

		<div class="row">
			<div class="col-pagination">
				{$pagination}
			</div>
		</div>

{/block}