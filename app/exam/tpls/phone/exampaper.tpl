{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">模拟考试</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header">
            <div class="list-box bg">
                <ol>
                    {x2;tree:$exams['data'],exam,eid}
                    <li class="unstyled">
                        <a action-before="clearStorage" href="index.php?exam-phone-exampaper-selectquestions&examid={x2;v:exam['examid']}" class="ajax">
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
                </ol>
            </div>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
