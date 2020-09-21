{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-3">
                    <div class="content-box padding" id="questionindex" data-spy="affix" data-offset-top="150" style="top:-15px;">
                        <h2 class="title">导航</h2>
                        <ul class="list-unstyled list-txt">
                            <li class="border active"><a href="index.php?docs-app-mydoc-edit&docid={x2;$doc['docid']}">编辑词条</a></li>
                            <li class="border"><a href="index.php?docs-app-docs-history&docid={x2;$doc['docid']}">历史版本</a></li>
                            <li class="border">
                                {x2;if:$_user['userid']}
                                <a href="index.php?docs-app-mydoc-history&docid={x2;$doc['docid']}">我的贡献</a>
                                {x2;else}
                                <a href="javascript:;" onclick="javascript:$.loginbox.show();">我的贡献</a>
                                {x2;endif}
                            </li>
                            <li class="border"><a href="index.php?docs-app-docs&docid={x2;$doc['docid']}">返回词条</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-9 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;$doc['doctitle']}
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border">
                                <div class="intro">
                                    <div class="desc">
                                        {x2;if:$history}
                                        <p class="alert alert-danger" style="margin-top: 15px;">您有未审核通过的协作版本，本词编辑将基于此版本修改！</p>
                                        {x2;endif}
                                        <form action="index.php?docs-app-mydoc-edit" method="post">
                                            <div class="form-group">
                                                <textarea id="dhcontent" rows="7" cols="4" attr-height="480" class="jckeditor" name="args[dhcontent]">{x2;realhtml:$doc['content']['dhcontent']}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="contenttitle" class="control-label col-xs-1 nopadding">修改原因</label>
                                                <div class="col-xs-11">
                                                    <input placeholder="请在此输入修改原因" class="form-control" type="text" id="dhtitle" name="args[dhtitle]" needle="needle" msg="您必须输入修改原因" value="">
                                                </div>
                                            </div>
                                            <div class="form-group text-center">
                                                <button class="btn btn-primary" type="submit">提交</button>
                                                <input type="hidden" name="submit" value="1">
                                                <input type="hidden" name="docid" value="{x2;$doc['docid']}">
                                            </div>
                                        </form>
                                    </div>
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
