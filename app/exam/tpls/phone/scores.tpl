	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				成绩单
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div class="row-fluid">
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;margin-bottom:0.5rem;">
					<blockquote class="questype" style="margin:0px;">
						<p>您的最高分：<span class="text-warning">{x2;$s['score']}</span> 您的最好名次：<span class="text-warning">{x2;$s['index']}</span></p>
					</blockquote>
				</div>
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;margin-bottom:0.5rem;">
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
				</div>
				<ul class="pagination pull-right">{x2;$scores['pages']}</ul>
			</div>
		</div>
	</div>