String.prototype.replaceAll = function(s1,s2) {
    return this.replace(new RegExp(s1,"gm"),s2);
}
jQuery.extend({'zoombox':(function(){
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
				var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"width:550px;\"><div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\" autocomplete=\"off\"><span aria-hidden=\"true\">×</span></button><h4 class=\"modal-title\" id=\"myModalLabel\">操作确认</h4></div><div class=\"modal-body\"><p class=\"text-danger\" style=\"font-size:1.2em;\">"+msg+"</p></div><div class=\"modal-footer\"><button class=\"btn btn-primary\" onclick=\"javascript:submitAjax({'url':'"+url+"'});\">确定</button><button class=\"btn\" onclick=\"javascript:$.zoombox.hide();\">取消</button></div></div></div>";
				m.html(cnt);
				m.modal({'backdrop':false});
				break;

				case 'ajax':
				var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"width:650px;\"><div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button><h5>出现错误</h5></div><div class=\"modal-body\"><p class=\"alert text-danger\">"+obj.message+"</p></div></div></div>";
				var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"width:650px;margin-top:160px;\"><div class=\"modal-content\"><div class=\"modal-header\" style=\"border:0px;\"><h4 class=\"text-danger\"><em class=\"glyphicon glyphicon-remove-sign\" style=\"font-size:2em;vertical-align: middle;margin-left:25px;\"></em>&nbsp;&nbsp;"+$(obj).attr('message')+"<button type=\"button\" class=\"close pull-right\" data-dismiss=\"modal\" aria-hidden=\"true\" style=\"font-size:2em;\">×</button></h4></div><div class=\"modal-body hide\"><p class=\"alert text-danger\">"+$(obj).attr('message')+"</p></div></div></div>";
				m.html(cnt);
				m.modal({'backdrop':false});
				break;

				case 'ajaxOK':
				var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"width:650px;\"><div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button><h5>操作成功</h5></div><div class=\"modal-body\"><p class=\"alert text-success\">"+obj.message+"</p></div></div></div>";
				var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"width:650px;margin-top:160px;\"\"><div class=\"modal-content\"><div class=\"modal-header\" style=\"border:0px;\"><h5 class=\"text-success\"><em class=\"glyphicon glyphicon-ok-sign\" style=\"font-size:2em;vertical-align: middle;margin-left:25px;\"></em>&nbsp;&nbsp;"+$(obj).attr('message')+"<button type=\"button\" class=\"close pull-right\" data-dismiss=\"modal\" aria-hidden=\"true\" style=\"font-size:2em;\">×</button></h5></div><div class=\"modal-body hide\"><p class=\"alert text-danger\">"+$(obj).attr('message')+"</p></div></div></div>";
				m.html(cnt);
				m.modal({'backdrop':false});
				break;

				default:
				var cnt = "<div class=\"modal-dialog\" role=\"document\" style=\"width:650px;\"><div class=\"modal-content\"><div class=\"modal-header\" style=\"border:0px;\"><h5>出现错误<button type=\"button\" class=\"close pull-right\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button></h5></div><div class=\"modal-body hide\"><p class=\"alert text-danger\">4444"+$(obj).attr('message')+"</p></div></div></div>";
				m.html(cnt);
				m.modal({'backdrop':true});
			}
		},
		'hide':function(){
			m.modal('hide');
			m.remove();
			$('body').removeClass('modal-open');
			$('body').css('padding-right','0px');
		}
	};
})(),
'loginbox':(function(){
	var l = $("<div class=\"modal fade\" id=\"peloginbox\"></div>");
	var lcnt = "";
	return {'show':function(){
			lcnt = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\" autocomplete=\"off\"><span aria-hidden=\"true\">×</span></button><h4 class=\"modal-title\" id=\"myModalLabel\">用户登录</h4></div><div class=\"modal-body\"><form class=\"form-horizontal\" id=\"peloginform\" action=\"index.php?user-app-login\" style=\"padding-top:20px;\"><div class=\"form-group\"><label class=\"col-sm-3 control-label\" for=\"inputEmail\">用户名：</label><div class=\"col-sm-7\"><input class=\"form-control\" name=\"args[username]\" type=\"text\" needle=\"needle\" msg=\"请输入正确格式的用户名\"/></div></div><div class=\"form-group\" style=\"margin-top:10px;\"><label class=\"col-sm-3 control-label\" for=\"inputPassword\">密　码：</label><div class=\"col-sm-7\"><input class=\"form-control\" needle=\"needle\" msg=\"请输入正确格式的密码\" name=\"args[userpassword]\" type=\"password\" /><input type=\"hidden\" value=\"1\" name=\"userlogin\"/></div></div></form></div><div class=\"modal-footer\"><button class=\"btn btn-primary\" type=\"button\" onclick=\"javascript:$('#peloginform').submit();\">登录</button><button aria-hidden=\"true\" class=\"btn\" data-dismiss=\"modal\">取消</button></div></div></div>";
			l.html(lcnt);
			l.find("form").on('submit',formsubmit);
			l.modal({"backdrop":false});
		},
		'hide':function(){
			l.modal('hide');
			l.remove();
		}
	};
})(),
'copyRight':'redrangon',
'removeUploadedImage': function(_this)
{
	$(_this).parents('.thumbuper').remove();
}});
function markSelectedQuestions(n,o){
	$("[name='"+n+"']").each(function(){if($('#'+o).val().indexOf(','+$(this).val()+',') >= 0)$(this).attr('checked',true);});
}
function doselectquestions(o,d,n)
{
	selectquestions(o,d,n);
	var op = $(o).attr("del");
	$('#'+op).remove();
}
function selectquestions(o,d,n){
	var d = $('#'+d);
	var n = $('#'+n);
	if(d.val() == '')d.val(',');
	if($(o).is(':checked')){
		if(d.val().indexOf(','+$(o).val()+',') < 0){
			d.val(d.val()+$(o).val()+',');
			n.html(parseInt(n.html())+parseInt($(o).attr('rel')));
		}
	}
	else{
		var t = eval('/,'+$(o).val()+',/');
		if(d.val().indexOf(','+$(o).val()+',') >= 0){
			d.val(d.val().replace(t,','));
			n.html(parseInt(n.html())-parseInt($(o).attr('rel')));
		}
	}
}
function setKnowsList(o,c,t){
	var oo = $('#'+o);
	var oc = $('#'+c);
	if(t == '+')
	{
		if(oc.val() == '' || oc.val() < 1)return false;
		var txt = oc.val()+':'+oc.find("option:selected").text();
		if(oo.val().indexOf(txt) == -1)
		{
			if(oo.val() == '')oo.val(txt);
			else oo.val(txt+'\n'+oo.val());
		}
	}
	else oo.val('');
}
function setAnswerHtml(t,o)
{
	$("."+o).hide();
	$("#"+o+"_"+t).show();
	if(parseInt(t) == 0 || parseInt(t) == 5)
	{
		$("#selectnumber").hide();
		$("#selecttext").hide();
	}
	else
	{
		$("#selectnumber").show();
		$("#selecttext").show();
	}
}
jQuery.cookie = function(key, value, options) {
    if (arguments.length > 1 && String(value) !== "[object Object]") {
        options = jQuery.extend({},
        options);
        if (value === null || value === undefined) {
            options.expires = -1;
        }
        if (typeof options.expires === 'number') {
            var days = options.expires,
            t = options.expires = new Date();
            t.setDate(t.getDate() + days);
        }
        value = String(value);
        return (document.cookie = [encodeURIComponent(key), '=', options.raw ? value: encodeURIComponent(value), options.expires ? '; expires=' + options.expires.toUTCString() : '', options.path ? '; path=' + options.path: '', options.domain ? '; domain=' + options.domain: '', options.secure ? '; secure': ''].join(''));
    }
    options = value || {};
    var result,
    decode = options.raw ?
    function(s) {
        return s;
    }: decodeURIComponent;
    return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};
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

