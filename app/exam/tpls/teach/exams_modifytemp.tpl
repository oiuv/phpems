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
                            <li><a href="index.php?exam-teach-exams">试卷管理</a></li>
                            <li class="active">即时组卷修改</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        即时组卷修改
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-teach-exams&page={x2;$page}{x2;$u}">试卷管理</a>
                    </h4>
                    <form action="index.php?exam-teach-exams-modify" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">试卷名称：</label>
                            <div class="col-sm-4">
                                  <input class="form-control" type="text" name="args[exam]" value="{x2;$exam['exam']}" needle="needle" msg="您必须为该试卷输入一个名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">评卷方式</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                    <input name="args[examdecide]" type="radio" value="1"{x2;if:$exam['examdecide']} checked{x2;endif}/>教师评卷
                                </label>
                                <label class="radio-inline">
                                    <input name="args[examdecide]" type="radio" value="0"{x2;if:!$exam['examdecide']} checked{x2;endif}/>学生自评
                                </label>
                                <span class="help-block">教师评卷时有主观题则需要教师在后台评分后才能显示分数，无主观题自动显示分数。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">考试科目：</label>
                              <div class="col-sm-9">
                                  <label class="radio-inline">
                                      <input type="hidden" name="args[examsubject]" value="{x2;$exam['examsubject']}" />
                                      {x2;$subjects[$exam['examsubject']]['subject']}
                                  </label>
                              </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">考试时间：</label>
                              <div class="col-sm-9 form-inline">
                                  <input class="form-control" type="text" name="args[examsetting][examtime]" size="4" needle="needle" value="{x2;$exam['examsetting']['examtime']}"/> 分钟
                              </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">来源：</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="args[examsetting][comfrom]" value="{x2;$exam['examsetting']['comfrom']}" size="4"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">试卷总分：</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="args[examsetting][score]" value="{x2;$exam['examsetting']['score']}" size="4" needle="needle" msg="你要为本考卷设置总分" datatype="number"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">及格线：</label>
                              <div class="col-sm-4">
                                  <input class="form-control" type="text" name="args[examsetting][passscore]" value="{x2;$exam['examsetting']['passscore']}" size="4" needle="needle" msg="你要为本考卷设置一个及格分数线" datatype="number"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">题型排序</label>
                            <div class="col-sm-9">
                                <div class="sortable btn-group">
                                    {x2;if:$exam['examsetting']['questypelite']}
                                    {x2;tree:$exam['examsetting']['questypelite'],qlid,eqid}
                                    <a class="btn btn-primary questpanel panel_{x2;v:key}">{x2;$questypes[v:key]['questype']}<input type="hidden" name="args[examsetting][questypelite][{x2;v:key}]" value="1" class="questypepanelinput" id="panel_{x2;v:key}"/></a>
                                    {x2;endtree}
                                    {x2;else}
                                    {x2;tree:$questypes,questype,qid}
                                    <a class="btn btn-primary questpanel panel_{x2;v:questype['questid']}">{x2;v:questype['questype']}<input type="hidden" name="args[examsetting][questypelite][{x2;v:questype['questid']}]" value="1" class="questypepanelinput" id="panel_{x2;v:questype['questid']}"/></a>
                                    {x2;endtree}
                                    {x2;endif}
                                </div>
                                <span class="help-block">拖拽进行题型排序</span>
                            </div>
                        </div>
                        {x2;tree:$questypes,questype,qid}
                        <div class="form-group questpanel panel_{x2;v:questype['questid']}">
                            <label class="control-label col-sm-2">{x2;v:questype['questype']}：</label>
                            <div class="col-sm-9 form-inline">
                                <span class="info">共&nbsp;</span>
                                <input id="iselectallnumber_{x2;v:questype['questid']}" type="text" class="form-control" needle="needle" name="args[examsetting][questype][{x2;v:questype['questid']}][number]" value="{x2;eval: echo intval($exam['examsetting']['questype'][v:questype['questid']]['number'])}" size="2" msg="您必须填写总题数"/>
                                <span class="info">&nbsp;题，每题&nbsp;</span><input class="form-control" needle="needle" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][score]" value="{x2;eval: echo floatval($exam['examsetting']['questype'][v:questype['questid']]['score'])}" size="2" msg="您必须填写每题的分值"/>
                                <span class="info">&nbsp;分，描述&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][describe]" value="{x2;$exam['examsetting']['questype'][v:questype['questid']]['describe']}" size="12"/>
                            </div>
                        </div>
                        {x2;endtree}
                        <div class="form-group">
                            <label class="control-label col-sm-2">示范格式</label>
                            <div class="col-sm-9">
                                <img src="app/exam/styles/image/demo2.png" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lesson_video" class="control-label col-sm-2">待导入文件</label>
                            <div class="col-sm-9 form-inline">
                                <script type="text/template" id="pe-template-uploadfile">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                        <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                            <li class="text-center">
                                                <input size="45" class="form-control qq-edit-filename-selector" type="text" name="uploadfile" tabindex="0" value="">
                                            </li>
                                        </ul>
                                        <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                            <li class="text-center">
                                                <input size="45" class="form-control qq-edit-filename-selector" type="text" name="uploadfile" tabindex="0" value="">
                                            </li>
                                        </ul>
                                        <div class="qq-upload-button-selector col-xs-3">
                                            <button class="btn btn-primary">上传文件</button>
                                        </div>

                                    </div>
                                </script>
                                <div class="fineuploader" attr-type="files" attr-template="pe-template-uploadfile" attr-ftype="csv"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                  <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="submitsetting" value="1"/>
                                <input name="examid" type="hidden" value="{x2;$exam['examid']}">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
<script>
$.getJSON('index.php?exam-teach-basic-getsubjectquestype&subjectid={x2;$exam['examsubject']}&'+Math.random(),function(data){$('.questpanel').hide();$('.questypepanelinput').val('0');for(x in data){$('.panel_'+data[x]).show();$('#panel_'+data[x]).val('1');}});
</script>
{x2;include:footer}
</body>
</html>
{x2;endif}
