{x2;include:header}
<body>
<style>
.form-group div{padding-top:7px;}
</style>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main box">
			<div class="col-xs-7" style="padding:15px;">
				<img src="app/core/styles/img/login.jpg" />
			</div>
			<div class="col-xs-4 pull-right" style="margin:0px 30px 0px auto;background-color:#FFFFFF;">
				<h4 class="title" style="line-height:3em;margin-bottom:15px;">用户注册</h4>
				<form method="post" action="index.php?user-app-register" id="regform" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">用户名</label>
						<div class="col-sm-9">
							<input class="form-control" name="args[username]" datatype="userName" needle="needle" msg="请你输入用户名" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">邮箱</label>
						<div class="col-sm-9">
							<input class="form-control" name="args[useremail]" datatype="email" needle="needle" msg="请你输入邮箱" placeholder="请输入邮箱">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">密码</label>
						<div class="col-sm-9">
							<input class="form-control"  name="args[userpassword]" datatype="password" needle="needle" msg="请你输入密码" placeholder="请输入密码" type="password">
						</div>
					</div>
					{x2;tree:$forms,form,fid}
					<div class="form-group">
						<label class="col-sm-3 control-label">{x2;v:form['title']}</label>
						<div class="col-sm-9">{x2;v:form['html']}</div>
					</div>
					{x2;endif}
					<div class="form-group">
						{x2;if:$app['appsetting']['closeregist']}
						<button type="button" class="btn btn-primary btn-block" style="height:44px;line-height:32px;font-size:16px;">管理员禁止用户注册</button>
						{x2;else}
						<button type="submit" class="btn btn-primary btn-block" style="height:44px;line-height:32px;font-size:16px;">注册</button>
						{x2;endif}
						<input type="hidden" value="1" name="userregister"/>
						<a class="btn btn-default btn-block" href="index.php?user-app-login" style="height:44px;line-height:32px;font-size:16px;margin-top:10px;">登录</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>