{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="box itembox" style="margin-bottom:0px;">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                      <li><a href="index.php">首页</a></li>
                      <li><a href="index.php?exam-app">考试</a></li>
                      <li><a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a></li>
                      <li><a href="index.php?exam-app-exam">正式考试</a></li>
                      <li class="active">成绩单</li>
                    </ol>
                </div>
            </div>
            <div class="box itembox">
                <legend class="text-center"><h3>{x2;$sessionvars['examsession']}</h3></legend>
                {x2;if:$data['currentbasic']['basicexam']['notviewscore']}
                <div class="col-xs-12 alert alert-info">
                    <p>您已经成功交卷，请等待教师统计并公布分数。</p>
                </div>
                {x2;else}
                <div class="col-xs-4">
                    <div class="boardscore">
                        <h1 class="text-center text-danger">{x2;$sessionvars['examsessionscore']} 分</h1>
                        <p>分数评价</p>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div><b class="text-info">考试详情：</b></div>
                      <p>总分：<b class="text-warning">{x2;$sessionvars['examsessionsetting']['examsetting']['score']}</b>分 合格分数线：<b class="text-warning">{x2;$sessionvars['examsessionsetting']['examsetting']['passscore']}</b>分 答卷耗时：<b class="text-warning">{x2;if:$sessionvars['examsessiontime'] >= 60}{x2;if:$sessionvars['examsessiontime']%60}{x2;eval: echo intval($sessionvars['examsessiontime']/60)+1}{x2;else}{x2;eval: echo intval($sessionvars['examsessiontime']/60)}{x2;endif}分钟{x2;else}{x2;$sessionvars['examsessiontime']}秒{x2;endif}</b></p>
                      <table class="table table-hover table-bordered">
                      <tr class="success">
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
                        <td colspan="5" align="left">本次考试共<b class="text-warning">{x2;$allnumber}</b>道题，总分<b class="text-warning">{x2;$sessionvars['examsessionsetting']['examsetting']['score']}</b>分，您做对<b class="text-warning">{x2;$allright}</b>道题，得到<b class="text-warning">{x2;$sessionvars['examsessionscore']}</b>分</td>
                      </tr>
                   </table>
                   {x2;if:$data['currentbasic']['basicexam']['model'] != 2}
                   <div class="text-center"><a href="index.php?exam-app-history-view&ehid={x2;$ehid}" class="btn btn-info">查看答案和解析</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php?exam-app-history&ehtype=2" class="btn btn-info">进入我的考试记录</a></div>
                   {x2;endif}
                </div>
                {x2;endif}
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
