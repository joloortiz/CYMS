{extends file="layouts/"|cat:$layout}
{block name=body}
	<div class="row">
		<h1>{$page_title}</h1>
	</div>

		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div id="control-form-container" class="well faded disabled">
					<input name="active-type-id" class="input-with-value" type="hidden">
					<div class="row">
						<div class="col-sm-12">
							<ul class="help-inline">
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<input name="type-name" class="form-control input-with-value interactive-element" type="text" placeholder="T-card type">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-5">
							<input name="type-color" class="form-control" type="color">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-5">
							<select class="form-control" name="type-group">
								{if $type_groups}
									{foreach $type_groups as $group}
										<option value="{$group->ttg_id}">{$group->ttg_name}</option>
									{/foreach}
								{/if}
							</select>
						</div>
						<div class="col-sm-7 text-center">
							<div class="pull-right">
								<button id="cancel-type" href="#" class="btn btn-default interactive-element" title="Cancel"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
								<button id="save-type" href="#" class="btn btn-default interactive-element" title="Save"><span class="glyphicon glyphicon-floppy-disk"></span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<table id="type-table" class="table">
				<thead>
					<th style="width: 10px;"><input id="select-all-check" class="check-selection" type="checkbox"></th>
					<th><strong>T-card Types</strong></th>
					<th><strong>Group</strong></th>
					<th style="width: 140px">
						<button id="new-type-btn" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
						<button id="delete-type-btn" class="btn absolute-hide"><i class="glyphicon glyphicon-trash" title="Delete Selected"></i></button>
					</th>
				</thead>
				<tbody>
					{if $types}
						{foreach $types as $type}
							<tr class="card-type action">
								<td><input class="check-selection single-select" type="checkbox"></td>
								<td class="clickable">
									{$type->tt_name}
									<input name="type-id" type="hidden" value="{$type->tt_id}">
								</td>
								<td class="clickable">
									{if $type->ttg_id != 1}
										{$type->ttg_name}
									{/if}
								</td>
								<td class="clickable">
									<div class="color-swatch" style="background: {$type->tt_color};"></div>
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