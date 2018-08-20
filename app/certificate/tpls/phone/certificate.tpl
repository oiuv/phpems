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
					申请新证书
					<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
				</h5>
			</header>
			<div class="container-fluid">
				{x2;tree:$certificates['data'],certificate,cid}
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:0.8rem 0.2rem;">
					<div class="col-xs-4">
						<a href="index.php?certificate-phone-certificate-apply&ceid={x2;v:certificate['ceid']}" class="ajax" data-target="certificate" data-page="certificate">
							<img src="{x2;v:certificate['cethumb']}" style="width:10rem;margin-top:0.5rem"/>
						</a>
					</div>
					<div class="col-xs-8" style="padding:0.2rem;">
						<div class="text-left" style="padding:0.2rem;">
							<a href="index.php?certificate-phone-certificate-apply&ceid={x2;v:certificate['ceid']}" class="ajax" data-target="certificate" data-page="certificate">
								<h5>{x2;v:certificate['cetitle']}</h5>
								<p style="font-size:1rem;">
									<button class="btn btn-primary">申请 （{x2;v:certificate['ceprice']}积分）</button>
								</p>
							</a>
						</div>
					</div>
				</div>
				{x2;endtree}
				<ul class="pagination pull-right">
                    {x2;$certificates['pages']}
				</ul>
			</div>
			{x2;include:footer}
		</div>
	{x2;if:!$userhash}
    </div>
</div>
</body>
</html>
{x2;endif}