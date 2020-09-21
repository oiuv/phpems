<div class="container-fluid navbar" style="margin-top:0px;margin-bottom:0px;background-color:#337AB7;">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-12">
                <ul class="list-unstyled list-inline">
                    <li>
                        <span class="logo">PHPEMS{x2;c:PE_VERSION}教师管理</span>
                    </li>
                    <li class="menu active"><a href="index.php?course-teach">课程</a></li>
                    <li class="menu"><a href="index.php?exam-teach">考试</a></li>
                    <li class="pull-right">
                        <div class="btn-group" style="margin-top: 15px;">
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
                </ul>
            </div>
        </div>
    </div>
</div>
