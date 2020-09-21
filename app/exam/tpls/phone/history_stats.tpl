{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs" id="pagination">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">考试成绩</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header" data-refresh="yes">
            <div class="list-box bg">
                <ol>
                    {x2;if:$data['currentbasic']['basicexam']['notviewscore']}
                    <li class="unstyled">
                        <div class="rows">
                            <h3 class="title text-center">等待公布分数</h3>
                            <p class="text-center text-danger more">您已经成功交卷，请等待教师统计并公布分数。</p>
                        </div>
                    </li>
                    {x2;elseif:!$eh['ehstatus']}
                    <li class="unstyled">
                        <div class="rows">
                            <h3 class="title text-center">等待教师评卷</h3>
                            <p class="text-center text-danger">本试卷需要教师评卷，请等待教师评卷完成。</p>
                        </div>
                    </li>
                    {x2;else}
                    <li class="unstyled">
                        <div class="rows">
                            {x2;if:$eh['ehispass']}
                            <h1 class="text-center text-success score">
                                {x2;eval: echo intval($sessionvars['examsessionscore'])}<span class="more">分</span>
                            </h1>
                            <div class="more text-center text-success">恭喜您通过考试</div>
                            {x2;else}
                            <h1 class="text-center text-danger score">
                                {x2;eval: echo intval($sessionvars['examsessionscore'])}<span class="more">分</span>
                            </h1>
                            <div class="more text-center text-danger">很遗憾您未通过本次考试</div>
                            {x2;endif}
                            <div class="more">
                                <p class="text-center">{x2;if:$eh['ehtype']}总分：<b class="text-warning">{x2;$sessionvars['examsessionsetting']['examsetting']['score']}</b>分 合格分数线：<b class="text-warning">{x2;$sessionvars['examsessionsetting']['examsetting']['passscore']}</b>分{x2;else}正确率：<b>{x2;eval: echo intval(100 * $eh['ehscore']/$allnumber)}%</b>{x2;endif} 答卷耗时：<b class="text-warning">{x2;if:$sessionvars['examsessiontime'] >= 60}{x2;if:$sessionvars['examsessiontime']%60}{x2;eval: echo intval($sessionvars['examsessiontime']/60)+1}{x2;else}{x2;eval: echo intval($sessionvars['examsessiontime']/60)}{x2;endif}分钟{x2;else}{x2;$sessionvars['examsessiontime']}秒{x2;endif}</b></p>
                            </div>
                        </div>
                    </li>
                    <li class="unstyled">
                        <h5 class="bigtitle">得分详情</h5>
                    </li>
                    <li class="unstyled">
                        <div class="rows">
                            <table class="table table-hover table-bordered">
                                <tr class="info">
                                    <th>题型</th>
                                    <th>总题数</th>
                                    <th>答对</th>
                                    <th>总分</th>
                                    <th>得分</th>
                                </tr>
                                {x2;tree:$number,num,nid}
                                {x2;if:v:num}
                                <tr>
                                    <td>{x2;$questype[v:key]['questype']}</td>
                                    <td>{x2;v:num}</td>
                                    <td>{x2;$right[v:key]}</td>
                                    <td>{x2;eval: echo number_format(v:num*$sessionvars['examsessionsetting']['examsetting']['questype'][v:key]['score'],1)}</td>
                                    <td>{x2;eval: echo number_format($score[v:key],1)}</td>
                                </tr>
                                {x2;endif}
                                {x2;endtree}
                                <tr>
                                    <td colspan="5" align="center">
                                        共<b class="text-warning">{x2;$allnumber}</b>题 ，做对<b class="text-warning">{x2;$allright}</b>题，得<b class="text-warning">{x2;eval: echo intval($sessionvars['examsessionscore'])}分</b>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </li>
                    <li class="unstyled">
                        <h5 class="bigtitle">知识点分析</h5>
                    </li>
                    <li class="unstyled">
                        <div class="rows">
                            <table class="table table-hover table-bordered">
                                <tr class="info">
                                    <th>知识点</th>
                                    <th>总题数</th>
                                    <th>答对</th>
                                    <th>正确率</th>
                                </tr>
                                {x2;tree:$stats,stat,sid}
                                {x2;if:v:stat}
                                <tr>
                                    <td>{x2;v:stat['knows']}</td>
                                    <td>{x2;eval: echo intval(v:stat['number'])}</td>
                                    <td>{x2;eval: echo intval(v:stat['right'])}</td>
                                    <td>{x2;eval: echo number_format(100 * v:stat['right']/v:stat['number'],2)}%</td>
                                </tr>
                                {x2;endif}
                                {x2;endtree}
                            </table>
                        </div>
                    </li>
                    {x2;if:$data['currentbasic']['basicexam']['model'] != 2}
                    <li class="unstyled">
                        <div class="rows">
                            <div class="col-3x text-center">
                                <a class="btn danger ajax" href="index.php?exam-phone-history-wrongs&ehid={x2;$eh['ehid']}">错题重做</a>
                            </div>
                            <div class="col-3x text-center">
                                <a class="btn primary ajax" href="index.php?exam-phone-history-view&ehid={x2;$eh['ehid']}">查看详细</a>
                            </div>
                            <div class="col-3x text-center">
                                <a class="btn ajax" href="index.php?exam-phone-history&ehtype={x2;$eh['ehtype']}">考试记录</a>
                            </div>
                        </div>
                    </li>
                    {x2;endif}
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
