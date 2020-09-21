{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-12">
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;$cat['catname']}
                            <a href="index.php?content-app" class="badge pull-right"> 返回 </a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <h4 class="shorttitle text-center">{x2;$cat['catname']}</h4>
                            </li>
                            <li class="border morepadding">
                                <div class="intro">
                                    <div class="desc" id="content">
                                        {x2;realhtml:$cat['catdesc']}
                                    </div>
                                </div>
                            </li>
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
