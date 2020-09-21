{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
{x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1">&nbsp;</div>
            <div class="col-8">扫码登陆</div>
            <div class="col-1">&nbsp;</div>
        </div>
        <div class="page-content header">
            <div class="list-box" style="margin-top: 0.20rem;margin-bottom: 0.15rem;">
                <ol>
                    <li class="unstyled">
                        <div class="text-center">
                            <img src="{x2;$user['userphoto']}" class="circle" style="width: 0.96rem;"/>
                        </div>
                    </li>
                </ol>
            </div>
            <form class="top">
                <div class="form-group text-center">
                    用户{x2;$user['username']}已成功登陆！
                </div>
                <div class="form-group">
                    <a href="javascript:;" onclick="javascript:WeixinJSBridge.call('closeWindow');" class="btn success block">关闭</a>
                </div>
            </form>
        </div>
    </div>
{x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
