{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="margin-bottom:0px;">
				<ul class="breadcrumb">
					<li>
						<span class="icon-home"></span> <a href="index.php?exam">考场选择</a>
					</li>
					<li>
						<a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a>
					</li>
					<li class="active">
						考试记录
					</li>
				</ul>
			</div>
			<div class="box itembox" style="padding-top:24px;">
				<ul class="nav nav-tabs">
					<li{x2;if:$ehtype == 0} class="active"{x2;endif}>
						<a href="index.php?exam-app-history">强化训练</a>
					</li>
					<li{x2;if:$ehtype == 1} class="active"{x2;endif}>
						<a href="index.php?exam-app-history&ehtype=1">模拟考试</a>
					</li>
					<li{x2;if:$ehtype == 2} class="active"{x2;endif}>
						<a href="index.php?exam-app-history&ehtype=2">正式考试</a>
					</li>
				</ul>
				<blockquote class="questype" style="margin-top:20px;">
					{x2;if:$ehtype == 0}
					<p><span class="text-warning">提示：</span>我的错题中的强化训练最多记录最新20条信息。</p>
					{x2;elseif:$ehtype == 1}
					<p>您一共完成了<b class="text-warning">{x2;$exams['number']}</b>次考试， 平均分为：<b class="text-warning">{x2;$avgscore}</b>分 继续努力吧！</p>
					{x2;elseif:$ehtype == 2}
					<p>您一共完成了<b class="text-warning">{x2;$exams['number']}</b>次考试， 平均分为：<b class="text-warning">{x2;$avgscore}</b>分 继续努力吧！</p>
					<p><b class="text-warning">注意：</b>正式考试的重做试卷将作为模拟考试记录！</p>
					{x2;endif}
				</blockquote>
				<table class="table table-bordered table-hover">
					<tr class="info">
						<td>答题记录</td>
						<td>答题时间</td>
						<td>用时</td>
                        <td>得分</td>
						<td>错题数量</td>
						<td>查看错题</td>
						<td>试题解析</td>
						<td>重做试卷</td>
						<td>删除记录</td>
					</tr>
					{x2;tree:$exams['data'],exam,eid}
					<tr>
						<td>{x2;v:exam['ehexam']}</td>
						<td>{x2;date:v:exam['ehstarttime'],'Y-m-d'}</td>
						<td>{x2;if:v:exam['ehtime'] >= 60}{x2;if:v:exam['ehtime']%60}{x2;eval: echo intval(v:exam['ehtime']/60)+1}{x2;else}{x2;eval: echo intval(v:exam['ehtime']/60)}{x2;endif}分钟{x2;else}{x2;v:exam['ehtime']}秒{x2;endif}</td>
                        <td><b class="red">{x2;if:!v:exam['ehstatus'] && v:exam['ehdecide']}评分中{x2;else}{x2;v:exam['ehscore']}{x2;endif}</b></td>
						<td><b class="red">{x2;v:exam['errornumber']}</b></td>
						<td><a href="index.php?exam-app-record-wrongs&ehid={x2;v:exam['ehid']}">查看错题</a></td>
						<td><a href="index.php?exam-app-history-view&ehid={x2;v:exam['ehid']}">试题解析</a></td>
						<td><a class="ajax" href="index.php?exam-app-history-redo&ehid={x2;v:exam['ehid']}" action-before="clearStorage">重做试卷</a></td>
						<td>
							{x2;if:$ehtype != 2}
							<a class="ajax" href="index.php?exam-app-history-del&ehid={x2;v:exam['ehid']}">删除</a>
							{x2;else}
							-
							{x2;endif}
						</td>
					</tr>
				{x2;endtree}
				</table>
				{x2;if:$exams['pages'] && $ehtype}
				<ul class="pagination pull-right">{x2;$exams['pages']}</ul>
				{x2;endif}
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>