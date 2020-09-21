{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="fa fa-chevron-left"></span></div>
            <div class="col-8">申请证书</div>
            <div class="col-1">
                <a href="index.php?certificate-phone-certificate" class="ajax">
                    <span class="fa fa-plus-circle"></span>
                </a>
            </div>
        </div>
        <div class="page-content header{x2;if:$certificates['pages']} footer{x2;endif}">
            <div class="list-box bg">
                <ol>
                    {x2;tree:$certificates['data'],certificate,bid}
                    <li class="unstyled">
                        <div class="col-4x">
                            <div class="rows illus">
                                <a href="index.php?certificate-phone-certificate-apply&ceid={x2;v:certificate['ceid']}" class="ajax">
                                    <img src="{x2;v:certificate['cethumb']}">
                                </a>
                            </div>
                        </div>
                        <div class="col-4l">
                            <div class="rows info">
                                <a href="index.php?certificate-phone-certificate-apply&ceid={x2;v:certificate['ceid']}" class="ajax">
                                    <h5 class="title">{x2;v:certificate['cetitle']}</h5>
                                    <p class="more">{x2;date:v:certificate['cetime'],'Y-m-d'}</p>
                                </a>
                            </div>
                        </div>
                    </li>
                    {x2;endtree}
                </ol>
            </div>
        </div>
        {x2;if:$certificates['pages']}
        <div class="page-footer">
            <ul class="pagination">{x2;$certificates['pages']}</ul>
        </div>
        {x2;endif}
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
