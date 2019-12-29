{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-9">
                    <div class="content-box padding">
                        <h2 class="title">开通课程</h2>
                        <ul class="list-img list-unstyled">
                            <li class="border morepadding">
                                <h4 class="shorttitle">{x2;$course['cstitle']}</h4>
                                <div class="intro">
                                    <div class="col-xs-3 img">
                                        <img src="{x2;if:$course['csthumb']}{x2;$course['csthumb']}{x2;else}app/exam/styles/image/paper.png{x2;endif}" />
                                    </div>
                                    <div class="desc">
                                        <p>{x2;$course['csdescribe']}</p>
                                        <p class="toolbar">
                                            <a class="badge">当前积分：{x2;$_user['usercoin']}</a>
                                            <a class="badge" href="index.php?user-center-payfor">在线充值</a>
                                            <a class="badge" href="#myModal" role="button" data-toggle="modal">代金券充值</a>
                                        </p>
                                        <div class="toolbar">
                                            {x2;if:$isopen}
                                            <a class="btn btn-info pull-right more ajax" href="index.php?course-app-course&csid={x2;$course['csid']}">进入考场</a>
                                            {x2;else}
                                            {x2;if:!$allowopen}
                                            {x2;if:$course['csdemo']}
                                            <a class="btn btn-info pull-right more confirm" msg="确定要开通吗？" href="index.php?course-app-course-opencourse&opencs=1&csid={x2;$course['csid']}">免费开通</a>
                                            {x2;else}
                                            {x2;if:$price}
                                            选择要开通的时长
                                            <div class="more">
                                                {x2;tree:$price,p,pid}
                                                <a class="btn btn-primary confirm" msg="确定要开通吗？" href="index.php?course-app-course-opencourse&csid={x2;$course['csid']}&opencs=1&opentype={x2;v:key}">{x2;v:p['price']}积分兑换{x2;v:p['time']}天</a>
                                                {x2;endtree}
                                            </div>
                                            {x2;else}
                                            <a class="btn btn-default pull-right more" href="javascript:;">请管理员设置考场价格</a>
                                            {x2;endif}
                                            {x2;endif}
                                            {x2;else}
                                            <a class="btn btn-default pull-right more" href="javascript:;">您所在的用户组不能开通本考场</a>
                                            {x2;endif}
                                            {x2;endif}
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">最新课程<a href="index.php?course-app-index-lists" class="badge pull-right">更多 <em class="glyphicon glyphicon-plus"></em> </a> </h2>
                        <ul class="list-unstyled list-img">
                            {x2;if:is_array($news)}
                            {x2;tree:$news,content,cid}
                            <li class="border padding">
                                <a href="index.php?course-app-course&csid={x2;v:content['csid']}">
                                    <div class="intro">
                                        <div class="col-xs-5 img noleftpadding">
                                            <img src="{x2;if:v:content['csthumb']}{x2;v:content['csthumb']}{x2;else}app/core/styles/img/item.jpg{x2;endif}" />
                                        </div>
                                        <div class="desc">
                                            <p>{x2;v:content['cstitle']}</p>
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
<form aria-hidden="true" id="myModal" method="post" class="modal fade" role="dialog" aria-labelledby="#myModalLabel" action="index.php?exam-app-basics-coupon">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
                <h4 class="modal-title" id="myModalLabel">代金券充值</h4>
            </div>
            <div class="modal-body" id="modal-body">
                <div class="control-group">
                    <div class="controls">
                        <input placeholder="请输入16位代金券号码" type="text" class="form-control" name="couponsn" value="" needle="needle" msg="请输入16位代金券号码"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <input name="coupon" type="hidden" value="1">
                <button class="btn btn-primary" type="submit">充值</button>
            </div>
        </div>
    </div>
</form>
</body>
</html>
