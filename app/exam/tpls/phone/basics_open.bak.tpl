{x2;if:!$userhash}
{x2;include:header}
<body>
<div id="content">
	<div class="pages" id="basic">
{x2;endif}
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onClick="javascript:$.goPrePage();"></em>
				题库列表
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onClick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem">
				<div class="col-xs-12" style="padding-top:0.5rem;">
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						{x2;tree:$basics,basics,bid}
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="openbasicsheading_{x2;v:key}">
							  <h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne_{x2;v:key}" aria-expanded="true" aria-controls="collapseOne_{x2;v:key}">
								{x2;$areas[v:key]['area']}
								</a>
							  </h4>
							</div>
							<div id="collapseOne_{x2;v:key}" class="panel-collapse collapse{x2;if:v:bid == 1} in{x2;endif}" role="tabpanel" aria-labelledby="openbasicsheading_{x2;v:key}">
								<div class="panel-body">
									{x2;tree:v:basics['data'],basic,bcid}
									{x2;if:v:bcid > 1}<hr style="margin:0.6rem 0rem;" />{x2;endif}
									<a href="index.php?exam-phone-basics-detail&basicid={x2;v:basic['basicid']}" class="ajax" data-page="basic" data-target="basic">
										{x2;v:basic['basic']}
										{x2;if:$data['openbasics'][v:basic['basicid']]}
										<b class="badge pull-right" style="font-size:1rem;">已开通</b>
										{x2;elseif:v:basic['basicdemo']}
										<b class="badge pull-right" style="font-size:1rem;">免费</b>
										{x2;endif}
									</a>
									{x2;endtree}
								</div>
							</div>
						</div>
						{x2;endtree}
					</div>
				</div>
			</div>
		</div>
		{x2;include:footer}
		{x2;if:!$userhash}
    </div>
</div>
</body>
</html>
{x2;endif}