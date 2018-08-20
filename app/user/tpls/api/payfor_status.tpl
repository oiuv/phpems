{x2;include:header}
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="box itembox" style="padding-top:10px;">
				<h4 class="title">订单号：{x2;$order['ordersn']}</h4>
				<h4 class="text-success text-center" style="padding-top:25px;margin-bottom:15px;">
				{x2;if:$order['orderstatus'] == 2}
					<em class="glyphicon glyphicon-ok-sign" style="font-size:2em;vertical-align: middle;margin-left:25px;"></em>
					<a href="index.php?user-center-payfor-orderdetail&ordersn={x2;$order['ordersn']}">付款成功，查看订单详情</a>
				{x2;else}

					<em class="glyphicon glyphicon-remove-sign" style="font-size:2em;vertical-align: middle;margin-left:25px;"></em>
					付款失败！

				{x2;endif}
				</h4>
				<p class="text-center">
					<a class="btn btn-primary" href="index.php?user-center-payfor">查看充值记录</a>
				</p>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>