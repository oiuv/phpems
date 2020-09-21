{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:examnav}
            <div class="content">
                <div class="col-xs-3" style="width: 20%">
                    <div class="content-box padding">
                        {x2;include:menu}
                    </div>
                </div>
                <div class="col-xs-9 nopadding" style="width: 80%" id="datacontent">
                    {x2;endif}
                    <div class="content-box padding">
                        <h2 class="title">
                            题冒题
                            <a href="index.php?exam-app-questions-questionrows" class="badge pull-right">题冒题</a>
                            <a href="index.php?exam-app-questions" class="badge pull-right">普通试题</a>
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border">
                                <div class="desc">
                                    <form action="index.php?exam-app-questions-questionrows" method="post" class="form-inline">
                                        <table class="table">
                                            <tr class="noborder">
                                                <td>
                                                    关键字：
                                                </td>
                                                <td>
                                                    <input placeholder="请输入关键字" class="form-control" name="search[keyword]" size="10" type="text" value="{x2;$search['keyword']}"/>
                                                </td>
                                                <td>
                                                    试题类型：
                                                </td>
                                                <td>
                                                    <select name="search[questiontype]" class="form-control">
                                                        <option value="0">类型不限</option>
                                                        {x2;tree:$questypes,questype,qid}
                                                        <option value="{x2;v:questype['questid']}"{x2;if:$search['questiontype'] == v:questype['questid']} selected{x2;endif}>{x2;v:questype['questype']}</option>
                                                        {x2;endtree}
                                                    </select>
                                                </td>
                                                <td>
                                                    难度：
                                                </td>
                                                <td>
                                                    <select name="search[qrlevel]" class="form-control">
                                                        <option value="0">难度不限</option>
                                                        <option value="1"{x2;if:$search['qrlevel'] == 1} selected{x2;endif}>易</option>
                                                        <option value="2"{x2;if:$search['qrlevel'] == 2} selected{x2;endif}>中</option>
                                                        <option value="3"{x2;if:$search['qrlevel'] == 3} selected{x2;endif}>难</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    章节：
                                                </td>
                                                <td>
                                                    <select name="search[questionsectionid]" class="combox form-control" id="sectionselect" target="knowsselect" refUrl="index.php?exam-app-questions-getknowsbysectionid&sectionid={value}">
                                                        <option value="0">选择章节</option>
                                                        {x2;if:$sections}
                                                        {x2;tree:$sections,section,sid}
                                                        <option value="{x2;v:section['sectionid']}"{x2;if:v:section['sectionid'] == $search['questionsectionid']} selected{x2;endif}>{x2;v:section['section']}</option>
                                                        {x2;endtree}
                                                        {x2;endif}
                                                    </select>
                                                </td>
                                                <td>
                                                    知识点：
                                                </td>
                                                <td>
                                                    <select name="search[questionknowsid]" id="knowsselect" class="form-control">
                                                        <option value="">选择知识点</option>
                                                        {x2;if:$knows}
                                                        {x2;tree:$knows,know,kid}
                                                        <option value="{x2;v:know['knowsid']}"{x2;if:v:know['knowsid'] == $search['questionknowsid']} selected{x2;endif}>{x2;v:know['knows']}</option>
                                                        {x2;endtree}
                                                        {x2;endif}
                                                    </select>
                                                </td>
                                                <td></td>
                                                <td>
                                                    <button class="btn btn-primary" type="submit">搜索</button>
                                                    <input type="hidden" value="1" name="search[argsmodel]" />
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </li>
                            <li class="border">
                                <div class="desc">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr class="info">
                                            <th width="80">试题类型</th>
                                            <th>试题内容</th>
                                            <th width="48">难度</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {x2;tree:$questions['data'],question,qid}
                                        <tr>
                                            <td>
                                                {x2;$questypes[v:question['qrtype']]['questype']}
                                            </td>
                                            <td>
                                                <a title="查看试题" class="selfmodal" href="javascript:;" url="index.php?exam-app-questions-rowsdetail&questionid={x2;v:question['qrid']}&{x2;c:TIME}" data-target="#modal">{x2;substring:strip_tags(html_entity_decode(v:question['qrquestion'])),135}</a>
                                            </td>
                                            <td>
                                                {x2;if:v:question['qrlevel']==2}中{x2;elseif:v:question['qrlevel']==3}难{x2;elseif:v:question['qrlevel']==1}易{x2;endif}
                                            </td>
                                        </tr>
                                        {x2;endtree}
                                        </tbody>
                                    </table>
                                    <ul class="pagination pull-right">
                                        {x2;$questions['pages']}
                                    </ul>
                                </div>
                            </li>
                        </ul>
                        {x2;if:$exams['pages']}
                        <ul class="pagination pull-right">{x2;$exams['pages']}</ul>
                        {x2;endif}
                    </div>
                    {x2;if:!$userhash}
                </div>
            </div>
            {x2;include:footer}
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
</body>
</html>
{x2;endif}
