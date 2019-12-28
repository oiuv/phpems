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
                            <li><a href="index.php?user-master-user">用户管理</a></li>
                            <li class="active">修改用户</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title">{x2;$user['username']}</h4>
                    <div id="tabs-694325" class="tabbable" style="margin-top:20px;">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#panel-344373" data-toggle="tab">用户资料</a>
                            </li>
                            <li>
                                <a href="#panel-788842" data-toggle="tab">修改用户组</a>
                            </li>
                            <li>
                                <a href="#panel-788885" data-toggle="tab">修改密码</a>
                            </li>
                            {x2;if:$modules[$groups[$user['usergroupid']]['groupmoduleid']]['modulecode'] == 'teacher'}
                            <li>
                                <a href="#panel-788855" data-toggle="tab">管理科目</a>
                            </li>
                            {x2;endif}
                            <a class="pull-right btn btn-primary" href="index.php?user-master-user">用户列表</a>
                        </ul>
                        <div class="tab-content" style="margin-top:20px;">
                            <div id="panel-344373" class="tab-pane active">
                                <form action="index.php?user-master-user-modify" method="post" class="form-horizontal">
                                    <fieldset>
                                        {x2;tree:$forms,form,fid}
                                        <div class="form-group">
                                            <label for="{x2;v:form['id']}" class="control-label col-sm-2">{x2;v:form['title']}：</label>
                                            <div class="col-sm-9">
                                            {x2;v:form['html']}
                                            </div>
                                        </div>
                                        {x2;endtree}
                                        <div class="form-group">
                                            <label class="control-label col-sm-2"></label>
                                            <div class="col-sm-9">
                                                <button class="btn btn-primary" type="submit">提交</button>
                                                <input type="hidden" name="userid" value="{x2;$user['userid']}"/>
                                                <input type="hidden" name="modifyuserinfo" value="1"/>
                                                <input type="hidden" name="page" value="{x2;$page}"/>
                                                {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                                {x2;endtree}{x2;endif}
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                            <div id="panel-788842" class="tab-pane">
                                <form action="index.php?user-master-user-modify" method="post" class="form-horizontal">
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">电子邮箱：</label>
                                            <div class="col-sm-9"><span class="help-block">{x2;$user['useremail']}</span></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="groupid" class="control-label col-sm-2">用户用户组：</label>
                                            <div class="col-sm-3">
                                                <select class="form-control" name="groupid" id="groupid">
                                                    {x2;tree:$groups,group,gid}
                                                    <option value="{x2;v:group['groupid']}"{x2;if:$user['usergroupid'] == v:group['groupid']}selected{x2;endif}>{x2;v:group['groupname']}</option>
                                                    {x2;endtree}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2"></label>
                                            <div class="col-sm-9">
                                                <button class="btn btn-primary" type="submit">提交</button>
                                                <input type="hidden" name="userid" value="{x2;$user['userid']}"/>
                                                <input type="hidden" name="modifyusergroup" value="1"/>
                                                <input type="hidden" name="page" value="{x2;$page}"/>
                                                {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                                {x2;endtree}{x2;endif}
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                            <div id="panel-788885" class="tab-pane">
                                <form action="index.php?user-master-user-modify" method="post" class="form-horizontal">
                                    <fieldset>
                                        <div class="form-group">
                                            <label for="passowrd1" class="control-label col-sm-2">新密码：</label>
                                            <div class="col-sm-4">
                                                <input class="form-control" id="passowrd1" type="password" name="args[password]" needle="true" datatype="password" msg="密码字数必须在6位以上"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password2" class="control-label col-sm-2">重复密码：</label>
                                            <div class="col-sm-4">
                                                <input class="form-control" id="password2" type="password" name="args[password2]" needle="true" equ="passowrd1" msg="前后两次密码必须一致且不能为空"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2"></label>
                                            <div class="col-sm-9">
                                                <button class="btn btn-primary" type="submit">提交</button>
                                                <input type="hidden" name="userid" value="{x2;$user['userid']}"/>
                                                <input type="hidden" name="modifyuserpassword" value="1"/>
                                                <input type="hidden" name="page" value="{x2;$page}"/>
                                                {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                                {x2;endtree}{x2;endif}
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                            <div id="panel-788855" class="tab-pane">
                                <form action="index.php?user-master-user-modify" method="post" class="form-horizontal">
                                    <fieldset>
                                        <div class="form-group">
                                            <label for="passowrd1" class="control-label col-sm-2">可管理科目：</label>
                                            <div class="col-sm-10">
                                                {x2;eval: $user['teacher_subjects'] = unserialize($user['teacher_subjects'])}
                                                {x2;tree:$subjects,subject,sid}
                                                <label class="checkbox-inline">
                                                    <input class="form-control" type="checkbox" name="subjects[]" value="{x2;v:subject['subjectid']}"{x2;if:in_array(v:subject['subjectid'],$user['teacher_subjects'])} checked{x2;endif}/>
                                                    {x2;v:subject['subject']}
                                                </label>
                                                {x2;endtree}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2"></label>
                                            <div class="col-sm-9">
                                                <button class="btn btn-primary" type="submit">提交</button>
                                                <input type="hidden" name="userid" value="{x2;$user['userid']}"/>
                                                <input type="hidden" name="setteachsubject" value="1"/>
                                                <input type="hidden" name="page" value="{x2;$page}"/>
                                                {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                                {x2;endtree}{x2;endif}
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
