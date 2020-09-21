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
                            <li><a href="index.php?{x2;$_app}-master-basic-section&subjectid={x2;$subjectid}&page={x2;$page}">科目管理</a></li>
                            <li class="active">添加章节</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        添加章节
                        <a class="btn btn-primary pull-right" href="index.php?exam-master-basic-section&subjectid={x2;$subjectid}&page={x2;$page}">章节管理</a>
                    </h4>
                    <form action="index.php?exam-master-basic-modifysection" method="post" class="form-horizontal">
                        <fieldset>
                        <legend>{x2;$subjects[$section['sectionsubjectid']]['subject']}</legend>
                        <div class="form-group">
                            <label for="section" class="control-label col-sm-2">章节名称：</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="args[section]" id="section" type="text" size="30" value="{x2;$section['section']}" class="required" alt="请输入章节名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                              <label class="control-label col-sm-2"></label>
                              <div class="col-sm-9">
                                  <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="sectionid" value="{x2;$section['sectionid']}"/>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                                <input type="hidden" name="modifysection" value="1"/>
                            </div>
                        </div>
                        </fieldset>
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
