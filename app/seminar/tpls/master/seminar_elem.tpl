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
                            <li><a href="index.php?{x2;$_app}-master-seminar-layout&seminarid={x2;$seminar['seminarid']}&page={x2;$page}">通栏设置</a></li>
                            <li class="active">组件设置</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        {x2;$seminar['seminartitle']}
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-seminar-addelem&slayoutid={x2;$layout['slayoutid']}">添加组件</a>
                    </h4>
                    <form action="index.php?seminar-master-seminar-liteelem" method="post">
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr class="info">
                                <th width="40">ID</th>
                                <th width="60">顺序</th>
                                <th width="120">名称</th>
                                <th>说明</th>
                                <th width="180">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                                {x2;tree:$elems['data'],elem,lid}
                                <tr>
                                    <td>{x2;v:elem['selid']}</td>
                                    <td><input class="form-control" type="text" name="ids[{x2;v:elem['selid']}]" value="{x2;v:elem['selorder']}" style="width:32px;padding:2px 5px;"/></td>
                                    <td>{x2;v:elem['seltitle']}</td>
                                    <td>{x2;v:elem['seldescribe']}</td>
                                    <td>
                                        <div class="btn-group">
                                            <a class="btn" title="基础数据" href="index.php?seminar-master-seminar-data&selid={x2;v:elem['selid']}"><em class="glyphicon glyphicon-print"></em></a>
                                            <a class="btn" title="列表数据" href="index.php?seminar-master-seminar-contents&selid={x2;v:elem['selid']}"><em class="glyphicon glyphicon-list"></em></a>
                                            <a class="btn" title="修改" href="index.php?seminar-master-seminar-modifyelem&selid={x2;v:elem['selid']}"><em class="glyphicon glyphicon-edit"></em></a>
                                            <a class="btn confirm" title="删除" href="index.php?seminar-master-seminar-delelem&selid={x2;v:elem['selid']}"><em class="glyphicon glyphicon-remove"></em></a>
                                        </div>
                                    </td>
                                </tr>
                                {x2;endtree}
                            </tbody>
                        </table>
                        <div class="control-group">
                            <button class="btn btn-primary" type="submit">排序</button>
                            <input type="hidden" name="submit" value="1"/>
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
