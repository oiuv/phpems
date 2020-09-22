{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">我的考场</div>
            <div class="col-1">
                <a href="index.php?exam-phone-basics" class="ajax">
                    <span class="iconfont icon-plus-circle"></span>
                </a>
            </div>
        </div>
        <div class="page-content header">
            <div class="list-box bg">
                <ol>
                    {x2;if:is_array($basics)}
                    {x2;tree:$basics,basic,bid}
                    <li class="unstyled">
                        <div class="col-4x">
                            <div class="rows illus">
                                <img src="{x2;if:v:basic['basicthumb']}{x2;v:basic['basicthumb']}{x2;else}files/public/img/paper.jpg{x2;endif}">
                            </div>
                        </div>
                        <div class="col-4l">
                            <a href="index.php?{x2;$_app}-phone-index-setCurrentBasic&basicid={x2;v:basic['basicid']}" class="ajax">
                                <div class="rows info">
                                    <h5 class="title">{x2;v:basic['basic']}</h5>
                                    <p class="intro">{x2;substring:v:basic['basicdescribe'],72}</p>
                                </div>
                            </a>
                        </div>
                    </li>
                    {x2;endtree}
                    {x2;else}
                    {x2;endif}
                </ol>
            </div>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
