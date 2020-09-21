{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-3" style="width: 20%">
                    <div class="content-box padding">
                        {x2;include:menu}
                    </div>
                </div>
                <div class="col-xs-9 nopadding" style="width: 80%">
                    <div class="content-box padding">
                        <h2 class="title">
                            修改密码
                            <a href="index.php?user-center-privatement" class="badge pull-right">个人资料</a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <div class="desc">
                                    <form action="index.php?user-center-privatement-password" method="post" class="form-horizontal">
                                        <fieldset>
                                            <div class="form-group underline">
                                                <div class="col-xs-2 tip">
                                                    旧密码
                                                </div>
                                                <div class="col-xs-8">
                                                    <input id="oldpassowrd" placeholder="请输入旧密码" type="password" name="oldpassword" needle="true" datatype="password" msg="密码字数必须在6位以上"/>
                                                </div>
                                            </div>
                                            <div class="form-group underline">
                                                <div class="col-xs-2 tip">
                                                    新密码
                                                </div>
                                                <div class="col-xs-8">
                                                    <input id="passowrd1" placeholder="请输入新密码" type="password" name="args[password]" needle="true" datatype="password" msg="密码字数必须在6位以上"/>
                                                </div>
                                            </div>
                                            <div class="form-group underline">
                                                <div class="col-xs-2 tip">
                                                    重复密码
                                                </div>
                                                <div class="col-xs-8">
                                                    <input id="password2" placeholder="请再次输入新密码" type="password" name="args[password2]" needle="true" equ="passowrd1" msg="前后两次密码必须一致且不能为空"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-2"></label>
                                                <div class="col-sm-10">
                                                    <button class="btn btn-primary" type="submit">提交</button>
                                                    <input type="hidden" name="modifyuserpassword" value="1"/>
                                                    <input type="hidden" name="page" value="{x2;$page}"/>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            {x2;include:footer}
        </div>
    </div>
</div>
</body>
</html>