function submitAjax(parms){
	if(!parms.query)parms.query = "";
	parms.query += "&userhash="+Math.random();
	if(parms['action-before'])eval(parms['action-before'])();
	$.ajax({"url":parms.url,
		"type":"post",
		"data":parms.query,
		"success":function(data){
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
						$.loginbox.hide();
						if(!data.time) data.time = 1000;
						if(data.message)
						$.zoombox.show('ajaxOK',data);
						setTimeout(function(){if(data.callbackType == 'forward'){
								if(data.forwardUrl && data.forwardUrl != '')
								{
									$.zoombox.hide();
									if(data.forwardUrl == 'reload')
									window.location.reload();
									else if(data.forwardUrl == 'back')
									{
										window.history.back();
										window.location.reload();
									}
									else
									window.location.href = data.forwardUrl;
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
								if(data.loadJs)
								{
									var tjs = data.loadJs;
									var num = tjs.length - 1;
									for(i=0;i<=num;i++)
									{
										if(i == num)
										$.getScript(tjs[i], function()
										{
											if(data.forwardUrl == 'reload')
											window.location.reload();
											else if(data.forwardUrl == 'back')
											{
												window.history.back();
												window.location.reload();
											}
											else
											window.location.href = data.forwardUrl;
										});
										else
										$.getScript(tjs[i]);
									}
								}
								else
								{
									if(data.forwardUrl == 'reload')
									window.location.reload();
									else if(data.forwardUrl == 'back')
									{
										window.history.back();
										//window.location.reload();
									}
									else
									window.location.href = data.forwardUrl;
								}
							}
						}
						else{
							if(data.forwardUrl && data.forwardUrl != '')
							{
								$.zoombox.hide();
								submitAjax({'url': data.forwardUrl,'target' : parms.target});
							}
							else window.location.reload();
						}
					}else if(parseInt(data.statusCode) == 300){
						$.loginbox.hide();
						$.zoombox.show('ajax',data);
						$(".randCode:first").each(function(){
							$(this).attr('src',$(this).attr('src')+'&'+Math.random());
						});
					}else if(parseInt(data.statusCode) == 301){
						$.loginbox.show();
					}
					else{
						$.zoombox.show('ajax',data);
					}
				}
				else
				{
					if(data && data.substring(0,6) != 'error:')
					if(parms.target)
					{
						$('#'+parms.target).html(data);
						var dom = document.getElementById(parms.target);
						$('.di-style',dom).find('span').on('click',function(){
							var _this = $(this);
							_this.parents('.di-style').parent().find('span').removeClass('dis-select');
							_this.addClass('dis-select');
							if(_this.attr('data-element'))
							{
								$('#'+_this.attr('data-element')).val(_this.attr('data-value'));
							}
						});
						$(".autoloaditem",dom).each(function(){if($(this).attr('autoload') && $(this).attr('autoload') != '');$(this).load($(this).attr('autoload')+"&current="+$(this).attr('current'));});
						$("a.ajax",dom).each(htmlajax);
						$("form",dom).not('.dxform').on('submit',formsubmit);
						$("select.combox",dom).on("change",combox);
						$(":input",dom).attr("autocomplete","off");
						$(":input",dom).on("blur",inputBlur);
						$("select.autocombox",dom).on("change",autocombox);
						$(":checkbox.checkall",dom).on("change",checkAll);
						$('.datetimepicker',dom).each(initdatepicker);
						$(".selfmodal",dom).on("click",modalAjax);
						$("a.confirm",dom).each(confirmDialog);
						$(".jckeditor",dom).each(initEditor);
						$('.fineuploader',dom).each(inituploader);
						$('.sortable',dom).sortable();
						try
						{
							MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
						}
						catch(e)
						{}
					}
				}
				return data.statusCode;
			}
		}
	});
}
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

