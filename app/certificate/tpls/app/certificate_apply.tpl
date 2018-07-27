{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="margin-bottom:0px;">
				<div class="col-xs-12">
					<ol class="breadcrumb">
					  <li><a href="index.php">首页</a></li>
					  <li><a href="index.php?certificate">办理证书</a></li>
					  <li class="active">{x2;$ce['cetitle']}</li>
					</ol>
				</div>
			</div>
			<div class="box itembox" style="padding-top:20px;">
				<form class="form-horizontal" style="padding:20px;">
					<fieldset>
						<div class="col-xs-12">
							<h3 class="text-center">{x2;$ce['cetitle']}</h3>
							<hr/>
						</div>
						<div>
							<div class="col-xs-12">
								<table class="table table-bordered">
									<tr>
										<td width="25%">证书名称：</td>
										<td width="25%">{x2;$ce['cetitle']}</td>
										<td width="25%">申请费用：</td>
										<td width="25%">{x2;$ce['ceprice']}积分</td>
									</tr>
									<tr>
										<td>需过考试：</td>
										<td>{x2;$basic['basic']}</td>
										<td>加入时间：</td>
										<td>{x2;date:$ce['cetime'],'Y-m-d'}</td>
									</tr>
									<tr>
										<td>身份证号：</td>
										<td>{x2;$_user['userpassport']}</td>
										<td>姓名：</td>
										<td>{x2;$_user['usertruename']}</td>
									</tr>
									<tr>
										<td>性别：</td>
										<td>{x2;$_user['usergender']}</td>
										<td>文化程度：</td>
										<td>{x2;$_user['userdegree']}</td>
									</tr>
									<tr>
										<td>地址：</td>
										<td>{x2;$_user['useraddress']}</td>
										<td>联系电话：</td>
										<td>{x2;$_user['userphone']}</td>
									</tr>
								</table>
								<div class="form-group">
									<div class="col-sm-12 text-center">
										<a class="btn btn-primary confirm" msg="申请证书将扣除余额{x2;$ce['ceprice']}积分，确定支付吗？" href="index.php?certificate-app-certificate-apply&apply=1&ceid={x2;$ce['ceid']}">资料无误 申请证书</a>
										<a class="btn btn-danger" href="index.php?user-center-privatement">修改资料</a>
										<a class="btn btn-info" href="index.php?user-center-payfor">充值</a>
										<input type="hidden" name="modifyuserinfo" value="1"/>
										<input type="hidden" name="page" value="{x2;$page}"/>
                                        {x2;if:is_array($search)}
                                        {x2;tree:$search,arg,aid}
										<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                        {x2;endtree}
                                        {x2;endif}
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12" id="content">
							{x2;realhtml:$ce['cedescribe']}
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
