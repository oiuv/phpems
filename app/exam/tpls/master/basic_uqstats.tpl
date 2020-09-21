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
                            <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-master-basic">考场管理</a></li>
                            <li class="active">成绩分析</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        试题正确率情况
                        <a class="pull-right btn btn-primary" href="javascript:history.back();">返回</a></a>
                    </h4>
                    <div id="tabs-694325" class="tabbable">
                        <ul class="nav nav-tabs" style="margin-bottom: 10px;">
                            <li class="active">
                                <a href="#panel-344373" data-toggle="tab">正确名单</a>
                            </li>
                            <li>
                                <a href="#panel-788885" data-toggle="tab">错误名单</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="panel-344373" class="tab-pane active">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr class="info">
                                        <th>考卷ID</th>
                                        <th>用户ID</th>
                                        <th width="50%">用户名</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {x2;tree:$member['right'],stat,sid}
                                    <tr>
                                        <td>{x2;v:stat['id']}</td>
                                        <td>
                                            {x2;v:stat['userid']}
                                        </td>
                                        <td>
                                            {x2;realhtml:v:stat['username']}
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                    </tbody>
                                </table>
                            </div>
                            <div id="panel-788885" class="tab-pane">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr class="info">
                                        <th>考卷ID</th>
                                        <th>用户ID</th>
                                        <th width="50%">用户名</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {x2;tree:$member['wrong'],stat,sid}
                                    <tr>
                                        <td>{x2;v:stat['id']}</td>
                                        <td>
                                            {x2;v:stat['userid']}
                                        </td>
                                        <td>
                                            {x2;realhtml:v:stat['username']}
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
