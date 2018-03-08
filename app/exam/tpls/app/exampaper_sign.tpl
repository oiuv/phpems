{x2;include:head}
<body>
<!--导航-->
{x2;include:nav}
<!--主体-->
<div id="main">
	<!--主体右侧 -->
	<div id="right_760" class="right_970">
    	{x2;include:bread}
    	<div class="bor_top"></div>
    	<div class="bor_mid">
            	<h2 class="page_title" style="line-height:0.5em;"><img src="app/exam/styles/image/shitiliebiao_tit.jpg" alt="试题列表" class="mr_10" /><span id="time_top">考试剩余时间：<b><span id="timer_h">00</span>：<span id="timer_m">00</span>：<span id="timer_s">00</span></b></span></h2>
                <div id="exam_page">
                	<p class="ta_r mb_10"><span class="mr_10"><i class="exam_icon_yes"></i>已答试题</span><span class="mr_10"><i class="exam_icon_no"></i>未答试题</span></p>
                	{x2;eval: v:oid = 0}
                	{x2;tree:$questype,quest,qid}
                	{x2;if:$sessionvars['examsessionquestion']['questions'][v:quest['questid']] || $sessionvars['examsessionquestion']['questionrows'][v:quest['questid']]}
	                {x2;eval: v:oid++}
	                <dl class="clear">
                    	<dt class="float_l"><b>{x2;v:quest['questype']}</b></dt>
                        <dd id="signcontent">
                        	{x2;eval: v:tid = 0}
			                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest['questid']],question,qnid}
			                {x2;eval: v:tid++}
                        	<a href="?exam-app-exampaper-paper#qtion_{x2;v:question['questionid']}" rel="_{x2;v:quest['questid']}-{x2;v:tid}" class="the {x2;if:$sessionvars['examsessionuseranswer'][v:question['questionid']]}yes {x2;endif}{x2;if:$sessionvars['examsessionsign'][v:question['questionid']]}mark{x2;endif}">{x2;v:tid}</a>
                        	{x2;endtree}
                        	{x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest['questid']],questionrow,qrid}
			                {x2;eval: v:tid++}
							{x2;eval: v:alreadydo = ''}
							{x2;eval: v:alreadymark = ''}
			                {x2;tree:v:questionrow['data'],data,did}
							{x2;if:$sessionvars['examsessionuseranswer'][v:data['questionid']]}{x2;eval: v:alreadydo = 'yes'}{x2;endif}
							{x2;if:$sessionvars['examsessionsign'][v:data['questionid']]}{x2;eval: v:alreadymark = 'mark'}{x2;endif}
							<a href="?exam-app-exampaper-paper#qtion_{x2;v:data['questionid']}" rel="_{x2;v:quest['questid']}-{x2;v:tid}" class="the {x2;if:$sessionvars['examsessionuseranswer'][v:data['questionid']]}yes {x2;endif}{x2;if:$sessionvars['examsessionsign'][v:data['questionid']]}mark{x2;endif}">{x2;v:tid}-{x2;v:did}</a>
			                {x2;endtree}
			                {x2;endtree}
                        </dd>
                    </dl>
                    {x2;endif}
                    {x2;endtree}
              </div>
              <div id="bnt_back_next"><a href="javascript:history.back(-1);" id="btn_back_l"></a></div>
    	</div>
    	<div class="bor_bottom"></div>
    	<form id="form2" name="form2" action="?exam-app-exampaper-score" style="display:none;" method="post">
    	</form>
    </div>
	<!--主体右侧 结束-->
	<!--尾部-->
	{x2;include:foot}
    <!--尾部 结束-->
</div>
<script type="text/javascript">
$(document).ready(function(){
$.get('?exam-app-index-ajax-lefttime&rand'+Math.random(),function(data){
		var setting = {
			time:{x2;$sessionvars['examsessiontime']},
			hbox:$("#timer_h"),
			mbox:$("#timer_m"),
			sbox:$("#timer_s"),
			finish:function(){$('#form2').submit();}
		}
		setting.lefttime = parseInt(data);
		countdown(setting);
	});
});
var subpaper = function()
{
	art.dialog({lock:true,resize:false,width:320,height:150,title:'交卷提醒',ok:function(){$('#form2').submit();},okval:'交卷',cancel:true,cancelval:'取消',content:'您确认要交卷吗？'});
}
</script>
</body>
</html>