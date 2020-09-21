    <div class="pagecontent">
        <header class="container-fluid" style="background-color:#337AB7;">
            <h5 class="text-center">
                <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
                {x2;$knows['knows']}
                <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
            </h5>
        </header>
        <div class="container-fluid">
            {x2;tree:$questype,quest,qid}
            {x2;if:$numbers[v:quest['questid']]}
            <div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;margin-bottom:0.5rem;">
                <a class="ajax" href="index.php?exam-phone-lesson-ajax-setlesson&questype={x2;v:quest['questid']}&knowsid={x2;$knows['knowsid']}" data-target="paper" data-page="paper">
                    {x2;v:quest['questype']}（共{x2;$numbers[v:quest['questid']]}题）
                    <span class="glyphicon glyphicon-chevron-right pull-right"></span>
                </a>
            </div>
            {x2;endif}
            {x2;endtree}
        <div>
    </div>
