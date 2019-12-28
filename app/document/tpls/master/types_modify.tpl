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
                            <li><a href="index.php?{x2;$_app}-master-attachtype">文件类型</a></li>
                            <li class="active">修改文件类型</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        修改文件类型
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-attachtype">文件类型</a>
                    </h4>
                    <form action="index.php?{x2;$_app}-master-attachtype-modify" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="basic" class="control-label col-sm-2">文件类型</label>
                            <div class="col-sm-4">
                                <input class="form-control" id="basic" name="args[attachtype]" type="text" value="{x2;$attachtype['attachtype']}" needle="needle" msg="您必须文件类型" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="basicapi" class="control-label col-sm-2">扩展名</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="basicapi" name="args[attachexts]" type="text" value="{x2;$attachtype['attachexts']}" needle="needle" msg="您必须填写文件类型扩展名"/>
                                <span class="help-block">多个扩展名之间用英文逗号隔开</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                                <input type="hidden" name="modifyattachtype" value="1"/>
                                <input type="hidden" name="atid" value="{x2;$attachtype['atid']}"/>
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
