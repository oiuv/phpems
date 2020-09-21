    <div class="pagecontent">
        {x2;if:$cat['catid']}
        <header class="container-fluid" style="background-color:#337AB7;">
            <h5 class="text-center">
                <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
                {x2;$cat['catname']}
                <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
            </h5>
        </header>
        {x2;tree:$contents['data'],content,cid}
        <div style="width:95%;margin:auto;margin-top:0.6rem;background-color:#FFFFFF;overflow:hidden;padding:1.2rem;">
            <a class="ajax" href="index.php?content-phone-content&contentid={x2;v:content['contentid']}" data-target="contentpage" data-page="contentpage">{x2;substring:v:content['contenttitle'],48} <span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
        </div>
        <ul class="pagination pull-right">
            {x2;$contents['pages']}
        </ul>
        {x2;endtree}
        {x2;else}
        <header class="container-fluid" style="background-color:#337AB7;">
            <h5 class="text-center">
                <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
                资讯信息
                <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
            </h5>
        </header>
        {x2;tree:$catchildren,cat,cid}
        <div style="width:95%;margin:auto;margin-top:0.6rem;background-color:#FFFFFF;overflow:hidden;padding:1.2rem;">
            <a class="ajax" href="index.php?content-phone-category&catid={x2;v:cat['catid']}">{x2;v:cat['catname']} <span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
        </div>
        {x2;endtree}
        {x2;endif}
    </div>
