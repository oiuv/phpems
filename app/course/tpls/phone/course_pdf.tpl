{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">{x2;$course['cstitle']}</div>
            <div class="col-1" id="pdf-menu">
                <span class="iconfont icon-menu"></span>
            </div>
        </div>
        <div class="page-content header{x2;if:!$logs[$content['courseid']]['logstatus']} footer{x2;endif}">
            <div id="pdfViewer" style="width: 100%;height: 100%;box-sizing: border-box;"></div>
        </div>
        <div class="page-content header hide{x2;if:!$logs[$content['courseid']]['logstatus']} footer{x2;endif}">
            <div class="list-box bg">
                <ol>
                    <li class="unstyled">
                        <h4 class="title">课程清单</h4>
                    </li>
                    {x2;tree:$contents['data'],content,cid}
                    {x2;if:v:content['courseid'] == $content['courseid']}
                    <li class="unstyled smallpadding">
                        <a data-target="pagination" href="index.php?course-app-course&csid={x2;$course['csid']}&contentid={x2;v:content['courseid']}">
                            <div class="rows">
                                <div class="intro">
                                    <span class="badge primary">播放中</span>
                                    {x2;v:content['coursetitle']}
                                </div>
                            </div>
                        </a>
                    </li>
                    {x2;else}
                    {x2;if:$cdata['lock'][v:content['courseid']]}
                    <li class="unstyled smallpadding">
                        <div class="rows">
                            <div class="intro">
                                <span class="badge danger">待解锁</span>
                                {x2;v:content['coursetitle']}
                            </div>
                        </div>
                    </li>
                    {x2;else}
                    <li class="unstyled smallpadding">
                        <a class="ajax" data-target="pagination" href="index.php?course-app-course&csid={x2;$course['csid']}&contentid={x2;v:content['courseid']}">
                            <div class="rows">
                                <div class="intro">
                                    <span class="badge{x2;if:$logs[v:content['courseid']]['logstatus'] == 1} success{x2;endif}">待播放</span>
                                    {x2;v:content['coursetitle']}
                                </div>
                            </div>
                        </a>
                    </li>
                    {x2;endif}
                    {x2;endif}
                    {x2;endtree}
                </ol>
            </div>
        </div>
        {x2;if:!$logs[$content['courseid']]['logstatus']}
        <div class="page-footer">
            <ol class="pagination">
                <li>
                    <h2 class="text-center timer">
                        <span id="pdf-timer_h">00</span>:<span id="pdf-timer_m">00</span>:<span id="pdf-timer_s">00</span>
                    </h2>
                </li>
            </ol>
        </div>
        {x2;endif}
    </div>
    <script>
        $(function(){
            var pdf = $('<iframe src="index.php?course-phone-course-pdfview&file={x2;$content['pdf_file']}" style="border:1px solid #999999;" frameborder="0" width="100%" height="720" border="0"></iframe>');
            $('#pdfViewer').append(pdf);
            {x2;if:!$logs[$content['courseid']]['logstatus']}
            var setting = {
                time:5,
                hbox:$("#pdf-timer_h"),
                mbox:$("#pdf-timer_m"),
                sbox:$("#pdf-timer_s"),
                lefttime:0,
                finish:function(){
                    $.get('index.php?course-phone-course-endstatus&courseid={x2;$content['courseid']}&'+Math.random(),function(){
                        $("#pdf-timer_h").parent().html('学习完成!');
                    });
                }
            }
            countdown(setting);
            {x2;endif}
            $('#pdf-menu').on('click',function(){
                $('.page-content').toggleClass('hide');
            });
            $('#videos-list').css('height',$(window).height() - $('.page-footer:first').height() - $('.page-header:first').height());
        })
    </script>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
