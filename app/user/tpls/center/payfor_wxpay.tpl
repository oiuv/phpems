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
                                    {x2;if:$order['orderstatus'] == 2}
                                    <p class="text-center">
                                        此订单已经成功支付！<br />
                                        <a class="btn btn-success" href="index.php?user-center-payfor-orderdetail&ordersn={x2;$order['ordersn']}">查看此订单</a>
                                        <a class="btn btn-primary" href="index.php?user-center-payfor">返回订单列表</a>
                                    </p>
                                    {x2;else}
                                    <p class="text-center">
                                        {x2;if:$order['orderstatus'] == 1}
                                        {x2;if:$result['code_url']}
                                        <img src="index.php?core-api-index-qrcode&data={x2;eval: echo urlencode($result['code_url']);}">
                                        <br />
                                        请使用手机打开微信，选择扫一扫，扫描上方二维码即可进行支付。
                                        <br />
                                        <a class="btn btn-success" href="index.php?user-center-payfor-wxpay&ordersn={x2;$order['ordersn']}" target="_blank">查看是否成功支付</a>
                                        <a class="btn btn-primary" href="index.php?user-center-payfor-orderdetail&ordersn={x2;$order['ordersn']}">使用其他方式支付</a>
                                        {x2;else}
                                        出现错误，错误原因是{x2;$result['err_code_des']}。
                                        <br />
                                        <a class="btn btn-success" href="index.php?user-center-payfor-orderdetail&ordersn={x2;$order['ordersn']}">查看此订单</a>
                                        <a class="btn btn-primary" href="index.php?user-center-payfor">返回订单列表</a>
                                        {x2;endif}
                                        {x2;else}
                                        <a class="btn">{x2;$orderstatus[$order['orderstatus']]}</a>
                                        {x2;endif}
                                    </p>
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
</body>
</html>
