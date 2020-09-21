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
        <div class="page-content header">
            <div class="list-box bg">
                <ol>
                    <li class="unstyled">
                        <h4 class="title text-center">{x2;$content['contenttitle']}</h4>
                    </li>
                    <li class="unstyled">
                        <div class="rows">
                            发布人：{x2;$content['contentusername']} &nbsp; 阅读量：{x2;$content['contentview']}
                        </div>
                    </li>
                    <li class="unstyled">
                        <div class="rows">
                            {x2;realhtml:$content['contenttext']}
                        </div>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            $.get("index.php?content-phone-content-setview&contentid={x2;$content['contentid']}&"+Math.random());
        });
    </script>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
