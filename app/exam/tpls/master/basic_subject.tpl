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
                            <li class="active">科目管理</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        科目管理
                        <a class="btn btn-primary pull-right" href="index.php?exam-master-basic-addsubject">添加科目</a>
                    </h4>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>科目ID</th>
                                <th>科目名称</th>
                                <th width="220">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:$subjects,subject,sid}
                            <tr>
                                <td>{x2;v:subject['subjectid']}</td>
                                <td>{x2;v:subject['subject']}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn ajax" href="index.php?exam-master-basic-clearpoint&subjectid={x2;v:subject['subjectid']}" title="更新缓存"><em class="glyphicon glyphicon-refresh"></em></a>
                                        <a class="btn ajax" href="index.php?exam-master-basic-output&subjectid={x2;v:subject['subjectid']}&page={x2;$page}{x2;$u}" title="导出题库"><em class="glyphicon glyphicon-download-alt"></em></a>
                                        <a class="btn" href="index.php?exam-master-basic-section&subjectid={x2;v:subject['subjectid']}&page=1&basicid={x2;v:basic['basicid']}{x2;$u}" title="章节列表"><em class="glyphicon glyphicon-th-list"></em></a>
                                        <a class="btn" href="index.php?exam-master-basic-modifysubject&subjectid={x2;v:subject['subjectid']}&page={x2;$page}{x2;$u}" title="修改科目信息"><em class="glyphicon glyphicon-edit"></em></a>
                                        <a class="btn ajax" href="index.php?exam-master-basic-delsubject&subjectid={x2;v:subject['subjectid']}&page={x2;$page}{x2;$u}" title="删除科目"><em class="glyphicon glyphicon-remove"></em></a>
                                    </div>
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
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
