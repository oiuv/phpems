{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-9">
                    <div class="content-box padding">
                        <h2 class="title">我的课程</h2>
                        <ul class="list-box list-unstyled">
                            {x2;tree:$contents['data'],content,cid}
                            <li class="col-xs-4 box">
                                <a href="index.php?course-app-course&csid={x2;v:content['csid']}">
                                    <div class="img">
                                        <img src="{x2;if:v:content['csthumb']}{x2;v:content['csthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" />
                                    </div>
                                    <h5 class="box-title">{x2;v:content['cstitle']}</h5>
                                    <div class="intro">
                                        <p>{x2;substring:v:content['csdescribe'],78}</p>
                                    </div>
                                </a>
                            </li>
                            {x2;if:v:cid < count($contents['data']) && v:cid % 3 == 0}
                        </ul>
                        <ul class="list-box list-unstyled">
                            {x2;endif}
                            {x2;endtree}
                        </ul>
                    </div>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">最新课程<a href="index.php?course-app-index-lists" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a> </h2>
                        <ul class="list-unstyled list-img">
                            {x2;if:is_array($news)}
                            {x2;tree:$news,content,cid}
                            <li class="border padding">
                                <a href="index.php?course-app-course&csid={x2;v:content['csid']}">
                                    <div class="intro">
                                        <div class="col-xs-5 img noleftpadding">
                                            <img src="{x2;if:v:content['csthumb']}{x2;v:content['csthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" />
                                        </div>
                                        <div class="desc">
                                            <p>{x2;v:content['cstitle']}</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            {x2;endtree}
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
