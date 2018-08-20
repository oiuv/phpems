jQuery.extend({
	'indexPage':'page1',
	'markPrepage':true,
	'pewidth':$(window).width(),
	'peheight':$(window).height(),
	'pesheight':window.screen.availHeight,
	'peswidth':window.screen.availWidth,
	'preWebPage':[],
	'currentPage':null,
	'actPage':null,
    'videohide':function(){
		if($.ckplayeritem)
		{
			try
			{
				$.ckplayeritem.videoPause();
				$('#videoplatform').hide();
			}
			catch (e)
			{}
			finally {}
            if($.currentPage.attr('id') == 'courseplatform')
            setTimeout(function(){$('#videoplatform').show();},500);
		}
	},
	'ajaxGo':function(e){
		if ( e && e.preventDefault )
	    e.preventDefault();
	    else
        window.event.returnValue = false;
		var o = $(this);
		if(!o.attr("data-url") || o.attr("data-url") == '')o.attr("data-url",o.attr("href"));
		if(o.attr("data-url").substring(0,7) == 'http://')
		{
			window.location = o.attr("data-url");
			return;
		}
		var par = {'url':o.attr("data-url"),'target':o.attr("data-target"),'page':o.attr("data-page"),'action-before':o.attr("action-before"),'action-pageant':o.attr("action-pageant")};
		if(!document.getElementById(o.attr("data-page")))
		{
			$('<div class="pages" id="'+o.attr("data-page")+'">我在加载，请稍等</div>').appendTo($('#content')).hide();
		}
		if(o.attr('data-markPrepage') == 'no')$.markPrepage = false;
		submitAjax(par);
	},
	'setPreWebPage':function(p,url){
		if($.markPrepage)
		{
            $.preWebPage.push(p);
            history.pushState({'url':url},"","");
		}
		else
		$.markPrepage = true;
	},
	'setCurrentPage':function(p){
		$.currentPage = p;
	},
	'setActPage':function(p){
		$.actPage = p;
	},
	'goPrePage':function(){
		if($.currentPage != null && $.preWebPage.length >= 1)
		{
			var p2 = $.preWebPage.pop();
			var p1 = $.currentPage;
			while(p2.attr('id') == p1.attr('id'))p2 = $.preWebPage.pop();
			p1.attr('class','pages').addClass('pt-page-moveToRight');
			p2.attr('class','pages').addClass('currentpage').addClass('pt-page-moveFromLeft');
			$.setActPage(p1);
			$.setCurrentPage(p2);
			p2.find(".autoloaditem").each(function(){$(this).load($(this).attr('autoload')+"&current="+$(this).attr('current'));});
		}
		else if($.currentPage.attr('id') != $.indexPage)
		{
			var p2 = $('#'+$.indexPage);
			var p1 = $.currentPage;
			if(document.getElementById($.indexPage))
			{
				p1.attr('class','pages').addClass('pt-page-moveToRight');
				p2.attr('class','pages').addClass('currentpage').addClass('pt-page-moveFromLeft');
				$.setActPage(p1);
				$.setCurrentPage(p2);
			}
			else
			{
				var par = {'url':'index.php?content-phone','target':"page1",'page':"page1",'action-pageant':'pre'};
				$('<div class="pages" id="page1"></div>').appendTo($('#content'));
				submitAjax(par);
			}
		}
        $.videohide();
	},
	'goPage':function(p,url,type){
		p.show();
		if(type == 'pre')
		{
			$.markPrepage = false;
			$.prePage($.currentPage,p,url);
		}
		else
		$.nextPage($.currentPage,p,url);
        $.videohide();
	},
	'nextPage':function(p1,p2,url){
		p1.attr('class','pages').addClass('pt-page-moveToLeft');
		p2.attr('class','pages').addClass('currentpage').addClass('pt-page-moveFromRight');
		$.setPreWebPage(p1,url);
		$.setActPage(p1);
		$.setCurrentPage(p2);
		$.currentPage.attr('data-url',url);
	},
	'prePage':function(p1,p2,url){
		p1.attr('class','pages').addClass('pt-page-moveToRight');
		p2.attr('class','pages').addClass('currentpage').addClass('pt-page-moveFromLeft');
		$.setPreWebPage(p1,url);
		$.setActPage(p1);
		$.setCurrentPage(p2);
	},
	'leftMenu':function(p){
		if(p.attr('data-isopen') == 'yes'){
			p.animate({'marginLeft':($.pewidth * -1)+'px'},function(){
				p.attr('data-isopen','no');
				p.hide();
			});
		} else  {
			p.css('margin-left',($.pewidth * -1)+'px').show().animate({'marginLeft':'0px','top':'0px'},function(){
				p.attr('data-isopen','yes');
			});
		}
	},
	'rightMenu':function(p){
		if(p.attr('data-isopen') == 'yes'){
			p.animate({'marginLeft':($.pewidth * 1)+'px'},function(){
				p.attr('data-isopen','no');
				p.hide();
			});
		} else  {
			p.css('margin-left',($.pewidth * 1)+'px').show().animate({'marginLeft':($.pewidth - p.width())+'px','top':'0px'},function(){
				p.attr('data-isopen','yes');
			});
		}
	},
	'mask':(function(){
        $('#maskbox').remove();
        var mask = $("<div class=\"maskbox\" id=\"maskbox\"><img src=\"app/core/styles/img/loading.gif\" /></div>");
        return {'loading':function(){
			$('body').append(mask);
		},
		'remove':function(){
        	setTimeout(function(){$('#maskbox').remove();},500);
		}};
	})(),
	'zoombox':(function(){
		$('#zoombox').remove();
		var m = $("<div class=\"modal fade\" id=\"zoombox\"></div>");
		return {'show':function(type,obj,url){
				switch(type)
				{
					case 'confirm':
					var msg;
					if($(obj).attr('msg') && ($(obj).attr('msg') != ""))
					{
						msg = $(obj).attr('msg');
					}
					else
					msg = '您确定要删除吗？';
					var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"margin-top:16rem;\"><div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\" autocomplete=\"off\"><span aria-hidden=\"true\">×</span></button><h5 class=\"modal-title text-warning\" id=\"myModalLabel\"><em class=\"glyphicon glyphicon-question-sign\" style=\"font-size:2rem;vertical-align: middle;\"></em>&nbsp;&nbsp;操作确认</h5></div><div class=\"modal-body\"><p class=\"text-warning\">"+msg+"</p></div><div class=\"modal-footer\" style=\"border:0px;\"><button class=\"btn btn-primary\" onclick=\"javascript:submitAjax({'url':'"+url+"'});\">确定</button><button class=\"btn\" onclick=\"javascript:$.zoombox.hide();\">取消</button></div></div></div>";
					break;

					case 'ajax':
					var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"margin-top:16rem;\"><div class=\"modal-content\"><div class=\"modal-header\" style=\"border:0px;\"><h5 class=\"text-danger\"><em class=\"glyphicon glyphicon-remove-sign\" style=\"font-size:2rem;vertical-align: middle;margin-left:2rem;\"></em>&nbsp;&nbsp;"+$(obj).attr('message')+"</h5></div></div></div>";
					break;

					case 'ajaxOK':
					var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"margin-top:16rem;\"\"><div class=\"modal-content\"><div class=\"modal-header\" style=\"border:0px;\"><h5 class=\"text-success\"><em class=\"glyphicon glyphicon-ok-sign\" style=\"font-size:2rem;vertical-align: middle;margin-left:2rem;\"></em>&nbsp;&nbsp;"+$(obj).attr('message')+"</h5></div></div></div>";
					break;

					default:
					var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"margin-top:16rem;\"><div class=\"modal-content\"><div class=\"modal-header\" style=\"border:0px;\"><h5 class=\"text-danger\"><em class=\"glyphicon glyphicon-remove-sign\" style=\"font-size:2rem;vertical-align: middle;margin-left:2rem;\"></em>&nbsp;&nbsp;"+$(obj).attr('message')+"</h5></div></div></div>";
				}
				m.html(cnt);
				m.modal();
			},
			'hide':function(){
				m.modal('hide');
			}
		};
	})()
});
function submitAjax(parms){
	if(!parms.query)parms.query = "";
	parms.query += "&userhash="+Math.random();
	if(parms['action-before'])eval(parms['action-before'])();
	$.ajax({"url":parms.url,
		"type":"post",
		"data":parms.query,
		"beforeSend":function(){
			$.mask.loading();
		},
		"success":function(data){
            $.mask.remove();
			var tmp = null;
			try{
				tmp = $.parseJSON(data);
			}
			catch(e)
			{}
			finally{
				if(tmp){
					data = tmp;
					$.zoombox.hide();
					if(parseInt(data.statusCode) == 200){
						if(!data.time) data.time = 1000;
						if(data.message)
						$.zoombox.show('ajaxOK',data);
						setTimeout(function(){if(data.callbackType == 'forward'){
								if(data.forwardUrl && data.forwardUrl != '')
								{
									$.zoombox.hide();
									if(data.forwardUrl == 'reload')
									{
										if($.currentPage != null)
										{
											var href = $.currentPage.attr('data-url');
											if(href && href != '')
											{
												submitAjax({'url': href});
											}
										}
									}
									else if(data.forwardUrl == 'back')
									{
										$.goPrePage();
									}
									else
									{
										if(parms.page && parms.page != '')
										{
											submitAjax({'url': data.forwardUrl,'target':parms.target,'page':parms.page});
										}
										else
										{
											submitAjax({'url': data.forwardUrl,'target':parms.target});
										}
									}
								}
								else
								{
									if(data.page && data.page != '')
									{
										$.zoombox.hide();
										$.goPage($('#'+data.page),null,parms['action-pageant']);
									}
								}
							}
							else{
								if(data.forwardUrl && data.forwardUrl != '')
								{
									$.zoombox.hide();
									submitAjax({'url': data.forwardUrl,'target' : parms.target});
								}
								else $.zoombox.hide();
							}
						},data.time);
					}else if(parseInt(data.statusCode) == 201){
						if(data.callbackType == 'forward'){
							if(data.forwardUrl && data.forwardUrl != '')
							{
								if(data.forwardUrl == 'reload')
								{
									if($.currentPage != null)
									{
										var href = $.currentPage.attr('data-url');
										if(href && href != '')
										{
											submitAjax({'url': href});
										}
										else
										window.location.reload();
									}
								}
								else if(data.forwardUrl == 'back')
								{
									$.goPrePage();
								}
								else
								{
									window.location = data.forwardUrl;
								}
							}
						}
						else{
							window.location.href = data.forwardUrl;
						}
					}else if(parseInt(data.statusCode) == 300){
						$.zoombox.show('ajax',data);
					}else if(parseInt(data.statusCode) == 301){
						submitAjax({'url':'index.php?user-phone-login','target':'user','page':'user'});
					}
					else{
						$.zoombox.show('ajax',data);
					}
				}
				else
				{
					if(data && data.substring(0,6) != 'error:')
					{
						if(parms.target)
						{
							var dom = document.getElementById(parms.target);
							if(!dom)
							{
								dom = $('<div class="pages" id="'+parms.target+'"></div>');
								dom.hide();
								dom.appendTo($('#content'));
							}
							else
							dom = $(dom);
							dom.html(data);
							dom.find('.fineuploader').each(inituploader);
							dom.find(".autoloaditem").each(function(){$(this).load($(this).attr('autoload')+"&current="+$(this).attr('current'));});
						}
						else
						{
							if($.currentPage != null)
							{
								$.currentPage.html(data);
								$.currentPage.find('.fineuploader').each(inituploader);
								$.currentPage.find('.autoloaditem').each(function(){$(this).load($(this).attr('autoload')+"&current="+$(this).attr('current'));});
							}
						}
						if(parms.page && parms.page != '')
						{
							$.goPage($('#'+parms.page),parms.url,parms['action-pageant']);
						}
					}
				}
				return data.statusCode;
			}
		}
	});
}

