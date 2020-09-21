{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">修改密码</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header">
            <form class="top" action="index.php?user-phone-privatement-modifypass" method="post">
                <div class="form-group underline">
                    <div class="col-3 tip">
                        旧密码
                    </div>
                    <div class="col-7">
                        <input type="password" needle="needle" msg="请输入旧密码" class="noborder" name="oldpassword" placeholder="请输入旧密码">
                    </div>
                </div>
                <div class="form-group underline">
                    <div class="col-3 tip">
                        密码
                    </div>
                    <div class="col-7">
                        <input type="password" needle="needle" msg="请输入新密码" class="noborder" name="args[password]" placeholder="请输入新密码">
                    </div>
                </div>
                <div class="form-group underline">
                    <div class="col-3 tip">
                        重复密码
                    </div>
                    <div class="col-7">
                        <input type="password" needle="needle" msg="请输入密码" class="noborder" name="args[password2]" placeholder="请重复输入密码">
                    </div>
                </div>
                <div class="form-group"></div>
                <div class="form-group">
                    <input type="hidden" name="modifyuserpassword" value="1"/>
                    <button class="primary block">修改密码</button>
                </div>
            </form>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
