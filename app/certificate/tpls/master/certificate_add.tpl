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
							<li><a href="index.php?{x2;$_app}-master-certificate&page={x2;$page}">证书管理</a></li>
							<li class="active">添加证书</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
						添加证书
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-certificate&page={x2;$page}">证书管理</a>
					</h4>
					<form action="index.php?certificate-master-certificate-add" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">证书标题：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="cetitle" name="args[cetitle]" needle="needle" msg="您必须输入标题">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">加入时间：</label>
				            <div class="col-sm-4">
							    <input class="form-control datetimepicker" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}" data-date-format="yyyy-mm-dd hh:ii:ss" type="text" id="cetime" value="{x2;date:TIME,'Y-m-d H:i:s'}" name="args[cetime]" needle="needle" msg="您必须输入发布时间">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">办证费用：</label>
				            <div class="col-sm-4">
							    <input class="form-control" name="args[ceprice]" needle="needle" msg="您必须输入办证费用" placeholder="办证所需积分">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">需通过的考场ID：</label>
				            <div class="col-sm-4">
							    <input class="form-control" name="args[cebasic]" needle="needle" msg="您必须输入需通过的考场ID" placeholder="输入需通过的考场ID">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">缩略图：</label>
				            <div class="col-sm-9">
					            <script type="text/template" id="pe-template-cethumb">
						    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[cethumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[cethumb]" tabindex="0" value="app/core/styles/images/noimage.gif">
						                			</div>
									            </li>
									        </ul>
						                </div>
						            </div>
						        </script>
						        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-cethumb"></div>
							</div>
				        </div>
				    	<div class="form-group">
				            <label for="contenttext" class="control-label col-sm-2">内容</label>
				            <div class="col-sm-10">
							    <textarea id="contenttext" rows="7" cols="4" class="ckeditor" name="args[cedescribe]"></textarea>
					        </div>
				        </div>
				        <div class="form-group">
				            <label class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            <input type="hidden" name="addcertificate" value="1">
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