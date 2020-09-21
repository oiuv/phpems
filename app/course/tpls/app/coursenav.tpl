<div class="topbar">
    <div class="topbar-box">
        <div class="col-xs-4">
            <ul class="list-unstyled list-inline">
                <li>
                    <a href="https://github.com/oiuv/phpems" class="menu">
                        免费开源的PHP模拟考试系统
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-xs-8">
            <ul class="list-unstyled list-inline text-right">
                {x2;if:$_user['userid']}
                <li>
                    <span class="menu">欢迎您，{x2;$_user['username']}</span>
                </li>
                <li>|</li>
                <li>
                    <a href="index.php?user-center" class="menu">
                        个人中心
                    </a>
                </li>
                <li>|</li>
                <li>
                    <a href="index.php?user-app-logout" class="menu ajax">
                        退出
                    </a>
                </li>
                {x2;else}
                <li>
                    <a href="javascript:;" onclick="javascript:$.loginbox.show();" class="menu">
                        登陆
                    </a>
                </li>
                <li>|</li>
                <li>
                    <a href="index.php?user-app-register" class="menu">
                        注册
                    </a>
                </li>
                <li>|</li>
                <li>
                    <a href="index.php?user-app-register-findpassword" class="menu">
                        忘记密码
                    </a>
                </li>
                {x2;endif}
                <li>|</li>
                <li>
                    <a href="https://github.com/oiuv/phpems" class="menu">
                        联系我们
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="header">
    <div class="nav">
        <div class="col-xs-3">
            <h1 class="logo"><img src="files/public/img/logo.png" style="height:56px;"/></h1>
        </div>
        <div class="col-xs-7">
            <ul class="list-unstyled list-inline">
                <li>
                    <h3 class="logo">{x2;$course['cstitle']}</h3>
                </li>
                <li class="badge">
                    到期时间 {x2;date:$oc['ocendtime'],'Y-m-d'}
                </li>
            </ul>
        </div>
        <div class="col-xs-2">
            <ul class="list-unstyled list-inline">
                <li class="pull-right">
                    <a href="index.php?course" class="menu">
                        <span class="glyphicon glyphicon-chevron-left"></span> 返回
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
