{x2;if:!$userhash}
{x2;include:header}
<body>
<div id="content">
    <div class="pages" id="paper">
        {x2;endif}
        <div class="pagecontent" id="exercise-paper-swiper">
            <header class="container-fluid" style="background-color:#337AB7;">
                <h5 class="text-center">
                    <em style="font-size:2rem;" class="pull-left glyphicon glyphicon-chevron-left"
                        onclick="javascript:$.goPrePage();"></em>
                    {x2;$sessionvars['examsession']}
                    <em style="font-size:2rem;" class="pull-right glyphicon glyphicon-home"
                        onclick="javascript:$.goPage('#page1');"></em>
                </h5>
            </header>
            <div class="row-fluid" style="margin-bottom:2.5rem;">
                <div class="container-fluid">
                    <div class="col-xs-12" id="questionbar" style="display:none;">
                        <dl class="clear" id="questionindex">
                            {x2;eval: v:oid = 0}
                            {x2;eval: v:qmid = 0}
                            {x2;tree:$questype,quests,qid}
                            {x2;if:v:quests}
                            {x2;eval: v:quest = v:key}
                            {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                            {x2;if:$data['currentbasic']['basicexam']['changesequence']}
                            {x2;eval: shuffle($sessionvars['examsessionquestion']['questions'][v:quest]);}
                            {x2;eval: shuffle($sessionvars['examsessionquestion']['questionrows'][v:quest]);}
                            {x2;endif}
                            {x2;eval: v:oid++}
                            <dt class="float_l"><h4 class="title">{x2;$ols[v:oid]}
                                    、{x2;$questype[v:quest]['questype']}</h4></dt>
                            <dd class="tableindex">
                                {x2;eval: v:tid = 0}
                                {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
                                {x2;eval: v:tid++}
                                {x2;eval: v:qmid++}
                                <a style="margin-bottom:0.5rem;" id="sign_{x2;v:question['questionid']}"
                                   href="javascript:;"
                                   onclick="javascript:$.leftMenu($('#questionbar'));gotoquestion('{x2;v:question['questionid']}');$('#form1').toggle();"
                                   class="btn btn-default{x2;if:$sessionvars['examsessionsign'][v:question['questionid']]} btn-danger{x2;endif}">{x2;v:tid}</a>
                                {x2;endtree}
                                {x2;if:is_array($sessionvars['examsessionquestion']['questionrows'][v:quest])}
                                {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qrid}
                                {x2;eval: v:tid++}
                                {x2;tree:v:questionrow['data'],data,did}
                                {x2;eval: v:qmid++}
                                <a style="margin-bottom:0.5rem;" id="sign_{x2;v:data['questionid']}" href="javascript:;"
                                   onclick="javascript:$.leftMenu($('#questionbar'));gotoquestion('{x2;v:data['questionid']}');$('#form1').toggle();"
                                   class="btn btn-default{x2;if:$sessionvars['examsessionsign'][v:data['questionid']]} btn-danger{x2;endif}">{x2;v:tid}
                                    -{x2;v:did}</a>
                                {x2;endtree}
                                {x2;endtree}
                                {x2;endif}
                            </dd>
                            {x2;endif}
                            {x2;endif}
                            {x2;endtree}
                        </dl>
                    </div>
                    <form id="form1" name="form1" method="post" action="index.php?exam-phone-exercise-score"
                          class="col-xs-12" style="padding:0px;margin-bottom:4.8rem;">
                        <input type="hidden" name="insertscore" value="1"/>
                        {x2;eval: v:oid = 0}
                        {x2;eval: v:qcid = 0}
                        {x2;tree:$questype,quests,qid}
                        {x2;if:v:quests}
                        {x2;eval: v:quest = v:key}
                        {x2;if:$sessionvars['examsessionquestion']['questions'][v:quest] || $sessionvars['examsessionquestion']['questionrows'][v:quest]}
                        {x2;eval: v:oid++}
                        <h4 class="title questionpanel" id="questype_{x2;v:quest}">{x2;$ols[v:oid]}
                            、{x2;$questype[v:quest]['questype']}{x2;$sessionvars['examsessionsetting']['examsetting']['questype'][v:quest]['describe']}</h4>
                        {x2;eval: v:tid = 0}
                        {x2;tree:$sessionvars['examsessionquestion']['questions'][v:quest],question,qnid}
                        {x2;eval: v:tid++}
                        {x2;eval: v:qcid++}
                        <div class="paperexamcontent" id="questions_{x2;v:question['questionid']}" rel="{x2;v:quest}"
                             style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
                            <h4 class="title">
                                第{x2;v:tid}题
                                <span class="pull-right">
									<a class="btn text-primary qicon"
                                       onclick="javascript:favorquestion('{x2;v:question['questionid']}');"><i
                                            class="glyphicon glyphicon-heart-empty"></i></a>
									<a class="btn {x2;if:$sessionvars['examsessionsign'][v:question['questionid']]}text-danger{x2;else}text-info{x2;endif} qicon"
                                       href="javascript:;"
                                       onclick="javascript:signQuestion('{x2;v:question['questionid']}',this);"><i
                                            class="glyphicon glyphicon-bookmark"></i></a>
									<a name="question_{x2;v:question['questionid']}"></a>
									<input id="time_{x2;v:question['questionid']}" type="hidden"
                                           name="time[{x2;v:question['questionid']}]"/>
								</span>
                            </h4>
                            <div class="choice">
                                {x2;realhtml:v:question['question']}
                            </div>
                            {x2;if:!$questype[v:quest]['questsort']}
                            {x2;if:v:question['questionselect'] && $questype[v:quest]['questchoice'] != 5}
                            <div class="choice" style="padding:0.5rem;">
                                {x2;realhtml:v:question['questionselect']}
                            </div>
                            {x2;endif}
                            <div class="selector">
                                {x2;if:$questype[v:quest]['questchoice'] == 1 || $questype[v:quest]['questchoice'] == 4}
                                {x2;tree:$selectorder,so,sid}
                                {x2;if:v:key == v:question['questionselectnumber']}
                                {x2;eval: break;}
                                {x2;endif}
                                <label class="radio-inline" style="line-height:2.8rem;">
                                    <input type="radio"
                                           name="question[{x2;v:question['questionid']}]"
                                           rel="{x2;v:question['questionid']}"
                                           value="{x2;v:so}"
                                           {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:question['questionid']]}checked{x2;endif}/>{x2;v:so}
                                </label>
                                {x2;endtree}
                                {x2;elseif:$questype[v:quest]['questchoice'] == 5}
                                <input type="text" style="width:100%;height:2em;"
                                       name="question[{x2;v:question['questionid']}]"
                                       value="{x2;$sessionvars['examsessionuseranswer'][v:question['questionid']]}"
                                       rel="{x2;v:question['questionid']}"/>
                                {x2;else}
                                {x2;tree:$selectorder,so,sid}
                                {x2;if:v:key >= v:question['questionselectnumber']}
                                {x2;eval: break;}
                                {x2;endif}
                                <label class="checkbox-inline" style="line-height:2.8rem;">
                                    <input type="checkbox"
                                           name="question[{x2;v:question['questionid']}][{x2;v:key}]"
                                           rel="{x2;v:question['questionid']}"
                                           value="{x2;v:so}"
                                           {x2;if:is_array($sessionvars['examsessionuseranswer'][v:question['questionid']]) && in_array(v:so,$sessionvars['examsessionuseranswer'][v:question['questionid']])}checked{x2;endif}/>{x2;v:so}
                                </label>
                                {x2;endtree}
                                {x2;endif}
                            </div>
                            {x2;else}
                            <div class="selector">
                                {x2;eval: $dataid = v:question['questionid']}
                                {x2;include:plugin_editor}
                            </div>
                            {x2;endif}
                            {x2;if:$questions[v:question['questionid']]['number']}
                            <div class="alert alert-info">
                                提示：截止目前本题共有 {x2;$questions[v:question['questionid']]['number']} 人回答，
                                {x2;$questions[v:question['questionid']]['right']} 人答对，
                                正确率 {x2;eval: echo round($questions[v:question['questionid']]['right']/$questions[v:question['questionid']]['number']*100,2);}%。
                            </div>
                            {x2;endif}
                            <div class="toolbar" style="padding:1rem 0.5rem;margin-top:1rem;">
                                {x2;if:v:qcid > 1}
                                <a class="btn btn-default"
                                   onclick="javascript:gotoindexquestion({x2;eval: echo v:qcid - 2;});"><span
                                        class="glyphicon glyphicon-chevron-left"></span>上一题</a>
                                {x2;endif}
                                {x2;if:v:qcid < v:qmid}
                                <a class="pull-right btn btn-primary"
                                   onclick="javascript:gotoindexquestion({x2;v:qcid});">下一题<span
                                        class="glyphicon glyphicon-chevron-right"></span></a>
                                {x2;endif}
                            </div>
                        </div>
                        {x2;endtree}
                        {x2;if:is_array($sessionvars['examsessionquestion']['questionrows'][v:quest])}
                        {x2;tree:$sessionvars['examsessionquestion']['questionrows'][v:quest],questionrow,qrid}
                        {x2;eval: v:tid++}
                        {x2;tree:v:questionrow['data'],data,did}
                        {x2;eval: v:qcid++}
                        <div class="paperexamcontent" id="questions_{x2;v:data['questionid']}" rel="{x2;v:quest}"
                             style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem;padding:1rem;">
                            <h4 class="title">第{x2;v:tid}题{x2;v:did}小题
                                <span class="pull-right">
									<a class="btn text-primary qicon"
                                       onclick="javascript:favorquestion('{x2;v:data['questionid']}');"><i
                                            class="glyphicon glyphicon-heart-empty"></i></a>
									<a class="btn {x2;if:$sessionvars['examsessionsign'][v:data['questionid']]}text-danger{x2;else}text-info{x2;endif} qicon"
                                       href="javascript:;"
                                       onclick="javascript:signQuestion('{x2;v:data['questionid']}',this);"><i
                                            class="glyphicon glyphicon-bookmark"></i></a>
									<a name="question_{x2;v:data['questionid']}"></a>
									<input id="time_{x2;v:data['questionid']}" type="hidden"
                                           name="time[{x2;v:data['questionid']}]"/>
								</span>
                            </h4>
                            <div class="choice">
                                {x2;realhtml:v:questionrow['qrquestion']}
                            </div>
                            <hr/>
                            <div style="padding:0rem 1.5rem;margin-top:1rem;">
                                <div class="choice">
                                    {x2;realhtml:v:data['question']}
                                </div>
                                {x2;if:!$questype[v:quest]['questsort']}
                                {x2;if:v:data['questionselect'] && $questype[v:quest]['questchoice'] != 5}
                                <div class="choice" style="padding:0.5rem;">
                                    {x2;realhtml:v:data['questionselect']}
                                </div>
                                {x2;endif}
                                <div class="selector">
                                    {x2;if:$questype[v:quest]['questchoice'] == 1 || $questype[v:quest]['questchoice'] == 4}
                                    {x2;tree:$selectorder,so,sid}
                                    {x2;if:v:key == v:data['questionselectnumber']}
                                    {x2;eval: break;}
                                    {x2;endif}
                                    <label class="radio-inline" style="line-height:2.8rem;">
                                        <input type="radio"
                                               name="question[{x2;v:data['questionid']}]"
                                               rel="{x2;v:data['questionid']}"
                                               value="{x2;v:so}"
                                               {x2;if:v:so == $sessionvars['examsessionuseranswer'][v:data['questionid']]}checked{x2;endif}/>{x2;v:so}
                                    </label>
                                    {x2;endtree}
                                    {x2;elseif:$questype[v:quest]['questchoice'] == 5}
                                    <input type="text" style="width:100%;height:2em;"
                                           name="question[{x2;v:data['questionid']}]"
                                           value="{x2;$sessionvars['examsessionuseranswer'][v:data['questionid']]}"
                                           rel="{x2;v:data['questionid']}"/>
                                    {x2;else}
                                    {x2;tree:$selectorder,so,sid}
                                    {x2;if:v:key >= v:data['questionselectnumber']}
                                    {x2;eval: break;}
                                    {x2;endif}
                                    <label class="checkbox-inline" style="line-height:2.8rem;">
                                        <input type="checkbox"
                                               name="question[{x2;v:data['questionid']}][{x2;v:key}]"
                                               rel="{x2;v:data['questionid']}"
                                               value="{x2;v:so}"
                                               {x2;if:in_array(v:so,$sessionvars['examsessionuseranswer'][v:data['questionid']])}checked{x2;endif}/>{x2;v:so}
                                    </label>
                                    {x2;endtree}
                                    {x2;endif}
                                </div>
                                {x2;else}
                                <div class="selector">
                                    {x2;eval: $dataid = v:data['questionid']}
                                    {x2;include:plugin_editor}
                                </div>
                                {x2;endif}
                            </div>
                            {x2;if:$questions[v:data['questionid']]['number']}
                            <div class="alert alert-info">
                                提示：截止目前本题共有 {x2;$questions[v:data['questionid']]['number']} 人回答，
                                {x2;$questions[v:data['questionid']]['right']} 人答对，
                                正确率 {x2;eval: echo round($questions[v:data['questionid']]['right']/$questions[v:data['questionid']]['number']*100,2);}%。
                            </div>
                            {x2;endif}
                            <div class="toolbar" style="padding:1rem 0.5rem;">
                                {x2;if:v:qcid > 1}
                                <a class="btn btn-default"
                                   onclick="javascript:gotoindexquestion({x2;eval: echo v:qcid - 2;});"><span
                                        class="glyphicon glyphicon-chevron-left"></span>上一题</a>
                                {x2;endif}
                                {x2;if:v:qcid < v:qmid}
                                <a class="pull-right btn btn-primary"
                                   onclick="javascript:gotoindexquestion({x2;v:qcid});">下一题<span
                                        class="glyphicon glyphicon-chevron-right"></span></a>
                                {x2;endif}
                            </div>
                        </div>
                        {x2;endtree}
                        {x2;endtree}
                        {x2;endif}
                        {x2;endif}
                        {x2;endif}
                        {x2;endtree}
                    </form>
                </div>
            </div>
            <div class="modal fade" id="submodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">交卷</h4>
                        </div>
                        <div class="modal-body">
                            <p>共有试题 <span class="allquestionnumber">50</span> 题，已做 <span class="yesdonumber">0</span>
                                题。您确认要交卷吗？</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" onclick="javascript:submitPaper();" class="btn btn-primary">确定交卷
                            </button>
                            <button aria-hidden="true" class="btn" type="button" data-dismiss="modal">再检查一下</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid text-center"
                 style="background-color:#337AB7;z-index:9999;position:fixed;bottom:0px;border-top:1px solid #E9E9E9;">
                <div
                    style="clear:both;background-color:#337AB7;padding-top:0px;border:0px;padding:0rem;padding-bottom:0.8rem;"
                    class="input-group-addon footer">
                    <div class="col-xs-3">
                        <div class="text-center" style="height:4.2rem;padding:0.2rem;">
                            <a href="javascript:;"
                               onclick="javascript:$.leftMenu($('#questionbar'));$('#form1').toggle();">
                                <h5 style="line-height:3.2rem;color:#FFFFFF;"><em class="glyphicon glyphicon-th"></em>
                                    题序</h5>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="text-center" style="height:4.2rem;padding:0.2rem;">
                            <a href="index.php?item-phone-cart" class="ajax" data-page="cart" data-target="cart">
                                <h4 style="line-height:3.2rem;color:#FFFFFF;"><em class="glyphicon glyphicon-time"></em>
                                    <span id="timer_h">00</span><span>：</span><span id="timer_m">00</span><span>：</span><span
                                        id="timer_s">00</span></h4>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-3">
                        <div class="text-center" style="height:4.2rem;padding:0.2rem;">
                            <a href="#submodal" onclick="javascript:$('#submodal').appendTo('body');" role="button"
                               data-toggle="modal">
                                <h5 style="line-height:3.2rem;color:#FFFFFF;"><em
                                        class="glyphicon glyphicon-list-alt"></em> 交卷</h5>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                var qindex = 0;

                function gotoquestion(questid) {
                    $(".questionpanel").hide();
                    $(".paperexamcontent").hide();
                    $("#questions_" + questid).show();
                    $("#questype_" + $("#questions_" + questid).attr('rel')).show();
                }

                function gotoindexquestion(index) {
                    qindex = index;
                    $(".questionpanel").hide();
                    $(".paperexamcontent").hide();
                    $(".paperexamcontent").eq(index).show();
                    $("#questype_" + $(".paperexamcontent").eq(index).attr('rel')).show();
                }

                $(function () {
                    $.get('index.php?exam-phone-index-ajax-lefttime&rand' + Math.random(), function (data) {
                        var setting = {
                            time:{x2;$sessionvars['examsessiontime']},
                            hbox: $("#timer_h"),
                            mbox: $("#timer_m"),
                            sbox: $("#timer_s"),
                            finish: function () {
                                submitPaper();
                            }
                        }
                        setting.lefttime = parseInt(data);
                        countdown(setting);
                    });
                    $('#exercise-paper-swiper').on('swiperight', function () {
                        if (qindex >= 1) {
                            gotoindexquestion(--qindex);
                        }
                    });
                    $('#exercise-paper-swiper').on('swipeleft', function () {
                        if (qindex < ($('#exercise-paper-swiper .paperexamcontent').length - 1)) {
                            gotoindexquestion(++qindex);
                        }
                    });

                    (function () {
                        $(".questionpanel").hide();
                        $(".questionpanel:first").show();
                        $(".paperexamcontent").hide();
                        $(".paperexamcontent:first").show();
                    })();

                    setInterval(saveanswer, 120000);

                    initData = $.parseJSON(storage.getItem('questions'));
                    if (initData) {
                        for (var p in initData) {
                            if (p != 'set')
                                formData[p] = initData[p];
                            $("#time_" + $('[name="' + p + '"]').attr('rel')).val(initData[p].time);
                        }

                        var textarea = $('#form1 textarea');
                        $.each(textarea, function () {
                            var _this = $(this);
                            if (initData[_this.attr('name')]) {
                                _this.val(initData[_this.attr('name')].value);
                                batmark(_this.attr('rel'), initData[_this.attr('name')].value);
                            }
                        });
                        var texts = $('#form1 :input[type=text]');
                        $.each(texts, function () {
                            var _this = $(this);
                            if (initData[_this.attr('name')]) {
                                _this.val(initData[_this.attr('name')] ? initData[_this.attr('name')].value : '');
                                if (initData[_this.attr('name')].value && initData[_this.attr('name')].value != '')
                                    batmark(_this.attr('rel'), initData[_this.attr('name')].value);
                            }
                        });

                        var radios = $('#form1 :input[type=radio]');
                        $.each(radios, function () {
                            var _ = this, v = initData[_.name] ? initData[_.name].value : null;
                            var _this = $(this);
                            if (v != '' && v == _.value) {
                                _.checked = true;
                                batmark(_this.attr('rel'), initData[_this.attr('name')].value);
                            } else {
                                _.checked = false;
                            }
                        });

                        var checkboxs = $('#form1 :input[type=checkbox]');
                        $.each(checkboxs, function () {
                            var _ = this, v = initData[_.name] ? initData[_.name].value : null;
                            var _this = $(this);
                            if (v != '' && v == _.value) {
                                _.checked = true;
                                batmark(_this.attr('rel'), initData[_this.attr('name')].value);
                            } else {
                                _.checked = false;
                            }
                        });
                    }

                    $('#form1 :input[type=text]').change(function () {
                        var _this = $(this);
                        var p = [];
                        p.push(_this.attr('name'));
                        p.push(_this.val());
                        p.push(Date.parse(new Date()) / 1000);
                        $('#time_' + _this.attr('rel')).val(Date.parse(new Date()) / 1000);
                        set.apply(formData, p);
                        markQuestion(_this.attr('rel'), true);
                    });

                    $('#form1 :input[type=radio]').change(function () {
                        var _ = this;
                        var _this = $(this);
                        var p = [];
                        p.push(_.name);
                        if (_.checked) {
                            p.push(_.value);
                            p.push(Date.parse(new Date()) / 1000);
                            $('#time_' + _this.attr('rel')).val(Date.parse(new Date()) / 1000);
                            set.apply(formData, p);
                        } else {
                            p.push('');
                            p.push(null);
                            set.apply(formData, p);
                        }
                        markQuestion(_this.attr('rel'));
                    });

                    $('#form1 textarea').change(function () {
                        var _ = this;
                        var _this = $(this);
                        var p = [];
                        p.push(_.name);
                        p.push(_.value);
                        p.push(Date.parse(new Date()) / 1000);
                        $('#time_' + _this.attr('rel')).val(Date.parse(new Date()) / 1000);
                        set.apply(formData, p);
                        markQuestion(_this.attr('rel'), true);
                    });
                    $('#form1 :input[type=checkbox]').change(function () {
                        var _ = this;
                        var _this = $(this);
                        var p = [];
                        p.push(_.name);
                        if (_.checked) {
                            p.push(_.value);
                            p.push(Date.parse(new Date()) / 1000);
                            $('#time_' + _this.attr('rel')).val(Date.parse(new Date()) / 1000);
                            set.apply(formData, p);
                        } else {
                            p.push('');
                            p.push(null);
                            set.apply(formData, p);
                        }
                        markQuestion(_this.attr('rel'));
                    });
                    $('.allquestionnumber').html($('.paperexamcontent').length);
                    $('.yesdonumber').html($('#questionindex .btn-primary').length);
                });
            </script>
        </div>
        {x2;if:!$userhash}
    </div>
</div>
</body>
</html>
{x2;endif}
