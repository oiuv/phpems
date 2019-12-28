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
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-master-user">用户管理</a></li>
                            <li class="active">添加用户</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        添加用户
                        <a class="pull-right btn btn-primary" href="index.php?user-master-user">用户列表</a>
                    </h4>
                    <form action="index.php?user-master-user-add" method="post" class="form-horizontal" style="margin-top:40px;">
                        <div class="form-group">
                            <label for="username" class="control-label col-sm-2">用户名</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="args[username]" id="username" size="25" type="text" value="" needle="needle" datatype="username" max="40" alt="请输入用户名称"  msg="用户名必须为长度不少于3的中英文字符"/>
                                <span class="help-block">请输入用户名称</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password1" class="control-label col-sm-2">密码</label>
                            <div class="col-sm-4">
                                <input class="form-control" type="password" id="password1" needle="needle" datatype="password" min="6" max="20" msg="密码应为长度在6-20位之间，不为空格的字符" name="args[userpassword]"/>
                                <span class="help-block">密码应为长度在6-20位之间，不为空格的字符</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password2" class="control-label col-sm-2">重复密码</label>
                            <div class="col-sm-4">
                                <input class="form-control" type="password" id="password2" equ="password1" needle="needle" datatype="password" msg="重复密码必须和之前的密码一致" name="args[userpassword2]"/>
                                <span class="help-block">重复密码必须和之前的密码一致</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="control-label col-sm-2">电子邮箱</label>
                            <div class="col-sm-4">
                                <input class="form-control" type="text" id="email" needle="needle" datatype="email" name="args[useremail]" msg="请输入正确格式的电子邮箱，如abc@163.com"/>
                                <span class="help-block">请输入正确格式的电子邮箱，如abc@163.com</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="modules" class="control-label col-sm-2">模型</label>
                            <div class="col-sm-4">
                                <select id="modules" class="form-control combox" name="args[usergroupid]" needle="needle" msg="您必须为这个用户选择一个模型" target="groupid" refUrl="index.php?user-master-ajax-getActorsByModule&moduleid={value}">
                                    <option value="">请选择模型</option>
                                    {x2;tree:$modules,module,mid}
                                    <option value="{x2;v:module['moduleid']}">{x2;v:module['modulename']}</option>
                                    {x2;endtree}
                                </select>
                                <span class="help-block">为这个用户选择一个模型</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="groupid" class="control-label col-sm-2">用户组</label>
                            <div class="col-sm-4">
                                <select id="groupid" class="form-control" name="args[usergroupid]" needle="needle" msg="您必须为这个用户选择一个用户组" autocomplete="off" default="请先选择模型">
                                    <option value="">请先选择模型</option>
                                </select>
                                <span class="help-block">为这个用户选择一个用户组</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="groupid" class="control-label col-sm-2"></label>
                            <div class="col-sm-4">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="insertUser" value="1"/>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                                {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                {x2;endtree}{x2;endif}
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
