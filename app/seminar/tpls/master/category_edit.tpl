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
                            <li><a href="index.php?{x2;$_app}-master-category">分类管理</a></li>
                            <li class="active">修改分类</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        修改分类
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-category&parent={x2;$parent}">分类列表</a>
                    </h4>
                    <form action="index.php?{x2;$_app}-master-category-edit" method="post" class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                            </div>
                            <div class="form-group">
                                <label for="modulename" class="control-label col-sm-2">分类名称</label>
                                <div class="col-sm-4">
                                    <input class="form-control" type="text" id="input1" name="args[catname]" value="{x2;$category['catname']}" datatype="userName" needle="needle" msg="您必须输入中英文字符的分类名称">
                                    <span class="help-block">请输入分类名称</span>
                                </div>
                            </div>
                            {x2;if:!$cat['catparent']}
                            <div class="form-group">
                                <label for="modulename" class="control-label col-sm-2">前台显示</label>
                                <div class="col-sm-9">
                                    <label class="radio-inline">
                                        <input type="radio" class="input-text" name="args[catinmenu]" value="1"{x2;if:$category['catinmenu']} checked{x2;endif}/> 不显示
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" class="input-text" name="args[catinmenu]" value="0"{x2;if:!$category['catinmenu']} checked{x2;endif}/> 显示
                                    </label>
                                    <span class="help-block">勾选此项后，分类将显示在内容模块前台的分类列表区域。</span>
                                </div>
                            </div>
                            {x2;endif}
                            <div class="form-group">
                                <label for="modulename" class="control-label col-sm-2">在首页展示内容</label>
                                <div class="col-sm-10 form-inline">
                                    <input size="6" class="form-control" type="text" name="args[catindex]" value="{x2;if:$category['catindex']}{x2;$category['catindex']}{x2;else}0{x2;endif}" datatype="number" needle="needle" msg="您必须填写展示内容条数"> 条
                                    <span class="help-block">填写展示内容条数，如果不需要在首页展示，请填写0。</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="modulecode" class="control-label col-sm-2">分类排序</label>
                                <div class="col-sm-4">
                                    <input class="form-control" type="text" id="input2" name="args[catlite]" value="{x2;$category['catlite']}" datatype="number" msg="排序为整数">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="moduledescribe" class="control-label col-sm-2">外链地址</label>
                                <div class="col-sm-4">
                                    <input class="form-control" type="text" name="args[caturl]" value="{x2;realhtml:$category['caturl']}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="moduledescribe" class="control-label col-sm-2">使用外链地址</label>
                                <div class="col-sm-9">
                                    <label class="radio-inline">
                                        <input type="radio"  name="args[catuseurl]" value="1"{x2;if:$category['catuseurl']} checked{x2;endif}>使用
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio"  name="args[catuseurl]" value="0"{x2;if:!$category['catuseurl']} checked{x2;endif}>不使用
                                    </label>
                                    <span class="help-block">填写外链地址后，该分类会直接转到外链地址</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="modulecode" class="control-label col-sm-2">分类模板</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="args[cattpl]">
                                        {x2;tree:$tpls,tpl,tid}
                                        <option value="{x2;v:tpl}"{x2;if:$category['cattpl'] == v:tpl} selected{x2;endif}>{x2;v:tpl}</option>
                                        {x2;endtree}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="moduledescribe" class="control-label col-sm-2">分类图片</label>
                                <div class="col-sm-9">
                                    <script type="text/template" id="pe-template-photo">
                                        <div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector" name="args[catimg]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" src="{x2;if:$category['catimg']}{x2;$category['catimg']}{x2;else}files/public/img/noimage.gif{x2;endif}" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector" name="args[catimg]" tabindex="0" value="{x2;if:$category['catimg']}{x2;$category['catimg']}{x2;else}files/public/img/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="catdes" class="control-label col-sm-2">分类简介</label>
                                <div class="col-sm-10">
                                    <textarea class="ckeditor" rows="7" id="catdes" name="args[catdes]">{x2;realhtml:$category['catdes']}</textarea>
                                    <span class="help-block">对这个模型进行描述</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="catdes" class="control-label col-sm-2"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                    <input type="hidden" name="submit" value="1">
                                    <input type="hidden" name="page" value="{x2;$page}">
                                    <input type="hidden" name="catid" value="{x2;$catid}">
                                    <input type="hidden" name="parent" value="{x2;$parent}">
                                    {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                    <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                    {x2;endtree}{x2;endif}
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
