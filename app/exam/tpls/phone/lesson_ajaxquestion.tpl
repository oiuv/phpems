			{x2;if:$question['questionid']}
			<h4 class="title">
				第{x2;$number}题
				<span class="pull-right">
					<a class="btn text-primary qicon ajax" href="index.php?exam-phone-lesson-reporterror&questionid={x2;$question['questionid']}" data-target="reporterror" data-page="reporterror"><i class="glyphicon glyphicon-erase"></i></a>
					<a class="btn text-primary qicon" onclick="javascript:favorquestion('{x2;$question['questionid']}');"><i class="glyphicon glyphicon-heart-empty"></i></a>
				</span>
			</h4>
			<div class="choice">
				</a>{x2;realhtml:$question['question']}
			</div>
			{x2;if:!$questype['questsort']}
			{x2;if:$question['questionselect'] && $questype['questchoice'] != 5}
			<div class="choice" style="padding-bottom:0.5rem;">
            	{x2;realhtml:$question['questionselect']}
            </div>
            {x2;endif}
			<div class="selector">
            	{x2;if:$questype['questchoice'] == 1 || $questype['questchoice'] == 4}
                    {x2;tree:$selectorder,so,sid}
                    {x2;if:v:key == $question['questionselectnumber']}
                    {x2;eval: break;}
                    {x2;endif}
                    <label class="radio-inline" style="line-height:2.8rem;"><input type="radio" name="question[{x2;$question['questionid']}]" rel="{x2;$question['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][$question['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
                    {x2;endtree}
                {x2;elseif:$questype['questchoice'] == 5}
                	<input type="text" style="width:100%;height:2em;" name="question[{x2;$question['questionid']}]" value="{x2;$sessionvars['examsessionuseranswer'][$question['questionid']]}" rel="{x2;$question['questionid']}"/>
                {x2;else}
                    {x2;tree:$selectorder,so,sid}
                    {x2;if:v:key >= $question['questionselectnumber']}
                    {x2;eval: break;}
                    {x2;endif}
                    <label class="checkbox-inline" style="line-height:2.8rem;"><input type="checkbox" name="question[{x2;$question['questionid']}][{x2;v:key}]" rel="{x2;$question['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][$question['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
                    {x2;endtree}
                {x2;endif}
            </div>
			{x2;else}
			<div class="selector">
				{x2;eval: $dataid = $question['questionid']}
				<textarea class="jckeditors form-control" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;$question['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
			</div>
			{x2;endif}
			<div class="choice" style="margin-top:20px;overflow:hidden;">
				<div class="btn-group hide answerbox pull-right">
            		{x2;if:$number > 1}
            		<a class="btn btn-primary ajax" data-target="lessonpaper-questionpanel" href="index.php?{x2;$_app}-phone-lesson-ajax-questions&number={x2;eval: echo intval($number - 1)}" title="上一题">上一题</a>
            		{x2;endif}
					<a class="btn btn-primary ajax" data-target="lessonpaper-questionpanel" href="index.php?{x2;$_app}-phone-lesson-ajax-questions&number={x2;eval: echo intval($number + 1)}" title="下一题">下一题</a>
            	</div>
            	<div class="btn-group pull-right">
            		<a class="btn btn-primary questionbtn" href="javascript:;" onclick="javascript:$('.questionbtn').addClass('hide');$('.answerbox').removeClass('hide');" title="查看答案">查看答案</a>
            	</div>
        	</div>
			<div class="answerbox hide" style="border-left:10px solid #CCCCCC;margin-top:20px;">
				<table class="table table-hover table-bordered">
            		<tr class="info">
                		<td width="20%">答案</td>
                		<td>{x2;realhtml:$question['questionanswer']}</td>
                	</tr>
                	<tr>
                		<td>解析</td>
                		<td>{x2;realhtml:$question['questiondescribe']}</td>
                	</tr>
            	</table>
			</div>
			<div id="rightanswer_{x2;$question['questionid']}" class="hide">{x2;realhtml:$question['questionanswer']}</div>
			{x2;else}
			<h4 class="title">
				第{x2;$number}题
				<span class="pull-right">
					<a class="btn text-primary qicon ajax" href="index.php?exam-phone-lesson-reporterror&questionid={x2;$vquestion['questionid']}" data-target="reporterror" data-page="reporterror"><i class="glyphicon glyphicon-erase"></i></a>
					<a class="btn text-primary qicon" onclick="javascript:favorquestion('{x2;$vquestion['questionid']}');"><i class="glyphicon glyphicon-heart-empty"></i></a>
					<a name="question_{x2;$vquestion['questionid']}"></a>
					<input id="time_{x2;$vquestion['questionid']}" type="hidden" name="time[{x2;$vquestion['questionid']}]"/>
				</span>
			</h4>
			<div class="choice">
				{x2;realhtml:$question['qrquestion']}
			</div>
			<hr />
            <div class="paperexamcontent_{x2;$vquestion['questionid']} form-horizontal" style="padding:0rem 1.5rem;">
				<div class="choice">
					<a name="qrchild_{x2;$vquestion['questionid']}"></a>
					{x2;realhtml:$vquestion['question']}
				</div>
				{x2;if:!$questype['questsort']}
				{x2;if:$vquestion['questionselect'] && $questype['questchoice'] != 5}
				<div class="choice" style="padding-bottom:0.5rem;">
	            	{x2;realhtml:$vquestion['questionselect']}
	            </div>
	            {x2;endif}
	            <div class="selector questionanswerbox">
		        	{x2;if:$questype['questchoice'] == 1 || $questype['questchoice'] == 4}
		                {x2;tree:$selectorder,so,sid}
		                {x2;if:v:key == $vquestion['questionselectnumber']}
		                {x2;eval: break;}
		                {x2;endif}
		                <label class="radio-inline" style="line-height:2.8rem;"><input type="radio" name="question[{x2;$vquestion['questionid']}]" rel="{x2;$vquestion['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][$vquestion['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
		                {x2;endtree}
		            {x2;elseif:$questype['questchoice'] == 5}
		            	<input type="text" class="form-control" name="question[{x2;$vquestion['questionid']}]" value="{x2;$sessionvars['examsessionuseranswer'][$vquestion['questionid']]}" rel="{x2;$vquestion['questionid']}"/>
		            {x2;else}
		                {x2;tree:$selectorder,so,sid}
		                {x2;if:v:key >= $vquestion['questionselectnumber']}
		                {x2;eval: break;}
		                {x2;endif}
		                <label class="checkbox-inline" style="line-height:2.8rem;"><input type="checkbox" name="question[{x2;$vquestion['questionid']}][{x2;v:key}]" rel="{x2;$vquestion['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][$vquestion['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
		                {x2;endtree}
		            {x2;endif}
		        </div>
				{x2;else}
				<div class="selector questionanswerbox">
					{x2;eval: $dataid = $vquestion['questionid']}
					<textarea class="jckeditors form-control" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;$vquestion['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
				</div>
				{x2;endif}
				<div class="choice" style="margin-top:20px;overflow:hidden;">
					<div class="btn-group pull-right hide answerbox">
		            		{x2;if:$number > 1}
		            		<a class="btn btn-primary ajax" action-pageant="pre" data-target="lessonpaper-questionpanel" href="index.php?{x2;$_app}-phone-lesson-ajax-questions&number={x2;eval: echo intval($number - 1)}" title="上一题">上一题</a>
		            		{x2;endif}
		            		{x2;if:(v:did + $number) < $allnumber}
							<a class="btn btn-primary ajax" data-target="lessonpaper-questionpanel" href="index.php?{x2;$_app}-phone-lesson-ajax-questions&number={x2;eval: echo intval($number + 1)}" title="下一题">下一题</a>
							{x2;endif}
		        	</div>
		        	<div class="btn-group pull-right">
		        		<a class="btn btn-primary questionbtn" href="javascript:;" onclick="javascript:$('.paperexamcontent_{x2;$vquestion['questionid']}').find('.questionbtn').addClass('hide');$('.paperexamcontent_{x2;$vquestion['questionid']}').find('.answerbox').removeClass('hide');" title="查看答案">查看答案</a>
		        	</div>
		    	</div>
		    	<div id="rightanswer_{x2;$vquestion['questionid']}" class="hide">{x2;realhtml:$vquestion['questionanswer']}</div>
				<div class="answerbox hide" style="margin-top:20px;">
					<table class="table table-hover table-bordered">
	            		<tr class="info">
	                		<td width="20%">答案</td>
	                		<td>{x2;realhtml:$vquestion['questionanswer']}</td>
	                	</tr>
	                	<tr>
	                		<td>解析</td>
	                		<td>{x2;realhtml:$vquestion['questiondescribe']}</td>
	                	</tr>
	            	</table>
				</div>
			</div>
		</div>
		{x2;endif}
		<script type="text/javascript">
			$("input:radio").click(function(){
				var _this = $(this);
				var qid = _this.attr('rel');
				_this.parents('.selector').parent().find('.questionbtn').addClass('hide');
				_this.parents('.selector').parent().find('.answerbox').removeClass('hide');
				if(_this.val() == $("#rightanswer_"+qid).html())
				{
					_this.parents('.selector').addClass('alert-success').addClass('alert').html('恭喜您回答正确！');
				}
				else
				{
					_this.parents('.selector').addClass('alert-danger').addClass('alert').html('回答错误，正确答案为：'+$("#rightanswer_"+qid).html()+'，您选择的答案是：'+_this.val());
				}
			});
		</script>