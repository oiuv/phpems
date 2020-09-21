{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">订单详情</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header">
            <div class="list-box bg nopadding">
                <ol>
                    <li class="unstyled">
                        <h4 class="bigtitle">订单号：{x2;$order['ordersn']}</h4>
                    </li>
                    <li class="unstyled">
                        <table class="table table-bordered">
                            <thead>
                            <td>充值金额</td>
                            <td>可兑换积分</td>
                            <td>下单时间</td>
                            </thead>
                            <tr>
                                <td>{x2;$order['orderprice']}</td>
                                <td>{x2;eval:echo $order['orderprice']*10}</td>
                                <td>{x2;date:$order['ordercreatetime'],'Y-m-d'}</td>
                            </tr>
                            <tr>
                                <td colspan="3"><p class="text-right">应付款：￥{x2;$order['orderprice']}</p></td>
                            </tr>
                        </table>
                    </li>
                    <li class="unstyled">
                        <div class="rows text-center">
                            {x2;if:$order['orderstatus'] == 1}
                            <a class="btn primary block" href="javascript:;" onclick="javascript:callpay();">微信支付</a>
                            {x2;else}
                            <a class="btn block">{x2;$orderstatus[$order['orderstatus']]}</a>
                            {x2;endif}
                        </div>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    {x2;if:$order['orderstatus'] == 1}
    <script>
        function goorderlist()
        {
            var par = {url:'index.php?user-phone-payfor-orderdetail&ordersn={x2;$order['ordersn']}'};
            alert('支付成功');
            submitAjax(par);
        }
        function jsApiCall()
        {
            WeixinJSBridge.invoke(
                'getBrandWCPayRequest',
                    {x2;$jsApiParameters },
                function(res){
                    WeixinJSBridge.log(res.err_msg);
                    if(res.err_msg == 'get_brand_wcpay_request:cancel')
                    {
                        alert('您已经取消支付');
                    }
                    else if(res.err_msg == 'get_brand_wcpay_request:ok')
                    {
                        goorderlist();
                    }
                    else
                    {
                        alert('支付失败');
                    }
                    //window.location.href = 'index.php?item-app-orderonlinepay';
                    //alert(res.err_code+res.err_desc+res.err_msg);
                }
            );
        }

        function callpay()
        {
            if (typeof WeixinJSBridge == "undefined"){
                if( document.addEventListener ){
                    document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
                }else if (document.attachEvent){
                    document.attachEvent('WeixinJSBridgeReady', jsApiCall);
                    document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
                }
            }else{
                jsApiCall();
            }
        }
    </script>
    {x2;endif}
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
