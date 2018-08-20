{x2;if:!$userhash}
{x2;include:header}
<body>
<div id="content">
    <div class="pages" id="page1">
{x2;endif}
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				用户登录
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div style="width:90%;margin:auto;margin-bottom:1rem;overflow:hidden;">
				<h2 class="text-center">
					<img src="app/core/styles/img/logo2.png" style="width:6rem;">
				</h2>
				<h4 class="text-center" style="padding:1rem;">用户登录</h4>
				<form class="col-xs-12" method="post" action="index.php?user-phone-login">
					<div class="form-group input-group">
						<span class="input-group-addon" id="basic-addon1"><a class="glyphicon glyphicon-user"></a></span>
						<input class="form-control" name="args[username]" datatype="userName" needle="needle" msg="请你输入用户名" placeholder="请输入用户名">
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon" id="basic-addon2"><a class="glyphicon glyphicon-lock"></a></span>
						<input class="form-control"  name="args[userpassword]" datatype="password" needle="needle" msg="请你输入密码" placeholder="请输入密码" type="password">
					</div>
					<input type="hidden" value="1" name="userlogin"/>
					<button type="submit" class="btn btn-primary btn-block" style="line-height:3rem;">登录</button>
					<a class="btn btn-default btn-block ajax" href="index.php?user-phone-register" data-target="userregister" data-page="userregister" style="line-height:3rem;">注册</a>
				</form>
			</div>
		</div>
{x2;if:!$userhash}
    </div>
</div>
</body>
</html>
{x2;endif}