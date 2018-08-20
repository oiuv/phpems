{x2;include:header}
<body>
{x2;include:nav}
<div class="row-fluid">
	<div class="container-fluid examcontent">
		<div class="exambox" id="datacontent">
			<div class="examform">
				<ul class="breadcrumb">
					<li>
						<span class="icon-home"></span> <a href="index.php?exam">考场选择</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a> <span class="divider">/</span>
					</li>
					<li class="active">
						错题记录
					</li>
				</ul>
				<ul class="nav nav-tabs">
					<li{x2;if:$ehtype == 0} class="active"{x2;endif}>
						<a href="index.php?exam-app-record">强化训练</a>
					</li>
					<li{x2;if:$ehtype == 1} class="active"{x2;endif}>
						<a href="index.php?exam-app-record&ehtype=1">模拟考试</a>
					</li>
					<li{x2;if:$ehtype == 2} class="active"{x2;endif}>
						<a href="index.php?exam-app-record&ehtype=2">正式考试</a>
					</li>
				</ul>
				{x2;if:$ehtype == 0}
				<p><span class="text-warning">提示：</span>我的错题中的强化训练最多记录最新20条信息。</p>
				{x2;elseif:$ehtype == 1}
				<p>您一共完成了<b class="text-warning">{x2;$exams['number']}</b>次考试， 平均分为：<b class="text-warning">{x2;$avgscore}</b>分 继续努力吧！</p>
				{x2;elseif:$ehtype == 2}
				<p>您一共完成了<b class="text-warning">{x2;$exams['number']}</b>次考试， 平均分为：<b class="text-warning">{x2;$avgscore}</b>分 继续努力吧！</p>
				{x2;endif}
				<table class="table table-bordered table-hover">
					<tr class="info">
						<td>答题记录</td>
						<td>答题时间</td>
						<td>错题数量</td>
						<td>查看错题</td>
						<td>删除记录</td>
					</tr>
					{x2;tree:$exams['data'],exam,eid}
					<tr>
						<td>{x2;v:exam['ehexam']}</td>
						<td>{x2;date:v:exam['ehstarttime'],'Y-m-d'}</td>
						<td><b class="red">{x2;v:exam['errornumber']}</b></td>
						<td><a href="index.php?exam-app-record-wrongs&ehid={x2;v:exam['ehid']}">错题</a></td>
						<td>
							{x2;if:$ehtype != 2}
							<a href="javascript:;" onclick="javascript:confdelinfo({x2;v:exam['ehid']})">删除</a>
							{x2;else}
							-
							{x2;endif}
						</td>
					</tr>
				{x2;endtree}
				</table>
	            {x2;if:$exams['pages'] && $ehtype}
				<div class="pagination pagination-right">
					<ul>{x2;$exams['pages']}</ul>
				</div>
	           {x2;endif}
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
<script>
var delhistory = function(ehid)
{
 	$.get("?exam-app-history-del&ehid="+ehid+"&rand"+Math.random(),function(data){window.location.reload();});
}
</script>
</body>
</html>