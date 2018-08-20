{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
				{x2;include:menu}
			</div>
			<div class="col-xs-10" id="datacontent">
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php">首页</a></li>
							<li><a href="index.php?{x2;$_app}-app">用户中心</a></li>
							<li class="active">学习进度</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;">
					<h4 class="title">学习进度</h4>
					<table class="table table-hover table-bordered">
						<thead>
						<tr class="info">
							<th>ID</th>
							<th>课程</th>
							<th>课程状态</th>
							<th>考试</th>
							<th>考试状态</th>
							<th>开始学习时间</th>
							<th>完成学习时间</th>
							<th>学习状态</th>
						</tr>
						</thead>
						<tbody>
                        {x2;tree:$progresses['data'],progress,pid}
						<tr>
							<td>{x2;v:progress['prsid']}</td>
							<td>{x2;$courses[v:progress['prscourseid']]['cstitle']}</td>
							<td>{x2;$status[v:progress['prscoursestatus']]}</td>
							<td>{x2;$basics[v:progress['prsexamid']]['basic']}</td>
							<td>{x2;$status[v:progress['prsexamstatus']]}</td>
							<td>{x2;date:v:progress['prstime'],'Y-m-d'}</td>
							<td>{x2;if:v:progress['prsendtime']}{x2;date:v:progress['prsendtime'],'Y-m-d'}{x2;else}-{x2;endif}</td>
							<td>{x2;$status[v:progress['prstatus']]}</td>
						</tr>
                        {x2;endtree}
						</tbody>
					</table>
					<ul class="pagination pagination-right">{x2;$progresses['pages']}</ul>
				</div>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>