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
							<li><a href="index.php?{x2;$_app}-master-basic-subject">科目管理</a></li>
							<li><a href="index.php?{x2;$_app}-master-basic-section&subjectid={x2;$subjectid}&page={x2;$page}">科目管理</a></li>
							<li class="active">添加章节</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						添加章节
						<a class="btn btn-primary pull-right" href="index.php?exam-master-basic-section&subjectid={x2;$subjectid}&page={x2;$page}">章节管理</a>
					</h4>
					<form action="index.php?exam-master-basic-addsection" method="post" class="form-horizontal">
		    			<fieldset>
		    			<h4>{x2;$subjects[$subjectid]['subject']}</h4><hr />
						<div class="form-group">
							<label for="section" class="control-label col-sm-2">章节名称：</label>
							<div class="col-sm-9">
								<input class="form-control" id="section" name="args[section]" type="text" size="30" value="" needle="needle" msg="请输入章节名称" />
							</div>
						</div>
						<div class="form-group">
						  	<label class="control-label col-sm-2"></label>
						  	<div class="col-sm-9">
								<button class="btn btn-primary" type="submit">提交</button>
								<input type="hidden" name="insertsection" value="1"/>
								<input type="hidden" name="page" value="{x2;$page}"/>
								<input type="hidden" name="args[sectionsubjectid]" value="{x2;$subjectid}"/>
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