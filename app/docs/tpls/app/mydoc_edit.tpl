{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-12" id="datacontent">
{x2;endif}
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php">首页</a></li>
							<li><a href="index.php?docs-app-docs&docid={x2;$doc['docid']}">{x2;$doc['doctitle']}</a></li>
							<li class="active">编辑词条</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
						编辑词条
					</h4>
					{x2;if:$history}
					<p class="alert alert-danger" style="margin-top: 15px;">您有未审核通过的协作版本，本词编辑将基于此版本修改！</p>
					{x2;endif}
					<form action="index.php?docs-app-mydoc-edit" method="post" class="form-horizontal">
				    	<div class="form-group">
				            <label for="contenttext" class="control-label col-sm-2">词条内容</label>
				            <div class="col-sm-10">
							    <textarea id="dhcontent" rows="7" cols="4" attr-height="480" class="jckeditor" name="args[dhcontent]">{x2;realhtml:$doc['content']['dhcontent']}</textarea>
					        </div>
				        </div>
						<div class="form-group">
							<label for="contenttitle" class="control-label col-sm-2">修改日志</label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="dhtitle" name="args[dhtitle]" needle="needle" msg="您必须输入标题" value="{x2;$doc['content']['dhtitle']}">
							</div>
						</div>
				        <div class="form-group">
				            <label for="contenttemplate" class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            <input type="hidden" name="submit" value="1">
								<input type="hidden" name="docid" value="{x2;$doc['docid']}">
					        </div>
				        </div>
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