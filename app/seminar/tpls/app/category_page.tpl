{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="box itembox" style="margin-bottom:0px;">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="index.php">首页</a></li>
                        <li class="active"><a href="index.php?content-app-category&catid={x2;$cat['catid']}">{x2;$cat['catname']}</a></li>
                    </ol>
                </div>
            </div>
            <div class="box itembox" style="padding-top:20px;">
                <div class="col-xs-12">
                    <h2 class="text-center">{x2;$cat['catname']}</h2>
                    <hr/>
                </div>
                <div class="col-xs-12" id="content">
                    {x2;realhtml:$cat['catdesc']}
                </div>
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
