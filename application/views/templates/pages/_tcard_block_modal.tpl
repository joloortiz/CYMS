<div id="tcardBlockModal" class="modal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Block Card</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<label class="has-radio-checkbox"><input type="radio" name="is-defective" value="0" checked> <span class="checkbox-radio-label">FG Quality Issues</span></label>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="has-radio-checkbox"><input type="radio" name="is-defective" value="1"> <span class="checkbox-radio-label">Defective Van</span></label>
					</div>
				</div>
				<div class="row buffer-top">
					<div class="col-md-12">
						<label for="reason">Reason / Defect</label>
						<textarea id="reason" name="block-reason" class="form-control"></textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Cancel</button>
        		<button id="confirm-block-btn" type="button" class="btn btn-sm btn-primary">OK</button>
			</div>
		</div>
	</div>
</div>