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
            $(obj).addClass('btn-info').removeClass('btn-danger');
            $('#sign_'+id).removeClass('btn-danger');
        }else{
            $(obj).addClass('btn btn-danger').removeClass('btn-info');
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

function confirmRules()
{
    var knows = '';
    $('#tablecontent').find(':checked').each(function(){
        knows = knows + $(this).val() + ',';});
    knows = knows.substring(0,knows.length - 1);
    var allnumber = parseInt($('#modalallnumber').val());
    var easynumber = parseInt($('#modaleasynumber').val());
    var midnumber = parseInt($('#modalmidnumber').val());
    var hardnumber = parseInt($('#modalhardnumber').val());
    var pnumber = '';
    if(easynumber == 0 && midnumber == 0 && hardnumber == 0)
        pnumber = '0';
    else
        pnumber = easynumber + ',' + midnumber + ',' + hardnumber;
    $('#'+currentP).val($('#'+currentP).val()+knows+':'+allnumber+':'+pnumber+'\n');
    $('#modal').modal('hide');
}
