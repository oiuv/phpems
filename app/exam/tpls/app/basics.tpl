{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                {x2;endif}
                <div class="col-xs-9">
                    <div class="content-box padding">
                        <h2 class="title">考场列表</h2>
                        <ul class="list-box list-unstyled">
                            {x2;tree:$basics['data'],basic,bid}
                            <li class="col-xs-4 box">
                                <a href="index.php?{x2;$_app}-app-basics-detail&basicid={x2;v:basic['basicid']}">
                                    <div class="img">
                                        <img src="{x2;if:v:basic['basicthumb']}{x2;v:basic['basicthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" />
                                    </div>
                                    <h5 class="box-title">{x2;v:basic['basic']}</h5>
                                    <div class="intro">
                                        <p>{x2;substring:v:basic['basicdescribe'],78}</p>
                                    </div>
                                </a>
                            </li>
                            {x2;if:v:bid < count($basics['data']) && v:bid % 3 == 0}
                        </ul>
                        <ul class="list-box list-unstyled">
                            {x2;endif}
                            {x2;endtree}
                        </ul>
                        {x2;if:$basics['pages']}
                        <ul class="list-img">
                            <li class="border padding">
                                <ul class="pagination pull-right">
                                    {x2;$basics['pages']}
                                </ul>
                            </li>
                        </ul>
                        {x2;endif}
                    </div>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">我的考场</h2>
                        <ul class="list-unstyled list-img">
                            {x2;if:is_array($data)}
                            {x2;tree:$data['openbasics'],basic,bid}
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
                            {x2;endif}
                        </ul>
                    </div>
                </div>
                {x2;if:!$userhash}
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
</body>
</html>
{x2;endif}
