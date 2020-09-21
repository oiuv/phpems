{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
    <div class="row-fluid">
        <div class="main">
            <div class="col-xs-2 leftmenu">
                {x2;include:menu}
            </div>
            <div id="datacontent">
{x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-master-rowsquestions&page={x2;$page}{x2;$u}">题冒题管理</a></li>
                            <li><a href="index.php?{x2;$_app}-master-rowsquestions-rowsdetail&questionid={x2;$question['qrid']}&page={x2;$page}{x2;$u}">子试题列表</a></li>
                            <li class="active">批量添加子试题</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        批量添加子试题
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-rowsquestions-rowsdetail&questionid={x2;$question['qrid']}&page={x2;$page}{x2;$u}">子试题列表</a>
                    </h4>
                    <form action="index.php?exam-master-rowsquestions-bataddchildquestion" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="content">试题文本：</label>
                            <div class="col-sm-9">
                                <textarea id="content" rows="10" class="form-control" name="content"></textarea>
                                <span class="help-block">请将准备好的格式粘贴到文本框内，点击保存即可</span>
                            </div>
                        </div>
                        <div class="form-group">
                              <label class="control-label col-sm-2"></label>
                              <div class="col-sm-9">
                                  <button class="btn btn-primary" type="submit">提交</button>
                                  <input type="hidden" name="page" value="{x2;$page}"/>
                                  <input type="hidden" name="questionparent" value="{x2;$question['qrid']}" />
                                  <input type="hidden" name="type" value="1"/>
                                  <input type="hidden" name="insertquestion" value="1"/>
                                  {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                {x2;endtree}{x2;endif}
                            </div>
                        </div>
                    </form>
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
