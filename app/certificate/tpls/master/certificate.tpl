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
							<li class="active">证书管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
						证书管理
						<a class="btn btn-primary pull-right" href="index.php?certificate-master-certificate-add">添加证书</a>
					</h4>
					<table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
			                    <th width="60">ID</th>
			                    <th width="80">缩略图</th>
						        <th>标题</th>
						        <th width="120">价格（积分）</th>
						        <th width="120">添加时间</th>
						        <th width="140">操作</th>
			                </tr>
			            </thead>
			            <tbody>
			            	{x2;tree:$certificates['data'],certificate,cid}
			            	<tr>
			                    <td>{x2;v:certificate['ceid']}</td>
			                    <td class="picture"><img src="{x2;if:v:certificate['cethumb']}{x2;v:certificate['cethumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:60px;"/></td>
			                    <td>
			                        {x2;v:certificate['cetitle']}
			                    </td>
			                    <td>
			                        {x2;v:certificate['ceprice']}
			                    </td>
			                    <td>
			                    	{x2;date:v:certificate['cetime'],'Y-m-d'}
			                    </td>
			                    <td class="actions">
			                    	<div class="btn-group">
			                    		<a class="btn" href="index.php?certificate-master-certificate-queue&ceid={x2;v:certificate['ceid']}&page={x2;$page}{x2;$u}" title="列表"><em class="glyphicon glyphicon-list"></em></a>
			                    		<a class="btn" href="index.php?certificate-master-certificate-modify&ceid={x2;v:certificate['ceid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
										<a class="btn confirm" href="index.php?certificate-master-certificate-del&ceid={x2;v:certificate['ceid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
			                    	</div>
			                    </td>
			                </tr>
			                {x2;endtree}
			        	</tbody>
			        </table>
					<ul class="pagination pull-right">
						{x2;$certificates['pages']}
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