function autocombox(){
	var _this = this;
	var url = $(_this).attr("refUrl").replace(/{value}/,$(_this).val());
	var step = $(_this).attr("step");
	if(!step || step == "")step = 0;
	else step = parseInt(step);
	if($(_this).attr('valuefrom') && ($(_this).attr('valuefrom') != "")){
		var t = $(_this).attr('valuefrom').split("|");
		for(i=0;i<t.length;i++)
		url = url.replace(eval("/{"+t[i]+"}/gi"),$('#'+t[i]).val());
	}
	$.get(url+'&rand='+Math.random(),function(dt){
		if(dt.statusCode == '200')
		{
			var d = dt.html;
			$('select[rel="'+$(_this).attr('name')+'_auto_rel"]').each(function(){if($(this).attr('step') && $(this).attr('step') != '' && parseInt($(this).attr('step')) > step)$(this).remove();});
			var o = $('<select class="form-control" order="'+$(_this).attr('order')+'" rel="'+$(_this).attr('name')+'_auto_rel'+'" step="'+(step+1)+'" id="'+$(_this).attr('name')+'_auto_'+(step+1)+'" valuefrom="'+$(_this).attr("valuefrom")+'" refUrl="'+$(_this).attr("refUrl")+'" name="'+$(_this).attr('name')+'" needle="needle" msg="您必须要选择一项"><option value="">请选择</option>'+d+'</select>');
			if($(_this).attr('order') == '1')
			$(_this).before(o);
			else
			$(_this).after(o);
			o.focus();
			o.on("blur",inputBlur);
			o.on("change",autocombox);
      	}
      	else
      	{
      		$('select[rel="'+$(_this).attr('name')+'_auto_rel"]').each(function(){if($(this).attr('step') && $(this).attr('step') != '' && parseInt($(this).attr('step')) > step)$(this).remove();});
      	}
	},'json');
	if($(_this).attr("callback") && $(_this).attr("callback") != "")
	eval($(_this).attr("callback"))($(_this));
}

