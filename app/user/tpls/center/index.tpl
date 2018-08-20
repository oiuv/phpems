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
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php">首页</a></li>
							<li class="active">个人中心</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;">
					<h4 class="title">个人中心</h4>
					<table width="100%">
						<tr>
							<td width="30%">
								<div class="thumbnail" style="width:80%;">
									<img style="max-width:210px;" alt="300x200" src="{x2;if:$_user['photo']}{x2;$_user['photo']}{x2;else}app/exam/styles/image/paper.png{x2;endif}" />
								</div>
							</td>
							<td width="35%" style="padding:10px;">
								<h3>{x2;$_user['username']}</h3>
								<p>注册日期：{x2;date:$_user['userregtime'],'Y-m-d'}</p>
								<p>注册IP：{x2;$_user['userregip']}</p>
								<p>您现有积分：{x2;$_user['usercoin']}</p>
								<p>&nbsp;</p>
								<p><a class="btn btn-primary" href="index.php?user-center-payfor">充值</a></p>
							</td>
							<td style="padding:10px;">
								<p>用户组：{x2;$groups[$_user['usergroupid']]['groupname']}</p>
								<p>真实姓名：{x2;$_user['usertruename']}</p>
								<p>邮箱：{x2;$_user['useremail']}</p>
								<p>&nbsp;</p>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>