	<header class="container-fluid" style="background-color:#337AB7;">
		<h5 class="text-center">
			<em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left" onclick="javascript:$.goPrePage();"></em>
			积分充值
			<a style="font-size:2rem;color:#FFFFFF;" href="index.php?user-phone" class="pull-right glyphicon glyphicon-user ajax" data-target="user" data-page="user"></a>
		</h5>
	</header>
	<div class="container-fluid">
		<div class="col-xs-12" style="margin-top:1rem;background:#FFFFFF;padding:1rem;margin-bottom:1rem;">
			<form action="index.php?user-phone-payfor" method="post" data-target="pagewxpay" data-page="pagewxpay">
				<fieldset class="form-inline">
					 <p>
					 	<span>充值</span>
					 	<input type="text" name="money" class="form-control" style="width:12rem;display:inline-block;" type="text" onchange="javascript:$('#moneycoin').html(parseInt($(this).val())*10);" needle="needle" datatype="number" min="1" msg="您最少充值1元，充值数必须为整数"/>
					 	<span>  元，可兑换 <b id="moneycoin">0</b> 积分</span>
					 </p>
					 <button class="btn btn-primary btn-block" type="submit">充值</button>
					 <input type="hidden" name="payforit" value="1" />
				</fieldset>
			</form>
		</div>
		<div class="col-xs-12" style="margin-top:1rem;background:#FFFFFF;padding:1rem;margin-bottom:1rem;">
			<form action="index.php?exam-phone-basics-coupon" method="post">
				<fieldset class="form-inline">
					 <div class="form-group">
						<label class="control-label" for="content">代金券号码：</label>
				  		<div class="controls">
				  			<input type="text" class="form-control" name="couponsn" value="" needle="needle" msg="请输入16位代金券号码"/>
						</div>
					</div>
					<button class="btn btn-danger btn-block" type="submit">代金券充值</button>
					<input name="coupon" type="hidden" value="1">
				</fieldset>
			</form>
		</div>
		<div class="col-xs-12 hide" style="margin-top:2rem;background:#FFFFFF;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>订单号</th>
						<th>充值金额</th>
						<th>下单时间</th>
						<th>订单状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					{x2;tree:$orders['data'],order,oid}
					<tr>
						<td>{x2;v:order['ordersn']}</td>
						<td>{x2;v:order['orderprice']}</td>
						<td>{x2;date:v:order['ordercreatetime'],'Y-m-d'}</td>
						<td>{x2;$orderstatus[v:order['orderstatus']]}</td>
						<td>
							<div class="btn-group">
								<a class="btn" href="index.php?user-center-payfor-orderdetail&ordersn={x2;v:order['ordersn']}" title="详细"><em class="glyphicon glyphicon-th-list"></em></a>
								{x2;if:v:order['orderstatus'] == 1}
								<a class="btn" href="index.php?user-center-payfor-orderdetail&ordersn={x2;v:order['ordersn']}" title="支付"><em class="glyphicon glyphicon-shopping-cart"></em></a>
								<a class="btn confirm" href="index.php?user-center-payfor-remove&ordersn={x2;v:order['ordersn']}" title="撤单"><em class="glyphicon glyphicon-remove"></em></a>
								{x2;endif}
							</div>
						</td>
					</tr>
					{x2;endtree}
				</tbody>
			</table>
			<ul class="pagination pagination-right">{x2;$orders['pages']}</ul>
		</div>
	</div>
	<form aria-hidden="true" id="myModal" method="post" class="modal fade" role="dialog" aria-labelledby="#myModalLabel" action="index.php?exam-phone-basics-coupon">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">代金券充值</h4>
				</div>
				<div class="modal-body" id="modal-body">
					<div class="control-group">
						<label class="control-label" for="content">代金券号码：</label>
				  		<div class="controls">
				  			<input type="text" class="form-control" name="couponsn" style="width:80%" value="" needle="needle" msg="请输入16位代金券号码"/>
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
	{x2;include:footer}