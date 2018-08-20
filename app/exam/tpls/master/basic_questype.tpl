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
							<li class="active">题型管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						题型管理
						<a class="btn btn-primary pull-right" href="index.php?exam-master-basic-addquestype&page={x2;$page}{x2;$u}">添加题型</a>
					</h4>
			        <table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
			                    <th>题型ID</th>
								<th>题型</th>
								<th>题型分类</th>
								<th>操作</th>
			                </tr>
			            </thead>
			            <tbody>
		                    {x2;tree:$questypes,questype,qid}
							<tr>
								<td>{x2;v:questype['questid']}</td>
								<td>{x2;v:questype['questype']}</td>
								<td>{x2;if:v:questype['questsort']}主观题{x2;else}客观题{x2;endif}</td>
								<td>
					          		<div class="btn-group">
										<a class="btn" href="index.php?exam-master-basic-modifyquestype&questid={x2;v:questype['questid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
										<a class="btn ajax" href="index.php?exam-master-basic-delquestype&questid={x2;v:questype['questid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
									</div>
					          	</td>
							</tr>
							{x2;endtree}
			        	</tbody>
			        </table>
			        <ul class="pagination pull-right">
		        		{x2;$questypes['pages']}
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