{x2;if:!$userhash}
{x2;include:header}
<body>
<div id="content">
    <div class="pages" id="questions">
{x2;endif}
        <div class="pagecontent">
            <header class="container-fluid" style="background-color:#337AB7;">
                <h5 class="text-center">
                    <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
                    普通试题详情
                    <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home" onclick="javascript:$.goPage('#page1');"></em>
                </h5>
            </header>
            <div class="container-fluid">
                <div class="row-fluid">
                    <table class="table table-hover">
                        {x2;if:$question['questionknowsid']}
                        <tr>
                          <td width="100">所属科目：</td>
                          <td>{x2;$subject['subject']}&nbsp;</td>
                        </tr>
                        <tr>
                          <td>所属章节：</td>
                          <td>{x2;tree:$sections,section,sid}{x2;v:section['section']}{x2;endtree}&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                          <td>所属知识点：</td>
                          <td>{x2;tree:$question['questionknowsid'],know,kid}{x2;v:know['knows']}{x2;endtree}&nbsp;&nbsp;</td>
                        </tr>
                        {x2;endif}
                        <tr>
                          <td width="100">标题：</td>
                          <td>{x2;realhtml:$question['question']}</td>
                        </tr>
                        <tr>
                            <td>备选项：</td>
                            <td>
                            {x2;realhtml:$question['questionselect']}
                            </td>
                        </tr>
                        <tr>
                          <td>答案：</td>
                          <td>{x2;realhtml:$question['questionanswer']}</td>
                        </tr>
                        <tr>
                          <td>解析：</td>
                          <td>{x2;realhtml:$question['questiondescribe']}&nbsp;</td>
                        </tr>
                        <tr>
                          <td>难度：</td>
                          <td>{x2;if:$question['questionlevel']==1}易{x2;elseif:$question['questionlevel']==2}中{x2;elseif:$question['questionlevel']==3}难{x2;endif}&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        {x2;if:!$userhash}
    </div>
</div>
</body>
</html>
{x2;endif}
