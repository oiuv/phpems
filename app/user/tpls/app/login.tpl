{x2;include:header}
<body>
<div class="container-fluid" style="height: 100vh;background:radial-gradient(circle at 50% 30%, #4f4f4f, #000);">
    <div class="row-fluid">
        <div class="pages">
            <div class="content" style="margin-top: 10vh;">
                <div class="col-xs-3 padding"></div>
                <div class="col-xs-6 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">
                            用户登陆
                            {x2;if:USEWX}
                            <a class="pull-right badge" href="index.php?weixin-app-index-login">扫码登录</a>
                            {x2;else}
                            <a href="index.php" class="badge pull-right">首页</a>
                            {x2;endif}
                        </h2>
                        <form method="post" action="index.php?user-app-login">
                            <fieldset class="logbox">
                                <div class="form-group underline">
                                    <label class="block">
                                        <div class="col-xs-4 tip">
                                            用户名
                                        </div>
                                        <div class="col-xs-8">
                                            <input class="noborder" name="args[username]" datatype="userName" needle="needle" msg="请您输入正确的用户名" placeholder="请输入用户名">
                                        </div>
                                    </label>
                                </div>
                                <div class="form-group underline">
                                    <label class="block">
                                        <div class="col-xs-4 tip">
                                            密码
                                        </div>
                                        <div class="col-xs-8">
                                            <input type="password" name="args[userpassword]" datatype="password" needle="needle" msg="请您输入正确的密码" placeholder="请输入密码">
                                        </div>
                                    </label>
                                </div>
                                {x2;if:$app['appsetting']['emailverify']}
                                <div class="form-group text-right">
                                    <a href="index.php?user-app-register-findpassword">忘记密码？</a>
                                </div>
                                {x2;endif}
                                <div class="form-group text-center">
                                    <button class="btn btn-primary login">登陆</button>
                                    <input type="hidden" value="1" name="userlogin"/>
                                    <a href="index.php?user-app-register" class="btn btn-default login">注册</a>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
                <div class="col-xs-3 padding"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
