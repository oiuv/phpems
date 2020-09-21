{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">考试记录</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header{x2;if:$exams['pages']} footer{x2;endif}">
            <div class="list-box bg">
                <ol>
                    {x2;tree:$exams['data'],exam,eid}
                    <li class="unstyled">
                        <div class="col-8x">
                            {x2;if:!v:exam['ehstatus'] && v:exam['ehdecide']}
                            <h4>待评</h4>
                            {x2;elseif:$data['currentbasic']['basicexam']['notviewscore']}
                            <h4>待评</h4>
                            {x2;else}
                            <h2 class="text-center">{x2;eval: echo intval(v:exam['ehscore'])}</h2>
                            <div class="rows">
                                <div class="more text-center">分</div>
                            </div>
                            {x2;endif}
                        </div>
                        <div class="col-8l">
                            <div class="rows info">
                                <h5 class="title">{x2;v:exam['ehexam']}</h5>
                                <div class="intro">
                                    <div class="col-4"> {x2;date:v:exam['ehstarttime'],'Y-m-d'}</div>
                                    <div class="col-4"> 用时：{x2;if:v:exam['ehtime'] >= 60}{x2;if:v:exam['ehtime']%60}{x2;eval: echo intval(v:exam['ehtime']/60)+1}{x2;else}{x2;eval: echo intval(v:exam['ehtime']/60)}{x2;endif}分{x2;else}{x2;v:exam['ehtime']}秒{x2;endif}</div>
                                    {x2;if:!v:exam['ehstatus'] && v:exam['ehdecide']}
                                    <div class="col-2">待评分</div>
                                    {x2;elseif:$data['currentbasic']['basicexam']['notviewscore']}
                                    <div class="col-2">未公布</div>
                                    {x2;else}
                                    {x2;if:v:exam['ehispass']}
                                    <div class="col-2 text-success">及格</div>
                                    {x2;else}
                                    <div class="col-2 text-danger">不及格</div>
                                    {x2;endif}
                                    {x2;endif}
                                </div>
                            </div>
                        </div>
                    </li>
                    {x2;endtree}
                </ol>
            </div>
        </div>
        {x2;if:$exams['pages']}
        <div class="page-footer">
            <ul class="pagination">{x2;$exams['pages']}</ul>
        </div>
        {x2;endif}
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
