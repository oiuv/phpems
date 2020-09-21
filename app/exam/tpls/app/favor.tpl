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
                <div class="col-xs-9 nopadding">
                    {x2;tree:$favors['data'],question,qid}
                    <div class="content-box padding">
                        <h2 class="title">
                            第 {x2;v:qid} 题 【 {x2;$questype[v:question['questiontype']]['questype']}】
                            <a class="badge pull-right error" data-questionid="{x2;v:question['questionid']}">纠错</a>
                            <a class="badge pull-right ajax" href="index.php?exam-app-favor-ajax-delfavor&favorid={x2;v:question['favorid']}">移除</a>
                            {x2;if:v:question['questionparent']}
                            <a class="badge pull-right selfmodal" href="javascript:;" url="index.php?exam-app-questions-rowsdetail&questionid={x2;v:question['questionparent']}&{x2;c:TIME}" data-target="#modal">全部</a>
                            {x2;endif}
                        </h2>
                        <ul class="list-unstyled list-img">
                            {x2;if:$parents[v:question['questionparent']]}
                            <li class="border morepadding">
                                <div class="desc">
                                    <p>{x2;realhtml:$parents[v:question['questionparent']]['qrquestion']}</p>
                                </div>
                            </li>
                            {x2;endif}
                            <li class="border morepadding">
                                <div class="desc">
                                    <p>{x2;realhtml:v:question['question']}</p>
                                </div>
                            </li>
                            {x2;if:v:question['questionselect']}
                            <li class="border morepadding">
                                <div class="desc">
                                    {x2;realhtml:v:question['questionselect']}
                                </div>
                            </li>
                            {x2;endif}
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="col-xs-1 nopadding">
                                            <div class="toolbar"><span class="badge">正确答案</span></div>
                                        </div>
                                        {x2;if:$questype[v:question['questiontype']]['questsort']}
                                        <div class="col-xs-11">
                                            {x2;realhtml:v:question['questionanswer']}
                                        </div>
                                        {x2;else}
                                        <div class="col-xs-11">
                                            <b id="rightanswer_{x2;v:question['questionid']}">{x2;v:question['questionanswer']}</b>
                                        </div>
                                        {x2;endif}
                                    </div>
                                </div>
                            </li>
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="col-xs-1 nopadding">
                                            <div class="toolbar"><span class="badge">试题解析</span></div>
                                        </div>
                                        <div class="col-xs-11">
                                            {x2;realhtml:v:question['questiondescribe']}
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    {x2;endif}
                    <div class="content-box noground padding">
                        {x2;if:$favors['pages']}
                        <ul class="pagination pull-right">{x2;$favors['pages']}</ul>
                        {x2;endif}
                    </div>
                </div>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
<div id="modal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
                <h4 id="myModalLabel">
                    试题详情
                </h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button aria-hidden="true" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
{x2;include:paper_footer}
</body>
</html>