function xvars(x){
	var _this = this;
	String.prototype.replaceAll  = function(s1,s2){
		return this.replace(new RegExp(s1,"gm"),s2);
	}

	var ginkgo = function(x){
		return core(/(.)*$/gi,x);
	}

	var price = function(x){
		return core(/\d+\.*\d*$/gi,x);
	}

	var datatable = function(x){
		return core(/(\w)+/gi,x);
	}

	var keyword = function(x){
		x.value = x.value.replaceAll('，',',');
		return core(/^[\s|\S]+$/gi,x);
	}

	var english = function(x){
		return core(/^[a-z]+$/gi,x);
	}

	var userid = function(x){
		return core(/^[0-9]+$/gi,x);
	}

	var exp = function(x){
		return core(eval(x.getAttribute('exp')),x);
	}

	var qq = function(x){
		return core(/^\d{5,12}$/gi,x);
	}

	var date = function(x){
		return core(/^\d{4}-\d{1,2}-\d{1,2}$/gi,x);
	}

	var datetime = function(x){
		return core(/^\d{4}-\d{1,2}-\d{1,2}\s\d+:\d+:\d+$/gi,x);
	}

	var telphone = function(x){
		return core(/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/gi,x);
	}

	var cellphone = function(x){
		return core(/^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}?$|15[89]\d{8}?$/gi,x);
	}

	var url = function(x){
		return core(/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/gi,x);
	}

	var userName = function(x){
		return core(/^[\u0391-\uFFE5|\w]{2,40}$/gi,x);
	}

	var title = function(x){
		return _this.core(/^[\u0391-\uFFE5|\w|\s|-]+$/gi,x);
	}

	var password = function(x){
		return core(/^[\s|\S]{6,}$/gi,x);
	}

	var zipcode = function(x){
		return core(/^[1-9]\d{5}$/gi,x);
	}

	var email = function(x){
		return core(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/gi,x);
	}

	var randcode = function(x){
		return core(/^\d{4}$/gi,x);
	}

	var template = function(x){
		return core(/^\w+$/gi,x);
	}

	var category = function(x){
		return core(/^,[\d|,]+$/gi,x);
	}

	var relation = function(x){
		return core(/^[\d|,|-]+$/gi,x);
	}

	var number = function(x){
		return core(/^\d+$/gi,x);
	}

	var nature = function(x){
		return core(/^[1-9]{1}[0-9]?$/gi,x);
	}
	var core = function(exp,x)
	{
		var maxsize = parseInt(x.attr('max'));
		var minsize = parseInt(x.attr('min'));
		var needle = x.attr('needle');
		if( x.attr('type')!='password' && x.val())x.val(x.val().replace(/^\s+/i,'').replace(/\s+$/i,''));
		if(x.get(0).tagName.toUpperCase() == "SELECT"){
			if(needle && x.val() == ""){
				return {result:false,message:x.attr('msg')};
			}
		}

		if(x.attr('maxvalue'))
		{
			var maxv = parseInt(x.attr('maxvalue'));
			if(parseInt(x.val()) > maxv)return {result:false,message:"最大值不能超过"+x.attr('maxvalue')};
		}

		if(x.attr('minvalue'))
		{
			var minv = parseInt(x.attr('minvalue'));
			if(parseInt(x.val()) < minv)return {result:false,message:"最小值不能低于"+x.attr('minvalue')};
		}

		if(x.attr('type')=='checkbox'){
			if(needle && !x.attr('checked')){
				return {result:false,message:x.attr('msg')};
			}
		}
		else{
			if(!needle && x.val() == '')return {result:true};
		}
		if(needle && (x.val() == '' || !x.val()))
		return {result:false,message:x.attr('msg')};
		if(x.attr('equ') && x.attr('equ')!='')
		{
			if(x.val() != $('#'+x.attr('equ')).val())
			{
				return {result:false,message:x.attr('msg')};
			}
		}
		if(maxsize > 0 && x.val().length > maxsize)return {result:false,message:x.attr('msg')};
		if(minsize > 0 && x.val().length < minsize)return {result:false,message:x.attr('msg')};
		try{
			if(x.val().match(exp))return {result:true};
			else return {result:false,message:x.attr('msg')};
		}
		catch(e){
			return false;
		}
	}

	var checkvars = function(x)
	{
		if(x.attr('ajax') == 'get' || x.attr('ajax') == 'post'){
			var d = eval("({'"+x.attr('name')+"':'"+x.val()+"'})");
			var url = x.attr('url');
			var data = $.ajax({
				'url':url,
				async: false,
				'data':d
			}).responseText;
			if(data != '1')return {result:false,message:data};
		}
		try{
			if(x.attr('datatype') && x.attr('datatype') != "")
			{
				var method = eval(x.attr('datatype'));
				return method(x);
			}
			else
			return ginkgo(x);
		}
		catch(e){
			return ginkgo(x);
		}
	}
	return checkvars(x);
}

