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
	$('#exampaper').submit();
}

function saveanswer(){
    var params = $('#exampaper :input').serialize();
    submitAjax({url:'index.php?exam-phone-index-ajax-saveUserAnswer',"query":params});
}

function markQuestions()
{
	$('.order').removeClass("primary");
	$('#exampaper :checked').each(function(){
        var rel = $(this).attr('rel');
        $('#sign_'+rel).addClass("primary");
	});
	$('#exampaper :text').each(function(){
        if($(this).val().length > 0){
            var rel = $(this).attr('rel');
        	$('#sign_'+rel).addClass("primary");
        }
	});
    $('#exampaper textarea').each(function(){
        if($(this).val().length > 0){
            var rel = $(this).attr('rel');
        	$('#sign_'+rel).addClass("primary");
        }
    });
    setStorage();
}

function favorquestion(questionid){
	submitAjax({'url':"index.php?exam-phone-favor-ajax-addfavor&questionid="+questionid});
}

function delfavorquestion(questionid){
	submitAjax({'url':"index.php?exam-phone-favor-ajax-delfavor&questionid="+questionid});
}

function errorport(questionid){
    submitAjax({'url':"index.php?exam-phone-lesson-reporterror&questionid="+questionid});
}