function htmlajax(obj){
	var _this = this;
	var target = $(_this).attr('target');
	var callback = $(_this).attr('callback');
	$(_this).attr('target','_self');
	var href = $(_this).attr('href');
	$(_this).attr('href','javascript:;');
	$(_this).attr('data',href);
	$(_this).click(function(){
		var status = submitAjax({"url":href,"target":target,'action-before':$(_this).attr('action-before')});
		return false;
	});
}

function inputBlur(){
	var _this = this;
	var data = xvars($(_this));
	if(!data.result){
		$(_this).parents(".control-group").addClass("error");
	}else{
		$(_this).parents(".control-group").removeClass("error");
	}
}

function checkAll(){
	var _this = this;
	$(_this).parents('table:first').find('input').prop('checked', $(_this).is(':checked'));
}

function formsubmit(){
	var _this = this;
	var status = false;
	var query;
	var target = $(_this).attr('direct');
	if(!target || target == '')target = 'datacontent';
	for ( instance in CKEDITOR.instances )
	CKEDITOR.instances[instance].updateElement();
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
	submitAjax({"url":$(_this).attr('action'),"query":query,"target":target,'action-before':$(_this).attr('action-before')});
	return false;
}

function modalAjax(){
	var m = $($(this).attr('data-target'));
	var url = $(this).attr('url');
	if($(this).attr('valuefrom') && ($(this).attr('valuefrom') != "")){
		var t = $(this).attr('valuefrom').split("|");
		for(i=0;i<t.length;i++)
		url = url.replace(eval("/{"+t[i]+"}/gi"),escape($('#'+t[i]).val()));
	}
	$.get(url+'&'+Math.random(),function(data){
		var c = m.children().find(".modal-body");
		c.html(data);
		c.find(".autoloaditem").each(function(){if($(this).attr('autoload') && $(this).attr('autoload') != '');$(this).load($(this).attr('autoload')+"&current="+$(this).attr('current'));});
		c.find("a.ajax").each(htmlajax);
		c.find("form").on('submit',formsubmit);
		c.find("select.combox").on("change",combox);
		c.find(":input").attr("autocomplete","off");
		c.find(":input").on("blur",inputBlur);
		c.find("select.autocombox").on("change",autocombox);
		c.find(":checkbox.checkall").on("change",checkAll);
		c.find('.datepicker').each(initdatepicker);
		c.find(".selfmodal").on("click",modalAjax);
		c.find(".jckeditor").each(initEditor);
		c.find("a.confirm").each(confirmDialog);
		m.modal();
	})
}

function initEditor(){
	var _this = this;
	if($(_this).attr('etype') == 'simple')
	{
		var config = {
			toolbar:
			[
				['Bold', 'Italic', '-', 'NumberedList', 'BulletedList'],
				['Superscript','Subscript','JustifyLeft','JustifyCenter','JustifyRight','Link'],
				['Table','HorizontalRule','SpecialChar','Mathjax']
			]
		};
		CKEDITOR.replace(_this,config).on("blur", function () {
	        var _ = this;
	        var p=[];
	        $(_this).val(_.getData());
			p.push(_.element.$.attributes.name.value);
			p.push(_.getData());
			p.push(Date.parse(new Date())/1000);
			$('#time_'+$(_this).attr('rel')).val(Date.parse(new Date())/1000);
			set.apply(formData,p);
	        batmark(_.element.$.attributes.rel.value,_.getData());
	    });
	}
	else
	{
		if($(_this).attr('attr-height') && $(_this).attr('attr-height') != '')
		{
			var config = {'height':$(_this).attr('attr-height')};
            CKEDITOR.replace(_this,config);
		}
		else
		CKEDITOR.replace(_this);
	}
}

countdown = function(userOptions)
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

function confirmDialog(){
	var _this = this;
	var href = $(_this).attr('href');
	$(_this).attr('href','javascript:;')
	$(_this).on('click',function(){$.zoombox.show('confirm',_this,href);});
}

function initdatepicker(){
	var _this = this;
	var minview = $(_this).attr('data-minview');
	$(_this).datetimepicker({"language":'zh-CN',"autoclose": 1,"minView":$(_this).attr('data-minview')?$(_this).attr('data-minview'):2});
}

