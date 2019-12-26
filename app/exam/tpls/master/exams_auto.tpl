{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2 leftmenu">
				{x2;include:menu}
			</div>
			<div id="datacontent">
{x2;endif}
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
							<li><a href="index.php?{x2;$_app}-master-exams&page={x2;$page}{x2;$u}">试卷管理</a></li>
							<li class="active">随机组卷</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						随机组卷
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-exams&page={x2;$page}{x2;$u}">试卷管理</a>
					</h4>
			        <form action="index.php?exam-master-exams-autopage" method="post" class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">试卷名称：</label>
					  		<div class="col-sm-4">
					  			<input class="form-control" type="text" name="args[exam]" value="" needle="needle" msg="您必须为该试卷输入一个名称"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">评卷方式</label>
							<div class="col-sm-9">
								<label class="radio-inline">
									<input name="args[examdecide]" type="radio" value="1"/>教师评卷
								</label>
								<label class="radio-inline">
									<input name="args[examdecide]" type="radio" value="0" checked/>学生自评
								</label>
								<span class="help-block">教师评卷时有主观题则需要教师在后台评分后才能显示分数，无主观题自动显示分数。</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">考试科目：</label>
						  	<div class="col-sm-4">
							  	<select class="form-control combox" needle="needle" min="1" target="tablecontent" refurl="index.php?exam-master-exams-ajax-getsubjectknows&subjectid={value}" name="args[examsubject]" msg="请选择科目" onchange="javascript:loadsubjectsetting(this);">
								  	<option value="">请选择科目</option>
								  	{x2;tree:$subjects,subject,sid}
								  	<option value="{x2;v:subject['subjectid']}">{x2;v:subject['subject']}</option>
								  	{x2;endtree}
							  	</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">考试时间：</label>
					  		<div class="col-sm-9 form-inline">
					  			<input class="form-control" type="text" name="args[examsetting][examtime]" value="60" size="4" needle="needle" class="inline"/> 分钟
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">来源：</label>
					  		<div class="col-sm-4">
					  			<input class="form-control" type="text" name="args[examsetting][comfrom]" value="" size="4"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">试卷总分：</label>
					  		<div class="col-sm-4">
					  			<input class="form-control" type="text" name="args[examsetting][score]" value="" size="4" needle="needle" msg="你要为本考卷设置总分" datatype="number"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">及格线：</label>
					  		<div class="col-sm-4">
					  			<input class="form-control" type="text" name="args[examsetting][passscore]" value="" size="4" needle="needle" msg="你要为本考卷设置一个及格分数线" datatype="number"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">题型排序</label>
							<div class="col-sm-9">
								<div class="sortable btn-group">
									{x2;tree:$questypes,questype,qid}
									<a class="btn btn-primary questpanel panel_{x2;v:questype['questid']}">{x2;v:questype['questype']}<input type="hidden" name="args[examsetting][questypelite][{x2;v:questype['questid']}]" class="questypepanelinput" id="panel_{x2;v:questype['questid']}" value="1"/></a>
									{x2;endtree}
								</div>
								<span class="help-block">拖拽进行题型排序</span>
							</div>
						</div>
						<div class="form-group">
					        <label class="control-label col-sm-2">题量配比模式：</label>
				          	<div class="col-sm-9">
								<label class="radio-inline">
					          		<input type="radio" class="form-control" name="args[examsetting][scalemodel]" value="1" onchange="javascript:$('#modeplane').html($('#sptype').html());$('#modeplane').find('.selfmodal').on('click',modalAjax);"/> 开启
					          	</label>
					          	<label class="radio-inline">
					          		<input type="radio" class="form-control" name="args[examsetting][scalemodel]" value="0" onchange="javascript:$('#modeplane').html($('#normaltype').html());" checked/> 关闭
					          	</label>
					       </div>
					    </div>
					    <div id="modeplane">
					    	{x2;tree:$questypes,questype,qid}
							<div class="form-group questpanel panel_{x2;v:questype['questid']}">
								<label class="control-label col-sm-2" for="content">{x2;v:questype['questype']}：</label>
								<div class="col-sm-9 form-inline">
									<span class="info">共&nbsp;</span>
									<input id="iselectallnumber_{x2;v:questype['questid']}" type="text" class="form-control" needle="needle" name="args[examsetting][questype][{x2;v:questype['questid']}][number]" value="0" size="1" msg="您必须填写总题数"/>
									<span class="info">&nbsp;题，每题&nbsp;</span><input class="form-control" needle="needle" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][score]" value="0" size="1" msg="您必须填写每题的分值"/>
									<span class="info">&nbsp;分，描述&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][describe]" value="" size="10"/>
									<span class="info">&nbsp;易&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][easynumber]" value="0" size="1" msg="您需要填写简单题的数量，最小为0"/>
			  						<span class="info">&nbsp;中&nbsp;</span><input class="form-control" type="text" needle="needle" name="args[examsetting][questype][{x2;v:questype['questid']}][middlenumber]" value="0" size="1" msg="您需要填写中等难度题的数量，最小为0"/>
			  						<span class="info">&nbsp;难&nbsp;</span><input class="form-control" type="text" needle="needle" name="args[examsetting][questype][{x2;v:questype['questid']}][hardnumber]" value="0" size="1" datatype="number" msg="您需要填写难题的数量，最小为0"/>
								</div>
							</div>
							{x2;endtree}
					    </div>
						<div class="form-group">
							<label class="control-label col-sm-2"></label>
							<div class="col-sm-9">
								<button class="btn btn-primary" type="submit">提交</button>
								<input type="hidden" name="submitsetting" value="1"/>
							</div>
						</div>
					</form>
					<div id="sptype" class="hide">
					    <div class="form-group">
					        <label class="control-label col-sm-2">题量配比：</label>
				          	<div class="col-sm-9">
					          	<label class="radio inline">题量配比模式关闭时，此设置不生效。题量配比操作繁琐，请尽量熟悉后再行操作。</label>
					       </div>
					    </div>
					    {x2;tree:$questypes,questype,qid}
						<div class="form-group questpanel panel_{x2;v:questype['questid']}">
							<label class="control-label col-sm-2" for="content">{x2;v:questype['questype']}：</label>
							<div class="col-sm-9 form-inline">
								<span class="info">共&nbsp;</span>
								<input id="iselectallnumber_{x2;v:questype['questid']}" type="text" class="form-control" needle="needle" name="args[examsetting][questype][{x2;v:questype['questid']}][number]" value="0" size="2" msg="您必须填写总题数"/>
								<span class="info">&nbsp;题，每题&nbsp;</span><input class="form-control" needle="needle" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][score]" value="0" size="2" msg="您必须填写每题的分值"/>
								<span class="info">&nbsp;分，描述&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][describe]" value="" size="12"/>
								<a href="javascript:;" onclick="javascript:currentP = 'examscale_{x2;v:questype['questid']}';$('#tablecontent').find(':checkbox').attr('checked',false);$('#modal').modal();" class="btn btn-primary">配题</a>
								<a href="javascript:;" onclick="javascript:$('#examscale_{x2;v:questype['questid']}').val('');" class="btn btn-danger">重置</a>
								<a class="btn btn-info selfmodal" href="javascript:;" data-target="#modal2" url="index.php?exam-master-exams-showsetting&setting={examscale_{x2;v:questype['questid']}}&useframe=1" valuefrom="examscale_{x2;v:questype['questid']}">检查</a>
							</div>
						</div>
						<div class="form-group questpanel panel_{x2;v:questype['questid']}">
							<label class="control-label col-sm-2" for="content">配比率：</label>
							<div class="col-sm-9">
								<textarea class="form-control" rows="7" id="examscale_{x2;v:questype['questid']}" cols="4" name="args[examsetting][examscale][{x2;v:questype['questid']}]"></textarea>
							</div>
						</div>
						{x2;endtree}
					</div>
					<div id="normaltype" class="hide">
						{x2;tree:$questypes,questype,qid}
						<div class="form-group questpanel panel_{x2;v:questype['questid']}">
							<label class="control-label col-sm-2" for="content">{x2;v:questype['questype']}：</label>
							<div class="col-sm-9 form-inline">
								<span class="info">共&nbsp;</span>
								<input id="iselectallnumber_{x2;v:questype['questid']}" type="text" class="form-control" needle="needle" name="args[examsetting][questype][{x2;v:questype['questid']}][number]" value="0" size="1" msg="您必须填写总题数"/>
								<span class="info">&nbsp;题，每题&nbsp;</span><input class="form-control" needle="needle" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][score]" value="0" size="1" msg="您必须填写每题的分值"/>
								<span class="info">&nbsp;分，描述&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][describe]" value="" size="10"/>
								<span class="info">&nbsp;易&nbsp;</span><input class="form-control" type="text" name="args[examsetting][questype][{x2;v:questype['questid']}][easynumber]" value="0" size="1" msg="您需要填写简单题的数量，最小为0"/>
		  						<span class="info">&nbsp;中&nbsp;</span><input class="form-control" type="text" needle="needle" name="args[examsetting][questype][{x2;v:questype['questid']}][middlenumber]" value="0" size="1" msg="您需要填写中等难度题的数量，最小为0"/>
		  						<span class="info">&nbsp;难&nbsp;</span><input class="form-control" type="text" needle="needle" name="args[examsetting][questype][{x2;v:questype['questid']}][hardnumber]" value="0" size="1" datatype="number" msg="您需要填写难题的数量，最小为0"/>
							</div>
						</div>
						{x2;endtree}
					</div>
				</div>
			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
