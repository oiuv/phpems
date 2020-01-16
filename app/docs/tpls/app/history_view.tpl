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
                        <div class="col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="index.php">首页</a></li>
                                <li><a href="index.php?docs-app-docs&docid={x2;$doc['docid']}">{x2;$doc['doctitle']}</a></li>
                                <li class="active">历史版本详情</li>
                            </ol>
                        </div>

                        {x2;if:$doc['doccontentid'] == $doc['content']['dhid']}
                        <p class="alert alert-info">本内容为当前使用版本</p>
                        {x2;else}
                        <p class="alert alert-danger">本内容为历史版本</p>
                        {x2;endif}
                        <div class="col-xs-12">
                            <h2 class="text-left">{x2;$doc['doctitle']}
                                <span class="pull-right">
                                    <a class="btn btn-primary" href="index.php?docs-app-docs&docid={x2;$doc['docid']}">返回词条</a>
                                    <a class="btn btn-danger" href="index.php?docs-app-docs-history&docid={x2;$doc['docid']}">其他版本</a>
                                </span>
                            </h2>
                        </div>
                        <div class="col-xs-12" id="content">
                            {x2;realhtml:$doc['content']['dhcontent']}
                        </div>
                        <div class="col-xs-12">
                            <hr/>
                            <p>
                                <span class="pull-right">
                                    <em>本版提交时间 {x2;date:$doc['content']['dhtime'],'Y-m-d H:i:s'}</em>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
<script>
    $(function(){
        $('#content .wikititle').each(function(){
            var _this = $(this);
            _this.attr('id',Math.random().toString().substr(2))
            if(_this[0].tagName.toUpperCase() == 'H1')
            {
                $('#lemma').append($('<a href="#'+_this.attr('id')+'" class="list-group-item active">'+_this.html()+'</a>'));
            }
            else
            {
                $('#lemma').append($('<a href="#'+_this.attr('id')+'" class="list-group-item">'+_this.html()+'</a>'));
            }
        });
    });
</script>
</body>
</html>