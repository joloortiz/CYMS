<div id="exitPassModal" class="modal fade" data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<div class="pull-left">
					<h4 class="modal-title">Exit Pass</h4>
				</div>
				<div class="pull-right">
					<h4 class="text-danger epass-serial-text text-holder"></h4>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="modal-body">
				<table class="table table-borderless">
					<tr>
						<td class="col-xs-4 preview-field absolute-hide">
							<h4><span class="van-contents-text text-holder"></span></h4>
						</td>
						<td class="col-xs-4 entry-field">
							<div class="row">
								<label class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon">
											<input name="van-contents" type="radio" value="FG" checked>
										</span>
										<span class="form-control">Finished goods</span>
									</div>
								</label>
							</div>
							<div class="row">
								<label class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon">
											<input name="van-contents" type="radio" value="SFG">
										</span>
										<span class="form-control">Semi-finished goods</span>
									</div>
								</label>
							</div>
							<div class="row">
								<label class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon">
											<input name="van-contents" type="radio" value="S">
										</span>
										<span class="form-control">Scrap</span>
									</div>
								</label>
							</div>
							<div class="row">
								<label class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon">
											<input name="van-contents" type="radio" value="TPM">
										</span>
										<span class="form-control">Trailer / Prime mover</span>
									</div>
								</label>
							</div>
							<div class="row">
								<label class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon">
											<input name="van-contents" type="radio" value="E">
										</span>
										<span class="form-control">Empty Vans</span>
									</div>
								</label>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="input-group">
										<span class="input-group-addon">
											<input class="trial" name="van-contents" type="radio" value="others">
										</span>
										<input name="van-contents-others" class="form-control" type="text" placeholder="Others">
									</div>
								</div>
							</div>
						</td>
						<td class="col-xs-5"></td>
						<td class="col-xs-3">	
							<div class="row">
								<div class="col-xs-12">
									<strong>Date:</strong>
									<span class="pull-right date-text-container text-holder"></span>
								</div>
							</div>
							<div class="row buffer-top">
								<div class="col-xs-12">
									<strong>Van Type:</strong>
									<span class="pull-right vantype-text-container text-holder"></span>
								</div>
							</div>
							<div class="row buffer-top">
								<div class="col-xs-12">
									<strong>Position:</strong>
									<span class="pull-right position-text-container text-holder"></span>
								</div>
							</div>
							<div class="row buffer-top">
								<div class="col-xs-12">
									<button id="van-transfer-btn-exitpass" class="btn btn-danger van-transfer-btn entry-field" data-origin="exitpass">Transfer</button>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<table class="table">
					<thead>
						<th><strong>Van  No.</strong></th>
						<th><strong>Seal No.</strong></th>
						<th><strong>DN No.</strong></th>
						<th><strong>Carrier</strong></th>
					</thead>
					<tbody>
						<tr>
							<td><span class="van-no-text text-holder"></span></td>
							<td><span class="seal-no-text text-holder"></span></td>
							<td><span class="dn-no-text text-holder"></span></td>
							<td><span class="shipper-text text-holder"></span></td>
						</tr>
						<tr>
							<td colspan="4"></td>
						</tr>
						<thead>
							<th><strong>Destination</strong></th>
							<th><strong>Plate No.</strong></th>
							<th><strong>Particulars</strong></th>
							<th><strong>Driver</strong></th>
						</thead>
						<tr class="entry-field">
							<td><input type="text" name="destination" class="form-control" placeholder="Destination"></td>
							<td><input type="text" name="plate-no" class="form-control" placeholder="Plate No."></td>
							<td>
								<textarea name="particulars" class="form-control" placeholder="Particulars"></textarea>
								<!-- <input type="text" name="particulars" class="form-control" placeholder="Particulars"> -->
							</td>
							<td><input type="text" name="driver" class="form-control" placeholder="Driver"></td>
						</tr>
						<tr class="preview-field">
							<td><span class="destination-text text-holder"></span></td>
							<td><span class="plate-no-text text-holder"></span></td>
							<td><span class="particulars-text text-holder"></span></td>
							<td><span class="driver-text text-holder"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<input name="exitpass-tcard-id" type="hidden">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button id="save-exitpass-btn" type="button" class="btn btn-primary entry-field">Save</button>
			</div>
		</div>
	</div>
</div>