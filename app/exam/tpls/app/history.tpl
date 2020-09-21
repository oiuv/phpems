{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:examnav}
            <div class="content">
                <div class="col-xs-3" style="width: 20%">
                    <div class="content-box padding">
                        {x2;include:menu}
                    </div>
                </div>
                <div class="col-xs-9 nopadding" style="width: 80%">
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;if:$ehtype == 0}
                            强化训练
                            {x2;elseif:$ehtype == 1}
                            模拟考试
                            {x2;elseif:$ehtype == 2}
                            正式考试
                            {x2;endif}
                            <a href="index.php?exam-app-history&ehtype=2" class="badge pull-right">正式考试</a>
                            <a href="index.php?exam-app-history&ehtype=1" class="badge pull-right">模拟考试</a>
                            <a href="index.php?exam-app-history" class="badge pull-right">强化训练</a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <div class="desc">
                                    {x2;if:$ehtype == 0}
                                    <p><span class="text-warning">提示：</span>我的错题中的强化训练最多记录最新20条信息。</p>
                                    {x2;elseif:$ehtype == 1}
                                    <p>您一共完成了<b class="text-warning">{x2;$exams['number']}</b>次考试， 平均分为：<b class="text-warning">{x2;$avgscore}</b>分 继续努力吧！</p>
                                    {x2;elseif:$ehtype == 2}
                                    <p>您一共完成了<b class="text-warning">{x2;$exams['number']}</b>次考试， 平均分为：<b class="text-warning">{x2;$avgscore}</b>分 继续努力吧！</p>
                                    {x2;endif}
                                </div>
                            </li>
                            <li class="border">
                                <div class="desc">
                                    <table class="table table-bordered table-hover">
                                        <tr class="info">
                                            <td>答题记录</td>
                                            <td width="160">答题时间</td>
                                            <td width="80">用时</td>
                                            <td width="80">得分</td>
                                            <td width="80">错题数量</td>
                                            <td width="140">操作</td>
                                        </tr>
                                        {x2;tree:$exams['data'],exam,eid}
                                        <tr>
                                            <td>{x2;v:exam['ehexam']}</td>
                                            <td>{x2;date:v:exam['ehstarttime'],'Y-m-d H:i:s'}</td>
                                            <td>{x2;if:v:exam['ehtime'] >= 60}{x2;if:v:exam['ehtime']%60}{x2;eval: echo intval(v:exam['ehtime']/60)+1}{x2;else}{x2;eval: echo intval(v:exam['ehtime']/60)}{x2;endif}分钟{x2;else}{x2;v:exam['ehtime']}秒{x2;endif}</td>
                                            <td><b>{x2;if:!v:exam['ehstatus'] && v:exam['ehdecide']}评分中{x2;else}{x2;v:exam['ehscore']}{x2;endif}</b></td>
                                            <td><b>{x2;v:exam['errornumber']}</b></td>
                                            <td>
                                                <a title="错题" href="index.php?exam-app-history-wrongs&ehid={x2;v:exam['ehid']}"><em class="glyphicon glyphicon-edit"></em></a>
                                                <a title="解析" href="index.php?exam-app-history-view&ehid={x2;v:exam['ehid']}"><em class="glyphicon glyphicon-list-alt"></em></a>
                                                {x2;if:$ehtype == 2}
                                                <a class="confirm" msg="正式考试的重做试卷将作为模拟考试记录！确定重做吗？" href="index.php?exam-app-history-redo&ehid={x2;v:exam['ehid']}" action-before="clearStorage"><em class="glyphicon glyphicon-repeat"></em></a>
                                                {x2;else}
                                                <a title="重做" class="ajax" href="index.php?exam-app-history-redo&ehid={x2;v:exam['ehid']}" action-before="clearStorage"><em class="glyphicon glyphicon-repeat"></em></a>
                                                {x2;endif}
                                                {x2;if:$ehtype != 2}
                                                <a title="删除" class="confirm" href="index.php?exam-app-history-del&ehid={x2;v:exam['ehid']}"><em class="glyphicon glyphicon-ban-circle"></em></a>
                                                {x2;endif}
                                            </td>
                                        </tr>
                                        {x2;endtree}
                                    </table>
                                </div>
                            </li>
                        </ul>
                        {x2;if:$exams['pages']}
                        <ul class="pagination pull-right">{x2;$exams['pages']}</ul>
                        {x2;endif}
                    </div>
                </div>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
</body>
</html>
