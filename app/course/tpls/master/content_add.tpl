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
							<li><a href="index.php?{x2;$_app}-master-contents&page={x2;$page}">课件管理</a></li>
							<li class="active">添加课件</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						添加课件
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-contents&courseid={x2;$courseid}&page={x2;$page}">课件管理</a>
					</h4>
					<form action="index.php?course-master-contents-add" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="coursetitle" class="control-label col-sm-2">标题：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="coursetitle" name="args[coursetitle]" needle="needle" msg="您必须输入标题">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="coursemoduleid" class="control-label col-sm-2">模型：</label>
				            <div class="col-sm-3">
							    <select id="coursemoduleid" msg="您必须选择信息模型" refreshjs="on" needle="needle" class="combox form-control" name="args[coursemoduleid]" refUrl="index.php?course-master-module-moduleforms&moduleid={value}" target="courseforms">
					            	<option value="">选择信息模型</option>
					            	{x2;tree:$modules,module,mid}
					            	<option value="{x2;v:module['moduleid']}">{x2;v:module['modulename']}</option>
					            	{x2;endtree}
					            </select>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">缩略图：</label>
				            <div class="col-sm-9">
					            <script type="text/template" id="pe-template-coursethumb">
						    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[coursethumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[coursethumb]" tabindex="0" value="app/core/styles/images/noimage.gif">
						                			</div>
									            </li>
									        </ul>
						                </div>
						            </div>
						        </script>
						        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-coursethumb"></div>
							</div>
				        </div>
				    	<div id="courseforms"></div>
				    	<div class="form-group">
				            <label for="coursetext" class="control-label col-sm-2">内容</label>
				            <div class="col-sm-10">
							    <textarea id="coursedescribe" rows="7" cols="4" class="ckeditor" name="args[coursedescribe]"></textarea>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="coursetitle" class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            <input type="hidden" name="submit" value="1">
					            <input type="hidden" name="args[coursecsid]" value="{x2;$courseid}">
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