function inituploader()
{
	var _this = this;
	var ismul = false;
	var petemplate = 'pe-template';
	var petype = 'thumb';
	var ftype = ['jpeg', 'jpg', 'gif', 'png'];
	var maxsize = '20480000';
	if($(_this).attr('attr-list') == 'true')ismul = true;
	if($(_this).attr('attr-maxsize') && $(_this).attr('attr-maxsize') != '')
	maxsize = $(_this).attr('attr-maxsize');	
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
	        'endpoint': 'index.php?document-api-fineuploader',
	        'method': 'POST'
	    },
	    'thumbnails': {
	        'placeholders': {
                'waitingPath': 'files/public/img/loader.gif',
                'notAvailablePath': 'files/public/img/noimage.gif'
	        }
	    },
	    'validation': {
			'sizeLimit': maxsize,
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
				if(responseJSON.status == 'fail')
				{
					alert(responseJSON.message);
					return;
				}
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

$(function(){
	$(".autoloaditem").each(function(){
		if($(this).attr('autoload') && $(this).attr('autoload') != '')
		$(this).load($(this).attr('autoload')+"&current="+$(this).attr('current'));
	});
	$(".jckeditor").each(initEditor);
	$('.datetimepicker').each(initdatepicker);
	$(".randCode").on('click',function(){
		$(this).attr('src',$(this).attr('src')+'&'+Math.random());
	});
	$("form").not('.dxform').on('submit',formsubmit);
	$("a.ajax").each(htmlajax);
	$("select.combox").on("change",combox);
	$(":input").attr("autocomplete","off");
	$(":input").on("blur",inputBlur);
	$("select.autocombox").on("change",autocombox);
	$(":checkbox.checkall").on("change",checkAll);
	$(".selfmodal").on("click",modalAjax);
	$("a.catool").each(function(){openmenu(this);});
	$("a.confirm").each(confirmDialog);
	$('a.poproom').popover();
	$('.sortable').sortable();
	$('.fineuploader').each(inituploader);
	$('body').delegate('.listimgselector','dblclick',function(){$(this).remove();});
});

function openmenu(_this){
	if($(_this).attr("data") != '1')
	{
		if($(_this).attr("app"))
		var app = $(_this).attr("app");
		else
		var app = 'content';
		var o = $(_this).parents("tr");
		var t = '';
		$.getJSON('index.php?'+app+'-master-category-ajax-getchilddata&'+Math.random(),{'catid':$(_this).attr('rel')},function(data){
			for(x in data){
				var s = $('<tr>'+o.html()+'<tr />');
				s.children("td").eq(0).children("input").eq(0).attr('name','ids['+data[x].catid+']');
				s.children("td").eq(0).children("input").eq(0).attr('value',data[x].catlite);
				s.children("td").eq(1).html(data[x].catid);
				s.children("td").eq(2).children('img').eq(0).attr('src',data[x].catimg == ''?'app/core/styles/images/noupload.gif':data[x].catimg);
				s.children("td").eq(3).children('a').eq(0).attr('rel',data[x].catid);
				s.children("td").eq(3).children('span').eq(0).html(data[x].catname);
				s.children("td").eq(3).html('<em class="span1"></em>'+s.children("td").eq(3).html());
				s.children("td").eq(4).html(s.children("td").eq(4).html().replaceAll('catid='+$(_this).attr('rel'),'catid='+data[x].catid).replaceAll('parent='+$(_this).attr('rel'),'parent='+data[x].catid));
				s.children("td").eq(4).find("a.ajax").each(function(){
					var _this = this;
					var d = $(_this).attr('data');
					$(_this).attr('href',d);
					$(_this).attr('data',null);
				});
				t = t+'<tr class="submenu'+$(_this).attr('rel')+'">'+s.html()+'<tr />';
			}
			o.after($(t));
			$('.submenu'+$(_this).attr('rel')).find("a.ajax").each(htmlajax);
			$(_this).attr("data","1");
			$(_this).attr("class","icon-minus-sign catool");
			$(_this).attr("onclick","javascript:closemenu(this);");
		});
	}
	else
	{
		$('.submenu'+$(_this).attr('rel')).show();
		$(_this).attr("class","icon-minus-sign catool");
		$(_this).attr("onclick","javascript:closemenu(this);");
	}
}

function closemenu(_this){
	if($(_this).attr('rel') && $(_this).attr('rel') != '')
	{
		var p = $('.submenu'+$(_this).attr('rel'));
		if(p)
		{
			p.each(function(){
				var x = $('.submenu'+$(this).children("td").eq(3).children("a").eq(0).attr('rel')).eq(0);
				if(x.attr('class'))
				closemenu($(this).children("td").eq(3).children("a").eq(0).get(0));
				$('.submenu'+$(_this).attr('rel')).hide();
			});
		}
		$(_this).attr("class","icon-plus-sign catool");
		$(_this).attr("onclick","javascript:openmenu(this);");
	}
}