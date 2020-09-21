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
                            <li><a href="index.php?{x2;$_app}-master-course">课程管理</a></li>
                            <li class="active">{x2;$categories[$catid]['catname']}</li>
                            {x2;else}
                            <li class="active">课程管理</li>
                            {x2;endif}
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        {x2;if:$catid}{x2;$categories[$catid]['catname']}{x2;else}所有课程{x2;endif}
                        <a class="btn btn-primary pull-right" href="index.php?course-master-course-add&catid={x2;$catid}&page={x2;$page}">添加课程</a>
                    </h4>
                    <form action="index.php?course-master-course" method="post" class="form-inline">
                        <table class="table">
                            <tr>
                                <td style="border-top: 0px;">
                                    课程ID：
                                </td>
                                <td style="border-top: 0px;">
                                    <input name="search[courseid]" class="form-control" size="15" type="text" class="number" value="{x2;$search['courseid']}"/>
                                </td>
                                <td style="border-top: 0px;">
                                    录入时间：
                                </td>
                                <td style="border-top: 0px;">
                                    <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
                                </td>
                                <td style="border-top: 0px;">
                                    关键字：
                                </td>
                                <td style="border-top: 0px;">
                                    <input class="form-control" name="search[keyword]" size="15" type="text" value="{x2;$search['keyword']}"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    分类：
                                </td>
                                <td colspan="3">
                                      <div class="form-inline form-group">
                                          <select msg="您必须选择一个分类" class="autocombox form-control" name="search[cscatid]" refUrl="index.php?course-master-category-ajax-getchildcategory&catid={value}">
                                            <option value="">选择一级分类</option>
                                            {x2;tree:$parentcat,cat,cid}
                                            <option value="{x2;v:cat['catid']}"{x2;if:$catid == v:cat['catid']} selected{x2;endif}>{x2;v:cat['catname']}</option>
                                            {x2;endtree}
                                        </select>
                                    </div>
                                </td>
                                <td>
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        <div class="input">
                            <input type="hidden" value="1" name="search[argsmodel]" />
                        </div>
                    </form>
                    <form action="index.php?course-master-course-lite" method="post">
                        <fieldset>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr class="info">
                                        <th width="36"><input type="checkbox" class="checkall" target="delids"/></th>
                                        <th width="40">权重</th>
                                        <th width="36">ID</th>
                                        <th width="80">缩略图</th>
                                        <th>标题</th>
                                        <th width="100">分类</th>
                                        <th width="100">发布时间</th>
                                        <th width="100">开通人数</th>
                                        <th width="180">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {x2;tree:$courses['data'],course,cid}
                                    <tr>
                                        <td><input type="checkbox" name="delids[{x2;v:course['csid']}]" value="1"></td>
                                        <td><input class="form-control" type="text" name="ids[{x2;v:course['csid']}]" value="{x2;v:course['cssequence']}" style="width:36px;padding:2px 5px;"/></td>
                                        <td>{x2;v:course['csid']}</td>
                                        <td class="picture"><img src="{x2;if:v:course['csthumb']}{x2;v:course['csthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:24px;"/></td>
                                        <td>
                                            {x2;v:course['cstitle']}
                                        </td>
                                        <td>
                                            <a href="index.php?course-master-course&catid={x2;v:course['cscatid']}" target="">{x2;$categories[v:course['cscatid']]['catname']}</a>
                                        </td>
                                        <td>
                                            {x2;date:v:course['cstime'],'Y-m-d'}
                                        </td>
                                        <td>
                                            <a href="index.php?course-master-course-members&courseid={x2;v:course['csid']}" class="autoloaditem" autoload="index.php?course-master-course-getcoursemembernumber&courseid={x2;v:course['csid']}">0</a>
                                        </td>
                                        <td class="actions">
                                            <div class="btn-group">
                                                <a class="btn" href="index.php?course-master-course-members&courseid={x2;v:course['csid']}" title="人员管理"><em class="glyphicon glyphicon-user"></em></a>
                                                <a class="btn" href="index.php?course-master-contents&courseid={x2;v:course['csid']}" title="课件列表"><em class="glyphicon glyphicon-list"></em></a>
                                                <a class="btn" href="index.php?course-master-course-edit&catid={x2;v:course['cscatid']}&courseid={x2;v:course['csid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
                                                <a class="btn confirm" href="index.php?course-master-course-del&catid={x2;v:course['cscatid']}&courseid={x2;v:course['csid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                            </div>
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                </tbody>
                            </table>
                            <div class="form-group">
                                <div class="controls">
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="modify" checked/>排序
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
                                    <input type="hidden" name="modifycoursesequence" value="1"/>
                                    <input type="hidden" name="catid" value="{x2;$catid}"/>
                                    <input type="hidden" name="page" value="{x2;$page}"/>
                                </div>
                            </div>
                            <ul class="pagination pull-right">
                                {x2;$courses['pages']}
                            </ul>
                        </fieldset>
                    </form>
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
<script src="index.php?course-master-course-catsmenu&catid={x2;$catid}"></script>
<script>
;$(function(){
    $('#catsmenu').treeview({
        levels: {x2;$catlevel},
        expandIcon: 'glyphicon glyphicon-chevron-right',
        collapseIcon: 'glyphicon glyphicon-chevron-down',
        selectedColor: "#000000",
        selectedBackColor: "#FFFFFF",
        enableLinks: true,
        data: treeData
    });
})
</script>
{x2;include:footer}
</body>
</html>
{x2;endif}
