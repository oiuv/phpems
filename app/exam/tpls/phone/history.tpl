	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				考试记录
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div class="row-fluid">
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
					<ul class="nav nav-pills">
						<li{x2;if:$ehtype == 0} class="active"{x2;endif}>
							<a href="index.php?exam-phone-history" class="ajax">强化训练</a>
						</li>
						<li{x2;if:$ehtype == 1} class="active"{x2;endif}>
							<a href="index.php?exam-phone-history&ehtype=1" class="ajax">模拟考试</a>
						</li>
						<li{x2;if:$ehtype == 2} class="active"{x2;endif}>
							<a href="index.php?exam-phone-history&ehtype=2" class="ajax">正式考试</a>
						</li>
					</ul>
				</div>
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
					<blockquote class="questype" style="margin:0px;">
						{x2;if:$ehtype == 0}
						<p><span class="text-warning">提示：</span>强化训练最多记录20条信息。</p>
						{x2;elseif:$ehtype == 1}
						<p>您完成了<b class="text-warning">{x2;$exams['number']}</b>次考试， 平均分：<b class="text-warning">{x2;$avgscore}</b>分！</p>
						{x2;elseif:$ehtype == 2}
						<p>您完成了<b class="text-warning">{x2;$exams['number']}</b>次考试， 平均分：<b class="text-warning">{x2;$avgscore}</b>分！</p>
						{x2;endif}
					</blockquote>
				</div>
				<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
					<table class="table table-bordered table-hover">
						<tr class="info">
							<td>答题记录</td>
							<td>得分</td>
							<td>解析</td>
							<td>删除</td>
						</tr>
						{x2;tree:$exams['data'],exam,eid}
						<tr>
							<td>{x2;v:exam['ehexam']}</td>
							<td><b class="red">{x2;if:!v:exam['ehstatus'] && v:exam['ehdecide']}评分中{x2;else}{x2;v:exam['ehscore']}{x2;endif}</b></td>
							<td><a href="index.php?exam-phone-history-view&ehid={x2;v:exam['ehid']}" class="ajax" data-target="views" data-page="views">解析</a></td>
							<td>
								{x2;if:$ehtype != 2}
								<a class="ajax" href="index.php?exam-phone-history-del&ehid={x2;v:exam['ehid']}">删除</a>
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