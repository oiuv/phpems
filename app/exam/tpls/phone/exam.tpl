{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">正式考试</div>
            <div class="col-1"><a href="index.php?exam-phone-exam-history" class="ajax"><span class="iconfont icon-menu"></span></a></div>
        </div>
        <div class="page-content header">
            <div class="list-box bg">
                <ol>
                    <li>
                        <span class="rows"><span class="intro">
                        考场开启时间{x2;if:$data['currentbasic']['basicexam']['opentime']['start'] && $data['currentbasic']['basicexam']['opentime']['end']}
                            {x2;date:$data['currentbasic']['basicexam']['opentime']['start'],'Y-m-d H:i'} - {x2;date:$data['currentbasic']['basicexam']['opentime']['end'],'Y-m-d H:i'}{x2;else}不限{x2;endif}&nbsp;&nbsp;
                            限考次数 {x2;if:$data['currentbasic']['basicexam']['examnumber']}{x2;$data['currentbasic']['basicexam']['examnumber']}{x2;else}不限{x2;endif}
                        </span></span>
                    </li>
                    <li><span class="rows"><span class="intro">点击考试名称或开始考试按钮进入答题界面，考试开始计时。</span></span></li>
                    <li><span class="rows"><span class="intro">在考试过程中，您可以通过左下方的考试时间来掌握自己的做题时间。</span></span></li>
                    <li><span class="rows"><span class="intro">系统自动记录考试的考试记录，学员考试结束后可在本页点击右上方进入“答题记录”进行查看。</span></span></li>
                </ol>
            </div>
            <div class="list-box bg top">
                <ol>
                    {x2;if:$intime}
                    {x2;if:$sessionvars}
                    <li class="unstyled">
                        <div class="rows info">
                            <h5 class="title">意外续考</h5>
                            <div class="intro">
                                系统检测到您曾经在{x2;date:$sessionvars['examsessionstarttime'],'Y-m-d H:i:s'}开启了一场未完成的考试，试卷名称为《{x2;$sessionvars['examsession']}》，点击继续考试可以进行续考。
                            </div>
                            <div class="intro">
                                <div class="col-3x"> 总分 {x2;$sessionvars['examsessionsetting']['examsetting']['score']} 分</div>
                                <div class="col-3x"> 及格分 {x2;$sessionvars['examsessionsetting']['examsetting']['passscore']} 分</div>
                                <div class="col-3x"> 限时 {x2;$sessionvars['examsessionsetting']['examsetting']['examtime']} 分钟</div>
                            </div>
                        </div>
                    </li>
                    <li class="unstyled">
                        <div class="rows">
                            <div class="col-5 text-center">
                                <a class="btn primary ajax" action-before="clearStorage" href="index.php?exam-phone-recover">继续考试</a>
                            </div>
                            <div class="col-5 text-center">
                                <a href="index.php?exam-phone-recover-clearexamsession" message="放弃考试会删除此次考试会话并不能恢复，确认要放弃吗？" class="btn confirm">放弃考试</a>
                            </div>
                        </div>
                    </li>

                    {x2;else}

                    {x2;if:$data['currentbasic']['basicexam']['selectrule']}
                    <li class="unstyled">
                        <div class="rows">
                            {x2;if:$data['currentbasic']['basicexam']['examnumber'] > 0 && $number['all'] >= $data['currentbasic']['basicexam']['examnumber']}
                            <div class="text-center intro"><a class="btn" href="javascript:;">您的考试次数已经用完</a></div>
                            {x2;else}
                            <div class="text-center intro"><a class="ajax btn primary" href="index.php?exam-phone-exam-selectquestions" action-before="clearStorage">开始考试</a></div>
                            {x2;endif}
                        </div>
                    </li>
                    {x2;else}
                    {x2;tree:$exams['data'],exam,eid}
                    <li class="unstyled">
                        <a action-before="clearStorage" href="index.php?exam-phone-exam-selectquestions&examid={x2;v:exam['examid']}" class="ajax">
                            <div class="rows info">
                                <h5 class="title">{x2;v:exam['exam']}</h5>
                                <div class="intro">
                                    <div class="col-3x"> 总分 {x2;v:exam['examsetting']['score']} 分</div>
                                    <div class="col-3x"> 及格分 {x2;v:exam['examsetting']['passscore']} 分</div>
                                    <div class="col-3x"> 限时 {x2;v:exam['examsetting']['examtime']} 分钟</div>
                                </div>
                            </div>
                        </a>
                    </li>
                    {x2;endtree}
                    {x2;endif}
                    {x2;endif}
                    {x2;else}
                    <li class="unstyled">
                        <div class="rows text-center">
                            <a class="btn danger">未在考试时间内，请等待管理员开启考试！</a>
                        </div>
                    </li>
                    {x2;endif}
                </ol>
            </div>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
