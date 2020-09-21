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
                            <li><a href="index.php?{x2;$_app}-master-docs">词条管理</a></li>
                            <li class="active">{x2;$categories[$catid]['catname']}</li>
                            {x2;else}
                            <li class="active">词条管理</li>
                            {x2;endif}
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        {x2;if:$catid}{x2;$categories[$catid]['catname']}{x2;else}所有内容{x2;endif}
                        <span class="pull-right">
                            <a class="btn btn-primary" href="index.php?docs-master-docs-add&catid={x2;$catid}&page={x2;$page}">添加词条</a>
                        </span>
                    </h4>
                    <form action="index.php?docs-master-docs" method="post" class="form-inline">
                        <table class="table">
                            <tr>
                                <td style="border-top:0px;">
                                    内容ID：
                                </td>
                                <td style="border-top:0px;">
                                    <input name="search[docid]" class="form-control" size="15" type="text" class="number" value="{x2;$search['docid']}"/>
                                </td>
                                <td style="border-top:0px;">
                                    录入时间：
                                </td>
                                <td style="border-top:0px;">
                                    <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
                                </td>
                                <td style="border-top:0px;">
                                    关键字：
                                </td>
                                <td style="border-top:0px;">
                                    <input class="form-control" name="search[keyword]" size="15" type="text" value="{x2;$search['keyword']}"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    完善情况：
                                </td>
                                <td>
                                    <select class="form-control" name="search[docneedmore]">
                                        <option value="0">不限</option>
                                        <option value="-1"{x2;if:$search['docneedmore'] == -1} selected{x2;endif}>已完善</option>
                                        <option value="1"{x2;if:$search['docneedmore'] == 1} selected{x2;endif}>待完善</option>
                                    </select>
                                </td>
                                <td>
                                    是否推荐：
                                </td>
                                <td>
                                    <select class="form-control" name="search[docistop]">
                                        <option value="0">不限</option>
                                        <option value="-1"{x2;if:$search['docistop'] == -1} selected{x2;endif}>未推荐</option>
                                        <option value="1"{x2;if:$search['docistop'] == 1} selected{x2;endif}>推荐</option>
                                    </select>
                                </td>
                                <td>
                                    是否锁定：
                                </td>
                                <td>
                                    <select class="form-control" name="search[docsyslock]">
                                        <option value="0">不限</option>
                                        <option value="-1"{x2;if:$search['docsyslock'] == -1} selected{x2;endif}>未锁定</option>
                                        <option value="1"{x2;if:$search['docsyslock'] == 1} selected{x2;endif}>锁定</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    分类：
                                </td>
                                <td colspan="4">
                                      <select msg="您必须选择一个分类" class="autocombox form-control" name="search[doccatid]" refUrl="index.php?docs-master-category-ajax-getchildcategory&catid={value}">
                                        <option value="">选择一级分类</option>
                                        {x2;tree:$parentcat,cat,cid}
                                        <option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
                                        {x2;endtree}
                                    </select>
                                </td>
                                <td>
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </td>
                            </tr>
                        </table>
                        <div class="input">
                            <input type="hidden" value="1" name="search[argsmodel]" />
                        </div>
                    </form>
                    <form action="index.php?docs-master-docs-lite" method="post">
                        <fieldset>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr class="info">
                                        <th width="36"><input type="checkbox" class="checkall" target="delids"/></th>
                                        <th width="60">权重</th>
                                        <th width="40">ID</th>
                                        <th width="80">缩略图</th>
                                        <th>标题</th>
                                        <th width="80">状态</th>
                                        <th width="80">分类</th>
                                        <th width="80">发布时间</th>
                                        <th width="140">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {x2;tree:$docs['data'],doc,did}
                                    <tr>
                                        <td><input type="checkbox" name="delids[{x2;v:doc['docid']}]" value="1"></td>
                                        <td><input class="form-control" type="text" name="ids[{x2;v:doc['docid']}]" value="{x2;v:doc['docsequence']}" style="width:36px;padding:2px 5px;"/></td>
                                        <td>{x2;v:doc['docid']}</td>
                                        <td class="picture"><img src="{x2;if:v:doc['docthumb']}{x2;v:doc['docthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:48px;"/></td>
                                        <td>
                                             {x2;v:doc['doctitle']}
                                        </td>
                                        <td style="text-align: center">
                                            {x2;if:v:doc['docistop']}<em title="推荐词条" class="glyphicon glyphicon-thumbs-up"></em>{x2;endif}
                                            {x2;if:v:doc['docneedmore']}<em title="待完善" class="glyphicon glyphicon-exclamation-sign"></em>{x2;endif}
                                            {x2;if:v:doc['docsyslock']}<em title="已锁定" class="glyphicon glyphicon-lock"></em>{x2;endif}
                                        </td>
                                        <td>
                                            <a href="index.php?docs-master-docs&catid={x2;v:doc['doccatid']}" target="">{x2;$categories[v:doc['doccatid']]['catname']}</a>
                                        </td>
                                        <td>
                                            {x2;date:v:doc['docinputtime'],'y-m-d'}
                                        </td>
                                        <td class="actions">
                                            <div class="btn-group">
                                                <a class="btn" href="index.php?docs-master-docs-history&docid={x2;v:doc['docid']}&page={x2;$page}{x2;$u}" title="版本"><em class="glyphicon glyphicon-list"></em></a>
                                                <a class="btn" href="index.php?docs-master-docs-edit&docid={x2;v:doc['docid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
                                                <a class="btn confirm" href="index.php?docs-master-docs-del&docid={x2;v:doc['docid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                            </div>
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                </tbody>
                            </table>
                            <div class="control-group">
                                <div class="controls">
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="sequence" checked/>排序
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="more"/>设为待完善
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="unmore"/>设为已完善
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="top"/>设为推荐
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="untop"/>取消推荐
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="lock"/>锁定
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="unlock"/>解锁
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="move" />移动
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
                                    <input type="hidden" name="modifycontentsequence" value="1"/>
                                    <input type="hidden" name="catid" value="{x2;$catid}"/>
                                    <input type="hidden" name="page" value="{x2;$page}"/>
                                </div>
                            </div>
                            <ul class="pagination pull-right">
                                {x2;$docs['pages']}
                            </ul>
                        </fieldset>
                    </form>
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
<script src="index.php?docs-master-docs-catsmenu&catid={x2;$catid}"></script>
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
