{extends file="layouts/"|cat:$layout}
{block name=body}
	<div id="wrap">
		<header>
			<div class="container-fluid">
				<div class="col-xs-4">
					<a id="companyname" class="" href="#" title="Home">
						{$company_name}<span>{$company_address}</span>
					</a>
				</div>
				<button id="new-entry-btn" class="btn btn-oroport pull-left">
					<span class="glyphicon glyphicon-plus"></span> New Entry
				</button>
				<div class="form-group col-xs-3">
					<div class="input-group">
				    	<input type="email" class="form-control" id="" placeholder="Search Entry">
						<span class="input-group-btn">
							<button class="btn btn-oroport" type="button"><span class="glyphicon glyphicon-search"></span></button>
						</span>
					</div>
				</div>
				<a class="btn btn-oroport pull-left"><span class="glyphicon glyphicon-print"></span> Print Report</a>
				<div class="pull-right col-xs-2">
					<div class="btn-group pull-right">
						<a class="btn btn-oroport"><span class="glyphicon glyphicon-cog"></span></a>
						<a class="btn btn-oroport"><span class="glyphicon glyphicon-remove"></span> Logout</a>
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
		    				<span class="badge pull-right">7</span>
		    			</div>
						<div class="panel-body">
							<div class="absolute-hide cv-model" data-class="entry cv" style="display: none; opacity: 0;"></div>

							<div id="AFP10001" class="entry cv" data-status="1" data-type="1" data-position="" style="">AFP</div>
							<div id="AFP10002" class="entry cv" data-status="2" data-type="2" style="">AFP</div>
							<div id="AFP10003" class="entry cv" data-status="3" data-type="3" style="">AFP</div>
							<div id="AFP10004" class="entry cv" data-status="3" data-type="4" style="">AFP</div>
							<div id="AFP10005" class="entry cv" data-status="3" data-type="5" style="">AFP</div>
							<div id="AFP10006" class="entry cv" data-status="3" data-type="6" style="">AFP</div>
							<div id="AFP10007" class="entry cv" data-status="3" data-type="7" style="">AFP</div>

							{if isset($tcards.pending)}
								{foreach $tcards.pending as $card}
									<div id="{$card->tc_id}" class="entry cv" data-position="" style="background-color: {$card->s_color}; border-color: {$card->tt_color};">{$card->display_chars}</div>
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
							<div id="T1" class="cv dp" style="left: 48px; top: 16px;">T1 </div>
							<div id="T2" class="cv dp" style="left: 48px; top: 47px;">T2 </div>
							<div id="T3" class="cv dp" style="left: 48px; top: 78px;">T3 </div>
							<div id="T4" class="cv dp" style="left: 48px; top: 109px;">T4 </div>
							<div id="T5" class="cv dp" style="left: 48px; top: 140px;">T5 </div>
							<div id="T6" class="cv dp" style="left: 48px; top: 171px;">T6 </div>
							<div id="T7" class="cv dp" style="left: 48px; top: 202px;">T7 </div>
							<div id="T8" class="cv dp" style="left: 48px; top: 233px;">T8 </div>
							<div id="T9" class="cv dp" style="left: 48px; top: 264px;">T9 </div>
							<div id="T10" class="cv dp" style="left: 48px; top: 295px;">T10 </div>
							<div id="T11" class="cv dp" style="left: 48px; top: 326px;">T11 </div>
							<div id="T12" class="cv dp" style="left: 48px; top: 357px;">T12 </div>
							<div id="T13" class="cv dp" style="left: 48px; top: 388px;">T13 </div>
							<div id="T14" class="cv dp" style="left: 48px; top: 419px;">T14 </div>
							<div id="T15" class="cv dp" style="left: 48px; top: 450px;">T15 </div>
							<div id="T16" class="cv dp" style="left: 48px; top: 481px;">T16 </div>
							<div id="T17" class="cv dp" style="left: 48px; top: 512px;">T17 </div>
							<div id="T18" class="cv dp" style="left: 48px; top: 543px;">T18 </div>

							<div id="O61" class="cv dp" style="left: 141px; top: 28px;">O61 </div>
							<div id="O62" class="cv dp" style="left: 141px; top: 59px;">O62 </div>
							<div id="O63" class="cv dp" style="left: 172px; top: 28px;">O63 </div>
							<div id="O64" class="cv dp" style="left: 172px; top: 59px;">O64 </div>
							<div id="O65" class="cv dp" style="left: 203px; top: 28px;">O65 </div>
							<div id="O66" class="cv dp" style="left: 203px; top: 59px;">O66 </div>
							<div id="O67" class="cv dp" style="left: 234px; top: 28px;">O67 </div>
							<div id="O68" class="cv dp" style="left: 234px; top: 59px;">O68 </div>
							<div id="O69" class="cv dp" style="left: 265px; top: 28px;">O69 </div>
							<div id="O6A" class="cv dp" style="left: 265px; top: 59px;">O6A </div>
							<div id="O6B" class="cv dp" style="left: 296px; top: 28px;">O6B </div>
							<div id="O6C" class="cv dp" style="left: 296px; top: 59px;">O6C </div>
							<div id="O51" class="cv dp" style="left: 141px; top: 121px;">O51 </div>
							<div id="O52" class="cv dp" style="left: 141px; top: 152px;">O52 </div>
							<div id="O53" class="cv dp" style="left: 172px; top: 121px;">O53 </div>
							<div id="O54" class="cv dp" style="left: 172px; top: 152px;">O54 </div>
							<div id="O55" class="cv dp" style="left: 203px; top: 121px;">O55 </div>
							<div id="O56" class="cv dp" style="left: 203px; top: 152px;">O56 </div>
							<div id="O57" class="cv dp" style="left: 234px; top: 121px;">O57 </div>
							<div id="O58" class="cv dp" style="left: 234px; top: 152px;">O58 </div>
							<div id="O59" class="cv dp" style="left: 265px; top: 121px;">O59 </div>
							<div id="O5A" class="cv dp" style="left: 265px; top: 152px;">O5A </div>
							<div id="O5B" class="cv dp" style="left: 296px; top: 121px;">O5B </div>
							<div id="O5C" class="cv dp" style="left: 296px; top: 152px;">O5C </div>
							<div id="O41" class="cv dp" style="left: 141px; top: 214px;">O41 </div>
							<div id="O42" class="cv dp" style="left: 141px; top: 245px;">O42 </div>
							<div id="O43" class="cv dp" style="left: 172px; top: 214px;">O43 </div>
							<div id="O44" class="cv dp" style="left: 172px; top: 245px;">O44 </div>
							<div id="O45" class="cv dp" style="left: 203px; top: 214px;">O45 </div>
							<div id="O46" class="cv dp" style="left: 203px; top: 245px;">O46 </div>
							<div id="O47" class="cv dp" style="left: 234px; top: 214px;">O47 </div>
							<div id="O48" class="cv dp" style="left: 234px; top: 245px;">O48 </div>
							<div id="O49" class="cv dp" style="left: 265px; top: 214px;">O49 </div>
							<div id="O4A" class="cv dp" style="left: 265px; top: 245px;">O4A </div>
							<div id="O4B" class="cv dp" style="left: 296px; top: 214px;">O4B </div>
							<div id="O4C" class="cv dp" style="left: 296px; top: 245px;">O4C </div>
							<div id="O31" class="cv dp" style="left: 141px; top: 307px;">O31 </div>
							<div id="O32" class="cv dp" style="left: 141px; top: 338px;">O32 </div>
							<div id="O33" class="cv dp" style="left: 172px; top: 307px;">O33 </div>
							<div id="O34" class="cv dp" style="left: 172px; top: 338px;">O34 </div>
							<div id="O35" class="cv dp" style="left: 203px; top: 307px;">O35 </div>
							<div id="O36" class="cv dp" style="left: 203px; top: 338px;">O36 </div>
							<div id="O37" class="cv dp" style="left: 234px; top: 307px;">O37 </div>
							<div id="O38" class="cv dp" style="left: 234px; top: 338px;">O38 </div>
							<div id="O39" class="cv dp" style="left: 265px; top: 307px;">O39 </div>
							<div id="O3A" class="cv dp" style="left: 265px; top: 338px;">O3A </div>
							<div id="O3B" class="cv dp" style="left: 296px; top: 307px;">O3B </div>
							<div id="O3C" class="cv dp" style="left: 296px; top: 338px;">O3C </div>
							<div id="O21" class="cv dp" style="left: 141px; top: 400px;">O21 </div>
							<div id="O22" class="cv dp" style="left: 141px; top: 431px;">O22 </div>
							<div id="O23" class="cv dp" style="left: 172px; top: 400px;">O23 </div>
							<div id="O24" class="cv dp" style="left: 172px; top: 431px;">O24 </div>
							<div id="O25" class="cv dp" style="left: 203px; top: 400px;">O25 </div>
							<div id="O26" class="cv dp" style="left: 203px; top: 431px;">O26 </div>
							<div id="O27" class="cv dp" style="left: 234px; top: 400px;">O27 </div>
							<div id="O28" class="cv dp" style="left: 234px; top: 431px;">O28 </div>
							<div id="O29" class="cv dp" style="left: 265px; top: 400px;">O29 </div>
							<div id="O2A" class="cv dp" style="left: 265px; top: 431px;">O2A </div>
							<div id="O2B" class="cv dp" style="left: 296px; top: 400px;">O2B </div>
							<div id="O2C" class="cv dp" style="left: 296px; top: 431px;">O2C </div>
							<div id="O11" class="cv dp" style="left: 141px; top: 493px;">O11 </div>
							<div id="O12" class="cv dp" style="left: 141px; top: 524px;">O12 </div>
							<div id="O13" class="cv dp" style="left: 172px; top: 493px;">O13 </div>
							<div id="O14" class="cv dp" style="left: 172px; top: 524px;">O14 </div>
							<div id="O15" class="cv dp" style="left: 203px; top: 493px;">O15 </div>
							<div id="O16" class="cv dp" style="left: 203px; top: 524px;">O16 </div>
							<div id="O17" class="cv dp" style="left: 234px; top: 493px;">O17 </div>
							<div id="O18" class="cv dp" style="left: 234px; top: 524px;">O18 </div>
							<div id="O19" class="cv dp" style="left: 265px; top: 493px;">O19 </div>
							<div id="O1A" class="cv dp" style="left: 265px; top: 524px;">O1A </div>
							<div id="O1B" class="cv dp" style="left: 296px; top: 493px;">O1B </div>
							<div id="O1C" class="cv dp" style="left: 296px; top: 524px;">O1C </div>
							<div id="A61" class="cv dp" style="left: 389px; top: 28px;">A61 </div>
							<div id="A62" class="cv dp" style="left: 389px; top: 59px;">A62 </div>
							<div id="A63" class="cv dp" style="left: 420px; top: 28px;">A63 </div>
							<div id="A64" class="cv dp" style="left: 420px; top: 59px;">A64 </div>
							<div id="A65" class="cv dp" style="left: 451px; top: 28px;">A65 </div>
							<div id="A66" class="cv dp" style="left: 451px; top: 59px;">A66 </div>
							<div id="A67" class="cv dp" style="left: 482px; top: 28px;">A67 </div>
							<div id="A68" class="cv dp" style="left: 482px; top: 59px;">A68 </div>
							<div id="A69" class="cv dp" style="left: 513px; top: 28px;">A69 </div>
							<div id="A6A" class="cv dp" style="left: 513px; top: 59px;">A6A </div>
							<div id="A6B" class="cv dp" style="left: 544px; top: 28px;">A6B </div>
							<div id="A6C" class="cv dp" style="left: 544px; top: 59px;">A6C </div>
							<div id="A51" class="cv dp" style="left: 389px; top: 121px;">A51 </div>
							<div id="A52" class="cv dp" style="left: 389px; top: 152px;">A52 </div>
							<div id="A53" class="cv dp" style="left: 420px; top: 121px;">A53 </div>
							<div id="A54" class="cv dp" style="left: 420px; top: 152px;">A54 </div>
							<div id="A55" class="cv dp" style="left: 451px; top: 121px;">A55 </div>
							<div id="A56" class="cv dp" style="left: 451px; top: 152px;">A56 </div>
							<div id="A57" class="cv dp" style="left: 482px; top: 121px;">A57 </div>
							<div id="A58" class="cv dp" style="left: 482px; top: 152px;">A58 </div>
							<div id="A59" class="cv dp" style="left: 513px; top: 121px;">A59 </div>
							<div id="A5A" class="cv dp" style="left: 513px; top: 152px;">A5A </div>
							<div id="A5B" class="cv dp" style="left: 544px; top: 121px;">A5B </div>
							<div id="A5C" class="cv dp" style="left: 544px; top: 152px;">A5C </div>
							<div id="A41" class="cv dp" style="left: 389px; top: 214px;">A41 </div>
							<div id="A42" class="cv dp" style="left: 389px; top: 245px;">A42 </div>
							<div id="A43" class="cv dp" style="left: 420px; top: 214px;">A43 </div>
							<div id="A44" class="cv dp" style="left: 420px; top: 245px;">A44 </div>
							<div id="A45" class="cv dp" style="left: 451px; top: 214px;">A45 </div>
							<div id="A46" class="cv dp" style="left: 451px; top: 245px;">A46 </div>
							<div id="A47" class="cv dp" style="left: 482px; top: 214px;">A47 </div>
							<div id="A48" class="cv dp" style="left: 482px; top: 245px;">A48 </div>
							<div id="A49" class="cv dp" style="left: 513px; top: 214px;">A49 </div>
							<div id="A4A" class="cv dp" style="left: 513px; top: 245px;">A4A </div>
							<div id="A4B" class="cv dp" style="left: 544px; top: 214px;">A4B </div>
							<div id="A4C" class="cv dp" style="left: 544px; top: 245px;">A4C </div>
							<div id="A31" class="cv dp" style="left: 389px; top: 307px;">A31 </div>
							<div id="A32" class="cv dp" style="left: 389px; top: 338px;">A32 </div>
							<div id="A33" class="cv dp" style="left: 420px; top: 307px;">A33 </div>
							<div id="A34" class="cv dp" style="left: 420px; top: 338px;">A34 </div>
							<div id="A35" class="cv dp" style="left: 451px; top: 307px;">A35 </div>
							<div id="A36" class="cv dp" style="left: 451px; top: 338px;">A36 </div>
							<div id="A37" class="cv dp" style="left: 482px; top: 307px;">A37 </div>
							<div id="A38" class="cv dp" style="left: 482px; top: 338px;">A38 </div>
							<div id="A39" class="cv dp" style="left: 513px; top: 307px;">A39 </div>
							<div id="A3A" class="cv dp" style="left: 513px; top: 338px;">A3A </div>
							<div id="A3B" class="cv dp" style="left: 544px; top: 307px;">A3B </div>
							<div id="A3C" class="cv dp" style="left: 544px; top: 338px;">A3C </div>
							<div id="A21" class="cv dp" style="left: 389px; top: 400px;">A21 </div>
							<div id="A22" class="cv dp" style="left: 389px; top: 431px;">A22 </div>
							<div id="A23" class="cv dp" style="left: 420px; top: 400px;">A23 </div>
							<div id="A24" class="cv dp" style="left: 420px; top: 431px;">A24 </div>
							<div id="A25" class="cv dp" style="left: 451px; top: 400px;">A25 </div>
							<div id="A26" class="cv dp" style="left: 451px; top: 431px;">A26 </div>
							<div id="A27" class="cv dp" style="left: 482px; top: 400px;">A27 </div>
							<div id="A28" class="cv dp" style="left: 482px; top: 431px;">A28 </div>
							<div id="A29" class="cv dp" style="left: 513px; top: 400px;">A29 </div>
							<div id="A2A" class="cv dp" style="left: 513px; top: 431px;">A2A </div>
							<div id="A2B" class="cv dp" style="left: 544px; top: 400px;">A2B </div>
							<div id="A2C" class="cv dp" style="left: 544px; top: 431px;">A2C </div>
							<div id="A11" class="cv dp" style="left: 389px; top: 493px;">A11 </div>
							<div id="A12" class="cv dp" style="left: 389px; top: 524px;">A12 </div>
							<div id="A13" class="cv dp" style="left: 420px; top: 493px;">A13 </div>
							<div id="A14" class="cv dp" style="left: 420px; top: 524px;">A14 </div>
							<div id="A15" class="cv dp" style="left: 451px; top: 493px;">A15 </div>
							<div id="A16" class="cv dp" style="left: 451px; top: 524px;">A16 </div>
							<div id="A17" class="cv dp" style="left: 482px; top: 493px;">A17 </div>
							<div id="A18" class="cv dp" style="left: 482px; top: 524px;">A18 </div>
							<div id="A19" class="cv dp" style="left: 513px; top: 493px;">A19 </div>
							<div id="A1A" class="cv dp" style="left: 513px; top: 524px;">A1A </div>
							<div id="A1B" class="cv dp" style="left: 544px; top: 493px;">A1B </div>
							<div id="A1C" class="cv dp" style="left: 544px; top: 524px;">A1C </div>
							<div id="B61" class="cv dp" style="left: 637px; top: 28px;">B61 </div>
							<div id="B62" class="cv dp" style="left: 637px; top: 59px;">B62 </div>
							<div id="B63" class="cv dp" style="left: 668px; top: 28px;">B63 </div>
							<div id="B64" class="cv dp" style="left: 668px; top: 59px;">B64 </div>
							<div id="B65" class="cv dp" style="left: 699px; top: 28px;">B65 </div>
							<div id="B66" class="cv dp" style="left: 699px; top: 59px;">B66 </div>
							<div id="B67" class="cv dp" style="left: 730px; top: 28px;">B67 </div>
							<div id="B68" class="cv dp" style="left: 730px; top: 59px;">B68 </div>
							<div id="B69" class="cv dp" style="left: 761px; top: 28px;">B69 </div>
							<div id="B6A" class="cv dp" style="left: 761px; top: 59px;">B6A </div>
							<div id="B6B" class="cv dp" style="left: 792px; top: 28px;">B6B </div>
							<div id="B6C" class="cv dp" style="left: 792px; top: 59px;">B6C </div>
							<div id="B51" class="cv dp" style="left: 637px; top: 121px;">B51 </div>
							<div id="B52" class="cv dp" style="left: 637px; top: 152px;">B52 </div>
							<div id="B53" class="cv dp" style="left: 668px; top: 121px;">B53 </div>
							<div id="B54" class="cv dp" style="left: 668px; top: 152px;">B54 </div>
							<div id="B55" class="cv dp" style="left: 699px; top: 121px;">B55 </div>
							<div id="B56" class="cv dp" style="left: 699px; top: 152px;">B56 </div>
							<div id="B57" class="cv dp" style="left: 730px; top: 121px;">B57 </div>
							<div id="B58" class="cv dp" style="left: 730px; top: 152px;">B58 </div>
							<div id="B59" class="cv dp" style="left: 761px; top: 121px;">B59 </div>
							<div id="B5A" class="cv dp" style="left: 761px; top: 152px;">B5A </div>
							<div id="B5B" class="cv dp" style="left: 792px; top: 121px;">B5B </div>
							<div id="B5C" class="cv dp" style="left: 792px; top: 152px;">B5C </div>
							<div id="B41" class="cv dp" style="left: 637px; top: 214px;">B41 </div>
							<div id="B42" class="cv dp" style="left: 637px; top: 245px;">B42 </div>
							<div id="B43" class="cv dp" style="left: 668px; top: 214px;">B43 </div>
							<div id="B44" class="cv dp" style="left: 668px; top: 245px;">B44 </div>
							<div id="B45" class="cv dp" style="left: 699px; top: 214px;">B45 </div>
							<div id="B46" class="cv dp" style="left: 699px; top: 245px;">B46 </div>
							<div id="B47" class="cv dp" style="left: 730px; top: 214px;">B47 </div>
							<div id="B48" class="cv dp" style="left: 730px; top: 245px;">B48 </div>
							<div id="B49" class="cv dp" style="left: 761px; top: 214px;">B49 </div>
							<div id="B4A" class="cv dp" style="left: 761px; top: 245px;">B4A </div>
							<div id="B4B" class="cv dp" style="left: 792px; top: 214px;">B4B </div>
							<div id="B4C" class="cv dp" style="left: 792px; top: 245px;">B4C </div>
							<div id="B31" class="cv dp" style="left: 637px; top: 307px;">B31 </div>
							<div id="B32" class="cv dp" style="left: 637px; top: 338px;">B32 </div>
							<div id="B33" class="cv dp" style="left: 668px; top: 307px;">B33 </div>
							<div id="B34" class="cv dp" style="left: 668px; top: 338px;">B34 </div>
							<div id="B35" class="cv dp" style="left: 699px; top: 307px;">B35 </div>
							<div id="B36" class="cv dp" style="left: 699px; top: 338px;">B36 </div>
							<div id="B37" class="cv dp" style="left: 730px; top: 307px;">B37 </div>
							<div id="B38" class="cv dp" style="left: 730px; top: 338px;">B38 </div>
							<div id="B39" class="cv dp" style="left: 761px; top: 307px;">B39 </div>
							<div id="B3A" class="cv dp" style="left: 761px; top: 338px;">B3A </div>
							<div id="B3B" class="cv dp" style="left: 792px; top: 307px;">B3B </div>
							<div id="B3C" class="cv dp" style="left: 792px; top: 338px;">B3C </div>
							<div id="B21" class="cv dp" style="left: 637px; top: 400px;">B21 </div>
							<div id="B22" class="cv dp" style="left: 637px; top: 431px;">B22 </div>
							<div id="B23" class="cv dp" style="left: 668px; top: 400px;">B23 </div>
							<div id="B24" class="cv dp" style="left: 668px; top: 431px;">B24 </div>
							<div id="B25" class="cv dp" style="left: 699px; top: 400px;">B25 </div>
							<div id="B26" class="cv dp" style="left: 699px; top: 431px;">B26 </div>
							<div id="B27" class="cv dp" style="left: 730px; top: 400px;">B27 </div>
							<div id="B28" class="cv dp" style="left: 730px; top: 431px;">B28 </div>
							<div id="B29" class="cv dp" style="left: 761px; top: 400px;">B29 </div>
							<div id="B2A" class="cv dp" style="left: 761px; top: 431px;">B2A </div>
							<div id="B2B" class="cv dp" style="left: 792px; top: 400px;">B2B </div>
							<div id="B2C" class="cv dp" style="left: 792px; top: 431px;">B2C </div>
							<div id="B11" class="cv dp" style="left: 637px; top: 493px;">B11 </div>
							<div id="B12" class="cv dp" style="left: 637px; top: 524px;">B12 </div>
							<div id="B13" class="cv dp" style="left: 668px; top: 493px;">B13 </div>
							<div id="B14" class="cv dp" style="left: 668px; top: 524px;">B14 </div>
							<div id="B15" class="cv dp" style="left: 699px; top: 493px;">B15 </div>
							<div id="B16" class="cv dp" style="left: 699px; top: 524px;">B16 </div>
							<div id="B17" class="cv dp" style="left: 730px; top: 493px;">B17 </div>
							<div id="B18" class="cv dp" style="left: 730px; top: 524px;">B18 </div>
							<div id="B19" class="cv dp" style="left: 761px; top: 493px;">B19 </div>
							<div id="B1A" class="cv dp" style="left: 761px; top: 524px;">B1A </div>
							<div id="B1B" class="cv dp" style="left: 792px; top: 493px;">B1B </div>
							<div id="B1C" class="cv dp" style="left: 792px; top: 524px;">B1C </div>
							<div id="C61" class="cv dp" style="left: 885px; top: 28px;">C61 </div>
							<div id="C62" class="cv dp" style="left: 885px; top: 59px;">C62 </div>
							<div id="C63" class="cv dp" style="left: 916px; top: 28px;">C63 </div>
							<div id="C64" class="cv dp" style="left: 916px; top: 59px;">C64 </div>
							<div id="C65" class="cv dp" style="left: 947px; top: 28px;">C65 </div>
							<div id="C66" class="cv dp" style="left: 947px; top: 59px;">C66 </div>
							<div id="C67" class="cv dp" style="left: 978px; top: 28px;">C67 </div>
							<div id="C68" class="cv dp" style="left: 978px; top: 59px;">C68 </div>
							<div id="C69" class="cv dp" style="left: 1009px; top: 28px;">C69 </div>
							<div id="C6A" class="cv dp" style="left: 1009px; top: 59px;">C6A </div>
							<div id="C6B" class="cv dp" style="left: 1040px; top: 28px;">C6B </div>
							<div id="C6C" class="cv dp" style="left: 1040px; top: 59px;">C6C </div>
							<div id="C51" class="cv dp" style="left: 885px; top: 121px;">C51 </div>
							<div id="C52" class="cv dp" style="left: 885px; top: 152px;">C52 </div>
							<div id="C53" class="cv dp" style="left: 916px; top: 121px;">C53 </div>
							<div id="C54" class="cv dp" style="left: 916px; top: 152px;">C54 </div>
							<div id="C55" class="cv dp" style="left: 947px; top: 121px;">C55 </div>
							<div id="C56" class="cv dp" style="left: 947px; top: 152px;">C56 </div>
							<div id="C57" class="cv dp" style="left: 978px; top: 121px;">C57 </div>
							<div id="C58" class="cv dp" style="left: 978px; top: 152px;">C58 </div>
							<div id="C59" class="cv dp" style="left: 1009px; top: 121px;">C59 </div>
							<div id="C5A" class="cv dp" style="left: 1009px; top: 152px;">C5A </div>
							<div id="C5B" class="cv dp" style="left: 1040px; top: 121px;">C5B </div>
							<div id="C5C" class="cv dp" style="left: 1040px; top: 152px;">C5C </div>
							<div id="C41" class="cv dp" style="left: 885px; top: 214px;">C41 </div>
							<div id="C42" class="cv dp" style="left: 885px; top: 245px;">C42 </div>
							<div id="C43" class="cv dp" style="left: 916px; top: 214px;">C43 </div>
							<div id="C44" class="cv dp" style="left: 916px; top: 245px;">C44 </div>
							<div id="C45" class="cv dp" style="left: 947px; top: 214px;">C45 </div>
							<div id="C46" class="cv dp" style="left: 947px; top: 245px;">C46 </div>
							<div id="C47" class="cv dp" style="left: 978px; top: 214px;">C47 </div>
							<div id="C48" class="cv dp" style="left: 978px; top: 245px;">C48 </div>
							<div id="C49" class="cv dp" style="left: 1009px; top: 214px;">C49 </div>
							<div id="C4A" class="cv dp" style="left: 1009px; top: 245px;">C4A </div>
							<div id="C4B" class="cv dp" style="left: 1040px; top: 214px;">C4B </div>
							<div id="C4C" class="cv dp" style="left: 1040px; top: 245px;">C4C </div>
							<div id="C31" class="cv dp" style="left: 885px; top: 307px;">C31 </div>
							<div id="C32" class="cv dp" style="left: 885px; top: 338px;">C32 </div>
							<div id="C33" class="cv dp" style="left: 916px; top: 307px;">C33 </div>
							<div id="C34" class="cv dp" style="left: 916px; top: 338px;">C34 </div>
							<div id="C35" class="cv dp" style="left: 947px; top: 307px;">C35 </div>
							<div id="C36" class="cv dp" style="left: 947px; top: 338px;">C36 </div>
							<div id="C37" class="cv dp" style="left: 978px; top: 307px;">C37 </div>
							<div id="C38" class="cv dp" style="left: 978px; top: 338px;">C38 </div>
							<div id="C39" class="cv dp" style="left: 1009px; top: 307px;">C39 </div>
							<div id="C3A" class="cv dp" style="left: 1009px; top: 338px;">C3A </div>
							<div id="C3B" class="cv dp" style="left: 1040px; top: 307px;">C3B </div>
							<div id="C3C" class="cv dp" style="left: 1040px; top: 338px;">C3C </div>
							<div id="C21" class="cv dp" style="left: 885px; top: 400px;">C21 </div>
							<div id="C22" class="cv dp" style="left: 885px; top: 431px;">C22 </div>
							<div id="C23" class="cv dp" style="left: 916px; top: 400px;">C23 </div>
							<div id="C24" class="cv dp" style="left: 916px; top: 431px;">C24 </div>
							<div id="C25" class="cv dp" style="left: 947px; top: 400px;">C25 </div>
							<div id="C26" class="cv dp" style="left: 947px; top: 431px;">C26 </div>
							<div id="C27" class="cv dp" style="left: 978px; top: 400px;">C27 </div>
							<div id="C28" class="cv dp" style="left: 978px; top: 431px;">C28 </div>
							<div id="C29" class="cv dp" style="left: 1009px; top: 400px;">C29 </div>
							<div id="C2A" class="cv dp" style="left: 1009px; top: 431px;">C2A </div>
							<div id="C2B" class="cv dp" style="left: 1040px; top: 400px;">C2B </div>
							<div id="C2C" class="cv dp" style="left: 1040px; top: 431px;">C2C </div>
							<div id="C11" class="cv dp" style="left: 885px; top: 493px;">C11 </div>
							<div id="C12" class="cv dp" style="left: 885px; top: 524px;">C12 </div>
							<div id="C13" class="cv dp" style="left: 916px; top: 493px;">C13 </div>
							<div id="C14" class="cv dp" style="left: 916px; top: 524px;">C14 </div>
							<div id="C15" class="cv dp" style="left: 947px; top: 493px;">C15 </div>
							<div id="C16" class="cv dp" style="left: 947px; top: 524px;">C16 </div>
							<div id="C17" class="cv dp" style="left: 978px; top: 493px;">C17 </div>
							<div id="C18" class="cv dp" style="left: 978px; top: 524px;">C18 </div>
							<div id="C19" class="cv dp" style="left: 1009px; top: 493px;">C19 </div>
							<div id="C1A" class="cv dp" style="left: 1009px; top: 524px;">C1A </div>
							<div id="C1B" class="cv dp" style="left: 1040px; top: 493px;">C1B </div>
							<div id="C1C" class="cv dp" style="left: 1040px; top: 524px;">C1C </div>
							<div id="D61" class="cv dp" style="left: 1133px; top: 28px;">D61 </div>
							<div id="D62" class="cv dp" style="left: 1133px; top: 59px;">D62 </div>
							<div id="D63" class="cv dp" style="left: 1164px; top: 28px;">D63 </div>
							<div id="D64" class="cv dp" style="left: 1164px; top: 59px;">D64 </div>
							<div id="D65" class="cv dp" style="left: 1195px; top: 28px;">D65 </div>
							<div id="D66" class="cv dp" style="left: 1195px; top: 59px;">D66 </div>
							<div id="D67" class="cv dp" style="left: 1226px; top: 28px;">D67 </div>
							<div id="D68" class="cv dp" style="left: 1226px; top: 59px;">D68 </div>
							<div id="D69" class="cv dp" style="left: 1257px; top: 28px;">D69 </div>
							<div id="D6A" class="cv dp" style="left: 1257px; top: 59px;">D6A </div>
							<div id="D6B" class="cv dp" style="left: 1288px; top: 28px;">D6B </div>
							<div id="D6C" class="cv dp" style="left: 1288px; top: 59px;">D6C </div>
							<div id="D51" class="cv dp" style="left: 1133px; top: 121px;" >D51 </div>
							<div id="D52" class="cv dp" style="left: 1133px; top: 152px;" >D52 </div>
							<div id="D53" class="cv dp" style="left: 1164px; top: 121px;" >D53 </div>
							<div id="D54" class="cv dp" style="left: 1164px; top: 152px;" >D54 </div>
							<div id="D55" class="cv dp" style="left: 1195px; top: 121px;" >D55 </div>
							<div id="D56" class="cv dp" style="left: 1195px; top: 152px;" >D56 </div>
							<div id="D57" class="cv dp" style="left: 1226px; top: 121px;" >D57 </div>
							<div id="D58" class="cv dp" style="left: 1226px; top: 152px;" >D58 </div>
							<div id="D59" class="cv dp" style="left: 1257px; top: 121px;" >D59 </div>
							<div id="D5A" class="cv dp" style="left: 1257px; top: 152px;" >D5A </div>
							<div id="D5B" class="cv dp" style="left: 1288px; top: 121px;" >D5B </div>
							<div id="D5C" class="cv dp" style="left: 1288px; top: 152px;" >D5C </div>
							<div id="D41" class="cv dp" style="left: 1133px; top: 214px;" >D41 </div>
							<div id="D42" class="cv dp" style="left: 1133px; top: 245px;" >D42 </div>
							<div id="D43" class="cv dp" style="left: 1164px; top: 214px;" >D43 </div>
							<div id="D44" class="cv dp" style="left: 1164px; top: 245px;" >D44 </div>
							<div id="D45" class="cv dp" style="left: 1195px; top: 214px;" >D45 </div>
							<div id="D46" class="cv dp" style="left: 1195px; top: 245px;" >D46 </div>
							<div id="D47" class="cv dp" style="left: 1226px; top: 214px;" >D47 </div>
							<div id="D48" class="cv dp" style="left: 1226px; top: 245px;" >D48 </div>
							<div id="D49" class="cv dp" style="left: 1257px; top: 214px;" >D49 </div>
							<div id="D4A" class="cv dp" style="left: 1257px; top: 245px;" >D4A </div>
							<div id="D4B" class="cv dp" style="left: 1288px; top: 214px;" >D4B </div>
							<div id="D4C" class="cv dp" style="left: 1288px; top: 245px;" >D4C </div>
							<div id="D31" class="cv dp" style="left: 1133px; top: 307px;" >D31 </div>
							<div id="D32" class="cv dp" style="left: 1133px; top: 338px;" >D32 </div>
							<div id="D33" class="cv dp" style="left: 1164px; top: 307px;" >D33 </div>
							<div id="D34" class="cv dp" style="left: 1164px; top: 338px;" >D34 </div>
							<div id="D35" class="cv dp" style="left: 1195px; top: 307px;" >D35 </div>
							<div id="D36" class="cv dp" style="left: 1195px; top: 338px;" >D36 </div>
							<div id="D37" class="cv dp" style="left: 1226px; top: 307px;" >D37 </div>
							<div id="D38" class="cv dp" style="left: 1226px; top: 338px;" >D38 </div>
							<div id="D39" class="cv dp" style="left: 1257px; top: 307px;" >D39 </div>
							<div id="D3A" class="cv dp" style="left: 1257px; top: 338px;" >D3A </div>
							<div id="D3B" class="cv dp" style="left: 1288px; top: 307px;" >D3B </div>
							<div id="D3C" class="cv dp" style="left: 1288px; top: 338px;" >D3C </div>
							<div id="D21" class="cv dp" style="left: 1133px; top: 400px;" >D21 </div>
							<div id="D22" class="cv dp" style="left: 1133px; top: 431px;" >D22 </div>
							<div id="D23" class="cv dp" style="left: 1164px; top: 400px;" >D23 </div>
							<div id="D24" class="cv dp" style="left: 1164px; top: 431px;" >D24 </div>
							<div id="D25" class="cv dp" style="left: 1195px; top: 400px;" >D25 </div>
							<div id="D26" class="cv dp" style="left: 1195px; top: 431px;" >D26 </div>
							<div id="D27" class="cv dp" style="left: 1226px; top: 400px;" >D27 </div>
							<div id="D28" class="cv dp" style="left: 1226px; top: 431px;" >D28 </div>
							<div id="D29" class="cv dp" style="left: 1257px; top: 400px;" >D29 </div>
							<div id="D2A" class="cv dp" style="left: 1257px; top: 431px;" >D2A </div>
							<div id="D2B" class="cv dp" style="left: 1288px; top: 400px;" >D2B </div>
							<div id="D2C" class="cv dp" style="left: 1288px; top: 431px;" >D2C </div>
							<div id="D11" class="cv dp" style="left: 1133px; top: 493px;" >D11 </div>
							<div id="D12" class="cv dp" style="left: 1133px; top: 524px;" >D12 </div>
							<div id="D13" class="cv dp" style="left: 1164px; top: 493px;" >D13 </div>
							<div id="D14" class="cv dp" style="left: 1164px; top: 524px;" >D14 </div>
							<div id="D15" class="cv dp" style="left: 1195px; top: 493px;" >D15 </div>
							<div id="D16" class="cv dp" style="left: 1195px; top: 524px;" >D16 </div>
							<div id="D17" class="cv dp" style="left: 1226px; top: 493px;" >D17 </div>
							<div id="D18" class="cv dp" style="left: 1226px; top: 524px;" >D18 </div>
							<div id="D19" class="cv dp" style="left: 1257px; top: 493px;" >D19 </div>
							<div id="D1A" class="cv dp" style="left: 1257px; top: 524px;" >D1A </div>
							<div id="D1B" class="cv dp" style="left: 1288px; top: 493px;" >D1B </div>
							<div id="D1C" class="cv dp" style="left: 1288px; top: 524px;" >D1C </div>

							<div id="c61" class="cv dp" style="left: 1381px; top: 28px;">c61 </div>
							<div id="c62" class="cv dp" style="left: 1381px; top: 59px;">c62 </div>
							<div id="c63" class="cv dp" style="left: 1412px; top: 28px;">c63 </div>
							<div id="c64" class="cv dp" style="left: 1412px; top: 59px;">c64 </div>

							<div id="c51" class="cv dp" style="left: 1381px; top: 121px;" >c51 </div>
							<div id="c52" class="cv dp" style="left: 1381px; top: 152px;" >c52 </div>
							<div id="c53" class="cv dp" style="left: 1412px; top: 121px;" >c53 </div>
							<div id="c54" class="cv dp" style="left: 1412px; top: 152px;" >c54 </div>
							<div id="c55" class="cv dp" style="left: 1442px;top: 121px;" >c55 </div>
							<div id="c56" class="cv dp" style="left: 1442px;top: 152px;" >c56 </div>
							<div id="c57" class="cv dp" style="left: 1474px; top: 121px;" >c57 </div>
							<div id="c58" class="cv dp" style="left: 1474px; top: 152px;" >c58 </div>
							<div id="c59" class="cv dp" style="left: 1505px; top: 121px;" >c59 </div>
							<div id="c5A" class="cv dp" style="left: 1505px; top: 152px;" >c5A </div>
							<div id="c5B" class="cv dp" style="left: 1536px; top: 121px;" >c5B </div>
							<div id="c5C" class="cv dp" style="left: 1536px; top: 152px;" >c5C </div>
							<div id="c41" class="cv dp" style="left: 1381px; top: 214px;" >c41 </div>
							<div id="c42" class="cv dp" style="left: 1381px; top: 245px;" >c42 </div>
							<div id="c43" class="cv dp" style="left: 1412px; top: 214px;" >c43 </div>
							<div id="c44" class="cv dp" style="left: 1412px; top: 245px;" >c44 </div>
							<div id="c45" class="cv dp" style="left: 1442px;top: 214px;" >c45 </div>
							<div id="c46" class="cv dp" style="left: 1442px;top: 245px;" >c46 </div>
							<div id="c47" class="cv dp" style="left: 1474px; top: 214px;" >c47 </div>
							<div id="c48" class="cv dp" style="left: 1474px; top: 245px;" >c48 </div>
							<div id="c49" class="cv dp" style="left: 1505px; top: 214px;" >c49 </div>
							<div id="c4A" class="cv dp" style="left: 1505px; top: 245px;" >c4A </div>
							<div id="c4B" class="cv dp" style="left: 1536px; top: 214px;" >c4B </div>
							<div id="c4C" class="cv dp" style="left: 1536px; top: 245px;" >c4C </div>
							<div id="c31" class="cv dp" style="left: 1381px; top: 307px;" >c31 </div>
							<div id="c32" class="cv dp" style="left: 1381px; top: 338px;" >c32 </div>
							<div id="c33" class="cv dp" style="left: 1412px; top: 307px;" >c33 </div>
							<div id="c34" class="cv dp" style="left: 1412px; top: 338px;" >c34 </div>
							<div id="c35" class="cv dp" style="left: 1442px;top: 307px;" >c35 </div>
							<div id="c36" class="cv dp" style="left: 1442px;top: 338px;" >c36 </div>
							<div id="c37" class="cv dp" style="left: 1474px; top: 307px;" >c37 </div>
							<div id="c38" class="cv dp" style="left: 1474px; top: 338px;" >c38 </div>
							<div id="c39" class="cv dp" style="left: 1505px; top: 307px;" >c39 </div>
							<div id="c3A" class="cv dp" style="left: 1505px; top: 338px;" >c3A </div>
							<div id="c3B" class="cv dp" style="left: 1536px; top: 307px;" >c3B </div>
							<div id="c3C" class="cv dp" style="left: 1536px; top: 338px;" >c3C </div>
							<div id="c21" class="cv dp" style="left: 1381px; top: 400px;" >c21 </div>
							<div id="c22" class="cv dp" style="left: 1381px; top: 431px;" >c22 </div>
							<div id="c23" class="cv dp" style="left: 1412px; top: 400px;" >c23 </div>
							<div id="c24" class="cv dp" style="left: 1412px; top: 431px;" >c24 </div>
							<div id="c25" class="cv dp" style="left: 1442px;top: 400px;" >c25 </div>
							<div id="c26" class="cv dp" style="left: 1442px;top: 431px;" >c26 </div>
							<div id="c27" class="cv dp" style="left: 1474px; top: 400px;" >c27 </div>
							<div id="c28" class="cv dp" style="left: 1474px; top: 431px;" >c28 </div>
							<div id="c29" class="cv dp" style="left: 1505px; top: 400px;" >c29 </div>
							<div id="c2A" class="cv dp" style="left: 1505px; top: 431px;" >c2A </div>
							<div id="c2B" class="cv dp" style="left: 1536px; top: 400px;" >c2B </div>
							<div id="c2C" class="cv dp" style="left: 1536px; top: 431px;" >c2C </div>
							<div id="c11" class="cv dp" style="left: 1381px; top: 493px;" >c11 </div>
							<div id="c12" class="cv dp" style="left: 1381px; top: 524px;" >c12 </div>
							<div id="c13" class="cv dp" style="left: 1412px; top: 493px;" >c13 </div>
							<div id="c14" class="cv dp" style="left: 1412px; top: 524px;" >c14 </div>
							<div id="c15" class="cv dp" style="left: 1442px;top: 493px;" >c15 </div>
							<div id="c16" class="cv dp" style="left: 1442px;top: 524px;" >c16 </div>
							<div id="c17" class="cv dp" style="left: 1474px; top: 493px;" >c17 </div>
							<div id="c18" class="cv dp" style="left: 1474px; top: 524px;" >c18 </div>
							<div id="c19" class="cv dp" style="left: 1505px; top: 493px;" >c19 </div>
							<div id="c1A" class="cv dp" style="left: 1505px; top: 524px;" >c1A </div>
							<div id="c1B" class="cv dp" style="left: 1536px; top: 493px;" >c1B </div>
							<div id="c1C" class="cv dp" style="left: 1536px; top: 524px;" >c1C </div>
							
							<div id="CE1" class="cv dp" style="left: 1629px; top: 524px;" >CE1 </div>
							<div id="CE2" class="cv dp" style="left: 1629px; top: 493px;" >CE2 </div>
							<div id="CE3" class="cv dp" style="left: 1629px; top: 462px;" >CE3 </div>
							<div id="CE4" class="cv dp" style="left: 1629px; top: 431px;" >CE4 </div>
							<div id="CE5" class="cv dp" style="left: 1629px; top: 400px;" >CE5 </div>
							<div id="CE6" class="cv dp" style="left: 1629px; top: 369px;" >CE6 </div>
							
							<hr class="cy-hr">
							
							<div id="R1" class="cv dp" style="left: 1629px; top: 600px;" >R1 </div>
							<div id="R2" class="cv dp" style="left: 1598px; top: 600px;" >R2 </div>
							<div id="R3" class="cv dp" style="left: 1567px; top: 600px;" >R3 </div>
							<div id="R4" class="cv dp" style="left: 1536px; top: 600px;" >R4 </div>
							<div id="R5" class="cv dp" style="left: 1505px; top: 600px;" >R5 </div>
							<div id="R6" class="cv dp" style="left: 1474px; top: 600px;" >R6 </div>
							<div id="R7" class="cv dp" style="left: 1443px; top: 600px;" >R7 </div>
							<div id="R8" class="cv dp" style="left: 1412px; top: 600px;" >R8 </div>
							<div id="R9" class="cv dp" style="left: 1381px; top: 600px;" >R9 </div>
							<div id="R1A" class="cv dp" style="left: 1350px; top: 600px;" >R10 </div>
							<div id="R1B" class="cv dp" style="left: 1319px; top: 600px;" >R11 </div>
							<div id="R1C" class="cv dp" style="left: 1288px; top: 600px;" >R12 </div>
							
							<div id="G1" class="cv dp" style="left: 1629px; top: 831px;" >G1 </div>
							<div id="G2" class="cv dp" style="left: 1598px; top: 831px;" >G2 </div>
							<div id="G3" class="cv dp" style="left: 1567px; top: 831px;" >G3 </div>
							<div id="G4" class="cv dp" style="left: 1536px; top: 831px;" >G4 </div>
							<div id="G5" class="cv dp" style="left: 1505px; top: 831px;" >G5 </div>
							<div id="G6" class="cv dp" style="left: 1474px; top: 831px;" >G6 </div>
							<div id="G7" class="cv dp" style="left: 1443px; top: 831px;" >G7 </div>
							<div id="G8" class="cv dp" style="left: 1412px; top: 831px;" >G8 </div>
							<div id="G9" class="cv dp" style="left: 1381px; top: 831px;" >G9 </div>
							<div id="G1A" class="cv dp" style="left: 1350px; top: 831px;" >G10 </div>
							<div id="G1B" class="cv dp" style="left: 1319px; top: 831px;" >G11 </div>
							<div id="G1C" class="cv dp" style="left: 1288px; top: 831px;" >G12 </div>
							
							<div id="11" class="cv dp" style="left: 1195px; top: 676px;" >11 </div>
							<div id="12" class="cv dp" style="left: 1195px; top: 707px;" >12 </div>
							<div id="13" class="cv dp" style="left: 1195px; top: 738px;" >13 </div>
							<div id="14" class="cv dp" style="left: 1195px; top: 769px;" >14 </div>
							<div id="15" class="cv dp" style="left: 1195px; top: 800px;" >15 </div>
							<div id="16" class="cv dp" style="left: 1195px; top: 831px;" >16 </div>
							<div id="17" class="cv dp" style="left: 1195px; top: 862px;" >17 </div>
							<div id="18" class="cv dp" style="left: 1195px; top: 893px;" >18 </div>
							<div id="19" class="cv dp" style="left: 1195px; top: 924px;" >19 </div>
							<div id="1A" class="cv dp" style="left: 1195px; top: 955px;" >1A </div>
							<div id="21" class="cv dp" style="left: 1164px; top: 676px;" >21 </div>
							<div id="22" class="cv dp" style="left: 1164px; top: 707px;" >22 </div>
							<div id="23" class="cv dp" style="left: 1164px; top: 738px;" >23 </div>
							<div id="24" class="cv dp" style="left: 1164px; top: 769px;" >24 </div>
							<div id="25" class="cv dp" style="left: 1164px; top: 800px;" >25 </div>
							<div id="26" class="cv dp" style="left: 1164px; top: 831px;" >26 </div>
							<div id="27" class="cv dp" style="left: 1164px; top: 862px;" >27 </div>
							<div id="28" class="cv dp" style="left: 1164px; top: 893px;" >28 </div>
							<div id="29" class="cv dp" style="left: 1164px; top: 924px;" >29 </div>
							<div id="2A" class="cv dp" style="left: 1164px; top: 955px;" >2A </div>							
							<div id="31" class="cv dp" style="left: 1133px; top: 676px;" >31 </div>
							<div id="32" class="cv dp" style="left: 1133px; top: 707px;" >32 </div>
							<div id="33" class="cv dp" style="left: 1133px; top: 738px;" >33 </div>
							<div id="34" class="cv dp" style="left: 1133px; top: 769px;" >34 </div>
							<div id="35" class="cv dp" style="left: 1133px; top: 800px;" >35 </div>
							<div id="36" class="cv dp" style="left: 1133px; top: 831px;" >36 </div>
							<div id="37" class="cv dp" style="left: 1133px; top: 862px;" >37 </div>
							<div id="38" class="cv dp" style="left: 1133px; top: 893px;" >38 </div>
							<div id="39" class="cv dp" style="left: 1133px; top: 924px;" >39 </div>
							<div id="3A" class="cv dp" style="left: 1133px; top: 955px;" >3A </div>
							<div id="41" class="cv dp" style="left: 1102px; top: 676px;" >41 </div>
							<div id="42" class="cv dp" style="left: 1102px; top: 707px;" >42 </div>
							<div id="43" class="cv dp" style="left: 1102px; top: 738px;" >43 </div>
							<div id="44" class="cv dp" style="left: 1102px; top: 769px;" >44 </div>
							<div id="45" class="cv dp" style="left: 1102px; top: 800px;" >45 </div>
							<div id="46" class="cv dp" style="left: 1102px; top: 831px;" >46 </div>
							<div id="47" class="cv dp" style="left: 1102px; top: 862px;" >47 </div>
							<div id="48" class="cv dp" style="left: 1102px; top: 893px;" >48 </div>
							<div id="49" class="cv dp" style="left: 1102px; top: 924px;" >49 </div>
							<div id="4A" class="cv dp" style="left: 1102px; top: 955px;" >4A </div>
							<div id="51" class="cv dp" style="left: 1071px; top: 676px;" >51 </div>
							<div id="52" class="cv dp" style="left: 1071px; top: 707px;" >52 </div>
							<div id="53" class="cv dp" style="left: 1071px; top: 738px;" >53 </div>
							<div id="54" class="cv dp" style="left: 1071px; top: 769px;" >54 </div>
							<div id="55" class="cv dp" style="left: 1071px; top: 800px;" >55 </div>
							<div id="56" class="cv dp" style="left: 1071px; top: 831px;" >56 </div>
							<div id="57" class="cv dp" style="left: 1071px; top: 862px;" >57 </div>
							<div id="58" class="cv dp" style="left: 1071px; top: 893px;" >58 </div>
							<div id="59" class="cv dp" style="left: 1071px; top: 924px;" >59 </div>
							<div id="5A" class="cv dp" style="left: 1071px; top: 955px;" >5A </div>							
							
							<div id="CS1" class="cv dp" style="left: 978px; top: 831px;" >CS1 </div>
							<div id="CS2" class="cv dp" style="left: 978px; top: 862px;" >CS2 </div>
							<div id="CS3" class="cv dp" style="left: 947px; top: 800px;" >CS3 </div>
							<div id="CS4" class="cv dp" style="left: 916px; top: 800px;" >CS4 </div>
							<div id="CS5" class="cv dp" style="left: 885px; top: 800px;" >CS5 </div>
							<div id="CS6" class="cv dp" style="left: 854px; top: 800px;" >CS6 </div>
							<div id="CS7" class="cv dp" style="left: 823px; top: 800px;" >CS7 </div>
							<div id="CS8" class="cv dp" style="left: 792px; top: 800px;" >CS8 </div>
							<div id="CS9" class="cv dp" style="left: 761px; top: 800px;" >CS9 </div>
							<div id="CSA" class="cv dp" style="left: 730px; top: 800px;" >CSA </div>
							<div id="CSB" class="cv dp" style="left: 699px; top: 800px;" >CSB </div>
							<div id="CSC" class="cv dp" style="left: 668px; top: 800px;" >CSC </div>
							
							<div id="MS1" class="cv dp" style="left: 606px; top: 800px;" >MS1 </div>
							<div id="MS2" class="cv dp" style="left: 606px; top: 769px;" >MS2 </div>
							<div id="MS3" class="cv dp" style="left: 606px; top: 738px;" >MS3 </div>							
							<div id="MS4" class="cv dp" style="left: 575px; top: 707px;" >MS4 </div>
							<div id="MS5" class="cv dp" style="left: 544px; top: 707px;" >MS5 </div>
							<div id="MS6" class="cv dp" style="left: 513px; top: 707px;" >MS6 </div>
							<div id="MS7" class="cv dp" style="left: 482px; top: 707px;" >MS7 </div>
							<div id="MS8" class="cv dp" style="left: 451px; top: 707px;" >MS8 </div>
							<div id="MS9" class="cv dp" style="left: 420px; top: 707px;" >MS9 </div>
							<div id="MSA" class="cv dp" style="left: 389px; top: 707px;" >MSA </div>
							<div id="MSB" class="cv dp" style="left: 358px; top: 707px;" >MSB </div>
							<div id="MSC" class="cv dp" style="left: 327px; top: 707px;" >MSC </div>
							<div id="MSD" class="cv dp" style="left: 296px; top: 707px;" >MSD </div>
							<div id="MSE" class="cv dp" style="left: 265px; top: 707px;" >MSE </div>
							<div id="MSF" class="cv dp" style="left: 234px; top: 707px;" >MSF </div>
							<div id="MSG" class="cv dp" style="left: 203px; top: 707px;" >MSG </div>
							<div id="MSH" class="cv dp" style="left: 172px; top: 707px;" >MSH </div>
							<div id="MSI" class="cv dp" style="left: 141px; top: 707px;" >MSI </div>
							
							<div id="RM1" class="cv dp" style="left: 482px; top: 800px;" >RM1 </div>
							<div id="RM2" class="cv dp" style="left: 451px; top: 800px;" >RM2 </div>
							<div id="RM3" class="cv dp" style="left: 420px; top: 800px;" >RM3 </div>
							<div id="RM4" class="cv dp" style="left: 389px; top: 800px;" >RM4 </div>
							<div id="RM5" class="cv dp" style="left: 358px; top: 800px;" >RM5 </div>
							<div id="RM6" class="cv dp" style="left: 327px; top: 800px;" >RM6 </div>
							<div id="RM7" class="cv dp" style="left: 296px; top: 800px;" >RM7 </div>
							<div id="RM8" class="cv dp" style="left: 265px; top: 800px;" >RM8 </div>
							<div id="RM9" class="cv dp" style="left: 234px; top: 800px;" >RM9 </div>
							<div id="RMA" class="cv dp" style="left: 203px; top: 800px;" >RMA </div>
							<div id="RMB" class="cv dp" style="left: 172px; top: 800px;" >RMB </div>
							<div id="RMC" class="cv dp" style="left: 141px; top: 800px;" >RMC </div>
							<div id="RMD" class="cv dp" style="left: 110px; top: 800px;" >RMD </div>
							<div id="RME" class="cv dp" style="left: 79px; top: 800px;" >RME </div>
							<div id="RMF" class="cv dp" style="left: 48px; top: 800px;" >RMF </div>

							<div id="AFP10008" class="entry cv" data-position="O51" data-status="3" data-type="4" style="left: 141px; top: 121px;">AFP</div>
							<div id="AFP10009" class="entry cv" data-position="A61" data-status="3" data-type="7" style="left: 389px; top: 28px;">AFP</div>

							{if isset($tcards.positioned)}
								{foreach $tcards.positioned as $card}
									<div id="{$card->tc_id}" class="entry cv" data-position="{$card->tp_position}" style="background-color: {$card->s_color}; border-color: {$card->tt_color};{if $card->tp_top}top: {$card->tp_top};{/if}{if $card->tp_left}left: {$card->tp_left}{/if}">{$card->display_chars}</div>
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
		      			<h4 class="modal-title">New Entry</h4>
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
			      								<option value="{$checker->c_id}">{$checker->c_firstname}{if $checker->c_mi}&nbsp;{$checker->c_mi}{/if}{if $checker->c_lastname}{$checker->lastname}{/if}</option>
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
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		        <button id="save-card" type="button" class="btn btn-primary">Save</button>
		      </div>
		    </div>
		  </div>
		</div>
	<footer>
	</footer>
{/block}

