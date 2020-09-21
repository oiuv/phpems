{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">开通考场</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header{x2;if:$basics['pages']} footer{x2;endif}">
            <div class="list-box bg">
                <ol>
                    {x2;tree:$basics['data'],basic,bid}
                    <li class="unstyled">
                        <div class="col-4x">
                            <div class="rows illus">
                                {x2;if:$data['openbasics'][v:basic['basicid']]}<span class="badge">已开通</span> {x2;endif}
                                <img src="{x2;if:v:basic['basicthumb']}{x2;v:basic['basicthumb']}{x2;else}files/public/img/paper.jpg{x2;endif}">
                            </div>
                        </div>
                        <div class="col-4l">
                            <a href="index.php?exam-phone-basics-detail&basicid={x2;v:basic['basicid']}" class="ajax">
                                <div class="rows info">
                                    <h5 class="title">{x2;v:basic['basic']}</h5>
                                    <p class="intro">{x2;substring:v:basic['basicdescribe'],72}</p>
                                </div>
                            </a>
                        </div>
                    </li>
                    {x2;endtree}
                </ol>
            </div>
        </div>
        {x2;if:$basics['pages']}
        <div class="page-footer">
            <ul class="pagination">{x2;$basics['pages']}</ul>
        </div>
        {x2;endif}
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
