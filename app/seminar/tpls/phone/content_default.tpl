<div class="pagecontent">
    <header class="container-fluid" style="background-color:#337AB7;">
        <h5 class="text-center">
            <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
            {x2;$cat['catname']}
            <a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
        </h5>
    </header>
    <div style="clear:both" class="col-xs-12" id="contenttext">
        <h4 class="text-center" style="overflow:hidden;clear:both;padding-top:0.2rem;border:">
            {x2;$content['contenttitle']}
        </h4>
        <hr />
        <div style="clear:both">
        {x2;realhtml:$content['contenttext']}
        </div>
    </div>
</div>
