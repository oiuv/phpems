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
							<li><a href="index.php?{x2;$_app}-master-contents&page={x2;$page}">内容管理</a></li>
							<li class="active">移动分类</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
						移动分类
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-contents&catid={x2;$catid}&page={x2;$page}">内容管理</a>
					</h4>
					<form action="index.php?content-master-contents-lite" method="post" class="form-horizontal">
						<div class="form-group">
				            <label class="control-label col-sm-2">内容ID</label>
				            <div class="col-sm-4">
			        			<input class="form-control" type="text" name="contentids" value="{x2;$contentids}" needle="needle" msg="您必须输入标题" readonly>
				        	</div>
				        </div>
				        <div class="form-group">
		        			<label class="control-label col-sm-2">目标分类</label>
		        			<div class="col-sm-4">
			        			<select msg="您必须选择一个目标分类" needle="needle" class="autocombox form-control" name="targetcatid" refUrl="index.php?content-master-category-ajax-getchildcategory&catid={value}">
					            	<option value="">选择一级分类</option>
					            	{x2;tree:$parentcat,cat,cid}
					            	<option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
					            	{x2;endtree}
					            </select>
							</div>
				        </div>
				        <div class="form-group">
				            <label class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            <a class="btn btn-primary" href="index.php?content-master-contents&page={x2;$page}{x2;$u}">取消</a>
					            {x2;tree:$search,arg,sid}
					            <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
					            {x2;endtree}
					            <input type="hidden" name="movecategory" value="1">
					            <input type="hidden" name="catid" value="{x2;$catid}">
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