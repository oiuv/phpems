{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">强化训练</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header">
            <div class="list-box bg">
                <form action="index.php?exam-phone-exercise" method="post" class="rows" action-before="clearStorage">
                    <ol>
                        <li class="unstyled"><h4 class="title">配卷规则</h4></li>
                        <li class="unstyled">
                            <div class="form-group">
                                <label class="col-3">选择章节：</label>
                                <div class="col-7">
                                    <select autocomplete="off" id="thesectionid" name="args[sectionid]" class="combox block" target="theknowsid" refUrl="index.php?exam-phone-index-ajax-getknowsbysectionid&sectionid={value}" more="questionnumbers">
                                        <option value="0">请选择章节</option>
                                        {x2;tree:$sections,section,sid}
                                        <option value="{x2;v:section['sectionid']}">{x2;v:section['section']}</option>
                                        {x2;endtree}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-3">知识点：</label>
                                <div class="col-7">
                                    <select autocomplete="off" name="args[knowsid]" id="theknowsid" class="combox block" target="questionnumbers" refUrl="index.php?exam-phone-exercise-ajax-getQuestionNumber&sectionid={tmp}&knowsid={value}">
                                        <option value="0">请选择知识点</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-3">试卷名称：</label>
                                <div class="col-7">
                                    <input type="text" needle="needle" msg="请填写试卷名称" name="args[title]" class="block"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-3">时间(分钟)：</label>
                                <div class="col-7">
                                    <input type="text" needle="needle" msg="做题时间" name="args[time]" class="block" value='60'/>
                                </div>
                            </div>
                            <ol id="questionnumbers">
                                {x2;if:is_array($questype)}
                                {x2;tree:$questype,quest,qid}
                                {x2;if:$numbers[v:quest['questid']]}
                                <li class="form-group">
                                    {x2;v:quest['questype']}（共{x2;$numbers[v:quest['questid']]}题），选 <input id="question_{x2;v:quest['questid']}" size="5" type="text" name="args[number][{x2;v:quest['questid']}]" rel="{x2;$numbers[v:quest['questid']]}" value="0"/> 题
                                </li>
                                {x2;endif}
                                {x2;endtree}
                                {x2;endif}
                            </ol>
                        </li>
                        <li class="unstyled">
                            <div class="form-group">
                                <input type="hidden" name="setExecriseConfig" value="1" />
                                <p class="text-center">
                                    <button type="submit" class="btn primary">开始测试</button>
                                </p>
                            </div>
                        </li>
                    </ol>
                </form>
            </div>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}