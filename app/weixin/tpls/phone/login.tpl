{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-10">用户登录</div>
        </div>
        <div class="page-content header">
            <div class="list-box" style="margin-top: 0.20rem;margin-bottom: 0.15rem;">
                <ol>
                    <li class="unstyled">
                        <div class="text-center">
                            <img src="files/public/img/logo2.png" class="circle" style="width: 0.96rem;"/>
                        </div>
                    </li>
                </ol>
            </div>
            <form class="top" action="index.php?weixin-phone-index-bindlogin" method="post">
                <div class="form-group underline">
                    <div class="col-3 tip">
                        用户名
                    </div>
                    <div class="col-7">
                        <input type="text" needle="needle" msg="请输入用户名" class="noborder" name="args[username]" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group underline">
                    <div class="col-3 tip">
                        密码
                    </div>
                    <div class="col-7">
                        <input type="password" needle="needle" msg="请输入密码" class="noborder" name="args[userpassword]" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group text-right">
                    &nbsp;
                </div>
                <div class="form-group">
                    <input type="hidden" name="userlogin" value="1">
                    <button class="success block" type="submit"><i class="iconfont icon-wechat-fill"></i> 登陆并绑定微信</button>
                </div>
                <div class="form-group text-center">
                    <a class="ajax" href="index.php?weixin-phone-index-bindregister">没有账号？立即注册</a>
                </div>
            </form>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
