<div class="page-header">
    <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
    <div class="col-8">我的收藏</div>
    <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
</div>
<div class="page-content header footer" data-refresh="yes">
    <div class="list-box bg">
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
            <li class="unstyled rightanswer">
                <div class="rows">
                    {x2;if:strlen($question['questionanswer']) >= 30}
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
            <li class="unstyled rightanswer">
                <div class="rows">
                    {x2;if:strlen($question['questiondescribe']) >= 30}
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
    </div>
</div>
<div class="page-footer">
    <ol class="pagination">
        <li class="col-8x{x2;if:$number > 1} jump" data-number="{x2;eval: echo $number - 1}{x2;endif}">
            <span class="iconfont icon-left-circle"></span>
        </li>
        <li class="col-8x favor" data-questionid="{x2;$favor['favorid']}">
            <span class="iconfont icon-star"></span>
        </li>
        <li class="col-5">
            <form method="post" data-target="favorquestionpanel" action="index.php?exam-phone-favor-ajax-questions">
                共{x2;$allnumber}题，转到 <input class="text-center" name="page" placeholder="{x2;$number}" type="search" size="3"> 题
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
    function reloadpage()
    {
        submitAjax({url:"index.php?exam-phone-favor-ajax-questions&page={x2;$number}","target":"favorquestionpanel"});
    }
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
        $('#favorquestionpanel .favor').on('click',function() {
            delfavorquestion($(this).attr('data-questionid'));
        });
        $('#favorquestionpanel .jump').on('click',function(){
            var number = parseInt($(this).attr('data-number'));
            if(number <= 0)return ;
            submitAjax({url:"index.php?exam-phone-favor-ajax-questions&page="+number,"target":"favorquestionpanel"});
        });
        $("input:radio").click(function(){
            var _this = $(this);
            var qid = _this.attr('rel');
            sumquestion(_this.val(),qid);
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
