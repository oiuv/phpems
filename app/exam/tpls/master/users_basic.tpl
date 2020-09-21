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
                            <li><a href="index.php?{x2;$_app}-master-users">开通课程</a></li>
                            <li class="active">课程选择</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        课程选择
                        <a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-users">开通课程</a>
                    </h4>
                    <form action="index.php?exam-master-users-basics&userid={x2;$userid}" method="post" class="form-inline">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th colspan="6">搜索</th>
                                </tr>
                            </thead>
                            <tr>
                                <td>
                                    考场ID：
                                </td>
                                <td>
                                    <input class="form-control" name="search[basicid]" class="inline" type="text" class="number" value="{x2;$search['basicid']}"/>
                                </td>
                                <td>
                                    关键字：
                                </td>
                                <td>
                                    <input class="form-control" name="search[keyword]" type="text" value="{x2;$search['keyword']}"/>
                                </td>
                                <td>
                                    地区：
                                </td>
                                <td>
                                    <select class="form-control" name="search[basicareaid]">
                                    <option value="0">选择地区</option>
                                      {x2;tree:$areas,area,aid}
                                      <option value="{x2;v:area['areaid']}"{x2;if:v:area['areaid'] == $search['basicareaid']} selected{x2;endif}>{x2;v:area['area']}</option>
                                      {x2;endtree}
                                      </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    API标识：
                                </td>
                                <td>
                                    <input class="form-control" name="search[basicapi]" type="text" value="{x2;$search['basicapi']}"/>
                                </td>
                                <td>
                                    科目：
                                </td>
                                <td>
                                    <select class="form-control" name="search[basicsubjectid]">
                                    <option value="0">选择科目</option>
                                      {x2;tree:$subjects,subject,sid}
                                      <option value="{x2;v:subject['subjectid']}"{x2;if:v:subject['subjectid'] == $search['basicsubjectid']} selected{x2;endif}>{x2;v:subject['subject']}</option>
                                      {x2;endtree}
                                      </select>
                                </td>
                                <td>
                                    <button class="btn btn-primary" type="submit">搜索</button>
                                    <input type="hidden" value="1" name="search[argsmodel]" />
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </form>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>考场ID</th>
                                <th>考场名称</th>
                                <th>考场地区</th>
                                <th>考试科目</th>
                                <th>到期时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:$basics['data'],basic,bid}
                            <tr>
                                <td>
                                    {x2;v:basic['basicid']}
                                </td>
                                <td>
                                    {x2;v:basic['basic']}
                                </td>
                                <td>
                                    {x2;$areas[v:basic['basicareaid']]['area']}
                                </td>
                                <td>
                                    {x2;$subjects[v:basic['basicsubjectid']]['subject']}
                                </td>
                                <td>
                                    {x2;if:$openbasics[v:basic['basicid']]}{x2;date:$openbasics[v:basic['basicid']]['obendtime'],'Y-m-d'}{x2;else}未开启{x2;endif}
                                </td>
                                <td>
                                    {x2;if:$openbasics[v:basic['basicid']]}<a class="ajax btn" title="关闭考场" href="index.php?exam-master-users-closebasics&userid={x2;$userid}&basicid={x2;v:basic['basicid']}"><em class="glyphicon glyphicon-minus-sign"></em></a>{x2;else}<a class="ajax btn" href="index.php?exam-master-users-openbasics&userid={x2;$userid}&basicid={x2;v:basic['basicid']}" title="开启考场"><em class="glyphicon glyphicon-plus-sign"></em></a>{x2;endif}
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
                    <ul class="pagination pull-right">
                        {x2;$basics['pages']}
                    </ul>
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
