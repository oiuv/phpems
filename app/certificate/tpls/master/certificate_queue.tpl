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
							<li><a href="index.php?{x2;$_app}-master-certificate">证书管理</a></li>
							<li class="active">申请列表</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
						{x2;$ce['cetitle']}申请列表
						<a class="btn btn-primary pull-right" href="index.php?certificate-master-certificate">证书管理</a>
					</h4>
					<form action="index.php?certificate-master-certificate-queue&ceid={x2;$ce['ceid']}" method="post" class="form-inline">
						<table class="table">
					        <tr>
								<td>
									身份证号：
								</td>
								<td>
									<input name="search[username]" class="form-control" size="15" type="text" class="idcard" value="{x2;$search['username']}"/>
								</td>
								<td>
									申请时间：
								</td>
								<td>
									<input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
								</td>
					        	<td>
									状态：
								</td>
								<td>
									<select name="search[ceqstatus]" class="form-control">
								  		<option value="">不限</option>
								  		<option value="0"{x2;if:$search['ceqstatus'] === '0'} selected{x2;endif}>申请中</option>
								  		<option value="1"{x2;if:$search['ceqstatus'] == 1} selected{x2;endif}>已受理</option>
								  		<option value="2"{x2;if:$search['ceqstatus'] == 2} selected{x2;endif}>已出证</option>
								  		<option value="3"{x2;if:$search['ceqstatus'] == 3} selected{x2;endif}>已驳回</option>
								  	</select>
								</td>
								<td>
									<button class="btn btn-primary" type="submit">提交</button>
									<a class="btn btn-primary ajax" href="index.php?certificate-master-certificate-outdata&ceid={x2;$ce['ceid']}{x2;$u}">导出</a>
								</td>
					        </tr>
						</table>
						<div class="input">
							<input type="hidden" value="1" name="search[argsmodel]" />
						</div>
					</form>
					<table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
			                    <th width="60">ID</th>
			                    <th width="120">照片</th>
			                    <th width="80">姓名</th>
			                    <th width="100">身份证号</th>
						        <th width="50">性别</th>
						        <th width="90">文化程度</th>
						        <th width="110">联系方式</th>
						        <th width="100">申请时间</th>
						        <th width="80">状态</th>
						        <th width="140">操作</th>
			                </tr>
			            </thead>
			            <tbody>
			            	{x2;tree:$certificates['data'],certificate,cid}
			            	<tr>
			                    <td>{x2;v:certificate['ceqid']}</td>
			                    <td><img src="{x2;v:certificate['ceqinfo']['photo']}" width="120"/></td>
			                    <td>{x2;v:certificate['ceqinfo']['usertruename']}</td>
			                    <td>
			                        {x2;v:certificate['ceqinfo']['username']}
			                    </td>
			                    <td>
			                        {x2;v:certificate['ceqinfo']['usersex']}
			                    </td>
			                    <td>
			                        {x2;v:certificate['ceqinfo']['userdegree']}
			                    </td>
			                    <td>
			                        {x2;v:certificate['ceqinfo']['userphone']}<br />{x2;v:certificate['ceqinfo']['useraddress']}
			                    </td>
			                    <td>
			                    	{x2;date:v:certificate['ceqtime'],'Y-m-d'}
			                    </td>
			                    <td>
			                    	{x2;$status[v:certificate['ceqstatus']]}
			                    </td>
			                    <td class="actions">
			                    	<div class="btn-group">
			                    		<a class="btn ajax" href="index.php?certificate-master-certificate-modifyqueue&ceqid={x2;v:certificate['ceqid']}&status=1" title="设为已受理"><em class="glyphicon glyphicon-random"></em></a>
			                    		<a class="btn ajax" href="index.php?certificate-master-certificate-modifyqueue&ceqid={x2;v:certificate['ceqid']}&status=2" title="设为已出证"><em class="glyphicon glyphicon-ok"></em></a>
										<a class="btn ajax" href="index.php?certificate-master-certificate-modifyqueue&ceqid={x2;v:certificate['ceqid']}&status=3" title="设为被驳回"><em class="glyphicon glyphicon-remove"></em></a>
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