{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">个人设置</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header">
            <form class="top" action="index.php?user-phone-privatement" method="post">
                {x2;tree:$forms,form,fid}
                <div class="form-group underline">
                    <div class="col-3 tip">
                        {x2;v:form['title']}
                    </div>
                    <div class="col-7">
                        {x2;v:form['html']}
                    </div>
                </div>
                {x2;endif}
                <div class="form-group"></div>
                <div class="form-group">
                    <input type="hidden" name="modifyuserinfo" value="1"/>
                    <button class="primary block">修改设置</button>
                </div>
            </form>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
