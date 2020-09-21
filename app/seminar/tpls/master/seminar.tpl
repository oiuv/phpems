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
            <div class="col-xs-2 leftmenu">
                <div id="catsmenu" style="margin-top: 0px;"></div>
            </div>
            <div id="datacontent">
{x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
                            {x2;if:$catid}
                            <li><a href="index.php?{x2;$_app}-master-seminars">专题管理</a></li>
                            <li class="active">{x2;$categories[$catid]['catname']}</li>
                            {x2;else}
                            <li class="active">专题管理</li>
                            {x2;endif}
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        {x2;if:$catid}{x2;$categories[$catid]['catname']}{x2;else}所有专题{x2;endif}
                        <span class="pull-right">
                            <a class="btn btn-primary" href="index.php?seminar-master-seminar-add">添加专题</a>
                        </span>
                    </h4>
                    <form action="index.php?seminar-master-seminar" method="post" class="form-inline">
                        <table class="table">
                            <tr>
                                <td style="border-top: 0px;">
                                    专题ID：
                                </td>
                                <td style="border-top: 0px;">
                                    <input name="search[seminarid]" class="form-control" size="15" type="text" class="number" value="{x2;$search['seminarid']}"/>
                                </td>
                                <td style="border-top: 0px;">
                                    录入时间：
                                </td>
                                <td style="border-top: 0px;">
                                    <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
                                </td>
                                <td style="border-top: 0px;">
                                    标题关键字：
                                </td>
                                <td style="border-top: 0px;">
                                    <input class="form-control" name="search[keyword]" size="15" type="text" value="{x2;$search['keyword']}"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    录入人：
                                </td>
                                <td>
                                    <input class="form-control" name="search[username]" size="15" type="text" value="{x2;$search['username']}"/>
                                </td>
                                <td>
                                    最后修改人：
                                </td>
                                <td>
                                    <input class="form-control" name="search[modifier]" size="15" type="text" value="{x2;$search['modifier']}"/>
                                </td>
                                <td>
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        <div class="input">
                            <input type="hidden" value="{x2;$catid}" name="catid" />
                            <input type="hidden" value="1" name="search[argsmodel]" />
                        </div>
                    </form>
                    <form action="index.php?seminar-master-seminar-lite" method="post">
                        <fieldset>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr class="info">
                                        <th width="36"><input type="checkbox" class="checkall" target="delids"/></th>
                                        <th width="60">权重</th>
                                        <th width="40">ID</th>
                                        <th width="90">缩略图</th>
                                        <th>标题</th>
                                        <th width="120">分类</th>
                                        <th width="80">发布时间</th>
                                        <th width="80">发布人</th>
                                        <th width="80">修改时间</th>
                                        <th width="80">修改人</th>
                                        <th width="180">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {x2;tree:$seminars['data'],seminar,cid}
                                    <tr>
                                        <td><input type="checkbox" name="delids[{x2;v:seminar['seminarid']}]" value="1"></td>
                                        <td><input class="form-control" type="text" name="ids[{x2;v:seminar['seminarid']}]" value="{x2;v:seminar['seminarorder']}" style="width:32px;padding:2px 5px;"/></td>
                                        <td>{x2;v:seminar['seminarid']}</td>
                                        <td class="picture"><img src="{x2;if:v:seminar['seminarthumb']}{x2;v:seminar['seminarthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:48px;"/></td>
                                        <td>
                                            {x2;v:seminar['seminartitle']}
                                        </td>
                                        <td>
                                            <a href="index.php?seminar-master-seminars&catid={x2;v:seminar['seminarcatid']}" target="">{x2;$categories[v:seminar['seminarcatid']]['catname']}</a>
                                        </td>
                                        <td>
                                            {x2;date:v:seminar['seminartime'],'y-m-d'}
                                        </td>
                                        <td>
                                            {x2;v:seminar['seminarusername']}
                                        </td>
                                        <td>
                                            {x2;date:v:seminar['seminarmodifytime'],'y-m-d'}
                                        </td>
                                        <td>
                                            {x2;v:seminar['seminarmodifier']}
                                        </td>
                                        <td class="actions">
                                            <div class="btn-group">
                                                <a class="btn" target="_blank" href="index.php?seminar-master-seminar-showcode&seminarid={x2;v:seminar['seminarid']}&page={x2;$page}{x2;$u}" title="预览"><em class="glyphicon glyphicon-search"></em></a>
                                                <a class="btn" href="index.php?seminar-master-seminar-layout&seminarid={x2;v:seminar['seminarid']}&page={x2;$page}{x2;$u}" title="通栏"><em class="glyphicon glyphicon-cog"></em></a>
                                                <a class="btn" href="index.php?seminar-master-seminar-modify&seminarid={x2;v:seminar['seminarid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
                                                <a class="btn confirm" href="index.php?seminar-master-seminar-del&seminarid={x2;v:seminar['seminarid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                            </div>
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                </tbody>
                            </table>
                            <div class="control-group">
                                <div class="controls">
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="modify" checked/>排序
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="moveposition" />推荐
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="movecategory" />移动
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="delete" />删除
                                    </label>
                                    {x2;if:is_array($search)}{x2;tree:$search,arg,sid}
                                    <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                    {x2;endtree}{x2;endif}
                                    <label class="radio-inline">
                                        <button class="btn btn-primary" type="submit">提交</button>
                                    </label>
                                    <input type="hidden" name="submit" value="1"/>
                                    <input type="hidden" name="catid" value="{x2;$catid}"/>
                                    <input type="hidden" name="page" value="{x2;$page}"/>
                                </div>
                            </div>
                            <ul class="pagination pull-right">
                                {x2;$seminars['pages']}
                            </ul>
                        </fieldset>
                    </form>
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
<script src="index.php?{x2;$_app}-master-seminar-catsmenu&catid={x2;$catid}"></script>
<script>
    $('#catsmenu').treeview({
        levels: {x2;$catlevel},
        expandIcon: 'glyphicon glyphicon-chevron-right',
        collapseIcon: 'glyphicon glyphicon-chevron-down',
        selectedColor: "#000000",
        selectedBackColor: "#FFFFFF",
        enableLinks: true,
        data: treeData
    });
</script>
{x2;include:footer}
</body>
</html>
{x2;endif}
