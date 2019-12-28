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
<div class="modal fade" id="errormodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">错题举报</h4>
            </div>
            <div class="modal-body">
                <form action="index.php?exam-app-lesson-reporterror" method="post" class="form-horizontal" id="reporterrorform">
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label col-xs-3">错误类型：</label>
                            <div class="col-xs-9">
                                <select class="form-control" name="args[fbtype]" needle="needle" msg="请选择错误类型">
                                    <option value="答案错误">答案错误</option>
                                    <option value="题干错误">题干错误</option>
                                    <option value="知识点归类错误">知识点归类错误</option>
                                    <option value="图片错误">图片错误</option>
                                    <option value="解析错误">解析错误</option>
                                    <option value="其他">其他</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <textarea class="form-control" name="args[fbcontent]" rows="4" needle="needle" msg="请填写错误描述" placeholder="请填写错误描述"></textarea>
                                <input type="hidden" name="reporterror" value="1">
                                <input type="hidden" name="args[fbquestionid]" value="" id="fbquestionid">
                                <input type="hidden" name="page" value="">
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:$('#reporterrorform').submit();">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        try{
            initData = $.parseJSON(storage.getItem('questions'));
            if(!initData)initData = new Object();
            for(k in initData){
                var v = initData[k];
                $('#time_'+k).val(v['time']);
                $(":radio[rel="+k+"]").each(function(){
                    var that = $(this);
                    if(v['value'] == that.val()){
                        that.attr("checked",true);
                    }
                });
                $("#paper :text[rel="+k+"],#paper textarea[rel="+k+"]").each(function(){
                    var that = $(this);
                    that.val(v['value']);
                    if(that.hasClass('jckeditor')){
                        CKEDITOR.instances[that.attr('id')].setData(v['value']);
                    }
                });
                $("#paper :checkbox[rel="+k+"]").each(function(){
                    var that = $(this);
                    if(v['value'].indexOf(that.val()) >= 0){
                        that.attr("checked",true);
                    }
                });
            }
        }catch(e){
            //
        }finally {
            markQuestions();
        }
        $('#paper :radio').on('click',function(){
            var that = $(this);
            setTimeout(function(){
                var now = Date.parse(new Date())/1000;
                $('#time_'+that.attr('rel')).val(now);
                initData[that.attr('rel')] = {value:that.val(),time:now};
                markQuestions();
            },100);
        });

        $('#paper :checkbox').on('click',function(){
            var that = $(this);
            setTimeout(function(){
                var now = Date.parse(new Date())/1000;
                var answer = '';
                $('#time_'+that.attr('rel')).val(now);
                that.parents('li').find(':checked').each(function(){
                    answer += $(this).val().toUpperCase();
                });
                initData[that.attr('rel')] = {value:answer,time:now};
                markQuestions();
            },100);
        });

        $('#paper :text,#paper textarea').on('blur',function(){
            var that = $(this);
            setTimeout(function(){
                var now = Date.parse(new Date())/1000;
                $('#time_'+that.attr('rel')).val(now);
                initData[that.attr('rel')] = {value:that.val(),time:now};
                markQuestions();
            },100);
        });

        $('body').delegate('.favor.badge','click',function() {
            favorquestion($(this).attr('data-questionid'));
        });

        $('body').delegate('.error.badge','click',function() {
            $('#fbquestionid').val($(this).attr('data-questionid'));
            $('#errormodal').modal();
        });

        $('body').delegate('#questionindex .resize','click',function(){
            var that = $(this);
            if(that.children('.glyphicon').hasClass('glyphicon-resize-full'))
            {
                $('#questionindex .resize .glyphicon').removeClass('glyphicon-resize-full').addClass('glyphicon glyphicon-resize-small');
                $('#questionindex').css('width','1226px');
            }
            else
            {
                $('#questionindex .resize .glyphicon').removeClass('glyphicon-resize-small').addClass('glyphicon glyphicon-resize-full');
                $('#questionindex').css('width','280px');
            }
        });

        $('body').delegate('#questionindex .qindex','click',function(){
            $('#questionindex .resize .glyphicon').removeClass('glyphicon-resize-small').addClass('glyphicon glyphicon-resize-full');
            $('#questionindex').css('width','280px');
        });

        $('.allquestionnumber').html($('#questionindex .qindex').length);
        $('.yesdonumber').html($('#questionindex .qindex.btn-primary').length);
    });
</script>