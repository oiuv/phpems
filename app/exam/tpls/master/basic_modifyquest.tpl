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
                            <li><a href="index.php?{x2;$_app}-master-basic-questype">题型管理</a></li>
                            <li class="active">修改题型</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        修改题型
                        <a class="btn btn-primary pull-right" href="index.php?exam-master-basic-questype&page={x2;$page}{x2;$u}">题型管理</a>
                    </h4>
                    <form action="index.php?exam-master-basic-modifyquestype" method="post" class="form-horizontal">
                        <fieldset>
                        <div class="form-group">
                            <label for="questype" class="control-label col-sm-2">题型名称：</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="args[questype]" id="questype" type="text" size="30" value="{x2;$quest['questype']}" class="required" alt="请输入题型名称" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="questsort" class="control-label col-sm-2">题型分类：</label>
                            <div class="col-sm-4">
                                <select class="form-control combox" id="questsort" name="args[questsort]" onchange="javascript:if($(this).val() == '1')$('#choicebox').hide();else $('#choicebox').show();">
                                    <option value="1"{x2;if:$quest['questsort']} selected{x2;endif}>主观题</option>
                                      <option value="0"{x2;if:!$quest['questsort']} selected{x2;endif}>客观题</option>
                                </select>
                            </div>
                        </div>
                        <div id="choicebox" class="form-group"{x2;if:$quest['questsort']} style="display:none;"{x2;endif}>
                            <label for="questchoice" class="control-label col-sm-2">选项分类：</label>
                            <div class="col-sm-6">
                                <select class="form-control combox" name="args[questchoice]" id="questchoice">
                                    <option value="1"{x2;if:$quest['questchoice']==1} selected{x2;endif}>单选</option>
                                      <option value="2"{x2;if:$quest['questchoice']==2} selected{x2;endif}>多选</option>
                                      <option value="3"{x2;if:$quest['questchoice']==3} selected{x2;endif}>不定项选</option>
                                      <option value="4"{x2;if:$quest['questchoice']==4} selected{x2;endif}>判断</option>
                                      <option value="5"{x2;if:$quest['questchoice']==5} selected{x2;endif}>定值填空题</option>
                                </select>
                                <span class="help-block">不定项选按照选对答案数给分，判断题将自动生成判断选项。</span>
                            </div>
                        </div>
                        <div class="form-group">
                              <label for="questchoice" class="control-label col-sm-2"></label>
                              <div class="col-sm-9">
                                  <button class="btn btn-primary" type="submit">提交</button>
                                  <input type="hidden" name="page" value="{x2;$page}"/>
                                  <input type="hidden" name="questid" value="{x2;$quest['questid']}"/>
                                <input type="hidden" name="modifyquestype" value="1"/>
                                  {x2;if:is_array($search)}{x2;tree:$search,arg,aid}
                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                {x2;endtree}{x2;endif}
                            </div>
                        </div>
                        </fieldset>
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
