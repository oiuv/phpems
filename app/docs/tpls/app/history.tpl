{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-3">
                    <div class="content-box padding" id="questionindex" data-spy="affix" data-offset-top="150" style="top:-15px;">
                        <h2 class="title">导航</h2>
                        <ul class="list-unstyled list-txt">
                            <li class="border"><a href="index.php?docs-app-mydoc-edit&docid={x2;$doc['docid']}">编辑词条</a></li>
                            <li class="border active"><a href="index.php?docs-app-docs-history&docid={x2;$doc['docid']}">历史版本</a></li>
                            <li class="border">
                                {x2;if:$_user['userid']}
                                <a href="index.php?docs-app-mydoc-history&docid={x2;$doc['docid']}">我的贡献</a>
                                {x2;else}
                                <a href="javascript:;" onclick="javascript:$.loginbox.show();">我的贡献</a>
                                {x2;endif}
                            </li>
                            <li class="border"><a href="index.php?docs-app-docs&docid={x2;$doc['docid']}">返回词条</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-9 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;$doc['doctitle']}
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <div class="intro">
                                    <div class="desc">
                                        <table class="table table-bordered">
                                            <tr class="bg-info">
                                                <th width="80">ID</th>
                                                <th>修改日志</th>
                                                <th width="180">编辑时间</th>
                                                <th width="100">协作用户</th>
                                            </tr>
                                            {x2;tree:$histories['data'],history,hid}
                                            <tr>
                                                <td>{x2;v:history['dhid']}</td>
                                                <td>{x2;if:$doc['doccontentid'] == v:history['dhid']}【 当前版本 】{x2;endif}<a href="index.php?docs-app-docs-viewhistory&dhid={x2;v:history['dhid']}">{x2;v:history['dhtitle']}</a></td>
                                                <td>{x2;date:v:history['dhtime'],'Y-m-d H:i:s'}</td>
                                                <td>{x2;v:history['dhusername']}</td>
                                            </tr>
                                            {x2;endtree}
                                        </table>
                                    </div>
                                </div>
                            </li>
                            {x2;if:$histories['pages']}
                            <li class="border padding">
                                <ul class="pagination pull-right">
                                    {x2;$histories['pages']}
                                </ul>
                            </li>
                            {x2;endif}
                        </ul>
                    </div>
                </div>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
</body>
</html>
