{x2;include:header}
<body>
{x2;include:nav}
<div aria-hidden="true" id="modal" class="modal hide fade" role="dialog" aria-labelledby="#myModalLabel">
	<div class="modal-header">
		<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
		<h3 id="myModalLabel">
			试题列表
		</h3>
	</div>
	<div class="modal-body" id="modal-body" style="max-height:560px;">
		{x2;eval: v:oid = 0}
		{x2;eval: v:qmid = 0}
    	{x2;tree:$questype,quest,qid}
    	{x2;if:$sessionvars['examsessionquestion']['questions'][v:quest['questid']] || $sessionvars['examsessionquestion']['questionrows'][v:quest['questid']]}
        {x2;eval: v:oid++}
        <dl class="clear">
        	<dt class="float_l"><b>{x2;v:oid}、{x2;v:quest['questype']}</b></dt>
            <dd>
            	{x2;eval: v:tid = 0}
                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest['questid']],question,qnid}
                {x2;eval: v:tid++}
                {x2;eval: v:qmid++}
            	<a id="sign_{x2;v:question['questionid']}" href="javascript:;" onclick="javascript:gotoquestion({x2;v:question['questionid']},{x2;v:quest['questid']},false);" rel="0" class="badge questionindex{x2;if:$sessionvars['examsessionsign'][v:question['questionid']]} signBorder{x2;endif}">{x2;v:tid}</a>
            	{x2;endtree}
            	{x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest['questid']],questionrow,qrid}
                {x2;eval: v:tid++}
                {x2;eval: v:qmid++}
                {x2;tree:v:questionrow['data'],data,did}
				<a id="sign_{x2;v:data['questionid']}" href="javascript:;" onclick="javascript:gotoquestion({x2;v:questionrow['qrid']},{x2;v:quest['questid']},true);" rel="0" class="badge questionindex{x2;if:$sessionvars['examsessionsign'][v:data['questionid']]} signBorder{x2;endif}">{x2;v:tid}-{x2;v:did}</a>
                {x2;endtree}
                {x2;endtree}
            </dd>
        </dl>
        {x2;endif}
        {x2;endtree}
	</div>
	<div class="modal-footer">
		 <button aria-hidden="true" class="btn" data-dismiss="modal">隐藏</button>
	</div>
