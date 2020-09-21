{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">{x2;$cat['catname']}</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header{x2;if:$contents['pages']} footer{x2;endif}">
            <div class="list-box bg top">
                <ol>
                    {x2;tree:$contents['data'],content,cid}
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
                </ol>
            </div>
        </div>
        {x2;if:$contents['pages']}
        <div class="page-footer">
            <ul class="pagination">{x2;$contents['pages']}</ul>
        </div>
        {x2;endif}
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
