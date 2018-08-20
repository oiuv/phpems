	<div class="pagecontent">
		<header class="container-fluid" style="background-color:#337AB7;">
			<h5 class="text-center">
				<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
				{x2;$knows['knows']}
				<em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
			</h5>
		</header>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="form-inline" style="padding:0.5rem;text-align: center;clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;margin-bottom:0.5rem;">
					共{x2;$allnumber}题，去第 <input type="text" style="width:80px;display:inline-block" class="form-control" id="lesson-number" placeholder=""> 题
					<button type="button" class="btn btn-primary" onclick="javascript:submitAjax({'url':'index.php?exam-app-lesson-ajax-questions&number='+$('#lesson-number').val(),'target':'lessonpaper-questionpanel'});">跳转</button>
				</div>
				<div id="lessonpaper-questionpanel" style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;margin-bottom:0.5rem;">
				</div>
			</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function(){
			submitAjax({"url":"index.php?exam-phone-lesson-ajax-questions","target":"lessonpaper-questionpanel"});
		});
		</script>
	</div>