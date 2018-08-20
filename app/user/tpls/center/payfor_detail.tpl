{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
				{x2;include:menu}
			</div>
			<div class="col-xs-10" id="datacontent">
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php">首页</a></li>
							<li><a href="index.php?{x2;$_app}-app">用户中心</a></li>
							<li><a href="index.php?{x2;$_app}-center-payfor">积分充值</a></li>
							<li class="active">订单详情</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;">
					<h4 class="title">订单详情</h4>
					<h5>订单号：{x2;$order['ordersn']}</h5>
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
							<a class="btn btn-success" href="index.php?user-center-payfor-wxpay&ordersn={x2;$order['ordersn']}" target="_blank">微信支付</a>
							<a class="btn btn-primary" href="{x2;$payforurl}" target="_blank">支付宝支付</a>
						{x2;else}
							<a class="btn">{x2;$orderstatus[$order['orderstatus']]}</a>
						{x2;endif}
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>