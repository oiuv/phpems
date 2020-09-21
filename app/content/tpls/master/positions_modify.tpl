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
                            <li><a href="index.php?{x2;$_app}-master-positions">推荐管理</a></li>
                            <li class="active">修改推荐位</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        修改推荐位
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-positions">推荐位管理</a>
                    </h4>
                    <form action="index.php?{x2;$_app}-master-positions-modify" method="post" class="form-horizontal">
                        <fieldset>
                        <div class="form-group">
                            <label for="section" class="control-label col-sm-2">推荐位名称：</label>
                            <div class="col-sm-5">
                                <input class="form-control" id="section" name="args[posname]" type="text" size="30" value="{x2;$pos['posname']}" needle="needle" msg="请输入章节名称" />
                            </div>
                        </div>
                        <div class="form-group">
                              <label class="control-label col-sm-2"></label>
                              <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="modifypos" value="1"/>
                                <input type="hidden" name="posid" value="{x2;$pos['posid']}"/>
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
