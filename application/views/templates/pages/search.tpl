{extends file="layouts/"|cat:$layout}
{block name=body}
		<div class="alert alert-danger hide"></div>
		<form class="form-horizontal" role="form">
			<div class="form-group">
			    <div class="col-xs-4">
			    	<input type="text" class="form-control input-sm" id="contactno" placeholder="VAN NO./BIN NO.">
			    </div>
			 </div>

			<div class="form-group">
      			<strong>Shipper</strong>
					<select multiple name="shipper" class="form-control input-sm">
						<option value=""></option>
						{if $shippers && !empty($shippers)}
							{foreach $shippers as $shipper}
								<option value="{$shipper->s_id}">{$shipper->s_name}{if isset($shipper->s_code) && $shipper->s_code != ''}&nbsp;({$shipper->s_code}){/if}</option>
							{/foreach}
						{/if}
  					</select>
			</div>

			<div class="form-group">
				<div class="select2-container form-control input-sm" id="s2id_autogen5">    <a href="javascript:void(0)" onclick="return false;" class="select2-choice select2-default">   <span>Select Van Type</span><abbr class="select2-search-choice-close" style="display: none;"></abbr>   <div><b></b></div></a><div class="select2-drop select2-with-searchbox select2-drop-active select2-offscreen" style="display: block;">   <div class="select2-search">       <input type="text" autocomplete="off" class="select2-input">   </div>   <ul class="select2-results"></ul></div>    </div>
			</div>
			<div class="form-group">
				<div class="select2-container form-control input-sm" id="s2id_autogen5">    <a href="javascript:void(0)" onclick="return false;" class="select2-choice select2-default">   <span>Select Van Type</span><abbr class="select2-search-choice-close" style="display: none;"></abbr>   <div><b></b></div></a><div class="select2-drop select2-with-searchbox select2-drop-active select2-offscreen" style="display: block;">   <div class="select2-search">       <input type="text" autocomplete="off" class="select2-input">   </div>   <ul class="select2-results"></ul></div>    </div>
			</div>
			<div class="form-group">
				<div class="select2-container form-control input-sm" id="s2id_autogen5">    <a href="javascript:void(0)" onclick="return false;" class="select2-choice select2-default">   <span>Select Van Type</span><abbr class="select2-search-choice-close" style="display: none;"></abbr>   <div><b></b></div></a><div class="select2-drop select2-with-searchbox select2-drop-active select2-offscreen" style="display: block;">   <div class="select2-search">       <input type="text" autocomplete="off" class="select2-input">   </div>   <ul class="select2-results"></ul></div>    </div>
			</div>

		</form>
{/block}
