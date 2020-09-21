{x2;include:header}
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pages">
            {x2;include:coursenav}
            <div class="content">
                <div class="col-xs-9">
                    <div class="content-box padding">
                        <h2 class="title">{x2;$content['coursetitle']}</h2>
                        <ul class="list-img list-unstyled">
                            <li class="border padding">
                                <div class="desc" id="videoPlayer" style="width: 100%;"></div>
                            </li>
                            <li class="border padding">
                                <div class="desc">
                                    {x2;realhtml:$content['coursedescribe']}
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-3 nopadding">
                    <div class="content-box padding">
                        <h2 class="title">
                            {x2;$course['cstitle']}
                        </h2>
                        <ul class="list-unstyled list-txt" style="max-height: 640px;">
                            {x2;tree:$contents['data'],content,cid}
                            {x2;if:v:content['courseid'] == $content['courseid']}
                            <li class="border active">
                                <a data-toggle="tooltip" data-placement="top" title="{x2;if:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 1}已学完{x2;elseif:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 0}上次学到{x2;eval: echo intval($logs[v:content['courseid']]['logprogress'] / 60)}分{x2;eval: echo $logs[v:content['courseid']]['logprogress'] % 60}秒{x2;else}未学习{x2;endif}" href="index.php?course-app-course&csid={x2;$course['csid']}&contentid={x2;v:content['courseid']}">
                                    <span class="badge">播放中</span>
                                    {x2;v:content['coursetitle']}
                                </a>
                            </li>
                            {x2;else}
                            {x2;if:$cdata['lock'][v:content['courseid']]}
                            <li class="border">
                                <a data-toggle="tooltip" data-placement="top" title="必须学完上个课程才能解锁">
                                    <span class="badge">待解锁</span>
                                    {x2;v:content['coursetitle']}
                                </a>
                            </li>
                            {x2;else}
                            <li class="border">
                                <a data-toggle="tooltip" data-placement="top" title="{x2;if:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 1}已学完{x2;elseif:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 0}上次学到{x2;eval: echo intval($logs[v:content['courseid']]['logprogress'] / 60)}分{x2;eval: echo $logs[v:content['courseid']]['logprogress'] % 60}秒{x2;else}未学习{x2;endif}" href="index.php?course-app-course&csid={x2;$course['csid']}&contentid={x2;v:content['courseid']}">
                                    <span class="badge{x2;if:$logs[v:content['courseid']] && $logs[v:content['courseid']]['logstatus'] == 1} finish{x2;endif}">待播放</span>
                                    {x2;v:content['coursetitle']}
                                </a>
                            </li>
                            {x2;endif}
                            {x2;endif}
                            {x2;endtree}
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
    $('[data-toggle="tooltip"]').tooltip();
    var playerElement = document.getElementById("videoPlayer");
    var player = new Clappr.Player({
        source: '{x2;$content['course_files']}',
        mute: false,
        height: 480,
        width: 845,
        disableVideoTagContextMenu:true
    });
    player.attachTo(playerElement);
    {x2;if:$logs[$content['courseid']]['logprogress']}
    player.seek({x2;$logs[$content['courseid']]['logprogress']});
    {x2;endif}
    $.recordVideo = setInterval(function(){
        $.get('index.php?course-app-course-recordtime&courseid={x2;$content['courseid']}&time='+player.getCurrentTime()+'&'+Math.random());
    },10000);
    var listenseek = function () {
        player.once('seek',function(){
            var time = this.getCurrentTime();
            setTimeout(function(){
                player.seek(time);
                listenseek();
            },10);
        });
    }
    listenseek();
    player.on('ended',function(){
        $.get('index.php?course-app-course-endstatus&courseid={x2;$content['courseid']}&'+Math.random(),function(){
            window.location.reload();
        });
    });
});
</script>
</body>
</html>
