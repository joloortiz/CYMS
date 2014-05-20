{extends file="layouts/"|cat:$layout}
{block name=body}
	<div class="row">
		<h1>{$page_title}</h1>
	</div>
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div id="control-form-container" class="well faded disabled">
					<input name="active-checker-id" class="input-with-value" type="hidden">
					<div class="row">
						<div class="col-sm-12">
							<ul class="help-inline">
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<input name="first-name" class="form-control input-with-value interactive-element" type="text" placeholder="First Name">
						</div>
						<div class="col-sm-2">
							<input name="mi" class="form-control input-with-value interactive-element" type="text" placeholder="M.I.">
						</div>
						<div class="col-sm-5">
							<input name="last-name" class="form-control input-with-value interactive-element" type="text" placeholder="Last Name">
						</div>
					</div>
					<div class="row buffer-top">
						<div class="col-sm-7"></div>
						<div class="col-sm-5 text-center">
							<div class="pull-right">
								<button id="cancel-checker" href="#" class="btn btn-default interactive-element" title="Cancel"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
								<button id="save-checker" href="#" class="btn btn-default interactive-element" title="Save"><span class="glyphicon glyphicon-floppy-disk"></span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<table id="checker-table" class="table">
				<thead>
					<th style="width: 10px;"><input id="select-all-check" class="check-selection" type="checkbox"></th>
					<th><strong>Checkers</strong></th>
					<th style="width: 140px">
						<button id="new-checker-btn" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add</button>
						<button id="delete-checker-btn" class="btn absolute-hide"><i class="glyphicon glyphicon-trash" title="Delete Selected"></i></button>
					</th>
				</thead>
				<tbody>
					{if $checkers}
						{foreach $checkers as $checker}
							<tr class="checker action">
								<td><input class="check-selection single-select" type="checkbox"></td>
								<td class="clickable" colspan="2">
									{$checker->name}
									<input name="checker-id" type="hidden" value="{$checker->c_id}">
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