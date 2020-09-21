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
                            <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-master-seminar&page={x2;$page}">专题管理</a></li>
                            <li class="active">数据绑定</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        基础数据
                    </h4>
                    <form action="index.php?seminar-master-seminar-data" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="contenttitle" class="control-label col-sm-2">标题：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="contenttitle" name="args[title]" needle="needle" msg="您必须输入标题" value="{x2;$elem['seldata']['title']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contenttitle" class="control-label col-sm-2">列表数据量：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" name="args[number]" datatype="number" msg="请输入列表数据量" value="{x2;$elem['seldata']['number']}">
                            </div>
                        </div>
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
                                                        <input type="hidden" class="qq-edit-filename-selector" name="args[thumb]" tabindex="0" value="{x2;if:$elem['seldata']['thumb']}{x2;$elem['seldata']['thumb']}{x2;else}files/public/img/noimage.gif{x2;endif}">
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <div class="thumbnail">
                                                        <img class="qq-thumbnail-selector" src="{x2;if:$elem['seldata']['thumb']}{x2;$elem['seldata']['thumb']}{x2;else}files/public/img/noimage.gif{x2;endif}" alt="点击上传新图片">
                                                        <input type="hidden" class="qq-edit-filename-selector" name="args[thumb]" tabindex="0" value="{x2;if:$elem['seldata']['thumb']}{x2;$elem['seldata']['thumb']}{x2;else}files/public/img/noimage.gif{x2;endif}">
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
                            <label for="contentdescribe" class="control-label col-sm-2">摘要：</label>
                            <div class="col-sm-9">
                                <textarea id="contentdescribe" class="form-control" name="args[describe]" rows="7" cols="4">{x2;$elem['seldata']['describe']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contenttext" class="control-label col-sm-2">内容：</label>
                            <div class="col-sm-10">
                                <textarea id="contenttext" rows="7" cols="4" class="ckeditor" name="args[content]">{x2;$elem['seldata']['content']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="submit" value="1">
                                <input type="hidden" name="selid" value="{x2;$elem['selid']}">
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
