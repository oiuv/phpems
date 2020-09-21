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
                            <li><a href="index.php?{x2;$_app}-teach">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-teach-users">课程成绩</a> <span class="divider">/</span></li>
                            <li class="active">教师评卷</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        教师评卷
                    </h4>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>ID</th>
                                <th>考试名称</th>
                                <th>考试时间</th>
                                <th>组卷类型</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:$exams['data'],exam,eid}
                            <tr>
                                <td>
                                    {x2;v:exam['ehid']}
                                </td>
                                <td>
                                    {x2;v:exam['ehexam']}
                                </td>
                                <td>
                                    {x2;date:v:exam['ehstarttime'],'Y-m-d'}
                                </td>
                                <td>
                                    {x2;if:v:exam['ehtype'] == 1}随机组卷{x2;else}手工组卷{x2;endif}
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn" href="index.php?{x2;$_app}-teach-users-score&page={x2;$page}&ehid={x2;v:exam['ehid']}{x2;$u}" title="评卷"><em class="glyphicon glyphicon-check"></em></a>
                                    </div>
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
                    <ul class="pagination pull-right">
                        {x2;$exams['pages']}
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
