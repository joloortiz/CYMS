{extends file="layouts/"|cat:$layout}
{block name=body}
	<div class="row">
		<h1>{$page_title}</h1>
	</div>

		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div id="control-form-container" class="well faded disabled">
					<input name="active-incoming-material-id" class="input-with-value" type="hidden">
					<div class="row">
						<div class="col-sm-12">
							<ul class="help-inline">
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<input name="incoming-material-name" class="form-control input-with-value interactive-element" type="text" placeholder="Material Name">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-5">
							<select class="form-control" name="material-category">
								<option value="1">Local</option>
								<option value="2">Imported</option>
								<option value="3">Tempload</option>
							</select>
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-5"></div>
						<div class="col-sm-7 text-center">
							<div class="pull-right">
								<button id="cancel-incoming-material" href="#" class="btn btn-default interactive-element" title="Cancel"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
								<button id="save-incoming-material" href="#" class="btn btn-default interactive-element" title="Save"><span class="glyphicon glyphicon-floppy-disk"></span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<table id="incoming-material-table" class="table">
				<thead>
					<th style="width: 10px;"><input id="select-all-check" class="check-selection" type="checkbox"></th>
					<th><strong>Materials</strong></th>
					<th></th>
					<th style="width: 140px">
						<button id="new-incoming-material-btn" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
						<button id="delete-incoming-material-btn" class="btn absolute-hide"><i class="glyphicon glyphicon-trash" title="Delete Selected"></i></button>
					</th>
				</thead>
				<tbody>
					{if $incoming_materials}
						{foreach $incoming_materials as $incoming_material}
							<tr class="incoming-material action">
								<td><input class="check-selection single-select" type="checkbox"></td>
								<td class="clickable">
									{$incoming_material->im_name}
									<input name="incoming-material-id" type="hidden" value="{$incoming_material->im_id}">
								</td>
								<td class="clickable" colspan="2">
									{$incoming_material->im_category}
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