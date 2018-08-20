{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="margin-top:10px;">
				<ul class="list-group">
					{x2;tree:$catbrother,cat,cid}
					<li class="list-group-item{x2;if:$cat['catid'] == v:cat['catid']} active{x2;endif}">
						{x2;if:$cat['catid'] == v:cat['catid']}
						{x2;v:cat['catname']}
						{x2;else}
						<a href="index.php?content-app-category&catid={x2;v:cat['catid']}">{x2;v:cat['catname']}</a>
						{x2;endif}
					</li>
					{x2;endif}
					{x2;if:$cat['catparent']}
					<li class="list-group-item">
						<a href="index.php?content-app-category&catid={x2;$cat['catparent']}">返回</a>
					</li>
					{x2;endif}
				</ul>
			</div>
			<div class="col-xs-10">
				<div class="box itembox" style="margin-bottom:0px;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php">首页</a></li>
							<li><a href="index.php?content">新闻</a></li>
						  	{x2;tree:$catbread,cb,cbid}
							<li><a href="index.php?content-app-category&catid={x2;v:cb['catid']}">{x2;v:cb['catname']}</a> <span class="divider">/</span></li>
							{x2;endtree}
							<li class="active">{x2;$cat['catname']}</li>
						</ol>
					</div>
				</div>
				{x2;tree:$contents['data'],content,cid}
				<div class="box itembox" style="padding-top:20px;">
					<div class="col-xs-3">
						<a href="index.php?content-app-content&contentid={x2;v:content['contentid']}" class="thumbnail pull-left">
							<img src="{x2;v:content['contentthumb']}" alt="" width="100%">
						</a>
					</div>
					<div class="col-xs-9">
						<a href="index.php?content-app-content&contentid={x2;v:content['contentid']}"><h4 class="title">{x2;v:content['contenttitle']}</h4></a>
						<p>{x2;v:content['contentdescribe']}</p>
						<hr/>
						<p>
							<span class="pull-right">
								<a href=""><span class="glyphicon glyphicon-time"></span> <span>{x2;date:v:content['contentinputtime'],'Y-m-d H:i:s'}</span></a>&nbsp;&nbsp;
							</span>
						</p>
					</div>
				</div>
				{x2;endtree}
				<ul class="pagination pull-right">
					{x2;$contents['pages']}
				</ul>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>