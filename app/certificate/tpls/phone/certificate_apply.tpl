{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="fa fa-chevron-left"></span></div>
            <div class="col-8">{x2;$ce['cetitle']}</div>
            <div class="col-1"></div>
        </div>
        <div class="page-content header footer">
            <form class="top" action="index.php?certificate-phone-certificate-apply&ceid={x2;$ce['ceid']}" method="post">
                <div class="form-group underline">
                    <div class="col-3 tip">
                        姓名
                    </div>
                    <div class="col-7">
                        <input type="text" needle="needle" msg="请填写真实姓名" class="noborder" name="args[usertruename]" value="" placeholder="请填写真实姓名">
                    </div>
                </div>
                <div class="form-group underline">
                    <div class="col-3 tip">
                        身份证号
                    </div>
                    <div class="col-7">
                        <input type="text" needle="needle" msg="请填写身份证号" class="noborder" name="args[userpassport]" value="" placeholder="请填写身份证号">
                    </div>
                </div>
                <div class="form-group underline">
                    <div class="col-3 tip">
                        手机号码
                    </div>
                    <div class="col-7">
                        <input type="text" needle="needle" msg="请填写手机号码" class="noborder" name="args[userphone]" value="" placeholder="请填写手机号码">
                    </div>
                </div>
                <div class="form-group underline">
                    <div class="col-3 tip">
                        地址
                    </div>
                    <div class="col-7">
                        <input type="text" needle="needle" msg="请填写地址" class="noborder" name="args[userpassport]" value="" placeholder="请填写地址">
                    </div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="apply" value="1">
                    <button class="primary block">申请</button>
                </div>
            </form>
        </div>
        <div class="page-footer">
            <div class="col-5 menu active">
                <span class="fa fa-play-circle"></span><br />
                申请
            </div>
            <div class="col-5 menu">
                <span class="fa fa-compass"></span><br />
                简介
            </div>
        </div>
    </div>
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="fa fa-chevron-left"></span></div>
            <div class="col-8">{x2;$ce['cetitle']}</div>
            <div class="col-1"></div>
        </div>
        <div class="page-content header footer">
            <div class="list-box bg">
                <ol>
                    <li class="unstyled">
                        <div class="rows">
                            {x2;realhtml:$ce['cetext']}
                        </div>
                    </li>
                </ol>
            </div>
        </div>
        <div class="page-footer">
            <div class="col-5 menu">
                <span class="fa fa-play-circle"></span><br />
                申请
            </div>
            <div class="col-5 menu active">
                <span class="fa fa-compass"></span><br />
                简介
            </div>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
