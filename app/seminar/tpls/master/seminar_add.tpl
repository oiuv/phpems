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
                            <li class="active">添加专题</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        添加专题
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-seminars&catid={x2;$catid}&page={x2;$page}">专题管理</a>
                    </h4>
                    <form action="index.php?seminar-master-seminar-add" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="seminartitle" class="control-label col-sm-2">标题：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="seminartitle" name="args[seminartitle]" needle="needle" msg="您必须输入专题标题">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seminartitle" class="control-label col-sm-2">发布时间：</label>
                            <div class="col-sm-4">
                                <input class="form-control datetimepicker" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}" data-date-format="yyyy-mm-dd hh:ii:ss" type="text" id="seminartitle" name="args[seminarinputtime]" needle="needle" msg="您必须输入发布时间">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="block" class="control-label col-sm-2">缩略图：</label>
                            <div class="col-sm-9">
                                <script type="text/template" id="pe-template-seminarthumb">
                                    <div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                        <div class="qq-upload-button-selector" style="clear:both;">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <div class="thumbnail">
                                                        <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                        <input type="hidden" class="qq-edit-filename-selector" name="args[seminarthumb]" tabindex="0">
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <div class="thumbnail">
                                                        <img class="qq-thumbnail-selector" src="files/public/img/noimage.gif" alt="点击上传新图片">
                                                        <input type="hidden" class="qq-edit-filename-selector" name="args[seminarthumb]" tabindex="0" value="files/public/img/noimage.gif">
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </script>
                                <div class="fineuploader" attr-type="thumb" attr-template="pe-template-seminarthumb"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seminarcatid" class="control-label col-sm-2">分类：</label>
                            <div class="col-sm-9 form-inline">
                                <select id="seminarcatid" msg="您必须选择一个分类" needle="needle" class="autocombox form-control" name="args[seminarcatid]" refUrl="index.php?seminar-master-category-ajax-getchildcategory&catid={value}">
                                    <option value="">选择一级分类</option>
                                    {x2;tree:$parentcat,cat,cid}
                                    <option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
                                    {x2;endtree}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seminarlink" class="control-label col-sm-2">站外链接：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="seminarlink" name="args[seminarlink]">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seminardescribe" class="control-label col-sm-2">摘要：</label>
                            <div class="col-sm-9">
                                <textarea id="seminardescribe" class="form-control" name="args[seminardescribe]" rows="7" cols="4"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contenttext" class="control-label col-sm-2">代码：</label>
                            <div class="col-sm-10">
                                <div class="Codemirror"></div>
                                <textarea class="form-control hide blockcontent_content" rows="7" cols="4" name="args[seminarcode]"></textarea>
                                <span class="help-block">通栏多栅格使用&lt;!--{{leftchildrentpls}--&gt;,&lt;!--{{middlechildrentpls}--&gt;,&lt;!--{{rightchildrentpls}--&gt;标识子模板位置；其他使用&lt;!--{{childrentpls}--&gt;标识子模板位置。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seminarcatid" class="control-label col-sm-2">范例代码：</label>
                            <div class="col-sm-9 form-inline">
                                <select class="form-control stpl">
                                    <option value="">不使用范例</option>
                                    {x2;tree:$tpls,tpl,tid}
                                    <option value="{x2;v:tpl['stplid']}">{x2;v:tpl['stplname']}</option>
                                    {x2;endtree}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary tplbutton" type="button">提交</button>
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
{x2;include:code}
{x2;include:footer}
</body>
</html>
{x2;endif}
