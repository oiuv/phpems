{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-2 leftmenu">
                {x2;include:menu}
            </div>
            <div id="datacontent">
{x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;$_app}-teach">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-teach-contents&page={x2;$page}">课件管理</a></li>
                            <li class="active">添加课件</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:hidden">
                    <h4 class="title" style="padding:10px;">
                        选择模型
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-teach-contents&courseid={x2;$courseid}&page={x2;$page}">课件管理</a>
                    </h4>
                    <div style="padding: 10px 0px;overflow:visible">
                        {x2;tree:$modules,module,mid}
                        <a class="col-xs-3 text-center" href="index.php?course-teach-contents-add&courseid={x2;$courseid}&moduleid={x2;v:module['moduleid']}">
                            <div class="well">
                                <h2>{x2;v:module['modulename']}</h2>
                                <p>{x2;v:module['moduledescribe']}</p>
                            </div>
                        </a>
                        {x2;endtree}
                    </div>
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
