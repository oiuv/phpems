{x2;include:header}
<body>
<style>
.red{color:red;}
.main_left0 {
    display: none;
}
</style>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="margin-bottom:0px;">
				<ul class="breadcrumb">
					<li><a href="index.php">首页</a></li>
					<li><a href="index.php?exam-app">考试</a></li>
					<li>
						<a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a>
					</li>
					<li class="active">
						强化训练
					</li>
				</ul>
			</div>
			<div class="box itembox">
				<h4 class="title">强化训练</h4>
				<div class="alert alert-info">
	            	<ul class="list-unstyled">
	                	<li><b>1、</b>点击考试名称按钮进入答题界面，考试开始计时。</li>
	                	<li><b>2、</b>在随机考试过程中，您可以通过顶部的考试时间来掌握自己的做题时间。</li>
	                	<li><b>3、</b>提交试卷后，可以通过“查看答案和解析”功能进行总结学习。</li>
	                	<li><b>4、</b>系统自动记录模拟考试的考试记录，学员考试结束后可以进入“答题记录”功能进行查看。</li>
	                	<li>&nbsp;</li>
	                </ul>
                </div>
                <blockquote>
					<p>
						配卷规则
					</p>
				</blockquote>
				<form action="index.php?exam-app-exercise" id="exer" method="post" class="form-inline" style="padding-top:20px;">
                	<ol class="list-unstyled col-xs-6" style="line-height:3.2em;">
                    	<li>
                        	<span class="red">*</span>
                            <span>章节选择：
                            	<select autocomplete="off" id="thesectionid" name="args[sectionid]" class="combox form-control" ref="theknowsid" refUrl="index.php?exam-app-index-ajax-getknowsbysectionid&sectionid={value}" more="questionnumbers" callback="getSectionContent">
                            		<option value="0">请选择章节</option>
                            		{x2;tree:$sections,section,sid}
                            		<option value="{x2;v:section['sectionid']}">{x2;v:section['section']}</option>
                            		{x2;endtree}
                            	</select>
                            </span>
                            <span>
                            	<select autocomplete="off" name="args[knowsid]" id="theknowsid" class="combox form-control" ref="questionnumbers" refUrl="index.php?exam-app-exercise-ajax-getQuestionNumber&sectionid={tmp}&knowsid={value}" tmp="thesectionid">
                            		<option value="0">请选择知识点</option>
                            	</select>
                            </span>
                            <span id="section_error" class="red font_12 main_left0">请选择章节</span>
                        </li>
                    	<li>
                        	<span class="red">*</span>
                            <span>试卷名称：<input id="exam_name" type="text" name="args[title]" class="form-control"/></span><span style="font-size:12px;"></span>
                            <span id="exam_name_error" class="red font_12 main_left0">请填写试卷名称</span>
                        </li>
                    	<li>
                            <span class="red">*</span>
                            <span>做题时间：<input id="exam_time" type="text" name="args[time]" style="width:60px;" class="form-control" value='60'/> 分钟 </span>
                            <span id="exam_time_error" class="red font_12 main_left0">请填写做题时间</span>
                        </li>
                    	<li>
	                        <span class="red">*</span>
	                        <span>题&nbsp;&nbsp;&nbsp;&nbsp;型：请在右侧选择。如果您不希望做某种题型，请填写 0 </span>
	                        <span id="question_count_error" class="red font_12 main_left0"> 请至少选择一道题</span>
                        </li>
                    </ol>
                    <div class="col-xs-6">
	                    <ol id="questionnumbers" style="line-height:3.2em;">
	                        {x2;tree:$questype,quest,qid}
	                        <li class="text_in">
	                        	{x2;v:quest['questype']}（共{x2;$numbers[v:quest['questid']]}题），选 <input id="question_{x2;v:quest}" type="text" class="form-control" name="args[number][{x2;v:quest}]" style="width:60px;" onChange="javascript:check_num(this);" onBlur="" rel="{x2;$numbers[v:quest]}"/> 题
	                        	<span id="question_{x2;v:quest['questid']}_error" class="red font_12 main_left0">选择的题数不能超过{x2;$numbers[v:quest]}</span>
	                        </li>
	                    	{x2;endtree}
	                    </ol>
                    </div>
                    <div id="begin_exer">
                    	<input type="hidden" name="setExecriseConfig" value="1" />
                    	<p class="text-center">
                    		<button onclick="javascript:return check_form();" type="submit" class="btn btn-primary">开始测试</button>
                    	</p>
                    </div>
                </form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function common(){
	var getSectionContent = function(data){
		var obj = '#'+data.attr('more');
		$.get('index.php?exam-app-exercise-ajax-getQuestionNumber&sectionid='+data.val()+'&rand='+Math.random(),function(d){$(obj).html(d);});
	}
	var combox = function(){
		$(".combox").bind("change",function(){
			if($(this).attr("ref") && $(this).attr("ref") != ""){
				if($(this).attr("refUrl") != ""){
					var url = $(this).attr("refUrl").replace(/{value}/,$(this).val());
					var t = $(this).attr('tmp');
					url = url.replace(/{tmp}/,$('#'+t).val());
					var obj = '#'+$(this).attr("ref");
					$.get(url+'&rand='+Math.random(),function(d){$(obj).html(d);});
					if($(this).attr("callback") && $(this).attr("callback") != "")
					eval($(this).attr("callback"))($(this));
				}
			}
		})
	}
	combox();
}
$(document).ready(function(){
	common();
	$("#thesectionid").change(function(){
		$('#section_error').hide();
	});
	$("#exam_name").change(function(){
		$('#exam_name_error').hide();
	});
	$("#exam_time").change(function(){
		$('#exam_time_error').hide();
	});
});
function check_form(){
	clearStorage();
	var check = true;
	var section = $("#thesectionid").val();
	if ( section == 0 ){
		$('#section_error').show();
		check = false;
	}
	var exam_name = $("#exam_name").val();
	if ( exam_name == "" ){
		$('#exam_name_error').show();
		check = false;
	}
	var exam_time = $("#exam_time").val();
	if ( isNaN(exam_time) || exam_time== 0 ){
		$('#exam_time_error').show();
		check = false;
	}
	var arr = 0;
	$("#questionnumbers").children('li').each(function(){
		var max = $(this).children('input').attr('rel');
		var id = $(this).children('input').attr('id')
		var num = $(this).children('input').val();
		num = (isNaN(num) || num=="") ? 0 : num;
		arr += Number(num);
		if(Number(num) > Number(max)){
			$("#"+id+"_error").show();
			check = false;
			return;
		}
	});
	if( arr == 0 ){
		$("#question_count_error").show();
		check = false;
	}
	return check;
}

function check_num(obj){
	var max = $(obj).attr('rel');
	var id = $(obj).attr('id');
	var num = $(obj).val();
	num = (isNaN(num) || num=="") ? 0 : num;
	if(Number(num) > 0){
		$("#question_count_error").hide();
	}
	if(Number(num) > Number(max)){
		$("#"+id+"_error").show();
		return false;
	}else{
		$("#"+id+"_error").hide();
		return true;
	}
}
</script>
{x2;include:footer}
</body>
</html>