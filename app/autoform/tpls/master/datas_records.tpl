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
                                <li class="active">表单记录</li>
                            </ol>
                        </div>
                    </div>
                    <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                        <h4 class="title" style="padding:10px;">
                            {x2;$module['modulename']}
                        </h4>
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr class="info">
                                    <th>ID</th>
                                    {x2;tree:$fields,field,fid}
                                    <th>{x2;v:field['fieldtitle']}</th>
                                    {x2;endtree}
                                    <th width="80">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {x2;tree:$rs['data'],aform,mid}
                                <tr>
                                    <td>{x2;v:aform[$module['modulecode'].'id']}</td>
                                    {x2;tree:$fields,field,fid}
                                    <td class="{x2;v:field['field']}">{x2;if:v:field['fielddatatype'] == 'timestamp'}{x2;date:v:aform[v:field['field']],'Y-m-d H:i:s'}{x2;else}{x2;v:aform[v:field['field']]}{x2;endif}</td>
                                    {x2;endtree}
                                    <td>
                                        <div class="btn-group">
                                            <a class="btn" href="index.php?{x2;$_app}-master-datas-records&moduleid={x2;v:module['moduleid']}&page={x2;$page}{x2;$u}" title="数据"><em class="glyphicon glyphicon-remove"></em></a>
                                        </div>
                                    </td>
                                </tr>
                                {x2;endtree}
                            </tbody>
                        </table>
                        <ul class="pagination pull-right">
                            {x2;$rs['pages']}
                        </ul>
                    </div>
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
