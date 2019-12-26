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
							<li><a href="index.php?{x2;$_app}-teach">{x2;$apps[$_app]['appname']}</a></li>
							<li><a href="index.php?{x2;$_app}-teach-rowsquestions&page={x2;$page}{x2;$u}">题冒题管理</a></li>
							<li class="active">添加题冒</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						添加题冒
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-teach-rowsquestions&page={x2;$page}{x2;$u}">题冒题管理</a>
					</h4>
			        <form action="index.php?exam-teach-rowsquestions-addquestionrows" method="post" class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-2">知识点：</label>
							<div class="col-sm-9">
								<textarea cols="72" rows="4" class="form-control" name="args[qrknowsid]" id="questionknowsid" readonly>{x2;tree:$question['qrknowsid'],know,kid}{x2;v:know['knowsid']}:{x2;v:know['knows']}{x2;enter}{x2;endif}</textarea>
				  			</div>
				  		</div>
						<div class="form-group">
					  		<label class="control-label col-sm-2"></label>
					  		<div class="col-sm-9 form-inline">
						  		<select class="combox form-control" target="isectionselect" refUrl="index.php?exam-teach-questions-ajax-getsectionsbysubjectid&subjectid={value}">
					        		<option value="0">选择科目</option>
							  		{x2;tree:$subjects,subject,sid}
							  		<option value="{x2;v:subject['subjectid']}">{x2;v:subject['subject']}</option>
							  		{x2;endtree}
						  		</select>
						  		<select class="combox form-control" id="isectionselect" target="iknowsselect" refUrl="index.php?exam-teach-questions-ajax-getknowsbysectionid&sectionid={value}">
						  			<option value="0">选择章节</option>
						  		</select>
						  		<select class="combox form-control" id="iknowsselect">
						  			<option value="0">选择知识点</option>
						  		</select>
							</div>
						</div>
						<div class="form-group">
					  		<label class="control-label col-sm-2"></label>
					  		<div class="col-sm-9">
					  			<input type="button" class="btn btn-primary" value="选定" onclick="javascript:setKnowsList('questionknowsid','iknowsselect','+');"/>
					  			<input type="button" class="btn btn-danger" value="清除" onclick="javascript:setKnowsList('questionknowsid','iknowsselect','-');"/>
								<input type="button" class="btn btn-warning" value="储存" onclick="javascript:$.cookie('phpems-knowsselector',$('#questionknowsid').val());alert('储存成功');"/>
								<input type="button" class="btn btn-info" value="载入" onclick="javascript:$('#questionknowsid').val($.cookie('phpems-knowsselector'));"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="qrtype">题型：</label>
							<div class="col-sm-3">
							  	<select class="form-control" id="qrtype" needle="needle" msg="您必须为要添加的试题选择一种题型" name="args[qrtype]">
							  		{x2;tree:$questypes,questype,qid}
							  		<option rel="{x2;if:v:questype['questsort']}0{x2;else}{x2;v:questype['questchoice']}{x2;endif}" value="{x2;v:questype['questid']}"{x2;if:v:questype['questid'] == $question['qrtype']} selected{x2;endif}>{x2;v:questype['questype']}</option>
							  		{x2;endtree}
							  	</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="qrquestion">题干：</label>
						  	<div class="col-sm-10">
						  		<textarea id="qrquestion" class="ckeditor" name="args[qrquestion]" id="question">{x2;$question['qrquestion']}</textarea>
						  		<span class="help-block">需要填空处请以()表示。</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="qrlevel">难度：</label>
						  	<div class="col-sm-3">
							  	<select class="form-control" id="qrlevel" name="args[qrlevel]" needle="needle" msg="您必须为要添加的试题设置一个难度">
							  		<option value="1"{x2;if:$question['qrlevel']==1} selected{x2;endif}>易</option>
							  		<option value="2"{x2;if:$question['qrlevel']==2} selected{x2;endif}>中</option>
							  		<option value="3"{x2;if:$question['qrlevel']==3} selected{x2;endif}>难</option>
							  	</select>
							</div>
						</div>
						<div class="form-group">
						  	<label class="control-label col-sm-2" for="qrlevel"></label>
						  	<div class="col-sm-9">
							  	<button class="btn btn-primary" type="submit">提交</button>
							  	<input type="hidden" name="page" value="{x2;$page}"/>
							  	<input type="hidden" name="questionid" value="{x2;$question['qrid']}"/>
							  	<input type="hidden" name="insertquestion" value="1"/>
							  	{x2;tree:$search,arg,aid}
								<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
								{x2;endtree}
							</div>
						</div>
					</form>
				</div>
			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}