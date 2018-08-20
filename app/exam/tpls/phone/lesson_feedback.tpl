<div class="pagecontent">
	<header class="container-fluid" style="background-color:#337AB7;">
		<h5 class="text-center">
			<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
			<span class="ttlo">错题反馈</span>
			<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
		</h5>
	</header>
	<div style="clear:both" class="col-xs-12">
		<form action="index.php?exam-phone-lesson-reporterror" method="post" class="form-horizontal" style="padding:20px;">
			<fieldset>
				<div class="form-group">
					<label class="control-label col-sm-2">错误类型：</label>
					<div class="col-sm-10">
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
					<label class="control-label col-sm-2">详情描述：</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="args[fbcontent]" style="height:8rem;" needle="needle" msg="请填写错误描述"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2"></label>
					<div class="col-sm-10">
						<button class="btn btn-primary btn-block" type="submit">提交</button>
						<input type="hidden" name="reporterror" value="1"/>
						<input type="hidden" name="args[fbquestionid]" value="{x2;$questionid}"/>
						<input type="hidden" name="page" value="{x2;$page}"/>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>