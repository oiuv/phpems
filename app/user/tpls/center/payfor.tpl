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
                            积分充值
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <div class="desc">
                                    <form action="index.php?user-center-payfor" method="post" class="form-inline">
                                        <fieldset>
                                            <b>充值金额</b>
                                            <input type="text" placeholder="0" size="2" name="money" class="form-control text-center" onchange="javascript:$('#moneycoin').html(parseInt($(this).val())*10);" needle="needle" datatype="number" min="1" msg="您最少充值1元，充值数必须为整数"/>  元，
                                            1元 = 10积分，可兑换 <b id="moneycoin">0</b> 积分
                                            <a href="#myModal" class="btn btn-primary badge pull-right" role="button" data-toggle="modal">代金券充值</a>
                                            <button class="btn btn-primary badge pull-right" type="submit">充值</button>
                                            <input type="hidden" name="payforit" value="1" />
                                        </fieldset>
                                    </form>
                                </div>
                            </li>
                            <li class="border padding">
                                <div class="desc">
                                    <table class="table table-hover table-bordered">
                                        <tr class="info">
                                            <td>订单号</td>
                                            <td>充值金额</td>
                                            <td>下单时间</td>
                                            <td>订单状态</td>
                                            <td width="100">操作</td>
                                        </tr>
                                        {x2;tree:$orders['data'],order,oid}
                                        <tr>
                                            <td>{x2;v:order['ordersn']}</td>
                                            <td>{x2;v:order['orderprice']}</td>
                                            <td>{x2;date:v:order['ordercreatetime'],'Y-m-d'}</td>
                                            <td>{x2;$orderstatus[v:order['orderstatus']]}</td>
                                            <td>
                                                <a href="index.php?user-center-payfor-orderdetail&ordersn={x2;v:order['ordersn']}" title="详细"><em class="glyphicon glyphicon-th-list"></em></a>
                                                {x2;if:v:order['orderstatus'] == 1}
                                                <a href="index.php?user-center-payfor-orderdetail&ordersn={x2;v:order['ordersn']}" title="支付"><em class="glyphicon glyphicon-shopping-cart"></em></a>
                                                <a class="confirm" href="index.php?user-center-payfor-remove&ordersn={x2;v:order['ordersn']}" title="撤单"><em class="glyphicon glyphicon-remove"></em></a>
                                                {x2;endif}
                                            </td>
                                        </tr>
                                        {x2;endtree}
                                    </table>
                                    {x2;if:$orders['pages']}
                                    <ul class="pagination pull-right">{x2;$orders['pages']}</ul>
                                    {x2;endif}
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
<form aria-hidden="true" id="myModal" method="post" class="modal fade" role="dialog" aria-labelledby="#myModalLabel" action="index.php?exam-app-basics-coupon">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
                <h4 class="modal-title" id="myModalLabel">代金券充值</h4>
            </div>
            <div class="modal-body" id="modal-body">
                <div class="control-group">
                    <div class="controls">
                        <input type="text" class="form-control" name="couponsn" placeholder="请输入16位代金券号码" value="" needle="needle" msg="请输入16位代金券号码"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <input name="coupon" type="hidden" value="1">
                <button class="btn btn-primary" type="submit">充值</button>
            </div>
        </div>
    </div>
</form>
</body>
</html>
