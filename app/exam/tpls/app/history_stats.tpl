{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:examnav}
            <div class="content">
                {x2;if:$data['currentbasic']['basicexam']['model'] == 2}
                <div class="col-xs-12">
                {x2;else}
                <div class="col-xs-3" style="width: 20%">
                    <div class="content-box padding">
                        {x2;include:menu}
                    </div>
                </div>
                <div class="col-xs-9 nopadding" style="width: 80%">
                {x2;endif}
                    <div class="content-box padding">
                        <h2 class="title">
                            成绩单
                            {x2;if:$data['currentbasic']['basicexam']['model'] == 2}
                            <a href="index.php?exam-app-exam" class="badge pull-right">返回考试</a>
                            {x2;endif}
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border">
                                <h3 class="shorttitle text-center">{x2;$sessionvars['examsession']}</h3>
                                {x2;if:$data['currentbasic']['basicexam']['notviewscore']}
                                <div class="col-xs-12 alert text-center">
                                    <p>您已经成功交卷，请等待教师统计并公布分数。</p>
                                </div>
                                {x2;elseif:!$eh['ehstatus']}
                                <div class="col-xs-12 alert text-center">
                                    <p>本试卷需要教师评卷，请等待教师评卷完成。</p>
                                </div>
                                {x2;else}
                                <div class="col-xs-4">
                                    <h1 class="text-center text-danger">{x2;$sessionvars['examsessionscore']} 分</h1>
                                </div>
                                <div class="col-xs-8">
                                    {x2;if:$eh['ehtype']}
                                    <div>{x2;if:$eh['ehispass']}<b class="text-success">恭喜您通过考试！{x2;else}<b class="text-danger">很遗憾您未通过本次考试！{x2;endif}</b></div>
                                    {x2;endif}
                                    <p>{x2;if:$eh['ehtype']}总分：<b class="text-warning">{x2;$sessionvars['examsessionsetting']['examsetting']['score']}</b>分 合格分数线：<b class="text-warning">{x2;$sessionvars['examsessionsetting']['examsetting']['passscore']}</b>分{x2;else}正确率：<b>{x2;eval: echo intval(100 * $eh['ehscore']/$allnumber)}%</b>{x2;endif} 答卷耗时：<b class="text-warning">{x2;if:$eh['ehtime'] >= 60}{x2;if:$eh['ehtime']%60}{x2;eval: echo intval($eh['ehtime']/60)+1}{x2;else}{x2;eval: echo intval($eh['ehtime']/60)}{x2;endif}分钟{x2;else}{x2;$eh['ehtime']}秒{x2;endif}</b></p>
                                </div>
                                <div class="col-xs-12">
                                    <h5 class="text-info padding">得分详情：</h5>
                                    <table class="table table-hover table-bordered">
                                        <tr class="info">
                                            <th>题型</th>
                                            <th>总题数</th>
                                            <th>答对题数</th>
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
                                            <td colspan="5" align="left">本次考试共<b class="text-warning">{x2;$allnumber}</b>道题{x2;if:$eh['ehtype']}，总分<b class="text-warning">{x2;$sessionvars['examsessionsetting']['examsetting']['score']}</b>分{x2;endif}，您做对<b class="text-warning">{x2;$allright}</b>道题，得到<b class="text-warning">{x2;$sessionvars['examsessionscore']}</b>分</td>
                                        </tr>
                                    </table>
                                    <h5 class="text-info padding">知识点分析：</h5>
                                    <table class="table table-hover table-bordered">
                                        <tr class="info">
                                            <th>知识点</th>
                                            <th>总题数</th>
                                            <th>答对题数</th>
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
                                    {x2;if:$data['currentbasic']['basicexam']['model'] != 2}
                                    <div class="text-center"><a href="index.php?exam-app-history-view&ehid={x2;$ehid}" class="btn btn-info">查看答案和解析</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php?exam-app-history&ehtype={x2;$eh['ehtype']}" class="btn btn-info">进入我的考试记录</a></div>
                                    {x2;endif}
                                </div>
                                {x2;endif}
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
</body>
</html>
