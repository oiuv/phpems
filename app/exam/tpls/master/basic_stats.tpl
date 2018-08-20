{x2;if:!$userhash}
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
{x2;endif}
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
							<li><a href="index.php?{x2;$_app}-master-basic">考场管理</a></li>
							<li class="active">成绩分析</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						【{x2;$basic['basic']}】试题正确率分析
						<a class="pull-right btn btn-primary" href="index.php?exam-master-basic-stats&basicid={x2;$basicid}{x2;$u}&type=1">知识点正确率分析</a></a>
					</h4>
			        <table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
			                    <th width="60">ID</th>
			                    <th>试题名称</th>
			                    <th width="80">A</th>
			                    <th width="80">B</th>
			                    <th width="80">C</th>
			                    <th width="80">D</th>
			                    <th width="80">正确次数</th>
			                    <th width="80">出现次数</th>
						        <th width="80">正确率</th>
                                <th width="80">详情</th>
			                </tr>
			            </thead>
			            <tbody>
		                    {x2;tree:$stats['data'],stat,sid}
					        <tr>
								<td>
									{x2;v:stat['id']}
								</td>
								<td>
									{x2;realhtml:v:stat['title']}
								</td>
								<td>
									{x2;eval: echo round(100 * v:stat['A']/v:stat['number'],2)}%
								</td>
								<td>
									{x2;eval: echo round(100 * v:stat['B']/v:stat['number'],2)}%
								</td>
								<td>
									{x2;eval: echo round(100 * v:stat['C']/v:stat['number'],2)}%
								</td>
								<td>
									{x2;eval: echo round(100 * v:stat['D']/v:stat['number'],2)}%
								</td>
								<td>
									{x2;eval: echo intval(v:stat['right'])}
								</td>
								<td>
									{x2;v:stat['number']}
								</td>
								<td>
									{x2;eval: echo round(100 * v:stat['right']/v:stat['number'],2)}%
								</td>
								<td>
									<a href="index.php?exam-master-basic-historyquestionbyuser&questionid={x2;v:stat['id']}&basicid={x2;$basicid}{x2;$u}">查看</a>
								</td>
							</tr>
					        {x2;endtree}
			        	</tbody>
			        </table>
			        <ul class="pagination pull-right">
			            {x2;$stats['pages']}
			        </ul>
				</div>
			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}