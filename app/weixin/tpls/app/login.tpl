{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:nav}
            <div class="content">
                <div class="col-xs-12 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">
                            扫码登陆
                        </h2>
                        <ul class="list-unstyled list-img">
                            <li class="border padding">
                                <div class="desc">
                                    <p class="text-center">
                                        <img src="index.php?core-api-index-qrcode&data={x2;eval: echo urlencode($url);}">
                                        <br />
                                        请使用手机打开微信，选择扫一扫，扫描上方二维码即可登陆。
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
<script>
$(function(){
    setInterval(function(){
        submitAjax({url:'index.php?weixin-app-index-autologin'});
    },3000)
});
</script>
</body>
</html>
