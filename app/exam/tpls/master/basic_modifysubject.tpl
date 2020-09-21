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
                            <li class="active">修改科目</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        修改科目
                        <a class="btn btn-primary pull-right" href="index.php?exam-master-basic-subject">科目管理</a>
                    </h4>
                    <form action="index.php?exam-master-basic-modifysubject" method="post" class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                                <label for="subject" class="control-label col-sm-2">科目名称：</label>
                                <div class="col-sm-9">
                                    <input class="form-control" name="args[subject]" id="subject" type="text" size="30" value="{x2;$subject['subject']}" needle="needle" msg="您必须输入一个科目名称" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="subject" class="control-label col-sm-2">科目题型：</label>
                                <div class="col-sm-9">
                                    {x2;tree:$questypes,questype,qid}
                                    <label class="checkbox-inline">
                                          <input type="checkbox" name="args[subjectsetting][questypes][{x2;v:questype['questid']}]" value="1"{x2;if:$subject['subjectsetting']['questypes'][v:questype['questid']]} checked{x2;endif}/> {x2;v:questype['questype']}
                                      </label>
                                      {x2;endtree}
                                </div>
                            </div>
                            <div class="form-group">
                                  <label for="subject" class="control-label col-sm-2"></label>
                                  <div class="col-sm-9">
                                      <button class="btn btn-primary" type="submit">提交</button>
                                    <input type="hidden" name="modifysubject" value="1"/>
                                    <input type="hidden" name="subjectid" value="{x2;$subject['subjectid']}"/>
                                    <input type="hidden" name="page" value="{x2;$page}"/>
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
