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
                            订单号：{x2;$order['ordersn']}
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <div class="desc">
                                    <table class="table table-bordered">
                                        <tr class="info">
                                            <td>充值金额</td>
                                            <td>可兑换积分</td>
                                            <td>下单时间</td>
                                        </tr>
                                        <tr>
                                            <td>{x2;$order['orderprice']}</td>
                                            <td>{x2;eval:echo $order['orderprice']*10}</td>
                                            <td>{x2;date:$order['ordercreatetime'],'Y-m-d'}</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><p class="text-right">应付款：￥{x2;$order['orderprice']} 元</p></td>
                                        </tr>
                                    </table>
                                    <p class="text-right">
                                        {x2;if:$order['orderstatus'] == 1}
                                        {x2;if:PAYJSASWX == 'YES'}
                                        <a class="btn btn-info" href="index.php?user-center-payfor-payjs&ordersn={x2;$order['ordersn']}" target="_blank">微信支付</a>
                                        {x2;else}
                                        <a class="btn btn-success" href="index.php?user-center-payfor-wxpay&ordersn={x2;$order['ordersn']}" target="_blank">微信支付</a>
                                        {x2;endif}
                                        <a class="btn btn-primary" href="{x2;$payforurl}" target="_blank">支付宝支付</a>
                                        {x2;else}
                                        <a class="btn">{x2;$orderstatus[$order['orderstatus']]}</a>
                                        {x2;endif}
                                    </p>
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
