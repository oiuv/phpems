{x2;include:header}
<body>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="pages">
                {x2;include:nav}
                <div class="content">
                    <div class="col-xs-9">
                        <div class="content-box padding">
                            <h2 class="title">我的考场<a href="index.php?exam-app-basics-open" class="badge pull-right">所有考场 <em class="glyphicon glyphicon-plus"></em> </a></h2>
                            <ul class="list-box list-unstyled">
                                {x2;tree:$basics,basic,bid}
                                <li class="col-xs-4 box">
                                    <a href="index.php?{x2;$_app}-app-index-setCurrentBasic&basicid={x2;v:basic['basicid']}" class="ajax">
                                        <div class="img">
                                            <img src="{x2;if:v:basic['basicthumb']}{x2;v:basic['basicthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" />
                                        </div>
                                        <h5 class="box-title">{x2;v:basic['basic']}</h5>
                                        <div class="intro">
                                            <p>{x2;substring:v:basic['basicdescribe'],78}</p>
                                        </div>
                                    </a>
                                </li>
                                {x2;if:v:bid < count($basics) && v:bid % 3 == 0}
                            </ul>
                            <ul class="list-box list-unstyled">
                                {x2;endif}
                                {x2;endtree}
                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-3 nopadding">
                        <div class="content-box padding">
                            <h2 class="title">最新考场 </h2>
                            <ul class="list-unstyled list-img">
                                {x2;tree:$news,basic,bid}
                                <li class="border padding">
                                    <a href="index.php?{x2;$_app}-app-index-setCurrentBasic&basicid={x2;v:basic['basicid']}" class="ajax">
                                        <div class="intro">
                                            <div class="col-xs-5 img noleftpadding">
                                                <img src="{x2;if:v:basic['basicthumb']}{x2;v:basic['basicthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" />
                                            </div>
                                            <div class="desc">
                                                <p>{x2;v:basic['basic']}</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                {x2;endtree}
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
