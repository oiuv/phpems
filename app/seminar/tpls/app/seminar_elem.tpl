{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-9">
                    <div class="content-box padding">
                        <h2 class="title">{x2;$elem['seltitle']}</h2>
                        <ul class="list-unstyled list-img">
                            {x2;tree:$contents['data'],content,cid}
                            <li class="border morepadding">
                                <h4 class="shorttitle">{x2;v:content['contenttitle']}</h4>
                                <div class="intro">
                                    {x2;if:v:content['contentthumb']}
                                    <div class="col-xs-3 img">
                                        <img src="{x2;v:content['contentthumb']}" />
                                    </div>
                                    {x2;endif}
                                    <div class="desc">
                                        <p>{x2;v:content['contentdescribe']}</p>
                                        <p class="toolbar">
                                            {x2;date:v:content['contentinputtime'],'Y-m-d'}
                                            <a href="index.php?content-app-content&contentid={x2;v:content['contentid']}" class="btn btn-info pull-right more">查看详细</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            {x2;endif}
                            {x2;if:$contents['pages']}
                            <li class="border morepadding">
                                <ul class="pagination pull-right">
                                    {x2;$contents['pages']}
                                </ul>
                            </li>
                            {x2;endif}
                        </ul>
                    </div>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">推荐专题</h2>
                        <ul class="list-unstyled list-img">
                            {x2;tree:$topseminars['data'],seminar,sid}
                            <li class="border padding">
                                <a href="index.php?seminar-app-seminar&seminarid={x2;v:seminar['pccontentid']}">
                                    <div class="intro">
                                        <div class="col-xs-5 img noleftpadding">
                                            <img src="{x2;v:seminar['pcthumb']}" />
                                        </div>
                                        <div class="desc">
                                            <p>{x2;v:seminar['pctitle']}</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
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
