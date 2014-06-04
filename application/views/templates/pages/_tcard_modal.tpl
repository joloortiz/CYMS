<div id="newEntryModal" class="modal fade" data-backdrop="static">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      	<div class="row">
      		<div class="col-xs-8">
      			<h4 class="modal-title">T-Card Details</h4>
      		</div>
      		<div class="col-xs-4">
      			<select name="{$form->card_type}" class="form-control input-sm">
  					<option value=""></option>
						{if $tcard_types && !empty($tcard_types)}
							{foreach $tcard_types as $ttype}
								<option value="{$ttype->tt_id}" class="card-type-{$ttype->tt_id}" data-color="{$ttype->tt_color}" data-group="{$ttype->ttg_id}">{$ttype->tt_name}</option>
							{/foreach}
						{/if}
  				</select>
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
                <select name="{$form->van_type}" class="form-control input-sm">
                  <option value=""></option>
                  {if $van_types && !empty($van_types)}
                    {foreach $van_types as $type}
                      <option value="{$type->vt_id}">{$type->vt_name}</option>
                    {/foreach}
                  {/if}
                </select>
                <span class="help-inline"></span>                
      				</td>
      				<td class="col-xs-6">
      					<strong>Van No.</strong>
      					<input name="{$form->van_no}" class="form-control input-sm" type="text">
  						<span class="help-inline"></span>
      				</td>
      				<td class="col-xs-3">
                <strong>Status</strong>
                <input name="{$form->status}" class="form-control input-sm" type="text">
                <span class="help-inline"></span>
      				</td>
      			</tr>
            <tr class="stripping-card-field absolute-hide">
              <td class="col-xs-3"></td>
              <td class="col-xs-6">
                <strong>Materials</strong>
                  <select name="{$form->incoming_materials}" class="form-control" multiple>
                    <option value=""></option>
                    {if isset($incoming_materials)}
                      {foreach $incoming_materials as $k => $v}
                        <option value="{$v->im_id}">{$v->im_name}</option>
                      {/foreach}
                    {/if}
                  </select>
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
      					<strong>Batch Codes</strong>
      					<input name="{$form->batch_code}" class="form-control input-sm" type="text">
      					<span class="help-inline"></span>
      				</td>
      				<td class="col-xs-3">
                <strong>Material No.</strong>
                <select name="{$form->material_no}" class="form-control input-sm">
                  <option value=""></option>
                  {if $materials && !empty($materials)}
                    {foreach $materials as $material}
                      <option value="{$material->m_id}">{$material->m_name}{if isset($material->m_type) && $material->m_type != ''}&nbsp;({$material->m_type}){/if}</option>
                    {/foreach}
                  {/if}
                </select>
                <span class="help-inline"></span>
      				</td>
      			</tr>
      			<tr class="card-field-row">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
      					<div class="row">
      						<div class="col-sm-6">
      							<strong>Shipper</strong>
      							<select name="{$form->shipper}" class="form-control input-sm">
      								<option value=""></option>
		      						{if $shippers && !empty($shippers)}
		      							{foreach $shippers as $shipper}
		      								<option value="{$shipper->s_id}">{$shipper->s_name}{if isset($shipper->s_code) && $shipper->s_code != ''}&nbsp;({$shipper->s_code}){/if}</option>
		      							{/foreach}
		      						{/if}
			      				</select>
  								<span class="help-inline"></span>
      						</div>
      						<div class="col-sm-6">
      							<strong>Trucker</strong>
		      					<select name="{$form->trucker}" class="form-control input-sm">
      								<option value=""></option>
		      						{if $truckers && !empty($truckers)}
		      							{foreach $truckers as $trucker}
		      								<option value="{$trucker->t_id}">{$trucker->t_name}{if isset($trucker->t_code) && $trucker->t_code != ''}&nbsp;({$trucker->t_code}){/if}</option>
		      							{/foreach}
		      						{/if}
			      				</select>
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
                    <input name="{$form->date_stuffed}" class="form-control input-sm generic-datepicker" type="text">
                    <span class="help-inline"></span>
                  </div>
                  <div class="col-sm-6">
                    <strong>Controller</strong>
                    <h5 class="controller-text stuff-controller" data-active-controller="{$active_controller}">{$active_controller}</h5>
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
                    <input name="{$form->date_stripped}" class="form-control input-sm generic-datepicker" type="text">
                  <span class="help-inline"></span>
                  </div>
                  <div class="col-sm-6">
                    <strong>Controller</strong>
                    <h5 class="controller-text strip-controller" data-active-controller="{$active_controller}">{$active_controller}</h5>
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
      						<select name="{$form->checker}" class="form-control input-sm">
      							<option value=""></option>
	      						{if $checkers && !empty($checkers)}
	      							{foreach $checkers as $checker}
	      								<option value="{$checker->c_id}">{$checker->c_firstname}{if $checker->c_mi}&nbsp;{$checker->c_mi}{/if}{if $checker->c_lastname}&nbsp;{$checker->c_lastname}{/if}</option>
	      							{/foreach}
	      						{/if}
		      				</select>
								<span class="help-inline"></span>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
      			<tr class="card-field-row">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
      					<div class="row">
      						<div class="col-sm-6">
      							<strong>Entry Date</strong>
      							<input name="{$form->entry_date}" class="form-control input-sm" type="text">
  								  <span class="help-inline"></span>
      						</div>
      						<div class="col-sm-6 update-card-field">
                    <div class="absolute-hide exit-pass-timeout-container">
                      <strong>Time Out &emsp;<button id="view-exitpass" class="btn btn-link" title="View Exit Pass" style="padding: 0 0;"><span class="glyphicon glyphicon-list-alt"></span></button></strong>
        							<input name="{$form->time_out}" class="form-control input-sm" type="text">
    								  <span class="help-inline"></span>
                    </div>
                    <div class="exit-pass-btn-container">
                      <br>
                      <button id="new-exit-pass-btn" class="btn btn-primary in-form-button">Create Exit Pass</button>
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