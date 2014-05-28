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
							<div class="col-md-3"><h5><strong>Van Type</strong></h5></div>
							<div class="col-md-4">
								<select name="van-type-filter" class="form-control input-sm">
									<option value=""></option>
									{if $van_types && !empty($van_types)}
					                    {foreach $van_types as $type}
					                      <option value="{$type->vt_id}">{$type->vt_name}</option>
					                    {/foreach}
					                {/if}
								</select>
							</div>
							<div class="col-md-5">
								<label class="has-radio-checkbox"><input name="existing-van-filter" type="checkbox"> <span class="checkbox-radio-label">Present Vans Only</span></label>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-3"><h5><strong>Tcard Type</strong></h5></div>
							<div class="col-md-9">
								<select name="tcard-type-filter" class="form-control input-sm">
				  					<option value=""></option>
										{if $tcard_types && !empty($tcard_types)}
											{foreach $tcard_types as $ttype}
												<option value="{$ttype->tt_id}" class="card-type-{$ttype->tt_id}" data-color="{$ttype->tt_color}" data-group="{$ttype->ttg_id}">{$ttype->tt_name}</option>
											{/foreach}
										{/if}
				  				</select>
				  			</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-3"><h5><strong>Van No.</strong></h5></div>
							<div class="col-md-9"><input name="van-no-filter" class="form-control input-sm" type="text" placeholder="Van No."></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-3"><h5><strong>Bin No.</strong></h5></div>
							<div class="col-md-9"><input name="bin-no-filter" class="form-control input-sm" type="text" placeholder="Bin No."></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-3"><h5><strong>Shipper</strong></h5></div>
							<div class="col-md-9">
								<select name="shipper-filter" class="form-control input-sm">
									<option value=""></option>
									{if $shippers && !empty($shippers)}
		      							{foreach $shippers as $shipper}
		      								<option value="{$shipper->s_id}">{$shipper->s_name}{if isset($shipper->s_code) && $shipper->s_code != ''}&nbsp;({$shipper->s_code}){/if}</option>
		      							{/foreach}
		      						{/if}
	      						</select>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-3"><h5><strong>Trucker</strong></h5></div>
							<div class="col-md-9">
								<select name="trucker-filter" class="form-control input-sm">
      								<option value=""></option>
		      						{if $truckers && !empty($truckers)}
		      							{foreach $truckers as $trucker}
		      								<option value="{$trucker->t_id}">{$trucker->t_name}{if isset($trucker->t_code) && $trucker->t_code != ''}&nbsp;({$trucker->t_code}){/if}</option>
		      							{/foreach}
		      						{/if}
			      				</select>
							</div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-3"><h5><strong>Batch Code</strong></h5></div>
							<div class="col-md-9"><input name="batch-code-filter" class="form-control input-sm" type="text" placeholder="Batch Code"></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-3"><h5><strong>Seal No.</strong></h5></div>
							<div class="col-md-9"><input name="seal-no-filter" class="form-control input-sm" type="text" placeholder="Seal No."></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-3"><h5><strong>DN No.</strong></h5></div>
							<div class="col-md-9"><input name="dn-filter" class="form-control input-sm" type="text" placeholder="DN No."></div>
						</div>
						<div class="row buffer-top">
							<div class="col-md-3"><h5><strong>Entry</strong></h5></div>
							<div class="col-md-9">
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
							<div class="col-md-3"><h5><strong>Exit</strong></h5></div>
							<div class="col-md-9">
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
							<div class="col-md-3"><h5><strong>Stuff</strong></h5></div>
							<div class="col-md-9">
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
							<div class="col-md-3"><h5><strong>Seal</strong></h5></div>
							<div class="col-md-9">
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
							<div class="col-md-3"><h5><strong>Block</strong></h5></div>
							<div class="col-md-9">
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
						<div class="row buffer-top">
							<div class="col-md-12">
								<div class="pull-right">
									<button id="clear-filter-btn" class="btn btn-sm btn-default">Clear Fields</button>
									<button id="filter-btn" class="btn btn-sm btn-primary">Filter</button>
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

									<div class="row">
										<ul id="filter-list">
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>