function inituploader()
{
	var _this = this;
	var ismul = false;
	var petemplate = 'pe-template';
	var petype = 'thumb';
	var ftype = ['jpeg', 'jpg', 'gif', 'png'];
	if($(_this).attr('attr-list') == 'true')ismul = true;
	if($(_this).attr('attr-template') &&  $(_this).attr('attr-template') != '')petemplate = $(_this).attr('attr-template');
	if($(_this).attr('attr-ftype') &&  $(_this).attr('attr-ftype') != '')ftype = $(_this).attr('attr-ftype').split(',');
	switch($(_this).attr('attr-type'))
	{
		case 'thumb':
		case 'list':
		case 'files':
		petype = $(_this).attr('attr-type');
		break;

		default:
		petype = 'thumb';
	}
	return new qq.FineUploader({
	    'element': _this,
	    'multiple': ismul,
	    'template': petemplate,
	    'request': {
	        'endpoint': 'index.php?document-api-fineuploader&imgwidth=640',
	        'method': 'POST'
	    },
	    'thumbnails': {
	        'placeholders': {
	            'waitingPath': 'app/core/styles/images/loader.gif',
	            'notAvailablePath': 'app/core/styles/img/noimage.gif'
	        }
	    },
	    'validation': {
	        'allowedExtensions': ftype
	    },
	    'deleteFile': {
        	enabled: true
        },
	    'callbacks': {
		    'onSubmit':  function(id,  fileName)  {
		    	if(petype != 'list')
		    	{
		    		$(_this).find('.qq-upload-list-selector').html('');
		    		$(_this).find('.qq-upload-list-selector').eq(1).remove();
		    	}
		    },
		    'onProgress': function(id, fileName, loaded, total) {
				if (loaded < total)
				{
					progress = Math.round(loaded / total * 100) + '%';
					$(_this).find('.process').html(progress);
				}
				else
				$(_this).find('.process').html('');
	        },
		    'onComplete': function(id,fileName,responseJSON) {
		    	$(_this).find('[qq-file-id='+id+'] .qq-edit-filename-selector').val(responseJSON.thumb);
		    	if(petype == 'list')
		    	{
		    		var tpl = $(_this).find('.listimg').first().html().replace(/\*name\*/g,$(_this).attr('attr-name'));
		    		tpl = tpl.replace(/\*value\*/g,responseJSON.thumb);
		    		$('#'+$(_this).attr('attr-box')).append(tpl);
		    	}
		    }
	    }
	});
}

