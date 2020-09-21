{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">积分充值</div>
            <div class="col-1"><span class="iconfont icon-menu"></span></div>
        </div>
        <div class="page-content header">
            <div class="list-box bg nopadding">
                <ol>
                    <li class="unstyled">
                        <h4 class="bigtitle">在线支付</h4>
                    </li>
                    <li class="unstyled">
                        <form action="index.php?user-phone-payfor" method="post">
                            <div class="form-group text-center">
                                <span>充值</span>
                                <input type="text" name="money" class="inline noborder text-center" placeholder="金额" size="3" type="text" onchange="javascript:$('#moneycoin').html(parseInt($(this).val())*10);" needle="needle" datatype="number" min="1" msg="您最少充值1元，充值数必须为整数"/>
                                <span>  元，可兑换 <b id="moneycoin">0</b> 积分</span>
                            </div>
                            {x2;if:$iswx}
                            <div class="form-group text-center hide">
                                <label class="inline"><input type="radio" name="paytype" value="alipay"><span class="selector">支付宝</span></label>
                                <label class="inline"><input type="radio" name="paytype" value="wxpay" checked><span class="selector">微信</span></label>
                            </div>
                            {x2;else}
                            <div class="form-group text-center">
                                <label class="inline"><input type="radio" name="paytype" value="alipay" checked><span class="selector">支付宝</span></label>
                                <label class="inline"><input type="radio" name="paytype" value="wxpay"><span class="selector">微信</span></label>
                            </div>
                            {x2;endif}
                            <div class="form-group">
                                <button class="btn primary block" type="submit">充值</button>
                                <input type="hidden" name="payforit" value="1" />
                            </div>
                        </form>
                    </li>
                </ol>
            </div>
            <div class="list-box bg top nopadding">
                <ol>
                    <li class="unstyled">
                        <h4 class="bigtitle">代金券充值</h4>
                    </li>
                    <li class="unstyled">
                        <form action="index.php?exam-phone-basics-coupon" method="post">
                            <div class="form-group">
                                <input type="text" placeholder="请输入16位代金券号码" class="block" name="couponsn" value="" needle="needle" msg="请输入16位代金券号码"/>
                            </div>
                            <div class="form-group">
                                <button class="btn danger block" type="submit">代金券充值</button>
                                <input name="coupon" type="hidden" value="1">
                            </div>
                        </form>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
