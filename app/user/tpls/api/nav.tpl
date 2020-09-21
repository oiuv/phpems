<div class="container-fluid box" style="margin:0px auto;padding-top:10px;overflow:visible">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-3">
                <h1 style="font-size:42px;color:#337AB7;"><img src="app/core/styles/img/logo2.png" style="height:60px;margin-top:-10px;"/>&nbsp;<b>PHPEMS</b></h1>
            </div>
            <div class="col-xs-1">
            </div>
            <div class="col-xs-6" style="padding-top:22px;">
                <div class="form-inline">
                    <div class="form-group">
                        <input type="text" style="width:380px;" class="form-control" id="keyword" placeholder="搜索课程/资料">
                    </div>
                    <button type="button" class="btn btn-info" onclick="javascript:window.location='index.php?content-app-search&keyword='+$('#keyword').val();">搜资料</button>
                    <button type="button" class="btn btn-primary" onclick="javascript:window.location='index.php?course-app-search&keyword='+$('#keyword').val();">搜课程</button>
                </div>
            </div>
            <div class="col-xs-2" style="padding-top:22px;">
                <ul class="list-unstyled list-inline">
                    {x2;if:$_user['userid']}
                    <li>
                        <div class="btn-group">
                            <button type="button" class="btn btn-info"><em class="glyphicon glyphicon-user"></em> {x2;$_user['username']}</button>
                            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="index.php?user-center"><em class="glyphicon glyphicon-user"></em> 用户中心</a></li>
                                {x2;if:$_user['teacher_subjects']}<li><a href="index.php?exam-teach"><em class="glyphicon glyphicon-book"></em> 教师管理</a></li>{x2;endif}
                                {x2;if:$_user['groupid'] == 1}<li><a href="index.php?core-master"><em class="glyphicon glyphicon-dashboard"></em> 后台管理</a></li>{x2;endif}
                                <li><a class="ajax" href="index.php?user-app-logout"><em class="glyphicon glyphicon-log-out"></em> 退出</a></li>
                            </ul>
                        </div>
                    </li>
                    {x2;else}
                    <li><a href="javascript:;" onclick="javascript:$.loginbox.show();" class="btn btn-default"> 登 录 </a></li>
                    <li><a href="index.php?user-app-register" class="btn btn-default"> 注 册 </a></li>
                    {x2;endif}
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid navbar" style="margin-top:0px;margin-bottom:0px;padding-top:10px;background-color:#337AB7;">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-12">
                <ul class="list-unstyled list-inline">
                    <li class="menu col-xs-1"><a href="index.php" class="icon">首页</a></li>
                    <li class="menu col-xs-1"><a href="index.php?course">课程</a></li>
                    <li class="menu col-xs-1"><a href="index.php?exam">考试</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
