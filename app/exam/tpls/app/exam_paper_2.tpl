{x2;include:header}
<body data-spy="scroll" data-target="#myScrollspy">
<!--
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="box itembox">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                      <li><a href="index.php">首页</a></li>
                      <li><a href="index.php?exam-app">考试</a></li>
                      <li><a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a></li>
                      <li class="active">{x2;$sessionvars['examsession']}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
-->
<div class="container-fluid" id="questioncontent">
    <div class="row-fluid">
        <div class="main box">
            <div class="col-xs-3" id="questionbar">
                <dl class="clear" style="width:270px;" data-spy="affix" data-offset-top="235">
                    <dd>
                        <h2><a class="btn btn-danger col-xs-12" style="font-size:1.2em;"><span id="timer_h">00</span>：<span id="timer_m">00</span>：<span id="timer_s">00</span></a></h2>
                    </dd>
                    <dt class="float_l"><h4>&nbsp;</h4></dt>
                    <ul class="nav nav-tabs" role="tablist">
                        {x2;eval: v:oid = 0}
                        {x2;tree:$sessionvars['examsessionsetting']['examsetting']['questypelite'],lite,qid}
                        {x2;if:v:lite}
                        {x2;eval: v:quest = v:key}
                        {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                        {x2;if:$data['currentbasic']['basicexam']['changesequence']}
                        {x2;eval: shuffle($sessionvars['examsessionquestion']['questions'][v:quest]);}
                        {x2;eval: shuffle($sessionvars['examsessionquestion']['questionrows'][v:quest]);}
                        {x2;endif}
                        {x2;eval: v:oid++}
                        <li role="presentation"{x2;if:v:qid == 1} class="active"{x2;endif}><a href="#qt_{x2;v:quest}" aria-controls="home" role="tab" data-toggle="tab">{x2;$ols[v:oid]}</a></li>
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
                        <div role="tabpanel" class="tab-pane tableindex{x2;if:v:qid == 1} active{x2;endif}" id="qt_{x2;v:quest}">
                            {x2;eval: v:tid = 0}
                            {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
                            {x2;eval: v:tid++}
                            <a id="sign_{x2;v:question['questionid']}" href="#question_{x2;v:question['questionid']}" class="btn btn-default{x2;if:$sessionvars['examsessionsign'][v:question['questionid']]} btn-danger{x2;endif}">{x2;v:tid}</a>
                            {x2;endtree}
                            {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qrid}
                            {x2;eval: v:tid++}
                            {x2;tree:v:questionrow['data'],data,did}
                            <a id="sign_{x2;v:data['questionid']}" href="#question_{x2;v:data['questionid']}" class="btn btn-default{x2;if:$sessionvars['examsessionsign'][v:data['questionid']]} btn-danger{x2;endif}">{x2;v:tid}-{x2;v:did}</a>
                            {x2;endtree}
                            {x2;endtree}
                        </div>
                        {x2;endif}
                        {x2;endif}
                        {x2;endtree}
                    </div>
                </dl>
            </div>
            <form id="form1" name="form1" method="post" action="index.php?exam-app-exam-score" class="col-xs-9 split pull-right" style="padding:0px;">
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
                            <a class="btn {x2;if:$sessionvars['examsessionsign'][v:question['questionid']]}btn-danger{x2;else}btn-info{x2;endif} qicon" href="javascript:;" onclick="javascript:signQuestion('{x2;v:question['questionid']}',this);"><i class="glyphicon glyphicon-bookmark"></i></a>
                            <a name="question_{x2;v:question['questionid']}"></a>
                            <input id="time_{x2;v:question['questionid']}" type="hidden" name="time[{x2;v:question['questionid']}]"/>
                        </span>
                    </h4>
                    <div class="choice">
                        {x2;realhtml:v:question['question']}
                    </div>
                    {x2;if:!$questype[v:quest]['questsort']}
                    {x2;if:v:question['questionselect'] && $questype[v:quest]['questchoice'] != 5}
                    <div class="choice">
                        {x2;realhtml:v:question['questionselect']}
                    </div>
                    {x2;endif}
                    <div class="selector">
                        {x2;if:$questype[v:quest]['questchoice'] == 1 || $questype[v:quest]['questchoice'] == 4}
                            {x2;tree:$selectorder,so,sid}
                            {x2;if:v:key == v:question['questionselectnumber']}
                            {x2;eval: break;}
                            {x2;endif}
                            <label class="radio-inline"><input type="radio" name="question[{x2;v:question['questionid']}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:question['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
                            {x2;endtree}
                        {x2;elseif:$questype[v:quest]['questchoice'] == 5}
                            <input type="text" style="width:100%;height:2em;" name="question[{x2;v:question['questionid']}]" value="{x2;$sessionvars['examsessionuseranswer'][v:question['questionid']]}" rel="{x2;v:question['questionid']}"/>
                        {x2;else}
                            {x2;tree:$selectorder,so,sid}
                            {x2;if:v:key >= v:question['questionselectnumber']}
                            {x2;eval: break;}
                            {x2;endif}
                            <label class="checkbox-inline"><input type="checkbox" name="question[{x2;v:question['questionid']}][{x2;v:key}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:question['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
                            {x2;endtree}
                        {x2;endif}
                    </div>
                    {x2;else}
                    <div class="selector">
                        {x2;eval: $dataid = v:question['questionid']}
                        <textarea class="jckeditor" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;v:question['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
                    </div>
                    {x2;endif}
                </div>
                {x2;endtree}
                {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qrid}
                {x2;eval: v:tid++}
                <div class="box itembox">
                    <h4 class="title">第{x2;v:tid}题</h4>
                    <div class="choice">
                        {x2;realhtml:v:questionrow['qrquestion']}
                    </div>
                    {x2;tree:v:questionrow['data'],data,did}
                    {x2;eval: v:qcid++}
                    <blockquote class="paperexamcontent" style="background:#FFFFFF;border-right:1px solid #CCCCCC;border-top:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;">
                    <h4 class="title">
                        第{x2;v:did}题
                        <span class="pull-right">
                            <a class="btn {x2;if:$sessionvars['examsessionsign'][v:data['questionid']]}btn-danger{x2;else}btn-info{x2;endif} qicon" href="javascript:;" onclick="javascript:signQuestion('{x2;v:data['questionid']}',this);"><i class="glyphicon glyphicon-bookmark"></i></a>
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
                    <div class="selector">
                        {x2;if:$questype[v:quest]['questchoice'] == 1 || $questype[v:quest]['questchoice'] == 4}
                            {x2;tree:$selectorder,so,sid}
                            {x2;if:v:key == v:data['questionselectnumber']}
                            {x2;eval: break;}
                            {x2;endif}
                            <label class="radio-inline"><input type="radio" name="question[{x2;v:data['questionid']}]" rel="{x2;v:data['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:data['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
                            {x2;endtree}
                        {x2;elseif:$questype[v:quest]['questchoice'] == 5}
                            <input type="text" style="width:100%;height:2em;" name="question[{x2;v:data['questionid']}]" value="{x2;$sessionvars['examsessionuseranswer'][v:data['questionid']]}" rel="{x2;v:data['questionid']}"/>
                        {x2;else}
                            {x2;tree:$selectorder,so,sid}
                            {x2;if:v:key >= v:data['questionselectnumber']}
                            {x2;eval: break;}
                            {x2;endif}
                            <label class="checkbox-inline"><input type="checkbox" name="question[{x2;v:data['questionid']}][{x2;v:key}]" rel="{x2;v:data['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:data['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
                            {x2;endtree}
                        {x2;endif}
                    </div>
                    {x2;else}
                    <div class="selector">
                        {x2;eval: $dataid = v:data['questionid']}
                        <textarea class="jckeditor" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;v:data['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
                    </div>
                    {x2;endif}
                    </blockquote>
                    {x2;endtree}
                </div>
                {x2;endtree}
                {x2;endif}
                {x2;endif}
                {x2;endtree}
                <h3 class="text-center">
                    <input type="hidden" name="insertscore" value="1"/>
                    <a class="btn btn-primary" style="font-size:1em;width:270px;" href="#submodal" role="button" data-toggle="modal">交 卷</a>
                </h3>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="submodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">交卷</h4>
            </div>
            <div class="modal-body">
                <p>共有试题 <span class="allquestionnumber">50</span> 题，已做 <span class="yesdonumber">0</span> 题。您确认要交卷吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="javascript:submitPaper();" class="btn btn-primary">确定交卷</button>
                <button aria-hidden="true" class="btn" type="button" data-dismiss="modal">再检查一下</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
    $.get('index.php?exam-app-index-ajax-lefttime&rand'+Math.random(),function(data){
        var setting = {
            {x2;if:$data['currentbasic']['basicexam']['opentime']['start'] && $data['currentbasic']['basicexam']['opentime']['end']}
            {x2;if:$data['currentbasic']['basicexam']['opentime']['end']-300 <= ($sessionvars['examsessiontime'] * 60 + $sessionvars['examsessionstarttime'])}
            time:{x2;eval: echo intval(($data['currentbasic']['basicexam']['opentime']['end']- 300 - $sessionvars['examsessionstarttime'])/60)},
            {x2;else}
            time:{x2;$sessionvars['examsessiontime']},
            {x2;endif}
            {x2;else}
            time:{x2;$sessionvars['examsessiontime']},
            {x2;endif}
            hbox:$("#timer_h"),
            mbox:$("#timer_m"),
            sbox:$("#timer_s"),
            finish:function(){
                submitPaper();
            }
        }
        setting.lefttime = parseInt(data);
        countdown(setting);
    });

    setInterval(saveanswer,120000);

    initData = $.parseJSON(storage.getItem('questions'));
    if(initData){
        for(var p in initData){
            if(p!='set')
            formData[p]=initData[p];
            $("#time_"+$('[name="'+p+'"]').attr('rel')).val(initData[p].time);
        }

        var textarea = $('#form1 textarea');
        $.each(textarea,function(){
            var _this = $(this);
            if(initData[_this.attr('name')])
            {
                _this.val(initData[_this.attr('name')].value);
                CKEDITOR.instances[_this.attr('id')].setData(initData[_this.attr('name')].value);
                if(initData[_this.attr('name')].value && initData[_this.attr('name')].value != '')
                batmark(_this.attr('rel'),initData[_this.attr('name')].value);
            }
        });
        var texts = $('#form1 :input[type=text]');
        $.each(texts,function(){
            var _this = $(this);
            if(initData[_this.attr('name')])
            {
                _this.val(initData[_this.attr('name')]?initData[_this.attr('name')].value:'');
                if(initData[_this.attr('name')].value && initData[_this.attr('name')].value != '')
                batmark(_this.attr('rel'),initData[_this.attr('name')].value);
            }
        });

        var radios = $('#form1 :input[type=radio]');
        $.each(radios,function(){
            var _= this, v = initData[_.name]?initData[_.name].value:null;
            var _this = $(this);
            if(v!=''&&v==_.value){
                _.checked = true;
                batmark(_this.attr('rel'),initData[_this.attr('name')].value);
            }else{
                _.checked=false;
            }
        });

        var checkboxs=$('#form1 :input[type=checkbox]');
        $.each(checkboxs,function(){
            var _=this,v=initData[_.name]?initData[_.name].value:null;
            var _this = $(this);
            if(v!=''&&v==_.value){
                _.checked=true;
                batmark(_this.attr('rel'),initData[_this.attr('name')].value);
            }else{
                _.checked=false;
            }
        });
    }

    $('#form1 :input[type=text]').change(function(){
        var _this=$(this);
        var p=[];
        p.push(_this.attr('name'));
        p.push(_this.val());
        p.push(Date.parse(new Date())/1000);
        $('#time_'+_this.attr('rel')).val(Date.parse(new Date())/1000);
        set.apply(formData,p);
        markQuestion(_this.attr('rel'),true);
    });

    $('#form1 :input[type=radio]').change(function(){
        var _=this;
        var _this=$(this);
        var p=[];
        p.push(_.name);
        if(_.checked){
            p.push(_.value);
            p.push(Date.parse(new Date())/1000);
            $('#time_'+_this.attr('rel')).val(Date.parse(new Date())/1000);
            set.apply(formData,p);
        }else{
            p.push('');
            p.push(null);
            set.apply(formData,p);
        }
        markQuestion(_this.attr('rel'));
    });

    $('#form1 textarea').change(function(){
        var _= this;
        var _this=$(this);
        var p=[];
        p.push(_.name);
        p.push(_.value);
        p.push(Date.parse(new Date())/1000);
        $('#time_'+_this.attr('rel')).val(Date.parse(new Date())/1000);
        set.apply(formData,p);
        markQuestion(_this.attr('rel'),true);
    });

    $('#form1 :input[type=checkbox]').change(function(){
        var _= this;
        var _this = $(this);
        var p=[];
        p.push(_.name);
        if(_.checked){
            p.push(_.value);
            p.push(Date.parse(new Date())/1000);
            $('#time_'+_this.attr('rel')).val(Date.parse(new Date())/1000);
            set.apply(formData,p);
        }else{
            p.push('');
            p.push(null);
            set.apply(formData,p);
        }
        markQuestion(_this.attr('rel'));
    });

    $('.allquestionnumber').html($('.paperexamcontent').length);
    $('.yesdonumber').html($('#questionindex .btn-primary').length);
});
</script>
<!--
{x2;include:footer}
-->
</body>
</html>
