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
							<div id="O72" class="cv" style="left: 31px; top: 16px;">O61 </div>
							<div id="O71" class="cv" style="left: 31px; top: 16px;">O61 </div>
							<div id="O61" class="cv" style="left: 31px; top: 16px;">O61 </div>
							<div id="O62" class="cv" style="left: 31px; top: 47px;">O62 </div>
							<div id="O63" class="cv" style="left: 62px; top: 16px;">O63 </div>
							<div id="O64" class="cv" style="left: 62px; top: 47px;">O64 </div>
							<div id="O65" class="cv" style="left: 93px; top: 16px;">O65 </div>
							<div id="O66" class="cv" style="left: 93px; top: 47px;">O66 </div>
							<div id="O67" class="cv" style="left: 124px; top: 16px;">O67 </div>
							<div id="O68" class="cv" style="left: 124px; top: 47px;">O68 </div>
							<div id="O69" class="cv" style="left: 155px; top: 16px;">O69 </div>
							<div id="O6A" class="cv" style="left: 155px; top: 47px;">O6A </div>
							<div id="O6B" class="cv" style="left: 186px; top: 16px;">O6B </div>
							<div id="O6C" class="cv" style="left: 186px; top: 47px;">O6C </div>
							<div id="O51" class="cv cv5" style="left: 31px; top: 109px;">O51 </div>
							<div id="O52" class="cv cv5" style="left: 31px; top: 140px;">O52 </div>
							<div id="O53" class="cv cv5" style="left: 62px; top: 109px;">O53 </div>
							<div id="O54" class="cv cv5" style="left: 62px; top: 140px;">O54 </div>
							<div id="O55" class="cv cv5" style="left: 93px; top: 109px;">O55 </div>
							<div id="O56" class="cv cv5" style="left: 93px; top: 140px;">O56 </div>
							<div id="O57" class="cv cv5" style="left: 124px; top: 109px;">O57 </div>
							<div id="O58" class="cv cv5" style="left: 124px; top: 140px;">O58 </div>
							<div id="O59" class="cv cv5" style="left: 155px; top: 109px;">O59 </div>
							<div id="O5A" class="cv cv5" style="left: 155px; top: 140px;">O5A </div>
							<div id="O5B" class="cv cv5" style="left: 186px; top: 109px;">O5B </div>
							<div id="O5C" class="cv cv5" style="left: 186px; top: 140px;">O5C </div>
							<div id="O41" class="cv cv4" style="left: 31px; top: 202px;">O41 </div>
							<div id="O42" class="cv cv4" style="left: 31px; top: 233px;">O42 </div>
							<div id="O43" class="cv cv4" style="left: 62px; top: 202px;">O43 </div>
							<div id="O44" class="cv cv4" style="left: 62px; top: 233px;">O44 </div>
							<div id="O45" class="cv cv4" style="left: 93px; top: 202px;">O45 </div>
							<div id="O46" class="cv cv4" style="left: 93px; top: 233px;">O46 </div>
							<div id="O47" class="cv cv4" style="left: 124px; top: 202px;">O47 </div>
							<div id="O48" class="cv cv4" style="left: 124px; top: 233px;">O48 </div>
							<div id="O49" class="cv cv4" style="left: 155px; top: 202px;">O49 </div>
							<div id="O4A" class="cv cv4" style="left: 155px; top: 233px;">O4A </div>
							<div id="O4B" class="cv cv4" style="left: 186px; top: 202px;">O4B </div>
							<div id="O4C" class="cv cv4" style="left: 186px; top: 233px;">O4C </div>
							<div id="O31" class="cv cv3" style="left: 31px; top: 295px;">O31 </div>
							<div id="O32" class="cv cv3" style="left: 31px; top: 326px;">O32 </div>
							<div id="O33" class="cv cv3" style="left: 62px; top: 295px;">O33 </div>
							<div id="O34" class="cv cv3" style="left: 62px; top: 326px;">O34 </div>
							<div id="O35" class="cv cv3" style="left: 93px; top: 295px;">O35 </div>
							<div id="O36" class="cv cv3" style="left: 93px; top: 326px;">O36 </div>
							<div id="O37" class="cv cv3" style="left: 124px; top: 295px;">O37 </div>
							<div id="O38" class="cv cv3" style="left: 124px; top: 326px;">O38 </div>
							<div id="O39" class="cv cv3" style="left: 155px; top: 295px;">O39 </div>
							<div id="O3A" class="cv cv3" style="left: 155px; top: 326px;">O3A </div>
							<div id="O3B" class="cv cv3" style="left: 186px; top: 295px;">O3B </div>
							<div id="O3C" class="cv cv3" style="left: 186px; top: 326px;">O3C </div>
							<div id="O21" class="cv cv2" style="left: 31px; top: 388px;">O21 </div>
							<div id="O22" class="cv cv2" style="left: 31px; top: 419px;">O22 </div>
							<div id="O23" class="cv cv2" style="left: 62px; top: 388px;">O23 </div>
							<div id="O24" class="cv cv2" style="left: 62px; top: 419px;">O24 </div>
							<div id="O25" class="cv cv2" style="left: 93px; top: 388px;">O25 </div>
							<div id="O26" class="cv cv2" style="left: 93px; top: 419px;">O26 </div>
							<div id="O27" class="cv cv2" style="left: 124px; top: 388px;">O27 </div>
							<div id="O28" class="cv cv2" style="left: 124px; top: 419px;">O28 </div>
							<div id="O29" class="cv cv2" style="left: 155px; top: 388px;">O29 </div>
							<div id="O2A" class="cv cv2" style="left: 155px; top: 419px;">O2A </div>
							<div id="O2B" class="cv cv2" style="left: 186px; top: 388px;">O2B </div>
							<div id="O2C" class="cv cv2" style="left: 186px; top: 419px;">O2C </div>
							<div id="O11" class="cv cv1" style="left: 31px; top: 481px;">O11 </div>
							<div id="O12" class="cv cv1" style="left: 31px; top: 512px;">O12 </div>
							<div id="O13" class="cv cv1" style="left: 62px; top: 481px;">O13 </div>
							<div id="O14" class="cv cv1" style="left: 62px; top: 512px;">O14 </div>
							<div id="O15" class="cv cv1" style="left: 93px; top: 481px;">O15 </div>
							<div id="O16" class="cv cv1" style="left: 93px; top: 512px;">O16 </div>
							<div id="O17" class="cv cv1" style="left: 124px; top: 481px;">O17 </div>
							<div id="O18" class="cv cv1" style="left: 124px; top: 512px;">O18 </div>
							<div id="O19" class="cv cv1" style="left: 155px; top: 481px;">O19 </div>
							<div id="O1A" class="cv cv1" style="left: 155px; top: 512px;">O1A </div>
							<div id="O1B" class="cv cv1" style="left: 186px; top: 481px;">O1B </div>
							<div id="O1C" class="cv cv1" style="left: 186px; top: 512px;">O1C </div>
							<div id="A61" class="cv cv6" style="left: 279px; top: 16px;">A61 </div>
							<div id="A62" class="cv cv6" style="left: 279px; top: 47px;">A62 </div>
							<div id="A63" class="cv cv6" style="left: 310px; top: 16px;">A63 </div>
							<div id="A64" class="cv cv6" style="left: 310px; top: 47px;">A64 </div>
							<div id="A65" class="cv cv6" style="left: 341px; top: 16px;">A65 </div>
							<div id="A66" class="cv cv6" style="left: 341px; top: 47px;">A66 </div>
							<div id="A67" class="cv cv6" style="left: 372px; top: 16px;">A67 </div>
							<div id="A68" class="cv cv6" style="left: 372px; top: 47px;">A68 </div>
							<div id="A69" class="cv cv6" style="left: 403px; top: 16px;">A69 </div>
							<div id="A6A" class="cv cv6" style="left: 403px; top: 47px;">A6A </div>
							<div id="A6B" class="cv cv6" style="left: 434px; top: 16px;">A6B </div>
							<div id="A6C" class="cv cv6" style="left: 434px; top: 47px;">A6C </div>
							<div id="A51" class="cv cv5" style="left: 279px; top: 109px;">A51 </div>
							<div id="A52" class="cv cv5" style="left: 279px; top: 140px;">A52 </div>
							<div id="A53" class="cv cv5" style="left: 310px; top: 109px;">A53 </div>
							<div id="A54" class="cv cv5" style="left: 310px; top: 140px;">A54 </div>
							<div id="A55" class="cv cv5" style="left: 341px; top: 109px;">A55 </div>
							<div id="A56" class="cv cv5" style="left: 341px; top: 140px;">A56 </div>
							<div id="A57" class="cv cv5" style="left: 372px; top: 109px;">A57 </div>
							<div id="A58" class="cv cv5" style="left: 372px; top: 140px;">A58 </div>
							<div id="A59" class="cv cv5" style="left: 403px; top: 109px;">A59 </div>
							<div id="A5A" class="cv cv5" style="left: 403px; top: 140px;">A5A </div>
							<div id="A5B" class="cv cv5" style="left: 434px; top: 109px;">A5B </div>
							<div id="A5C" class="cv cv5" style="left: 434px; top: 140px;">A5C </div>
							<div id="A41" class="cv cv4" style="left: 279px; top: 202px;">A41 </div>
							<div id="A42" class="cv cv4" style="left: 279px; top: 233px;">A42 </div>
							<div id="A43" class="cv cv4" style="left: 310px; top: 202px;">A43 </div>
							<div id="A44" class="cv cv4" style="left: 310px; top: 233px;">A44 </div>
							<div id="A45" class="cv cv4" style="left: 341px; top: 202px;">A45 </div>
							<div id="A46" class="cv cv4" style="left: 341px; top: 233px;">A46 </div>
							<div id="A47" class="cv cv4" style="left: 372px; top: 202px;">A47 </div>
							<div id="A48" class="cv cv4" style="left: 372px; top: 233px;">A48 </div>
							<div id="A49" class="cv cv4" style="left: 403px; top: 202px;">A49 </div>
							<div id="A4A" class="cv cv4" style="left: 403px; top: 233px;">A4A </div>
							<div id="A4B" class="cv cv4" style="left: 434px; top: 202px;">A4B </div>
							<div id="A4C" class="cv cv4" style="left: 434px; top: 233px;">A4C </div>
							<div id="A31" class="cv cv3" style="left: 279px; top: 295px;">A31 </div>
							<div id="A32" class="cv cv3" style="left: 279px; top: 326px;">A32 </div>
							<div id="A33" class="cv cv3" style="left: 310px; top: 295px;">A33 </div>
							<div id="A34" class="cv cv3" style="left: 310px; top: 326px;">A34 </div>
							<div id="A35" class="cv cv3" style="left: 341px; top: 295px;">A35 </div>
							<div id="A36" class="cv cv3" style="left: 341px; top: 326px;">A36 </div>
							<div id="A37" class="cv cv3" style="left: 372px; top: 295px;">A37 </div>
							<div id="A38" class="cv cv3" style="left: 372px; top: 326px;">A38 </div>
							<div id="A39" class="cv cv3" style="left: 403px; top: 295px;">A39 </div>
							<div id="A3A" class="cv cv3" style="left: 403px; top: 326px;">A3A </div>
							<div id="A3B" class="cv cv3" style="left: 434px; top: 295px;">A3B </div>
							<div id="A3C" class="cv cv3" style="left: 434px; top: 326px;">A3C </div>
							<div id="A21" class="cv cv2" style="left: 279px; top: 388px;">A21 </div>
							<div id="A22" class="cv cv2" style="left: 279px; top: 419px;">A22 </div>
							<div id="A23" class="cv cv2" style="left: 310px; top: 388px;">A23 </div>
							<div id="A24" class="cv cv2" style="left: 310px; top: 419px;">A24 </div>
							<div id="A25" class="cv cv2" style="left: 341px; top: 388px;">A25 </div>
							<div id="A26" class="cv cv2" style="left: 341px; top: 419px;">A26 </div>
							<div id="A27" class="cv cv2" style="left: 372px; top: 388px;">A27 </div>
							<div id="A28" class="cv cv2" style="left: 372px; top: 419px;">A28 </div>
							<div id="A29" class="cv cv2" style="left: 403px; top: 388px;">A29 </div>
							<div id="A2A" class="cv cv2" style="left: 403px; top: 419px;">A2A </div>
							<div id="A2B" class="cv cv2" style="left: 434px; top: 388px;">A2B </div>
							<div id="A2C" class="cv cv2" style="left: 434px; top: 419px;">A2C </div>
							<div id="A11" class="cv cv1" style="left: 279px; top: 481px;">A11 </div>
							<div id="A12" class="cv cv1" style="left: 279px; top: 512px;">A12 </div>
							<div id="A13" class="cv cv1" style="left: 310px; top: 481px;">A13 </div>
							<div id="A14" class="cv cv1" style="left: 310px; top: 512px;">A14 </div>
							<div id="A15" class="cv cv1" style="left: 341px; top: 481px;">A15 </div>
							<div id="A16" class="cv cv1" style="left: 341px; top: 512px;">A16 </div>
							<div id="A17" class="cv cv1" style="left: 372px; top: 481px;">A17 </div>
							<div id="A18" class="cv cv1" style="left: 372px; top: 512px;">A18 </div>
							<div id="A19" class="cv cv1" style="left: 403px; top: 481px;">A19 </div>
							<div id="A1A" class="cv cv1" style="left: 403px; top: 512px;">A1A </div>
							<div id="A1B" class="cv cv1" style="left: 434px; top: 481px;">A1B </div>
							<div id="A1C" class="cv cv1" style="left: 434px; top: 512px;">A1C </div>
							<div id="B61" class="cv cv6" style="left: 527px; top: 16px;">B61 </div>
							<div id="B62" class="cv cv6" style="left: 527px; top: 47px;">B62 </div>
							<div id="B63" class="cv cv6" style="left: 558px; top: 16px;">B63 </div>
							<div id="B64" class="cv cv6" style="left: 558px; top: 47px;">B64 </div>
							<div id="B65" class="cv cv6" style="left: 589px; top: 16px;">B65 </div>
							<div id="B66" class="cv cv6" style="left: 589px; top: 47px;">B66 </div>
							<div id="B67" class="cv cv6" style="left: 620px; top: 16px;">B67 </div>
							<div id="B68" class="cv cv6" style="left: 620px; top: 47px;">B68 </div>
							<div id="B69" class="cv cv6" style="left: 651px; top: 16px;">B69 </div>
							<div id="B6A" class="cv cv6" style="left: 651px; top: 47px;">B6A </div>
							<div id="B6B" class="cv cv6" style="left: 682px; top: 16px;">B6B </div>
							<div id="B6C" class="cv cv6" style="left: 682px; top: 47px;">B6C </div>
							<div id="B51" class="cv cv5" style="left: 527px; top: 109px;">B51 </div>
							<div id="B52" class="cv cv5" style="left: 527px; top: 140px;">B52 </div>
							<div id="B53" class="cv cv5" style="left: 558px; top: 109px;">B53 </div>
							<div id="B54" class="cv cv5" style="left: 558px; top: 140px;">B54 </div>
							<div id="B55" class="cv cv5" style="left: 589px; top: 109px;">B55 </div>
							<div id="B56" class="cv cv5" style="left: 589px; top: 140px;">B56 </div>
							<div id="B57" class="cv cv5" style="left: 620px; top: 109px;">B57 </div>
							<div id="B58" class="cv cv5" style="left: 620px; top: 140px;">B58 </div>
							<div id="B59" class="cv cv5" style="left: 651px; top: 109px;">B59 </div>
							<div id="B5A" class="cv cv5" style="left: 651px; top: 140px;">B5A </div>
							<div id="B5B" class="cv cv5" style="left: 682px; top: 109px;">B5B </div>
							<div id="B5C" class="cv cv5" style="left: 682px; top: 140px;">B5C </div>
							<div id="B41" class="cv cv4" style="left: 527px; top: 202px;">B41 </div>
							<div id="B42" class="cv cv4" style="left: 527px; top: 233px;">B42 </div>
							<div id="B43" class="cv cv4" style="left: 558px; top: 202px;">B43 </div>
							<div id="B44" class="cv cv4" style="left: 558px; top: 233px;">B44 </div>
							<div id="B45" class="cv cv4" style="left: 589px; top: 202px;">B45 </div>
							<div id="B46" class="cv cv4" style="left: 589px; top: 233px;">B46 </div>
							<div id="B47" class="cv cv4" style="left: 620px; top: 202px;">B47 </div>
							<div id="B48" class="cv cv4" style="left: 620px; top: 233px;">B48 </div>
							<div id="B49" class="cv cv4" style="left: 651px; top: 202px;">B49 </div>
							<div id="B4A" class="cv cv4" style="left: 651px; top: 233px;">B4A </div>
							<div id="B4B" class="cv cv4" style="left: 682px; top: 202px;">B4B </div>
							<div id="B4C" class="cv cv4" style="left: 682px; top: 233px;">B4C </div>
							<div id="B31" class="cv cv3" style="left: 527px; top: 295px;">B31 </div>
							<div id="B32" class="cv cv3" style="left: 527px; top: 326px;">B32 </div>
							<div id="B33" class="cv cv3" style="left: 558px; top: 295px;">B33 </div>
							<div id="B34" class="cv cv3" style="left: 558px; top: 326px;">B34 </div>
							<div id="B35" class="cv cv3" style="left: 589px; top: 295px;">B35 </div>
							<div id="B36" class="cv cv3" style="left: 589px; top: 326px;">B36 </div>
							<div id="B37" class="cv cv3" style="left: 620px; top: 295px;">B37 </div>
							<div id="B38" class="cv cv3" style="left: 620px; top: 326px;">B38 </div>
							<div id="B39" class="cv cv3" style="left: 651px; top: 295px;">B39 </div>
							<div id="B3A" class="cv cv3" style="left: 651px; top: 326px;">B3A </div>
							<div id="B3B" class="cv cv3" style="left: 682px; top: 295px;">B3B </div>
							<div id="B3C" class="cv cv3" style="left: 682px; top: 326px;">B3C </div>
							<div id="B21" class="cv cv2" style="left: 527px; top: 388px;">B21 </div>
							<div id="B22" class="cv cv2" style="left: 527px; top: 419px;">B22 </div>
							<div id="B23" class="cv cv2" style="left: 558px; top: 388px;">B23 </div>
							<div id="B24" class="cv cv2" style="left: 558px; top: 419px;">B24 </div>
							<div id="B25" class="cv cv2" style="left: 589px; top: 388px;">B25 </div>
							<div id="B26" class="cv cv2" style="left: 589px; top: 419px;">B26 </div>
							<div id="B27" class="cv cv2" style="left: 620px; top: 388px;">B27 </div>
							<div id="B28" class="cv cv2" style="left: 620px; top: 419px;">B28 </div>
							<div id="B29" class="cv cv2" style="left: 651px; top: 388px;">B29 </div>
							<div id="B2A" class="cv cv2" style="left: 651px; top: 419px;">B2A </div>
							<div id="B2B" class="cv cv2" style="left: 682px; top: 388px;">B2B </div>
							<div id="B2C" class="cv cv2" style="left: 682px; top: 419px;">B2C </div>
							<div id="B11" class="cv cv1" style="left: 527px; top: 481px;">B11 </div>
							<div id="B12" class="cv cv1" style="left: 527px; top: 512px;">B12 </div>
							<div id="B13" class="cv cv1" style="left: 558px; top: 481px;">B13 </div>
							<div id="B14" class="cv cv1" style="left: 558px; top: 512px;">B14 </div>
							<div id="B15" class="cv cv1" style="left: 589px; top: 481px;">B15 </div>
							<div id="B16" class="cv cv1" style="left: 589px; top: 512px;">B16 </div>
							<div id="B17" class="cv cv1" style="left: 620px; top: 481px;">B17 </div>
							<div id="B18" class="cv cv1" style="left: 620px; top: 512px;">B18 </div>
							<div id="B19" class="cv cv1" style="left: 651px; top: 481px;">B19 </div>
							<div id="B1A" class="cv cv1" style="left: 651px; top: 512px;">B1A </div>
							<div id="B1B" class="cv cv1" style="left: 682px; top: 481px;">B1B </div>
							<div id="B1C" class="cv cv1" style="left: 682px; top: 512px;">B1C </div>
							<div id="C61" class="cv cv6" style="left: 775px; top: 16px;">C61 </div>
							<div id="C62" class="cv cv6" style="left: 775px; top: 47px;">C62 </div>
							<div id="C63" class="cv cv6" style="left: 806px; top: 16px;">C63 </div>
							<div id="C64" class="cv cv6" style="left: 806px; top: 47px;">C64 </div>
							<div id="C65" class="cv cv6" style="left: 837px; top: 16px;">C65 </div>
							<div id="C66" class="cv cv6" style="left: 837px; top: 47px;">C66 </div>
							<div id="C67" class="cv cv6" style="left: 868px; top: 16px;">C67 </div>
							<div id="C68" class="cv cv6" style="left: 868px; top: 47px;">C68 </div>
							<div id="C69" class="cv cv6" style="left: 899px; top: 16px;">C69 </div>
							<div id="C6A" class="cv cv6" style="left: 899px; top: 47px;">C6A </div>
							<div id="C6B" class="cv cv6" style="left: 930px; top: 16px;">C6B </div>
							<div id="C6C" class="cv cv6" style="left: 930px; top: 47px;">C6C </div>
							<div id="C51" class="cv cv5" style="left: 775px; top: 109px;">C51 </div>
							<div id="C52" class="cv cv5" style="left: 775px; top: 140px;">C52 </div>
							<div id="C53" class="cv cv5" style="left: 806px; top: 109px;">C53 </div>
							<div id="C54" class="cv cv5" style="left: 806px; top: 140px;">C54 </div>
							<div id="C55" class="cv cv5" style="left: 837px; top: 109px;">C55 </div>
							<div id="C56" class="cv cv5" style="left: 837px; top: 140px;">C56 </div>
							<div id="C57" class="cv cv5" style="left: 868px; top: 109px;">C57 </div>
							<div id="C58" class="cv cv5" style="left: 868px; top: 140px;">C58 </div>
							<div id="C59" class="cv cv5" style="left: 899px; top: 109px;">C59 </div>
							<div id="C5A" class="cv cv5" style="left: 899px; top: 140px;">C5A </div>
							<div id="C5B" class="cv cv5" style="left: 930px; top: 109px;">C5B </div>
							<div id="C5C" class="cv cv5" style="left: 930px; top: 140px;">C5C </div>
							<div id="C41" class="cv cv4" style="left: 775px; top: 202px;">C41 </div>
							<div id="C42" class="cv cv4" style="left: 775px; top: 233px;">C42 </div>
							<div id="C43" class="cv cv4" style="left: 806px; top: 202px;">C43 </div>
							<div id="C44" class="cv cv4" style="left: 806px; top: 233px;">C44 </div>
							<div id="C45" class="cv cv4" style="left: 837px; top: 202px;">C45 </div>
							<div id="C46" class="cv cv4" style="left: 837px; top: 233px;">C46 </div>
							<div id="C47" class="cv cv4" style="left: 868px; top: 202px;">C47 </div>
							<div id="C48" class="cv cv4" style="left: 868px; top: 233px;">C48 </div>
							<div id="C49" class="cv cv4" style="left: 899px; top: 202px;">C49 </div>
							<div id="C4A" class="cv cv4" style="left: 899px; top: 233px;">C4A </div>
							<div id="C4B" class="cv cv4" style="left: 930px; top: 202px;">C4B </div>
							<div id="C4C" class="cv cv4" style="left: 930px; top: 233px;">C4C </div>
							<div id="C31" class="cv cv3" style="left: 775px; top: 295px;">C31 </div>
							<div id="C32" class="cv cv3" style="left: 775px; top: 326px;">C32 </div>
							<div id="C33" class="cv cv3" style="left: 806px; top: 295px;">C33 </div>
							<div id="C34" class="cv cv3" style="left: 806px; top: 326px;">C34 </div>
							<div id="C35" class="cv cv3" style="left: 837px; top: 295px;">C35 </div>
							<div id="C36" class="cv cv3" style="left: 837px; top: 326px;">C36 </div>
							<div id="C37" class="cv cv3" style="left: 868px; top: 295px;">C37 </div>
							<div id="C38" class="cv cv3" style="left: 868px; top: 326px;">C38 </div>
							<div id="C39" class="cv cv3" style="left: 899px; top: 295px;">C39 </div>
							<div id="C3A" class="cv cv3" style="left: 899px; top: 326px;">C3A </div>
							<div id="C3B" class="cv cv3" style="left: 930px; top: 295px;">C3B </div>
							<div id="C3C" class="cv cv3" style="left: 930px; top: 326px;">C3C </div>
							<div id="C21" class="cv cv2" style="left: 775px; top: 388px;">C21 </div>
							<div id="C22" class="cv cv2" style="left: 775px; top: 419px;">C22 </div>
							<div id="C23" class="cv cv2" style="left: 806px; top: 388px;">C23 </div>
							<div id="C24" class="cv cv2" style="left: 806px; top: 419px;">C24 </div>
							<div id="C25" class="cv cv2" style="left: 837px; top: 388px;">C25 </div>
							<div id="C26" class="cv cv2" style="left: 837px; top: 419px;">C26 </div>
							<div id="C27" class="cv cv2" style="left: 868px; top: 388px;">C27 </div>
							<div id="C28" class="cv cv2" style="left: 868px; top: 419px;">C28 </div>
							<div id="C29" class="cv cv2" style="left: 899px; top: 388px;">C29 </div>
							<div id="C2A" class="cv cv2" style="left: 899px; top: 419px;">C2A </div>
							<div id="C2B" class="cv cv2" style="left: 930px; top: 388px;">C2B </div>
							<div id="C2C" class="cv cv2" style="left: 930px; top: 419px;">C2C </div>
							<div id="C11" class="cv cv1" style="left: 775px; top: 481px;">C11 </div>
							<div id="C12" class="cv cv1" style="left: 775px; top: 512px;">C12 </div>
							<div id="C13" class="cv cv1" style="left: 806px; top: 481px;">C13 </div>
							<div id="C14" class="cv cv1" style="left: 806px; top: 512px;">C14 </div>
							<div id="C15" class="cv cv1" style="left: 837px; top: 481px;">C15 </div>
							<div id="C16" class="cv cv1" style="left: 837px; top: 512px;">C16 </div>
							<div id="C17" class="cv cv1" style="left: 868px; top: 481px;">C17 </div>
							<div id="C18" class="cv cv1" style="left: 868px; top: 512px;">C18 </div>
							<div id="C19" class="cv cv1" style="left: 899px; top: 481px;">C19 </div>
							<div id="C1A" class="cv cv1" style="left: 899px; top: 512px;">C1A </div>
							<div id="C1B" class="cv cv1" style="left: 930px; top: 481px;">C1B </div>
							<div id="C1C" class="cv cv1" style="left: 930px; top: 512px;">C1C </div>
							<div id="D61" class="cv cv6" style="left: 1023px; top: 16px;">D61 </div>
							<div id="D62" class="cv cv6" style="left: 1023px; top: 47px;">D62 </div>
							<div id="D63" class="cv cv6" style="left: 1054px; top: 16px;">D63 </div>
							<div id="D64" class="cv cv6" style="left: 1054px; top: 47px;">D64 </div>
							<div id="D65" class="cv cv6" style="left: 1085px; top: 16px;">D65 </div>
							<div id="D66" class="cv cv6" style="left: 1085px; top: 47px;">D66 </div>
							<div id="D67" class="cv cv6" style="left: 1116px; top: 16px;">D67 </div>
							<div id="D68" class="cv cv6" style="left: 1116px; top: 47px;">D68 </div>
							<div id="D69" class="cv cv6" style="left: 1147px; top: 16px;">D69 </div>
							<div id="D6A" class="cv cv6" style="left: 1147px; top: 47px;">D6A </div>
							<div id="D6B" class="cv cv6" style="left: 1178px; top: 16px;">D6B </div>
							<div id="D6C" class="cv cv6" style="left: 1178px; top: 47px;">D6C </div>
							<div id="D51" class="cv cv5" style="left: 1023px; top: 109px;" >D51 </div>
							<div id="D52" class="cv cv5" style="left: 1023px; top: 140px;" >D52 </div>
							<div id="D53" class="cv cv5" style="left: 1054px; top: 109px;" >D53 </div>
							<div id="D54" class="cv cv5" style="left: 1054px; top: 140px;" >D54 </div>
							<div id="D55" class="cv cv5" style="left: 1085px; top: 109px;" >D55 </div>
							<div id="D56" class="cv cv5" style="left: 1085px; top: 140px;" >D56 </div>
							<div id="D57" class="cv cv5" style="left: 1116px; top: 109px;" >D57 </div>
							<div id="D58" class="cv cv5" style="left: 1116px; top: 140px;" >D58 </div>
							<div id="D59" class="cv cv5" style="left: 1147px; top: 109px;" >D59 </div>
							<div id="D5A" class="cv cv5" style="left: 1147px; top: 140px;" >D5A </div>
							<div id="D5B" class="cv cv5" style="left: 1178px; top: 109px;" >D5B </div>
							<div id="D5C" class="cv cv5" style="left: 1178px; top: 140px;" >D5C </div>
							<div id="D41" class="cv cv4" style="left: 1023px; top: 202px;" >D41 </div>
							<div id="D42" class="cv cv4" style="left: 1023px; top: 233px;" >D42 </div>
							<div id="D43" class="cv cv4" style="left: 1054px; top: 202px;" >D43 </div>
							<div id="D44" class="cv cv4" style="left: 1054px; top: 233px;" >D44 </div>
							<div id="D45" class="cv cv4" style="left: 1085px; top: 202px;" >D45 </div>
							<div id="D46" class="cv cv4" style="left: 1085px; top: 233px;" >D46 </div>
							<div id="D47" class="cv cv4" style="left: 1116px; top: 202px;" >D47 </div>
							<div id="D48" class="cv cv4" style="left: 1116px; top: 233px;" >D48 </div>
							<div id="D49" class="cv cv4" style="left: 1147px; top: 202px;" >D49 </div>
							<div id="D4A" class="cv cv4" style="left: 1147px; top: 233px;" >D4A </div>
							<div id="D4B" class="cv cv4" style="left: 1178px; top: 202px;" >D4B </div>
							<div id="D4C" class="cv cv4" style="left: 1178px; top: 233px;" >D4C </div>
							<div id="D31" class="cv cv3" style="left: 1023px; top: 295px;" >D31 </div>
							<div id="D32" class="cv cv3" style="left: 1023px; top: 326px;" >D32 </div>
							<div id="D33" class="cv cv3" style="left: 1054px; top: 295px;" >D33 </div>
							<div id="D34" class="cv cv3" style="left: 1054px; top: 326px;" >D34 </div>
							<div id="D35" class="cv cv3" style="left: 1085px; top: 295px;" >D35 </div>
							<div id="D36" class="cv cv3" style="left: 1085px; top: 326px;" >D36 </div>
							<div id="D37" class="cv cv3" style="left: 1116px; top: 295px;" >D37 </div>
							<div id="D38" class="cv cv3" style="left: 1116px; top: 326px;" >D38 </div>
							<div id="D39" class="cv cv3" style="left: 1147px; top: 295px;" >D39 </div>
							<div id="D3A" class="cv cv3" style="left: 1147px; top: 326px;" >D3A </div>
							<div id="D3B" class="cv cv3" style="left: 1178px; top: 295px;" >D3B </div>
							<div id="D3C" class="cv cv3" style="left: 1178px; top: 326px;" >D3C </div>
							<div id="D21" class="cv cv2" style="left: 1023px; top: 388px;" >D21 </div>
							<div id="D22" class="cv cv2" style="left: 1023px; top: 419px;" >D22 </div>
							<div id="D23" class="cv cv2" style="left: 1054px; top: 388px;" >D23 </div>
							<div id="D24" class="cv cv2" style="left: 1054px; top: 419px;" >D24 </div>
							<div id="D25" class="cv cv2" style="left: 1085px; top: 388px;" >D25 </div>
							<div id="D26" class="cv cv2" style="left: 1085px; top: 419px;" >D26 </div>
							<div id="D27" class="cv cv2" style="left: 1116px; top: 388px;" >D27 </div>
							<div id="D28" class="cv cv2" style="left: 1116px; top: 419px;" >D28 </div>
							<div id="D29" class="cv cv2" style="left: 1147px; top: 388px;" >D29 </div>
							<div id="D2A" class="cv cv2" style="left: 1147px; top: 419px;" >D2A </div>
							<div id="D2B" class="cv cv2" style="left: 1178px; top: 388px;" >D2B </div>
							<div id="D2C" class="cv cv2" style="left: 1178px; top: 419px;" >D2C </div>
							<div id="D11" class="cv cv1" style="left: 1023px; top: 481px;" >D11 </div>
							<div id="D12" class="cv cv1" style="left: 1023px; top: 512px;" >D12 </div>
							<div id="D13" class="cv cv1" style="left: 1054px; top: 481px;" >D13 </div>
							<div id="D14" class="cv cv1" style="left: 1054px; top: 512px;" >D14 </div>
							<div id="D15" class="cv cv1" style="left: 1085px; top: 481px;" >D15 </div>
							<div id="D16" class="cv cv1" style="left: 1085px; top: 512px;" >D16 </div>
							<div id="D17" class="cv cv1" style="left: 1116px; top: 481px;" >D17 </div>
							<div id="D18" class="cv cv1" style="left: 1116px; top: 512px;" >D18 </div>
							<div id="D19" class="cv cv1" style="left: 1147px; top: 481px;" >D19 </div>
							<div id="D1A" class="cv cv1" style="left: 1147px; top: 512px;" >D1A </div>
							<div id="D1B" class="cv cv1" style="left: 1178px; top: 481px;" >D1B </div>
							<div id="D1C" class="cv cv1" style="left: 1178px; top: 512px;" >D1C </div>

							<div id="c61" class="cv cv6" style="left: 1271px; top: 16px;">c61 </div>
							<div id="c62" class="cv cv6" style="left: 1271px; top: 47px;">c62 </div>
							<div id="c63" class="cv cv6" style="left: 1302px; top: 16px;">c63 </div>
							<div id="c64" class="cv cv6" style="left: 1302px; top: 47px;">c64 </div>

							<div id="c51" class="cv cv5" style="left: 1271px; top: 109px;" >c51 </div>
							<div id="c52" class="cv cv5" style="left: 1271px; top: 140px;" >c52 </div>
							<div id="c53" class="cv cv5" style="left: 1302px; top: 109px;" >c53 </div>
							<div id="c54" class="cv cv5" style="left: 1302px; top: 140px;" >c54 </div>
							<div id="c55" class="cv cv5" style="left: 1333px; top: 109px;" >c55 </div>
							<div id="c56" class="cv cv5" style="left: 1333px; top: 140px;" >c56 </div>
							<div id="c57" class="cv cv5" style="left: 1364px; top: 109px;" >c57 </div>
							<div id="c58" class="cv cv5" style="left: 1364px; top: 140px;" >c58 </div>
							<div id="c59" class="cv cv5" style="left: 1395px; top: 109px;" >c59 </div>
							<div id="c5A" class="cv cv5" style="left: 1395px; top: 140px;" >c5A </div>
							<div id="c5B" class="cv cv5" style="left: 1426px; top: 109px;" >c5B </div>
							<div id="c5C" class="cv cv5" style="left: 1426px; top: 140px;" >c5C </div>
							<div id="c41" class="cv cv4" style="left: 1271px; top: 202px;" >c41 </div>
							<div id="c42" class="cv cv4" style="left: 1271px; top: 233px;" >c42 </div>
							<div id="c43" class="cv cv4" style="left: 1302px; top: 202px;" >c43 </div>
							<div id="c44" class="cv cv4" style="left: 1302px; top: 233px;" >c44 </div>
							<div id="c45" class="cv cv4" style="left: 1333px; top: 202px;" >c45 </div>
							<div id="c46" class="cv cv4" style="left: 1333px; top: 233px;" >c46 </div>
							<div id="c47" class="cv cv4" style="left: 1364px; top: 202px;" >c47 </div>
							<div id="c48" class="cv cv4" style="left: 1364px; top: 233px;" >c48 </div>
							<div id="c49" class="cv cv4" style="left: 1395px; top: 202px;" >c49 </div>
							<div id="c4A" class="cv cv4" style="left: 1395px; top: 233px;" >c4A </div>
							<div id="c4B" class="cv cv4" style="left: 1426px; top: 202px;" >c4B </div>
							<div id="c4C" class="cv cv4" style="left: 1426px; top: 233px;" >c4C </div>
							<div id="c31" class="cv cv3" style="left: 1271px; top: 295px;" >c31 </div>
							<div id="c32" class="cv cv3" style="left: 1271px; top: 326px;" >c32 </div>
							<div id="c33" class="cv cv3" style="left: 1302px; top: 295px;" >c33 </div>
							<div id="c34" class="cv cv3" style="left: 1302px; top: 326px;" >c34 </div>
							<div id="c35" class="cv cv3" style="left: 1333px; top: 295px;" >c35 </div>
							<div id="c36" class="cv cv3" style="left: 1333px; top: 326px;" >c36 </div>
							<div id="c37" class="cv cv3" style="left: 1364px; top: 295px;" >c37 </div>
							<div id="c38" class="cv cv3" style="left: 1364px; top: 326px;" >c38 </div>
							<div id="c39" class="cv cv3" style="left: 1395px; top: 295px;" >c39 </div>
							<div id="c3A" class="cv cv3" style="left: 1395px; top: 326px;" >c3A </div>
							<div id="c3B" class="cv cv3" style="left: 1426px; top: 295px;" >c3B </div>
							<div id="c3C" class="cv cv3" style="left: 1426px; top: 326px;" >c3C </div>
							<div id="c21" class="cv cv2" style="left: 1271px; top: 388px;" >c21 </div>
							<div id="c22" class="cv cv2" style="left: 1271px; top: 419px;" >c22 </div>
							<div id="c23" class="cv cv2" style="left: 1302px; top: 388px;" >c23 </div>
							<div id="c24" class="cv cv2" style="left: 1302px; top: 419px;" >c24 </div>
							<div id="c25" class="cv cv2" style="left: 1333px; top: 388px;" >c25 </div>
							<div id="c26" class="cv cv2" style="left: 1333px; top: 419px;" >c26 </div>
							<div id="c27" class="cv cv2" style="left: 1364px; top: 388px;" >c27 </div>
							<div id="c28" class="cv cv2" style="left: 1364px; top: 419px;" >c28 </div>
							<div id="c29" class="cv cv2" style="left: 1395px; top: 388px;" >c29 </div>
							<div id="c2A" class="cv cv2" style="left: 1395px; top: 419px;" >c2A </div>
							<div id="c2B" class="cv cv2" style="left: 1426px; top: 388px;" >c2B </div>
							<div id="c2C" class="cv cv2" style="left: 1426px; top: 419px;" >c2C </div>
							<div id="c11" class="cv cv1" style="left: 1271px; top: 481px;" >c11 </div>
							<div id="c12" class="cv cv1" style="left: 1271px; top: 512px;" >c12 </div>
							<div id="c13" class="cv cv1" style="left: 1302px; top: 481px;" >c13 </div>
							<div id="c14" class="cv cv1" style="left: 1302px; top: 512px;" >c14 </div>
							<div id="c15" class="cv cv1" style="left: 1333px; top: 481px;" >c15 </div>
							<div id="c16" class="cv cv1" style="left: 1333px; top: 512px;" >c16 </div>
							<div id="c17" class="cv cv1" style="left: 1364px; top: 481px;" >c17 </div>
							<div id="c18" class="cv cv1" style="left: 1364px; top: 512px;" >c18 </div>
							<div id="c19" class="cv cv1" style="left: 1395px; top: 481px;" >c19 </div>
							<div id="c1A" class="cv cv1" style="left: 1395px; top: 512px;" >c1A </div>
							<div id="c1B" class="cv cv1" style="left: 1426px; top: 481px;" >c1B </div>
							<div id="c1C" class="cv cv1" style="left: 1426px; top: 512px;" >c1C </div>
							<div id="c1C" class="cv cv1" style="left: 1426px; top: 512px;" >c1C </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<footer>
		</footer>
{/block}

