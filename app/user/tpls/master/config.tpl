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
                            <li><a href="index.php?core-master">全局</a></li>
                            <li><a href="index.php?core-master-apps">模块管理</a></li>
                            <li class="active">模块设置</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h5 class="title">{x2;if:$app['appname']}{x2;$app['appname']}{x2;else}{x2;$appid}{x2;endif}</h5>
                    <form action="index.php?user-master-config" method="post" class="form-horizontal" style="padding-top:10px;margin-bottom:0px;">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">注册选项：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input name="args[appsetting][closeregist]" type="radio" value="0" {x2;if:!$app['appsetting']['closeregist']}checked{x2;endif}/>开启注册
                                </label>
                                <label class="radio-inline">
                                    <input name="args[appsetting][closeregist]" type="radio" value="1" {x2;if:$app['appsetting']['closeregist']}checked{x2;endif}/>关闭注册
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">注册模式：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input name="args[appsetting][registype]" type="radio" value="0" {x2;if:!$app['appsetting']['registype']}checked{x2;endif}/>经典模式
                                </label>
                                <label class="radio-inline">
                                    <input name="args[appsetting][registype]" type="radio" value="1" {x2;if:$app['appsetting']['registype']}checked{x2;endif}/>自定义模式
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">管理员权限：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input name="args[appsetting][managemodel]" type="radio" value="0" {x2;if:!$app['appsetting']['managemodel']}checked{x2;endif}/>关闭权限区分
                                </label>
                                <label class="radio-inline">
                                    <input name="args[appsetting][managemodel]" type="radio" value="1" {x2;if:$app['appsetting']['managemodel']}checked{x2;endif}/>开启权限区分
                                </label>
                                <span class="help-block">关闭权限区分后，所有管理员权限相同；开启权限区分后，管理员权限根据设置不同而不同。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">登录选项：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input name="args[appsetting][loginmodel]" type="radio" value="0" {x2;if:!$app['appsetting']['loginmodel']}checked{x2;endif}/>不限登录
                                </label>
                                <label class="radio-inline">
                                    <input name="args[appsetting][loginmodel]" type="radio" value="1" {x2;if:$app['appsetting']['loginmodel']}checked{x2;endif}/>后登陆踢掉已登录者
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱验证：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input name="args[appsetting][emailverify]" type="radio" value="0" {x2;if:!$app['appsetting']['emailverify']}checked{x2;endif}/>不开启
                                </label>
                                <label class="radio-inline">
                                    <input name="args[appsetting][emailverify]" type="radio" value="1" {x2;if:$app['appsetting']['emailverify']}checked{x2;endif}/>开启
                                </label>
                                <span class="help-block">目前仅支持QQ邮箱验证，需要支持SSL收发。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seo_title" class="col-sm-2 control-label">QQ邮箱用户名：</label>
                            <div class="col-sm-9">
                                <input id="seo_title" class="form-control" name="args[appsetting][emailaccount]" type="text" value="{x2;$app['appsetting']['emailaccount']}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seo_keywords" class="col-sm-2 control-label">QQ邮箱安全码：</label>
                            <div class="col-sm-9">
                                <input id="seo_keywords" class="form-control" name="args[appsetting][emailpassword]" type="text" value="{x2;$app['appsetting']['emailpassword']}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="regfields" class="col-sm-2 control-label">注册所需字段：</label>
                            <div class="col-sm-9">
                                <textarea id="regfields" rows="4" class="form-control" name="args[appsetting][regfields]" class="input-xxlarge">{x2;$app['appsetting']['regfields']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="outfields" class="col-sm-2 control-label">导出所需字段：</label>
                            <div class="col-sm-9">
                                <textarea id="outfields" rows="4" class="form-control" name="args[appsetting][outfields]" class="input-xxlarge">{x2;$app['appsetting']['outfields']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seo_description" class="col-sm-2 control-label"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                                <input type="hidden" name="appconfig" value="1"/>
                                <input type="hidden" name="appid" value="{x2;$appid}"/>
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
