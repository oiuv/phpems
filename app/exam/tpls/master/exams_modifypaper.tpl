{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
				{x2;include:menu}
			</div>
			<div class="col-xs-10" id="datacontent">
{x2;endif}
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
							<li><a href="index.php?exam-master-exams">试卷管理</a></li>
							<li class="active">修改即时试题</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						修改即时试题
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-exams&page={x2;$page}{x2;$u}">试卷管理</a>
					</h4>
					<form action="index.php?exam-master-exams-modifypaper" method="post" class="form-horizontal">
						<fieldset>
						<div class="form-group hide">
							<label class="control-label col-sm-2">题型：</label>
						  	<div class="col-sm-3">
							  	<select needle="needle" msg="您必须为要添加的试题选择一种题型" name="args[questiontype]" class="form-control combox" onchange="javascript:setAnswerHtml($(this).find('option:selected').attr('rel'),'answerbox');">
							  		{x2;tree:$questypes,questype,qid}
							  		<option rel="{x2;if:v:questype['questsort']}0{x2;else}{x2;v:questype['questchoice']}{x2;endif}" value="{x2;v:questype['questid']}"{x2;if:v:questype['questid'] == $question['questiontype']} selected{x2;endif}>{x2;v:questype['questype']}</option>
							  		{x2;endtree}
							  	</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">题干：</label>
						  	<div class="col-sm-10">
							  	<textarea class="ckeditor" name="args[question]" id="question">{x2;$question['question']}</textarea>
							  	<span class="help-block">需要填空处请以()表示。</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">备选项：</label>
						  	<div class="col-sm-10">
							  	<textarea class="ckeditor" name="args[questionselect]" id="questionselect">{x2;$question['questionselect']}</textarea>
							  	<span class="help-block">无选择项的请不要填写，如填空题、问答题等主观题。</span>
							</div>
						</div>
						<div class="form-group" id="selectnumber"{x2;if:$questypes[$question['questiontype']]['questsort']} style="display:none;"{x2;endif}>
							<label for="questionselectnumber" class="control-label col-sm-2">备选项数量：</label>
						  	<div class="col-sm-3">
							  	<select name="args[questionselectnumber]" id="questionselectnumber">
							  		<option value="0"{x2;if:$question['questionselectnumber'] == 0} selected{x2;endif}>0</option>
							  		<option value="2"{x2;if:$question['questionselectnumber'] == 2} selected{x2;endif}>2</option>
							  		<option value="4"{x2;if:$question['questionselectnumber'] == 4} selected{x2;endif}>4</option>
							  		<option value="5"{x2;if:$question['questionselectnumber'] == 5} selected{x2;endif}>5</option>
							  		<option value="6"{x2;if:$question['questionselectnumber'] == 6} selected{x2;endif}>6</option>
							  	</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">参考答案：</label>
							<div class="col-sm-9">
								<div id="answerbox_1" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 1 || $questypes[$question['questiontype']]['questsort']} style="display:none;"{x2;endif}>
								  	<label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="A"{x2;if:$question['questionanswer'] == 'A'} checked{x2;endif}>A</label>
								  	<label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="B"{x2;if:$question['questionanswer'] == 'B'} checked{x2;endif}>B</label>
								  	<label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="C"{x2;if:$question['questionanswer'] == 'C'} checked{x2;endif}>C</label>
								  	<label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="D"{x2;if:$question['questionanswer'] == 'D'} checked{x2;endif}>D</label>
								  	<label class="radio-inline"><input type="radio" name="targs[questionanswer1]" value="E"{x2;if:$question['questionanswer'] == 'E'} checked{x2;endif}>E</label>
								</div>
								<div id="answerbox_2" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 2} style="display:none;"{x2;endif}>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="A"{x2;if:strpos($question['questionanswer'],'A') !== false} checked{x2;endif}>A</label>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="B"{x2;if:strpos($question['questionanswer'],'B') !== false} checked{x2;endif}>B</label>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="C"{x2;if:strpos($question['questionanswer'],'C') !== false} checked{x2;endif}>C</label>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="D"{x2;if:strpos($question['questionanswer'],'D') !== false} checked{x2;endif}>D</label>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer2][]" value="E"{x2;if:strpos($question['questionanswer'],'E') !== false} checked{x2;endif}>E</label>
								</div>
								<div id="answerbox_3" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 3} style="display:none;"{x2;endif}>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="A"{x2;if:strpos($question['questionanswer'],'A') !== false} checked{x2;endif}>A</label>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="B"{x2;if:strpos($question['questionanswer'],'B') !== false} checked{x2;endif}>B</label>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="C"{x2;if:strpos($question['questionanswer'],'C') !== false} checked{x2;endif}>C</label>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="D"{x2;if:strpos($question['questionanswer'],'D') !== false} checked{x2;endif}>D</label>
								  	<label class="checkbox-inline"><input type="checkbox" name="targs[questionanswer3][]" value="E"{x2;if:strpos($question['questionanswer'],'E') !== false} checked{x2;endif}>E</label>
								</div>
								<div id="answerbox_4" class="col-sm-9"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 4} style="display:none;"{x2;endif}>
								  	<label class="radio-inline"><input type="radio" name="targs[questionanswer4]" value="A"{x2;if:$question['questionanswer'] == 'A'} checked{x2;endif}>对</label>
								  	<label class="radio-inline"><input type="radio" name="targs[questionanswer4]" value="B"{x2;if:$question['questionanswer'] == 'B'} checked{x2;endif}>错</label>
								</div>
								<div id="answerbox_0"{x2;if:!$questypes[$question['questiontype']]['questsort']} style="display:none;"{x2;endif} class="answerbox">
							  		<textarea cols="72" rows="7" class="ckeditor" id="questionanswer0" name="targs[questionanswer0]">{x2;$question['questionanswer']}</textarea>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">习题解析：</label>
						  	<div class="col-sm-10">
						  		<textarea class="ckeditor" name="args[questiondescribe]" id="questiondescribe">{x2;$question['questiondescribe']}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">难度：</label>
						  	<div class="col-sm-3">
							  	<select class="form-control combox" name="args[questionlevel]" needle="needle" msg="您必须为要添加的试题设置一个难度">
							  		<option value="1"{x2;if:$question['questionlevel']==1} selected{x2;endif}>易</option>
							  		<option value="2"{x2;if:$question['questionlevel']==2} selected{x2;endif}>中</option>
							  		<option value="3"{x2;if:$question['questionlevel']==3} selected{x2;endif}>难</option>
							  	</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2"></label>
						  	<div class="col-sm-9">
							  	<button class="btn btn-primary" type="submit">提交</button>
							  	<input type="hidden" name="page" value="{x2;$page}"/>
							  	<input type="hidden" name="examid" value="{x2;$examid}"/>
							  	<input type="hidden" name="questionid" value="{x2;$question['questionid']}"/>
							  	<input type="hidden" name="modifypaper" value="1"/>
							  	{x2;tree:$search,arg,aid}
								<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
								{x2;endtree}
							</div>
						</div>
						</fieldset>
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