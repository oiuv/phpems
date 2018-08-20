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
							<li class="active">文件类型</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						文件类型
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-attachtype-add">添加文件类型</a>
					</h4>
			        <form action="index.php?{x2;$_app}-master-attachtype-batdel" method="post">
				       <table class="table table-hover table-bordered">
							<thead>
								<tr class="info">
				                    <th><input type="checkbox" class="checkall"/></th>
				                    <th>类型ID</th>
							        <th>类型名称</th>
							        <th>允许上传扩展名</th>
							        <th>操作</th>
				                </tr>
				            </thead>
				            <tbody>
				                {x2;tree:$types,type,tid}
						        <tr>
									<td>
										<input type="checkbox" name="delids[{x2;v:type['atid']}]" value="1"/>
									</td>
									<td>
										{x2;v:type['atid']}
									</td>
									<td>
										{x2;v:type['attachtype']}
									</td>
									<td>
										{x2;v:type['attachexts']}
									</td>
									<td>
										<div class="btn-group">
											<a class="btn" href="index.php?{x2;$_app}-master-attachtype-modify&page={x2;$page}&atid={x2;v:type['atid']}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
											<a class="btn confirm" href="index.php?{x2;$_app}-master-attachtype-del&atid={x2;v:type['atid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
										</div>
									</td>
						        </tr>
						        {x2;endtree}
				        	</tbody>
				        </table>
				        <div class="control-group">
				            <div class="controls">
				            	<button class="btn btn-primary" type="submit">删除</button>
				            </div>
						</div>
					</form>
			        <div class="pagination pagination-right">
						<ul>{x2;$basics['pages']}</ul>
			        </div>
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