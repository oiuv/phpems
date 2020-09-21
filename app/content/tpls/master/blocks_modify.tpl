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
                            <li><a href="index.php?{x2;$_app}-master-blocks&page={x2;$page}">标签管理</a></li>
                            <li class="active">标签修改</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        修改标签
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-blocks&page={x2;$page}">标签管理</a>
                    </h4>
                    {x2;if:$block['blocktype'] == 1}
                    <form action="?content-master-blocks-modify" method="post" class="form-horizontal" style="margin-top:20px;">
                        <div class="form-group">
                            <label for="block" class="control-label col-sm-2">名称：</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="block" type="text" name="args[block]" needle="needle" msg="您必须输入标签名称" max="40" value="{x2;$block['block']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockposition" class="control-label col-sm-2">位置：</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="blockposition" type="text" name="args[blockposition]" needle="needle" msg="您必须输入内容所在位置" max="40" value="{x2;$block['blockposition']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_content" class="control-label col-sm-2">内容：</label>
                            <div class="col-sm-9">
                                <textarea id="blockcontent_content" class="ckeditor" name="args[blockcontent][content]" rows="7" cols="4">{x2;$block['blockcontent']['content']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockposition" class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="blockid" value="{x2;$block['blockid']}">
                                <input type="hidden" name="modifyblock" value="1">
                                <input type="hidden" name="page" value="{x2;$apge}">
                            </div>
                        </div>
                    </form>
                    {x2;elseif:$block['blocktype'] == 2}
                    <form action="?content-master-blocks-modify" method="post" class="form-horizontal" style="margin-top:20px;">
                        <div class="form-group">
                            <label for="block" class="control-label col-sm-2">名称：</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="block" type="text" name="args[block]" needle="needle" msg="您必须输入名称" max="40" value="{x2;$block['block']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockposition" class="control-label col-sm-2">位置：</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="blockposition" type="text" name="args[blockposition]" needle="needle" msg="您必须输入内容所在位置" max="40" value="{x2;$block['blockposition']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_app" class="control-label col-sm-2">选择应用：</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="blockcontent_app" name="args[blockcontent][app]" needle="needle" msg="您必须选择应用">
                                    <option value="">请选择应用</option>
                                    {x2;tree:$apps,app,aid}
                                    <option value="{x2;v:app['appid']}"{x2;if:$block['blockcontent']['app'] == v:app['appid']} selected{x2;endif}>{x2;v:app['appname']}</option>
                                    {x2;endtree}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_catid" class="control-label col-sm-2">分类ID：</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="blockcontent_catid" type="text" name="args[blockcontent][catid]" datatype="number" needle="needle" msg="您必须输入调用分类的ID" value="{x2;$block['blockcontent']['catid']}">
                                <div class="intro">请在分类列表里查看分类ID</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_query" class="control-label col-sm-2">查询条件：</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" id="blockcontent_query" name="args[blockcontent][query]" rows="7" cols="4">{x2;$block['blockcontent']['query']}</textarea>
                                <div class="intro">每行一个条件</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_number" class="control-label col-sm-2">调用数量：</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="blockcontent_number" type="text" name="args[blockcontent][number]" value="{x2;$block['blockcontent']['number']}" needle="needle" datatype="number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_template" class="control-label col-sm-2">模板：</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" id="blockcontent_template" name="args[blockcontent][template]" rows="7" needle="needle" cols="4" msg="您必须输入模板内容">{x2;$block['blockcontent']['template']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockposition" class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="blockid" value="{x2;$block['blockid']}">
                                <input type="hidden" name="page" value="{x2;$apge}">
                                <input type="hidden" name="modifyblock" value="1">
                            </div>
                        </div>
                    </form>
                    {x2;elseif:$block['blocktype'] == 3}
                    <form action="?content-master-blocks-modify" method="post" class="form-horizontal" style="margin-top:20px;">
                        <div class="form-group">
                            <label for="block" class="control-label col-sm-2">名称：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="block" name="args[block]" needle="needle" msg="您必须输入名称" max="40" value="{x2;$block['block']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockposition" class="control-label col-sm-2">位置：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="blockposition" name="args[blockposition]" needle="needle" msg="您必须输入内容所在位置" max="40" value="{x2;$block['blockposition']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_dbtable" class="control-label col-sm-2">表名：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="blockcontent_dbtable" name="args[blockcontent][dbtable]" value="{x2;$block['blockcontent']['dbtable']}">
                                <div class="intro">多个表名请使用英文逗号隔开</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_query" class="control-label col-sm-2">查询条件：</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" id="blockcontent_query" name="args[blockcontent][query]" rows="7" cols="4">{x2;$block['blockcontent']['query']}</textarea>
                                <div class="intro">多个表名请使用英文逗号隔开</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_order" class="control-label col-sm-2">排序：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="blockcontent_order" name="args[blockcontent][order]" value="{x2;$block['blockcontent']['order']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_limit_0" class="control-label col-sm-2">起始数：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="blockcontent_limit_0" name="args[blockcontent][limit][0]" value="{x2;$block['blockcontent']['limit'][0]}" datatype="number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_limit_1" class="control-label col-sm-2">数量：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="blockcontent_limit_1" name="args[blockcontent][limit][1]"  value="{x2;$block['blockcontent']['limit'][1]}" needle="needle" datatype="number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_sql" class="control-label col-sm-2">手写SQL</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" id="blockcontent_sql" name="args[blockcontent][sql]" rows="7" cols="4">{x2;$block['blockcontent']['sql']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_index" class="control-label col-sm-2">索引键：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="blockcontent_index" name="args[blockcontent][index]" value="{x2;$block['blockcontent']['index']}" datatype="number">
                                <div class="intro">多个键名请使用英文逗号隔开</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_serial" class="control-label col-sm-2">反序列键：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="blockcontent_serial" name="args[blockcontent][serial]" value="{x2;$block['blockcontent']['serial']}" datatype="number">
                                <div class="intro">多个键名请使用英文逗号隔开</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_template" class="control-label col-sm-2">模板：</label>
                            <div class="col-sm-9">
                                <div class="Codemirror"></div>
                                <textarea class="form-control hide blockcontent_content" id="blockcontent_template" name="args[blockcontent][template]" needle="needle" rows="7" cols="4" msg="您必须输入模板内容">{x2;$block['blockcontent']['template']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockposition" class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary tplbutton" type="button">提交</button>
                                <input type="hidden" name="blockid" value="{x2;$block['blockid']}">
                                <input type="hidden" name="page" value="{x2;$apge}">
                                <input type="hidden" name="modifyblock" value="1">
                            </div>
                        </div>
                    </form>
                    {x2;elseif:$block['blocktype'] == 4}
                    <form action="index.php?content-master-blocks-modify" method="post" id="tplform" class="form-horizontal" style="margin-top:20px;">
                        <div class="form-group">
                            <label for="block" class="control-label col-sm-2">名称：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" name="args[block]" id="block" needle="needle" msg="您必须输入名称" max="40" value="{x2;$block['block']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockposition" class="control-label col-sm-2">位置：</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="blockposition" name="args[blockposition]" needle="needle" msg="您必须输入内容所在位置" max="40" value="{x2;$block['blockposition']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockcontent_content" class="control-label col-sm-2">内容：</label>
                            <div class="col-sm-9">
                                <div class="Codemirror"></div>
                                <textarea class="form-control hide blockcontent_content" name="args[blockcontent][content]" rows="17" cols="4">{x2;$block['blockcontent']['content']}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="blockposition" class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary tplbutton" type="button">提交</button>
                                <input type="hidden" name="blockid" value="{x2;$block['blockid']}">
                                <input type="hidden" name="page" value="{x2;$apge}">
                                <input type="hidden" name="modifyblock" value="1">
                            </div>
                        </div>
                    </form>
                    {x2;endif}
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
{x2;include:code}
{x2;include:footer}
</body>
</html>
{x2;endif}