function formsubmit(){
	var _this = this;
	var status = false;
	var query;
	var target = $(_this).attr('data-target');
	if(!target || target == '')target = null;
	query = $(":input",_this).serialize()+'&userhash='+Math.random();
	$(":input",_this).not('.ckeditor').each(function(){
		var _this = this;
		var data = xvars($(this));
		if(!data.result && !status){
			$(_this).parents(".control-group").addClass("error");
			$.zoombox.show('ajax',data);
			status = true;
		}
	});
	if(status)return false;
	if(!$(_this).attr('action') || $(_this).attr('action') == '')return false;
	if($(_this).attr('btnact') == 'on'){
		$("input:submit",_this).attr('disabled','true');
		$("input:submit",_this).attr('value','正在提交……');
	};
	submitAjax({"url":$(_this).attr('action'),"query":query,"target":target,'page':$(_this).attr('data-page'),'action-before':$(_this).attr('action-before')});
	return false;
}

var countdown = function(userOptions)
{
	var h,m,s,t;
	var init = function()
	{
		userOptions.time = userOptions.time*60 - userOptions.lefttime;
		s = userOptions.time%60;
		m = parseInt(userOptions.time%3600/60);
		h = parseInt(userOptions.time/3600);
	}

	var setval = function()
	{
		if(s >= 10)
		userOptions.sbox.html(s);
		else
		userOptions.sbox.html('0'+s.toString());
		if(m >= 10)
		userOptions.mbox.html(m);
		else
		userOptions.mbox.html('0'+ m);
		if(h >= 10)
		userOptions.hbox.html(h);
		else
		userOptions.hbox.html('0'+ h);
	}

	var step = function()
	{
		if(s > 0)
		{
			s--;
		}
		else
		{
			if(m > 0)
			{
				m--;
				s = 60;
				s--;
			}
			else
			{
				if(h > 0)
				{
					h--;
					m = 60;
					m--;
					s = 60;
					s--;
				}
				else
				{
					clearInterval(interval);
					userOptions.finish();
					return ;
				}
			}
		}
		setval();
	}
	init();
	interval = setInterval(step, 1000);
};

