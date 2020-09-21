{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">开通考场</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header{x2;if:$exams['pages']} footer{x2;endif}">
            <div class="list-box bg">
                <ol>
                    <li class="unstyled">
                        <div class="col-3">
                            <div class="rows illus">
                                {x2;if:$isopen}<span class="badge">已开通</span> {x2;endif}
                                <img src="{x2;if:$basic['basicthumb']}{x2;$basic['basicthumb']}{x2;else}files/public/img/paper.jpg{x2;endif}">
                            </div>
                        </div>
                        <div class="col-3l">
                            <div class="rows info">
                                <h4 class="title">{x2;$basic['basic']}</h4>
                                {x2;if:$isopen}
                                <p class="intro">到期时间：{x2;date:$isopen['obendtime'],'Y-m-d'}</p>
                                {x2;else}
                                <p class="intro">未开通</p>
                                {x2;endif}
                            </div>
                        </div>
                    </li>
                    <li class="unstyled">
                        <div class="rows">
                            <p class="intro">{x2;$basic['basicdescribe']}</p>
                        </div>
                    </li>
                    {x2;if:$isopen}
                    <li class="unstyled">
                        <div class="rows text-center">
                            <a class="ajax btn primary" href="index.php?exam-phone-index-setCurrentBasic&basicid={x2;$basic['basicid']}">进入考场</a>
                        </div>
                    </li>
                    {x2;else}
                    {x2;if:$allowopen}
                    {x2;if:$basic['basicdemo']}
                    <li class="unstyled">
                        <div class="rows text-center">
                            <a class="btn primary confirm" message="确定要开通吗？" href="index.php?exam-phone-basics-openit&basicid={x2;$basic['basicid']}">免费开通</a>
                        </div>
                    </li>
                    {x2;else}
                    {x2;if:$price}

                    {x2;tree:$price,p,pid}
                    <li class="unstyled">
                        <a class="confirm" message="确定要开通吗？" href="index.php?exam-phone-basics-openit&basicid={x2;$basic['basicid']}&opentype={x2;v:key}">
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
                    {x2;else}
                    <li class="unstyled">
                        <div class="rows text-center">
                            <a class="btn danger" href="javascript:;">您所在的用户组不能开通本考场</a>
                        </div>
                    </li>
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
