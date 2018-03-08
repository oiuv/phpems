{x2;if:!$userhash}
{x2;include:header}
<body>
<div id="content">
	<div class="pages" id="page1">
{x2;endif}
		<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				我的考场
				<a style="font-size:2rem;color:#FFFFFF;" class="pull-right glyphicon glyphicon-plus ajax" href="index.php?exam-phone-basics-open" data-target="page2" data-page="page2"></a>
			</h5>
		</header>
		<div class="container-fluid">
			{x2;tree:$basics,basic,bid}
			<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:0.8rem 0.2rem;">
				<div class="col-xs-4">
					<a data-markPrepage="no" href="index.php?{x2;$_app}-phone-index-setCurrentBasic&basicid={x2;v:basic['basicid']}" class="ajax" data-page="basic" data-target="basic"><img src="{x2;if:v:basic['basicthumb']}{x2;v:basic['basicthumb']}{x2;else}app/exam/styles/image/paper.png{x2;endif}" style="width:10rem;margin-top:0.5rem"/></a>
				</div>
				<div class="col-xs-8" style="padding:0.2rem;">
					<div class="text-left" style="padding:0.2rem;">
						<a data-markPrepage="no" href="index.php?{x2;$_app}-phone-index-setCurrentBasic&basicid={x2;v:basic['basicid']}" class="ajax" data-page="basic" data-target="basic">
							<h5>{x2;v:basic['basic']}</h5>
							<p style="font-size:1rem;">{x2;v:basic['basicdescribe']}</p>
						</a>
					</div>
				</div>
			</div>
			{x2;endtree}
		</div>
		{x2;include:footer}
		</div>
	{x2;if:!$userhash}
    </div>
</div>
</body>
</html>
{x2;endif}