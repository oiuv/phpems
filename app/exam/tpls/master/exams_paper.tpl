<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PHPEMS模拟考试系统后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="files/public/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="files/public/css/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="files/public/css/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="files/public/css/pe.master.css" />
    <script src="files/public/js/jquery.min.js"></script>
    <script src="files/public/js/jquery-ui.min.js"></script>
    <script src="files/public/js/bootstrap.min.js"></script>
    <script src="files/public/js/bootstrap-datetimepicker.js"></script>
    <script src="files/public/js/all.fine-uploader.min.js"></script>
    <script src="files/public/js/ckeditor/ckeditor.js"></script>
    <script src="files/public/js/pe.master.js"></script>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<div class="container-fluid" id="questioncontent">
    <div class="row-fluid">
        <div class="main box" style="width:1200px;">
            <div class="col-xs-3" id="questionbar">
                <dl class="clear" style="width:270px;" data-spy="affix" data-offset-top="235">
                    <dt class="float_l"><h4>&nbsp;</h4></dt>
                    <ul class="nav nav-tabs" role="tablist">
                        {x2;eval: v:oid = 0}
                        {x2;tree:$sessionvars['examsessionsetting']['examsetting']['questypelite'],lite,qid}
                        {x2;if:v:lite}
                        {x2;eval: v:quest = v:key}
                        {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                        {x2;eval: v:oid++}
                        <li role="presentation"{x2;if:v:oid == 1} class="active"{x2;endif}><a href="#qt_{x2;v:quest}" aria-controls="home" role="tab" data-toggle="tab">{x2;$ols[v:oid]}</a></li>
                        {x2;endif}
                        {x2;endif}
                        {x2;endtree}
                    </ul>
                    <div class="tab-content" style="margin-top:5px;" id="questionindex">
                        {x2;eval: v:oid = 0}
                        {x2;tree:$sessionvars['examsessionsetting']['examsetting']['questypelite'],lite,qid}
                        {x2;if:v:lite}
                        {x2;eval: v:quest = v:key}
                        {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                        {x2;eval: v:oid++}
                        <div role="tabpanel" class="tab-pane tableindex{x2;if:v:oid == 1} active{x2;endif}" id="qt_{x2;v:quest}">
                            {x2;eval: v:tid = 0}
                            {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
                            {x2;eval: v:tid++}
                            <a id="sign_{x2;v:question['questionid']}" href="#question_{x2;v:question['questionid']}" class="btn btn-default">{x2;v:tid}</a>
                            {x2;endtree}
                            {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qrid}
                            {x2;eval: v:tid++}
                            {x2;tree:v:questionrow['data'],data,did}
                            <a id="sign_{x2;v:data['questionid']}" href="#question_{x2;v:data['questionid']}" class="btn btn-default">{x2;v:tid}-{x2;v:did}</a>
                            {x2;endtree}
                            {x2;endtree}
                        </div>
                        {x2;endif}
                        {x2;endif}
                        {x2;endtree}
                    </div>
                </dl>
            </div>
            <div class="col-xs-9 split pull-right" style="padding:0px;position:relative;">
                <div class="box itembox">
                    <h2 class="text-center tt">{x2;$sessionvars['examsession']}</h2>
                </div>
                {x2;eval: v:oid = 0}
                {x2;tree:$sessionvars['examsessionsetting']['examsetting']['questypelite'],lite,qid}
                {x2;if:v:lite}
                {x2;eval: v:quest = v:key}
                {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                {x2;eval: v:oid++}
                <hr />
                <div class="box itembox">
                    <blockquote class="questype">{x2;$ols[v:oid]}、{x2;$questype[v:quest]['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']}</blockquote>
                </div>
                {x2;eval: v:tid = 0}
                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
                {x2;eval: v:tid++}
                <div class="box itembox paperexamcontent">
                    <h4 class="title">
                        第{x2;v:tid}题
                        <span class="pull-right">
                            <a class="btn btn-primary qicon" onclick="javascript:favorquestion('{x2;v:question['questionid']}');"><i class="glyphicon glyphicon-heart-empty"></i></a>
                            <a name="question_{x2;v:question['questionid']}">
                            <input id="time_{x2;v:question['questionid']}" type="hidden" name="time[{x2;v:question['questionid']}]"/>
                        </span>
                    </h4>
                    <div class="choice">
                        </a>{x2;realhtml:v:question['question']}
                    </div>
                    {x2;if:!$questype[v:quest]['questsort']}
                    {x2;if:v:question['questionselect'] && $questype[v:quest]['questchoice'] != 5}
                    <div class="choice">
                        {x2;realhtml:v:question['questionselect']}
                    </div>
                    {x2;endif}
                    {x2;endif}
                    <div class="decidediv" style="position:relative;">
                        <table class="table table-hover table-bordered">
                            <tr class="info">
                                <td width="15%">正确答案：</td>
                                <td>{x2;realhtml:v:question['questionanswer']}</td>
                            </tr>
                            <tr>
                                <td>答案解析：</td>
                                <td>{x2;realhtml:v:question['questiondescribe']}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                {x2;endtree}
                {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qrid}
                {x2;eval: v:tid++}
                <div class="box itembox paperexamcontent">
                    <h4 class="title">第{x2;v:tid}题</h4>
                    <div class="choice">
                        {x2;realhtml:v:questionrow['qrquestion']}
                    </div>
                    {x2;tree:v:questionrow['data'],data,did}
                    {x2;eval: v:qcid++}
                    <blockquote style="background:#FFFFFF;border-right:1px solid #CCCCCC;border-top:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;">
                    <h4 class="title">
                        第{x2;v:did}题
                        <span class="pull-right">
                            <a class="btn btn-primary qicon" onclick="javascript:favorquestion('{x2;v:data['questionid']}');"><i class="glyphicon glyphicon-heart-empty"></i></a>
                            <a name="question_{x2;v:data['questionid']}"></a>
                            <input id="time_{x2;v:data['questionid']}" type="hidden" name="time[{x2;v:data['questionid']}]"/>
                        </span>
                    </h4>
                    <div class="choice">
                        {x2;realhtml:v:data['question']}
                    </div>
                    {x2;if:!$questype[v:quest]['questsort']}
                    {x2;if:v:data['questionselect'] && $questype[v:quest]['questchoice'] != 5}
                    <div class="choice">
                        {x2;realhtml:v:data['questionselect']}
                    </div>
                    {x2;endif}
                    {x2;endif}
                    <div class="decidediv" style="position:relative;">
                        <table class="table table-hover table-bordered">
                            <tr class="info">
                                <td width="15%">正确答案：</td>
                                <td>{x2;realhtml:v:data['questionanswer']}</td>
                            </tr>
                            <tr>
                                <td>答案解析：</td>
                                <td>{x2;realhtml:v:data['questiondescribe']}</td>
                            </tr>
                        </table>
                    </div>
                    </blockquote>
                    {x2;endtree}
                </div>
                {x2;endtree}
                {x2;endif}
                {x2;endif}
                {x2;endtree}
            </div>
        </div>
    </div>
</div>
</body>
</html>