<div id="modal2" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
				<h4 id="myModalLabel">
					配置详情
				</h4>
			</div>
			<div class="modal-body" id="modal-body"></div>
			<div class="modal-footer">
				 <button aria-hidden="true" class="btn btn-primary" data-dismiss="modal">完成</button>
			</div>
		</div>
	</div>
</div>
<div id="modal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
				<h4 id="myModalLabel">
					配题
				</h4>
			</div>
			<div class="modal-body">
				<div action="#" method="post" class="form-horizontal">
					<div class="form-group" style="max-height:240px;overflow-y:scroll;" id="tablecontent">
						<table class="table table-hover table-bordered" style="width:86%;margin:auto;">
							<tr class="info">
								<td colspan="3">请先选择科目</td>
							</tr>
						</table>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">题量：</label>
				  		<div class="col-sm-10 form-inline">
				  			<span class="info">共&nbsp;</span>
							<input id="modalallnumber" type="text" class="form-control" needle="needle" value="10" size="1" msg="您必须填写总题数"/>
							<span class="info">&nbsp;易&nbsp;</span><input id="modaleasynumber" class="form-control" type="text" value="3" size="1" msg="您需要填写简单题的数量，最小为0"/>
		  					<span class="info">&nbsp;中&nbsp;</span><input id="modalmidnumber" class="form-control" type="text" needle="needle" value="4" size="1" msg="您需要填写中等难度题的数量，最小为0"/>
		  					<span class="info">&nbsp;难&nbsp;</span><input id="modalhardnumber" class="form-control" type="text" needle="needle" value="3" size="1" datatype="number" msg="您需要填写难题的数量，最小为0"/>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				 <button class="btn btn-primary" type="button" onclick="javascript:confirmRules();">增加规则</button>
				 <button aria-hidden="true" class="btn btn-danger" data-dismiss="modal">放弃</button>
			</div>
		</div>
	</div>
</div>
<script>
function loadsubjectsetting(obj)
{
	$.getJSON('index.php?exam-master-basic-getsubjectquestype&subjectid='+$(obj).val()+'&'+Math.random(),function(data){$('.questpanel').hide();$('.questypepanelinput').val('0');for(x in data){$('.panel_'+data[x]).show();$('#panel_'+data[x]).val('1');}});
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
</script>
{x2;include:footer}
</body>
</html>
{x2;endif}