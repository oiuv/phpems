{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            <div class="header navbar-fixed-top">
                <div class="nav">
                    <div class="col-xs-9">
                        <ul class="list-unstyled list-inline">
                            <li>
                                <h3 class="logo">{x2;$eh['ehexam']}</h3>
                            </li>
                        </ul>
                    </div>
                    <div class="col-xs-3">
                        <ul class="list-unstyled list-inline">
                            <li class="pull-right">
                                <a href="index.php?exam-app-history&ehtype={x2;$eh['ehtype']}" class="menu">
                                    <span class="glyphicon glyphicon-chevron-left"></span> 返回
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            {x2;if:$eh['ehstatus']}
            <div class="content fixtop">
                <div class="col-xs-3">
                    <div class="content-box padding" id="questionindex" data-spy="affix">
                        {x2;eval: v:oid = 0}
                        {x2;eval: v:qmid = 0}
                        {x2;tree:$sessionvars['examsessionsetting']['examsetting']['questypelite'],lite,qid}
                        {x2;if:v:lite}
                        {x2;eval: v:quest = v:key}
                        {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                        {x2;eval: v:oid++}
                        <h3 class="title">
                            {x2;$ols[v:oid]}、{x2;$questype[v:quest]['questype']}
                            <a class="badge pull-right resize"><em class="glyphicon glyphicon-resize-full"></em></a>
                        </h3>
                        <ul class="list-unstyled list-img">
                            <li id="qt_{x2;v:quest}">
                                {x2;eval: v:tid = 0}
                                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
                                {x2;eval: v:tid++}
                                {x2;eval: v:qmid++}
                                <a id="sign_{x2;v:question['questionid']}" href="#q_{x2;v:question['questionid']}" class="btn btn-default qindex{x2;if:$sessionvars['examsessionscorelist'][v:question['questionid']] && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']} btn-success{x2;endif}">{x2;v:tid}</a>
                                {x2;endtree}
                                {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qrid}
                                {x2;eval: v:tid++}
                                {x2;tree:v:questionrow['data'],question,did}
                                {x2;eval: v:qmid++}
                                <a id="sign_{x2;v:question['questionid']}" href="#q_{x2;v:question['questionid']}" class="btn btn-default qindex{x2;if:$sessionvars['examsessionscorelist'][v:question['questionid']] && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']} btn-success{x2;endif}">{x2;v:tid}</a>
                                {x2;endtree}
                                {x2;endtree}
                            </li>
                        </ul>
                        {x2;endif}
                        {x2;endif}
                        {x2;endtree}
                    </div>
                </div>
                <div class="col-xs-9 nopadding" id="paper" action="index.php?exam-app-exercise-score">
                    {x2;eval: v:oid = 0}
                    {x2;eval: v:qcid = 0}
                    {x2;tree:$sessionvars['examsessionsetting']['examsetting']['questypelite'],lite,qid}
                    {x2;if:v:lite}
                    {x2;eval: v:quest = v:key}
                    {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                    {x2;eval: v:oid++}
                    {x2;eval: v:tid = 0}
                    {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
                    {x2;eval: v:tid++}
                    {x2;eval: v:qcid++}
                    <div class="content-box padding">
                        {x2;if:$sessionvars['examsessionscorelist'][v:question['questionid']] && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']}
                        <div class="right"></div>
                        {x2;else}
                        <div class="wrong"></div>
                        {x2;endif}
                        <h2 class="title">
                            <a id="q_{x2;v:question['questionid']}"></a>
                            第 {x2;v:tid} 题 【 {x2;$questype[v:quest]['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']} 】
                            <a class="badge pull-right error" data-questionid="{x2;v:question['questionid']}">纠错</a>
                            <a class="badge pull-right favor" data-questionid="{x2;v:question['questionid']}">收藏</a>
                            <a class="badge pull-right">得{x2;$sessionvars['examsessionscorelist'][v:question['questionid']]}分</a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border morepadding">
                                <div class="desc">
                                    <p>{x2;realhtml:v:question['question']}</p>
                                </div>
                            </li>
                            {x2;if:v:question['questionselect']}
                            <li class="border morepadding">
                                <div class="desc">
                                    {x2;realhtml:v:question['questionselect']}
                                </div>
                            </li>
                            {x2;endif}
                            <li class="border morepadding">
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
                                            <b id="rightanswer_{x2;v:question['questionid']}">{x2;v:question['questionanswer']}</b>
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
                                        {x2;if:$questype[v:quest]['questsort']}
                                        <div class="col-xs-11">
                                            {x2;realhtml:$eh['ehuseranswer'][v:question['questionid']]}
                                        </div>
                                        {x2;else}
                                        <div class="col-xs-11">
                                            <b id="rightanswer_{x2;v:question['questionid']}">{x2;eval: echo implode('',(array)$eh['ehuseranswer'][v:question['questionid']])}</b>
                                        </div>
                                        {x2;endif}
                                    </div>
                                </div>
                            </li>
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="col-xs-1 nopadding">
                                            <div class="toolbar"><span class="badge">试题解析</span></div>
                                        </div>
                                        <div class="col-xs-11">
                                            {x2;realhtml:v:question['questiondescribe']}
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    {x2;endtree}
                    {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qnid}
                    {x2;tree:v:questionrow['data'],question,did}
                    {x2;eval: v:tid++}
                    {x2;eval: v:qcid++}
                    <div class="content-box padding">
                        {x2;if:$sessionvars['examsessionscorelist'][v:question['questionid']] && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']}
                        <div class="right"></div>
                        {x2;else}
                        <div class="wrong"></div>
                        {x2;endif}
                        <h2 class="title">
                            <a id="q_{x2;v:question['questionid']}"></a>
                            第 {x2;v:tid} 题 【 {x2;$questype[v:quest]['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']} 】
                            <a class="badge pull-right error" data-questionid="{x2;v:question['questionid']}">纠错</a>
                            <a class="badge pull-right favor" data-questionid="{x2;v:question['questionid']}">收藏</a>
                            <a class="badge pull-right">得{x2;$sessionvars['examsessionscorelist'][v:question['questionid']]}分</a>
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
                            {x2;if:v:question['questionselect']}
                            <li class="border morepadding">
                                <div class="desc">
                                    {x2;realhtml:v:question['questionselect']}
                                </div>
                            </li>
                            {x2;endif}
                            <li class="border morepadding">
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
                                            <b id="rightanswer_{x2;v:question['questionid']}">{x2;v:question['questionanswer']}</b>
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
                                        {x2;if:$questype[v:quest]['questsort']}
                                        <div class="col-xs-11">
                                            {x2;realhtml:$eh['ehuseranswer'][v:question['questionid']]}
                                        </div>
                                        {x2;else}
                                        <div class="col-xs-11">
                                            <b id="rightanswer_{x2;v:question['questionid']}">{x2;eval: echo implode('',(array)$eh['ehuseranswer'][v:question['questionid']])}</b>
                                        </div>
                                        {x2;endif}
                                    </div>
                                </div>
                            </li>
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="col-xs-1 nopadding">
                                            <div class="toolbar"><span class="badge">试题解析</span></div>
                                        </div>
                                        <div class="col-xs-11">
                                            {x2;realhtml:v:question['questiondescribe']}
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    {x2;endtree}
                    {x2;endtree}
                    {x2;endif}
                    {x2;endif}
                    {x2;endtree}
                </div>
            </div>
            {x2;else}
            <div class="content fixtop">
                <div class="content-box padding">
                    <div class="text-danger text-center">
                        本试卷正在锁定评分中，请等待评分结束。
                    </div>
                </div>
            </div>
            {x2;endif}
            {x2;include:footer}
        </div>
    </div>
</div>
{x2;include:paper_footer}
</body>
</html>
