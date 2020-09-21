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
                            <li class="active">批量开通课程</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        批量开通课程
                    </h4>
                    <div id="tabs-260773" class="tabbable">
                        <ul class="nav nav-tabs" style="margin-bottom:20px;">
                            <li class="active">
                                <a href="#panel-65699" data-toggle="tab">用户名列表开通</a>
                            </li>
                            <li>
                                <a href="#panel-880294" data-toggle="tab">用户ID列表开通</a>
                            </li>
                            <li>
                                <a href="#panel-888294" data-toggle="tab">用户组开通</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="panel-65699" class="tab-pane active">
                                <form action="index.php?exam-master-users-batopen" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">用户名：</label>
                                          <div class="col-sm-9">
                                              <textarea class="form-control" rows="4" needle="needle" min="1" msg="您最少需要填写一个用户" name="usernames"></textarea>
                                              <span class="help-block">每个用户名请使用英文逗号隔开</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">考场ID：</label>
                                          <div class="col-sm-9">
                                              <textarea class="form-control" rows="4" needle="needle" msg="您最少需要填写一个考场" name="basics">{x2;$basicid}</textarea>
                                              <span class="help-block">每个考场ID请使用英文逗号隔开</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">时长：</label>
                                          <div class="col-sm-9 form-inline">
                                              <input size="5" name="days" class="form-control" type="text" needle="needle" msg="您最少需要填写一天" value="1"/> 天
                                        </div>
                                    </div>
                                    <div class="form-group">
                                          <label class="control-label col-sm-2"></label>
                                          <div class="col-sm-9">
                                              <button class="btn btn-primary" type="submit">提交</button>
                                              <input type="hidden" name="page" value="{x2;$page}"/>
                                              <input type="hidden" name="batopen" value="1"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="panel-880294" class="tab-pane">
                                <form action="index.php?exam-master-users-batopen" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">用户ID：</label>
                                          <div class="col-sm-9">
                                              <textarea class="form-control" rows="4" needle="needle" min="1" msg="您最少需要填写一个用户" name="userids"></textarea>
                                              <span class="help-block">每个ID请使用英文逗号隔开</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">考场ID：</label>
                                          <div class="col-sm-9">
                                              <textarea class="form-control" rows="4" needle="needle" msg="您最少需要填写一个考场" name="basics">{x2;$basicid}</textarea>
                                              <span class="help-block">每个考场ID请使用英文逗号隔开</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">时长：</label>
                                          <div class="col-sm-9 form-inline">
                                              <input size="5" name="days" class="form-control" type="text" needle="needle" msg="您最少需要填写一天" value="1"/> 天
                                        </div>
                                    </div>
                                    <div class="form-group">
                                          <label class="control-label col-sm-2"></label>
                                          <div class="col-sm-9">
                                              <button class="btn btn-primary" type="submit">提交</button>
                                              <input type="hidden" name="page" value="{x2;$page}"/>
                                              <input type="hidden" name="batopen" value="1"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="panel-888294" class="tab-pane">
                                <form action="index.php?exam-master-users-batopen" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">用户组ID：</label>
                                          <div class="col-sm-9">
                                              <textarea class="form-control" rows="4" needle="needle" min="1" msg="您最少需要填写一个用户组" name="usergroupids"></textarea>
                                              <span class="help-block">每个ID请使用英文逗号隔开</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">考场ID：</label>
                                          <div class="col-sm-9">
                                              <textarea class="form-control" rows="4" needle="needle" msg="您最少需要填写一个考场" name="basics">{x2;$basicid}</textarea>
                                              <span class="help-block">每个考场ID请使用英文逗号隔开</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">时长：</label>
                                          <div class="col-sm-9 form-inline">
                                              <input size="5" name="days" class="form-control" type="text" needle="needle" msg="您最少需要填写一天" value="1"/> 天
                                        </div>
                                    </div>
                                    <div class="form-group">
                                          <label class="control-label col-sm-2"></label>
                                          <div class="col-sm-9">
                                              <button class="btn btn-primary" type="submit">提交</button>
                                              <input type="hidden" name="page" value="{x2;$page}"/>
                                              <input type="hidden" name="batopen" value="1"/>
                                        </div>
                                    </div>
                                </form>
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
