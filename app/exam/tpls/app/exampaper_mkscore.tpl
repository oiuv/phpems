{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid" id="datacontent">
    <div class="row-fluid">
        <div class="main">
            <div class="box itembox" style="margin-bottom:0px;">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                      <li><a href="index.php">首页</a></li>
                      <li><a href="index.php?exam-app">考试</a></li>
                      <li><a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a></li>
                      <li><a href="index.php?exam-app-exampaper">模拟考试</a></li>
                      <li class="active">主观题评分</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="main box">
            <form id="form1" name="form1" class="col-xs-12" action="index.php?exam-app-exampaper-makescore">
                <div class="box itembox">
                    <h4 class="title">主观题评分</h4>
                    <div class="alert alert-info">
                        <ul class="list-unstyled">
                            <li><b>阅卷规则</b></li>
                            <li>1、客观题系统将自动核对学员答案。</li>
                            <li>2、主观题请参照系统给出的答案自行核对，并给出分数。</li>
                            <li>3、自行评分完毕后请单击“自行判卷无误，提交”按钮，将即刻为您生成本次测验的成绩单。</li>
                        </ul>
                        <p>以下题为主观题请参照正确答案后自行给出分数</p>
                    </div>
                </div>
                {x2;eval: v:oid = 0}
                {x2;tree:$questype,quest,qid}
                {x2;if:v:quest['questsort']}
                {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest['questid']] || $sessionvars['examsessionquestion']['questionrows'][v:quest['questid']]}
                {x2;eval: v:oid++}
                <div class="box itembox">
                    <blockquote class="questype">{x2;$ols[v:oid]}、{x2;v:quest['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']}</blockquote>
                </div>
                {x2;eval: v:tid = 0}
                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest['questid']],question,qnid}
                {x2;eval: v:tid++}
                <div class="box itembox paperexamcontent">
                    <h4 class="title">
                        第{x2;v:tid}题
                        <span class="pull-right">
                            <a class="btn btn-primary qicon"><i class="glyphicon glyphicon-heart-empty"></i></a>
                            <a name="question_{x2;v:question['questionid']}"></a>
                            <input id="time_{x2;v:question['questionid']}" type="hidden" name="time[{x2;v:question['questionid']}]"/>
                        </span>
                    </h4>
                    <div class="choice">
                        {x2;realhtml:v:question['question']}
                    </div>
                    {x2;if:!$questype[v:quest]['questsort']}
                    {x2;if:v:question['questionselect'] && $questype[v:quest]['questchoice'] != 5}
                    <div class="choice">
                        {x2;realhtml:v:question['questionselect']}
                    </div>
                    {x2;endif}
                    {x2;endif}
                    <div class="selector decidediv" style="border-left:10px solid #CCCCCC;position:relative;">
                        <ul class="list-unstyled">
                            <li>正确答案：</li>
                            <li>{x2;realhtml:v:question['questionanswer']}</li>
                            <li>您的答案：</li>
                            <li>{x2;if:is_array($sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:question['questionid']])}{x2;else}{x2;realhtml:$sessionvars['examsessionuseranswer'][v:question['questionid']]}{x2;endif}</li>
                        </ul>
                    </div>
                    <div class="choice" style="line-height:2.5em;">
                          【请根据参考答案给出分值】
                          <input type="text" class="col-xs-1" name="score[{x2;v:question['questionid']}]" value="" maxvalue="{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']}">
                          <span class="text-error">提示：本题共{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']}分，可输入0.5的倍数。</span>
                      </div>
                </div>
                {x2;endtree}
                {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest['questid']],questionrow,qrid}
                {x2;eval: v:tid++}
                <div class="box itembox paperexamcontent">
                    <h4 class="title">第{x2;v:tid}题</h4>
                    <div class="choice">
                        {x2;realhtml:v:questionrow['qrquestion']}
                    </div>
                    {x2;tree:v:questionrow['data'],data,did}
                    {x2;eval: v:qcid++}
                    <blockquote style="background:#FFFFFF;border-right:1px solid #CCCCCC;border-top:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;">
                        <h4 class="title">
                            第{x2;v:did}题
                            <span class="pull-right">
                                <a class="btn btn-primary qicon"><i class="glyphicon glyphicon-heart-empty"></i></a>
                                <a name="question_{x2;v:data['questionid']}"></a>
                                <input id="time_{x2;v:data['questionid']}" type="hidden" name="time[{x2;v:data['questionid']}]"/>
                            </span>
                        </h4>
                        <div class="choice">
                            {x2;realhtml:v:data['question']}
                        </div>
                        <div class="selector decidediv" style="border-left:10px solid #EDEDED;position:relative;">
                            <ul class="list-unstyled">
                                <li class="text-error">正确答案：</li>
                                <li class="text-success">{x2;realhtml:v:data['questionanswer']}</li>
                                <li class="text-info">您的答案：</li>
                                <li class="text-success">{x2;if:is_array($sessionvars['examsessionuseranswer'][v:data['questionid']])}{x2;eval: echo implode('',$sessionvars['examsessionuseranswer'][v:data['questionid']])}{x2;else}{x2;realhtml:$sessionvars['examsessionuseranswer'][v:data['questionid']]}{x2;endif}</li>
                            </ul>
                        </div>
                        <div class="choice" style="line-height:2.5em;">
                              【请根据参考答案给出分值】
                              <input type="text" class="col-xs-1" name="score[{x2;v:data['questionid']}]" value="" maxvalue="{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']}">
                              <span class="text-error">提示：本题共{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['score']}分，可输入0.5的倍数。</span>
                          </div>
                    </blockquote>
                    {x2;endtree}
                </div>
                {x2;endtree}
                {x2;endif}
                {x2;endif}
                {x2;endtree}
                <h3 class="text-center">
                     <button type="submit" class="btn btn-primary">自行判分完毕，提交分数</button>
                     <input type="hidden" name="makescore" value="1"/>
                </h3>
            </form>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
