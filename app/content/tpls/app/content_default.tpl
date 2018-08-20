{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="margin-bottom:0px;">
				<div class="col-xs-12">
					<ol class="breadcrumb">
						<li><a href="index.php">首页</a></li>
						<li class="active"><a href="index.php?content-app-category&catid={x2;$cat['catid']}">{x2;$cat['catname']}</a></li>
					</ol>
				</div>
			</div>
			<div class="box itembox" style="padding-top:20px;">
				<div class="col-xs-12">
					<h2 class="text-center">{x2;$content['contenttitle']}</h2>
					<hr/>
                    {x2;if:$content['contentdescribe']}<blockquote>{x2;$content['contentdescribe']}</blockquote>{x2;endif}
				</div>
				<div class="col-xs-12" id="content">
                    {x2;realhtml:$content['contenttext']}
				</div>
				<div class="col-xs-12">
					<hr/>
					<p>
						<span class="pull-right">
							<a href=""><span class="glyphicon glyphicon-time"></span> <span>{x2;date:$content['contentinputtime'],'Y-m-d H:i:s'}</span></a>&nbsp;&nbsp;
						</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>