<div id="vanTransferModal" class="modal fade" data-backdrop="static">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="pull-left">
					<h4 class="modal-title">Van Transfer</h4>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<select id="van-transfer-type-selector" class="form-control">
							<option value=""></option>
							<option value="1">Container Van </option>
							<option value="2">Wing Van</option>
						</select>
					</div>
					<div class="col-sm-2"></div>
				</div>
				<div class="row buffer-top"></div>
				<div class="row buffer-top">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<ul id="empty-van-transfer-list">
						</ul>
					</div>
					<div class="col-sm-2"></div>
				</div>
			</div>
			<div class="modal-footer">
				<input name="exitpass-tcard-id" type="hidden">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button id="transfer-van-btn" type="button" class="btn btn-primary">Transfer</button>
			</div>
		</div>
	</div>
</div>