{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
{x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">用户登录</div>
            <div class="col-1" onclick="javascript:$('.mask').show();"><span class="iconfont icon-menu"></span></div>
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
            <form class="top" action="index.php?user-phone-login" method="post">
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
                    <a class="ajax" href="index.php?user-phone-register-findpassword">忘记密码？</a>
                </div>
                <div class="form-group">
                    <input type="hidden" name="userlogin" value="1">
                    <button class="primary block">登录</button>
                </div>
                {x2;if:USEWX && v:this->ev->isWeixin()}
                <div class="form-group">
                    <a href="index.php?weixin-phone-index-getopenid" class="btn success block"><i class="iconfont icon-wechat-fill"></i> 微信一键登录</a>
                </div>
                {x2;endif}
                <div class="form-group text-center">
                    <a class="ajax" href="index.php?user-phone-register">没有账号？立即注册</a>
                </div>
            </form>
        </div>
    </div>
{x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
