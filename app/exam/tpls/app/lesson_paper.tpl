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
                    <div class="content-box padding" id="questionpanel">
                    </div>
                </div>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
<div class="modal fade" id="submodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
<script type="text/javascript">
    $(document).ready(function(){
        submitAjax({url:"index.php?exam-app-lesson-ajax-questions&knowsid={x2;$knows['knowsid']}","target":"questionpanel"});
        $('body').delegate('.error.badge','click',function() {
            $('#fbquestionid').val($(this).attr('data-questionid'));
            $('#submodal').modal();
        });
        $('body').delegate('.favor.badge','click',function() {
            favorquestion($(this).attr('data-questionid'));
        });
        $('body').delegate('.jump.badge','click',function(){
            $number = parseInt($(this).attr('data-number'));
            if($number <= 0)return ;
            submitAjax({url:"index.php?exam-app-lesson-ajax-questions&knowsid={x2;$knows['knowsid']}&number="+$number,"target":"questionpanel"});
        });
        $(document).keyup(function(e){
            var key =  e.which;
            if(key == 37){
                $('.jump.badge.prev:first').trigger('click');
            }
            else if(key == 39){
                $('.jump.badge.next:first').trigger('click');
            }
        });
    });
</script>
</body>
</html>
