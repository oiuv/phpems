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
                            <li class="active">成员列表</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        【{x2;$basic['basic']}】成员列表
                        <span class="dropdown pull-right">
                            <a class="btn btn-primary" href="#" data-toggle="dropdown">增加人员 <strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li><a href="index.php?exam-master-users-batopen&basicid={x2;$basicid}">根据条件增加</a></li>
                                <li><a href="index.php?{x2;$_app}-master-basic-selectmember&basicid={x2;$basicid}">用户列表选择</a></li>
                            </ul>
                        </span>
                    </h4>
                    <form action="index.php?exam-master-basic-members&basicid={x2;$basicid}" method="post" class="form-inline">
                        <table class="table">
                            <tr>
                                <td style="border-top:0px;">
                                    用户ID：
                                </td>
                                <td style="border-top:0px;">
                                    <input name="search[userid]" class="form-control" size="25" type="text" class="number" value="{x2;$search['userid']}"/>
                                </td>
                                <td style="border-top:0px;">
                                    用户名：
                                </td>
                                <td style="border-top:0px;">
                                    <input class="form-control" name="search[username]" size="25" type="text" value="{x2;$search['username']}"/>
                                </td>
                                <td style="border-top:0px;">
                                    <button class="btn btn-primary" type="submit">搜索</button>
                                    <input type="hidden" value="1" name="search[argsmodel]" />
                                </td>
                            </tr>
                        </table>
                    </form>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>ID</th>
                                <th>用户名</th>
                                <th>姓名</th>
                                <th>开通时间</th>
                                <th>注册IP</th>
                                <th>积分点数</th>
                                <th>用户组</th>
                                <th>到期时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:$members['data'],user,uid}
                            <tr>
                                <td>{x2;v:user['userid']}</td>
                                <td>{x2;v:user['username']}</td>
                                <td>{x2;v:user['usertruename']}</td>
                                <td>{x2;date:v:user['obtime'],'Y-m-d'}</td><td>{x2;v:user['userregip']}</td>
                                <td>{x2;v:user['usercoin']}</td><td>{x2;$groups[v:user['usergroupid']]['groupname']}</td>
                                <td>{x2;date:v:user['obendtime'],'Y-m-d'}</td>
                                <td>
                                      <div class="btn-group">
                                        <a class="btn confirm" href="index.php?exam-master-users-closebasics&userid={x2;v:user['userid']}&basicid={x2;v:user['obbasicid']}{x2;$u}" title="取消开通"><em class="glyphicon glyphicon-remove"></em></a>
                                    </div>
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
                    <ul class="pagination pull-right">
                        {x2;$members['pages']}
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
