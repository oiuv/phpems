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
                            <li class="active">用户组管理</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        用户组列表
                        <a class="pull-right btn btn-primary" href="index.php?user-master-actor-add">添加用户组</a>
                    </h4>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>ID</th>
                                <th>用户组名</th>
                                <th>默认注册用户组</th>
                                <th>绑定模型</th>
                                <th>用户组描述</th>
                                <th width="100">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:$actors['data'],group,gid}
                            <tr>
                                <td>{x2;v:group['groupid']}</td>
                                <td>{x2;v:group['groupname']}</td>
                                <td>{x2;if:v:group['groupdefault']}<a class="glyphicon glyphicon-ok"></a>{x2;else}<a class="glyphicon glyphicon-remove ajax" href="index.php?user-master-actor-selectactor&groupid={x2;v:group['groupid']}&page={x2;$page}{x2;$u}"></a>{x2;endif}</td>
                                <td>{x2;$modules[v:group['groupmoduleid']]['modulename']}</td>
                                <td>{x2;v:group['groupdescribe']}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn" href="index.php?user-master-actor-modifyactor&groupid={x2;v:group['groupid']}&page={x2;$page}{x2;$u}" title="修改用户组"><em class="glyphicon glyphicon-edit"></em></a>
                                        <a msg="删除后不可恢复，您确定要进行此操作吗？" class="btn confirm" href="index.php?user-master-actor-delactor&groupid={x2;v:group['groupid']}&page={x2;$page}{x2;$u}" title="删除用户组"><em class="glyphicon glyphicon-remove"></em></a>
                                    </div>
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
                    <ul class="pagination pagination-right">
                        {x2;$actors['pages']}
                    </ul>
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
