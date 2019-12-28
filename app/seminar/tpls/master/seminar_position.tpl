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
                            <li class="active">推荐</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        专题推荐
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-seminar&catid={x2;$catid}&page={x2;$page}">专题管理</a>
                    </h4>
                    <form action="index.php?seminar-master-seminar-lite" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">标题ID：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="contentids" value="{x2;$contentids}" needle="needle" msg="您必须输入标题" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">推荐位：</label>
                            <div class="col-sm-6">
                                <select msg="您必须选择一个推荐位" needle="needle" name="position" class="form-control">
                                    <option value="">选择推荐位</option>
                                    {x2;tree:$poses,pos,pid}
                                    <option value="{x2;v:pos['posid']}">{x2;v:pos['posname']}</option>
                                    {x2;endtree}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <input class="btn btn-primary" type="submit" value="移动">
                                <a class="btn btn-primary" href="index.php?seminar-master-seminar&page={x2;$page}{x2;$u}">取消</a>
                                {x2;if:is_array($search)}{x2;tree:$search,arg,sid}
                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                {x2;endtree}{x2;endif}
                                <input type="hidden" name="movecposition" value="1">
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
