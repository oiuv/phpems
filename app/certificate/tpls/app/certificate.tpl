{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="margin-top:10px;">
				<ul class="list-group">
					<li class="list-group-item">
						<a href="index.php?certificate-app">我的证书</a>
					</li>
					<li class="list-group-item active">
						申请证书
					</li>
				</ul>
			</div>
			<div class="col-xs-10">
				<div class="box itembox" style="margin-bottom:0px;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php">首页</a></li>
							<li><a href="index.php?certificate">办理证书</a></li>
							<li class="active">申请证书</li>
						</ol>
					</div>
				</div>
				{x2;tree:$certificates['data'],certificate,cid}
				<div class="box itembox" style="padding-top:20px;">
					<div class="col-xs-3">
						<a href="index.php?certificate-app-certificate-apply&ceid={x2;v:certificate['ceid']}" class="thumbnail pull-left">
							<img src="{x2;v:certificate['cethumb']}" alt="" width="100%">
						</a>
					</div>
					<div class="col-xs-9">
						<a href="index.php?certificate-app-certificate-apply&ceid={x2;v:certificate['ceid']}"><h4 class="title">{x2;v:certificate['cetitle']}</h4></a>
						<p>{x2;realsubstring:v:certificate['cedescribe'],240}</p>
						<hr/>
						<p>
							<span>
								<a class="btn btn-primary" href="index.php?certificate-app-certificate-apply&ceid={x2;v:certificate['ceid']}">申请 （{x2;v:certificate['ceprice']}积分）</a>
							</span>
							<span class="pull-right">
								<a href="index.php?certificate-app-certificate-apply&ceid={x2;v:certificate['ceid']}"><span class="glyphicon glyphicon-time"></span> <span>{x2;date:v:certificate['cetime'],'Y-m-d H:i:s'}</span></a>&nbsp;&nbsp;
							</span>
						</p>
					</div>
				</div>
				{x2;endtree}
				<ul class="pagination pull-right">
					{x2;$certificates['pages']}
				</ul>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>