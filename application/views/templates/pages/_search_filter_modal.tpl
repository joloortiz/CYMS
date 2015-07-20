<div id="searchFilterModal" class="modal fade">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="glyphicon glyphicon-remove"></i></button>
				<h4 class="modal-title">Advanced Search</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-4">
								<label class="has-radio-checkbox"><input name="van-presence" type="radio" value="0" checked> <span class="checkbox-radio-label">All</span></label>
							</div>
							<div class="col-md-4">
								<label class="has-radio-checkbox"><input name="van-presence" type="radio" value="1"> <span class="checkbox-radio-label">Present</span></label>
							</div>
							<div class="col-md-4">
								<label class="has-radio-checkbox"><input name="van-presence" type="radio" value="2"> <span class="checkbox-radio-label">Previous</span></label>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Van Type</strong></h5></div>
							<div class="col-md-8">
								<select name="van-type-filter" class="form-control input-sm">
									<option value=""></option>
								</select>
							</div>
							<!-- <div class="col-md-5">
								<label class="has-radio-checkbox"><input name="existing-van-filter" type="checkbox"> <span class="checkbox-radio-label">Present Vans Only</span></label>
							</div> -->
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Tcard Type</strong></h5></div>
							<div class="col-md-8">
								<select name="tcard-type-filter" class="form-control input-sm">
				  					<option value=""></option>
				  				</select>
				  			</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Van No.</strong></h5></div>
							<div class="col-md-8"><input name="van-no-filter" class="form-control input-sm" type="text" placeholder="Van No."></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Bin No.</strong></h5></div>
							<div class="col-md-8"><input name="bin-no-filter" class="form-control input-sm" type="text" placeholder="Bin No."></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Incoming Mat.</strong></h5></div>
							<div class="col-md-8">
								<select name="incoming-mat-filter" class="form-control input-sm" multiple>
									<option value=""></option>
	      						</select>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Shipper</strong></h5></div>
							<div class="col-md-8">
								<select name="shipper-filter" class="form-control input-sm">
									<option value=""></option>
	      						</select>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Trucker</strong></h5></div>
							<div class="col-md-8">
								<select name="trucker-filter" class="form-control input-sm">
      								<option value=""></option>
			      				</select>
							</div>
						</div>						
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Material No.</strong></h5></div>
							<div class="col-md-8">
								<select name="outgoing-mat-filter" class="form-control input-sm" multiple>
									<option value=""></option>
	      						</select>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Batch Code</strong></h5></div>
							<div class="col-md-8"><input name="batch-code-filter" class="form-control input-sm" type="text" placeholder="Batch Code"></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Seal No.</strong></h5></div>
							<div class="col-md-8"><input name="seal-no-filter" class="form-control input-sm" type="text" placeholder="Seal No."></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>DN No.</strong></h5></div>
							<div class="col-md-8"><input name="dn-filter" class="form-control input-sm" type="text" placeholder="DN No."></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Status</strong></h5></div>
							<div class="col-md-8">
								<select name="status-filter" class="form-control input-sm">
									<option value=""></option>
									<option value="empty">EMPTY</option>
									<option value="fulls">FULLS</option>
	      						</select>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Entry</strong></h5></div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-5">
										<input name="entry-from-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date Start">
									</div>
									<div class="col-md-2">
										<h5>to</h5>
									</div>
									<div class="col-md-5">
										<input name="entry-to-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date End">
									</div>
								</div>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Exit</strong></h5></div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-5">
										<input name="exit-from-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date Start">
									</div>
									<div class="col-md-2">
										<h5>to</h5>
									</div>
									<div class="col-md-5">
										<input name="exit-to-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date End">
									</div>
								</div>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Stuff</strong></h5></div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-5">
										<input name="stuffed-from-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date Start">
									</div>
									<div class="col-md-2">
										<h5>to</h5>
									</div>
									<div class="col-md-5">
										<input name="stuffed-to-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date End">
									</div>
								</div>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Strip</strong></h5></div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-5">
										<input name="stripped-from-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date Start">
									</div>
									<div class="col-md-2">
										<h5>to</h5>
									</div>
									<div class="col-md-5">
										<input name="stripped-to-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date End">
									</div>
								</div>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Seal</strong></h5></div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-5">
										<input name="seal-from-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date Start">
									</div>
									<div class="col-md-2">
										<h5>to</h5>
									</div>
									<div class="col-md-5">
										<input name="seal-to-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date End">
									</div>
								</div>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>RDD</strong></h5></div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-5">
										<input name="rdd-from-filter" class="form-control input-sm unrestricted-datepicker" type="text" placeholder="Date Start">
									</div>
									<div class="col-md-2">
										<h5>to</h5>
									</div>
									<div class="col-md-5">
										<input name="rdd-to-filter" class="form-control input-sm unrestricted-datepicker" type="text" placeholder="Date End">
									</div>
								</div>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-4"><h5><strong>Block</strong></h5></div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-5">
										<input name="block-from-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date Start">
									</div>
									<div class="col-md-2">
										<h5>to</h5>
									</div>
									<div class="col-md-5">
										<input name="block-to-filter" class="form-control input-sm generic-datepicker" type="text" placeholder="Date End">
									</div>
								</div>
							</div>
						</div>					
					</div>
					<div class="col-md-6">
						<div class="row">
							<div class="col-sm-12">
								<div class="well filter-list-container">
									<div class="row">
										<div class="col-sm-12">
											<span id="filter-count-container" class="absolute-hide"><strong id="text-found">Found</strong> <span id="filter-count" class="badge"></span></span>
										</div>
									</div>

									<div id="filter-list" class="row">
										<div class="col-sm-12 present-van-list-grp absolute-hide">
											<strong id="text-found">Present Vans</strong></span>
										</div>
										<ul id="present-van-list" class="van-filter-list present-van-list-grp absolute-hide">
										</ul>
										<div class="col-sm-12 previous-van-list-grp absolute-hide">
											<strong id="text-found">Previous Vans</strong> </span>
										</div>
										<ul id="previous-van-list" class="van-filter-list previous-van-list-grp absolute-hide">
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row buffer-top">
					<div class="col-md-6">
						<div class="pull-right">
							<button id="clear-filter-btn" class="btn btn-sm btn-default">Clear Fields</button>
							<button id="filter-btn" class="btn btn-sm btn-primary">Filter</button>
						</div>
					</div>
					<div class="col-md-6">
						<div class="pull-right">
							<button id="clear-list-btn" class="btn btn-sm btn-default">Clear List</button>
							<button id="print-filter-btn" class="btn btn-sm btn-primary">Print</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>