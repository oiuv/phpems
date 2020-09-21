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
                            {x2;if:$catid}
                            <li><a href="index.php?{x2;$_app}-master-contents">课件管理</a></li>
                            <li class="active">{x2;$categories[$catid]['catname']}</li>
                            {x2;else}
                            <li class="active">课件管理</li>
                            {x2;endif}
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        课件管理
                        <a class="btn btn-primary pull-right" href="index.php?course-master-contents-addpage&courseid={x2;$course['csid']}&page={x2;$page}">添加课件</a>
                    </h4>
                    <h4>{x2;if:$course}{x2;$course['cstitle']}{x2;else}所有课件{x2;endif}</h4>
                    <form action="index.php?course-master-contents" method="post" class="form-inline">
                        <table class="table">
                            <tr>
                                <td>
                                    课件ID：
                                </td>
                                <td>
                                    <input name="search[courseid]" class="form-control" size="15" type="text" class="number" value="{x2;$search['courseid']}"/>
                                </td>
                                <td>
                                    录入时间：
                                </td>
                                <td>
                                    <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
                                </td>
                                <td>
                                    关键字：
                                </td>
                                <td>
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
                                    课件模型：
                                </td>
                                <td>
                                    <select name="search[coursemoduleid]" class="form-control">
                                          <option value="0">不限</option>
                                          {x2;tree:$modules,module,mid}
                                          <option value="{x2;v:module['moduleid']}"{x2;if:$search['coursemoduleid'] == v:module['moduleid']} selected{x2;endif}>{x2;v:module['modulename']}</option>
                                          {x2;endtree}
                                      </select>
                                </td>
                                <td>
                                    <input type="hidden" name="courseid" value="{x2;$course['csid']}"/>
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        <div class="input">
                            <input type="hidden" value="1" name="search[argsmodel]" />
                        </div>
                    </form>
                    <form action="index.php?course-master-contents-lite" method="post">
                        <fieldset>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr class="info">
                                        <th width="40"><input type="checkbox" class="checkall" target="delids"/></th>
                                        <th width="80">权重</th>
                                        <th width="40">ID</th>
                                        <th width="80">缩略图</th>
                                        <th>标题</th>
                                        <th width="100">课件模型</th>
                                        <th width="100">发布时间</th>
                                        <th width="100">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {x2;tree:$contents['data'],content,cid}
                                    <tr>
                                        <td><input type="checkbox" name="delids[{x2;v:content['courseid']}]" value="1"></td>
                                        <td><input class="form-control" type="text" name="ids[{x2;v:content['courseid']}]" value="{x2;v:content['coursesequence']}" style="width:36px;padding:2px 5px;"/></td>
                                        <td>{x2;v:content['courseid']}</td>
                                        <td class="picture"><img src="{x2;if:v:content['coursethumb']}{x2;v:content['coursethumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:48px;"/></td>
                                        <td>
                                            {x2;v:content['coursetitle']}
                                        </td>
                                        <td>
                                            {x2;$modules[v:content['coursemoduleid']]['modulename']}
                                        </td>
                                        <td>
                                            {x2;date:v:content['courseinputtime'],'Y-m-d'}
                                        </td>
                                        <td class="actions">
                                            <div class="btn-group">
                                                <a class="btn" href="index.php?course-master-contents-edit&courseid={x2;v:content['coursecsid']}&contentid={x2;v:content['courseid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
                                                <a class="btn confirm" href="index.php?course-master-contents-del&courseid={x2;v:content['coursecsid']}&contentid={x2;v:content['courseid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                            </div>
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                </tbody>
                            </table>
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="modify" checked/>排序
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
                                    <input type="hidden" name="courseid" value="{x2;$course['csid']}"/>
                                    <input type="hidden" name="page" value="{x2;$page}"/>
                                </div>
                            </div>
                            <ul class="pagination pull-right">
                                {x2;$contents['pages']}
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
