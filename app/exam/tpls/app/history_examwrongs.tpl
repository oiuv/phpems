{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            <div class="header navbar-fixed-top">
                <div class="nav">
                    <div class="col-xs-9">
                        <ul class="list-unstyled list-inline">
                            <li>
                                <h3 class="logo">{x2;$sessionvars['examsession']}</h3>
                            </li>
                        </ul>
                    </div>
                    <div class="col-xs-3">
                        <ul class="list-unstyled list-inline">
                            <li class="pull-right">
                                <a href="index.php?exam-app-history&ehtype={x2;$eh['ehtype']}" class="menu">
                                    <span class="glyphicon glyphicon-chevron-left"></span> 返回
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            {x2;if:$eh['ehstatus']}
            <div class="content fixtop">
                <div class="col-xs-3">
                    <div class="content-box padding" id="questionindex" data-spy="affix">
                        {x2;eval: v:oid = 0}
                        {x2;eval: v:qmid = 0}
                        {x2;tree:$questype,quest,qid}
                        {x2;if:v:quest}
                        {x2;eval: v:quest = v:quest['questid']}
                        {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                        {x2;eval: v:oid++}
                        <h3 class="title">
                            {x2;$ols[v:oid]}、{x2;$questype[v:quest]['questype']}
                            <a class="badge pull-right resize"><em class="glyphicon glyphicon-resize-full"></em></a>
                        </h3>
                        <ul class="list-unstyled list-img">
                            <li id="qt_{x2;v:quest}">
                                {x2;eval: v:tid = 0}
                                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
                                {x2;eval: v:tid++}
                                {x2;eval: v:qmid++}
                                {x2;if:$sessionvars['examsessionscorelist'][v:question['questionid']] && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']}
                                {x2;else}
                                <a id="sign_{x2;v:question['questionid']}" href="#q_{x2;v:question['questionid']}" class="btn btn-default qindex">{x2;v:tid}</a>
                                {x2;endif}
                                {x2;endtree}
                                {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qrid}
                                {x2;tree:v:questionrow['data'],question,did}
                                {x2;eval: v:tid++}
                                {x2;eval: v:qmid++}
                                {x2;if:$sessionvars['examsessionscorelist'][v:question['questionid']] && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']}
                                {x2;else}
                                <a id="sign_{x2;v:question['questionid']}" href="#q_{x2;v:question['questionid']}" class="btn btn-default qindex">{x2;v:tid}</a>
                                {x2;endif}
                                {x2;endtree}
                                {x2;endtree}
                            </li>
                        </ul>
                        {x2;endif}
                        {x2;endif}
                        {x2;endtree}
                    </div>
                </div>
                <div class="col-xs-9 nopadding" id="paper" action="index.php?exam-app-exercise-score">
                    {x2;eval: v:oid = 0}
                    {x2;eval: v:qcid = 0}
                    {x2;tree:$questype,quest,qid}
                    {x2;if:v:quest}
                    {x2;eval: v:quest = v:quest['questid']}
                    {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                    {x2;eval: v:oid++}
                    {x2;eval: v:tid = 0}
                    {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
                    {x2;eval: v:tid++}
                    {x2;eval: v:qcid++}
                    {x2;if:$sessionvars['examsessionscorelist'][v:question['questionid']] && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']}
                    {x2;else}
                    <div class="content-box padding">
                        <h2 class="title">
                            <a id="q_{x2;v:question['questionid']}"></a>
                            第 {x2;v:tid} 题 【 {x2;$questype[v:quest]['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']} 】
                            <a class="badge pull-right error" data-questionid="{x2;v:question['questionid']}">纠错</a>
                            <a class="badge pull-right favor" data-questionid="{x2;v:question['questionid']}">收藏</a>
                        </h2>
                        <ul class="list-unstyled list-img">
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
                            {x2;if:$questype[v:quest]['questsort']}
                            <li class="border morepadding">
                                <textarea class="jckeditor view" etype="simple" id="editor{x2;v:question['questionid']}" name="question[{x2;v:question['questionid']}]" rel="{x2;v:question['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][v:question['questionid']]}</textarea>
                            </li>
                            <li class="border morepadding">
                                <label class="inline"><button class="btn btn-primary badge" onclick="javascript:$(this).parents('li').hide().parents('.content-box').find('.rightanswer').removeClass('hide');">查看答案</button></label>
                            </li>
                            {x2;else}
                            <li class="border morepadding">
                                <form class="nopadding desc">
                                    {x2;if:$questype[v:quest]['questchoice'] == 1 || $questype['questchoice'] == 4}
                                    {x2;tree:$selectorder,so,sid}
                                    {x2;if:v:key == v:question['questionselectnumber']}
                                    {x2;eval: break;}
                                    {x2;endif}
                                    <label class="inline"><input type="radio" name="question[{x2;v:question['questionid']}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:question['questionid']]}checked{x2;endif}/><span class="selector">{x2;v:so}</span> </label>
                                    {x2;endtree}
                                    {x2;elseif:$questype[v:quest]['questchoice'] == 5}
                                    <input type="text" name="question[{x2;v:question['questionid']}]" placeholder="点击此处填写答案" value="{x2;$sessionvars['examsessionuseranswer'][v:question['questionid']]}" rel="{x2;v:question['questionid']}"/>
                                    <label class="inline pull-right"><button class="btn btn-primary badge finish fill">答题完毕</button></label>
                                    {x2;else}
                                    {x2;tree:$selectorder,so,sid}
                                    {x2;if:v:key >= v:question['questionselectnumber']}
                                    {x2;eval: break;}
                                    {x2;endif}
                                    <label class="inline"><input type="checkbox" name="question[{x2;v:question['questionid']}][{x2;v:key}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:question['questionid']])}checked{x2;endif}/><span class="selector">{x2;v:so}</span> </label>
                                    {x2;endtree}
                                    <label class="inline pull-right"><button class="btn btn-primary badge finish" rel="{x2;v:question['questionid']}">答题完毕</button></label>
                                    {x2;endif}
                                </form>
                            </li>
                            {x2;endif}
                            <li class="border morepadding rightanswer hide">
                                <div class="intro">
                                    <div class="desc">
                                        <div class="col-xs-1 nopadding">
                                            <div class="toolbar"><span class="badge">正确答案</span></div>
                                        </div>
                                        {x2;if:$questype[v:quest]['questsort']}
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
                            <li class="border morepadding rightanswer hide">
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
                    {x2;endtree}
                    {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qnid}
                    {x2;tree:v:questionrow['data'],question,did}
                    {x2;eval: v:tid++}
                    {x2;eval: v:qcid++}
                    {x2;if:$sessionvars['examsessionscorelist'][v:question['questionid']] && $sessionvars['examsessionscorelist'][v:question['questionid']] == $sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['score']}
                    {x2;else}
                    <div class="content-box padding">
                        <h2 class="title">
                            <a id="q_{x2;v:question['questionid']}"></a>
                            第 {x2;v:tid} 题 【 {x2;$questype[v:quest]['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']} 】
                            <a class="badge pull-right error" data-questionid="{x2;v:question['questionid']}">纠错</a>
                            <a class="badge pull-right favor" data-questionid="{x2;v:question['questionid']}">收藏</a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border morepadding">
                                <div class="desc">
                                    <p>{x2;realhtml:v:questionrow['qrquestion']}</p>
                                </div>
                            </li>
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
                            {x2;if:$questype[v:question['questiontype']]['questsort']}
                            <li class="border morepadding">
                                <textarea class="jckeditor view" etype="simple" id="editor{x2;v:question['questionid']}" name="question[{x2;v:question['questionid']}]" rel="{x2;v:question['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][v:question['questionid']]}</textarea>
                            </li>
                            <li class="border morepadding">
                                <label class="inline"><button class="btn btn-primary badge" onclick="javascript:$(this).parents('li').hide().parents('.content-box').find('.rightanswer').removeClass('hide');">查看答案</button></label>
                            </li>
                            {x2;else}
                            <li class="border morepadding">
                                <form class="nopadding desc">
                                    {x2;if:$questype[v:question['questiontype']]['questchoice'] == 1 || $questype['questchoice'] == 4}
                                    {x2;tree:$selectorder,so,sid}
                                    {x2;if:v:key == v:question['questionselectnumber']}
                                    {x2;eval: break;}
                                    {x2;endif}
                                    <label class="inline"><input type="radio" name="question[{x2;v:question['questionid']}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:question['questionid']]}checked{x2;endif}/><span class="selector">{x2;v:so}</span> </label>
                                    {x2;endtree}
                                    {x2;elseif:$questype[v:question['questiontype']]['questchoice'] == 5}
                                    <input type="text" name="question[{x2;v:question['questionid']}]" placeholder="点击此处填写答案" value="{x2;$sessionvars['examsessionuseranswer'][v:question['questionid']]}" rel="{x2;v:question['questionid']}"/>
                                    <label class="inline pull-right"><button class="btn btn-primary badge finish fill">答题完毕</button></label>
                                    {x2;else}
                                    {x2;tree:$selectorder,so,sid}
                                    {x2;if:v:key >= v:question['questionselectnumber']}
                                    {x2;eval: break;}
                                    {x2;endif}
                                    <label class="inline"><input type="checkbox" name="question[{x2;v:question['questionid']}][{x2;v:key}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:question['questionid']])}checked{x2;endif}/><span class="selector">{x2;v:so}</span> </label>
                                    {x2;endtree}
                                    <label class="inline pull-right"><button class="btn btn-primary badge finish" rel="{x2;v:question['questionid']}">答题完毕</button></label>
                                    {x2;endif}
                                </form>
                            </li>
                            {x2;endif}
                            <li class="border morepadding rightanswer hide">
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
                            <li class="border morepadding rightanswer hide">
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
                    {x2;endtree}
                    {x2;endtree}
                    {x2;endif}
                    {x2;endif}
                    {x2;endtree}
                </div>
            </div>
            {x2;else}
            <div class="content fixtop">
                <div class="content-box padding">
                    <div class="text-danger text-center">
                        本试卷正在锁定评分中，请等待评分结束。
                    </div>
                </div>
            </div>
            {x2;endif}
            {x2;include:footer}
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        var sumquestion = function(value,qid,obj){
            obj.parents('.content-box').find('.rightanswer').removeClass('hide');
            console.log("#rightanswer_"+qid);
            console.log($("#rightanswer_"+qid).html());
            console.log(value);
            if(value == $("#rightanswer_"+qid).html())
            {
                $.zoombox.show('ajaxOK',{message:'回答正确'});
                $("#rightanswer_"+qid).attr('class','text-success');
            }
            else
            {
                $.zoombox.show('ajax',{message:'回答错误'});
                $("#rightanswer_"+qid).attr('class','text-danger');
            }
            setTimeout($.zoombox.hide,1000);
        }
        $("input:radio").click(function(){
            var _this = $(this);
            var qid = _this.attr('rel');
            sumquestion(_this.val(),qid,_this);
        });
        $(".finish").click(function(){
            var _this = $(this);
            var qid = _this.attr('rel');
            var parent = _this.parents("form:first");
            var value = '';
            if(_this.hasClass('fill')){
                value = parent.find("input").val();
            }
            else{
                parent.find("input:checked").each(function(){
                    value += $(this).val().toUpperCase();
                });
            }
            if(value == '')
            {
                $.zoombox.show('ajax',{message:'请先答题'});
                return;
            }
            sumquestion(value,qid,_this);
        });
    });
</script>
{x2;include:paper_footer}
</body>
</html>
