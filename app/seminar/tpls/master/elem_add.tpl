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
                            <li class="active">添加组件</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        {x2;$seminar['seminartitle']}
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-seminar-layout&seminarid={x2;$seminar['seminarid']}">专题管理</a>
                    </h4>
                    <form action="index.php?seminar-master-seminar-addelem" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="seminartitle" class="control-label col-sm-2">标题：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" name="args[seltitle]" needle="needle" msg="您必须输入标题">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">位置：</label>
                            <div class="col-sm-9">
                                {x2;if:$layout['slayoutgrid'] == 1}
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="0" checked/> 通栏
                                </label>
                                {x2;elseif:$layout['slayoutgrid'] == 2}
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="1" checked/> 左栏
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="2"/> 右栏
                                </label>
                                {x2;elseif:$layout['slayoutgrid'] == 3}
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="0" checked/> 中栏
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="1"/> 左栏
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="args[selpos]" value="2"/> 右栏
                                </label>
                                {x2;endif}
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="seminardescribe" class="control-label col-sm-2">说明：</label>
                            <div class="col-sm-9">
                                <textarea id="seminardescribe" class="form-control" name="args[seldescribe]" rows="7" cols="4"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contenttext" class="control-label col-sm-2">代码：</label>
                            <div class="col-sm-10">
                                <div class="Codemirror"></div>
                                <textarea class="form-control hide blockcontent_content" rows="7" cols="4" name="args[selcode]"></textarea>
                                <span class="help-block">使用&lt;!--{{datasource}}--&gt;设定自动数据源</span>
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
