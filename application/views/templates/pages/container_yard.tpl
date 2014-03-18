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
				<a class="btn btn-oroport pull-left"><span class="glyphicon glyphicon-plus"></span> New Entry</a>
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

							<div id="AFP10001" class="entry cv" data-status="1" data-type="1" data-position="" style="">AFP</div>
							<div id="AFP10002" class="entry cv" data-status="2" data-type="2" style="">AFP</div>
							<div id="AFP10003" class="entry cv" data-status="3" data-type="3" style="">AFP</div>
							<div id="AFP10004" class="entry cv" data-status="3" data-type="4" style="">AFP</div>
							<div id="AFP10005" class="entry cv" data-status="3" data-type="5" style="">AFP</div>
							<div id="AFP10006" class="entry cv" data-status="3" data-type="6" style="">AFP</div>
							<div id="AFP10007" class="entry cv" data-status="3" data-type="7" style="">AFP</div>

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
								<a id="zoom-out" class="btn btn-default btn-sm "><span class="glyphicon glyphicon-zoom-out"></span></a> 
								<a id="zoom" class="btn btn-default btn-sm "><span class="glyphicon glyphicon-search"></span></a> 
								<a id="zoom-in" class="btn btn-default btn-sm "><span class="glyphicon glyphicon-zoom-in"></span></a>
							</div>
						</div>
					</div>

					<div id="map" class="panel panel-default" data-zoom="1">
						<div class="panel-body">
							<div id="T1" class="cv" style="left: 48px; top: 16px;">T1 </div>
							<div id="T2" class="cv" style="left: 48px; top: 47px;">T2 </div>
							<div id="T3" class="cv" style="left: 48px; top: 78px;">T3 </div>
							<div id="T4" class="cv" style="left: 48px; top: 109px;">T4 </div>
							<div id="T5" class="cv" style="left: 48px; top: 140px;">T5 </div>
							<div id="T6" class="cv" style="left: 48px; top: 171px;">T6 </div>
							<div id="T7" class="cv" style="left: 48px; top: 202px;">T7 </div>
							<div id="T8" class="cv" style="left: 48px; top: 233px;">T8 </div>
							<div id="T9" class="cv" style="left: 48px; top: 264px;">T9 </div>
							<div id="T10" class="cv" style="left: 48px; top: 295px;">T10 </div>
							<div id="T11" class="cv" style="left: 48px; top: 326px;">T11 </div>
							<div id="T12" class="cv" style="left: 48px; top: 357px;">T12 </div>
							<div id="T13" class="cv" style="left: 48px; top: 388px;">T13 </div>
							<div id="T14" class="cv" style="left: 48px; top: 419px;">T14 </div>
							<div id="T15" class="cv" style="left: 48px; top: 450px;">T15 </div>
							<div id="T16" class="cv" style="left: 48px; top: 481px;">T16 </div>
							<div id="T17" class="cv" style="left: 48px; top: 512px;">T17 </div>
							<div id="T18" class="cv" style="left: 48px; top: 543px;">T18 </div>

							<div id="O61" class="cv" style="left: 141px; top: 28px;">O61 </div>
							<div id="O62" class="cv" style="left: 141px; top: 59px;">O62 </div>
							<div id="O63" class="cv" style="left: 172px; top: 28px;">O63 </div>
							<div id="O64" class="cv" style="left: 172px; top: 59px;">O64 </div>
							<div id="O65" class="cv" style="left: 203px; top: 28px;">O65 </div>
							<div id="O66" class="cv" style="left: 203px; top: 59px;">O66 </div>
							<div id="O67" class="cv" style="left: 234px; top: 28px;">O67 </div>
							<div id="O68" class="cv" style="left: 234px; top: 59px;">O68 </div>
							<div id="O69" class="cv" style="left: 265px; top: 28px;">O69 </div>
							<div id="O6A" class="cv" style="left: 265px; top: 59px;">O6A </div>
							<div id="O6B" class="cv" style="left: 296px; top: 28px;">O6B </div>
							<div id="O6C" class="cv" style="left: 296px; top: 59px;">O6C </div>
							<div id="O51" class="cv cv5" style="left: 141px; top: 121px;">O51 </div>
							<div id="O52" class="cv cv5" style="left: 141px; top: 152px;">O52 </div>
							<div id="O53" class="cv cv5" style="left: 172px; top: 121px;">O53 </div>
							<div id="O54" class="cv cv5" style="left: 172px; top: 152px;">O54 </div>
							<div id="O55" class="cv cv5" style="left: 203px; top: 121px;">O55 </div>
							<div id="O56" class="cv cv5" style="left: 203px; top: 152px;">O56 </div>
							<div id="O57" class="cv cv5" style="left: 234px; top: 121px;">O57 </div>
							<div id="O58" class="cv cv5" style="left: 234px; top: 152px;">O58 </div>
							<div id="O59" class="cv cv5" style="left: 265px; top: 121px;">O59 </div>
							<div id="O5A" class="cv cv5" style="left: 265px; top: 152px;">O5A </div>
							<div id="O5B" class="cv cv5" style="left: 296px; top: 121px;">O5B </div>
							<div id="O5C" class="cv cv5" style="left: 296px; top: 152px;">O5C </div>
							<div id="O41" class="cv cv4" style="left: 141px; top: 214px;">O41 </div>
							<div id="O42" class="cv cv4" style="left: 141px; top: 245px;">O42 </div>
							<div id="O43" class="cv cv4" style="left: 172px; top: 214px;">O43 </div>
							<div id="O44" class="cv cv4" style="left: 172px; top: 245px;">O44 </div>
							<div id="O45" class="cv cv4" style="left: 203px; top: 214px;">O45 </div>
							<div id="O46" class="cv cv4" style="left: 203px; top: 245px;">O46 </div>
							<div id="O47" class="cv cv4" style="left: 234px; top: 214px;">O47 </div>
							<div id="O48" class="cv cv4" style="left: 234px; top: 245px;">O48 </div>
							<div id="O49" class="cv cv4" style="left: 265px; top: 214px;">O49 </div>
							<div id="O4A" class="cv cv4" style="left: 265px; top: 245px;">O4A </div>
							<div id="O4B" class="cv cv4" style="left: 296px; top: 214px;">O4B </div>
							<div id="O4C" class="cv cv4" style="left: 296px; top: 245px;">O4C </div>
							<div id="O31" class="cv cv3" style="left: 141px; top: 307px;">O31 </div>
							<div id="O32" class="cv cv3" style="left: 141px; top: 338px;">O32 </div>
							<div id="O33" class="cv cv3" style="left: 172px; top: 307px;">O33 </div>
							<div id="O34" class="cv cv3" style="left: 172px; top: 338px;">O34 </div>
							<div id="O35" class="cv cv3" style="left: 203px; top: 307px;">O35 </div>
							<div id="O36" class="cv cv3" style="left: 203px; top: 338px;">O36 </div>
							<div id="O37" class="cv cv3" style="left: 234px; top: 307px;">O37 </div>
							<div id="O38" class="cv cv3" style="left: 234px; top: 338px;">O38 </div>
							<div id="O39" class="cv cv3" style="left: 265px; top: 307px;">O39 </div>
							<div id="O3A" class="cv cv3" style="left: 265px; top: 338px;">O3A </div>
							<div id="O3B" class="cv cv3" style="left: 296px; top: 307px;">O3B </div>
							<div id="O3C" class="cv cv3" style="left: 296px; top: 338px;">O3C </div>
							<div id="O21" class="cv cv2" style="left: 141px; top: 400px;">O21 </div>
							<div id="O22" class="cv cv2" style="left: 141px; top: 431px;">O22 </div>
							<div id="O23" class="cv cv2" style="left: 172px; top: 400px;">O23 </div>
							<div id="O24" class="cv cv2" style="left: 172px; top: 431px;">O24 </div>
							<div id="O25" class="cv cv2" style="left: 203px; top: 400px;">O25 </div>
							<div id="O26" class="cv cv2" style="left: 203px; top: 431px;">O26 </div>
							<div id="O27" class="cv cv2" style="left: 234px; top: 400px;">O27 </div>
							<div id="O28" class="cv cv2" style="left: 234px; top: 431px;">O28 </div>
							<div id="O29" class="cv cv2" style="left: 265px; top: 400px;">O29 </div>
							<div id="O2A" class="cv cv2" style="left: 265px; top: 431px;">O2A </div>
							<div id="O2B" class="cv cv2" style="left: 296px; top: 400px;">O2B </div>
							<div id="O2C" class="cv cv2" style="left: 296px; top: 431px;">O2C </div>
							<div id="O11" class="cv cv1" style="left: 141px; top: 493px;">O11 </div>
							<div id="O12" class="cv cv1" style="left: 141px; top: 524px;">O12 </div>
							<div id="O13" class="cv cv1" style="left: 172px; top: 493px;">O13 </div>
							<div id="O14" class="cv cv1" style="left: 172px; top: 524px;">O14 </div>
							<div id="O15" class="cv cv1" style="left: 203px; top: 493px;">O15 </div>
							<div id="O16" class="cv cv1" style="left: 203px; top: 524px;">O16 </div>
							<div id="O17" class="cv cv1" style="left: 234px; top: 493px;">O17 </div>
							<div id="O18" class="cv cv1" style="left: 234px; top: 524px;">O18 </div>
							<div id="O19" class="cv cv1" style="left: 265px; top: 493px;">O19 </div>
							<div id="O1A" class="cv cv1" style="left: 265px; top: 524px;">O1A </div>
							<div id="O1B" class="cv cv1" style="left: 296px; top: 493px;">O1B </div>
							<div id="O1C" class="cv cv1" style="left: 296px; top: 524px;">O1C </div>
							<div id="A61" class="cv cv6" style="left: 389px; top: 28px;">A61 </div>
							<div id="A62" class="cv cv6" style="left: 389px; top: 59px;">A62 </div>
							<div id="A63" class="cv cv6" style="left: 420px; top: 28px;">A63 </div>
							<div id="A64" class="cv cv6" style="left: 420px; top: 59px;">A64 </div>
							<div id="A65" class="cv cv6" style="left: 451px; top: 28px;">A65 </div>
							<div id="A66" class="cv cv6" style="left: 451px; top: 59px;">A66 </div>
							<div id="A67" class="cv cv6" style="left: 482px; top: 28px;">A67 </div>
							<div id="A68" class="cv cv6" style="left: 482px; top: 59px;">A68 </div>
							<div id="A69" class="cv cv6" style="left: 513px; top: 28px;">A69 </div>
							<div id="A6A" class="cv cv6" style="left: 513px; top: 59px;">A6A </div>
							<div id="A6B" class="cv cv6" style="left: 544px; top: 28px;">A6B </div>
							<div id="A6C" class="cv cv6" style="left: 544px; top: 59px;">A6C </div>
							<div id="A51" class="cv cv5" style="left: 389px; top: 121px;">A51 </div>
							<div id="A52" class="cv cv5" style="left: 389px; top: 152px;">A52 </div>
							<div id="A53" class="cv cv5" style="left: 420px; top: 121px;">A53 </div>
							<div id="A54" class="cv cv5" style="left: 420px; top: 152px;">A54 </div>
							<div id="A55" class="cv cv5" style="left: 451px; top: 121px;">A55 </div>
							<div id="A56" class="cv cv5" style="left: 451px; top: 152px;">A56 </div>
							<div id="A57" class="cv cv5" style="left: 482px; top: 121px;">A57 </div>
							<div id="A58" class="cv cv5" style="left: 482px; top: 152px;">A58 </div>
							<div id="A59" class="cv cv5" style="left: 513px; top: 121px;">A59 </div>
							<div id="A5A" class="cv cv5" style="left: 513px; top: 152px;">A5A </div>
							<div id="A5B" class="cv cv5" style="left: 544px; top: 121px;">A5B </div>
							<div id="A5C" class="cv cv5" style="left: 544px; top: 152px;">A5C </div>
							<div id="A41" class="cv cv4" style="left: 389px; top: 214px;">A41 </div>
							<div id="A42" class="cv cv4" style="left: 389px; top: 245px;">A42 </div>
							<div id="A43" class="cv cv4" style="left: 420px; top: 214px;">A43 </div>
							<div id="A44" class="cv cv4" style="left: 420px; top: 245px;">A44 </div>
							<div id="A45" class="cv cv4" style="left: 451px; top: 214px;">A45 </div>
							<div id="A46" class="cv cv4" style="left: 451px; top: 245px;">A46 </div>
							<div id="A47" class="cv cv4" style="left: 482px; top: 214px;">A47 </div>
							<div id="A48" class="cv cv4" style="left: 482px; top: 245px;">A48 </div>
							<div id="A49" class="cv cv4" style="left: 513px; top: 214px;">A49 </div>
							<div id="A4A" class="cv cv4" style="left: 513px; top: 245px;">A4A </div>
							<div id="A4B" class="cv cv4" style="left: 544px; top: 214px;">A4B </div>
							<div id="A4C" class="cv cv4" style="left: 544px; top: 245px;">A4C </div>
							<div id="A31" class="cv cv3" style="left: 389px; top: 307px;">A31 </div>
							<div id="A32" class="cv cv3" style="left: 389px; top: 338px;">A32 </div>
							<div id="A33" class="cv cv3" style="left: 420px; top: 307px;">A33 </div>
							<div id="A34" class="cv cv3" style="left: 420px; top: 338px;">A34 </div>
							<div id="A35" class="cv cv3" style="left: 451px; top: 307px;">A35 </div>
							<div id="A36" class="cv cv3" style="left: 451px; top: 338px;">A36 </div>
							<div id="A37" class="cv cv3" style="left: 482px; top: 307px;">A37 </div>
							<div id="A38" class="cv cv3" style="left: 482px; top: 338px;">A38 </div>
							<div id="A39" class="cv cv3" style="left: 513px; top: 307px;">A39 </div>
							<div id="A3A" class="cv cv3" style="left: 513px; top: 338px;">A3A </div>
							<div id="A3B" class="cv cv3" style="left: 544px; top: 307px;">A3B </div>
							<div id="A3C" class="cv cv3" style="left: 544px; top: 338px;">A3C </div>
							<div id="A21" class="cv cv2" style="left: 389px; top: 400px;">A21 </div>
							<div id="A22" class="cv cv2" style="left: 389px; top: 431px;">A22 </div>
							<div id="A23" class="cv cv2" style="left: 420px; top: 400px;">A23 </div>
							<div id="A24" class="cv cv2" style="left: 420px; top: 431px;">A24 </div>
							<div id="A25" class="cv cv2" style="left: 451px; top: 400px;">A25 </div>
							<div id="A26" class="cv cv2" style="left: 451px; top: 431px;">A26 </div>
							<div id="A27" class="cv cv2" style="left: 482px; top: 400px;">A27 </div>
							<div id="A28" class="cv cv2" style="left: 482px; top: 431px;">A28 </div>
							<div id="A29" class="cv cv2" style="left: 513px; top: 400px;">A29 </div>
							<div id="A2A" class="cv cv2" style="left: 513px; top: 431px;">A2A </div>
							<div id="A2B" class="cv cv2" style="left: 544px; top: 400px;">A2B </div>
							<div id="A2C" class="cv cv2" style="left: 544px; top: 431px;">A2C </div>
							<div id="A11" class="cv cv1" style="left: 389px; top: 493px;">A11 </div>
							<div id="A12" class="cv cv1" style="left: 389px; top: 524px;">A12 </div>
							<div id="A13" class="cv cv1" style="left: 420px; top: 493px;">A13 </div>
							<div id="A14" class="cv cv1" style="left: 420px; top: 524px;">A14 </div>
							<div id="A15" class="cv cv1" style="left: 451px; top: 493px;">A15 </div>
							<div id="A16" class="cv cv1" style="left: 451px; top: 524px;">A16 </div>
							<div id="A17" class="cv cv1" style="left: 482px; top: 493px;">A17 </div>
							<div id="A18" class="cv cv1" style="left: 482px; top: 524px;">A18 </div>
							<div id="A19" class="cv cv1" style="left: 513px; top: 493px;">A19 </div>
							<div id="A1A" class="cv cv1" style="left: 513px; top: 524px;">A1A </div>
							<div id="A1B" class="cv cv1" style="left: 544px; top: 493px;">A1B </div>
							<div id="A1C" class="cv cv1" style="left: 544px; top: 524px;">A1C </div>
							<div id="B61" class="cv cv6" style="left: 637px; top: 28px;">B61 </div>
							<div id="B62" class="cv cv6" style="left: 637px; top: 59px;">B62 </div>
							<div id="B63" class="cv cv6" style="left: 668px; top: 28px;">B63 </div>
							<div id="B64" class="cv cv6" style="left: 668px; top: 59px;">B64 </div>
							<div id="B65" class="cv cv6" style="left: 699px; top: 28px;">B65 </div>
							<div id="B66" class="cv cv6" style="left: 699px; top: 59px;">B66 </div>
							<div id="B67" class="cv cv6" style="left: 730px; top: 28px;">B67 </div>
							<div id="B68" class="cv cv6" style="left: 730px; top: 59px;">B68 </div>
							<div id="B69" class="cv cv6" style="left: 761px; top: 28px;">B69 </div>
							<div id="B6A" class="cv cv6" style="left: 761px; top: 59px;">B6A </div>
							<div id="B6B" class="cv cv6" style="left: 792px; top: 28px;">B6B </div>
							<div id="B6C" class="cv cv6" style="left: 792px; top: 59px;">B6C </div>
							<div id="B51" class="cv cv5" style="left: 637px; top: 121px;">B51 </div>
							<div id="B52" class="cv cv5" style="left: 637px; top: 152px;">B52 </div>
							<div id="B53" class="cv cv5" style="left: 668px; top: 121px;">B53 </div>
							<div id="B54" class="cv cv5" style="left: 668px; top: 152px;">B54 </div>
							<div id="B55" class="cv cv5" style="left: 699px; top: 121px;">B55 </div>
							<div id="B56" class="cv cv5" style="left: 699px; top: 152px;">B56 </div>
							<div id="B57" class="cv cv5" style="left: 730px; top: 121px;">B57 </div>
							<div id="B58" class="cv cv5" style="left: 730px; top: 152px;">B58 </div>
							<div id="B59" class="cv cv5" style="left: 761px; top: 121px;">B59 </div>
							<div id="B5A" class="cv cv5" style="left: 761px; top: 152px;">B5A </div>
							<div id="B5B" class="cv cv5" style="left: 792px; top: 121px;">B5B </div>
							<div id="B5C" class="cv cv5" style="left: 792px; top: 152px;">B5C </div>
							<div id="B41" class="cv cv4" style="left: 637px; top: 214px;">B41 </div>
							<div id="B42" class="cv cv4" style="left: 637px; top: 245px;">B42 </div>
							<div id="B43" class="cv cv4" style="left: 668px; top: 214px;">B43 </div>
							<div id="B44" class="cv cv4" style="left: 668px; top: 245px;">B44 </div>
							<div id="B45" class="cv cv4" style="left: 699px; top: 214px;">B45 </div>
							<div id="B46" class="cv cv4" style="left: 699px; top: 245px;">B46 </div>
							<div id="B47" class="cv cv4" style="left: 730px; top: 214px;">B47 </div>
							<div id="B48" class="cv cv4" style="left: 730px; top: 245px;">B48 </div>
							<div id="B49" class="cv cv4" style="left: 761px; top: 214px;">B49 </div>
							<div id="B4A" class="cv cv4" style="left: 761px; top: 245px;">B4A </div>
							<div id="B4B" class="cv cv4" style="left: 792px; top: 214px;">B4B </div>
							<div id="B4C" class="cv cv4" style="left: 792px; top: 245px;">B4C </div>
							<div id="B31" class="cv cv3" style="left: 637px; top: 307px;">B31 </div>
							<div id="B32" class="cv cv3" style="left: 637px; top: 338px;">B32 </div>
							<div id="B33" class="cv cv3" style="left: 668px; top: 307px;">B33 </div>
							<div id="B34" class="cv cv3" style="left: 668px; top: 338px;">B34 </div>
							<div id="B35" class="cv cv3" style="left: 699px; top: 307px;">B35 </div>
							<div id="B36" class="cv cv3" style="left: 699px; top: 338px;">B36 </div>
							<div id="B37" class="cv cv3" style="left: 730px; top: 307px;">B37 </div>
							<div id="B38" class="cv cv3" style="left: 730px; top: 338px;">B38 </div>
							<div id="B39" class="cv cv3" style="left: 761px; top: 307px;">B39 </div>
							<div id="B3A" class="cv cv3" style="left: 761px; top: 338px;">B3A </div>
							<div id="B3B" class="cv cv3" style="left: 792px; top: 307px;">B3B </div>
							<div id="B3C" class="cv cv3" style="left: 792px; top: 338px;">B3C </div>
							<div id="B21" class="cv cv2" style="left: 637px; top: 400px;">B21 </div>
							<div id="B22" class="cv cv2" style="left: 637px; top: 431px;">B22 </div>
							<div id="B23" class="cv cv2" style="left: 668px; top: 400px;">B23 </div>
							<div id="B24" class="cv cv2" style="left: 668px; top: 431px;">B24 </div>
							<div id="B25" class="cv cv2" style="left: 699px; top: 400px;">B25 </div>
							<div id="B26" class="cv cv2" style="left: 699px; top: 431px;">B26 </div>
							<div id="B27" class="cv cv2" style="left: 730px; top: 400px;">B27 </div>
							<div id="B28" class="cv cv2" style="left: 730px; top: 431px;">B28 </div>
							<div id="B29" class="cv cv2" style="left: 761px; top: 400px;">B29 </div>
							<div id="B2A" class="cv cv2" style="left: 761px; top: 431px;">B2A </div>
							<div id="B2B" class="cv cv2" style="left: 792px; top: 400px;">B2B </div>
							<div id="B2C" class="cv cv2" style="left: 792px; top: 431px;">B2C </div>
							<div id="B11" class="cv cv1" style="left: 637px; top: 493px;">B11 </div>
							<div id="B12" class="cv cv1" style="left: 637px; top: 524px;">B12 </div>
							<div id="B13" class="cv cv1" style="left: 668px; top: 493px;">B13 </div>
							<div id="B14" class="cv cv1" style="left: 668px; top: 524px;">B14 </div>
							<div id="B15" class="cv cv1" style="left: 699px; top: 493px;">B15 </div>
							<div id="B16" class="cv cv1" style="left: 699px; top: 524px;">B16 </div>
							<div id="B17" class="cv cv1" style="left: 730px; top: 493px;">B17 </div>
							<div id="B18" class="cv cv1" style="left: 730px; top: 524px;">B18 </div>
							<div id="B19" class="cv cv1" style="left: 761px; top: 493px;">B19 </div>
							<div id="B1A" class="cv cv1" style="left: 761px; top: 524px;">B1A </div>
							<div id="B1B" class="cv cv1" style="left: 792px; top: 493px;">B1B </div>
							<div id="B1C" class="cv cv1" style="left: 792px; top: 524px;">B1C </div>
							<div id="C61" class="cv cv6" style="left: 885px; top: 28px;">C61 </div>
							<div id="C62" class="cv cv6" style="left: 885px; top: 59px;">C62 </div>
							<div id="C63" class="cv cv6" style="left: 916px; top: 28px;">C63 </div>
							<div id="C64" class="cv cv6" style="left: 916px; top: 59px;">C64 </div>
							<div id="C65" class="cv cv6" style="left: 947px; top: 28px;">C65 </div>
							<div id="C66" class="cv cv6" style="left: 947px; top: 59px;">C66 </div>
							<div id="C67" class="cv cv6" style="left: 978px; top: 28px;">C67 </div>
							<div id="C68" class="cv cv6" style="left: 978px; top: 59px;">C68 </div>
							<div id="C69" class="cv cv6" style="left: 1009px; top: 28px;">C69 </div>
							<div id="C6A" class="cv cv6" style="left: 1009px; top: 59px;">C6A </div>
							<div id="C6B" class="cv cv6" style="left: 1040px; top: 28px;">C6B </div>
							<div id="C6C" class="cv cv6" style="left: 1040px; top: 59px;">C6C </div>
							<div id="C51" class="cv cv5" style="left: 885px; top: 121px;">C51 </div>
							<div id="C52" class="cv cv5" style="left: 885px; top: 152px;">C52 </div>
							<div id="C53" class="cv cv5" style="left: 916px; top: 121px;">C53 </div>
							<div id="C54" class="cv cv5" style="left: 916px; top: 152px;">C54 </div>
							<div id="C55" class="cv cv5" style="left: 947px; top: 121px;">C55 </div>
							<div id="C56" class="cv cv5" style="left: 947px; top: 152px;">C56 </div>
							<div id="C57" class="cv cv5" style="left: 978px; top: 121px;">C57 </div>
							<div id="C58" class="cv cv5" style="left: 978px; top: 152px;">C58 </div>
							<div id="C59" class="cv cv5" style="left: 1009px; top: 121px;">C59 </div>
							<div id="C5A" class="cv cv5" style="left: 1009px; top: 152px;">C5A </div>
							<div id="C5B" class="cv cv5" style="left: 1040px; top: 121px;">C5B </div>
							<div id="C5C" class="cv cv5" style="left: 1040px; top: 152px;">C5C </div>
							<div id="C41" class="cv cv4" style="left: 885px; top: 214px;">C41 </div>
							<div id="C42" class="cv cv4" style="left: 885px; top: 245px;">C42 </div>
							<div id="C43" class="cv cv4" style="left: 916px; top: 214px;">C43 </div>
							<div id="C44" class="cv cv4" style="left: 916px; top: 245px;">C44 </div>
							<div id="C45" class="cv cv4" style="left: 947px; top: 214px;">C45 </div>
							<div id="C46" class="cv cv4" style="left: 947px; top: 245px;">C46 </div>
							<div id="C47" class="cv cv4" style="left: 978px; top: 214px;">C47 </div>
							<div id="C48" class="cv cv4" style="left: 978px; top: 245px;">C48 </div>
							<div id="C49" class="cv cv4" style="left: 1009px; top: 214px;">C49 </div>
							<div id="C4A" class="cv cv4" style="left: 1009px; top: 245px;">C4A </div>
							<div id="C4B" class="cv cv4" style="left: 1040px; top: 214px;">C4B </div>
							<div id="C4C" class="cv cv4" style="left: 1040px; top: 245px;">C4C </div>
							<div id="C31" class="cv cv3" style="left: 885px; top: 307px;">C31 </div>
							<div id="C32" class="cv cv3" style="left: 885px; top: 338px;">C32 </div>
							<div id="C33" class="cv cv3" style="left: 916px; top: 307px;">C33 </div>
							<div id="C34" class="cv cv3" style="left: 916px; top: 338px;">C34 </div>
							<div id="C35" class="cv cv3" style="left: 947px; top: 307px;">C35 </div>
							<div id="C36" class="cv cv3" style="left: 947px; top: 338px;">C36 </div>
							<div id="C37" class="cv cv3" style="left: 978px; top: 307px;">C37 </div>
							<div id="C38" class="cv cv3" style="left: 978px; top: 338px;">C38 </div>
							<div id="C39" class="cv cv3" style="left: 1009px; top: 307px;">C39 </div>
							<div id="C3A" class="cv cv3" style="left: 1009px; top: 338px;">C3A </div>
							<div id="C3B" class="cv cv3" style="left: 1040px; top: 307px;">C3B </div>
							<div id="C3C" class="cv cv3" style="left: 1040px; top: 338px;">C3C </div>
							<div id="C21" class="cv cv2" style="left: 885px; top: 400px;">C21 </div>
							<div id="C22" class="cv cv2" style="left: 885px; top: 431px;">C22 </div>
							<div id="C23" class="cv cv2" style="left: 916px; top: 400px;">C23 </div>
							<div id="C24" class="cv cv2" style="left: 916px; top: 431px;">C24 </div>
							<div id="C25" class="cv cv2" style="left: 947px; top: 400px;">C25 </div>
							<div id="C26" class="cv cv2" style="left: 947px; top: 431px;">C26 </div>
							<div id="C27" class="cv cv2" style="left: 978px; top: 400px;">C27 </div>
							<div id="C28" class="cv cv2" style="left: 978px; top: 431px;">C28 </div>
							<div id="C29" class="cv cv2" style="left: 1009px; top: 400px;">C29 </div>
							<div id="C2A" class="cv cv2" style="left: 1009px; top: 431px;">C2A </div>
							<div id="C2B" class="cv cv2" style="left: 1040px; top: 400px;">C2B </div>
							<div id="C2C" class="cv cv2" style="left: 1040px; top: 431px;">C2C </div>
							<div id="C11" class="cv cv1" style="left: 885px; top: 493px;">C11 </div>
							<div id="C12" class="cv cv1" style="left: 885px; top: 524px;">C12 </div>
							<div id="C13" class="cv cv1" style="left: 916px; top: 493px;">C13 </div>
							<div id="C14" class="cv cv1" style="left: 916px; top: 524px;">C14 </div>
							<div id="C15" class="cv cv1" style="left: 947px; top: 493px;">C15 </div>
							<div id="C16" class="cv cv1" style="left: 947px; top: 524px;">C16 </div>
							<div id="C17" class="cv cv1" style="left: 978px; top: 493px;">C17 </div>
							<div id="C18" class="cv cv1" style="left: 978px; top: 524px;">C18 </div>
							<div id="C19" class="cv cv1" style="left: 1009px; top: 493px;">C19 </div>
							<div id="C1A" class="cv cv1" style="left: 1009px; top: 524px;">C1A </div>
							<div id="C1B" class="cv cv1" style="left: 1040px; top: 493px;">C1B </div>
							<div id="C1C" class="cv cv1" style="left: 1040px; top: 524px;">C1C </div>
							<div id="D61" class="cv cv6" style="left: 1133px; top: 28px;">D61 </div>
							<div id="D62" class="cv cv6" style="left: 1133px; top: 59px;">D62 </div>
							<div id="D63" class="cv cv6" style="left: 1164px; top: 28px;">D63 </div>
							<div id="D64" class="cv cv6" style="left: 1164px; top: 59px;">D64 </div>
							<div id="D65" class="cv cv6" style="left: 1195px; top: 28px;">D65 </div>
							<div id="D66" class="cv cv6" style="left: 1195px; top: 59px;">D66 </div>
							<div id="D67" class="cv cv6" style="left: 1226px; top: 28px;">D67 </div>
							<div id="D68" class="cv cv6" style="left: 1226px; top: 59px;">D68 </div>
							<div id="D69" class="cv cv6" style="left: 1257px; top: 28px;">D69 </div>
							<div id="D6A" class="cv cv6" style="left: 1257px; top: 59px;">D6A </div>
							<div id="D6B" class="cv cv6" style="left: 1288px; top: 28px;">D6B </div>
							<div id="D6C" class="cv cv6" style="left: 1288px; top: 59px;">D6C </div>
							<div id="D51" class="cv cv5" style="left: 1133px; top: 121px;" >D51 </div>
							<div id="D52" class="cv cv5" style="left: 1133px; top: 152px;" >D52 </div>
							<div id="D53" class="cv cv5" style="left: 1164px; top: 121px;" >D53 </div>
							<div id="D54" class="cv cv5" style="left: 1164px; top: 152px;" >D54 </div>
							<div id="D55" class="cv cv5" style="left: 1195px; top: 121px;" >D55 </div>
							<div id="D56" class="cv cv5" style="left: 1195px; top: 152px;" >D56 </div>
							<div id="D57" class="cv cv5" style="left: 1226px; top: 121px;" >D57 </div>
							<div id="D58" class="cv cv5" style="left: 1226px; top: 152px;" >D58 </div>
							<div id="D59" class="cv cv5" style="left: 1257px; top: 121px;" >D59 </div>
							<div id="D5A" class="cv cv5" style="left: 1257px; top: 152px;" >D5A </div>
							<div id="D5B" class="cv cv5" style="left: 1288px; top: 121px;" >D5B </div>
							<div id="D5C" class="cv cv5" style="left: 1288px; top: 152px;" >D5C </div>
							<div id="D41" class="cv cv4" style="left: 1133px; top: 214px;" >D41 </div>
							<div id="D42" class="cv cv4" style="left: 1133px; top: 245px;" >D42 </div>
							<div id="D43" class="cv cv4" style="left: 1164px; top: 214px;" >D43 </div>
							<div id="D44" class="cv cv4" style="left: 1164px; top: 245px;" >D44 </div>
							<div id="D45" class="cv cv4" style="left: 1195px; top: 214px;" >D45 </div>
							<div id="D46" class="cv cv4" style="left: 1195px; top: 245px;" >D46 </div>
							<div id="D47" class="cv cv4" style="left: 1226px; top: 214px;" >D47 </div>
							<div id="D48" class="cv cv4" style="left: 1226px; top: 245px;" >D48 </div>
							<div id="D49" class="cv cv4" style="left: 1257px; top: 214px;" >D49 </div>
							<div id="D4A" class="cv cv4" style="left: 1257px; top: 245px;" >D4A </div>
							<div id="D4B" class="cv cv4" style="left: 1288px; top: 214px;" >D4B </div>
							<div id="D4C" class="cv cv4" style="left: 1288px; top: 245px;" >D4C </div>
							<div id="D31" class="cv cv3" style="left: 1133px; top: 307px;" >D31 </div>
							<div id="D32" class="cv cv3" style="left: 1133px; top: 338px;" >D32 </div>
							<div id="D33" class="cv cv3" style="left: 1164px; top: 307px;" >D33 </div>
							<div id="D34" class="cv cv3" style="left: 1164px; top: 338px;" >D34 </div>
							<div id="D35" class="cv cv3" style="left: 1195px; top: 307px;" >D35 </div>
							<div id="D36" class="cv cv3" style="left: 1195px; top: 338px;" >D36 </div>
							<div id="D37" class="cv cv3" style="left: 1226px; top: 307px;" >D37 </div>
							<div id="D38" class="cv cv3" style="left: 1226px; top: 338px;" >D38 </div>
							<div id="D39" class="cv cv3" style="left: 1257px; top: 307px;" >D39 </div>
							<div id="D3A" class="cv cv3" style="left: 1257px; top: 338px;" >D3A </div>
							<div id="D3B" class="cv cv3" style="left: 1288px; top: 307px;" >D3B </div>
							<div id="D3C" class="cv cv3" style="left: 1288px; top: 338px;" >D3C </div>
							<div id="D21" class="cv cv2" style="left: 1133px; top: 400px;" >D21 </div>
							<div id="D22" class="cv cv2" style="left: 1133px; top: 431px;" >D22 </div>
							<div id="D23" class="cv cv2" style="left: 1164px; top: 400px;" >D23 </div>
							<div id="D24" class="cv cv2" style="left: 1164px; top: 431px;" >D24 </div>
							<div id="D25" class="cv cv2" style="left: 1195px; top: 400px;" >D25 </div>
							<div id="D26" class="cv cv2" style="left: 1195px; top: 431px;" >D26 </div>
							<div id="D27" class="cv cv2" style="left: 1226px; top: 400px;" >D27 </div>
							<div id="D28" class="cv cv2" style="left: 1226px; top: 431px;" >D28 </div>
							<div id="D29" class="cv cv2" style="left: 1257px; top: 400px;" >D29 </div>
							<div id="D2A" class="cv cv2" style="left: 1257px; top: 431px;" >D2A </div>
							<div id="D2B" class="cv cv2" style="left: 1288px; top: 400px;" >D2B </div>
							<div id="D2C" class="cv cv2" style="left: 1288px; top: 431px;" >D2C </div>
							<div id="D11" class="cv cv1" style="left: 1133px; top: 493px;" >D11 </div>
							<div id="D12" class="cv cv1" style="left: 1133px; top: 524px;" >D12 </div>
							<div id="D13" class="cv cv1" style="left: 1164px; top: 493px;" >D13 </div>
							<div id="D14" class="cv cv1" style="left: 1164px; top: 524px;" >D14 </div>
							<div id="D15" class="cv cv1" style="left: 1195px; top: 493px;" >D15 </div>
							<div id="D16" class="cv cv1" style="left: 1195px; top: 524px;" >D16 </div>
							<div id="D17" class="cv cv1" style="left: 1226px; top: 493px;" >D17 </div>
							<div id="D18" class="cv cv1" style="left: 1226px; top: 524px;" >D18 </div>
							<div id="D19" class="cv cv1" style="left: 1257px; top: 493px;" >D19 </div>
							<div id="D1A" class="cv cv1" style="left: 1257px; top: 524px;" >D1A </div>
							<div id="D1B" class="cv cv1" style="left: 1288px; top: 493px;" >D1B </div>
							<div id="D1C" class="cv cv1" style="left: 1288px; top: 524px;" >D1C </div>

							<div id="c61" class="cv cv6" style="left: 1381px; top: 28px;">c61 </div>
							<div id="c62" class="cv cv6" style="left: 1381px; top: 59px;">c62 </div>
							<div id="c63" class="cv cv6" style="left: 1412px; top: 28px;">c63 </div>
							<div id="c64" class="cv cv6" style="left: 1412px; top: 59px;">c64 </div>

							<div id="c51" class="cv cv5" style="left: 1381px; top: 121px;" >c51 </div>
							<div id="c52" class="cv cv5" style="left: 1381px; top: 152px;" >c52 </div>
							<div id="c53" class="cv cv5" style="left: 1412px; top: 121px;" >c53 </div>
							<div id="c54" class="cv cv5" style="left: 1412px; top: 152px;" >c54 </div>
							<div id="c55" class="cv cv5" style="left: 1442px;top: 121px;" >c55 </div>
							<div id="c56" class="cv cv5" style="left: 1442px;top: 152px;" >c56 </div>
							<div id="c57" class="cv cv5" style="left: 1474px; top: 121px;" >c57 </div>
							<div id="c58" class="cv cv5" style="left: 1474px; top: 152px;" >c58 </div>
							<div id="c59" class="cv cv5" style="left: 1505px; top: 121px;" >c59 </div>
							<div id="c5A" class="cv cv5" style="left: 1505px; top: 152px;" >c5A </div>
							<div id="c5B" class="cv cv5" style="left: 1536px; top: 121px;" >c5B </div>
							<div id="c5C" class="cv cv5" style="left: 1536px; top: 152px;" >c5C </div>
							<div id="c41" class="cv cv4" style="left: 1381px; top: 214px;" >c41 </div>
							<div id="c42" class="cv cv4" style="left: 1381px; top: 245px;" >c42 </div>
							<div id="c43" class="cv cv4" style="left: 1412px; top: 214px;" >c43 </div>
							<div id="c44" class="cv cv4" style="left: 1412px; top: 245px;" >c44 </div>
							<div id="c45" class="cv cv4" style="left: 1442px;top: 214px;" >c45 </div>
							<div id="c46" class="cv cv4" style="left: 1442px;top: 245px;" >c46 </div>
							<div id="c47" class="cv cv4" style="left: 1474px; top: 214px;" >c47 </div>
							<div id="c48" class="cv cv4" style="left: 1474px; top: 245px;" >c48 </div>
							<div id="c49" class="cv cv4" style="left: 1505px; top: 214px;" >c49 </div>
							<div id="c4A" class="cv cv4" style="left: 1505px; top: 245px;" >c4A </div>
							<div id="c4B" class="cv cv4" style="left: 1536px; top: 214px;" >c4B </div>
							<div id="c4C" class="cv cv4" style="left: 1536px; top: 245px;" >c4C </div>
							<div id="c31" class="cv cv3" style="left: 1381px; top: 307px;" >c31 </div>
							<div id="c32" class="cv cv3" style="left: 1381px; top: 338px;" >c32 </div>
							<div id="c33" class="cv cv3" style="left: 1412px; top: 307px;" >c33 </div>
							<div id="c34" class="cv cv3" style="left: 1412px; top: 338px;" >c34 </div>
							<div id="c35" class="cv cv3" style="left: 1442px;top: 307px;" >c35 </div>
							<div id="c36" class="cv cv3" style="left: 1442px;top: 338px;" >c36 </div>
							<div id="c37" class="cv cv3" style="left: 1474px; top: 307px;" >c37 </div>
							<div id="c38" class="cv cv3" style="left: 1474px; top: 338px;" >c38 </div>
							<div id="c39" class="cv cv3" style="left: 1505px; top: 307px;" >c39 </div>
							<div id="c3A" class="cv cv3" style="left: 1505px; top: 338px;" >c3A </div>
							<div id="c3B" class="cv cv3" style="left: 1536px; top: 307px;" >c3B </div>
							<div id="c3C" class="cv cv3" style="left: 1536px; top: 338px;" >c3C </div>
							<div id="c21" class="cv cv2" style="left: 1381px; top: 400px;" >c21 </div>
							<div id="c22" class="cv cv2" style="left: 1381px; top: 431px;" >c22 </div>
							<div id="c23" class="cv cv2" style="left: 1412px; top: 400px;" >c23 </div>
							<div id="c24" class="cv cv2" style="left: 1412px; top: 431px;" >c24 </div>
							<div id="c25" class="cv cv2" style="left: 1442px;top: 400px;" >c25 </div>
							<div id="c26" class="cv cv2" style="left: 1442px;top: 431px;" >c26 </div>
							<div id="c27" class="cv cv2" style="left: 1474px; top: 400px;" >c27 </div>
							<div id="c28" class="cv cv2" style="left: 1474px; top: 431px;" >c28 </div>
							<div id="c29" class="cv cv2" style="left: 1505px; top: 400px;" >c29 </div>
							<div id="c2A" class="cv cv2" style="left: 1505px; top: 431px;" >c2A </div>
							<div id="c2B" class="cv cv2" style="left: 1536px; top: 400px;" >c2B </div>
							<div id="c2C" class="cv cv2" style="left: 1536px; top: 431px;" >c2C </div>
							<div id="c11" class="cv cv1" style="left: 1381px; top: 493px;" >c11 </div>
							<div id="c12" class="cv cv1" style="left: 1381px; top: 524px;" >c12 </div>
							<div id="c13" class="cv cv1" style="left: 1412px; top: 493px;" >c13 </div>
							<div id="c14" class="cv cv1" style="left: 1412px; top: 524px;" >c14 </div>
							<div id="c15" class="cv cv1" style="left: 1442px;top: 493px;" >c15 </div>
							<div id="c16" class="cv cv1" style="left: 1442px;top: 524px;" >c16 </div>
							<div id="c17" class="cv cv1" style="left: 1474px; top: 493px;" >c17 </div>
							<div id="c18" class="cv cv1" style="left: 1474px; top: 524px;" >c18 </div>
							<div id="c19" class="cv cv1" style="left: 1505px; top: 493px;" >c19 </div>
							<div id="c1A" class="cv cv1" style="left: 1505px; top: 524px;" >c1A </div>
							<div id="c1B" class="cv cv1" style="left: 1536px; top: 493px;" >c1B </div>
							<div id="c1C" class="cv cv1" style="left: 1536px; top: 524px;" >c1C </div>
							
							<hr class="cy-hr">
							
							<div id="c1C" class="cv cv1" style="left: 1536px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1505px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1474px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1412px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1381px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1350px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1319px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1288px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1257px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1226px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1195px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1164px; top: 570px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1133px; top: 570px;" >c1C </div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<footer>
		</footer>
{/block}

