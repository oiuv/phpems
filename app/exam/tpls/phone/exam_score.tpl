{x2;if:!$userhash}
{x2;include:header}
<body>
<div id="content">
    <div class="pages" id="paper">
{x2;endif}
        <div class="pagecontent">
            <header class="container-fluid" style="background-color:#337AB7;">
                <h5 class="text-center">
                    <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
                    正式考试
                    <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
                </h5>
            </header>
            <div class="container-fluid">
                <div class="row-fluid">
                    <div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:0.5rem;">
                        <legend class="text-center"><h3>{x2;$sessionvars['examsession']}</h3></legend>
                        <div class="col-xs-12">
                            <div class="boardscore">
                                <h1 class="text-center text-danger">{x2;$sessionvars['examsessionscore']} 分</h1>
                            </div>
                        </div>
                        <div class="col-xs-12">
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
                           <div class="text-center">
                                <a data-target="views" data-page="views" href="index.php?exam-phone-history-view&ehid={x2;$ehid}" class="btn btn-primary ajax">查看答案和解析</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a data-target="history" data-page="history" href="index.php?exam-phone-history&ehtype=2" class="btn btn-info ajax">进入我的考试记录</a>
                            </div>
                           {x2;endif}
                        </div>
                    </div>
                </div>
            </div>
            {x2;include:footer}
        </div>
        {x2;if:!$userhash}
    </div>
</div>
</body>
</html>
{x2;endif}
