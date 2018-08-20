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
					  <li><a href="index.php?exam-app">考试</a></li>
					  <li><a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a></li>
					  <li class="active">成绩单</li>
					</ol>
				</div>
			</div>
			<div class="box itembox">
				<h4 class="title">成绩单</h4>
				<blockquote class="questype" style="margin-top:20px;">
					<p>您的最高分：<span class="text-warning">{x2;$s['score']}</span> 您的最好名次：<span class="text-warning">{x2;$s['index']}</span></p>
				</blockquote>
				<table class="table table-bordered table-hover">
					<tr class="info">
						<td>名次</td>
						<td>姓名</td>
                        <td>得分</td>
						<td>考试时间</td>
						<td>用时</td>
					</tr>
					{x2;tree:$scores['data'],score,sid}
					<tr>
						<td>{x2;eval: echo ($page - 1)*20 + v:sid}</td>
						<td>{x2;v:score['usertruename']}</td>
						<td>{x2;v:score['ehscore']}</td>
						<td>{x2;date:v:score['ehstarttime'],'Y-m-d H:i:s'}</td>
						<td>{x2;if:v:score['ehtime'] >= 60}{x2;if:v:score['ehtime']%60}{x2;eval: echo intval(v:score['ehtime']/60)+1}{x2;else}{x2;eval: echo intval(v:score['ehtime']/60)}{x2;endif}分钟{x2;else}{x2;v:score['ehtime']}秒{x2;endif}</td>
					</tr>
				{x2;endtree}
				</table>
				<ul class="pagination pull-right">{x2;$scores['pages']}</ul>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>