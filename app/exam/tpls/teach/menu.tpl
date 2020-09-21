<style>
.panel-heading a{
color:#FFFFFF;
text-decoration:none;}
</style>
<div class="panel-group" id="panel-13465">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <a class="panel-toggle text-center" data-parent="#panel-13465" data-toggle="collapse" href="#panel-element-707348">
                <em class="glyphicon glyphglyphicon glyphicon-th-large"></em> 考试设计
            </a>
        </div>
        <div id="panel-element-707348" class="panel-collapse{x2;if:$method == 'basic'} in{x2;endif} collapse" role="tabpanel">
             <ul class="list-group">
                <li class="list-group-item"><a href="?{x2;$_app}-teach-basic">考场列表</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <a class="panel-toggle text-center" data-parent="#panel-13465" data-toggle="collapse" href="#panel-element-2120901">
                <em class="glyphicon glyphglyphicon glyphicon-wrench"></em> 课程成绩
            </a>
        </div>
        <div id="panel-element-2120901" class="panel-collapse{x2;if:$method == 'users'} in{x2;endif} collapse" role="tabpanel">
             <ul class="list-group">
                <li class="list-group-item"><a href="index.php?{x2;$_app}-teach-users">成绩管理</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <a class="panel-toggle text-center" data-parent="#panel-13465" data-toggle="collapse" href="#panel-element-212076">
                <em class="glyphicon glyphglyphicon glyphicon-text-color"></em> 试题管理
            </a>
        </div>
        <div id="panel-element-212076" class="panel-collapse{x2;if:$method == 'questions' || $method == 'rowsquestions'} in{x2;endif} collapse" role="tabpanel">
             <ul class="list-group">
                <li class="list-group-item"><a href="index.php?{x2;$_app}-teach-questions">普通试题管理</a></li>
                <li class="list-group-item"><a href="index.php?{x2;$_app}-teach-rowsquestions">题帽题管理</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <a class="panel-toggle text-center" data-parent="#panel-13465" data-toggle="collapse" href="#panel-element-212096">
                <em class="glyphicon glyphglyphicon glyphicon-duplicate"></em> 试卷管理
            </a>
        </div>
        <div id="panel-element-212096" class="panel-collapse{x2;if:$method == 'exams'} in{x2;endif} collapse" role="tabpanel">
             <ul class="list-group">
                <li class="list-group-item"><a href="index.php?{x2;$_app}-teach-exams">试卷列表</a></li>
                <li class="list-group-item"><a href="index.php?{x2;$_app}-teach-exams-autopage">随机组卷</a></li>
                <li class="list-group-item"><a href="index.php?{x2;$_app}-teach-exams-selfpage">手工组卷</a></li>
                <li class="list-group-item"><a href="index.php?{x2;$_app}-teach-exams-temppage">即时组卷</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <a class="panel-toggle text-center" data-parent="#panel-13465" data-toggle="collapse" href="#panel-element-212090">
                <em class="glyphicon glyphglyphicon glyphicon-trash"></em> 回收站
            </a>
        </div>
        <div id="panel-element-212090" class="panel-collapse{x2;if:$method == 'recyle'} in{x2;endif} collapse" role="tabpanel">
             <ul class="list-group">
                <li class="list-group-item"><a href="index.php?{x2;$_app}-teach-recyle">普通试题</a></li>
                <li class="list-group-item"><a href="index.php?{x2;$_app}-teach-recyle-rows">题帽题</a></li>
            </ul>
        </div>
    </div>
</div>
