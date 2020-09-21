{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">用户登录</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
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
            <form class="top" action="index.php?user-phone-register-findpassword" method="post">
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
                        邮箱
                    </div>
                    <div class="col-7">
                        <input type="text" needle="needle" msg="请输入邮箱" class="noborder" name="args[username]" placeholder="请输入邮箱" id="email">
                    </div>
                </div>
                <div class="form-group underline">
                    <label class="block">
                        <div class="col-3 tip">
                            验证码
                        </div>
                        <div class="col-4">
                            <input class="noborder" type="text" name="randcode" needle="needle" msg="请您输入正确的验证码" placeholder="请输入验证码">
                        </div>
                        <div class="col-3 text-center">
                            <a id="sendphonecode">发送验证码</a>
                        </div>
                    </label>
                </div>
                <div class="form-group underline">
                    <div class="col-3 tip">
                        新密码
                    </div>
                    <div class="col-7">
                        <input type="password" needle="needle" msg="请输入密码" class="noborder" name="args[userpassword]" placeholder="请输入新密码">
                    </div>
                </div>
                <div class="form-group underline">
                    <div class="col-3 tip">
                        重复密码
                    </div>
                    <div class="col-7">
                        <input type="password" needle="needle" msg="请重复输入密码" class="noborder" name="args[userpassword]" placeholder="请重复输入密码">
                    </div>
                </div>
                <div class="form-group"></div>
                <div class="form-group">
                    <button class="primary block">找回密码</button>
                </div>
                <div class="form-group text-center">
                    <a href="javascript:;" onclick="javascript:history.back();">已有账号？立即登录</a>
                </div>
            </form>
        </div>
    </div>
    {x2;if:$app['appsetting']['emailverify']}
    <script>
        var sendstatus = true;
        $('#sendphonecode').click(function(){
            var _this = $(this);
            if(sendstatus)
            {
                $.getJSON('index.php?core-api-index-sendmail&action=findpassword&email='+$('#email').val()+'&userhash='+Math.random(),function(data){
                    if(parseInt(data.statusCode) == 200)
                    {
                        _this.html('120秒重发');
                        sendstatus = false;
                        sendtime = 120;
                        sendevent = setInterval(function(){
                            if(sendtime > 0)
                            {
                                sendtime--;
                                _this.html(sendtime+'秒重发');
                            }
                            else
                            {
                                sendstatus = true;
                                _this.html('发送验证码');
                                clearInterval(sendevent);
                            }
                        },1000);
                    }
                    else
                    {
                        $.zoombox.show('ajax',data);
                    }
                });
            }
        });
    </script>
    {x2;endif}
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
