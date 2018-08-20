	<header class="container-fluid" style="background-color:#337AB7;">
		<h5 class="text-center">
			<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
			订单详情
			<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
		</h5>
	</header>
	<div class="col-xs-12" style="margin-top:1rem;background:#FFFFFF;padding:1rem;margin-bottom:1rem;">
		<h4 class="title">订单号：{x2;$order['ordersn']}</h4>
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
		<p class="text-right">
			{x2;if:$order['orderstatus'] == 1}
				<a class="btn btn-success btn-block" href="javascript:;" onclick="javascript:callpay();">微信支付</a>
			{x2;else}
				<a class="btn btn-default btn-block">{x2;$orderstatus[$order['orderstatus']]}</a>
			{x2;endif}
		</p>
	</div>
	{x2;if:$order['orderstatus'] == 1}
	<script>
	function goorderlist()
	{
		var par = {'url':'index.php?user-phone-payfor-orderdetail&ordersn={x2;$order['ordersn']}'};
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
	{x2;include:footer}