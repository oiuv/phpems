{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-content footer">
            <div class="swiper-container" style="height: auto;">
                <div class="swiper-wrapper">
                    {x2;tree:$topimgs['data'],content,cid}
                    <div class="swiper-slide">
                        <a class="ajax" href="index.php?content-phone-content&contentid={x2;v:content['pccontentid']}">
                            <img src="{x2;v:content['pcthumb']}" style="max-width: 100%;"/>
                        </a>
                    </div>
                    {x2;endif}
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <div class="list-box bg top">
                <ol>
                    <li class="unstyled">
                        <h4 class="bigtitle">网站公告</h4>
                    </li>
                    {x2;tree:$notices['data'],content,lid}
                    <li class="unstyled">
                        <div class="rows">
                            <a class="ajax" href="index.php?content-phone-content&contentid={x2;v:content['contentid']}">
                                <div class="intro">
                                    {x2;v:content['contenttitle']}
                                </div>
                            </a>
                        </div>
                    </li>
                    {x2;endtree}
                </ol>
            </div>
            <div class="list-box bg top">
                <ol>
                    <li class="unstyled">
                        <h4 class="bigtitle">热点新闻</h4>
                    </li>
                    {x2;tree:$topnews['data'],content,cid}
                    <li class="unstyled">
                        <div class="rows">
                            <a class="ajax" href="index.php?content-phone-content&contentid={x2;v:content['contentid']}">
                                <div class="intro">
                                    {x2;v:content['contenttitle']}
                                </div>
                            </a>
                        </div>
                    </li>
                    {x2;endtree}
                    <li class="unstyled">
                        <div class="rows">
                            <a class="ajax" href="index.php?content-phone">
                                <div class="intro text-center">
                                    更多消息 &gt;&gt;
                                </div>
                            </a>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
        <div class="page-footer">
            <div class="col-4x menu active">
                <span class="iconfont icon-compass"></span><br />
                发现
            </div>
            <div class="col-4x menu">
                <span class="iconfont icon-play-circle"></span><br />
                课程
            </div>
            <div class="col-4x menu">
                <span class="iconfont icon-read"></span><br />
                考试
            </div>
            <div class="col-4x menu">
                <span class="iconfont icon-user"></span><br />
                我的
            </div>
        </div>
    </div>
    <div class="page-tabs">
        <div class="page-content footer">
            <div class="list-box bg">
                <ol>
                    <li class="unstyled">
                        <h4 class="bigtitle">最新课程</h4>
                    </li>
                    {x2;tree:$courses['data'],content,cid}
                    <li class="unstyled">
                        <div class="col-4x">
                            <div class="rows illus">
                                <a href="index.php?course-phone-course&csid={x2;v:content['csid']}" class="ajax">
                                    <img src="{x2;if:v:content['csthumb']}{x2;v:content['csthumb']}{x2;else}files/public/img/paper.jpg{x2;endif}">
                                </a>
                            </div>
                        </div>
                        <div class="col-4l">
                            <a href="index.php?course-phone-course&csid={x2;v:content['csid']}" class="ajax">
                                <div class="rows info">
                                    <h5 class="title">{x2;v:content['cstitle']}</h5>
                                    <p class="intro">{x2;substring:v:content['csdescribe'],42}</p>
                                </div>
                            </a>
                        </div>
                    </li>
                    {x2;endtree}
                    <li class="unstyled">
                        <div class="rows">
                            <a class="ajax" href="index.php?course-phone-index-lists">
                                <div class="intro text-center">
                                    更多课程 &gt;&gt;
                                </div>
                            </a>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
        <div class="page-footer">
            <div class="col-4x menu">
                <span class="iconfont icon-compass"></span><br />
                发现
            </div>
            <div class="col-4x menu active">
                <span class="iconfont icon-play-circle"></span><br />
                课程
            </div>
            <div class="col-4x menu">
                <span class="iconfont icon-read"></span><br />
                考试
            </div>
            <div class="col-4x menu">
                <span class="iconfont icon-user"></span><br />
                我的
            </div>
        </div>
    </div>
    <div class="page-tabs">
        <div class="page-content footer">
            <div class="list-box bg">
                <ol>
                    <li class="unstyled">
                        <h4 class="bigtitle">最新考场</h4>
                    </li>
                    {x2;tree:$basics['data'],basic,bid}
                    <li class="unstyled">
                        <div class="col-4x">
                            <div class="rows illus">
                                {x2;if:$data['openbasics'][v:basic['basicid']]}<span class="badge">已开通</span> {x2;endif}
                                <img src="{x2;if:v:basic['basicthumb']}{x2;v:basic['basicthumb']}{x2;else}files/public/img/paper.jpg{x2;endif}">
                            </div>
                        </div>
                        <div class="col-4l">
                            <a href="index.php?exam-phone-basics-detail&basicid={x2;v:basic['basicid']}" class="ajax">
                                <div class="rows info">
                                    <h5 class="title">{x2;v:basic['basic']}</h5>
                                    <p class="intro">{x2;substring:v:basic['basicdescribe'],72}</p>
                                </div>
                            </a>
                        </div>
                    </li>
                    {x2;endtree}
                    <li class="unstyled">
                        <div class="rows">
                            <a class="ajax" href="index.php?exam-phone-basics">
                                <div class="intro text-center">
                                    更多考试 &gt;&gt;
                                </div>
                            </a>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
        <div class="page-footer">
            <div class="col-4x menu">
                <span class="iconfont icon-compass"></span><br />
                发现
            </div>
            <div class="col-4x menu">
                <span class="iconfont icon-play-circle"></span><br />
                课程
            </div>
            <div class="col-4x menu active">
                <span class="iconfont icon-read"></span><br />
                考试
            </div>
            <div class="col-4x menu">
                <span class="iconfont icon-user"></span><br />
                我的
            </div>
        </div>
    </div>
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-10">我的</div>
        </div>
        <div class="page-content header footer">
            <div class="list-box bg">
                <ol>
                    {x2;if:$_user['userid']}
                    <li class="unstyled">
                        <div class="col-4">
                            <div class="rows illus">
                                <img src="{x2;if:$_user['userphoto']}{x2;$_user['userphoto']}{x2;else}files/public/img/paper.jpg{x2;endif}"/>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="rows info">
                                <h5 class="title">{x2;$_user['username']}</h5>
                                <p class="intro">手机号：{x2;$_user['userphone']}</p>
                                <p class="intro">积分：{x2;$_user['usercoin']}</p>
                            </div>
                        </div>
                    </li>
                    {x2;else}
                    <li class="unstyled">
                        <div class="rows text-center">
                            <a class="ajax btn primary bigpadding" href="index.php?user-phone-login"> 登录注册 </a>
                        </div>
                    </li>
                    {x2;endif}
                </ol>
            </div>
            <div class="list-box bg top">
                <ol>
                    <li class="unstyled">
                        <a href="index.php?course-phone" class="ajax">
                            <div class="rows info">
                                我的课程
                                <span class="pull-right"><em class="iconfont icon-right iconmenu"></em></span>
                            </div>
                        </a>
                    </li>
                    <li class="unstyled">
                        <a href="index.php?exam-phone" class="ajax">
                            <div class="rows info">
                                我的考场
                                <span class="pull-right"><em class="iconfont icon-right iconmenu"></em></span>
                            </div>
                        </a>
                    </li>
                    <li class="unstyled">
                        <a href="index.php?user-phone-payfor" class="ajax">
                            <div class="rows info">
                                积分充值
                                <span class="pull-right"><em class="iconfont icon-right iconmenu"></em></span>
                            </div>
                        </a>
                    </li>
                    <li class="unstyled">
                        <a href="index.php?user-phone-privatement-modifypass" class="ajax">
                            <div class="rows info">
                                修改密码
                                <span class="pull-right"><em class="iconfont icon-right iconmenu"></em></span>
                            </div>
                        </a>
                    </li>
                    {x2;if:$_user['useropenid'] && USEWX && v:this->ev->isWeixin()}
                    <li class="unstyled">
                        <a href="index.php?user-phone-privatement-unbind" class="ajax">
                            <div class="rows info">
                                解除微信绑定并退出
                                <span class="pull-right"><em class="iconfont icon-right iconmenu"></em></span>
                            </div>
                        </a>
                    </li>
                    {x2;endif}
                    {x2;if:$_user['userid']}
                    <li class="unstyled">
                        <div class="rows text-center">
                            <a class="ajax btn primary" href="index.php?user-phone-logout"> 安全退出 </a>
                        </div>
                    </li>
                    {x2;endif}
                </ol>
            </div>
        </div>
        <div class="page-footer">
            <div class="col-4x menu">
                <span class="iconfont icon-compass"></span><br />
                发现
            </div>
            <div class="col-4x menu">
                <span class="iconfont icon-play-circle"></span><br />
                课程
            </div>
            <div class="col-4x menu">
                <span class="iconfont icon-read"></span><br />
                考试
            </div>
            <div class="col-4x menu active">
                <span class="iconfont icon-user"></span><br />
                我的
            </div>
        </div>
    </div>
    <script>
        $(function(){
            var mySwiper = new Swiper ('.swiper-container',{
                autoplay: true,
                loop:true,
                pagination: {
                    el: '.swiper-pagination'
                }
            });
        });
    </script>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
