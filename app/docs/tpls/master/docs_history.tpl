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
                <div class="box itembox" style="margin-bottom:0px;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php">首页</a></li>
                            <li><a href="index.php?docs-master-docs">词条管理</a></li>
                            <li class="active">历史版本</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;">
                    <h4 class="title">{x2;$doc['doctitle']}</h4>
                    <form action="index.php?docs-master-docs-setdochistory" method="post">
                        <fieldset>
                            <table class="table table-bordered">
                                <thead>
                                <tr class="bg-info">
                                    <th width="36"><input type="checkbox" class="checkall" target="delids"/></th>
                                    <th width="80">ID</th>
                                    <th>修改日志</th>
                                    <th width="180">编辑时间</th>
                                    <th width="100">状态</th>
                                    <th width="60">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                {x2;tree:$histories['data'],history,hid}
                                <tr>
                                    <td><input type="checkbox" name="delids[{x2;v:history['dhid']}]" value="1"></td>
                                    <td>{x2;v:history['dhid']}</td>
                                    <td>{x2;if:$doc['doccontentid'] == v:history['dhid']}【 当前版本 】{x2;endif}<a target="_blank" href="index.php?docs-app-docs-viewhistory&dhid={x2;v:history['dhid']}">{x2;v:history['dhtitle']}</a></td>
                                    <td>{x2;date:v:history['dhtime'],'Y-m-d H:i:s'}</td>
                                    <td>{x2;if:v:history['dhstatus'] == 2}未通过{x2;elseif:v:history['dhstatus'] == 1}已审核{x2;else}未审核{x2;endif}</td>
                                    <td>{x2;if:v:history['dhstatus'] == 1 && $doc['doccontentid'] != v:history['dhid']}<a msg="确定设为当前版本吗？" href="index.php?docs-master-docs-setdochistory&action=nowuse&dhid={x2;v:history['dhid']}" class="confirm glyphicon glyphicon-bookmark" title="设为当前版本"></a> {x2;endif}</td>
                                </tr>
                                {x2;endtree}
                                </tbody>
                            </table>
                            <div class="control-group">
                                <div class="controls">
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="pass" checked/>已审核
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="unpass" />审核未通过
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="action" value="waitpass"/>待审核
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
                                    <input type="hidden" name="setdochistory" value="1"/>
                                </div>
                            </div>
                            <ul class="pagination pull-right">
                                {x2;$histories['pages']}
                            </ul>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
