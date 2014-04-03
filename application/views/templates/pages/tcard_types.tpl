{extends file="layouts/"|cat:$layout}
{block name=body}
	<div class="container">
		<div class="page-header">
			<h3>{$page_header}</h3>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<table id="type-table" class="table">
					<thead>
						<th style="width: 10px;"><input id="select-all-check" class="check-selection" type="checkbox"></th>
						<th>T-card Types</th>
						<th style="width: 130px">
							<button id="delete-type-btn" class="btn absolute-hide"><i class="glyphicon glyphicon-trash"></i></button>
							<button id="new-type-btn" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
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
										<div class="color-swatch" style="background: {$type->tt_color};"></div>
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
			<div class="col-sm-4">
				<div id="control-form-container" class="well faded disabled">
					<input name="active-type-id" class="input-with-value" type="hidden">
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<input name="type-name" class="form-control input-with-value interactive-element" type="text" placeholder="T-card type">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-7">
							<div class="form-group">
								<input name="type-color" class="form-control" type="color">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 text-warning">
							<p class="type-name-error error-holder absolute-hide">&bull; <span class="error-text"></span></p>
							<p class="type-color-error error-holder absolute-hide">&bull; <span class="error-text"></span></p>
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-12">
							<a id="cancel-type" href="#" class="btn btn-default interactive-element" title="Cancel"><span class="glyphicon glyphicon-remove"></span> Cancel</a>
							<a id="save-type" href="#" class="btn btn-default interactive-element" title="Save"><span class="glyphicon glyphicon-floppy-disk"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}