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
							<li class="active">修改内容</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
						修改内容
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-contents&catid={x2;$catid}&page={x2;$page}">内容管理</a>
					</h4>
					<form action="index.php?content-master-contents-edit" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">标题：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="contenttitle" name="args[contenttitle]" needle="needle" msg="您必须输入标题" value="{x2;$content['contenttitle']}">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">发布时间：</label>
				            <div class="col-sm-4">
							    <input class="form-control datetimepicker" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}" data-date-format="yyyy-mm-dd hh:ii:ss" type="text" value="{x2;date:$content['contentinputtime'],'Y-m-d H:i:s'}" name="args[contentinputtime]" needle="needle" msg="您必须输入发布时间">
					        </div>
				        </div>
				        <!--
				        <div class="col-sm-9">
				            <label for="block" class="control-label col-sm-2">标题颜色：</label>
				            <input type="text" name="args[contenttitle]" needle="needle" msg="您必须输入标题">
				        </div>
				        <div class="col-sm-9">
				            <label for="block" class="control-label col-sm-2">标题加粗：</label>
				            <input type="text" name="args[contenttitle]" needle="needle" msg="您必须输入标题">
				        </div>

				        <div class="form-group">
				            <label for="contentmoduleid" class="control-label col-sm-2">模型：</label>
				            <div class="col-sm-9">
							    <select id="contentmoduleid" msg="您必须选择信息模型" refreshjs="on" needle="needle" class="combox" name="args[contentmoduleid]" refUrl="index.php?content-master-module-moduleforms&moduleid={value}" target="contentforms">
					            	<option value="">选择信息模型</option>
					            	{x2;tree:$modules,module,mid}
					            	<option value="{x2;v:module['moduleid']}">{x2;v:module['modulename']}</option>
					            	{x2;endtree}
					            </select>
					        </div>
				        </div>
				        -->
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">缩略图：</label>
				            <div class="col-sm-9">
								<script type="text/template" id="pe-template-contentthumb">
						    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[contentthumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="{x2;$content['contentthumb']}" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[contentthumb]" tabindex="0" value="{x2;$content['contentthumb']}">
						                			</div>
									            </li>
									        </ul>
						                </div>
						            </div>
						        </script>
						        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-contentthumb"></div>
							</div>
				        </div>
				        <div class="form-group">
				            <label for="contentlink" class="control-label col-sm-2">站外链接：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="contentlink" name="args[contentlink]" value="{x2;if:$content['contentlink']}{x2;realhtml:$content['contentlink']}{x2;endif}">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contentdescribe" class="control-label col-sm-2">摘要：</label>
				            <div class="col-sm-9">
							    <textarea id="contentdescribe" class="form-control" name="args[contentdescribe]" rows="7" cols="4">{x2;$content['contentdescribe']}</textarea>
					        </div>
				        </div>
		    			{x2;tree:$forms,form,fid}
						<div class="form-group">
							<label for="{x2;v:form['id']}" class="control-label col-sm-2">{x2;v:form['title']}</label>
							<div class="col-sm-9">
								{x2;v:form['html']}
							</div>
						</div>
						{x2;endtree}
				    	<div class="form-group">
				            <label for="contenttext" class="control-label col-sm-2">内容</label>
				            <div class="col-sm-10">
							    <textarea id="contenttext" rows="7" cols="4" class="ckeditor" name="args[contenttext]">{x2;realhtml:$content['contenttext']}</textarea>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contenttemplate" class="control-label col-sm-2">模版：</label>
				            <div class="col-sm-3">
							    <select class="form-control" name="args[contenttemplate]" id="contenttemplate">
					            	{x2;tree:$tpls,tpl,tid}
					            	<option value="{x2;v:tpl}"{x2;if:$content['contenttemplate'] == v:tpl} selected{x2;endif}>{x2;v:tpl}</option>
					            	{x2;endtree}
					            </select>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contenttemplate" class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            <input type="hidden" name="contentid" value="{x2;$contentid}">
					            <input type="hidden" name="gotopos" value="1">
					            <input type="hidden" name="submit" value="1">
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