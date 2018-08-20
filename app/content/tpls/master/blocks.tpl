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
							<li class="active">标签管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
						标签管理
						<a class="btn btn-primary pull-right" href="index.php?content-master-blocks-add&page={x2;$page}">添加标签</a>
					</h4>
					<table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
			                    <th>ID</th>
						        <th>名称</th>
						        <th>位置</th>
						        <th>类型</th>
						        <th>操作</th>
			                </tr>
			            </thead>
			            <tbody>
			            	{x2;tree:$blocks['data'],block,kid}
			            	<tr>
			                    <td>{x2;v:block['blockid']}</td>
						        <td>{x2;v:block['block']}</td>
						        <td>{x2;v:block['blockposition']}</td>
						        <td>
						        	<div class="dropdown">
							        	<a class="dropdown-toggle" href="#" data-toggle="dropdown">{x2;if:v:block['blocktype'] == 1}固定内容{x2;elseif:v:block['blocktype'] == 2}分类列表{x2;elseif:v:block['blocktype'] == 3}SQL{x2;elseif:v:block['blocktype'] == 4}模板模式{x2;endif}<strong class="caret"></strong></a>
							        	<ul class="dropdown-menu">
								        	<li><a href="javascript:;">切换模式</a></li>
											<li class="divider"></li>
											<li><a class="ajax" href="index.php?{x2;$_app}-master-blocks-change&blockid={x2;v:block['blockid']}&blocktype=1&page={x2;$page}">固定内容</a></li>
											<li><a class="ajax" href="index.php?{x2;$_app}-master-blocks-change&blockid={x2;v:block['blockid']}&blocktype=2&page={x2;$page}">分类列表</a></li>
											<li><a class="ajax" href="index.php?{x2;$_app}-master-blocks-change&blockid={x2;v:block['blockid']}&blocktype=3&page={x2;$page}">SQL模式</a></li>
											<li><a class="ajax" href="index.php?{x2;$_app}-master-blocks-change&blockid={x2;v:block['blockid']}&blocktype=4&page={x2;$page}">模板模式</a></li>
					                    </ul>
				                    </div>
						        </td>
						        <td>
						        	<div class="btn-group">
										<a class="btn" href="index.php?{x2;$_app}-master-blocks-modify&blockid={x2;v:block['blockid']}&page={x2;$page}" title="修改模型信息"><em class="glyphicon glyphicon-edit"></em></a>
										<a class="btn ajax" href="index.php?{x2;$_app}-master-blocks-del&blockid={x2;v:block['blockid']}&page={x2;$page}" title="删除模型"><em class="glyphicon glyphicon-remove"></em></a>
									</div>
								</td>
			                </tr>
			                {x2;endtree}
			        	</tbody>
			        </table>
					<ul class="pagination pagination-right">
						{x2;$blocks['pages']}
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