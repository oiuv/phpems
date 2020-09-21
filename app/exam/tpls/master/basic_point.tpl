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
                            <li><a href="index.php?{x2;$_app}-master-basic-subject">科目管理</a></li>
                            <li><a href="index.php?{x2;$_app}-master-basic-section&subjectid={x2;$section['sectionsubjectid']}">章节管理</a></li>
                            <li class="active">知识点管理</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        {x2;$section['section']}
                        <a class="btn btn-primary pull-right" href="index.php?exam-master-basic-addpoint&sectionid={x2;$section['sectionid']}{x2;$u}">添加知识点</a>
                    </h4>
                    <form action="index.php?exam-master-basic-orderpoint" method="post" class="form-horizontal">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr class="info">
                                    <th width="48">权重</th>
                                    <th width="80">知识点ID</th>
                                    <th>知识点名称</th>
                                    <th width="180">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {x2;tree:$knows['data'],know,kid}
                                <tr>
                                    <td>
                                        <input class="form-control" type="text" name="delids[{x2;v:know['knowsid']}]" value="{x2;v:know['knowssequence']}" style="width:32px;padding:2px 5px;"/>
                                    </td>
                                    <td>{x2;v:know['knowsid']}</td>
                                    <td>{x2;v:know['knows']}</td>
                                    <td>
                                        <div class="btn-group">
                                            <a class="btn ajax" href="index.php?exam-master-basic-clearpoint&knowsid={x2;v:know['knowsid']}" title="更新缓存"><em class="glyphicon glyphicon-refresh"></em></a>
                                            <a class="btn ajax" href="index.php?exam-master-basic-output&knowsid={x2;v:know['knowsid']}&page={x2;$page}{x2;$u}" title="导出题库"><em class="glyphicon glyphicon-download-alt"></em></a>
                                            <a class="btn" href="index.php?{x2;$_app}-master-basic-modifypoint&knowsid={x2;v:know['knowsid']}&page={x2;$page}{x2;$u}" title="修改知识点"><em class="glyphicon glyphicon-edit"></em></a>
                                            <a class="btn confirm" href="index.php?{x2;$_app}-master-basic-delpoint&sectionid={x2;v:know['knowssectionid']}&knowsid={x2;v:know['knowsid']}&page={x2;$page}{x2;$u}" title="删除知识点"><em class="glyphicon glyphicon-remove"></em></a>
                                        </div>
                                    </td>
                                </tr>
                                {x2;endtree}
                            </tbody>
                        </table>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">排序</button>
                            </div>
                        </div>
                        <ul class="pagination pull-right">
                            {x2;$knows['pages']}
                        </ul>
                    </form>
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
