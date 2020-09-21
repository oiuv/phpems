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
                            <li class="active">添加通栏</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        {x2;$layout['slayouttitle']}
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-seminar-layout&seminarid={x2;$seminar['seminarid']}">专题管理</a>
                    </h4>
                    <form action="index.php?seminar-master-seminar-modifylayout" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="seminartitle" class="control-label col-sm-2">标题：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" name="args[slayouttitle]" value="{x2;$layout['slayouttitle']}" needle="needle" msg="您必须输入标题">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">栅格：</label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                    <input type="radio" name="args[slayoutgrid]" value="1" {x2;if:$layout['slayoutgrid'] == 1}checked{x2;endif}/> 通栏
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="args[slayoutgrid]" value="2" {x2;if:$layout['slayoutgrid'] == 2}checked{x2;endif}/> 左右两栏
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="args[slayoutgrid]" value="3" {x2;if:$layout['slayoutgrid'] == 3}checked{x2;endif}/> 左中右三栏
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seminardescribe" class="control-label col-sm-2">说明：</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="args[slayoutdescribe]" rows="7" cols="4">{x2;$layout['slayoutdescribe']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contenttext" class="control-label col-sm-2">代码：</label>
                            <div class="col-sm-10">
                                <div class="Codemirror"></div>
                                <textarea class="form-control hide blockcontent_content" rows="7" cols="4" name="args[slayoutcode]">{x2;$layout['slayoutcode']}</textarea>
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
                                <input type="hidden" name="slayoutid" value="{x2;$layout['slayoutid']}">
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
