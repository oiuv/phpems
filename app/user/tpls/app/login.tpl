{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main box">
			<div class="col-xs-7" style="padding:15px;">
				<img src="app/core/styles/img/login.jpg"/>
			</div>
			<div class="col-xs-4 pull-right" style="margin:30px 30px 0px auto;background-color:#FFFFFF;">
				<form class="col-xs-12" method="post" action="index.php?user-app-login">
					<h4 class="title" style="line-height:3em;margin-bottom:40px;">用户登录</h4>
					<div class="form-group input-group">
						<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-user" style="font-size:16px;"></a></span>
						<input class="form-control" name="args[username]" datatype="userName" needle="needle" msg="请您输入正确的用户名" placeholder="请输入用户名" style="height:44px;line-height:24px;font-size:16px;">
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-lock" style="font-size:16px;"></a></span>
						<input class="form-control" name="args[userpassword]" datatype="password" needle="needle" msg="请您输入正确的密码" placeholder="请输入密码" type="password" style="height:44px;line-height:24px;font-size:16px;">
					</div>
					<input type="hidden" value="1" name="userlogin"/>
					<button type="submit" class="btn btn-primary btn-block" style="height:44px;line-height:32px;font-size:16px;margin-top:30px;">登录</button>
					<a class="btn btn-default btn-block" href="index.php?user-app-register" style="height:44px;line-height:32px;font-size:16px;margin-top:10px;">注册</a>
                    {x2;if:$app['appsetting']['emailverify']}
					<a class="btn btn-danger btn-block" href="index.php?user-app-register-findpassword" style="height:44px;line-height:32px;font-size:16px;margin-top:10px;">忘记密码</a>
                    {x2;endif}
				</form>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>