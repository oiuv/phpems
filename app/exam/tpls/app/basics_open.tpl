{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
{x2;endif}
<div class="container-fluid" id="datacontent">
	<div class="row-fluid">
		<div class="main box itembox">
			<h4 class="title" style="padding:10px;">考场列表<a href="index.php?exam-app" class="btn btn-primary pull-right"><em class="glyphicon glyphicon-tasks"></em> 我的考场</a></h4>
			<form class="col-xs-12 form-inline" style="padding-left:0px;" action="index.php?exam-app-basics-open">
				<table class="table table-striped">
					<tr>
						<td>
							<label>是否免费：</label>
						</td>
						<td>
							<select name="search[basicdemo]" class="form-control">
								<option value="0">不限</option>
								<option value="1"{x2;if:$search['basicdemo']} selected{x2;endif}>免费</option>
							</select>
						</td>
						<td>
							<label>关键字：</label>
						</td>
						<td>
							<input class="form-control" name="search[keyword]" type="text" value="{x2;$search['keyword']}" />
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<label>地区：</label>
						</td>
						<td>
							<select name="search[basicareaid]" class="form-control">
								<option value="0">选择地区</option>
								{x2;tree:$areas,area,aid}
						  		<option value="{x2;v:area['areaid']}"{x2;if:v:area['areaid'] == $search['basicareaid']} selected{x2;endif}>{x2;v:area['area']}</option>
						  		{x2;endtree}
							</select>
						</td>
						<td>
							<label>科目：</label>
						</td>
						<td>
							<select name="search[basicsubjectid]" class="form-control">
								<option value="0">选择科目</option>
								{x2;tree:$subjects,subject,sid}
						  		<option value="{x2;v:subject['subjectid']}"{x2;if:v:subject['subjectid'] == $search['basicsubjectid']} selected{x2;endif}>{x2;v:subject['subject']}</option>
						  		{x2;endtree}
							</select>
						</td>
						<td>
							<button class="btn btn-primary" type="submit">提交</button>
						</td>
					</tr>
				</table>
			</form>
			<div class="col-xs-12" style="padding-left:0px;">
				{x2;tree:$basics['data'],basic,bid}
				<div class="col-xs-3" style="width:20%">
					<a href="index.php?exam-app-basics-detail&basicid={x2;v:basic['basicid']}" class="thumbnail" style="position:relative;">
						{x2;if:$data['openbasics'][v:basic['basicid']]}
						<img src="app/core/styles/img/opened.png" style="position:absolute;right:4px;top:4px;">
						{x2;elseif:v:basic['basicdemo']}
						<img src="app/core/styles/img/free.png" style="position:absolute;right:4px;top:4px;">
						{x2;endif}
						<img src="{x2;if:v:basic['basicthumb']}{x2;v:basic['basicthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" alt="" width="100%">
					</a>
					<h5 class="text-center">
						{x2;v:basic['basic']}
					</h5>
				</div>
				{x2;if:v:bid % 5 == 0}
				<div class="col-xs-12"><hr /></div>
				{x2;endif}
				{x2;endtree}
			</div>
			<div class="col-xs-12" style="padding-left:0px;">
				<ul class="pagination pull-right">
					{x2;$basics['pages']}
				</ul>
			</div>
		</div>
	</div>
</div>
{x2;if:!$userhash}
{x2;include:footer}
</body>
</html>
{x2;endif}