{x2;if:!$userhash}
{x2;include:header}
<body>
<div class="pages">
    {x2;endif}
    <div class="page-tabs">
        <div class="page-header">
            <div class="col-1" onclick="javascript:history.back();"><span class="iconfont icon-left"></span></div>
            <div class="col-8">错题反馈</div>
            <div class="col-1"><span class="iconfont icon-menu hide"></span></div>
        </div>
        <div class="page-content header">
            <form class="list-box bg" action="index.php?exam-phone-lesson-reporterror">
                <ol>
                    <li class="unstyled form-group">
                        <select name="args[fbtype]" needle="needle" class="block" msg="请选择错误类型">
                            <option value="">请选择错误类型</option>
                            <option value="答案错误">答案错误</option>
                            <option value="题干错误">题干错误</option>
                            <option value="知识点归类错误">知识点归类错误</option>
                            <option value="图片错误">图片错误</option>
                            <option value="解析错误">解析错误</option>
                            <option value="其他">其他</option>
                        </select>
                    </li>
                    <li class="unstyled form-group">
                        <textarea name="args[fbcontent]" rows="4" needle="needle" msg="请填写错误描述" placeholder="请填写错误描述"></textarea>
                    </li>
                    <li class="unstyled text-center form-group">
                        <button class="btn primary" type="submit">提交</button>
                        <input type="hidden" name="reporterror" value="1"/>
                        <input type="hidden" name="args[fbquestionid]" value="{x2;$questionid}"/>
                    </li>
                </ol>
            </form>
        </div>
    </div>
    {x2;if:!$userhash}
</div>
</body>
</html>
{x2;endif}
