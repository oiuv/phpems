{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-2 leftmenu">
                {x2;include:menu}
            </div>
            <div id="datacontent">
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-master-user">用户管理</a></li>
                            <li class="active">批量添加用户</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        批量添加用户
                        <a class="pull-right btn btn-primary" href="index.php?user-master-user">用户列表</a>
                    </h4>
                    <form action="index.php?user-master-user-batadd" method="post" class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                                <label for="username" class="control-label col-sm-2">示范格式</label>
                                <div class="col-sm-10">
                                    <span class="help-block">第一列：用户名 第二列：邮箱 第三列：密码</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lesson_video" class="control-label col-sm-2">待导入文件</label>
                                <div class="col-sm-10 form-inline">
                                    <script type="text/template" id="pe-template-uploadfile">
                                        <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <input size="45" class="form-control qq-edit-filename-selector" type="text" name="uploadfile" tabindex="0" value="">
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <input size="45" class="form-control qq-edit-filename-selector" type="text" name="uploadfile" tabindex="0" value="">
                                                </li>
                                            </ul>
                                            <div class="qq-upload-button-selector col-xs-3">
                                                <button class="btn btn-primary">上传文件<span class="process"></span></button>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="files" attr-template="pe-template-uploadfile" attr-ftype="csv"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-10">
                                    <button class="btn btn-primary" type="submit">导入</button>
                                    <input type="hidden" name="insertUser" value="1"/>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
