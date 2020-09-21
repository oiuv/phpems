{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:examnav}
            <div class="content">
                {x2;if:$data['currentbasic']['basicexam']['model'] == 2}
                <form class="col-xs-12" action="index.php?exam-app-history-makescore&ehid={x2;$eh['ehid']}">
                {x2;else}
                <div class="col-xs-3" style="width: 20%">
                    <div class="content-box padding">
                        {x2;include:menu}
                    </div>
                </div>
                <form class="col-xs-9 nopadding" style="width: 80%" action="index.php?exam-app-history-makescore&ehid={x2;$eh['ehid']}">
                {x2;endif}
                    {x2;eval: v:oid = 0}
                    {x2;eval: v:qcid = 0}
                    {x2;tree:$questype,quests,qid}
                    {x2;if:v:quests}
                    {x2;eval: v:quest = v:key}
                    {x2;if:$eh['ehquestion']['questions'][v:quest] || $eh['ehquestion']['questionrows'][v:quest]}
                    {x2;eval: v:oid++}
                    {x2;eval: v:tid = 0}
                    {x2;tree:$eh['ehquestion']['questions'][v:quest],question,qnid}
                    {x2;eval: v:tid++}
                    {x2;eval: v:qcid++}
                    <div class="content-box padding">
                        <h2 class="title">
                            第 {x2;v:tid} 题 【 {x2;$questype[v:quest]['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']} 】
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border morepadding">
                                <div class="desc">
                                    <p>{x2;realhtml:v:question['question']}</p>
                                </div>
                            </li>
                            <li class="border morepadding rightanswer">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="col-xs-1 nopadding">
                                            <div class="toolbar"><span class="badge">正确答案</span></div>
                                        </div>
                                        {x2;if:$questype[v:quest]['questsort']}
                                        <div class="col-xs-11">
                                            {x2;realhtml:v:question['questionanswer']}
                                        </div>
                                        {x2;else}
                                        <div class="col-xs-11">
                                            <b>{x2;v:question['questionanswer']}</b>
                                        </div>
                                        {x2;endif}
                                    </div>
                                </div>
                            </li>
                            <li class="border morepadding rightanswer">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="col-xs-1 nopadding">
                                            <div class="toolbar"><span class="badge">我的答案</span></div>
                                        </div>
                                        <div class="col-xs-11">
                                            {x2;realhtml:$eh['ehuseranswer'][v:question['questionid']]}
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="desc form-inline">
                                        提示：本题共{x2;$eh['ehsetting']['examsetting']['questype'][v:quest]['score']}分，得 <input msg="第{x2;v:tid}题得分不能超过该题总分" maxvalue="{x2;$eh['ehsetting']['examsetting']['questype'][v:quest]['score']}" type="text" class="form-control text-center" name="score[{x2;v:question['questionid']}]" value="" size="1" placeholder="0"> 分
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    {x2;endtree}
                    {x2;tree:$eh['ehquestion']['questionrows'][v:quest],questionrow,qnid}
                    {x2;tree:v:questionrow['data'],question,did}
                    {x2;if:$questype[v:question['questiontype']]['questsort']}
                    {x2;eval: v:tid++}
                    {x2;eval: v:qcid++}
                    <div class="content-box padding">
                        <h2 class="title">
                            第 {x2;v:tid} 题 【 {x2;$questype[v:quest]['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']} 】
                            <a href="#questionindex" class="badge pull-right">回顶部</a>
                            <a class="badge pull-right favor" data-questionid="{x2;v:question['questionid']}">收藏</a>
                            <a class="badge pull-right error" data-questionid="{x2;v:question['questionid']}">纠错</a>
                            <a class="badge pull-right" href="javascript:;" onclick="javascript:signQuestion({x2;v:question['questionid']},this);">{x2;if:$sessionvars['examsessionsign'][v:question['questionid']]}取消{x2;else}标记{x2;endif}</a>
                            <input id="time_{x2;v:question['questionid']}" type="hidden" name="time[{x2;v:question['questionid']}]"/>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border morepadding">
                                <div class="desc">
                                    <p>{x2;realhtml:v:questionrow['qrquestion']}</p>
                                </div>
                            </li>
                            <li class="border morepadding">
                                <div class="desc">
                                    <p>{x2;realhtml:v:question['question']}</p>
                                </div>
                            </li>
                            <li class="border morepadding rightanswer">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="col-xs-1 nopadding">
                                            <div class="toolbar"><span class="badge">正确答案</span></div>
                                        </div>
                                        <div class="col-xs-11">
                                            {x2;realhtml:v:question['questionanswer']}
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="border morepadding rightanswer">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="col-xs-1 nopadding">
                                            <div class="toolbar"><span class="badge">我的答案</span></div>
                                        </div>
                                        <div class="col-xs-11">
                                            {x2;realhtml:$eh['ehuseranswer'][v:question['questionid']]}
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="desc form-inline">
                                        提示：本题共{x2;$eh['ehsetting']['examsetting']['questype'][v:quest]['score']}分，得<input msg="第{x2;v:tid}题得分不能超过该题总分" maxvalue="{x2;$eh['ehsetting']['examsetting']['questype'][v:quest]['score']}" type="text" class="form-control text-center" name="score[{x2;v:question['questionid']}]" value="" size="1" placeholder="0"> 分
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    {x2;endif}
                    {x2;endtree}
                    {x2;endtree}
                    {x2;endif}
                    {x2;endif}
                    {x2;endtree}
                    <div class="content-box noground">
                        <h3 class="text-center">
                            <button type="submit" class="btn btn-primary">自行判分完毕，提交分数</button>
                            <input type="hidden" name="makescore" value="1"/>
                        </h3>
                    </div>
                </form>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
</body>
</html>
