<div class="page-header">
    <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
    <div class="col-8">{x2;$knows['knows']}</div>
    <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
</div>
<div class="page-content header footer" data-refresh="yes">
    <form class="list-box bg top">
        <ol>
            <li class="unstyled">
                <h4 class="title">
                    第 {x2;$number} 题
                </h4>
            </li>
            {x2;if:$parent}
            <li class="unstyled">
                <div class="rows">
                    <p>{x2;realhtml:$parent['qrquestion']}</p>
                </div>
            </li>
            {x2;endif}
            <li class="unstyled">
                <div class="rows">
                    <p>{x2;realhtml:$question['question']}</p>
                </div>
            </li>
            {x2;if:!$questype['questsort'] && $questype['questchoice'] != 5}
            <li class="unstyled">
                <div class="rows">
                    <p>{x2;realhtml:$question['questionselect']}</p>
                </div>
            </li>
            {x2;endif}
            {x2;if:$questype['questsort']}
            <li class="unstyled">
                <textarea rows="4" id="editor{x2;$question['questionid']}" name="question[{x2;$question['questionid']}]" rel="{x2;$question['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$question['questionid']]}</textarea>
            </li>
            <li class="unstyled text-center">
                <button class="primary badge" onclick="javascript:$(this).parents('li').hide().parents('.list-box').find('.rightanswer').removeClass('hide');">查看答案</button>
            </li>
            {x2;else}
            <li class="unstyled">
                <div class="rows">
                    {x2;if:$questype['questchoice'] == 1 || $questype['questchoice'] == 4}
                    {x2;tree:$selectorder,so,sid}
                    {x2;if:v:key == $question['questionselectnumber']}
                    {x2;eval: break;}
                    {x2;endif}
                    <label class="inline"><input type="radio" name="question[{x2;$question['questionid']}]" rel="{x2;$question['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][$question['questionid']]}checked{x2;endif}/><span class="selector">{x2;v:so}</span> </label>
                    {x2;endtree}
                    {x2;elseif:$questype['questchoice'] == 5}
                    <input type="text" name="question[{x2;$question['questionid']}]" placeholder="点击此处填写答案" value="{x2;$sessionvars['examsessionuseranswer'][$question['questionid']]}" rel="{x2;$question['questionid']}"/>
                    <label class="inline pull-right"><button class="btn btn-primary badge finish fill" rel="{x2;$question['questionid']}">答题完毕</button></label>
                    {x2;else}
                    {x2;tree:$selectorder,so,sid}
                    {x2;if:v:key >= $question['questionselectnumber']}
                    {x2;eval: break;}
                    {x2;endif}
                    <label class="inline"><input type="checkbox" name="question[{x2;$question['questionid']}][{x2;v:key}]" rel="{x2;$question['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][$question['questionid']])}checked{x2;endif}/><span class="selector">{x2;v:so}</span> </label>
                    {x2;endtree}
                    {x2;endif}
                </div>
            </li>
            {x2;if:$questype['questchoice'] == 2 || $questype['questchoice'] == 3}
            <li class="unstyled text-center">
                <button class="primary badge finish" rel="{x2;$question['questionid']}">答题完毕</button>
            </li>
            {x2;endif}
            {x2;endif}
            <li class="unstyled rightanswer hide">
                <div class="rows">
                    {x2;if:$questype['questsort']}
                    <div class="intro">
                        <span class="badge">正确答案</span>
                    </div>
                    <div class="intro">
                        {x2;realhtml:$question['questionanswer']}
                    </div>
                    {x2;else}
                    <div class="col-4x intro">
                        <span class="badge">正确答案</span>
                    </div>
                    <div class="col-4l intro">
                        <b id="rightanswer_{x2;$question['questionid']}">{x2;$question['questionanswer']}</b>
                    </div>
                    {x2;endif}
                </div>
            </li>
            <li class="unstyled rightanswer hide">
                <div class="rows">
                    {x2;if:strlen($question['questiondescribe']) >= 10}
                    <div class="intro">
                        <span class="badge">试题解析</span>
                    </div>
                    <div class="intro">
                        {x2;realhtml:$question['questiondescribe']}
                    </div>
                    {x2;else}
                    <div class="col-4x">
                        <span class="badge">试题解析</span>
                    </div>
                    <div class="col-4l intro">
                        {x2;realhtml:$question['questiondescribe']}
                    </div>
                    {x2;endif}
                </div>
            </li>
            <li class="unstyled"></li>
        </ol>
    </form>
</div>
<div class="page-footer">
    <ol class="pagination">
        <li class="col-8x{x2;if:$number > 1} jump" data-number="{x2;eval: echo $number - 1}{x2;endif}">
            <span class="iconfont icon-left-circle"></span>
        </li>
        <li class="col-8x favor" data-questionid="{x2;$question['questionid']}">
            <span class="iconfont icon-star"></span>
        </li>
        <li class="col-5">
            <form method="post" data-target="questionpanel" action="index.php?exam-app-lesson-ajax-questions&knowsid={x2;$knows['knowsid']}">
                共{x2;$allnumber}题，转到 <input class="text-center" name="number" placeholder="{x2;$number}" type="search" size="3"> 题
            </form>
        </li>
        <li class="col-8x">
            <a href="index.php?exam-phone-lesson-reporterror&questionid={x2;$question['questionid']}" class="ajax">
                <span class="iconfont icon-wrench"></span>
            </a>
        </li>
        <li class="col-8x{x2;if:$number < $allnumber} jump" data-number="{x2;eval: echo $number + 1}{x2;endif}">
            <span class="iconfont icon-right-circle"></span>
        </li>
    </ol>
</div>
<script type="text/javascript">
    $(function(){
        var sumquestion = function(value,qid){
            $('.rightanswer').removeClass('hide');
            if(value == $("#rightanswer_"+qid).html())
            {
                $("#rightanswer_"+qid).attr('class','text-success');
            }
            else
            {
                pep.mask.show(null,{message:'回答错误'});
                $("#rightanswer_"+qid).attr('class','text-danger');
            }
            setTimeout(pep.mask.hide,1000);
        }
        $("input:radio").click(function(){
            var _this = $(this);
            var qid = _this.attr('rel');
            sumquestion(_this.val(),qid);
        });
        $('#questionpanel .favor').on('click',function() {
                favorquestion($(this).attr('data-questionid'));
            });
        $('#questionpanel .jump').on('click',function(){
            var number = parseInt($(this).attr('data-number'));
            if(number <= 0)return ;
            submitAjax({url:"index.php?exam-phone-lesson-ajax-questions&knowsid={x2;$knows['knowsid']}&number="+number,"target":"questionpanel"});
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
                pep.mask.show(null,{message:'请先答题'});
                return;
            }
            sumquestion(value,qid);
        });
    });
</script>
