<div id="newEntryModal" class="modal fade" data-backdrop="static">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      	<div class="row">
      		<div class="col-xs-8">
      			<h4 class="modal-title">T-Card Details</h4>
      		</div>
      		<div class="col-xs-4">
            <input name="{$form->card_type}" class="form-control input-sm semi-real-time card-status-switch" type="hidden">
					<span class="help-inline"></span>
      		</div>
      	</div>		        
      </div>
      <div class="modal-body">
      	<table class="table table-borderless">
      		<tbody>
      			<tr>
      				<td colspan="3">
                <div class="pull-left tcard-blocked-status">
                  <span>
                    <button id="block-tcard" class="btn btn-warning btn-sm in-form-button">Block Card</button>
                    <span class="text-warning absolute-hide"><span class="glyphicon glyphicon-ban-circle"></span> This card is blocked <span class="defective-text absolute-hide">(Defective)</span>

                    <button id="unblock-tcard" class="btn btn-link">Unblock</button></span>
                  </span>

                  <div class="row buffer-top block-reason-container absolute-hide">
                    <div class="col-md-12"><span class="text-warning"><strong>Reason / Defect: </strong><span class="reason-text"></span></span></div>
                  </div>
                </div>
      					<span class="pull-right tcard-modal-state-notifier">&nbsp;</span>
      				</td>
      			</tr>
      			<tr class="card-field-row">
      				<td class="col-xs-3">
                <strong>Van Type</strong>
                <input name="{$form->van_type}" class="form-control input-sm semi-real-time" type="hidden">
                <span class="help-inline"></span>                
      				</td>
      				<td class="col-xs-6">
      					<strong>Van No.</strong>
      					<input name="{$form->van_no}" class="form-control input-sm" type="text">
  						<span class="help-inline"></span>
      				</td>
      				<td class="col-xs-3">
                <strong>Status</strong>
                <select name="{$form->status}" class="form-control">
                    <option value=""></option>
                    <option value="empty">EMPTY</option>
                    <option value="fulls">FULLS</option>
                </select>
                <span class="help-inline"></span>
      				</td>
      			</tr>
            <tr class="stripping-card-field absolute-hide">
              <td class="col-xs-3"></td>
              <td class="col-xs-6">
                <strong>Materials</strong>
                <select name="{$form->incoming_materials}" class="form-control" multiple>
                </select>
                <span class="help-inline"></span>
              </td>
              <td class="col-xs-3"></td>
            </tr>
      			<tr class="stuffing-card-field absolute-hide">
      				<td class="col-xs-3">
                <strong>Bin No.</strong>
                <input name="{$form->bin_no}" class="form-control input-sm" type="text">
                <span class="help-inline"></span>
      				</td>
              <td class="col-xs-6">
                <strong>Material No.</strong>
                <select name="{$form->material_no}" class="form-control input-sm semi-real-time" multiple>
                </select>
              </td>
      				<td class="col-xs-3">
      					<strong>Batch Codes</strong>
      					<input name="{$form->batch_code}" class="form-control input-sm" type="text">
      					<span class="help-inline"></span>
      				</td>
      			</tr>
            <tr class="card-field-row">
              <td class="col-xs-3">
                <div class="row">
                  <div class="col-sm-12">
                    <strong><label class="has-radio-checkbox"><input type="checkbox" name="{$form->is_tempload}"> <span class="checkbox-radio-label">Tempload</span></label></strong>
                  </div>
                </div>
                <div class="row disabled faded">
                  <div class="col-sm-12">
                    <select name="{$form->tempload_status}" class="form-control input-sm non-modal-state-preview-dependent">
                      <option value=""></option>
                      <option value="HOUSEKEEPING">HOUSEKEEPING</option>
                      <option value="BACKLOAD">BACKLOAD</option>
                      <option value="REWORK">REWORK</option>
                    </select>
                  </div>
                </div>
              </td>
              <td class="col-xs-6">
                <div class="row">
                  <div class="col-sm-6">
                    <strong>Entry Date</strong>
                    <h5 class="text-with-default hide" data-text-default="{$current_date_entry}">{$current_date_entry}</h5>
                    <input name="{$form->entry_date}" class="form-control input-sm generic-datepicker" type="text">
                  </div>
                  <div class="col-sm-6 stuffing-card-field absolute-hide">
                    <strong>RDD</strong>
                    <input name="{$form->rdd}" class="form-control input-sm generic-datepicker" type="text">
                    <span class="help-inline"></span>
                  </div>
                </div>
              </td>
              <td class="col-xs-3"></td>
            </tr>
      			<tr class="card-field-row">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
      					<div class="row">
      						<div class="col-sm-6">
      							<strong>Shipper</strong>
                    <input name="{$form->shipper}" class="form-control input-sm semi-real-time" type="hidden">
  								<span class="help-inline"></span>
      						</div>
      						<div class="col-sm-6">
      							<strong>Trucker</strong>
                    <input name="{$form->trucker}" class="form-control input-sm semi-real-time" type="hidden">
  								<span class="help-inline"></span>
      						</div>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
      			<tr class="stuffing-card-field absolute-hide">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
      					<div class="row">
      						<div class="col-sm-6">
      							<strong>Quantity (cases)</strong>
	      						<input name="{$form->qty_cases}" class="form-control input-sm numeric-input" type="text">
	      						<span class="help-inline"></span>
      						</div>
      						<div class="col-sm-6">
      							<strong>Quantity (bags)</strong>
	      						<input name="{$form->qty_bags}" class="form-control input-sm numeric-input" type="text">
  								  <span class="help-inline"></span>
      						</div>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
            <tr class="stuffing-card-field stuff-group absolute-hide">
              <td class="col-xs-3"></td>
              <td class="col-xs-6">
                <div class="row">
                  <div class="col-sm-12">
                    <label class="has-radio-checkbox"><input id="stuff-filter" type="checkbox"> <strong class="checkbox-radio-label">STUFF</strong></label>
                  </div>
                </div>
                <div class="row disabled faded">
                  <div class="col-sm-6">
                    <strong>Date Stuffed</strong>
                    <input name="{$form->date_stuffed}" class="form-control input-sm generic-datepicker card-status-switch" type="text">
                    <span class="help-inline"></span>
                  </div>
                  <div class="col-sm-6">
                    <strong>Controller</strong>
                    <h5 class="stuff-controller text-with-default" data-text-default="{$active_controller}">{$active_controller}</h5>
                    <!-- <input name="{$form->stuff_controller}" class="form-control input-sm" type="text"> -->
                    <span class="help-inline"></span>
                  </div>
                </div>
              </td>
              <td class="col-xs-3"></td>
            </tr>
      			<tr class="stripping-card-field absolute-hide">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
      					<div class="row">
      						<div class="col-sm-12">
      							<label class="has-radio-checkbox"><input id="strip-filter" type="checkbox"> <strong class="checkbox-radio-label">STRIP</strong></label>
      						</div>
      					</div>
                <div class="row disabled faded">
                  <div class="col-sm-6">
                    <strong>Date Stripped</strong>
                    <input name="{$form->date_stripped}" class="form-control input-sm generic-datepicker card-status-switch" type="text">
                  <span class="help-inline"></span>
                  </div>
                  <div class="col-sm-6">
                    <strong>Controller</strong>
                    <h5 class="strip-controller text-with-default" data-text-default="{$active_controller}">{$active_controller}</h5>
                    <!-- <input name="{$form->strip_controller}" class="form-control input-sm" type="text"> -->
                  <span class="help-inline"></span>
                  </div>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
            <tr class="stuffing-card-field delivery-note-group absolute-hide disabled faded">
              <td class="col-xs-3"></td>
              <td class="col-xs-6">
                <div class="row">
                  <div class="col-sm-12">
                    <label class="has-radio-checkbox"><input id="dn-filter" type="checkbox"> <strong class="checkbox-radio-label">DELIVERY NOTE</strong></label>
                  </div>
                </div>
                <div class="row disabled faded">
                  <div class="col-sm-12">
                    <strong>DN No.</strong>
                    <input name="{$form->dn_no}" class="form-control input-sm" type="text">
                  <span class="help-inline"></span>
                  </div>
                </div>
              </td>
              <td class="col-xs-3"></td>
            </tr>
      			<tr class="stuffing-card-field seal-group absolute-hide disabled faded">
      				<td class="col-xs-3">
              </td>
      				<td class="col-xs-6">
      					<div class="row">
      						<div class="col-sm-12">
      							<label class="has-radio-checkbox"><input id="seal-filter" type="checkbox"> <strong class="checkbox-radio-label">SEAL</strong></label>
      						</div>
      					</div>
      					<div class="row disabled faded">
      						<div class="col-sm-6">
      							<strong>Date Sealed</strong>
      							<input name="{$form->date_sealed}" class="form-control input-sm generic-datepicker" type="text">
  								<span class="help-inline"></span>
      						</div>
      						<div class="col-sm-6">
      							<strong>Seal No.</strong>
      							<input name="{$form->seal_no}" class="form-control input-sm" type="text">
  								<span class="help-inline"></span>
      						</div>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
      			<tr class="stuffing-card-field absolute-hide">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
      					<div class="card-field">
      						<strong>FG/SFG Checker</strong>
                  <input name="{$form->checker}" class="form-control input-sm semi-real-time" type="hidden">
								<span class="help-inline"></span>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
      			<tr class="card-field-row">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
      					<div class="row">
                  <div class="col-sm-6 update-card-field">
                    <div class="absolute-hide exit-pass-timeout-container">
                      <strong>Exit Pass</strong>
                      <div>
                         <button id="view-exitpass" class="btn btn-link text-holder" title="View Exit Pass"></button>
                     </div>
                    </div>
                    <div class="exit-pass-btn-container">
                      <br>
                      <button id="new-exit-pass-btn" class="btn btn-primary in-form-button">Create Exit Pass</button>
                    </div>
                  </div>
      						<div class="col-sm-6 update-card-field">
                    <div class="van-transfer-btn-container">
                      <br>
                      <button id="van-transfer-btn-tcard" class="btn btn-danger in-form-button van-transfer-btn" data-origin="tcard">Transfer</button>
                    </div>
      						</div>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
      			<tr class="card-field-row">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
      					<div class="card-field">
      						<strong>Remarks</strong>
      						<textarea name="{$form->remarks}" class="form-control"></textarea>
  								<span class="help-inline"></span>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
      			<tr class="absolute-hide">
      				<td colspan="3">
      					<input name="card-id" type="hidden">
                <input name="is-blocked" class="hide absolute-hide" type="checkbox" style="display: none;">
      				</td>
      			</tr>
      		</tbody>
      	</table>
      </div>
      <div class="modal-footer">
        <button id="cancel-card" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button id="save-card" type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>