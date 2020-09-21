{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-9">
                    <div class="content-box padding">
                        <h2 class="title">我的证书<a href="index.php?certificate-app-certificate" class="badge pull-right">申请证书 <em class="glyphicon glyphicon-plus"></em> </a> </h2>
                        <ul class="list-unstyled list-img">
                            {x2;tree:$certificates['data'],certificate,cid}
                            <li class="border morepadding">
                                <h4 class="shorttitle">{x2;v:certificate['cetitle']}</h4>
                                <div class="intro">
                                    <div class="col-xs-3 img">
                                        <img src="{x2;v:certificate['cethumb']}" />
                                    </div>
                                    <div class="desc">
                                        <p>{x2;v:certificate['cedescribe']}</p>
                                        <p class="toolbar">
                                            申请时间：{x2;date:v:certificate['ceqtime'],'Y-m-d H:i:s'}
                                            <a class="btn btn-info pull-right more">{x2;$status[v:certificate['ceqstatus']]}</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            {x2;endtree}
                        </ul>
                    </div>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">最新证书</h2>
                        <ul class="list-unstyled list-img">
                            {x2;if:is_array($news)}
                            {x2;tree:$news,certificate,cid}
                            <li class="border padding">
                                <a href="index.php?certificate-app-certificate-apply&ceid={x2;v:certificate['ceid']}">
                                    <div class="intro">
                                        <div class="col-xs-5 img noleftpadding">
                                            <img src="{x2;if:v:certificate['cethumb']}{x2;v:certificate['cethumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" />
                                        </div>
                                        <div class="desc">
                                            <p>{x2;v:certificate['cetitle']}</p>
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
