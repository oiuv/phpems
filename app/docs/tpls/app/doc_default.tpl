{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-9">
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;$doc['doctitle']}
                            <a href="index.php?docs-app-category&catid={x2;$cat['catid']}" class="badge pull-right"> 返回 </a>
                            <a class="badge pull-right" href="index.php?docs-app-docs-history&docid={x2;$doc['docid']}">历史版本</a>
                            {x2;if:$_user['userid']}
                            <a class="badge pull-right" href="index.php?docs-app-mydoc-edit&docid={x2;$doc['docid']}">编辑词条</a>
                            {x2;else}
                            <a class="badge pull-right" href="javascript:;" onclick="javascript:$.loginbox.show();">编辑词条</a>
                            {x2;endif}
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border morepadding">
                                <h2 class="shorttitle text-center">{x2;$doc['doctitle']}</h2>
                                <div class="intro">
                                    <div class="desc" id="content">
                                        {x2;realhtml:$doc['content']['dhcontent']}
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding" id="questionindex" data-spy="affix" data-offset-top="150" style="top:-15px;">
                        <h2 class="title">导航</h2>
                        <ul class="list-unstyled list-txt" id="lemma"></ul>
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
                $('#lemma').append($('<li class="border active"><a href="#'+_this.attr('id')+'">'+_this.html()+'</a></li>'));
            }
            else
            {
                $('#lemma').append($('<li class="border"><a href="#'+_this.attr('id')+'">&nbsp;&nbsp;'+_this.html()+'</a></li>'));
            }
        });
    });
</script>
</body>
</html>
