{x2;include:header}
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="pages">
            {x2;include:nav}
			<div class="content">
				<div class="col-xs-9">
					<div class="content-box padding">
						<h2 class="title">证书列表</h2>
						<ul class="list-unstyled list-img">
							{x2;tree:$certificates['data'],certificate,cid}
							<li class="border morepadding">
								<h4 class="shorttitle">{x2;v:certificate['cetitle']}</h4>
								<div class="intro">
									<div class="col-xs-3 img">
										<img src="{x2;v:certificate['cethumb']}" />
									</div>
									<div class="desc">
										<p>{x2;v:certificate['cedescribe']}</p>
										<p class="toolbar">
											创建时间：{x2;date:v:certificate['cetime'],'Y-m-d H:i:s'}
											<a href="index.php?certificate-app-certificate-apply&ceid={x2;v:certificate['ceid']}" class="btn btn-info pull-right more">去申请</a>
										</p>
									</div>
								</div>
							</li>
							{x2;endtree}
							{x2;if:$certificates['pages']}
							<li class="border morepadding">
								<ul class="pagination pull-right">
									{x2;$certificates['pages']}
								</ul>
							</li>
							{x2;endif}
						</ul>
					</div>
				</div>
				<div class="col-xs-3 nopadding">
					<div class="content-box padding">
						<h2 class="title">推荐证书<a href="index.php?certificate-app" class="badge pull-right">我的证书 </a> </h2>
						<ul class="list-unstyled list-img">
                            {x2;tree:$news,content,cid}
							<li class="border padding">
								<a href="index.php?course-app-course&csid={x2;v:content['csid']}">
									<div class="intro">
										<div class="col-xs-5 img noleftpadding">
											<img src="{x2;if:v:content['csthumb']}{x2;v:content['csthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" />
										</div>
										<div class="desc">
											<p>{x2;v:content['cstitle']}</p>
										</div>
									</div>
								</a>
							</li>
                            {x2;endtree}
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