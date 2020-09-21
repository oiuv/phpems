{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">新闻资讯</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header">
            {x2;tree:$contents,contents,cid}
            <div class="list-box bg top">
                <ol>
                    <li class="unstyled">
                        {x2;eval: v:cat = $catids[v:key]}
                        <h4 class="bigtitle">{x2;v:cat['catname']}</h4>
                    </li>
                    {x2;tree:v:contents['data'],content,cid}
                    <li class="unstyled">
                        <div class="rows">
                            <a class="ajax" href="index.php?content-phone-content&contentid={x2;v:content['contentid']}">
                                <div class="intro">
                                    {x2;v:content['contenttitle']}
                                </div>
                            </a>
                        </div>
                    </li>
                    {x2;endtree}
                    <li class="unstyled">
                        <div class="rows">
                            <a class="ajax" href="index.php?content-phone-category&catid={x2;v:cat['catid']}">
                                <div class="intro text-right">
                                    更多消息 &gt;&gt;
                                </div>
                            </a>
                        </div>
                    </li>
                </ol>
            </div>
            {x2;endtree}
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