function combox(){
	var _this = this;
	if($(_this).attr("target") && ($(_this).attr("target") != "")){
		var url = $(_this).attr("refUrl").replace(/{value}/,$(_this).val());
		if($(_this).attr('valuefrom') && ($(_this).attr('valuefrom') != "")){
			var t = $(_this).attr('valuefrom').split("|");
			for(i=0;i<t.length;i++)
			url = url.replace(eval("/{"+t[i]+"}/gi"),$('#'+t[i]).val());
		}
		submitAjax({'url':url,'target':$(_this).attr("target")});
		if($(_this).attr("callback") && $(_this).attr("callback") != "")
		eval($(_this).attr("callback"))($(_this));
	}
}

$(function(){
	$('.pages').css("width","100%");
	if(window.location.hash &&  window.location.hash != '')
	{
		if($(window.location.hash).hasClass("pages"))
		$.currentPage = $(window.location.hash);
		else
		$.currentPage = $('.pages').first();
	}
	else
	$.currentPage = $('.pages').first();
	$.currentPage.addClass('currentpage');
	$('.pages').on('swipeleft',function(){
		var _this = $(this);
		if(_this.attr('attr-nextpage'))
		{
			$.nextPage(_this,$('#'+_this.attr('attr-nextpage')));
		}
	});
	$('.pages').on('swiperight',function(){
		var _this = $(this);
		if(_this.attr('attr-prepage'))
		{
			$.prePage(_this,$('#'+_this.attr('attr-prepage')));
		}
	});
	$("body").delegate("a.ajax","click",$.ajaxGo);
	$("body").delegate("form","submit",formsubmit);
	$('.fineuploader').each(inituploader);
	$(".autoloaditem").each(function(){$(this).load($(this).attr('autoload')+"&current="+$(this).attr('current'));});
	$("body").delegate("select.combox","change",combox);
    $("body").delegate("#mask","click",function(){$(this).remove();});
	$("body").delegate(".pages","animationstart webkitAnimationStart oAnimationStart",function(){
		$.actPage.css('visibility','visible');
		$.currentPage.css('visibility','visible');
	});
	$("body").delegate(".pages","animationend webkitAnimationEnd oAnimationEnd",function(){
		$(this).removeClass('pt-page-moveToLeft').removeClass('pt-page-moveFromLeft').removeClass('pt-page-moveToRight').removeClass('pt-page-moveFromRight');
		$.actPage.css('visibility','hidden');
		$.currentPage.css('visibility','visible');
	});
    window.addEventListener("popstate", function(e) {
        $.goPrePage();
    }, false);
});