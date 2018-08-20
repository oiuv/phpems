{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding:0px 0px;">
				<div class="box itembox list-group" style="width: 200px;padding:0px;top:0px;" data-spy="affix" data-offset-top="150" id="lemma"></div>
			</div>
			<div class="col-xs-10" style="padding:0px 0px 20px 10px;">
				<div class="box itembox" style="margin-bottom:0px;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php">首页</a></li>
							<li><a href="index.php?docs-app-docs&docid={x2;$doc['docid']}">{x2;$doc['doctitle']}</a></li>
							<li class="active">历史版本详情</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					{x2;if:$doc['doccontentid'] == $doc['content']['dhid']}
					<p class="alert alert-info" style="margin-top: 15px;">本内容为当前使用版本</p>
					{x2;else}
					<p class="alert alert-danger" style="margin-top: 15px;">本内容为历史版本</p>
					{x2;endif}
					<div class="col-xs-12">
						<h2 class="text-left">{x2;$doc['doctitle']}
							<span class="pull-right">
								<a class="btn btn-primary" href="index.php?docs-app-docs&docid={x2;$doc['docid']}">返回词条</a>
								<a class="btn btn-danger" href="index.php?docs-app-docs-history&docid={x2;$doc['docid']}">其他版本</a>
							</span>
						</h2>
					</div>
					<div class="col-xs-12" id="content">
						{x2;realhtml:$doc['content']['dhcontent']}
					</div>
					<div class="col-xs-12">
						<hr/>
						<p>
							<span class="pull-right">
								<em>本版提交时间 {x2;date:$doc['content']['dhtime'],'Y-m-d H:i:s'}</em>
							</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		$('#content .wikititle').each(function(){
			var _this = $(this);
			_this.attr('id',Math.random().toString().substr(2))
			if(_this[0].tagName.toUpperCase() == 'H1')
			{
			    $('#lemma').append($('<a href="#'+_this.attr('id')+'" class="list-group-item active">'+_this.html()+'</a>'));
			}
			else
			{
				$('#lemma').append($('<a href="#'+_this.attr('id')+'" class="list-group-item">'+_this.html()+'</a>'));
			}
		});
	});
</script>
{x2;include:footer}
</body>
</html>