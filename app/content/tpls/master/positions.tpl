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
                            <li class="active">推荐管理</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        推荐位
                        <span class="pull-right">
                            <a class="btn btn-primary" href="index.php?{x2;$_app}-master-positions-add">添加推荐位</a>
                        </span>
                    </h4>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th width="80">ID</th>
                                <th>推荐位名称</th>
                                <th width="180">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;if:is_array($poses)}
                            {x2;tree:$poses,pos,pid}
                            <tr>
                                <td>{x2;v:pos['posid']}</td>
                                <td><span>{x2;v:pos['posname']}</span></td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn" href="index.php?content-master-positions-poscontent&posid={x2;v:pos['posid']}{x2;$u}"><em class="glyphicon glyphicon-list"></em></a>
                                        <a class="btn" href="index.php?{x2;$_app}-master-positions-modify&posid={x2;v:pos['posid']}{x2;$u}"><em class="glyphicon glyphicon-edit"></em></a>
                                        <a class="btn confirm" href="index.php?{x2;$_app}-master-positions-del&posid={x2;v:pos['posid']}&page={x2;$page}{x2;$u}"><em class="glyphicon glyphicon-remove"></em></a>
                                    </div>
                                </td>
                            </tr>
                            {x2;endtree}
                            {x2;endif}
                        </tbody>
                    </table>
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