</div>
<div class="row-fluid">
	<div class="container-fluid examcontent">
		<div class="exambox" id="datacontent">
			<form class="examform form-horizontal" id="form1" name="form1" action="index.php?exam-app-exampaper-score">
				<ul class="breadcrumb">
					<li>
						<span class="icon-home"></span> <a href="index.php?exam">考场选择</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="index.php?exam-app-exam">正式考试</a> <span class="divider">/</span>
					</li>
					<li class="active">
						{x2;$sessionvars['examsession']}
					</li>
				</ul>
				<h3 class="text-center">{x2;$sessionvars['examsession']}</h3>
				{x2;eval: v:oid = 0}
				{x2;eval: v:qcid = 0}
				{x2;tree:$questype,quest,qid}
				{x2;if:$sessionvars['examsessionquestion']['questions'][v:quest['questid']] || $sessionvars['examsessionquestion']['questionrows'][v:quest['questid']]}
				{x2;eval: v:oid++}
				<div id="panel-type-{x2;v:quest['questid']}" class="questionpanel tab-pane{x2;if:(!$ctype && v:qid == 1) || ($ctype == v:quest['questid'])} active{x2;endif}">
					<ul class="breadcrumb">
						<li>
							<h5>{x2;v:oid}、{x2;v:quest['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest['questid']]['describe']}</h5>
						</li>
					</ul>
					{x2;eval: v:tid = 0}
	                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest['questid']],question,qnid}
	                {x2;eval: v:tid++}
	                {x2;eval: v:qcid++}
	                <div id="question_{x2;v:question['questionid']}" class="paperexamcontent">
						<div class="media well">
							<ul class="nav nav-tabs">
								<li class="active">
									<span class="badge badge-info questionindex">{x2;v:tid}</span></a>
								</li>
								<li class="btn-group pull-right">
									<button class="btn" type="button" onclick="javascript:signQuestion('{x2;v:question['questionid']}',this);"><em class="{x2;if:$sessionvars['examsessionsign'][v:question['questionid']]}icon-star{x2;else}icon-star-empty{x2;endif}" title="标注"></em></button>
								</li>
							</ul>
							<div class="media-body well text-warning">
								<a name="question_{x2;v:question['questionid']}"></a>{x2;realhtml:v:question['question']}
							</div>
							{x2;if:!v:quest['questsort']}
							<div class="media-body well">
		                    	{x2;realhtml:v:question['questionselect']}
		                    </div>
							<div class="media-body well">
		                    	{x2;if:v:quest['questchoice'] == 1 || v:quest['questchoice'] == 4}
			                        {x2;tree:$selectorder,so,sid}
			                        {x2;if:v:key == v:question['questionselectnumber']}
			                        {x2;eval: break;}
			                        {x2;endif}
			                        <label class="radio inline"><input type="radio" name="question[{x2;v:question['questionid']}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:question['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
			                        {x2;endtree}
		                        {x2;else}
			                        {x2;tree:$selectorder,so,sid}
			                        {x2;if:v:key >= v:question['questionselectnumber']}
			                        {x2;eval: break;}
			                        {x2;endif}
			                        <label class="checkbox inline"><input type="checkbox" name="question[{x2;v:question['questionid']}][{x2;v:key}]" rel="{x2;v:question['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:question['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
			                        {x2;endtree}
		                        {x2;endif}
		                    </div>
							{x2;else}
							<div class="media-body well">
								{x2;eval: $dataid = v:question['questionid']}
								<textarea class="jckeditor" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;v:question['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
							</div>
							{x2;endif}
							<div class="media-body well">
								<div class="btn-group pull-right">
				            		{x2;if:v:qcid > 1}
				            		<a class="btn" href="javascript:;" onclick="javascript:gotoindexquestion({x2;eval: echo v:qcid - 2},{x2;v:quest['questid']});" title="上一题">上一题</a>
				            		{x2;endif}
				            		{x2;if:v:qcid < v:qmid}
				            		<a class="btn" href="javascript:;" onclick="javascript:gotoindexquestion({x2;v:qcid},{x2;v:quest['questid']});" title="下一题">下一题</a>
									{x2;endif}
				            	</div>
			            	</div>
						</div>
					</div>
					{x2;endtree}
					{x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest['questid']],questionrow,qrid}
	                {x2;eval: v:tid++}
	                {x2;eval: v:qid++}
	                <div id="questionrow_{x2;v:questionrow['qrid']}" class="paperexamcontent">
						<div class="media well">
							<ul class="nav nav-tabs">
								<li class="active">
									<span class="badge badge-info questionindex">{x2;v:tid}</span>
								</li>
							</ul>
							<div class="media-body well">
								{x2;realhtml:v:questionrow['qrquestion']}
							</div>
							{x2;tree:v:questionrow['data'],data,did}
							<div>
								<ul class="nav nav-tabs">
									<li class="active">
										<span class="badge questionindex">{x2;v:did}</span></a>
									</li>
									<li class="btn-group pull-right">
										<button class="btn" type="button" onclick="javascript:signQuestion('{x2;v:data['questionid']}',this);"><em class="{x2;if:$sessionvars['examsessionsign'][v:data['questionid']]}icon-star{x2;else}icon-star-empty{x2;endif}" title="标注"></em></button>
									</li>
								</ul>
								<div class="media-body well text-warning">
									<a name="question_{x2;v:data['questionid']}"></a>{x2;realhtml:v:data['question']}
								</div>
								{x2;if:!v:quest['questsort']}
								<div class="media-body well">
			                    	{x2;realhtml:v:data['questionselect']}
			                    </div>
								<div class="media-body well">
			                    	{x2;if:v:quest['questchoice'] == 1 || v:quest['questchoice'] == 4}
				                        {x2;tree:$selectorder,so,sid}
				                        {x2;if:v:key == v:data['questionselectnumber']}
				                        {x2;eval: break;}
				                        {x2;endif}
				                        <label class="radio inline"><input type="radio" name="question[{x2;v:data['questionid']}]" rel="{x2;v:data['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:data['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
				                        {x2;endtree}
			                        {x2;else}
				                        {x2;tree:$selectorder,so,sid}
				                        {x2;if:v:key >= v:data['questionselectnumber']}
				                        {x2;eval: break;}
				                        {x2;endif}
				                        <label class="checkbox inline"><input type="checkbox" name="question[{x2;v:data['questionid']}][{x2;v:key}]" rel="{x2;v:data['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:data['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
				                        {x2;endtree}
			                        {x2;endif}
			                    </div>
								{x2;else}
								<div class="media-body well">
									{x2;eval: $dataid = v:data['questionid']}
									<textarea class="jckeditor" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;v:data['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
								</div>
								{x2;endif}
							</div>
							<div class="media-body well">
								<div class="btn-group pull-right">
				            		{x2;if:v:qcid > 1}
				            		<a class="btn" href="javascript:;" onclick="javascript:gotoindexquestion({x2;eval: echo v:qcid - 2},{x2;v:quest['questid']});" title="上一题">上一题</a>
				            		{x2;endif}
				            		{x2;if:v:qcid < v:qmid}
				            		<a class="btn" href="javascript:;" onclick="javascript:gotoindexquestion({x2;v:qcid},{x2;v:quest['questid']});" title="下一题">下一题</a>
									{x2;endif}
				            	</div>
			            	</div>
							{x2;endtree}
						</div>
					</div>
					{x2;endtree}
				</div>
				{x2;endif}
				{x2;endtree}
				<div aria-hidden="true" id="submodal" class="modal hide fade" role="dialog" aria-labelledby="#mySubModalLabel">
					<div class="modal-header">
						<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
						<h3 id="mySubModalLabel">
							交卷
						</h3>
					</div>
					<div class="modal-body" id="modal-body" style="max-height:100%;">
						<p>共有试题 <span class="allquestionnumber">50</span> 题，已做 <span class="yesdonumber">0</span> 题。您确认要交卷吗？</p>
					</div>
					<div class="modal-footer">
						 <button onclick="javascript:submitPaper();" class="btn btn-primary">确定交卷</button>
						 <input type="hidden" name="insertscore" value="1"/>
						 <button aria-hidden="true" class="btn" data-dismiss="modal">再检查一下</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="row-fluid">
	<div class="toolcontent">
		<div class="container-fluid footcontent">
			<div class="span2">
				<ul class="unstyled">
					<li><h4><img src="app/core/styles/images/icons/Watches.png" style="width:1.3em;"/> <span id="timer_h">00</span>：<span id="timer_m">00</span>：<span id="timer_s">00</span></h4></li>
				</ul>
			</div>
			<div class="span2">
				<ul class="unstyled">
					<li><h6><a href="#top"><em class="icon-circle-arrow-up"></em>回顶部</a> &nbsp; <a href="#modal" data-toggle="modal"><em class="icon-calendar"></em>试题列表</a></h6></li>
				</ul>
			</div>
			<div class="span6">
				<ul class="unstyled">
					<li><h6>已做 <span class="yesdonumber">0</span> 题 共 <span class="allquestionnumber">50</span> 题 总分：<span class="orange">{x2;$sessionvars['examsessionsetting']['examsetting']['score']}</span>分 合格分数线：<span class="orange">{x2;$sessionvars['examsessionsetting']['examsetting']['passscore']}</span>分 考试时间：<span class="orange">{x2;$sessionvars['examsessionsetting']['examsetting']['examtime']}</span>分钟</h6></li>
				</ul>
			</div>
			<div class="span2">
				<ul class="unstyled">
					<li class="text-right"><a href="#submodal" role="button" class="btn btn-primary" data-toggle="modal"> 交 卷 </a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function gotoquestion(questid,questypeid,qtype)
{
	$(".questionpanel").hide();
	$(".paperexamcontent").hide();
	$("#panel-type-"+questypeid).show();
	if(qtype)
	$("#questionrow_"+questid).show();
	else
	$("#question_"+questid).show();
	$('#modal').modal('hide');
}
function gotoindexquestion(index)
{
	$(".questionpanel").hide();
	$(".paperexamcontent").hide();
	$(".paperexamcontent").eq(index).show();
	$(".paperexamcontent").eq(index).parents(".questionpanel").show();
}
$(document).ready(function(){
	$.get('index.php?exam-app-index-ajax-lefttime&rand'+Math.random(),function(data){
		var setting = {
			{x2;if:$data['currentbasic']['basicexam']['opentime']['start'] && $data['currentbasic']['basicexam']['opentime']['end']}
			{x2;if:$data['currentbasic']['basicexam']['opentime']['end']-300 <= ($sessionvars['examsessiontime'] * 60 + $sessionvars['examsessionstarttime'])}
			time:{x2;eval: echo intval(($data['currentbasic']['basicexam']['opentime']['end']- 300 - $sessionvars['examsessionstarttime'])/60)},
			{x2;else}
			time:{x2;$sessionvars['examsessiontime']},
			{x2;endif}
			{x2;else}
			time:{x2;$sessionvars['examsessiontime']},
			{x2;endif}
			hbox:$("#timer_h"),
			mbox:$("#timer_m"),
			sbox:$("#timer_s"),
			finish:function(){submitPaper();}
		}
		setting.lefttime = parseInt(data);
		countdown(setting);
	});

	var m = function(){
		$(".questionpanel").hide();
		$(".questionpanel:first").show();
		$(".paperexamcontent").hide();
		$(".paperexamcontent:first").show();
	};
	m();
	setInterval(refreshRecord,5000);
	setInterval(saveanswer,300000);

	$('.allquestionnumber').html($('.paperexamcontent').length);
	$('.yesdonumber').html($('#modal-body .badge-info').length);

	initData = $.parseJSON(storage.getItem('questions'));
	if(initData){
		for(var p in initData){
			if(p!='set')
			formData[p]=initData[p];
		}

		var textarea = $('#form1 textarea');
		$.each(textarea,function(){
			var _this = $(this);
			_this.val(initData[_this.attr('name')]);
			CKEDITOR.instances[_this.attr('id')].setData(initData[_this.attr('name')]);
			if(initData[_this.attr('name')] && initData[_this.attr('name')] != '')
			batmark(_this.attr('rel'),initData[_this.attr('name')]);
		});

		var texts = $('#form1 :input[type=text]');
		$.each(texts,function(){
			var _this = $(this);
			_this.val(initData[_this.attr('name')]);
			if(initData[_this.attr('name')] && initData[_this.attr('name')] != '')
			batmark(_this.attr('rel'),initData[_this.attr('name')]);
		});

		var radios = $('#form1 :input[type=radio]');
		$.each(radios,function(){
			var _= this, v = initData[_.name];
			var _this = $(this);
			if(v!=''&&v==_.value){
				_.checked = true;
				batmark(_this.attr('rel'),initData[_this.attr('name')]);
			}else{
				_.checked=false;
			}
		});

		var checkboxs=$('#form1 :input[type=checkbox]');
		$.each(checkboxs,function(){
			var _=this,v=initData[_.name];
			var _this = $(this);
			if(v!=''&&v==_.value){
				_.checked=true;
				batmark(_this.attr('rel'),initData[_this.attr('name')]);
			}else{
				_.checked=false;
			}
		});
	}

	$('#form1 :input[type=text]').change(function(){
		var _this=$(this);
		var p=[];
		p.push(_this.attr('name'));
		p.push(_this.val());
		set.apply(formData,p);
		markQuestion(_this.attr('rel'));
	});

	$('#form1 :input[type=radio]').change(function(){
		var _=this;
		var _this=$(this);
		var p=[];
		p.push(_.name);
		if(_.checked){
			p.push(_.value);
			set.apply(formData,p);
		}else{
			p.push('');
			set.apply(formData,p);
		}
		markQuestion(_this.attr('rel'));
	});

	$('#form1 textarea').change(function(){
		var _= this;
		var _this=$(this);
		var p=[];
		p.push(_.name);
		p.push(_.value);
		set.apply(formData,p);
		markQuestion(_this.attr('rel'));
	});

	$('#form1 :input[type=checkbox]').change(function(){
		var _= this;
		var _this = $(this);
		var p=[];
		p.push(_.name);
		if(_.checked){
			p.push(_.value);
			set.apply(formData,p);
		}else{
			p.push('');
			set.apply(formData,p);
		}
		markQuestion(_this.attr('rel'));
	});
});
</script>
{x2;include:foot}
</body>
</html>