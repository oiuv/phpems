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
                            <li><a href="index.php?{x2;$_app}-master-basic">科目管理</a></li>
                            <li><a href="index.php?{x2;$_app}-master-basic-section&subjectid={x2;$section['sectionsubjectid']}&page={x2;$page}{x2;$u}">章节管理</a></li>
                            <li><a href="index.php?exam-master-basic-point&sectionid={x2;$knows['knowssectionid']}&page={x2;$page}{x2;$u}">知识点管理</a></li>
                            <li class="active">修改知识点</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        修改知识点
                        <a class="btn btn-primary pull-right" href="index.php?exam-master-basic-point&sectionid={x2;$knows['knowssectionid']}&page={x2;$page}{x2;$u}">知识点管理</a>
                    </h4>
                    <form action="index.php?exam-master-basic-modifypoint" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="knows">知识点名称：</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="knows" name="args[knows]" type="text" size="30" value="{x2;$knows['knows']}" needle="needle" alt="请输入知识点名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                              <label class="control-label col-sm-2"></label>
                              <div class="col-sm-9">
                                  <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="knowsid" value="{x2;$knows['knowsid']}"/>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                                <input type="hidden" name="modifypoint" value="1"/>
                            </div>
                        </div>
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
