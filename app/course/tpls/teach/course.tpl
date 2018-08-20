{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-12" id="datacontent">
{x2;endif}
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
                        {x2;if:$catid}{x2;$categories[$catid]['catname']}{x2;else}所有课程{x2;endif}
					</h4>

					<table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
								<th width="36">ID</th>
								<th width="80">缩略图</th>
								<th>标题</th>
								<th width="200">分类</th>
								<th width="100">发布时间</th>
								<th width="100">开通人数</th>
								<th width="100">操作</th>
							</tr>
						</thead>
						<tbody>
							{x2;tree:$courses['data'],course,cid}
							<tr>
								<td>{x2;v:course['csid']}</td>
								<td class="picture"><img src="{x2;if:v:course['csthumb']}{x2;v:course['csthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:24px;"/></td>
								<td>
									{x2;v:course['cstitle']}
								</td>
								<td>
									<a href="index.php?course-teach-course&catid={x2;v:course['cscatid']}" target="">{x2;$categories[v:course['cscatid']]['catname']}</a>
								</td>
								<td>
									{x2;date:v:course['cstime'],'Y-m-d'}
								</td>
								<td>
									<a href="index.php?course-teach-course-members&courseid={x2;v:course['csid']}" class="autoloaditem" autoload="index.php?course-teach-course-getcoursemembernumber&courseid={x2;v:course['csid']}">0</a>
								</td>
								<td class="actions">
									<div class="btn-group">
										<a class="btn" href="index.php?course-teach-course-members&courseid={x2;v:course['csid']}" title="Users"><em class="glyphicon glyphicon-user"></em></a>
										<a class="btn" href="index.php?course-teach-contents&courseid={x2;v:course['csid']}" title="Courseware"><em class="glyphicon glyphicon-list"></em></a>
									</div>
								</td>
							</tr>
							{x2;endtree}
						</tbody>
					</table>
					<ul class="pagination pull-right">
						{x2;$courses['pages']}
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