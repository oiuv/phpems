{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="margin-bottom:0px;">
				<div class="col-xs-12">
					<ol class="breadcrumb">
						<li><a href="index.php">首页</a></li>
						<li><a href="index.php?exam-app">考试</a></li>
						<li><a href="index.php?exam-app-basics">{x2;$data['currentbasic']['basic']}</a></li>
						<li><a href="index.php?exam-app-lesson">课后练习</a></li>
						<li class="active">{x2;$knows['knows']}（{x2;$questype['questype']}）</li>
						<span class="pull-right form-inline">
							去第 <input type="text" style="width:80px;" class="form-control" id="lessonnumber" placeholder=""> 题
							<button type="button" class="btn btn-primary" onclick="javascript:submitAjax({'url':'index.php?exam-app-lesson-ajax-questions&number='+$('#lessonnumber').val(),'target':'questionpanel'});">跳转</button>
						</span>
					</ol>
				</div>
			</div>
			<div class="box itembox" id="questionpanel" style="padding-top:20px;">
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="submodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">题型</h4>
			</div>
			<div class="modal-body">
				<form action="index.php?exam-app-lesson-reporterror" method="post" class="form-horizontal" style="padding:20px;" id="reporterrorform">
					<fieldset>
						<div class="form-group">
							<label class="control-label col-sm-3">错误类型：</label>
							<div class="col-sm-9">
								<select class="form-control" name="args[fbtype]" needle="needle" msg="请选择错误类型">
									<option value="答案错误">答案错误</option>
									<option value="题干错误">题干错误</option>
									<option value="知识点归类错误">知识点归类错误</option>
									<option value="图片错误">图片错误</option>
									<option value="解析错误">解析错误</option>
									<option value="其他">其他</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">详情描述：</label>
							<div class="col-sm-9">
								<textarea class="form-control" name="args[fbcontent]" style="height:8rem;" needle="needle" msg="请填写错误描述"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2"></label>
							<div class="col-sm-10">
								<button class="btn btn-primary hide btn-block" type="submit">提交</button>
								<input type="hidden" name="reporterror" value="1">
								<input type="hidden" name="args[fbquestionid]" value="" id="fbquestionid">
								<input type="hidden" name="page" value="">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:$('#reporterrorform').submit();">提交</button>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
<script type="text/javascript">
$(document).ready(function(){
	submitAjax({"url":"index.php?exam-app-lesson-ajax-questions","target":"questionpanel"});
});

function reporterror(id)
{
	$('#fbquestionid').val(id);
	$('#submodal').modal();
}
</script>
</body>
</html>