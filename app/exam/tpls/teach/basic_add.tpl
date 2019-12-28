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
                            <li><a href="index.php?{x2;$_app}-teach">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-teach-basic">考场管理</a></li>
                            <li class="active">添加考场</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        添加考场
                        <a class="btn btn-primary pull-right" href="index.php?exam-teach-basic">考场管理</a>
                    </h4>
                    <form action="index.php?exam-teach-basic-add" method="post" class="form-horizontal">
                        <fieldset>
                        <div class="form-group">
                            <label for="basic" class="control-label col-sm-2">考场名称</label>
                            <div class="col-sm-6">
                                <input class="form-control" id="basic" name="args[basic]" type="text" value="{x2;$basic['basic']}" needle="needle" msg="您必须输入考场名称" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">考场状态</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                    <input name="args[basicclosed]" type="radio" value="0" {x2;if:!$basic['basicclosed']}checked{x2;endif}/>开启
                                </label>
                                <label class="radio-inline">
                                    <input name="args[basicclosed]" type="radio" value="1" {x2;if:$basic['basicclosed']}checked{x2;endif}/>关闭
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicthumb" class="control-label col-sm-2">考场缩略图</label>
                            <div class="col-sm-9">
                                <script type="text/template" id="pe-template-basicthumb">
                                    <div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                        <div class="qq-upload-button-selector" style="clear:both;">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <div class="thumbnail">
                                                        <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                        <input type="hidden" class="qq-edit-filename-selector" name="args[basicthumb]" tabindex="0">
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <div class="thumbnail">
                                                        <img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
                                                        <input type="hidden" class="qq-edit-filename-selector" name="args[basicthumb]" tabindex="0" value="app/core/styles/images/noimage.gif">
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </script>
                                <div class="fineuploader" attr-type="thumb" attr-template="pe-template-basicthumb"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicapi" class="control-label col-sm-2">API标识</label>
                            <div class="col-sm-6">
                                <input class="form-control" id="basicapi" name="args[basicapi]" type="text" value="{x2;$basic['basicapi']}" datatype="datatable" max="12" msg="API标识为不超过12字符的英文或数字" />
                                <span class="help-block">API标识用于对外提供接口信息，如果单独使用本系统无须填写</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicsubjectid" class="control-label col-sm-2">考试科目</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="basicsubjectid" name="args[basicsubjectid]" needle="needle" msg="您必须选择考试科目">
                                <option value="">选择科目</option>
                                  {x2;tree:$subjects,subject,sid}
                                  <option value="{x2;v:subject['subjectid']}"{x2;if:v:subject['subjectid'] == $basic['basicsubjectid']} selected{x2;endif}>{x2;v:subject['subject']}</option>
                                  {x2;endtree}
                                  </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicareaid" class="control-label col-sm-2">考试地区</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="basicareaid" name="args[basicareaid]" needle="needle" msg="您必须选择考试地区">
                                <option value="">选择地区</option>
                                  {x2;tree:$areas,area,aid}
                                  <option value="{x2;v:area['areaid']}"{x2;if:v:area['areaid'] == $basic['basicareaid']} selected{x2;endif}>{x2;v:area['area']}</option>
                                  {x2;endtree}
                                  </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">做为免费考场</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                    <input name="args[basicdemo]" type="radio" value="1" {x2;if:$basic['basicdemo']}checked{x2;endif}/>是
                                </label>
                                <label class="radio-inline">
                                    <input name="args[basicdemo]" type="radio" value="0" {x2;if:!$basic['basicdemo']}checked{x2;endif}/>否
                                </label>
                                <span class="help-block">免费考场用户开通考场时不扣除积分</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicprice" class="control-label col-sm-2">价格设置</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" rows="4" name="args[basicprice]" id="basicprice">{x2;$basic['basicprice']}</textarea>
                                  <span class="help-block">请按照“时长:开通所需积分”格式填写，每行一个，时长以天为单位，免费考场此设置无效。</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basic" class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                                <input type="hidden" name="insertbasic" value="1"/>
                                {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                {x2;endtree}{x2;endif}
                            </div>
                        </div>
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
