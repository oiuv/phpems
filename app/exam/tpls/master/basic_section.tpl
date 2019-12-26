{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2 leftmenu">
				{x2;include:menu}
			</div>
			<div id="datacontent">
{x2;endif}
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
							<li><a href="index.php?{x2;$_app}-master-basic-subject">科目管理</a></li>
							<li class="active">章节管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
                        {x2;$subjects[$subjectid]['subject']}
						<a class="btn btn-primary pull-right" href="index.php?exam-master-basic-addsection&subjectid={x2;$subjectid}">添加章节</a>
					</h4>
					<form action="index.php?exam-master-basic-ordersection" method="post" class="form-horizontal">
						<table class="table table-hover table-bordered">
							<thead>
							<tr class="info">
								<th width="36">权重</th>
								<th>章节ID</th>
								<th>章节名称</th>
								<th width="220">操作</th>
							</tr>
							</thead>
							<tbody>
                            {x2;tree:$sections['data'],section,sid}
							<tr>
								<td>
									<input class="form-control" type="text" name="delids[{x2;v:section['sectionid']}]" value="{x2;v:section['sectionsequence']}" style="width:32px;padding:2px 5px;"/>
								</td>
								<td>{x2;v:section['sectionid']}</td>
								<td>{x2;v:section['section']}</td>
								<td>
									<div class="btn-group">
										<a class="btn ajax" href="index.php?exam-master-basic-clearpoint&sectionid={x2;v:section['sectionid']}" title="更新缓存"><em class="glyphicon glyphicon-refresh"></em></a>
										<a class="btn ajax" href="index.php?exam-master-basic-output&sectionid={x2;v:section['sectionid']}&page={x2;$page}{x2;$u}" title="导出题库"><em class="glyphicon glyphicon-download-alt"></em></a>
										<a class="btn" href="index.php?exam-master-basic-point&sectionid={x2;v:section['sectionid']}&page=1&basicid={x2;v:basic['basicid']}{x2;$u}" title="章节列表"><em class="glyphicon glyphicon-th-list"></em></a>
										<a class="btn" href="index.php?exam-master-basic-modifysection&sectionid={x2;v:section['sectionid']}&page={x2;$page}{x2;$u}" title="修改章节信息"><em class="glyphicon glyphicon-edit"></em></a>
										<a class="btn confirm" href="index.php?exam-master-basic-delsection&sectionid={x2;v:section['sectionid']}&page={x2;$page}{x2;$u}" title="删除章节"><em class="glyphicon glyphicon-remove"></em></a>
									</div>
								</td>
							</tr>
                            {x2;endtree}
							</tbody>
						</table>
						<div class="form-group">
							<div class="col-sm-9">
								<button class="btn btn-primary" type="submit">排序</button>
							</div>
						</div>
						<ul class="pagination pull-right">
                            {x2;$sections['pages']}
						</ul>
					</form>
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