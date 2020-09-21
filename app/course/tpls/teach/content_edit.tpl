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
                            <li><a href="index.php?{x2;$_app}-teach-contents&page={x2;$page}">课件管理</a></li>
                            <li class="active">修改课件</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        修改课件
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-teach-contents&courseid={x2;$content['coursecsid']}&page={x2;$page}">课件管理</a>
                    </h4>
                    <form action="index.php?course-teach-contents-edit" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="contenttitle" class="control-label col-sm-2">标题:</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="coursetitle" name="args[coursetitle]" needle="needle" msg="You must enter Title." value="{x2;$content['coursetitle']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="block" class="control-label col-sm-2">缩略图:</label>
                            <div class="col-sm-9">
                                <script type="text/template" id="pe-template-coursethumb">
                                    <div class="qq-uploader-selector" style="width:30%" style="clear:both;">
                                        <div class="qq-upload-button-selector" style="clear:both;">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <div class="thumbnail">
                                                        <img class="qq-thumbnail-selector" alt="Upload Picture">
                                                        <input type="hidden" class="qq-edit-filename-selector" name="args[coursethumb]" tabindex="0">
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <div class="thumbnail">
                                                        <img class="qq-thumbnail-selector" src="{x2;$content['coursethumb']}">
                                                        <input type="hidden" class="qq-edit-filename-selector" name="args[coursethumb]" tabindex="0" value="{x2;$content['coursethumb']}">
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </script>
                                <div class="fineuploader" attr-type="thumb" attr-template="pe-template-coursethumb"></div>
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
                            <label for="coursetext" class="control-label col-sm-2">内容</label>
                            <div class="col-sm-9">
                                <textarea id="coursetext" rows="7" cols="4" class="ckeditor" name="args[coursedescribe]">{x2;realhtml:$content['coursedescribe']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="coursetext" class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="contentid" value="{x2;$contentid}">
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
