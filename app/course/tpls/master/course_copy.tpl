{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			{x2;include:menu}
		</div>
		<div class="span10" id="datacontent">
{x2;endif}
			<ul class="breadcrumb">
				<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a> <span class="divider">/</span></li>
				<li><a href="index.php?{x2;$_app}-master-course&page={x2;$page}">内容管理</a> <span class="divider">/</span></li>
				<li class="active">复制内容</li>
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">复制内容</a>
				</li>
				<li class="pull-right">
					<a href="index.php?{x2;$_app}-master-course&page={x2;$page}{x2;$u}">内容管理</a>
				</li>
			</ul>
			<form action="index.php?course-master-course-lite" method="post" class="form-horizontal">
				<div class="control-group">
		            <label class="control-label">内容ID</label>
		            <div class="controls">
	        			<input type="text" name="courseids" value="{x2;$courseids}" needle="needle" msg="您必须输入标题" readonly>
		        	</div>
		        </div>
		        <div class="control-group">
        			<label class="control-label">目标分类</label>
        			<div class="controls">
	        			<select msg="您必须选择一个目标分类" needle="needle" class="autocombox input-medium" name="targetcatid" refUrl="index.php?course-master-category-ajax-getchildcategory&catid={value}">
			            	<option value="">选择一级分类</option>
			            	{x2;tree:$parentcat,cat,cid}
			            	<option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
			            	{x2;endtree}
			            </select>
					</div>
		        </div>
		        <div class="control-group">
		            <div class="controls">
			            <button class="btn btn-primary" type="submit">提交</button>
			            <a class="btn btn-primary" href="index.php?course-master-course&page={x2;$page}{x2;$u}">取消</a>
			            {x2;tree:$search,arg,sid}
			            <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
			            {x2;endtree}
			            <input type="hidden" name="copycategory" value="1">
			            <input type="hidden" name="catid" value="{x2;$catid}">
					</div>
		        </div>
			</form>
{x2;if:!$userhash}
		</div>
	</div>
</div>
</body>
</html>
{x2;endif}