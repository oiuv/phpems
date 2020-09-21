{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">开通课程</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header">
            <div class="list-box bg">
                <ol>
                    <li class="unstyled">
                        <div class="col-4x">
                            <div class="rows illus">
                                {x2;if:$isopen}<span class="badge">已开通</span> {x2;endif}
                                <img src="{x2;if:$course['csthumb']}{x2;$course['csthumb']}{x2;else}files/public/img/paper.jpg{x2;endif}">
                            </div>
                        </div>
                        <div class="col-4x">
                            <div class="rows">
                                <h4 class="title text-center">{x2;$course['cstitle']}</h4>
                                {x2;if:$isopen}<p class="intro text-center">到期时间：{x2;date:$isopen['ocendtime'],'Y-m-d'}</p>{x2;endif}
                            </div>
                        </div>
                    </li>
                    <li class="unstyled">
                        <div class="rows info">
                            <p class="intro">{x2;$course['csdescribe']}</p>
                        </div>
                    </li>
                    {x2;if:$isopen}
                    <li class="unstyled">
                        <div class="rows text-center">
                            <a class="ajax btn primary" href="index.php?course-phone-course&csid={x2;$course['csid']}">开始学习</a>
                        </div>
                    </li>
                    {x2;else}
                    {x2;if:$course['csdemo']}
                    <li class="unstyled">
                        <div class="rows text-center">
                            <a class="btn primary confirm" message="确定要开通吗？" href="index.php?course-phone-course-opencourse&opencs=1&csid={x2;$course['csid']}">免费开通</a>
                        </div>
                    </li>
                    {x2;else}
                    {x2;if:$price}

                    {x2;tree:$price,p,pid}
                    <li class="unstyled">
                        <a class="confirm" message="确定要开通吗？" href="index.php?course-phone-course-opencourse&opencs=1&csid={x2;$course['csid']}&opentype={x2;v:key}">
                            <div class="rows info">
                                {x2;v:p['price']}积分兑换{x2;v:p['time']}天
                                <span class="pull-right"><em class="iconfont icon-right iconmenu"></em></span>
                            </div>
                        </a>
                    </li>
                    {x2;endtree}
                    <li class="unstyled"></li>

                    {x2;else}
                    <li class="unstyled">
                        <div class="rows text-center">
                            <a class="btn danger">请管理员设置考场价格</a>
                        </div>
                    </li>
                    {x2;endif}
                    {x2;endif}
                    {x2;endif}
                </ol>
            </div>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
