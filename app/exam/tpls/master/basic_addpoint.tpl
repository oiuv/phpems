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
                            <li><a href="index.php?{x2;$_app}-master-basic-section&subjectid={x2;$section['sectionsubjectid']}&page={x2;$page}">章节管理</a></li>
                            <li class="active">知识点管理</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        知识点管理
                        <a class="btn btn-primary pull-right" href="index.php?exam-master-basic-addpoint&sectionid={x2;$section['sectionid']}&page={x2;$page}{x2;$u}">添加知识点</a>
                    </h4>
                    <form action="index.php?exam-master-basic-addpoint" method="post" class="form-horizontal">
                        <fieldset>
                        <legend>{x2;$section['section']}</legend>
                        <div class="form-group">
                            <label for="knows" class="control-label col-sm-2">知识点名称：</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="knows" name="args[knows]" type="text" size="30" value="" needle="needle" msg="请输入知识点名称" />
                                <span class="help-block">可用通过英文逗号隔开多个知识点名称来批量录入</span>
                            </div>
                        </div>
                        <div class="form-group">
                              <label class="control-label col-sm-2"></label>
                              <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="insertknows" value="1"/>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                                <input type="hidden" name="args[knowssectionid]" value="{x2;$section['sectionid']}"/>
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
