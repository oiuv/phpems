{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:examnav}
            <div class="content">
                <div class="col-xs-12">
                    <div class="content-box padding">
                        <h2 class="title">
                            正式考试
                            <a href="index.php?exam-app-exam" class="badge pull-right">返回考试</a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border">
                                <div class="desc">
                                    <table class="table table-bordered table-hover">
                                        <tr class="info">
                                            <td>答题记录</td>
                                            <td width="160">答题时间</td>
                                            <td width="80">用时</td>
                                            <td width="90">得分</td>
                                        </tr>
                                        {x2;tree:$exams['data'],exam,eid}
                                        <tr>
                                            <td>{x2;v:exam['ehexam']}</td>
                                            <td>{x2;date:v:exam['ehstarttime'],'Y-m-d H:i:s'}</td>
                                            <td>{x2;if:v:exam['ehtime'] >= 60}{x2;if:v:exam['ehtime']%60}{x2;eval: echo intval(v:exam['ehtime']/60)+1}{x2;else}{x2;eval: echo intval(v:exam['ehtime']/60)}{x2;endif}分钟{x2;else}{x2;v:exam['ehtime']}秒{x2;endif}</td>
                                            <td>
                                                <b>
                                                    {x2;if:!v:exam['ehstatus'] && v:exam['ehdecide']}
                                                    评分中
                                                    {x2;elseif:$data['currentbasic']['basicexam']['notviewscore']}
                                                    待公布
                                                    {x2;else}
                                                    {x2;v:exam['ehscore']}
                                                    {x2;endif}
                                                </b>
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
