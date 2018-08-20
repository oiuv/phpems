{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="margin-top:10px;">
				<ul class="list-group">
					<li class="list-group-item active">
						我的证书
					</li>
					<li class="list-group-item">
						<a href="index.php?certificate-app-certificate">申请证书</a>
					</li>
				</ul>
			</div>
			<div class="col-xs-10">
				<div class="box itembox" style="margin-bottom:0px;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php">首页</a></li>
							<li><a href="index.php?certificate">办理证书</a></li>
							<li class="active">我的证书</li>
						</ol>
					</div>
				</div>
				{x2;tree:$certificates['data'],certificate,cid}
				<div class="box itembox" style="padding-top:20px;">
					<div class="col-xs-3">
						<a href="javascript:;" class="thumbnail pull-left">
							<img src="{x2;v:certificate['cethumb']}" alt="" width="100%">
						</a>
					</div>
					<div class="col-xs-9">
						<h4 class="title">{x2;v:certificate['cetitle']}</h4>
						<p>{x2;realsubstring:v:certificate['cedescribe'],240}</p>
						<hr/>
						<p>
							<span>
								<button class="btn{x2;if:v:certificate['ceqstatus'] == 3} btn-danger{x2;elseif:v:certificate['ceqstatus'] == 2} btn-success{x2;else} btn-primary{x2;endif}">{x2;$status[v:certificate['ceqstatus']]}</button>
							</span>
							<span class="pull-right">
								<span class="glyphicon glyphicon-time"></span> <span>申请时间：{x2;date:v:certificate['ceqtime'],'Y-m-d H:i:s'}</span>
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