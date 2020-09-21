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
                            <li class="active">分类管理</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        {x2;if:$parent}{x2;$categories[$parent]['catname']}{x2;else}一级分类{x2;endif}
                        <span class="dropdown pull-right">
                            <a class="btn btn-primary" href="#" data-toggle="dropdown">添加分类 <strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li><a href="index.php?{x2;$_app}-master-category-add&parent={x2;$parent}">添加分类</a></li>
                                <li><a href="index.php?{x2;$_app}-master-category&parent={x2;$categories[$parent]['catparent']}">上级分类</a></li>
                            </ul>
                        </span>
                    </h4>
                    <form action="index.php?content-master-category-lite" method="post">
                        <fieldset>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr class="info">
                                        <th width="80">排序</th>
                                        <th width="80">ID</th>
                                        <th width="80">缩略图</th>
                                        <th>分类名称</th>
                                        <th width="180">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {x2;tree:$categorys['data'],category,cid}
                                    <tr>
                                        <td><input type="text" class="form-control" name="ids[{x2;v:category['catid']}]" value="{x2;v:category['catlite']}" style="width:48px;padding:2px 5px;"/></td>
                                        <td>{x2;v:category['catid']}</td>
                                        <td><img src="{x2;if:v:category['catimg']}{x2;v:category['catimg']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:48px;"/></td>
                                        <td><span>{x2;v:category['catname']}</span></td>
                                        <td>
                                            <div class="btn-group">
                                                <a class="btn" href="index.php?{x2;$_app}-master-category-add&parent={x2;v:category['catid']}{x2;$u}"><em class="glyphicon glyphicon-plus"></em></a>
                                                <a class="btn" href="index.php?content-master-category&parent={x2;v:category['catid']}{x2;$u}"><em class="glyphicon glyphicon-list"></em></a>
                                                <a class="btn" href="index.php?{x2;$_app}-master-category-edit&page={x2;$page}&catid={x2;v:category['catid']}{x2;$u}"><em class="glyphicon glyphicon-edit"></em></a>
                                                <a class="btn confirm" href="index.php?{x2;$_app}-master-category-del&catid={x2;v:category['catid']}&page={x2;$page}{x2;$u}"><em class="glyphicon glyphicon-remove"></em></a>
                                            </div>
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                </tbody>
                            </table>
                            <div class="control-group">
                                <div class="controls">
                                    {x2;if:is_array($search)}{x2;tree:$search,arg,sid}
                                    <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                    {x2;endtree}{x2;endif}
                                    <label class="radio inline">
                                        <button class="btn btn-primary" type="submit">更改排序</button>
                                    </label>
                                    <input type="hidden" name="modifycategorysequence" value="1"/>
                                    <input type="hidden" name="page" value="{x2;$page}"/>
                                </div>
                            </div>
                            <ul class="pagination pull-right">
                                {x2;$categorys['pages']}
                            </ul>
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
