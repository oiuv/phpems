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
                            <li><a href="index.php?exam-master-exams">试卷管理</a></li>
                            <li class="active">手工组卷修改</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        手工组卷修改
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-exams&page={x2;$page}{x2;$u}">试卷管理</a>
                    </h4>
                    <form action="index.php?exam-master-exams-modify" method="post" class="form-horizontal">
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
                                  <label class="radio">{x2;$subjects[$exam['examsubject']]['subject']}</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">考试时间：</label>
                              <div class="col-sm-9 form-inline">
                                  <input type="text" name="args[examsetting][examtime]" size="4" needle="needle" class="form-control" value="{x2;$exam['examsetting']['examtime']}"/> 分钟
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
                              <div class="col-sm-3">
                                  <input class="form-control" type="text" name="args[examsetting][score]" value="{x2;$exam['examsetting']['score']}" size="4" needle="needle" msg="你要为本考卷设置总分" datatype="number"/>
                              </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">及格线：</label>
                              <div class="col-sm-3">
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
                                <span class="info">&nbsp;已选题数：<a id="ialreadyselectnumber_{x2;v:key}">{x2;eval: echo intval($exam['examnumber'][v:key])}</a>&nbsp;&nbsp;题</span>
                                <span class="info">&nbsp;<a class="selfmodal btn btn-info" href="javascript:;" data-target="#modal" url="index.php?exam-master-exams-selected&questionids={iselectquestions_{x2;v:key}}&rowsquestionids={iselectrowsquestions_{x2;v:key}}" valuefrom="iselectquestions_{x2;v:key}|iselectrowsquestions_{x2;v:key}">看题</a></span>
                                <span class="info">&nbsp;<a class="selfmodal btn btn-primary" href="javascript:;" data-target="#modal" url="index.php?exam-master-exams-selectquestions&search[questionsubjectid]={x2;$exam['examsubject']}&search[questiontype]={x2;v:key}&questionids={iselectquestions_{x2;v:key}}&rowsquestionids={iselectrowsquestions_{x2;v:key}}&useframe=1" valuefrom="iselectquestions_{x2;v:key}|iselectrowsquestions_{x2;v:key}">选题</a></span>
                                  <input type="hidden" id="iselectquestions_{x2;v:key}" name="args[examquestions][{x2;v:key}][questions]" value="{x2;$exam['examquestions'][v:key]['questions']}"/>
                                  <input type="hidden" id="iselectrowsquestions_{x2;v:key}" name="args[examquestions][{x2;v:key}][rowsquestions]" value="{x2;$exam['examquestions'][v:key]['rowsquestions']}"/>
                              </div>
                        </div>
                        {x2;endtree}
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
<div id="modal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
                <h4 id="myModalLabel">
                    试题详情
                </h4>
            </div>
            <div class="modal-body" id="modal-body"></div>
            <div class="modal-footer">
                 <button aria-hidden="true" class="btn btn-primary" data-dismiss="modal">完成</button>
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
<script>
$.getJSON('index.php?exam-master-basic-getsubjectquestype&subjectid={x2;$exam['examsubject']}&'+Math.random(),function(data){$('.questpanel').hide();$('.questypepanelinput').val('0');for(x in data){$('.panel_'+data[x]).show();$('#panel_'+data[x]).val('1');}});
</script>
</body>
</html>
{x2;endif}
