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
                            <a href="index.php?docs-app-docs&docid={x2;$doc['docid']}" class="badge pull-right"> 返回 </a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border morepadding">
                                <h2 class="shorttitle text-center">{x2;$doc['doctitle']}</h2>
                                <div class="intro">
                                    <div class="desc" id="content">
                                        {x2;if:$doc['doccontentid'] == $doc['content']['dhid']}
                                        <p class="alert alert-info" style="margin-top: 15px;">本内容为当前使用版本</p>
                                        {x2;else}
                                        <p class="alert alert-danger" style="margin-top: 15px;">本内容为历史版本</p>
                                        {x2;endif}
                                        {x2;realhtml:$doc['content']['dhcontent']}
                                    </div>
                                </div>
                            </li>
                            <li class="border padding">
                                <div class="intro">
                                    <div class="desc">
                                        <p>
                                            <span class="pull-right">
                                                <em>本版提交时间 {x2;date:$doc['content']['dhtime'],'Y-m-d H:i:s'}</em>
                                            </span>
                                        </p>
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
