{x2;if:!$userhash}
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
{x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;$_app}-teach">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-teach-questions&page={x2;$page}{x2;$u}">普通试题管理</a></li>
                            <li class="active">CSV添加普通试题</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        CSV添加试题
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-teach-questions&page={x2;$page}{x2;$u}">普通试题管理</a>
                    </h4>
                    <form action="index.php?exam-teach-questions-filebataddquestion" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="username" class="control-label col-sm-2">示范格式</label>
                            <div class="col-sm-9">
                                <img src="app/exam/styles/image/demo.png" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="knowsid" class="control-label col-sm-2">知识点ID</label>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" name="knowsid" id="knowsid" value="0"/>
                                <span class="help-block">如果您的知识点ID和CSV文件中的知识点ID不同，请在此填写您希望加入的知识点ID，否则请填写0</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lesson_video" class="control-label col-sm-2">待导入文件</label>
                            <div class="col-sm-9">
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
                                <span class="help-block">注意：导入文件必须为csv文件，可用excel另存为csv，为保证程序正常导入，每个CSV文件请不要超过2M，否则可能导入失败</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                                <input type="hidden" name="type" value="1"/>
                                <input type="hidden" name="insertquestion" value="1"/>
                                {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                {x2;endtree}{x2;endif}
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
