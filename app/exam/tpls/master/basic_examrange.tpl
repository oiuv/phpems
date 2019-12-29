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
                            <li><a href="index.php?{x2;$_app}-master-basic&page={x2;$page}{x2;$u}">考场管理</a></li>
                            <li class="active">考试范围</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        考试范围
                        <a class="btn btn-primary pull-right" href="index.php?exam-master-basic&page={x2;$page}{x2;$u}">考场管理</a>
                    </h4>
                    <form action="?exam-master-basic-setexamrange" method="post" class="form-horizontal">
                        <table class="table">
                            <thead>
                            <tr>
                                <th colspan="8">{x2;$basic['basic']}</th>
                            </tr>
                            </thead>
                            <tr>
                                <td>
                                    考场ID：
                                </td>
                                <td>
                                    {x2;$basic['basicid']}
                                </td>
                                <td>
                                    科目：
                                </td>
                                <td>
                                    {x2;$subjects[$basic['basicsubjectid']]['subject']}
                                </td>
                                <td>
                                    地区：
                                </td>
                                <td>
                                    {x2;$areas[$basic['basicareaid']]['area']}
                                </td>
                                <td>
                                    API标识：
                                </td>
                                <td>
                                    {x2;$basic['basicapi']}
                                </td>
                            </tr>
                        </table>
                        <div class="form-group">
                            <label class="control-label col-sm-3">章节选择：<input type="checkbox" onclick="javascript:$('.section:checkbox').prop('checked',$(this).is(':checked'));"> </label>
                        </div>
                        {x2;if:is_array($sections)}
                        {x2;tree:$sections,section,sid}
                        <div class="form-group">
                            <label class="control-label col-sm-3">
                                <input type="checkbox" onclick="javascript:$('.sec_{x2;v:section['sectionid']}:checkbox').prop('checked',$(this).is(':checked'));"> {x2;v:section['section']}
                            </label>
                            <div class="col-sm-9" style="text-indent:10px;">
                                {x2;tree:$knows[v:section['sectionid']],know,kid}
                                <label class="checkbox-inline"><input type="checkbox" value="{x2;v:know['knowsid']}" name="args[basicknows][{x2;v:section['sectionid']}][{x2;v:know['knowsid']}]" class="section sec_{x2;v:section['sectionid']}" {x2;if:$basic['basicknows'][v:section['sectionid']][v:know['knowsid']] == v:know['knowsid']}checked{x2;endif}/>{x2;v:know['knows']}</label>
                                {x2;endtree}
                            </div>
                        </div>
                        {x2;endtree}
                        {x2;endif}
                        <div class="form-group">
                            <label for="basicexam_auto" class="control-label col-sm-3">考试范围设置：</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][rulemodel]" value="0"{x2;if:$basic['basicexam']['rulemodel'] == 0} checked{x2;endif}/> 对题量配比生效（上述指定范围抽题）
                                  </label>
                                  <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][rulemodel]" value="1"{x2;if:$basic['basicexam']['rulemodel'] == 1} checked{x2;endif}/> 对题量配比无效（允许跨科目抽题）
                                  </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicexam_auto" class="control-label col-sm-3">考场模式：</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][model]" value="0"{x2;if:$basic['basicexam']['model'] == 0} checked{x2;endif}/> 全功能模式（显示练习，显示试题库）
                                  </label>
                                  <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][model]" value="1"{x2;if:$basic['basicexam']['model'] == 1} checked{x2;endif}/> 练习模式（显示练习，不显示试题库）
                                  </label>
                                  <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][model]" value="2"{x2;if:$basic['basicexam']['model'] == 2} checked{x2;endif}/> 考试模式（仅显示正式考试）
                                  </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicexam_auto" class="control-label col-sm-3">正式考试试题排序：</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][changesequence]" value="0"{x2;if:$basic['basicexam']['changesequence'] == 0} checked{x2;endif}/> 不打乱试题排序
                                  </label>
                                  <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][changesequence]" value="1"{x2;if:$basic['basicexam']['changesequence'] == 1} checked{x2;endif}/> 打乱试题排序
                                  </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicexam_auto" class="control-label col-sm-3">绑定模拟考试试卷：</label>
                            <div class="col-sm-9 form-inline">
                                <input size="50" class="form-control" type="text" id="basicexam_auto" name="args[basicexam][auto]" needle="needle" msg="您必须填写至少一个试卷" value="{x2;$basic['basicexam']['auto']}" /> <a class="selfmodal btn btn-primary" href="javascript:;" data-target="#modal" url="index.php?exam-master-exams-selectexams&search[subjectid]={x2;$basic['basicsubjectid']}&exams={basicexam_auto}&useframe=1&target=basicexam_auto" valuefrom="basicexam_auto">选卷</a>
                                <span class="help-block">请在试卷管理处查看试卷ID，将数字ID填写在这里，多个请用英文逗号（,）隔开。留空或填0时将无法进行该项考试。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicexam_autotemplate" class="control-label col-sm-3">模拟考试模板：</label>
                            <div class="col-sm-3">
                                <select class="form-control" id="basicexam_autotemplate" name="args[basicexam][autotemplate]">
                                    {x2;tree:$tpls['ep'],tpl,tid}
                                    <option value="{x2;v:tpl}"{x2;if:$basic['basicexam']['autotemplate'] == v:tpl} selected{x2;endif}>{x2;v:tpl}</option>
                                    {x2;endtree}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicexam_self" class="control-label col-sm-3">绑定正式考试试卷：</label>
                            <div class="col-sm-9 form-inline">
                                <input size="50" class="form-control" type="text" id="basicexam_self" name="args[basicexam][self]" needle="needle" msg="您必须填写至少一个试卷" value="{x2;$basic['basicexam']['self']}" /> <a class="selfmodal btn btn-primary" href="javascript:;" data-target="#modal" url="index.php?exam-master-exams-selectexams&search[subjectid]={x2;$basic['basicsubjectid']}&exams={basicexam_self}&useframe=1&target=basicexam_self" valuefrom="basicexam_self">选卷</a>
                                <span class="help-block">请在试卷管理处查看试卷ID，将数字ID填写在这里，多个请用英文逗号（,）隔开。留空或填0时将无法进行该项考试。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicexam_selftemplate" class="control-label col-sm-3">正式考试试卷模板：</label>
                            <div class="col-sm-3">
                                <select class="form-control" id="basicexam_selftemplate" name="args[basicexam][selftemplate]">
                                    {x2;tree:$tpls['pp'],tpl,tid}
                                    <option value="{x2;v:tpl}"{x2;if:$basic['basicexam']['selftemplate'] == v:tpl} selected{x2;endif}>{x2;v:tpl}</option>
                                    {x2;endtree}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">正式考试开启时间：</label>
                            <div class="col-sm-9 form-inline">
                                <input class="form-control" name="args[basicexam][opentime][start]" type="text" value="{x2;if:$basic['basicexam']['opentime']['start']}{x2;date:$basic['basicexam']['opentime']['start'],'Y-m-d H:i:s'}{x2;else}0{x2;endif}" needle="needle" msg="您必须输入一个开启时间起点" /> - <input class="form-control" name="args[basicexam][opentime][end]" type="text" value="{x2;if:$basic['basicexam']['opentime']['end']}{x2;date:$basic['basicexam']['opentime']['end'],'Y-m-d H:i:s'}{x2;else}0{x2;endif}" needle="needle" msg="您必须输入一个开启时间终点" />
                                <span class="help-block">开始结束时间均需填写，格式为2014-05-01 08:00:00，不限制开启时间请任意一项填写0。如果设置的结束时间减去5分钟比考生交卷时间要早，则系统按照结束时间减去5分钟收卷。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">正式考试抽卷规则：</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][selectrule]" value="1"{x2;if:$basic['basicexam']['selectrule']} checked{x2;endif}/> 系统随机抽卷
                                  </label>
                                  <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][selectrule]" value="0"{x2;if:!$basic['basicexam']['selectrule']} checked{x2;endif}/> 用户手动选卷
                                  </label>
                                <span class="help-block">系统随机抽卷时，用户无法看到试卷列表，系统会随机挑选试卷供用户考试。手选试卷时，系统列出试卷列表供用户选择进行考试。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">正式考试限考次数：</label>
                            <div class="col-sm-9 form-inline">
                                <input class="form-control" name="args[basicexam][examnumber]" type="text" value="{x2;if:$basic['basicexam']['examnumber']}{x2;$basic['basicexam']['examnumber']}{x2;else}0{x2;endif}" needle="needle" msg="您必须输入考试次数" />
                                <span class="help-block">不限制次数请填写0，当您选择抽卷规则为系统随机抽卷时，限考次数为所有试卷限考次数，当您选择抽卷规则为用户自选时，限考次数为每套试卷限考次数。即如果设置限考次数为x，当随机抽卷时，用户一共可以考试x次；手选试卷时，用户每套试卷可考试x次。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicexam_auto" class="control-label col-sm-3">交卷后：</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                          <input type="radio" class="input-text" name="args[basicexam][notviewscore]" value="0"{x2;if:$basic['basicexam']['notviewscore'] == 0} checked{x2;endif}/> 直接显示分数
                                  </label>
                                  <label class="radio-inline">
                                      <input type="radio" class="input-text" name="args[basicexam][notviewscore]" value="1"{x2;if:$basic['basicexam']['notviewscore'] == 1} checked{x2;endif}/> 暂不显示分数
                                  </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicexam_auto" class="control-label col-sm-3">可开通的用户组：</label>
                            <div class="col-sm-9 form-inline">
                                <input size="50" class="form-control" type="text" id="basicexam_allowgroup" name="args[basicexam][allowgroup]" value="{x2;$basic['basicexam']['allowgroup']}" /> <a class="selfmodal btn btn-primary" href="javascript:;" data-target="#modal" url="index.php?exam-master-basic-selectgroups&groups={basicexam_allowgroup}&useframe=1&target=basicexam_allowgroup" valuefrom="basicexam_allowgroup">选组</a>
                                <span class="help-block">不填写或者填写0为不限制。</span>
                            </div>
                        </div>
                        <div class="submit">
                            <label for="basicexam_auto" class="control-label col-sm-3"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                                <input type="hidden" name="setexamrange" value="1"/>
                                <input type="hidden" name="basicid" value="{x2;$basic['basicid']}"/>
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
<div id="modal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
                <h4 id="myModalLabel">
                    可选择列表
                </h4>
            </div>
            <div class="modal-body" id="modal-body">asdasdasdasdsa</div>
            <div class="modal-footer">
                 <button aria-hidden="true" class="btn btn-primary" data-dismiss="modal">完成</button>
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
