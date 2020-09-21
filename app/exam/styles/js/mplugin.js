var storage = window.localStorage;
var initData = {};
var formData = {};

function set(k,v,t){
    var _this = this;
    if(typeof(_this) == "object"&& Object.prototype.toString.call(_this).toLowerCase() == "[object object]" && !_this.length)
    {
        _this[k] = {'value':v,'time':t};
        storage.setItem('questions',$.toJSON(formData));
    }
}

function clearStorage()
{
    storage.removeItem('questions');
}

function submitPaper()
{
    //clearStorage();
    $('#submodal').modal('hide');
    $('#form1').submit();
}

function saveanswer(){
    var params = $(':input').serialize();
    $.ajax({
       url:'index.php?exam-app-exam-ajax-saveUserAnswer',
       async:false,
       type:'post',
       dataType:'json',
       data:params
    });
}

function markQuestion(rel,isTextArea)
{
    var t = 0;
    var f = false;
    try
    {
        f = $('#form1 :input[rel='+rel+']');
    }catch(e)
    {
        f = false;
    }
    if(!f)return false;
    if(isTextArea)
    {
        if($('#form1 :input[rel='+rel+']').val() && $('#form1 :input[rel='+rel+']').val() != '' && $('#form1 :input[rel='+rel+']').val() != '<p></p>')t++;
    }
    else
    $('#form1 :input[rel='+rel+']').each(function(){if($(this).is(':checked') && $(this).val() && $(this).val() != '' && $(this).val() != '<p></p>')t++;});
    if(t > 0)
    {
        if(!$('#sign_'+rel).hasClass("btn-primary"))$('#sign_'+rel).addClass("btn-primary");
    }
    else
    {
        $('#sign_'+rel).removeClass("btn-primary");
    }
    $('.yesdonumber').html($('#questionindex .btn-primary').length);
}

function batmark(rel,value)
{
    if(value && value != '')
    {
        if(!$('#sign_'+rel).hasClass("btn-primary"))$('#sign_'+rel).addClass("btn-primary");
    }
    else
    $('#sign_'+rel).removeClass("btn-primary");
    $('.yesdonumber').html($('#questionindex .btn-primary').length);
}

function signQuestion(id,obj)
{
    $.get("index.php?exam-app-index-ajax-sign&questionid="+id+'&'+Math.random(),function(data){
        if(parseInt(data) != 1){
            $(obj).addClass('text-info').removeClass('text-danger');
            $('#sign_'+id).removeClass('btn-danger');
        }else{
            $(obj).addClass('btn text-danger').removeClass('text-info');
            $('#sign_'+id).addClass('btn-danger');
        }
    });
}

function favorquestion(questionid){
    submitAjax({'url':"index.php?exam-app-favor-ajax-addfavor&questionid="+questionid});
}

function delfavorquestion(questionid){
    submitAjax({'url':"index.php?exam-app-favor-ajax-delfavor&questionid="+questionid});
}
