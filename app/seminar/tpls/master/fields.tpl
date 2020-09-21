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
                            <li><a href="index.php?{x2;$_app}-master-module">用户模型</a></li>
                            <li class="active">字段管理</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        {x2;$module['modulename']}
                        <span class="pull-right">
                            <a data-toggle="dropdown" class="btn btn-primary dropdown-toggle" href="#">添加字段&nbsp;<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li><a href="index.php?{x2;$_app}-master-module-preview&moduleid={x2;$moduleid}">模型预览</a></li>
                                <li class="divider"></li>
                                <li><a href="index.php?{x2;$_app}-master-module-addfield&moduleid={x2;$moduleid}">添加模型字段</a></li>
                                <li><a href="index.php?{x2;$_app}-master-module-addfield&moduleid={x2;$moduleid}&fieldpublic=1">添加公共字段</a></li>
                            </ul>
                        </span>
                    </h4>
                    <form action="index.php?{x2;$_app}-master-module-fields" method="post">
                        <fieldset>
                            <form action="index.php?{x2;$_app}-master-user-batdel" method="post">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr class="info">
                                        <th>ID</th>
                                        <th>排序</th>
                                        <th>字段名</th>
                                        <th>字段类型</th>
                                        <th>别名</th>
                                        <th>字段长度</th>
                                        <th>数据类型</th>
                                        <th>HTML类型</th>
                                        <th>索引</th>
                                        <th width="140">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {x2;tree:$fields,field,fid}
                                    <tr>
                                        <td>{x2;v:field['fieldid']}</td>
                                        <td class="form-inline"><input type="text" size="1" name="ids[{x2;v:field['fieldid']}]" value="{x2;v:field['fieldsequence']}" class="form-control"/></td>
                                        <td>{x2;v:field['field']}</td>
                                        <td>{x2;if:v:field['fieldpublic']}公共{x2;else}模型{x2;endif}字段</td>
                                        <td>{x2;v:field['fieldtitle']}</td>
                                        <td>{x2;if:v:field['fieldlength']}{x2;v:field['fieldlength']}{x2;else}默认{x2;endif}</td>
                                        <td>{x2;v:field['fieldtype']}</td>
                                        <td>{x2;v:field['fieldhtmltype']}</td>
                                        <td>{x2;if:v:field['fieldindextype']}{x2;v:field['fieldindextype']}{x2;else}NULL{x2;endif}</td>
                                        <td nowrap>
                                            <div class="btn-group">
                                                {x2;if:$module['modulelockfields'][v:field['field']]}
                                                <a class="btn ajax" href="index.php?{x2;$_app}-master-module-forbiddenfield&fieldid={x2;v:field['fieldid']}&moduleid={x2;$moduleid}&page={x2;$page}{x2;$u}" title="启用"><em class="glyphicon glyphicon-ban-circle"></em></a>
                                                {x2;else}
                                                <a class="btn ajax" href="index.php?{x2;$_app}-master-module-forbiddenfield&fieldid={x2;v:field['fieldid']}&moduleid={x2;$moduleid}&page={x2;$page}{x2;$u}" title="禁用"><em class="glyphicon glyphicon-ok-circle"></em></a>
                                                {x2;endif}
                                                <a class="btn" href="index.php?{x2;$_app}-master-module-modifyfield&fieldid={x2;v:field['fieldid']}&page={x2;$page}{x2;$u}" title="修改字段"><em class="glyphicon glyphicon-edit"></em></a>
                                                {x2;if:!v:field['fieldsystem']}
                                                <a class="btn confirm" href="index.php?{x2;$_app}-master-module-delfield&fieldid={x2;v:field['fieldid']}&moduleid={x2;$moduleid}&page={x2;$page}{x2;$u}" title="删除字段"><em class="glyphicon glyphicon-remove"></em></a>
                                                {x2;endif}
                                            </div>
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                    </tbody>
                                </table>
                                <div class="control-group">
                                    <div class="controls">
                                        <button class="btn btn-primary" type="submit">更改排序</button>
                                        <input type="hidden" name="page" value="{x2;$page}">
                                        <input type="hidden" name="modifyfieldsequence" value="1"/>
                                        <input type="hidden" name="moduleid" value="{x2;$moduleid}"/>
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
