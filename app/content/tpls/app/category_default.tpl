{x2;include:header}
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="pages">
            {x2;include:nav}
			<div class="content">
				<div class="col-xs-3">
					<div class="content-box padding">
						<h2 class="title">分类导航</h2>
						<ul class="list-unstyled list-txt">
                            {x2;tree:$catbrother,cat,cid}
							<li class="border{x2;if:v:cat['catid'] == $cat['catid']} active{x2;endif}">
								<a href="index.php?content-app-category&catid={x2;v:cat['catid']}">{x2;v:cat['catname']}</a>
							</li>
                            {x2;endif}
						</ul>
					</div>
				</div>
				<div class="col-xs-9 nopadding">
					<div class="content-box padding">
						<h2 class="title">
                            {x2;$cat['catname']}
							<a href="index.php?content-app" class="badge pull-right">回首页</a>
						</h2>
						<ul class="list-unstyled list-img">
                            {x2;tree:$contents['data'],content,cid}
							<li class="border morepadding">
								<h4 class="shorttitle">{x2;v:content['contenttitle']}</h4>
								<div class="intro">
									<div class="col-xs-3 img">
										<img src="{x2;v:content['contentthumb']}" />
									</div>
									<div class="desc">
										<p>{x2;v:content['contentdescribe']}</p>
										<p class="toolbar">
                                            {x2;date:v:content['contentinputtime'],'Y-m-d'}
											【 {x2;$categories[v:content['contentcatid']]['catname']} 】
											<a href="index.php?content-app-content&contentid={x2;v:content['contentid']}" class="btn btn-info pull-right more">查看详情</a>
										</p>
									</div>
								</div>
							</li>
                            {x2;endtree}
                            {x2;if:$contents['pages']}
							<li class="border morepadding">
								<ul class="pagination pull-right">
                                    {x2;$contents['pages']}
								</ul>
							</li>
                            {x2;endif}
						</ul>
					</div>
				</div>
			</div>
            {x2;include:footer}
		</div>
	</div>
</div>
</body>
</html>