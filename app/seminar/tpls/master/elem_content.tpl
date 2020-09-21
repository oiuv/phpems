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
                            <li><a href="index.php?{x2;$_app}-master-seminar-layout&seminarid={x2;$elem['selseminar']}&page={x2;$page}">通栏设置</a></li>
                            <li><a href="index.php?{x2;$_app}-master-seminar-elem&slayoutid={x2;$elem['sellayout']}&page={x2;$page}">组件设置</a></li>
                            <li class="active">列表数据</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        {x2;$elem['seltitle']}
                        <span class="pull-right">
                            <a class="btn btn-primary" href="index.php?seminar-master-seminar-addcontent&selid={x2;$elem['selid']}">添加内容</a>
                        </span>
                    </h4>
                    <form action="index.php?seminar-master-seminar-contentlite" method="post">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr class="info">
                                    <th width="36"><input type="checkbox" class="checkall" target="delids"/></th>
                                    <th width="60">权重</th>
                                    <th width="40">ID</th>
                                    <th width="90">缩略图</th>
                                    <th>标题</th>
                                    <th width="80">发布时间</th>
                                    <th width="100">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {x2;tree:$contents['data'],content,cid}
                                <tr>
                                    <td><input type="checkbox" name="delids[{x2;v:content['sctid']}]" value="1"></td>
                                    <td><input class="form-control" type="text" name="ids[{x2;v:content['sctid']}]" value="{x2;v:content['sctorder']}" style="width:32px;padding:2px 5px;"/></td>
                                    <td>{x2;v:content['contentid']}</td>
                                    <td class="picture"><img src="{x2;if:v:content['contentthumb']}{x2;v:content['contentthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:48px;"/></td>
                                    <td>
                                        {x2;v:content['contenttitle']}
                                    </td>
                                    <td>
                                        {x2;date:v:content['contentinputtime'],'y-m-d'}
                                    </td>
                                    <td class="actions">
                                        <div class="btn-group">
                                            <a class="btn confirm" href="index.php?seminar-master-seminar-delcontent&sctid={x2;v:content['sctid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
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
                                    <input type="radio" name="action" value="delete" />删除
                                </label>
                                <label class="radio-inline">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                    <input type="hidden" name="submit" value="1" />
                                </label>
                            </div>
                        </div>
                        <ul class="pagination pull-right">
                            {x2;$contents['pages']}
                        </ul>
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
