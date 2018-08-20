			{x2;if:$question['questionid']}
			<h4 class="title">
				第{x2;$number}题
				<span class="pull-right">
					<a class="btn btn-primary qicon" onclick="javascript:favorquestion('{x2;$question['questionid']}');"><i class="glyphicon glyphicon-heart-empty"></i></a>
					<a class="btn btn-primary qicon" onclick="javascript:reporterror('{x2;$question['questionid']}');"><i class="glyphicon glyphicon-erase"></i></a>
				</span>
			</h4>
			<div class="choice">
				</a>{x2;realhtml:$question['question']}
			</div>
			{x2;if:!$questype['questsort']}
			{x2;if:$question['questionselect'] && $questype['questchoice'] != 5}
			<div class="choice">
            	{x2;realhtml:$question['questionselect']}
            </div>
            {x2;endif}
			<div class="selector">
            	{x2;if:$questype['questchoice'] == 1 || $questype['questchoice'] == 4}
                    {x2;tree:$selectorder,so,sid}
                    {x2;if:v:key == $question['questionselectnumber']}
                    {x2;eval: break;}
                    {x2;endif}
                    <label class="radio-inline"><input type="radio" name="question[{x2;$question['questionid']}]" rel="{x2;$question['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][$question['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
                    {x2;endtree}
                {x2;elseif:$questype['questchoice'] == 5}
                	<input type="text" style="width:100%;height:2em;" name="question[{x2;$question['questionid']}]" value="{x2;$sessionvars['examsessionuseranswer'][$question['questionid']]}" rel="{x2;$question['questionid']}"/>
                {x2;else}
                    {x2;tree:$selectorder,so,sid}
                    {x2;if:v:key >= $question['questionselectnumber']}
                    {x2;eval: break;}
                    {x2;endif}
                    <label class="checkbox-inline"><input type="checkbox" name="question[{x2;$question['questionid']}][{x2;v:key}]" rel="{x2;$question['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][$question['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
                    {x2;endtree}
                {x2;endif}
            </div>
			{x2;else}
			<div class="selector">
				{x2;eval: $dataid = $question['questionid']}
				<textarea class="jckeditor" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;$question['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
			</div>
			{x2;endif}
			<div class="choice" style="margin-top:20px;overflow:hidden;">
				<div class="btn-group hide answerbox pull-right">
            		{x2;if:$number > 1}
            		<a class="btn btn-primary ajax" target="questionpanel" href="index.php?{x2;$_app}-app-lesson-ajax-questions&number={x2;eval: echo intval($number - 1)}" title="上一题">上一题</a>
            		{x2;endif}
					<a class="btn btn-primary ajax" target="questionpanel" href="index.php?{x2;$_app}-app-lesson-ajax-questions&number={x2;eval: echo intval($number + 1)}" title="下一题">下一题</a>
            	</div>
            	<div class="btn-group pull-right">
            		<a class="btn btn-primary questionbtn" href="javascript:;" onclick="javascript:$('.questionbtn').addClass('hide');$('.answerbox').removeClass('hide');" title="查看答案">查看答案</a>
            	</div>
        	</div>
			<div class="answerbox hide" style="margin-top:1rem;">
				<table class="table table-hover table-bordered">
            		<tr class="info">
                		<td width="15%">正确答案：</td>
                		<td>{x2;realhtml:$question['questionanswer']}</td>
                	</tr>
                	<tr>
                		<td>答案解析：</td>
                		<td>{x2;realhtml:$question['questiondescribe']}</td>
                	</tr>
            	</table>
			</div>
			<div id="rightanswer_{x2;$question['questionid']}" class="hide">{x2;realhtml:$question['questionanswer']}</div>
			{x2;else}
			<h4 class="title">第{x2;$number}题{x2;$prenumer}</h4>
			<div class="choice">
				{x2;realhtml:$question['qrquestion']}
			</div>
			{x2;eval:v:tmpa = array();}
			{x2;tree:$question['data'],data,did}
			{x2;eval:v:tmpa[v:did] = v:data;}
			{x2;endtree}
			{x2;tree:$question['data'],data,did}
            <blockquote class="paperexamcontent_{x2;v:data['questionid']}" style="background:#FFFFFF;border-right:1px solid #CCCCCC;border-top:1px solid #CCCCCC;border-bottom:1px solid #CCCCCC;">
			<h4 class="title">
				第{x2;v:did}题
				<span class="pull-right">
					<a class="btn btn-primary qicon" onclick="javascript:favorquestion('{x2;v:data['questionid']}');"><i class="glyphicon glyphicon-heart-empty"></i></a>
					<a class="btn btn-primary qicon" onclick="javascript:reporterror('{x2;v:data['questionid']}');"><i class="glyphicon glyphicon-erase"></i></a>
					<a name="question_{x2;v:data['questionid']}"></a>
					<input id="time_{x2;v:data['questionid']}" type="hidden" name="time[{x2;v:data['questionid']}]"/>
				</span>
			</h4>
			<div class="choice">
				<a name="qrchild_{x2;v:data['questionid']}"></a>
				{x2;realhtml:v:data['question']}
			</div>
			{x2;if:!$questype['questsort']}
			{x2;if:v:data['questionselect'] && $questype['questchoice'] != 5}
			<div class="choice">
            	{x2;realhtml:v:data['questionselect']}
            </div>
            {x2;endif}
            <div class="selector questionanswerbox">
	        	{x2;if:$questype['questchoice'] == 1 || $questype['questchoice'] == 4}
	                {x2;tree:$selectorder,so,sid}
	                {x2;if:v:key == v:data['questionselectnumber']}
	                {x2;eval: break;}
	                {x2;endif}
	                <label class="radio-inline"><input type="radio" name="question[{x2;v:data['questionid']}]" rel="{x2;v:data['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:data['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
	                {x2;endtree}
	            {x2;elseif:$questype['questchoice'] == 5}
	            	<input type="text" class="form-control" name="question[{x2;v:data['questionid']}]" value="{x2;$sessionvars['examsessionuseranswer'][v:data['questionid']]}" rel="{x2;v:data['questionid']}"/>
	            {x2;else}
	                {x2;tree:$selectorder,so,sid}
	                {x2;if:v:key >= v:data['questionselectnumber']}
	                {x2;eval: break;}
	                {x2;endif}
	                <label class="checkbox-inline"><input type="checkbox" name="question[{x2;v:data['questionid']}][{x2;v:key}]" rel="{x2;v:data['questionid']}" value="{x2;v:so}" {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:data['questionid']])}checked{x2;endif}/>{x2;v:so} </label>
	                {x2;endtree}
	            {x2;endif}
	        </div>
			{x2;else}
			<div class="selector questionanswerbox">
				{x2;eval: $dataid = v:data['questionid']}
				<textarea class="jckeditor" etype="simple" id="editor{x2;$dataid}" name="question[{x2;$dataid}]" rel="{x2;v:data['questionid']}">{x2;realhtml:$sessionvars['examsessionuseranswer'][$dataid]}</textarea>
			</div>
			{x2;endif}
			<div class="choice" style="margin-top:20px;overflow:hidden;">
				<div class="btn-group pull-right hide answerbox">
	        		{x2;if:$number > 1}
	            		{x2;if:v:did == 1}
	            		<a class="btn btn-primary ajax" target="questionpanel" href="index.php?{x2;$_app}-app-lesson-ajax-questions&number={x2;eval: echo intval($number - $prenumber)}" title="上一题">上一题</a>
	            		{x2;else}
	            		<a class="btn btn-primary" href="#qrchild_{x2;eval: echo v:tmpa[v:did - 1]['questionid']}" title="上一题">上一题</a>
	            		{x2;endif}
	            	{x2;else}
	            		{x2;if:v:did > 1}
	            		<a class="btn btn-primary" href="#qrchild_{x2;eval: echo v:tmpa[v:did - 1]['questionid']}" title="上一题">上一题</a>
	            		{x2;endif}
	        		{x2;endif}
	        		{x2;if:v:did < count(v:tmpa)}
	        		<a class="btn btn-primary" href="#qrchild_{x2;eval: echo v:tmpa[v:did + 1]['questionid']}" title="下一题">下一题</a>
	        		{x2;else}
	            		{x2;if:(v:did + $number) < $allnumber}
						<a class="btn btn-primary ajax" target="questionpanel" href="index.php?{x2;$_app}-app-lesson-ajax-questions&number={x2;eval: echo intval($number + count(v:tmpa))}" title="下一题">下一题</a>
						{x2;endif}
					{x2;endif}
	        	</div>
	        	<div class="btn-group pull-right">
	        		<a class="btn btn-primary questionbtn" href="javascript:;" onclick="javascript:$('.paperexamcontent_{x2;v:data['questionid']}').find('.questionbtn').addClass('hide');$('.paperexamcontent_{x2;v:data['questionid']}').find('.answerbox').removeClass('hide');" title="查看答案">查看答案</a>
	        	</div>
	    	</div>
	    	<div id="rightanswer_{x2;v:data['questionid']}" class="hide">{x2;realhtml:v:data['questionanswer']}</div>
			<div class="answerbox hide" style="margin-top:1rem;">
				<table class="table table-hover table-bordered">
            		<tr class="info">
                		<td width="15%">正确答案：</td>
                		<td>{x2;realhtml:v:data['questionanswer']}</td>
                	</tr>
                	<tr>
                		<td>答案解析：</td>
                		<td>{x2;realhtml:v:data['questiondescribe']}</td>
                	</tr>
            	</table>
			</div>
		</div>
		</blockquote>
		{x2;endtree}
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