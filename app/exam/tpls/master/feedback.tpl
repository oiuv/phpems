{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-2 leftmenu">
                {x2;include:menu}
            </div>
            <div id="datacontent">
{x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-master-questions">试题管理</a></li>
                            <li class="active">错题反馈</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        错题反馈
                    </h4>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>反馈ID</th>
                                <th>试题ID</th>
                                <th>反馈类型</th>
                                <th>反馈内容</th>
                                <th>反馈人ID</th>
                                <th>反馈时间</th>
                                <th>处理人ID</th>
                                <th>处理时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:$feedback['data'],feed,fid}
                            <tr{x2;if:v:feed['fbstatus']} class="success"{x2;else} class="danger"{x2;endif}>
                                <td>{x2;v:feed['fbid']}</td>
                                <td>{x2;v:feed['fbquestionid']}【 <a target="_blank" href="index.php?exam-master-questions-modifyquestion&questionid={x2;v:feed['fbquestionid']}">编辑</a> 】</td>
                                <td>{x2;v:feed['fbtype']}</td>
                                <td>{x2;v:feed['fbcontent']}</td>
                                <td>{x2;v:feed['fbuserid']}</td>
                                <td>{x2;date:v:feed['fbtime'],'Y-m-d'}</td>
                                <td>{x2;if:v:feed['fbstatus']}{x2;v:feed['fbdoneuserid']}{x2;else}未处理{x2;endif}</td>
                                <td>{x2;if:v:feed['fbstatus']}{x2;date:v:feed['fbdonetime'],'Y-m-d'}{x2;else}未处理{x2;endif}</td>
                                <td>
                                    <div class="btn-group">
                                        {x2;if:!v:feed['fbstatus']}
                                        <a class="btn ajax" href="index.php?exam-master-feedback-donefeedback&status=1&fbid={x2;v:feed['fbid']}" title="标记为已处理"><em class="glyphicon glyphicon-ok"></em></a>
                                        {x2;endif}
                                        <a class="btn confirm" href="index.php?exam-master-feedback-del&fbid={x2;v:feed['fbid']}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                    </div>
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
