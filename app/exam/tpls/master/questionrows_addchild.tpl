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
                            <li><a href="index.php?{x2;$_app}-master-rowsquestions&page={x2;$page}{x2;$u}">题冒题管理</a></li>
                            <li><a href="index.php?{x2;$_app}-master-rowsquestions-rowsdetail&questionid={x2;$question['qrid']}&page={x2;$page}{x2;$u}">子试题列表</a></li>
                            <li class="active">添加子试题</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        添加子试题
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-rowsquestions-rowsdetail&questionid={x2;$question['qrid']}&page={x2;$page}{x2;$u}">子试题列表</a>
                    </h4>
                    <form action="index.php?exam-master-rowsquestions-addchildquestion" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">题型：</label>
                              <div class="col-sm-3">
                                  <select name="args[questiontype]" class="combox form-control" onchange="javascript:setAnswerHtml($(this).find('option:selected').attr('rel'),'rcianswerbox');">
                                      {x2;tree:$questypes,questype,qid}
                                      <option rel="{x2;if:v:questype['questsort']}0{x2;else}{x2;v:questype['questchoice']}{x2;endif}" value="{x2;v:questype['questid']}"{x2;if:v:questype['questid'] == $question['questiontype']} selected{x2;endif}>{x2;v:questype['questype']}</option>
                                      {x2;endtree}
                                  </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">题干：</label>
                              <div class="col-sm-9">
                                  <textarea needle="needle" msg="您必须要填写题干" cols="72" rows="3" class="ckeditor" name="args[question]" id="rciquestion">{x2;$question['question']}</textarea>
                                  <span class="help-block">需要填空处请以()表示。</span>
                            </div>
                        </div>
                        <div class="form-group" id="selecttext">
                            <label class="control-label col-sm-2">备选项：</label>
                              <div class="col-sm-9">
                                  <textarea cols="72" rows="7" class="ckeditor" name="args[questionselect]" id="rcquestionselect">{x2;$question['questionselect']}</textarea>
                                  <div class="intro">无选择项的请不要填写，如填空题。</div>
                            </div>
                        </div>
                        <div class="form-group" id="selectnumber">
                            <label class="control-label col-sm-2" for="questionselectnumber">备选项数量：</label>
                              <div class="col-sm-3">
                                  <select class="combox form-control" id="questionselectnumber" name="args[questionselectnumber]">
                                      <option value="0">0</option>
                                      <option value="2">2</option>
                                      <option value="3">3</option>
                                      <option value="4" selected>4</option>
                                      <option value="5">5</option>
                                      <option value="6">6</option>
                                      <option value="7">7</option>
                                      <option value="8">8</option>
                                  </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">参考答案：</label>
                            <div class="col-sm-9">
                                <div id="rcianswerbox_1" class="rcianswerbox">
                                      <label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="A" checked>A</label>
                                      <label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="B">B</label>
                                      <label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="C">C</label>
                                      <label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="D">D</label>
                                      <label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="E">E</label>
                                      <label class="radio-inline">
                                          <input type="radio" name="targs[questionanswer1]" value="F">F
                                      </label>
                                      <label class="radio-inline">
                                          <input type="radio" name="targs[questionanswer1]" value="G">G
                                      </label>
                                      <label class="radio-inline">
                                          <input type="radio" name="targs[questionanswer1]" value="H">H
                                      </label>
                                </div>
                                <div id="rcianswerbox_2" style="display:none;" class="rcianswerbox">
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="A">A</label>
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="B">B</label>
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="C">C</label>
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="D">D</label>
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="E">E</label>
                                      <label class="checkbox-inline">
                                          <input type="checkbox" name="targs[questionanswer2][]" value="F">F
                                      </label>
                                      <label class="checkbox-inline">
                                          <input type="checkbox" name="targs[questionanswer2][]" value="G">G
                                      </label>
                                      <label class="checkbox-inline">
                                          <input type="checkbox" name="targs[questionanswer2][]" value="H">H
                                      </label>
                                </div>
                                <div id="rcianswerbox_3" style="display:none;" class="rcianswerbox">
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="A">A</label>
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="B">B</label>
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="C">C</label>
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="D">D</label>
                                      <label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="E">E</label>
                                      <label class="checkbox-inline">
                                          <input type="checkbox" name="targs[questionanswer3][]" value="F">F
                                      </label>
                                      <label class="checkbox-inline">
                                          <input type="checkbox" name="targs[questionanswer3][]" value="G">G
                                      </label>
                                      <label class="checkbox-inline">
                                          <input type="checkbox" name="targs[questionanswer3][]" value="H">H
                                      </label>
                                </div>
                                <div id="rcianswerbox_4" class="rcianswerbox" style="display:none;">
                                      <label class="radio-inline"><input type="radio" name="targs[questionanswer4]" value="A" checked>对</label>
                                      <label class="radio-inline"><input type="radio" name="targs[questionanswer4]" value="B">错</label>
                                </div>
                                <div id="rcianswerbox_5" class="rcianswerbox" style="display:none;">
                                      <input type="text" class="form-control" name="targs[questionanswer5]" value="{x2;$question['questionanswer']}" />
                                </div>
                                <div id="rcianswerbox_0" style="display:none;" class="rcianswerbox">
                                      <textarea cols="72" rows="7" class="ckeditor" id="rciquestionanswer0" name="targs[questionanswer0]">{x2;$question['questionanswer']}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">习题解析：</label>
                              <div class="col-sm-9">
                                  <textarea cols="72" rows="7" class="ckeditor" name="args[questiondescribe]" id="rciquestiondescribe">{x2;$question['questiondescribe']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                              <label class="control-label col-sm-2"></label>
                              <div class="col-sm-9">
                                  <button class="btn btn-primary" type="submit">提交</button>
                                  <input type="hidden" name="page" value="{x2;$page}"/>
                                  <input type="hidden" name="args[questionparent]" value="{x2;$question['qrid']}"/>
                                  <input type="hidden" name="insertquestion" value="1"/>
                                  {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                {x2;endtree}{x2;endif}
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
