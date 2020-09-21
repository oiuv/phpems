<h2 class="title">功能导航</h2>
<ul class="list-unstyled list-txt">
    <li class="border{x2;if:$method == 'index'} active{x2;endif}">
        <a href="index.php?user-center">
            <span class="glyphicon glyphicon-user"></span> 个人中心
        </a>
    </li>
    <li class="border{x2;if:$method == 'progress'} active{x2;endif}">
        <a href="index.php?user-center-progress">
            <span class="glyphicon glyphicon-stats"></span> 学习进度
        </a>
    </li>
    <li  class="border{x2;if:$method == 'payfor'} active{x2;endif}">
        <a href="index.php?user-center-payfor">
            <span class="glyphicon glyphicon-yen"></span> 积分充值
        </a>
    </li>
    <li  class="border{x2;if:$method == 'privatement'} active{x2;endif}">
        <a href="index.php?user-center-privatement">
            <span class="glyphicon glyphicon-cog"></span> 个人设置
        </a>
    </li>
    {x2;if:$_user['groupmoduleid'] == 1}
    <li  class="border">
        <a href="index.php?core-master">
            <span class="glyphicon glyphicon-dashboard"></span> 后台管理
        </a>
    </li>
    {x2;endif}
    {x2;if:$_user['groupmoduleid'] == 12}
    <li  class="border">
        <a href="index.php?exam-teach">
            <span class="glyphicon glyphicon-dashboard"></span> 教师管理
        </a>
    </li>
    {x2;endif}
</ul>
