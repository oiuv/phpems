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
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-master-module">用户模型</a></li>
                            <li class="active">模型预览</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox">
                    <h4 class="title" style="padding:10px;">
                        {x2;$module['modulename']}
                        <span class="pull-right">
                            <a class="btn btn-primary dropdown-toggle" href="#" data-toggle="dropdown">模型列表<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="index.php?{x2;$_app}-master-module">模型列表</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="index.php?{x2;$_app}-master-module-fields&moduleid={x2;$module['moduleid']}">字段管理</a>
                                </li>
                            </ul>
                        </span>
                    </h4>
                    <form class="form-horizontal">
                        <fieldset>
                            {x2;tree:$forms,form,fid}
                            <div class="form-group">
                                <label for="{x2;v:form['id']}" class="control-label col-sm-2">{x2;v:form['title']}：</label>
                                <div class="col-sm-9">
                                {x2;v:form['html']}
                                </div>
                            </div>
                            {x2;endtree}
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
