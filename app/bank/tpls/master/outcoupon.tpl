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
                            <li><a href="index.php?bank-master-coupon">代金券管理</a></li>
                            <li class="active">导出代金券</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
                    <h4 class="title" style="padding:10px;">
                        导出代金券
                        <a class="btn btn-primary pull-right" href="index.php?bank-master-coupon">代金券列表</a>
                    </h4>
                    <form action="index.php?bank-master-coupon-outcoupon" method="post" class="form-horizontal">
                        <div class="form-group">
                        </div>
                        <div class="form-group">
                            <label for="createtime" class="control-label col-sm-2">生成日期</label>
                            <div class="col-sm-10 form-inline">
                                <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="stime" size="20" id="stime" value=""/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="20" type="text" name="etime" id="etime" value=""/>
                                <span class="help-block">请输入生成日期起止时间</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="createtime" class="control-label col-sm-2"></label>
                            <div class="col-sm-10">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="outcoupon" value="1"/>
                                {x2;tree:$search,arg,aid}
                                <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                {x2;endtree}
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
