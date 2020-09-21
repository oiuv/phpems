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
                            {x2;if:$catid}
                            <li><a href="index.php?{x2;$_app}-master-seminars">专题管理</a></li>
                            <li class="active">{x2;$categories[$catid]['catname']}</li>
                            {x2;else}
                            <li class="active">专题管理</li>
                            {x2;endif}
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:20px;margin-bottom:0px;overflow:visible">
                    <ul class="nav nav-tabs">
                        <li>
                            <a href="index.php?seminar-master-tpls-style">风格</a>
                        </li>
                        <li>
                            <a href="index.php?seminar-master-tpls-layout">通栏</a>
                        </li>
                        <li>
                            <a href="index.php?seminar-master-tpls-slider">轮播</a>
                        </li>
                        <li>
                            <a href="index.php?seminar-master-tpls-lists">列表</a>
                        </li>
                        <li class="active">
                            <a href="index.php?seminar-master-tpls-block">图文</a>
                        </li>
                        <li>
                            <a href="index.php?seminar-master-tpls-plugin">插件</a>
                        </li>
                        <span class="pull-right">
                            <a class="btn btn-primary" href="index.php?seminar-master-tpls-add&type=block">添加图文</a>
                        </span>
                    </ul>
                    <div class="tab-content" style="margin-top: 10px;">
                        <div class="tab-pane active">
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr class="info">
                                    <th width="40">ID</th>
                                    <th width="120">名称</th>
                                    <th>说明</th>
                                    <th width="140">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                {x2;tree:$tpls['data'],tpl,tid}
                                    <tr>
                                        <td>{x2;v:tpl['stplid']}</td>
                                        <td>{x2;v:tpl['stplname']}</td>
                                        <td>{x2;v:tpl['stpldescribe']}</td>
                                        <td>
                                            <div class="btn-group">
                                                <a class="btn" href="index.php?seminar-master-tpls-modify&stplid={x2;v:tpl['stplid']}"><em class="glyphicon glyphicon-edit"></em></a>
                                                <a class="btn confirm" href="index.php?seminar-master-tpls-del&stplid={x2;v:tpl['stplid']}"><em class="glyphicon glyphicon-remove"></em></a>
                                            </div>
                                        </td>
                                    </tr>
                                {x2;endtree}
                                </tbody>
                            </table>
                            <ul class="pagination pull-right">
                                {x2;$tpls['pages']}
                            </ul>
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
