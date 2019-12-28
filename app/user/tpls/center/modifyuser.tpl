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
                            个人资料
                            <a href="index.php?user-center-privatement-password" class="badge pull-right">修改密码</a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <div class="desc">
                                    <form action="index.php?user-center-privatement" method="post" class="form-horizontal">
                                        <fieldset>
                                            {x2;tree:$forms,form,fid}
                                            <div class="form-group underline">
                                                <div class="col-xs-2 tip">
                                                    {x2;v:form['title']}
                                                </div>
                                                <div class="col-xs-8">
                                                    {x2;v:form['html']}
                                                </div>
                                            </div>
                                            {x2;endtree}
                                            <div class="form-group">
                                                <label class="control-label col-sm-2"></label>
                                                <div class="col-sm-10">
                                                    <button class="btn btn-primary" type="submit">提交</button>
                                                    <input type="hidden" name="modifyuserinfo" value="1"/>
                                                    <input type="hidden" name="page" value="{x2;$page}"/>
                                                    {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                                    <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                                    {x2;endtree}{x2;endif}
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
