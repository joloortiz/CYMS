{extends file="layouts/"|cat:$layout}
{block name=body}
		<header>
			<div class="container-fluid">
				<div class="col-xs-4">
					<a href="{$base_url}"><span id="company-logo">Logo Here</span></a>
					<a id="companyname" class="" href="{$base_url}" title="Home">
						{$company_name}<span>{$company_address}</span>
					</a>
				</div>
				<button id="new-entry-btn" class="btn btn-oroport pull-left">
					<span class="glyphicon glyphicon-plus"></span> New Entry
				</button>
				<div class="form-group col-xs-3">
					<div class="input-group">
				    	<input type="email" class="form-control" id="search-entry" placeholder="Search Entry">
						<span class="input-group-btn">
							<button id="search-btn"class="btn btn-oroport" type="button"><span class="glyphicon glyphicon-search"></span></button>
						</span>
					</div>
				</div>
				<a href="{$base_url}dashboard" class="btn btn-oroport pull-left">Dashboard</a>
				<div class="pull-right col-xs-2">
					<div class="btn-group pull-right">
						<a class="btn btn-oroport"><span class="glyphicon glyphicon-cog"></span></a>
						<a href="{$base_url}logout" class="btn btn-oroport"><span class="glyphicon glyphicon-remove"></span> Logout</a>
					</div>
				</div>
			</div>
		</header>

		<div id="main">
			<div class="container-fluid">
				<div class="col-xs-3">
					<div id="pending" class="panel panel-default">
						<div class="panel-heading">
							Pending Entries
		    				<span class="badge pull-right">{count($tcards.pending)}</span>
		    			</div>
						<div class="panel-body">
							<div class="absolute-hide cv-model" data-class="entry cv ui-draggable" aria-disabled="false" style="display: none; opacity: 0;"></div>

							{if isset($tcards.pending)}
								{foreach $tcards.pending as $card}
									<div id="{$card->tc_id}" class="entry cv" van-no="{$card->v_no}" bin-no="{$card->tc_bin}" data-position="pending" style="background-color: {$card->s_color}; border-color: {$card->tt_color};">{$card->display_chars}</div>
								{/foreach}
							{/if}
						</div>
					</div>
					<div id="history" class="panel panel-default">
						<div class="panel-heading">Recent History</div>
						<div class="panel-body">
							
						</div>
					</div>
				</div>
				<div class="col-xs-9">

					<div id="legend" class="panel panel-default">
						<div class="panel-body">
							Legend 
							<div class="pull-right">
							
								<a id="edit-btn" class="btn btn-primary" editmode="0"><span class="glyphicon glyphicon-pencil"></span>  Edit</a>
								<a id="cancel-btn" class="btn btn-primary hide" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-remove"></span> Cancel</a>
								<a id="save-btn" class="btn btn-primary hide"><span class="glyphicon glyphicon-ok"></span>  Save</a>																
								<div class="hide">
									<a id="zoom-out" class="btn btn-default btn-sm "><span class="glyphicon glyphicon-zoom-out"></span></a> 
									<a id="zoom" class="btn btn-default btn-sm "><span class="glyphicon glyphicon-search"></span></a> 
									<a id="zoom-in" class="btn btn-default btn-sm "><span class="glyphicon glyphicon-zoom-in"></span></a>
								</div>
							</div>
						</div>
					</div>

					<div id="map" class="panel panel-default" data-zoom="1">
						<div class="panel-body">
							<div id="T1" class="cv dp ui-droppable" style="left: 48px; top: 16px;" dp-bottom="T2">T1 </div>
							<div id="T2" class="cv dp ui-droppable" style="left: 48px; top: 47px;" dp-top="T1">T2 </div>
							<div id="T3" class="cv dp ui-droppable" style="left: 48px; top: 78px;" dp-bottom="T4">T3 </div>
							<div id="T4" class="cv dp ui-droppable" style="left: 48px; top: 109px;" dp-top="T3">T4 </div>
							<div id="T5" class="cv dp ui-droppable" style="left: 48px; top: 140px;" dp-bottom="T6">T5 </div>
							<div id="T6" class="cv dp ui-droppable" style="left: 48px; top: 171px;" dp-top="T5">T6 </div>
							<div id="T7" class="cv dp ui-droppable" style="left: 48px; top: 202px;" dp-bottom="T8">T7 </div>
							<div id="T8" class="cv dp ui-droppable" style="left: 48px; top: 233px;" dp-top="T7">T8 </div>
							<div id="T9" class="cv dp ui-droppable" style="left: 48px; top: 264px;" dp-bottom="TA">T9 </div>
							<div id="TA" class="cv dp ui-droppable" style="left: 48px; top: 295px;" dp-top="T9">TA </div>
							<div id="TB" class="cv dp ui-droppable" style="left: 48px; top: 326px;" dp-bottom="TC">TB </div>
							<div id="TC" class="cv dp ui-droppable" style="left: 48px; top: 357px;" dp-top="TB">TC </div>
							<div id="TD" class="cv dp ui-droppable" style="left: 48px; top: 388px;" dp-bottom="TE">TD </div>
							<div id="TE" class="cv dp ui-droppable" style="left: 48px; top: 419px;" dp-top="TD">TE </div>
							<div id="TF" class="cv dp ui-droppable" style="left: 48px; top: 450px;" dp-bottom="TG">TF </div>
							<div id="TG" class="cv dp ui-droppable" style="left: 48px; top: 481px;" dp-top="TF">TG </div>
							<div id="TH" class="cv dp ui-droppable" style="left: 48px; top: 512px;" dp-bottom="TI">TH </div>
							<div id="TI" class="cv dp ui-droppable" style="left: 48px; top: 543px;" dp-top="TH">TI </div>

							<div id="O61" class="cv dp ui-droppable" style="left: 141px; top: 28px;" dp-bottom="O62">O61 </div>
							<div id="O62" class="cv dp ui-droppable" style="left: 141px; top: 59px;" dp-top="O61">O62 </div>
							<div id="O63" class="cv dp ui-droppable" style="left: 172px; top: 28px;" dp-bottom="O64">O63 </div>
							<div id="O64" class="cv dp ui-droppable" style="left: 172px; top: 59px;" dp-top="O63">O64 </div>
							<div id="O65" class="cv dp ui-droppable" style="left: 203px; top: 28px;" dp-bottom="O66">O65 </div>
							<div id="O66" class="cv dp ui-droppable" style="left: 203px; top: 59px;" dp-top="O65">O66 </div>
							<div id="O67" class="cv dp ui-droppable" style="left: 234px; top: 28px;" dp-bottom="O68">O67 </div>
							<div id="O68" class="cv dp ui-droppable" style="left: 234px; top: 59px;" dp-top="O67">O68 </div>
							<div id="O69" class="cv dp ui-droppable" style="left: 265px; top: 28px;" dp-bottom="O6A">O69 </div>
							<div id="O6A" class="cv dp ui-droppable" style="left: 265px; top: 59px;" dp-top="O69">O6A </div>
							<div id="O6B" class="cv dp ui-droppable" style="left: 296px; top: 28px;" dp-bottom="O6C">O6B </div>
							<div id="O6C" class="cv dp ui-droppable" style="left: 296px; top: 59px;" dp-top="O6B">O6C </div>
							<div id="O51" class="cv dp ui-droppable" style="left: 141px; top: 121px;" dp-bottom="O52">O51 </div>
							<div id="O52" class="cv dp ui-droppable" style="left: 141px; top: 152px;" dp-top="O51">O52 </div>
							<div id="O53" class="cv dp ui-droppable" style="left: 172px; top: 121px;" dp-bottom="O54">O53 </div>
							<div id="O54" class="cv dp ui-droppable" style="left: 172px; top: 152px;" dp-top="O53">O54 </div>
							<div id="O55" class="cv dp ui-droppable" style="left: 203px; top: 121px;" dp-bottom="O56">O55 </div>
							<div id="O56" class="cv dp ui-droppable" style="left: 203px; top: 152px;" dp-top="O55">O56 </div>
							<div id="O57" class="cv dp ui-droppable" style="left: 234px; top: 121px;" dp-bottom="O58">O57 </div>
							<div id="O58" class="cv dp ui-droppable" style="left: 234px; top: 152px;" dp-top="O57">O58 </div>
							<div id="O59" class="cv dp ui-droppable" style="left: 265px; top: 121px;" dp-bottom="O5A">O59 </div>
							<div id="O5A" class="cv dp ui-droppable" style="left: 265px; top: 152px;" dp-top="O59">O5A </div>
							<div id="O5B" class="cv dp ui-droppable" style="left: 296px; top: 121px;" dp-bottom="O5C">O5B </div>
							<div id="O5C" class="cv dp ui-droppable" style="left: 296px; top: 152px;" dp-top="O5B">O5C </div>
							<div id="O41" class="cv dp ui-droppable" style="left: 141px; top: 214px;" dp-bottom="O42">O41 </div>
							<div id="O42" class="cv dp ui-droppable" style="left: 141px; top: 245px;" dp-top="O41">O42 </div>
							<div id="O43" class="cv dp ui-droppable" style="left: 172px; top: 214px;" dp-bottom="O44">O43 </div>
							<div id="O44" class="cv dp ui-droppable" style="left: 172px; top: 245px;" dp-top="O43">O44 </div>
							<div id="O45" class="cv dp ui-droppable" style="left: 203px; top: 214px;" dp-bottom="O46">O45 </div>
							<div id="O46" class="cv dp ui-droppable" style="left: 203px; top: 245px;" dp-top="O45">O46 </div>
							<div id="O47" class="cv dp ui-droppable" style="left: 234px; top: 214px;" dp-bottom="O48">O47 </div>
							<div id="O48" class="cv dp ui-droppable" style="left: 234px; top: 245px;" dp-top="O47">O48 </div>
							<div id="O49" class="cv dp ui-droppable" style="left: 265px; top: 214px;" dp-bottom="O4A">O49 </div>
							<div id="O4A" class="cv dp ui-droppable" style="left: 265px; top: 245px;" dp-top="O49">O4A </div>
							<div id="O4B" class="cv dp ui-droppable" style="left: 296px; top: 214px;" dp-bottom="O4C">O4B </div>
							<div id="O4C" class="cv dp ui-droppable" style="left: 296px; top: 245px;" dp-top="O4B">O4C </div>
							<div id="O31" class="cv dp ui-droppable" style="left: 141px; top: 307px;" dp-bottom="O32">O31 </div>
							<div id="O32" class="cv dp ui-droppable" style="left: 141px; top: 338px;" dp-top="O31">O32 </div>
							<div id="O33" class="cv dp ui-droppable" style="left: 172px; top: 307px;" dp-bottom="O34">O33 </div>
							<div id="O34" class="cv dp ui-droppable" style="left: 172px; top: 338px;" dp-top="O33">O34 </div>
							<div id="O35" class="cv dp ui-droppable" style="left: 203px; top: 307px;" dp-bottom="O36">O35 </div>
							<div id="O36" class="cv dp ui-droppable" style="left: 203px; top: 338px;" dp-top="O35">O36 </div>
							<div id="O37" class="cv dp ui-droppable" style="left: 234px; top: 307px;" dp-bottom="O38">O37 </div>
							<div id="O38" class="cv dp ui-droppable" style="left: 234px; top: 338px;" dp-top="O37">O38 </div>
							<div id="O39" class="cv dp ui-droppable" style="left: 265px; top: 307px;" dp-bottom="O3A">O39 </div>
							<div id="O3A" class="cv dp ui-droppable" style="left: 265px; top: 338px;" dp-top="O39">O3A </div>
							<div id="O3B" class="cv dp ui-droppable" style="left: 296px; top: 307px;" dp-bottom="O3C">O3B </div>
							<div id="O3C" class="cv dp ui-droppable" style="left: 296px; top: 338px;" dp-top="O3B">O3C </div>
							<div id="O21" class="cv dp ui-droppable" style="left: 141px; top: 400px;" dp-bottom="O22">O21 </div>
							<div id="O22" class="cv dp ui-droppable" style="left: 141px; top: 431px;" dp-top="O21">O22 </div>
							<div id="O23" class="cv dp ui-droppable" style="left: 172px; top: 400px;" dp-bottom="O24">O23 </div>
							<div id="O24" class="cv dp ui-droppable" style="left: 172px; top: 431px;" dp-top="O23">O24 </div>
							<div id="O25" class="cv dp ui-droppable" style="left: 203px; top: 400px;" dp-bottom="O26">O25 </div>
							<div id="O26" class="cv dp ui-droppable" style="left: 203px; top: 431px;" dp-top="O25">O26 </div>
							<div id="O27" class="cv dp ui-droppable" style="left: 234px; top: 400px;" dp-bottom="O28">O27 </div>
							<div id="O28" class="cv dp ui-droppable" style="left: 234px; top: 431px;" dp-top="O27">O28 </div>
							<div id="O29" class="cv dp ui-droppable" style="left: 265px; top: 400px;" dp-bottom="O2A">O29 </div>
							<div id="O2A" class="cv dp ui-droppable" style="left: 265px; top: 431px;" dp-top="O29">O2A </div>
							<div id="O2B" class="cv dp ui-droppable" style="left: 296px; top: 400px;" dp-bottom="O2C">O2B </div>
							<div id="O2C" class="cv dp ui-droppable" style="left: 296px; top: 431px;" dp-top="O2B">O2C </div>
							<div id="O11" class="cv dp ui-droppable" style="left: 141px; top: 493px;" dp-bottom="O12">O11 </div>
							<div id="O12" class="cv dp ui-droppable" style="left: 141px; top: 524px;" dp-top="O11">O12 </div>
							<div id="O13" class="cv dp ui-droppable" style="left: 172px; top: 493px;" dp-bottom="O14">O13 </div>
							<div id="O14" class="cv dp ui-droppable" style="left: 172px; top: 524px;" dp-top="O13">O14 </div>
							<div id="O15" class="cv dp ui-droppable" style="left: 203px; top: 493px;" dp-bottom="O16">O15 </div>
							<div id="O16" class="cv dp ui-droppable" style="left: 203px; top: 524px;" dp-top="O15">O16 </div>
							<div id="O17" class="cv dp ui-droppable" style="left: 234px; top: 493px;" dp-bottom="O18">O17 </div>
							<div id="O18" class="cv dp ui-droppable" style="left: 234px; top: 524px;" dp-top="O17">O18 </div>
							<div id="O19" class="cv dp ui-droppable" style="left: 265px; top: 493px;" dp-bottom="O1A">O19 </div>
							<div id="O1A" class="cv dp ui-droppable" style="left: 265px; top: 524px;" dp-top="O19">O1A </div>
							<div id="O1B" class="cv dp ui-droppable" style="left: 296px; top: 493px;" dp-bottom="O1C">O1B </div>
							<div id="O1C" class="cv dp ui-droppable" style="left: 296px; top: 524px;" dp-top="O1B">O1C </div>
							<div id="A61" class="cv dp ui-droppable" style="left: 389px; top: 28px;" dp-bottom="A62">A61 </div>
							<div id="A62" class="cv dp ui-droppable" style="left: 389px; top: 59px;" dp-top="A61">A62 </div>
							<div id="A63" class="cv dp ui-droppable" style="left: 420px; top: 28px;" dp-bottom="A64">A63 </div>
							<div id="A64" class="cv dp ui-droppable" style="left: 420px; top: 59px;" dp-top="A63">A64 </div>
							<div id="A65" class="cv dp ui-droppable" style="left: 451px; top: 28px;" dp-bottom="A66">A65 </div>
							<div id="A66" class="cv dp ui-droppable" style="left: 451px; top: 59px;" dp-top="A65">A66 </div>
							<div id="A67" class="cv dp ui-droppable" style="left: 482px; top: 28px;" dp-bottom="A68">A67 </div>
							<div id="A68" class="cv dp ui-droppable" style="left: 482px; top: 59px;" dp-top="A67">A68 </div>
							<div id="A69" class="cv dp ui-droppable" style="left: 513px; top: 28px;" dp-bottom="A6A">A69 </div>
							<div id="A6A" class="cv dp ui-droppable" style="left: 513px; top: 59px;" dp-top="A69">A6A </div>
							<div id="A6B" class="cv dp ui-droppable" style="left: 544px; top: 28px;" dp-bottom="A6C">A6B </div>
							<div id="A6C" class="cv dp ui-droppable" style="left: 544px; top: 59px;" dp-top="A6B">A6C </div>
							<div id="A51" class="cv dp ui-droppable" style="left: 389px; top: 121px;" dp-bottom="A52">A51 </div>
							<div id="A52" class="cv dp ui-droppable" style="left: 389px; top: 152px;" dp-top="A51">A52 </div>
							<div id="A53" class="cv dp ui-droppable" style="left: 420px; top: 121px;" dp-bottom="A54">A53 </div>
							<div id="A54" class="cv dp ui-droppable" style="left: 420px; top: 152px;" dp-top="A53">A54 </div>
							<div id="A55" class="cv dp ui-droppable" style="left: 451px; top: 121px;" dp-bottom="A56">A55 </div>
							<div id="A56" class="cv dp ui-droppable" style="left: 451px; top: 152px;" dp-top="A55">A56 </div>
							<div id="A57" class="cv dp ui-droppable" style="left: 482px; top: 121px;" dp-bottom="A58">A57 </div>
							<div id="A58" class="cv dp ui-droppable" style="left: 482px; top: 152px;" dp-top="A57">A58 </div>
							<div id="A59" class="cv dp ui-droppable" style="left: 513px; top: 121px;" dp-bottom="A5A">A59 </div>
							<div id="A5A" class="cv dp ui-droppable" style="left: 513px; top: 152px;" dp-top="A59">A5A </div>
							<div id="A5B" class="cv dp ui-droppable" style="left: 544px; top: 121px;" dp-bottom="A5C">A5B </div>
							<div id="A5C" class="cv dp ui-droppable" style="left: 544px; top: 152px;" dp-top="A5B">A5C </div>
							<div id="A41" class="cv dp ui-droppable" style="left: 389px; top: 214px;" dp-bottom="A42">A41 </div>
							<div id="A42" class="cv dp ui-droppable" style="left: 389px; top: 245px;" dp-top="A41">A42 </div>
							<div id="A43" class="cv dp ui-droppable" style="left: 420px; top: 214px;" dp-bottom="A44">A43 </div>
							<div id="A44" class="cv dp ui-droppable" style="left: 420px; top: 245px;" dp-top="A43">A44 </div>
							<div id="A45" class="cv dp ui-droppable" style="left: 451px; top: 214px;" dp-bottom="A46">A45 </div>
							<div id="A46" class="cv dp ui-droppable" style="left: 451px; top: 245px;" dp-top="A45">A46 </div>
							<div id="A47" class="cv dp ui-droppable" style="left: 482px; top: 214px;" dp-bottom="A48">A47 </div>
							<div id="A48" class="cv dp ui-droppable" style="left: 482px; top: 245px;" dp-top="A47">A48 </div>
							<div id="A49" class="cv dp ui-droppable" style="left: 513px; top: 214px;" dp-bottom="A4A">A49 </div>
							<div id="A4A" class="cv dp ui-droppable" style="left: 513px; top: 245px;" dp-top="A49">A4A </div>
							<div id="A4B" class="cv dp ui-droppable" style="left: 544px; top: 214px;" dp-bottom="A4C">A4B </div>
							<div id="A4C" class="cv dp ui-droppable" style="left: 544px; top: 245px;" dp-top="A4B">A4C </div>
							<div id="A31" class="cv dp ui-droppable" style="left: 389px; top: 307px;" dp-bottom="A32">A31 </div>
							<div id="A32" class="cv dp ui-droppable" style="left: 389px; top: 338px;" dp-top="A31">A32 </div>
							<div id="A33" class="cv dp ui-droppable" style="left: 420px; top: 307px;" dp-bottom="A34">A33 </div>
							<div id="A34" class="cv dp ui-droppable" style="left: 420px; top: 338px;" dp-top="A33">A34 </div>
							<div id="A35" class="cv dp ui-droppable" style="left: 451px; top: 307px;" dp-bottom="A36">A35 </div>
							<div id="A36" class="cv dp ui-droppable" style="left: 451px; top: 338px;" dp-top="A35">A36 </div>
							<div id="A37" class="cv dp ui-droppable" style="left: 482px; top: 307px;" dp-bottom="A38">A37 </div>
							<div id="A38" class="cv dp ui-droppable" style="left: 482px; top: 338px;" dp-top="A37">A38 </div>
							<div id="A39" class="cv dp ui-droppable" style="left: 513px; top: 307px;" dp-bottom="A3A">A39 </div>
							<div id="A3A" class="cv dp ui-droppable" style="left: 513px; top: 338px;" dp-top="A39">A3A </div>
							<div id="A3B" class="cv dp ui-droppable" style="left: 544px; top: 307px;" dp-bottom="A3C">A3B </div>
							<div id="A3C" class="cv dp ui-droppable" style="left: 544px; top: 338px;" dp-top="A3B">A3C </div>
							<div id="A21" class="cv dp ui-droppable" style="left: 389px; top: 400px;" dp-bottom="A22">A21 </div>
							<div id="A22" class="cv dp ui-droppable" style="left: 389px; top: 431px;" dp-top="A21">A22 </div>
							<div id="A23" class="cv dp ui-droppable" style="left: 420px; top: 400px;" dp-bottom="A24">A23 </div>
							<div id="A24" class="cv dp ui-droppable" style="left: 420px; top: 431px;" dp-top="A23">A24 </div>
							<div id="A25" class="cv dp ui-droppable" style="left: 451px; top: 400px;" dp-bottom="A26">A25 </div>
							<div id="A26" class="cv dp ui-droppable" style="left: 451px; top: 431px;" dp-top="A25">A26 </div>
							<div id="A27" class="cv dp ui-droppable" style="left: 482px; top: 400px;" dp-bottom="A28">A27 </div>
							<div id="A28" class="cv dp ui-droppable" style="left: 482px; top: 431px;" dp-top="A27">A28 </div>
							<div id="A29" class="cv dp ui-droppable" style="left: 513px; top: 400px;" dp-bottom="A2A">A29 </div>
							<div id="A2A" class="cv dp ui-droppable" style="left: 513px; top: 431px;" dp-top="A29">A2A </div>
							<div id="A2B" class="cv dp ui-droppable" style="left: 544px; top: 400px;" dp-bottom="A2C">A2B </div>
							<div id="A2C" class="cv dp ui-droppable" style="left: 544px; top: 431px;" dp-top="A2B">A2C </div>
							<div id="A11" class="cv dp ui-droppable" style="left: 389px; top: 493px;" dp-bottom="A12">A11 </div>
							<div id="A12" class="cv dp ui-droppable" style="left: 389px; top: 524px;" dp-top="A11">A12 </div>
							<div id="A13" class="cv dp ui-droppable" style="left: 420px; top: 493px;" dp-bottom="A14">A13 </div>
							<div id="A14" class="cv dp ui-droppable" style="left: 420px; top: 524px;" dp-top="A13">A14 </div>
							<div id="A15" class="cv dp ui-droppable" style="left: 451px; top: 493px;" dp-bottom="A16">A15 </div>
							<div id="A16" class="cv dp ui-droppable" style="left: 451px; top: 524px;" dp-top="A15">A16 </div>
							<div id="A17" class="cv dp ui-droppable" style="left: 482px; top: 493px;" dp-bottom="A18"> A17 </div>
							<div id="A18" class="cv dp ui-droppable" style="left: 482px; top: 524px;" dp-top="A17">A18 </div>
							<div id="A19" class="cv dp ui-droppable" style="left: 513px; top: 493px;" dp-bottom="A1A">A19 </div>
							<div id="A1A" class="cv dp ui-droppable" style="left: 513px; top: 524px;" dp-top="A19">A1A </div>
							<div id="A1B" class="cv dp ui-droppable" style="left: 544px; top: 493px;" dp-bottom="A2C">A1B </div>
							<div id="A1C" class="cv dp ui-droppable" style="left: 544px; top: 524px;" dp-top="A1B">A1C </div>
							<div id="B61" class="cv dp ui-droppable" style="left: 637px; top: 28px;" dp-bottom="B62">B61 </div>
							<div id="B62" class="cv dp ui-droppable" style="left: 637px; top: 59px;" dp-top="B61">B62 </div>
							<div id="B63" class="cv dp ui-droppable" style="left: 668px; top: 28px;" dp-bottom="B64">B63 </div>
							<div id="B64" class="cv dp ui-droppable" style="left: 668px; top: 59px;" dp-top="B63">B64 </div>
							<div id="B65" class="cv dp ui-droppable" style="left: 699px; top: 28px;" dp-bottom="B66">B65 </div>
							<div id="B66" class="cv dp ui-droppable" style="left: 699px; top: 59px;" dp-top="B65">B66 </div>
							<div id="B67" class="cv dp ui-droppable" style="left: 730px; top: 28px;" dp-bottom="B68">B67 </div>
							<div id="B68" class="cv dp ui-droppable" style="left: 730px; top: 59px;" dp-top="B67">B68 </div>
							<div id="B69" class="cv dp ui-droppable" style="left: 761px; top: 28px;" dp-bottom="B6A">B69 </div>
							<div id="B6A" class="cv dp ui-droppable" style="left: 761px; top: 59px;" dp-top="B69">B6A </div>
							<div id="B6B" class="cv dp ui-droppable" style="left: 792px; top: 28px;" dp-bottom="B6C">B6B </div>
							<div id="B6C" class="cv dp ui-droppable" style="left: 792px; top: 59px;" dp-top="B6B">B6C </div>
							<div id="B51" class="cv dp ui-droppable" style="left: 637px; top: 121px;" dp-bottom="B52">B51 </div>
							<div id="B52" class="cv dp ui-droppable" style="left: 637px; top: 152px;" dp-top="B51">B52 </div>
							<div id="B53" class="cv dp ui-droppable" style="left: 668px; top: 121px;" dp-bottom="B54">B53 </div>
							<div id="B54" class="cv dp ui-droppable" style="left: 668px; top: 152px;" dp-top="B53">B54 </div>
							<div id="B55" class="cv dp ui-droppable" style="left: 699px; top: 121px;" dp-bottom="B56">B55 </div>
							<div id="B56" class="cv dp ui-droppable" style="left: 699px; top: 152px;" dp-top="B55">B56 </div>
							<div id="B57" class="cv dp ui-droppable" style="left: 730px; top: 121px;" dp-bottom="B58">B57 </div>
							<div id="B58" class="cv dp ui-droppable" style="left: 730px; top: 152px;" dp-top="B57">B58 </div>
							<div id="B59" class="cv dp ui-droppable" style="left: 761px; top: 121px;" dp-bottom="B5A">B59 </div>
							<div id="B5A" class="cv dp ui-droppable" style="left: 761px; top: 152px;" dp-top="B59">B5A </div>
							<div id="B5B" class="cv dp ui-droppable" style="left: 792px; top: 121px;" dp-bottom="B5C">B5B </div>
							<div id="B5C" class="cv dp ui-droppable" style="left: 792px; top: 152px;" dp-top="B5B">B5C </div>
							<div id="B41" class="cv dp ui-droppable" style="left: 637px; top: 214px;" dp-bottom="B42">B41 </div>
							<div id="B42" class="cv dp ui-droppable" style="left: 637px; top: 245px;" dp-top="B41">B42 </div>
							<div id="B43" class="cv dp ui-droppable" style="left: 668px; top: 214px;" dp-bottom="B44">B43 </div>
							<div id="B44" class="cv dp ui-droppable" style="left: 668px; top: 245px;" dp-top="B43">B44 </div>
							<div id="B45" class="cv dp ui-droppable" style="left: 699px; top: 214px;" dp-bottom="B46">B45 </div>
							<div id="B46" class="cv dp ui-droppable" style="left: 699px; top: 245px;" dp-top="B45">B46 </div>
							<div id="B47" class="cv dp ui-droppable" style="left: 730px; top: 214px;" dp-bottom="B48">B47 </div>
							<div id="B48" class="cv dp ui-droppable" style="left: 730px; top: 245px;" dp-top="B47">B48 </div>
							<div id="B49" class="cv dp ui-droppable" style="left: 761px; top: 214px;" dp-bottom="B4A">B49 </div>
							<div id="B4A" class="cv dp ui-droppable" style="left: 761px; top: 245px;" dp-top="B49">B4A </div>
							<div id="B4B" class="cv dp ui-droppable" style="left: 792px; top: 214px;" dp-bottom="B4C">B4B </div>
							<div id="B4C" class="cv dp ui-droppable" style="left: 792px; top: 245px;" dp-top="B4B">B4C </div>
							<div id="B31" class="cv dp ui-droppable" style="left: 637px; top: 307px;" dp-bottom="B32">B31 </div>
							<div id="B32" class="cv dp ui-droppable" style="left: 637px; top: 338px;" dp-top="B31">B32 </div>
							<div id="B33" class="cv dp ui-droppable" style="left: 668px; top: 307px;" dp-bottom="B34">B33 </div>
							<div id="B34" class="cv dp ui-droppable" style="left: 668px; top: 338px;" dp-top="B33">B34 </div>
							<div id="B35" class="cv dp ui-droppable" style="left: 699px; top: 307px;" dp-bottom="B36">B35 </div>
							<div id="B36" class="cv dp ui-droppable" style="left: 699px; top: 338px;" dp-top="B35">B36 </div>
							<div id="B37" class="cv dp ui-droppable" style="left: 730px; top: 307px;" dp-bottom="B38">B37 </div>
							<div id="B38" class="cv dp ui-droppable" style="left: 730px; top: 338px;" dp-top="B37">B38 </div>
							<div id="B39" class="cv dp ui-droppable" style="left: 761px; top: 307px;" dp-bottom="B3A">B39 </div>
							<div id="B3A" class="cv dp ui-droppable" style="left: 761px; top: 338px;" dp-top="B39">B3A </div>
							<div id="B3B" class="cv dp ui-droppable" style="left: 792px; top: 307px;" dp-bottom="B3C">B3B </div>
							<div id="B3C" class="cv dp ui-droppable" style="left: 792px; top: 338px;" dp-top="B3B">B3C </div>
							<div id="B21" class="cv dp ui-droppable" style="left: 637px; top: 400px;" dp-bottom="B22">B21 </div>
							<div id="B22" class="cv dp ui-droppable" style="left: 637px; top: 431px;" dp-top="B21">B22 </div>
							<div id="B23" class="cv dp ui-droppable" style="left: 668px; top: 400px;" dp-bottom="B24">B23 </div>
							<div id="B24" class="cv dp ui-droppable" style="left: 668px; top: 431px;" dp-top="B23">B24 </div>
							<div id="B25" class="cv dp ui-droppable" style="left: 699px; top: 400px;" dp-bottom="B26">B25 </div>
							<div id="B26" class="cv dp ui-droppable" style="left: 699px; top: 431px;" dp-top="B25">B26 </div>
							<div id="B27" class="cv dp ui-droppable" style="left: 730px; top: 400px;" dp-bottom="B28">B27 </div>
							<div id="B28" class="cv dp ui-droppable" style="left: 730px; top: 431px;" dp-top="B27">B28 </div>
							<div id="B29" class="cv dp ui-droppable" style="left: 761px; top: 400px;" dp-bottom="B2A">B29 </div>
							<div id="B2A" class="cv dp ui-droppable" style="left: 761px; top: 431px;" dp-top="B29">B2A </div>
							<div id="B2B" class="cv dp ui-droppable" style="left: 792px; top: 400px;" dp-bottom="B2C">B2B </div>
							<div id="B2C" class="cv dp ui-droppable" style="left: 792px; top: 431px;" dp-top="B2B">B2C </div>
							<div id="B11" class="cv dp ui-droppable" style="left: 637px; top: 493px;" dp-bottom="B12">B11 </div>
							<div id="B12" class="cv dp ui-droppable" style="left: 637px; top: 524px;" dp-top="B11">B12 </div>
							<div id="B13" class="cv dp ui-droppable" style="left: 668px; top: 493px;" dp-bottom="B14">B13 </div>
							<div id="B14" class="cv dp ui-droppable" style="left: 668px; top: 524px;" dp-top="B13">B14 </div>
							<div id="B15" class="cv dp ui-droppable" style="left: 699px; top: 493px;" dp-bottom="B16">B15 </div>
							<div id="B16" class="cv dp ui-droppable" style="left: 699px; top: 524px;" dp-top="B15">B16 </div>
							<div id="B17" class="cv dp ui-droppable" style="left: 730px; top: 493px;" dp-bottom="B18">B17 </div>
							<div id="B18" class="cv dp ui-droppable" style="left: 730px; top: 524px;" dp-top="B17">B18 </div>
							<div id="B19" class="cv dp ui-droppable" style="left: 761px; top: 493px;" dp-bottom="B1A">B19 </div>
							<div id="B1A" class="cv dp ui-droppable" style="left: 761px; top: 524px;" dp-top="B19">B1A </div>
							<div id="B1B" class="cv dp ui-droppable" style="left: 792px; top: 493px;" dp-bottom="B1C">B1B </div>
							<div id="B1C" class="cv dp ui-droppable" style="left: 792px; top: 524px;" dp-top="B1B">B1C </div>
							<div id="C61" class="cv dp ui-droppable" style="left: 885px; top: 28px;" dp-bottom="C62">C61 </div>
							<div id="C62" class="cv dp ui-droppable" style="left: 885px; top: 59px;" dp-top="C61">C62 </div>
							<div id="C63" class="cv dp ui-droppable" style="left: 916px; top: 28px;" dp-bottom="C64">C63 </div>
							<div id="C64" class="cv dp ui-droppable" style="left: 916px; top: 59px;" dp-top="C63">C64 </div>
							<div id="C65" class="cv dp ui-droppable" style="left: 947px; top: 28px;" dp-bottom="C66">C65 </div>
							<div id="C66" class="cv dp ui-droppable" style="left: 947px; top: 59px;" dp-top="C65">C66 </div>
							<div id="C67" class="cv dp ui-droppable" style="left: 978px; top: 28px;" dp-bottom="C68">C67 </div>
							<div id="C68" class="cv dp ui-droppable" style="left: 978px; top: 59px;" dp-top="C67">C68 </div>
							<div id="C69" class="cv dp ui-droppable" style="left: 1009px; top: 28px;" dp-bottom="C6A">C69 </div>
							<div id="C6A" class="cv dp ui-droppable" style="left: 1009px; top: 59px;" dp-top="C69">C6A </div>
							<div id="C6B" class="cv dp ui-droppable" style="left: 1040px; top: 28px;" dp-bottom="C6C">C6B </div>
							<div id="C6C" class="cv dp ui-droppable" style="left: 1040px; top: 59px;" dp-top="C6B">C6C </div>
							<div id="C51" class="cv dp ui-droppable" style="left: 885px; top: 121px;" dp-bottom="C52">C51 </div>
							<div id="C52" class="cv dp ui-droppable" style="left: 885px; top: 152px;" dp-top="C51">C52 </div>
							<div id="C53" class="cv dp ui-droppable" style="left: 916px; top: 121px;" dp-bottom="C54">C53 </div>
							<div id="C54" class="cv dp ui-droppable" style="left: 916px; top: 152px;" dp-top="C53">C54 </div>
							<div id="C55" class="cv dp ui-droppable" style="left: 947px; top: 121px;" dp-bottom="C56">C55 </div>
							<div id="C56" class="cv dp ui-droppable" style="left: 947px; top: 152px;" dp-top="C55">C56 </div>
							<div id="C57" class="cv dp ui-droppable" style="left: 978px; top: 121px;" dp-bottom="C58">C57 </div>
							<div id="C58" class="cv dp ui-droppable" style="left: 978px; top: 152px;" dp-top="C57">C58 </div>
							<div id="C59" class="cv dp ui-droppable" style="left: 1009px; top: 121px;" dp-bottom="C5A">C59 </div>
							<div id="C5A" class="cv dp ui-droppable" style="left: 1009px; top: 152px;" dp-top="C59">C5A </div>
							<div id="C5B" class="cv dp ui-droppable" style="left: 1040px; top: 121px;" dp-bottom="C5C">C5B </div>
							<div id="C5C" class="cv dp ui-droppable" style="left: 1040px; top: 152px;" dp-top="C5B">C5C </div>
							<div id="C41" class="cv dp ui-droppable" style="left: 885px; top: 214px;" dp-bottom="C42">C41 </div>
							<div id="C42" class="cv dp ui-droppable" style="left: 885px; top: 245px;" dp-top="C41">C42 </div>
							<div id="C43" class="cv dp ui-droppable" style="left: 916px; top: 214px;" dp-bottom="C44">C43 </div>
							<div id="C44" class="cv dp ui-droppable" style="left: 916px; top: 245px;" dp-top="C43">C44 </div>
							<div id="C45" class="cv dp ui-droppable" style="left: 947px; top: 214px;" dp-bottom="C46">C45 </div>
							<div id="C46" class="cv dp ui-droppable" style="left: 947px; top: 245px;" dp-top="C45">C46 </div>
							<div id="C47" class="cv dp ui-droppable" style="left: 978px; top: 214px;" dp-bottom="C48">C47 </div>
							<div id="C48" class="cv dp ui-droppable" style="left: 978px; top: 245px;" dp-top="C47">C48 </div>
							<div id="C49" class="cv dp ui-droppable" style="left: 1009px; top: 214px;" dp-bottom="C4A">C49 </div>
							<div id="C4A" class="cv dp ui-droppable" style="left: 1009px; top: 245px;" dp-top="C49">C4A </div>
							<div id="C4B" class="cv dp ui-droppable" style="left: 1040px; top: 214px;" dp-bottom="C4C">C4B </div>
							<div id="C4C" class="cv dp ui-droppable" style="left: 1040px; top: 245px;" dp-top="C4B">C4C </div>
							<div id="C31" class="cv dp ui-droppable" style="left: 885px; top: 307px;" dp-bottom="C32">C31 </div>
							<div id="C32" class="cv dp ui-droppable" style="left: 885px; top: 338px;" dp-top="C31">C32 </div>
							<div id="C33" class="cv dp ui-droppable" style="left: 916px; top: 307px;" dp-bottom="C34">C33 </div>
							<div id="C34" class="cv dp ui-droppable" style="left: 916px; top: 338px;" dp-top="C33">C34 </div>
							<div id="C35" class="cv dp ui-droppable" style="left: 947px; top: 307px;" dp-bottom="C36">C35 </div>
							<div id="C36" class="cv dp ui-droppable" style="left: 947px; top: 338px;" dp-top="C35">C36 </div>
							<div id="C37" class="cv dp ui-droppable" style="left: 978px; top: 307px;" dp-bottom="C38">C37 </div>
							<div id="C38" class="cv dp ui-droppable" style="left: 978px; top: 338px;" dp-top="C37">C38 </div>
							<div id="C39" class="cv dp ui-droppable" style="left: 1009px; top: 307px;" dp-bottom="C3A">C39 </div>
							<div id="C3A" class="cv dp ui-droppable" style="left: 1009px; top: 338px;" dp-top="C39">C3A </div>
							<div id="C3B" class="cv dp ui-droppable" style="left: 1040px; top: 307px;" dp-bottom="C3C">C3B </div>
							<div id="C3C" class="cv dp ui-droppable" style="left: 1040px; top: 338px;" dp-top="C3B">C3C </div>
							<div id="C21" class="cv dp ui-droppable" style="left: 885px; top: 400px;" dp-bottom="C22">C21 </div>
							<div id="C22" class="cv dp ui-droppable" style="left: 885px; top: 431px;" dp-top="C21">C22 </div>
							<div id="C23" class="cv dp ui-droppable" style="left: 916px; top: 400px;" dp-bottom="C24">C23 </div>
							<div id="C24" class="cv dp ui-droppable" style="left: 916px; top: 431px;" dp-top="C23">C24 </div>
							<div id="C25" class="cv dp ui-droppable" style="left: 947px; top: 400px;" dp-bottom="C26">C25 </div>
							<div id="C26" class="cv dp ui-droppable" style="left: 947px; top: 431px;" dp-top="C25">C26 </div>
							<div id="C27" class="cv dp ui-droppable" style="left: 978px; top: 400px;" dp-bottom="C28">C27 </div>
							<div id="C28" class="cv dp ui-droppable" style="left: 978px; top: 431px;" dp-top="C27">C28 </div>
							<div id="C29" class="cv dp ui-droppable" style="left: 1009px; top: 400px;" dp-bottom="C2A">C29 </div>
							<div id="C2A" class="cv dp ui-droppable" style="left: 1009px; top: 431px;" dp-top="C29">C2A </div>
							<div id="C2B" class="cv dp ui-droppable" style="left: 1040px; top: 400px;" dp-bottom="C2C">C2B </div>
							<div id="C2C" class="cv dp ui-droppable" style="left: 1040px; top: 431px;" dp-top="C2B">C2C </div>
							<div id="C11" class="cv dp ui-droppable" style="left: 885px; top: 493px;" dp-bottom="C12">C11 </div>
							<div id="C12" class="cv dp ui-droppable" style="left: 885px; top: 524px;" dp-top="C11">C12 </div>
							<div id="C13" class="cv dp ui-droppable" style="left: 916px; top: 493px;" dp-bottom="C14">C13 </div>
							<div id="C14" class="cv dp ui-droppable" style="left: 916px; top: 524px;" dp-top="C13">C14 </div>
							<div id="C15" class="cv dp ui-droppable" style="left: 947px; top: 493px;" dp-bottom="C16">C15 </div>
							<div id="C16" class="cv dp ui-droppable" style="left: 947px; top: 524px;" dp-top="C15">C16 </div>
							<div id="C17" class="cv dp ui-droppable" style="left: 978px; top: 493px;" dp-bottom="C18">C17 </div>
							<div id="C18" class="cv dp ui-droppable" style="left: 978px; top: 524px;" dp-top="C17">C18 </div>
							<div id="C19" class="cv dp ui-droppable" style="left: 1009px; top: 493px;" dp-bottom="C1A">C19 </div>
							<div id="C1A" class="cv dp ui-droppable" style="left: 1009px; top: 524px;" dp-top="C19">C1A </div>
							<div id="C1B" class="cv dp ui-droppable" style="left: 1040px; top: 493px;" dp-bottom="C1C">C1B </div>
							<div id="C1C" class="cv dp ui-droppable" style="left: 1040px; top: 524px;" dp-top="C1B">C1C </div>
							<div id="D61" class="cv dp ui-droppable" style="left: 1133px; top: 28px;" dp-bottom="D62">D61 </div>
							<div id="D62" class="cv dp ui-droppable" style="left: 1133px; top: 59px;" dp-top="D61">D62 </div>
							<div id="D63" class="cv dp ui-droppable" style="left: 1164px; top: 28px;" dp-bottom="D64">D63 </div>
							<div id="D64" class="cv dp ui-droppable" style="left: 1164px; top: 59px;" dp-top="D63">D64 </div>
							<div id="D65" class="cv dp ui-droppable" style="left: 1195px; top: 28px;" dp-bottom="D66">D65 </div>
							<div id="D66" class="cv dp ui-droppable" style="left: 1195px; top: 59px;" dp-top="D65">D66 </div>
							<div id="D67" class="cv dp ui-droppable" style="left: 1226px; top: 28px;" dp-bottom="D68">D67 </div>
							<div id="D68" class="cv dp ui-droppable" style="left: 1226px; top: 59px;" dp-top="D67">D68 </div>
							<div id="D69" class="cv dp ui-droppable" style="left: 1257px; top: 28px;" dp-bottom="D6A">D69 </div>
							<div id="D6A" class="cv dp ui-droppable" style="left: 1257px; top: 59px;" dp-top="D69">D6A </div>
							<div id="D6B" class="cv dp ui-droppable" style="left: 1288px; top: 28px;" dp-bottom="D6C">D6B </div>
							<div id="D6C" class="cv dp ui-droppable" style="left: 1288px; top: 59px;" dp-top="D6B">D6C </div>
							<div id="D51" class="cv dp ui-droppable" style="left: 1133px; top: 121px;" dp-bottom="D52">D51 </div>
							<div id="D52" class="cv dp ui-droppable" style="left: 1133px; top: 152px;" dp-top="D51">D52 </div>
							<div id="D53" class="cv dp ui-droppable" style="left: 1164px; top: 121px;" dp-bottom="D54">D53 </div>
							<div id="D54" class="cv dp ui-droppable" style="left: 1164px; top: 152px;" dp-top="D53">D54 </div>
							<div id="D55" class="cv dp ui-droppable" style="left: 1195px; top: 121px;" dp-bottom="D56">D55 </div>
							<div id="D56" class="cv dp ui-droppable" style="left: 1195px; top: 152px;" dp-top="D55">D56 </div>
							<div id="D57" class="cv dp ui-droppable" style="left: 1226px; top: 121px;" dp-bottom="D58">D57 </div>
							<div id="D58" class="cv dp ui-droppable" style="left: 1226px; top: 152px;" dp-top="D57">D58 </div>
							<div id="D59" class="cv dp ui-droppable" style="left: 1257px; top: 121px;" dp-bottom="D5A">D59 </div>
							<div id="D5A" class="cv dp ui-droppable" style="left: 1257px; top: 152px;" dp-top="D59">D5A </div>
							<div id="D5B" class="cv dp ui-droppable" style="left: 1288px; top: 121px;" dp-bottom="D5C">D5B </div>
							<div id="D5C" class="cv dp ui-droppable" style="left: 1288px; top: 152px;" dp-top="D5B">D5C </div>
							<div id="D41" class="cv dp ui-droppable" style="left: 1133px; top: 214px;" dp-bottom="D42">D41 </div>
							<div id="D42" class="cv dp ui-droppable" style="left: 1133px; top: 245px;" dp-top="D41">D42 </div>
							<div id="D43" class="cv dp ui-droppable" style="left: 1164px; top: 214px;" dp-bottom="D44">D43 </div>
							<div id="D44" class="cv dp ui-droppable" style="left: 1164px; top: 245px;" dp-top="D43">D44 </div>
							<div id="D45" class="cv dp ui-droppable" style="left: 1195px; top: 214px;" dp-bottom="D46">D45 </div>
							<div id="D46" class="cv dp ui-droppable" style="left: 1195px; top: 245px;" dp-top="D45">D46 </div>
							<div id="D47" class="cv dp ui-droppable" style="left: 1226px; top: 214px;" dp-bottom="D48">D47 </div>
							<div id="D48" class="cv dp ui-droppable" style="left: 1226px; top: 245px;" dp-top="D47">D48 </div>
							<div id="D49" class="cv dp ui-droppable" style="left: 1257px; top: 214px;" dp-bottom="D4A">D49 </div>
							<div id="D4A" class="cv dp ui-droppable" style="left: 1257px; top: 245px;" dp-top="D49">D4A </div>
							<div id="D4B" class="cv dp ui-droppable" style="left: 1288px; top: 214px;" dp-bottom="D4C">D4B </div>
							<div id="D4C" class="cv dp ui-droppable" style="left: 1288px; top: 245px;" dp-top="D4B">D4C </div>
							<div id="D31" class="cv dp ui-droppable" style="left: 1133px; top: 307px;" dp-bottom="D32">D31 </div>
							<div id="D32" class="cv dp ui-droppable" style="left: 1133px; top: 338px;" dp-top="D31">D32 </div>
							<div id="D33" class="cv dp ui-droppable" style="left: 1164px; top: 307px;" dp-bottom="D34">D33 </div>
							<div id="D34" class="cv dp ui-droppable" style="left: 1164px; top: 338px;" dp-top="D33">D34 </div>
							<div id="D35" class="cv dp ui-droppable" style="left: 1195px; top: 307px;" dp-bottom="D36">D35 </div>
							<div id="D36" class="cv dp ui-droppable" style="left: 1195px; top: 338px;" dp-top="D35">D36 </div>
							<div id="D37" class="cv dp ui-droppable" style="left: 1226px; top: 307px;" dp-bottom="D38">D37 </div>
							<div id="D38" class="cv dp ui-droppable" style="left: 1226px; top: 338px;" dp-top="D37">D38 </div>
							<div id="D39" class="cv dp ui-droppable" style="left: 1257px; top: 307px;" dp-bottom="D3A">D39 </div>
							<div id="D3A" class="cv dp ui-droppable" style="left: 1257px; top: 338px;" dp-top="D39">D3A </div>
							<div id="D3B" class="cv dp ui-droppable" style="left: 1288px; top: 307px;" dp-bottom="D3C">D3B </div>
							<div id="D3C" class="cv dp ui-droppable" style="left: 1288px; top: 338px;" dp-top="D3B">D3C </div>
							<div id="D21" class="cv dp ui-droppable" style="left: 1133px; top: 400px;" dp-bottom="D22">D21 </div>
							<div id="D22" class="cv dp ui-droppable" style="left: 1133px; top: 431px;" dp-top="D21">D22 </div>
							<div id="D23" class="cv dp ui-droppable" style="left: 1164px; top: 400px;" dp-bottom="D24">D23 </div>
							<div id="D24" class="cv dp ui-droppable" style="left: 1164px; top: 431px;" dp-top="D23">D24 </div>
							<div id="D25" class="cv dp ui-droppable" style="left: 1195px; top: 400px;" dp-bottom="D26">D25 </div>
							<div id="D26" class="cv dp ui-droppable" style="left: 1195px; top: 431px;" dp-top="D25">D26 </div>
							<div id="D27" class="cv dp ui-droppable" style="left: 1226px; top: 400px;" dp-bottom="D28">D27 </div>
							<div id="D28" class="cv dp ui-droppable" style="left: 1226px; top: 431px;" dp-top="D27">D28 </div>
							<div id="D29" class="cv dp ui-droppable" style="left: 1257px; top: 400px;" dp-bottom="D2A">D29 </div>
							<div id="D2A" class="cv dp ui-droppable" style="left: 1257px; top: 431px;" dp-top="D29">D2A </div>
							<div id="D2B" class="cv dp ui-droppable" style="left: 1288px; top: 400px;" dp-bottom="D2C">D2B </div>
							<div id="D2C" class="cv dp ui-droppable" style="left: 1288px; top: 431px;" dp-top="D2B">D2C </div>
							<div id="D11" class="cv dp ui-droppable" style="left: 1133px; top: 493px;" dp-bottom="D12">D11 </div>
							<div id="D12" class="cv dp ui-droppable" style="left: 1133px; top: 524px;" dp-top="D11">D12 </div>
							<div id="D13" class="cv dp ui-droppable" style="left: 1164px; top: 493px;" dp-bottom="D14">D13 </div>
							<div id="D14" class="cv dp ui-droppable" style="left: 1164px; top: 524px;" dp-top="D13">D14 </div>
							<div id="D15" class="cv dp ui-droppable" style="left: 1195px; top: 493px;" dp-bottom="D16">D15 </div>
							<div id="D16" class="cv dp ui-droppable" style="left: 1195px; top: 524px;" dp-top="D15">D16 </div>
							<div id="D17" class="cv dp ui-droppable" style="left: 1226px; top: 493px;" dp-bottom="D18">D17 </div>
							<div id="D18" class="cv dp ui-droppable" style="left: 1226px; top: 524px;" dp-top="D17">D18 </div>
							<div id="D19" class="cv dp ui-droppable" style="left: 1257px; top: 493px;" dp-bottom="D1A">D19 </div>
							<div id="D1A" class="cv dp ui-droppable" style="left: 1257px; top: 524px;" dp-top="D19">D1A </div>
							<div id="D1B" class="cv dp ui-droppable" style="left: 1288px; top: 493px;" dp-bottom="D1C">D1B </div>
							<div id="D1C" class="cv dp ui-droppable" style="left: 1288px; top: 524px;" dp-top="D1B">D1C </div>

							<div id="c61" class="cv dp ui-droppable" style="left: 1381px; top: 28px;" dp-bottom="c62">c61 </div>
							<div id="c62" class="cv dp ui-droppable" style="left: 1381px; top: 59px;" dp-top="c61">c62 </div>
							<div id="c63" class="cv dp ui-droppable" style="left: 1412px; top: 28px;" dp-bottom="c64">c63 </div>
							<div id="c64" class="cv dp ui-droppable" style="left: 1412px; top: 59px;" dp-top="c63">c64 </div>

							<div id="c51" class="cv dp ui-droppable" style="left: 1381px; top: 121px;" dp-bottom="c52">c51 </div>
							<div id="c52" class="cv dp ui-droppable" style="left: 1381px; top: 152px;" dp-top="c51">c52 </div>
							<div id="c53" class="cv dp ui-droppable" style="left: 1412px; top: 121px;" dp-bottom="c54">c53 </div>
							<div id="c54" class="cv dp ui-droppable" style="left: 1412px; top: 152px;" dp-top="c53">c54 </div>
							<div id="c55" class="cv dp ui-droppable" style="left: 1443px;top: 121px;" dp-bottom="c56">c55 </div>
							<div id="c56" class="cv dp ui-droppable" style="left: 1443px;top: 152px;" dp-top="c55">c56 </div>
							<div id="c57" class="cv dp ui-droppable" style="left: 1474px; top: 121px;" dp-bottom="c58">c57 </div>
							<div id="c58" class="cv dp ui-droppable" style="left: 1474px; top: 152px;" dp-top="c57">c58 </div>
							<div id="c59" class="cv dp ui-droppable" style="left: 1505px; top: 121px;" dp-bottom="c5A">c59 </div>
							<div id="c5A" class="cv dp ui-droppable" style="left: 1505px; top: 152px;" dp-top="c59">c5A </div>
							<div id="c5B" class="cv dp ui-droppable" style="left: 1536px; top: 121px;" dp-bottom="c5C">c5B </div>
							<div id="c5C" class="cv dp ui-droppable" style="left: 1536px; top: 152px;" dp-top="c5B">c5C </div>
							<div id="c41" class="cv dp ui-droppable" style="left: 1381px; top: 214px;" dp-bottom="c42">c41 </div>
							<div id="c42" class="cv dp ui-droppable" style="left: 1381px; top: 245px;" dp-top="c41">c42 </div>
							<div id="c43" class="cv dp ui-droppable" style="left: 1412px; top: 214px;" dp-bottom="c44">c43 </div>
							<div id="c44" class="cv dp ui-droppable" style="left: 1412px; top: 245px;" dp-top="c43">c44 </div>
							<div id="c45" class="cv dp ui-droppable" style="left: 1443px;top: 214px;" dp-bottom="c46">c45 </div>
							<div id="c46" class="cv dp ui-droppable" style="left: 1443px;top: 245px;" dp-top="c45">c46 </div>
							<div id="c47" class="cv dp ui-droppable" style="left: 1474px; top: 214px;" dp-bottom="c48">c47 </div>
							<div id="c48" class="cv dp ui-droppable" style="left: 1474px; top: 245px;" dp-top="c47">c48 </div>
							<div id="c49" class="cv dp ui-droppable" style="left: 1505px; top: 214px;" dp-bottom="c4A">c49 </div>
							<div id="c4A" class="cv dp ui-droppable" style="left: 1505px; top: 245px;" dp-top="c49">c4A </div>
							<div id="c4B" class="cv dp ui-droppable" style="left: 1536px; top: 214px;" dp-bottom="c4C">c4B </div>
							<div id="c4C" class="cv dp ui-droppable" style="left: 1536px; top: 245px;" dp-top="c4B">c4C </div>
							<div id="c31" class="cv dp ui-droppable" style="left: 1381px; top: 307px;" dp-bottom="c32">c31 </div>
							<div id="c32" class="cv dp ui-droppable" style="left: 1381px; top: 338px;" dp-top="c31">c32 </div>
							<div id="c33" class="cv dp ui-droppable" style="left: 1412px; top: 307px;" dp-bottom="c34">c33 </div>
							<div id="c34" class="cv dp ui-droppable" style="left: 1412px; top: 338px;" dp-top="c33">c34 </div>
							<div id="c35" class="cv dp ui-droppable" style="left: 1443px;top: 307px;" dp-bottom="c36">c35 </div>
							<div id="c36" class="cv dp ui-droppable" style="left: 1443px;top: 338px;" dp-top="c35">c36 </div>
							<div id="c37" class="cv dp ui-droppable" style="left: 1474px; top: 307px;" dp-bottom="c38">c37 </div>
							<div id="c38" class="cv dp ui-droppable" style="left: 1474px; top: 338px;" dp-top="c37">c38 </div>
							<div id="c39" class="cv dp ui-droppable" style="left: 1505px; top: 307px;" dp-bottom="c3A">c39 </div>
							<div id="c3A" class="cv dp ui-droppable" style="left: 1505px; top: 338px;" dp-top="c39">c3A </div>
							<div id="c3B" class="cv dp ui-droppable" style="left: 1536px; top: 307px;" dp-bottom="c3C">c3B </div>
							<div id="c3C" class="cv dp ui-droppable" style="left: 1536px; top: 338px;" dp-top="c3B">c3C </div>
							<div id="c21" class="cv dp ui-droppable" style="left: 1381px; top: 400px;" dp-bottom="c22">c21 </div>
							<div id="c22" class="cv dp ui-droppable" style="left: 1381px; top: 431px;" dp-top="c21">c22 </div>
							<div id="c23" class="cv dp ui-droppable" style="left: 1412px; top: 400px;" dp-bottom="c24">c23 </div>
							<div id="c24" class="cv dp ui-droppable" style="left: 1412px; top: 431px;" dp-top="c23">c24 </div>
							<div id="c25" class="cv dp ui-droppable" style="left: 1443px;top: 400px;" dp-bottom="c26">c25 </div>
							<div id="c26" class="cv dp ui-droppable" style="left: 1443px;top: 431px;" dp-top="c25">c26 </div>
							<div id="c27" class="cv dp ui-droppable" style="left: 1474px; top: 400px;" dp-bottom="c28">c27 </div>
							<div id="c28" class="cv dp ui-droppable" style="left: 1474px; top: 431px;" dp-top="c27">c28 </div>
							<div id="c29" class="cv dp ui-droppable" style="left: 1505px; top: 400px;" dp-bottom="c2A">c29 </div>
							<div id="c2A" class="cv dp ui-droppable" style="left: 1505px; top: 431px;" dp-top="c29">c2A </div>
							<div id="c2B" class="cv dp ui-droppable" style="left: 1536px; top: 400px;" dp-bottom="c2C">c2B </div>
							<div id="c2C" class="cv dp ui-droppable" style="left: 1536px; top: 431px;" dp-top="c2B">c2C </div>
							<div id="c11" class="cv dp ui-droppable" style="left: 1381px; top: 493px;" dp-bottom="c12">c11 </div>
							<div id="c12" class="cv dp ui-droppable" style="left: 1381px; top: 524px;" dp-top="c11">c12 </div>
							<div id="c13" class="cv dp ui-droppable" style="left: 1412px; top: 493px;" dp-bottom="c14">c13 </div>
							<div id="c14" class="cv dp ui-droppable" style="left: 1412px; top: 524px;" dp-top="c13">c14 </div>
							<div id="c15" class="cv dp ui-droppable" style="left: 1443px;top: 493px;" dp-bottom="c16">c15 </div>
							<div id="c16" class="cv dp ui-droppable" style="left: 1443px;top: 524px;" dp-top="c15">c16 </div>
							<div id="c17" class="cv dp ui-droppable" style="left: 1474px; top: 493px;" dp-bottom="c18">c17 </div>
							<div id="c18" class="cv dp ui-droppable" style="left: 1474px; top: 524px;" dp-top="c17">c18 </div>
							<div id="c19" class="cv dp ui-droppable" style="left: 1505px; top: 493px;" dp-bottom="c1A">c19 </div>
							<div id="c1A" class="cv dp ui-droppable" style="left: 1505px; top: 524px;" dp-top="c19">c1A </div>
							<div id="c1B" class="cv dp ui-droppable" style="left: 1536px; top: 493px;" dp-bottom="c1C">c1B </div>
							<div id="c1C" class="cv dp ui-droppable" style="left: 1536px; top: 524px;" dp-top="c1B">c1C </div>
							
							<div id="CE6" class="cv dp ui-droppable" style="left: 1629px; top: 524px;" dp-top="CE5">CE6 </div>
							<div id="CE5" class="cv dp ui-droppable" style="left: 1629px; top: 493px;" dp-bottom="CE6">CE5 </div>
							<div id="CE4" class="cv dp ui-droppable" style="left: 1629px; top: 462px;" dp-top="CE3">CE4 </div>
							<div id="CE3" class="cv dp ui-droppable" style="left: 1629px; top: 431px;" dp-bottom="CE4">CE3 </div>
							<div id="CE2" class="cv dp ui-droppable" style="left: 1629px; top: 400px;" dp-top="CE1">CE2 </div>
							<div id="CE1" class="cv dp ui-droppable" style="left: 1629px; top: 369px;" dp-bottom="CE2">CE1 </div>
							
							<hr class="cy-hr">
							
							<div id="R1" class="cv dp ui-droppable" style="left: 1629px; top: 600px;">R1 </div>
							<div id="R2" class="cv dp ui-droppable" style="left: 1598px; top: 600px;">R2 </div>
							<div id="R3" class="cv dp ui-droppable" style="left: 1567px; top: 600px;">R3 </div>
							<div id="R4" class="cv dp ui-droppable" style="left: 1536px; top: 600px;">R4 </div>
							<div id="R5" class="cv dp ui-droppable" style="left: 1505px; top: 600px;">R5 </div>
							<div id="R6" class="cv dp ui-droppable" style="left: 1474px; top: 600px;">R6 </div>
							<div id="R7" class="cv dp ui-droppable" style="left: 1443px; top: 600px;">R7 </div>
							<div id="R8" class="cv dp ui-droppable" style="left: 1412px; top: 600px;">R8 </div>
							<div id="R9" class="cv dp ui-droppable" style="left: 1381px; top: 600px;">R9 </div>
							<div id="R1A" class="cv dp ui-droppable" style="left: 1350px; top: 600px;">R10 </div>
							<div id="R1B" class="cv dp ui-droppable" style="left: 1319px; top: 600px;">R11 </div>
							<div id="R1C" class="cv dp ui-droppable" style="left: 1288px; top: 600px;">R12 </div>
							
							<div id="G1" class="cv dp ui-droppable" style="left: 1629px; top: 831px;">G1 </div>
							<div id="G2" class="cv dp ui-droppable" style="left: 1598px; top: 831px;">G2 </div>
							<div id="G3" class="cv dp ui-droppable" style="left: 1567px; top: 831px;">G3 </div>
							<div id="G4" class="cv dp ui-droppable" style="left: 1536px; top: 831px;">G4 </div>
							<div id="G5" class="cv dp ui-droppable" style="left: 1505px; top: 831px;">G5 </div>
							<div id="G6" class="cv dp ui-droppable" style="left: 1474px; top: 831px;">G6 </div>
							<div id="G7" class="cv dp ui-droppable" style="left: 1443px; top: 831px;">G7 </div>
							<div id="G8" class="cv dp ui-droppable" style="left: 1412px; top: 831px;">G8 </div>
							<div id="G9" class="cv dp ui-droppable" style="left: 1381px; top: 831px;">G9 </div>
							<div id="G1A" class="cv dp ui-droppable" style="left: 1350px; top: 831px;">G10 </div>
							<div id="G1B" class="cv dp ui-droppable" style="left: 1319px; top: 831px;">G11 </div>
							<div id="G1C" class="cv dp ui-droppable" style="left: 1288px; top: 831px;">G12 </div>
							
							<div id="11" class="cv dp ui-droppable" style="left: 1195px; top: 676px;" dp-bottom="12">11 </div>
							<div id="12" class="cv dp ui-droppable" style="left: 1195px; top: 707px;" dp-top="11">12 </div>
							<div id="13" class="cv dp ui-droppable" style="left: 1195px; top: 738px;" dp-bottom="14">13 </div>
							<div id="14" class="cv dp ui-droppable" style="left: 1195px; top: 769px;" dp-top="13">14 </div>
							<div id="15" class="cv dp ui-droppable" style="left: 1195px; top: 800px;" dp-bottom="16">15 </div>
							<div id="16" class="cv dp ui-droppable" style="left: 1195px; top: 831px;" dp-top="15">16 </div>
							<div id="17" class="cv dp ui-droppable" style="left: 1195px; top: 862px;" dp-bottom="18">17 </div>
							<div id="18" class="cv dp ui-droppable" style="left: 1195px; top: 893px;" dp-top="17">18 </div>
							<div id="19" class="cv dp ui-droppable" style="left: 1195px; top: 924px;" dp-bottom="1A">19 </div>
							<div id="1A" class="cv dp ui-droppable" style="left: 1195px; top: 955px;" dp-top="19">1A </div>
							<div id="21" class="cv dp ui-droppable" style="left: 1164px; top: 676px;" dp-bottom="22">21 </div>
							<div id="22" class="cv dp ui-droppable" style="left: 1164px; top: 707px;" dp-top="21">22 </div>
							<div id="23" class="cv dp ui-droppable" style="left: 1164px; top: 738px;" dp-bottom="24">23 </div>
							<div id="24" class="cv dp ui-droppable" style="left: 1164px; top: 769px;" dp-top="23">24 </div>
							<div id="25" class="cv dp ui-droppable" style="left: 1164px; top: 800px;" dp-bottom="26">25 </div>
							<div id="26" class="cv dp ui-droppable" style="left: 1164px; top: 831px;" dp-top="25">26 </div>
							<div id="27" class="cv dp ui-droppable" style="left: 1164px; top: 862px;" dp-bottom="28">27 </div>
							<div id="28" class="cv dp ui-droppable" style="left: 1164px; top: 893px;" dp-top="27">28 </div>
							<div id="29" class="cv dp ui-droppable" style="left: 1164px; top: 924px;" dp-bottom="2A">29 </div>
							<div id="2A" class="cv dp ui-droppable" style="left: 1164px; top: 955px;" dp-top="29">2A </div>							
							<div id="31" class="cv dp ui-droppable" style="left: 1133px; top: 676px;" dp-bottom="32">31 </div>
							<div id="32" class="cv dp ui-droppable" style="left: 1133px; top: 707px;" dp-top="31">32 </div>
							<div id="33" class="cv dp ui-droppable" style="left: 1133px; top: 738px;" dp-bottom="34">33 </div>
							<div id="34" class="cv dp ui-droppable" style="left: 1133px; top: 769px;" dp-top="33">34 </div>
							<div id="35" class="cv dp ui-droppable" style="left: 1133px; top: 800px;" dp-bottom="36">35 </div>
							<div id="36" class="cv dp ui-droppable" style="left: 1133px; top: 831px;" dp-top="35">36 </div>
							<div id="37" class="cv dp ui-droppable" style="left: 1133px; top: 862px;" dp-bottom="38">37 </div>
							<div id="38" class="cv dp ui-droppable" style="left: 1133px; top: 893px;" dp-top="37">38 </div>
							<div id="39" class="cv dp ui-droppable" style="left: 1133px; top: 924px;" dp-bottom="3A">39 </div>
							<div id="3A" class="cv dp ui-droppable" style="left: 1133px; top: 955px;" dp-top="39">3A </div>
							<div id="41" class="cv dp ui-droppable" style="left: 1102px; top: 676px;" dp-bottom="42">41 </div>
							<div id="42" class="cv dp ui-droppable" style="left: 1102px; top: 707px;" dp-top="41">42 </div>
							<div id="43" class="cv dp ui-droppable" style="left: 1102px; top: 738px;" dp-bottom="44">43 </div>
							<div id="44" class="cv dp ui-droppable" style="left: 1102px; top: 769px;" dp-top="45">44 </div>
							<div id="45" class="cv dp ui-droppable" style="left: 1102px; top: 800px;" dp-bottom="46">45 </div>
							<div id="46" class="cv dp ui-droppable" style="left: 1102px; top: 831px;" dp-top="45">46 </div>
							<div id="47" class="cv dp ui-droppable" style="left: 1102px; top: 862px;" dp-bottom="48">47 </div>
							<div id="48" class="cv dp ui-droppable" style="left: 1102px; top: 893px;" dp-top="47">48 </div>
							<div id="49" class="cv dp ui-droppable" style="left: 1102px; top: 924px;" dp-bottom="4A">49 </div>
							<div id="4A" class="cv dp ui-droppable" style="left: 1102px; top: 955px;" dp-top="49">4A </div>
							<div id="51" class="cv dp ui-droppable" style="left: 1071px; top: 676px;" dp-bottom="52">51 </div>
							<div id="52" class="cv dp ui-droppable" style="left: 1071px; top: 707px;" dp-top="51">52 </div>
							<div id="53" class="cv dp ui-droppable" style="left: 1071px; top: 738px;" dp-bottom="53">53 </div>
							<div id="54" class="cv dp ui-droppable" style="left: 1071px; top: 769px;" dp-top="54">54 </div>
							<div id="55" class="cv dp ui-droppable" style="left: 1071px; top: 800px;" dp-bottom="56">55 </div>
							<div id="56" class="cv dp ui-droppable" style="left: 1071px; top: 831px;" dp-top="55">56 </div>
							<div id="57" class="cv dp ui-droppable" style="left: 1071px; top: 862px;" dp-bottom="58">57 </div>
							<div id="58" class="cv dp ui-droppable" style="left: 1071px; top: 893px;" dp-top="57">58 </div>
							<div id="59" class="cv dp ui-droppable" style="left: 1071px; top: 924px;" dp-bottom="5A">59 </div>
							<div id="5A" class="cv dp ui-droppable" style="left: 1071px; top: 955px;" dp-top="59">5A </div>							
							
							<div id="CS1" class="cv dp ui-droppable" style="left: 978px; top: 831px;">CS1 </div>
							<div id="CS2" class="cv dp ui-droppable" style="left: 978px; top: 862px;">CS2 </div>
							<div id="CS3" class="cv dp ui-droppable" style="left: 947px; top: 800px;">CS3 </div>
							<div id="CS4" class="cv dp ui-droppable" style="left: 916px; top: 800px;">CS4 </div>
							<div id="CS5" class="cv dp ui-droppable" style="left: 885px; top: 800px;">CS5 </div>
							<div id="CS6" class="cv dp ui-droppable" style="left: 854px; top: 800px;">CS6 </div>
							<div id="CS7" class="cv dp ui-droppable" style="left: 823px; top: 800px;">CS7 </div>
							<div id="CS8" class="cv dp ui-droppable" style="left: 792px; top: 800px;">CS8 </div>
							<div id="CS9" class="cv dp ui-droppable" style="left: 761px; top: 800px;">CS9 </div>
							<div id="CSA" class="cv dp ui-droppable" style="left: 730px; top: 800px;">CSA </div>
							<div id="CSB" class="cv dp ui-droppable" style="left: 699px; top: 800px;">CSB </div>
							<div id="CSC" class="cv dp ui-droppable" style="left: 668px; top: 800px;">CSC </div>
							
							<div id="MS1" class="cv dp ui-droppable" style="left: 606px; top: 800px;">MS1 </div>
							<div id="MS2" class="cv dp ui-droppable" style="left: 606px; top: 769px;">MS2 </div>
							<div id="MS3" class="cv dp ui-droppable" style="left: 606px; top: 738px;">MS3 </div>							
							<div id="MS4" class="cv dp ui-droppable" style="left: 575px; top: 707px;">MS4 </div>
							<div id="MS5" class="cv dp ui-droppable" style="left: 544px; top: 707px;">MS5 </div>
							<div id="MS6" class="cv dp ui-droppable" style="left: 513px; top: 707px;">MS6 </div>
							<div id="MS7" class="cv dp ui-droppable" style="left: 482px; top: 707px;">MS7 </div>
							<div id="MS8" class="cv dp ui-droppable" style="left: 451px; top: 707px;">MS8 </div>
							<div id="MS9" class="cv dp ui-droppable" style="left: 420px; top: 707px;">MS9 </div>
							<div id="MSA" class="cv dp ui-droppable" style="left: 389px; top: 707px;">MSA </div>
							<div id="MSB" class="cv dp ui-droppable" style="left: 358px; top: 707px;">MSB </div>
							<div id="MSC" class="cv dp ui-droppable" style="left: 327px; top: 707px;">MSC </div>
							<div id="MSD" class="cv dp ui-droppable" style="left: 296px; top: 707px;">MSD </div>
							<div id="MSE" class="cv dp ui-droppable" style="left: 265px; top: 707px;">MSE </div>
							<div id="MSF" class="cv dp ui-droppable" style="left: 234px; top: 707px;">MSF </div>
							<div id="MSG" class="cv dp ui-droppable" style="left: 203px; top: 707px;">MSG </div>
							<div id="MSH" class="cv dp ui-droppable" style="left: 172px; top: 707px;">MSH </div>
							<div id="MSI" class="cv dp ui-droppable" style="left: 141px; top: 707px;">MSI </div>
							
							<div id="RM1" class="cv dp ui-droppable" style="left: 482px; top: 800px;">RM1 </div>
							<div id="RM2" class="cv dp ui-droppable" style="left: 451px; top: 800px;">RM2 </div>
							<div id="RM3" class="cv dp ui-droppable" style="left: 420px; top: 800px;">RM3 </div>
							<div id="RM4" class="cv dp ui-droppable" style="left: 389px; top: 800px;">RM4 </div>
							<div id="RM5" class="cv dp ui-droppable" style="left: 358px; top: 800px;">RM5 </div>
							<div id="RM6" class="cv dp ui-droppable" style="left: 327px; top: 800px;">RM6 </div>
							<div id="RM7" class="cv dp ui-droppable" style="left: 296px; top: 800px;">RM7 </div>
							<div id="RM8" class="cv dp ui-droppable" style="left: 265px; top: 800px;">RM8 </div>
							<div id="RM9" class="cv dp ui-droppable" style="left: 234px; top: 800px;">RM9 </div>
							<div id="RMA" class="cv dp ui-droppable" style="left: 203px; top: 800px;">RMA </div>
							<div id="RMB" class="cv dp ui-droppable" style="left: 172px; top: 800px;">RMB </div>
							<div id="RMC" class="cv dp ui-droppable" style="left: 141px; top: 800px;">RMC </div>
							<div id="RMD" class="cv dp ui-droppable" style="left: 110px; top: 800px;">RMD </div>
							<div id="RME" class="cv dp ui-droppable" style="left: 79px; top: 800px;">RME </div>
							<div id="RMF" class="cv dp ui-droppable" style="left: 48px; top: 800px;">RMF </div>
						

							{if isset($tcards.positioned)}
								{foreach $tcards.positioned as $card}
									<div id="{$card->tc_id}" class="entry cv ui-draggable" van-no="{$card->v_no}" bin-no="{$card->tc_bin}" data-position="{$card->tp_position}" style="background-color: {$card->s_color}; border-color: {$card->tt_color};{if $card->tp_top}top: {$card->tp_top};{/if}{if $card->tp_left}left: {$card->tp_left}{/if}">{$card->display_chars}</div>
								{/foreach}
							{/if}

						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

