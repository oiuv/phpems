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
                        <h2 class="title">成绩单</h2>
                        <ul class="list-unstyled list-img">
                            {x2;if:$scores['number']}
                            <li class="border padding">
                                <div class="desc">
                                    <p>
                                        您的最高分：<span class="text-warning">{x2;$s['score']}</span>
                                        您的最好名次：<span class="text-warning">{x2;$s['index']}</span>
                                    </p>
                                </div>
                            </li>
                            {x2;endif}
                            <li class="border">
                                <div class="desc">
                                    <table class="table table-bordered table-hover">
                                        <tr class="info">
                                            <td width="80">名次</td>
                                            <td>姓名</td>
                                            <td>得分</td>
                                            <td>考试时间</td>
                                            <td width="120">用时</td>
                                        </tr>
                                        {x2;tree:$scores['data'],score,sid}
                                        <tr>
                                            <td>{x2;eval: echo ($page - 1)*20 + v:sid}</td>
                                            <td>{x2;v:score['usertruename']}</td>
                                            <td>{x2;v:score['ehscore']}</td>
                                            <td>{x2;date:v:score['ehstarttime'],'Y-m-d H:i:s'}</td>
                                            <td>{x2;if:v:score['ehtime'] >= 60}{x2;if:v:score['ehtime']%60}{x2;eval: echo intval(v:score['ehtime']/60)+1}{x2;else}{x2;eval: echo intval(v:score['ehtime']/60)}{x2;endif}分钟{x2;else}{x2;v:score['ehtime']}秒{x2;endif}</td>
                                        </tr>
                                        {x2;endtree}
                                    </table>
                                </div>
                            </li>
                        </ul>
                        {x2;if:$scores['pages']}
                        <ul class="pagination pull-right">{x2;$scores['pages']}</ul>
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
