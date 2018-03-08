{x2;include:head}
<body>
<!--导航-->
{x2;include:nav}
<!--主体-->
<div id="main">
	<!--主体左侧-->
	{x2;include:left}
	<!--主体右侧 -->
	<div id="right_760" class="right_970">
    	{x2;include:bread}
    	<div class="bor_top"></div>
    	<div class="bor_mid">
            <div id="notice">
            	<h2 class="page_title">
	            	<img src="app/exam/styles/image/xuanzekemu_tit.jpg" alt="选择考试科目" class="mr_10" />
	            	<span class=" font_12" style="color:#F18E1E;">机考模拟系统要求计算机浏览器为IE8、IE9、Chrome+、Safari4+或Firefox+版本！</span>
            	</h2>
                <div id="xuanzekemu">
                	{x2;tree:$data['opensubjects'],subject,sid}
                	<a href="javascript:;" onclick="javascript:selectSubject({x2;v:subject['subjectid']});">{x2;v:subject['subject']}</a>
                	{x2;endtree}
                </div>
            </div>
    	</div>
    	<div class="bor_bottom"></div>
    </div>
	<!--主体右侧 结束-->
{x2;include:foot}
<script type="text/javascript">
function selectSubject(sid)
{
	$.get("?exam-app-index-setCurrentSubject&subjectid="+sid+"&"+Math.random(),function(data){window.location.href="?exam-app-exam";});
}
</script>
</body>
</html>