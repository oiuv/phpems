	{x2;tree:$basic['basicconfig'][0],a2s0,a20id}
	<dl class="nowrap">
	  <dt>{x2;$questypes[v:a2s0]['questype']}：</dt>
	  <dd>
	  	<span class="info">共&nbsp;</span><input id="iselectallnumber_{x2;v:a2s0}" type="text" class="required digits" name="args[examsetting][questype][{x2;v:a2s0}][number]" value="" size="2"/><span class="info">&nbsp;题，每题&nbsp;</span><input class="required number" type="text" name="args[examsetting][questype][{x2;v:a2s0}][score]" value="" size="2"/>
	  	{x2;if:$type}
		<span class="info">&nbsp;分，已选<b id="ialreadyselectnumber_{x2;v:a2s0}">0</b>题（<a href="javascript:;" onclick="javascript:$.pdialog.open('?exam-teach-exams-selected&questionids='+$('#iselectquestions_{x2;v:a2s0}').val()+'&rowsquestionids='+$('#iselectrowsquestions_{x2;v:a2s0}').val(),'selectedquestions','已选试题',{width:580});">查看</a>），描述&nbsp;</span><input type="text" name="args[examsetting][questype][{x2;v:a2s0}][describe]" value="" size="12"/><span class="info">&nbsp;【<a href="javascript:;" onclick="javascript:if($('#iselectallnumber_{x2;v:a2s0}').val() == '' || !parseInt($('#iselectallnumber_{x2;v:a2s0}').val()) || parseInt($('#iselectallnumber_{x2;v:a2s0}').val()) < 1)alert('请先输入总题数！');else $.pdialog.open('?exam-teach-exams-selectquestions&search[questionsubjectid]={x2;$subjectid}&search[questiontype]={x2;v:a2s0}','selectquestions','选题',{max:true});">选题</a>】</span>
	  	<input type="hidden" value="" id="iselectquestions_{x2;v:a2s0}" name="args[examquestions][{x2;v:a2s0}][questions]" />
	  	<input type="hidden" value="" id="iselectrowsquestions_{x2;v:a2s0}" name="args[examquestions][{x2;v:a2s0}][rowsquestions]" />
	  	{x2;else}
	  	<span class="info">&nbsp;分，	描述&nbsp;</span><input type="text" name="args[examsetting][questype][{x2;v:a2s0}][describe]" value="" size="12"/><span class="info">&nbsp;难度：易&nbsp;</span><input class="required digits" type="text" name="args[examsetting][questype][{x2;v:a2s0}][easynumber]" value="" size="2"/>
	  	<span class="info">&nbsp;中&nbsp;</span><input class="required digits" type="text" name="args[examsetting][questype][{x2;v:a2s0}][middlenumber]" value="" size="2"/><span class="info">&nbsp;难&nbsp;</span><input class="required digits" type="text" name="args[examsetting][questype][{x2;v:a2s0}][hardnumber]" value="" size="2"/>
	  	{x2;endif}
	  </dd>
	</dl>
	{x2;endtree}
	{x2;tree:$basic['basicconfig'][1],a2s0,a20id}
	<dl class="nowrap">
	  <dt>{x2;$questypes[v:a2s0]['questype']}：</dt>
	  <dd>
	  	<span class="info">共&nbsp;</span><input id="iselectallnumber_{x2;v:a2s0}" class="required digits" type="text" name="args[examsetting][questype][{x2;v:a2s0}][number]" value="" size="2"/><span class="info">&nbsp;题，每题&nbsp;</span><input class="required number" type="text" name="args[examsetting][questype][{x2;v:a2s0}][score]" value="" size="2"/>
	  	{x2;if:$type}
		<span class="info">&nbsp;分，已选<b id="ialreadyselectnumber_{x2;v:a2s0}">0</b>题（<a href="javascript:;" onclick="javascript:$.pdialog.open('?exam-teach-exams-selected&questionids='+$('#iselectquestions_{x2;v:a2s0}').val()+'&rowsquestionids='+$('#iselectrowsquestions_{x2;v:a2s0}').val(),'selectedquestions','已选试题',{width:580});">查看</a>），描述&nbsp;</span><input type="text" name="args[examsetting][questype][{x2;v:a2s0}][describe]" value="" size="12"/><span class="info">&nbsp;【<a href="javascript:;" onclick="javascript:if($('#iselectallnumber_{x2;v:a2s0}').val() == '' || !parseInt($('#iselectallnumber_{x2;v:a2s0}').val()) || parseInt($('#iselectallnumber_{x2;v:a2s0}').val()) < 1)alert('请先输入总题数！');else $.pdialog.open('?exam-teach-exams-selectquestions&search[questionsubjectid]={x2;$subjectid}&search[questiontype]={x2;v:a2s0}','selectquestions','选题',{max:true});">选题</a>】</span>
	  	<input type="hidden" value="" id="iselectquestions_{x2;v:a2s0}" name="args[examquestions][{x2;v:a2s0}][questions]" />
	  	<input type="hidden" value="" id="iselectrowsquestions_{x2;v:a2s0}" name="args[examquestions][{x2;v:a2s0}][rowsquestions]" />
	  	{x2;else}
	  	<span class="info">&nbsp;分，	描述&nbsp;</span><input type="text" name="args[examsetting][questype][{x2;v:a2s0}][describe]" value="" size="12"/><span class="info">&nbsp;难度：易&nbsp;</span><input class="required digits" type="text" name="args[examsetting][questype][{x2;v:a2s0}][easynumber]" value="" size="2"/>
	  	<span class="info">&nbsp;中&nbsp;</span><input class="required digits" type="text" name="args[examsetting][questype][{x2;v:a2s0}][middlenumber]" value="" size="2"/><span class="info">&nbsp;难&nbsp;</span><input class="required digits" type="text" name="args[examsetting][questype][{x2;v:a2s0}][hardnumber]" value="" size="2"/>
	  	{x2;endif}
	  </dd>
	</dl>
	{x2;endtree}