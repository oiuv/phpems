{x2;if:!$userhash}
{x2;include:header}
<body>
<div id="content">
    <div class="pages" id="basic">
{x2;endif}
        <div class="pagecontent">
            <header class="container-fluid" style="background-color:#337AB7;">
                <h5 class="text-center">
                    <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
                    考场列表
                    <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
                </h5>
            </header>
            <div class="container-fluid">
                {x2;tree:$basics['data'],basic,bid}
                <div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem">
                    <div class="col-xs-12" style="padding-left:0px;">
                        <div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:0.3rem 0.2rem 0.8rem 0.2rem;">
                            <div class="col-xs-4">
                                <a href="index.php?exam-phone-basics-detail&basicid={x2;v:basic['basicid']}" class="ajax" data-page="basic" data-target="basic"><img src="{x2;if:v:basic['basicthumb']}{x2;v:basic['basicthumb']}{x2;else}app/exam/styles/image/paper.png{x2;endif}" style="width:10rem;margin-top:0.5rem"/></a>
                            </div>
                            <div class="col-xs-8" style="padding:0.2rem;">
                                <div class="text-left" style="padding:0.2rem;">
                                    <a href="index.php?exam-phone-basics-detail&basicid={x2;v:basic['basicid']}" class="ajax" data-page="basic" data-target="basic">
                                        <h5>
                                            {x2;v:basic['basic']}
                                            {x2;if:$data['openbasics'][v:basic['basicid']]}
                                            <b class="text-info" style="font-size:1rem;">已开通</b>
                                            {x2;elseif:v:basic['basicdemo']}
                                            <b class="text-success" style="font-size:1rem;">免费</b>
                                            {x2;endif}
                                        </h5>
                                        <p style="font-size:1rem;">{x2;v:basic['basicdescribe']}</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {x2;endtree}
                {x2;if:$basics['pages']}
                <div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem">
                    <div class="col-xs-12" style="padding-left:0px;">
                        <ul class="pagination pull-right">
                            {x2;$basics['pages']}
                        </ul>
                    </div>
                </div>
                {x2;endif}
            </div>
            {x2;include:footer}
        </div>
        {x2;if:!$userhash}
    </div>
</div>
</body>
</html>
{x2;endif}
