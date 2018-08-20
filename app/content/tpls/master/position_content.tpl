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
							{x2;if:$catid}
							<li><a href="index.php?{x2;$_app}-master-positions">推荐管理</a></li>
							<li class="active">{x2;$categories[$catid]['catname']}</li>
							{x2;else}
							<li class="active">推荐内容</li>
							{x2;endif}
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
                        {x2;$pos['posname']}
						<span class="pull-right">
							<a class="btn btn-primary" href="index.php?content-master-positions-addpage">推荐位管理</a>
						</span>
					</h4>
					<form action="index.php?content-master-positions-lite" method="post">
						<fieldset>
							<table class="table table-hover table-bordered">
								<thead>
									<tr class="info">
					                    <th width="36"><input type="checkbox" class="checkall" target="delids"/></th>
					                    <th width="60">权重</th>
					                    <th width="40">ID</th>
					                    <th>标题</th>
								        <th width="140">推荐时间</th>
								    </tr>
					            </thead>
					            <tbody>
					            	{x2;tree:$contents['data'],content,cid}
					            	<tr>
					                    <td><input type="checkbox" name="delids[{x2;v:content['pcid']}]" value="1"></td>
					                    <td><input class="form-control" type="text" name="ids[{x2;v:content['pcid']}]" value="{x2;v:content['pcsequence']}" style="width:32px;padding:2px 5px;"/></td>
					                    <td>{x2;v:content['pcid']}</td>
					                    <td>
					                        {x2;v:content['pctitle']}
					                    </td>
					                    <td>
					                    	{x2;date:v:content['pctime'],'y-m-d'}
					                    </td>
					                </tr>
					                {x2;endtree}
					        	</tbody>
					        </table>
					        <div class="control-group">
					            <div class="controls">
						            <label class="radio-inline">
						                <input type="radio" name="action" value="modify" checked/>排序
						            </label>
						            <label class="radio-inline">
						                <input type="radio" name="action" value="delete" />删除
						            </label>
						            {x2;tree:$search,arg,sid}
						            <input type="hidden"-name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						            {x2;endtree}
						            <label class="radio-inline">
						            	<button class="btn btn-primary" type="submit">提交</button>
						            </label>
						            <input type="hidden" name="modifycontentsequence" value="1"/>
						            <input type="hidden" name="catid" value="{x2;$catid}"/>
						            <input type="hidden" name="page" value="{x2;$page}"/>
						        </div>
					        </div>
							<ul class="pagination pull-right">
								{x2;$contents['pages']}
							</ul>
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