{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
	<div class="page-tabs" id="questionpanel"></div>
	<script type="text/javascript">
        $(document).ready(function(){
            submitAjax({url:"index.php?exam-phone-lesson-ajax-questions&knowsid={x2;$knows['knowsid']}","target":"questionpanel"});
            $('body').delegate('.favor','click',function() {
                favorquestion($(this).attr('data-questionid'));
            });
            $('body').delegate('#questionpanel .jump','click',function(){
                var number = parseInt($(this).attr('data-number'));
                if(number <= 0)return ;
                submitAjax({url:"index.php?exam-phone-lesson-ajax-questions&knowsid={x2;$knows['knowsid']}&number="+number,"target":"questionpanel"});
            });
        });
	</script>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}