<!-- Cancel Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        Do you want to save the changes made?
      </div>
      <div class="modal-footer">
        <button id="cancel-yes" type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
        <button id="cancel-no" type="button" class="btn btn-default" data-dismiss="modal">No</button>
        <button id="cancel-cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>


<!-- New Entry Modal -->
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
								<option class="{if $ttype->tt_id == 21}orange-card-selection-type{/if}" value="{$ttype->tt_id}" data-color="{$ttype->tt_color}">{$ttype->tt_name}</option>
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
      					<span class="pull-right tcard-modal-state-notifier">&nbsp;</span>
      				</td>
      			</tr>
      			<tr class="card-field-row absolute-hide">
      				<td class="col-xs-3">
      					<strong>Bin No.</strong>
      					<input name="{$form->bin_no}" class="form-control input-sm" type="text">
  						<span class="help-inline"></span>
      				</td>
      				<td class="col-xs-6">
      					<strong>Van No.</strong>
      					<input name="{$form->van_no}" class="form-control input-sm" type="text">
      					<!-- <select id="van-selection" class="form-control input-sm absolute-hide">
      						{if $vans && !empty($vans)}
      							{foreach $vans as $van}
      								<option value="{$van->v_id}">{$van->v_no}</option>
      							{/foreach}
      						{/if}
      					</select> -->
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
      			<tr class="card-field-row absolute-hide">
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
      					<strong>Batch Codes</strong>
      					<input name="{$form->batch_code}" class="form-control input-sm" type="text">
      					<span class="help-inline"></span>
      				</td>
      				<td class="col-xs-3">
      					<strong>Status</strong>
      					<input name="{$form->status}" class="form-control input-sm" type="text">
  						<span class="help-inline"></span>
      				</td>
      			</tr>
      			<tr class="card-field-row absolute-hide">
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
      			<tr class="card-field-row absolute-hide">
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
      			<tr class="card-field-row absolute-hide">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
  						<div class="row">
      						<div class="col-sm-6">
      							<strong>Date Stuffed</strong>
      							<input name="{$form->date_stuffed}" class="form-control input-sm generic-datepicker" type="text">
  								<span class="help-inline"></span>
      						</div>
      						<div class="col-sm-6">
      							<strong>Controller</strong>
      							<input name="{$form->stuff_controller}" class="form-control input-sm" type="text">
  								<span class="help-inline"></span>
      						</div>
      					</div>
      					<div class="row orange-card-field absolute-hide">
      						<div class="col-sm-6">
      							<strong>Date Stripped</strong>
      							<input name="{$form->date_stripped}" class="form-control input-sm generic-datepicker" type="text">
  								<span class="help-inline"></span>
      						</div>
      						<div class="col-sm-6">
      							<strong>Controller</strong>
      							<input name="{$form->strip_controller}" class="form-control input-sm" type="text">
  								<span class="help-inline"></span>
      						</div>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
      			<tr class="card-field-row absolute-hide">
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
      			<tr class="card-field-row absolute-hide">
      				<td class="col-xs-3"></td>
      				<td class="col-xs-6">
      					<div class="row">
      						<div class="col-sm-6">
      							<strong>Entry Date</strong>
      							<input name="{$form->entry_date}" class="form-control input-sm generic-datepicker" type="text">
  								<span class="help-inline"></span>
      						</div>
      						<div class="col-sm-6 normal-card-field">
      							<strong>Exit Date</strong>
      							<input name="{$form->exit_date}" class="form-control input-sm generic-datepicker" type="text">
  								<span class="help-inline"></span>
      						</div>
	      					<div class="col-sm-6 orange-card-field absolute-hide">
	      						<strong>Date Blocked</strong>
	      						<input name="{$form->date_blocked}" class="form-control input-sm generic-datepicker" type="text">
  								<span class="help-inline"></span>
	      					</div>
      					</div>
      				</td>
      				<td class="col-xs-3"></td>
      			</tr>
      			<tr class="card-field-row absolute-hide">
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
      			<tr class="no-tcard-type">
      				<td colspan="3">
      					<em>Please select a card type.</em>
      				</td>
      			</tr>
      			<tr class="absolute-hide">
      				<td colspan="3">
      					<input name="card-id" type="hidden">
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
{/block}

