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
                            模拟考试
                        </h2>
                        <ul class="list-unstyled list-img">
                            {x2;tree:$exams['data'],exam,eid}
                            <li class="border padding">
                                <h4 class="shorttitle">{x2;v:exam['exam']}</h4>
                                <div class="intro">
                                    <div class="desc">
                                        <p class="toolbar">
                                            <a class="badge">总分：{x2;v:exam['examsetting']['score']} 分</a>
                                            <a class="badge">及格分：{x2;v:exam['examsetting']['passscore']} 分</a>
                                            <a class="badge">时间：{x2;v:exam['examsetting']['examtime']} 分钟</a>
                                        </p>
                                        <p class="toolbar">
                                            <a action-before="clearStorage" href="index.php?exam-app-exampaper-selectquestions&examid={x2;v:exam['examid']}" class="ajax btn btn-info pull-right more">开始考试</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            {x2;endtree}
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
