var storage = window.localStorage;
var initData = {};

function setStorage(){
    storage.setItem('questions',$.toJSON(initData));
}

function clearStorage()
{
	storage.removeItem('questions');
}

function submitPaper()
{
	$('#submodal').modal('hide');
	$('#paper').submit();
}

function saveanswer(){
	var params = $('#paper :input').serialize();
    submitAjax({url:'index.php?exam-app-index-ajax-saveUserAnswer',"query":params});
}

function markQuestions()
{
	$('.qindex').removeClass("btn-primary");
	$('#paper :checked').each(function(){
        var rel = $(this).attr('rel');
        $('#sign_'+rel).addClass("btn-primary");
	});
	$('#paper :text').each(function(){
        if($(this).val().length > 0){
            var rel = $(this).attr('rel');
        	$('#sign_'+rel).addClass("btn-primary");
        }
	});
    $('#paper textarea').each(function(){
        if($(this).val().length > 0){
            var rel = $(this).attr('rel');
        	$('#sign_'+rel).addClass("btn-primary");
        }
    });
    $('.yesdonumber').html($('#questionindex .qindex.btn-primary').length);
    setStorage();
}

function signQuestion(id,obj)
{
	$.get("index.php?exam-app-index-ajax-sign&questionid="+id+'&'+Math.random(),function(data){
		if(parseInt(data) == 1){
			$(obj).html('取消');
			$('#sign_'+id).addClass('btn-danger');
		}else{
            $(obj).html('标记');
			$('#sign_'+id).removeClass('btn-danger');
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