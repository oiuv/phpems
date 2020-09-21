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
                            <li><a href="index.php?{x2;$_app}-teach">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-teach-rowsquestions&page={x2;$page}{x2;$u}">题冒题管理</a></li>
                            <li class="active">子试题列表</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        子试题列表
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-teach-rowsquestions-addchildquestion&questionid={x2;$questionparent}&page={x2;$page}{x2;$u}">添加子试题</a>
                    </h4>
                    <form action="index.php?exam-teach-rowsquestions-done" method="post">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th colspan="2">{x2;realhtml:$question['qrquestion']}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                  <td width="100">所属知识点：</td>
                                  <td>{x2;tree:$question['qrknowsid'],know,kid}&nbsp;{x2;v:know['knows']}{x2;endtree}&nbsp;</td>
                                </tr>
                                <tr>
                                  <td>题帽：</td>
                                  <td>{x2;eval: echo html_entity_decode($question['qrquestion'])}</td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr class="info">
                                    <th width="36">ID</th>
                                    <th width="48">排序</th>
                                    <th width="120">试题类型</th>
                                    <th>试题内容</th>
                                    <th width="120">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {x2;tree:$question['data'],question,qid}
                                <tr>
                                    <td>{x2;v:question['questionid']}</td>
                                    <td><input class="form-control" style="width:36px;padding:2px 5px;" type="text" name="sequence[{x2;v:question['questionid']}]" value="{x2;v:question['questionsequence']}" /></td>
                                    <td>{x2;$questypes[v:question['questiontype']]['questype']}</td>
                                    <td>
                                        <a title="查看试题" class="selfmodal" href="javascript:;" url="index.php?exam-teach-questions-detail&questionid={x2;v:question['questionid']}" title="查看试题" data-target="#modal">{x2;eval: echo strip_tags(html_entity_decode(v:question['question']))}</a>
                                    </td>
                                    <td>
                                        <div class="btn-group">
                                            <a class="btn" href="index.php?exam-teach-rowsquestions-modifychildquestion&page={x2;$page}&questionparent={x2;$question['qrid']}&questionid={x2;v:question['questionid']}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
                                            <a class="btn confirm" href="index.php?exam-teach-rowsquestions-delchildquestion&questionparent={x2;$question['qrid']}&page={x2;$page}&questionid={x2;v:question['questionid']}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                        </div>
                                    </td>
                                </tr>
                                {x2;endtree}
                            </tbody>
                        </table>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                    <input type="radio" name="action" value="modify" checked/>排序
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="action" value="delete" />删除
                                </label>
                                {x2;if:is_array($search)}{x2;tree:$search,arg,sid}
                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                {x2;endtree}{x2;endif}
                                <label class="radio-inline">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </label>
                                <input type="hidden" name="modifyfieldsequence" value="1"/>
                                  <input type="hidden" name="questionparent" value="{x2;$questionparent}"/>
                                <input type="hidden" name="page" value="{x2;$page}"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
<div id="modal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
                <h4 id="myModalLabel">
                    试题详情
                </h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                 <button aria-hidden="true" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
