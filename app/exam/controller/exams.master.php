<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * 项目维护：oiuv(QQ:7300637) | 定制服务：火眼(QQ:278768688)
 *
 * This source file is subject to the MIT license that is bundled.
 */

class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function showsetting()
    {
        $setting = $this->ev->get('setting');
        $setting = explode('|', $setting);
        $rs = [];
        foreach ($setting as $p) {
            if ($p) {
                $tp = explode(':', $p);
                $knows = $this->section->getKnowsListByArgs([['AND', 'find_in_set(knowsid,:knowsid)', 'knowsid', $tp[0]]]);
                $n = [];
                foreach ($knows as $s) {
                    $n[] = $s['knows'];
                }
                $o = explode(',', $tp[2]);
                $rs[] = ['knows' => implode(',', $n), 'number' => $tp[1], 'easy' => intval($o[0]), 'mid' => intval($o[1]), 'hard' => intval($o[2])];
            }
        }
        $this->tpl->assign('rs', $rs);
        $this->tpl->display('exams_autosetting');
    }

    private function selectexams()
    {
        $search = $this->ev->get('search');
        $useframe = $this->ev->get('useframe');
        $target = $this->ev->get('target');
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $this->pg->setUrlTarget('modal-body" class="ajax');
        $args = [];
        if ($search) {
            if ($search['subjectid']) {
                $args[] = ['AND', 'examsubject = :examsubject', 'examsubject', $search['subjectid']];
            }
        }
        if (!count($args)) {
            $args = 1;
        }
        $exams = $this->exam->getExamSettingList($args, $page, 10);
        $subjects = $this->basic->getSubjectList();
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('target', $target);
        $this->tpl->assign('exams', $exams);
        $this->tpl->display('exams_ajax');
    }

    private function delexam()
    {
        $examid = $this->ev->get('examid');
        $page = $this->ev->get('page');
        $this->exam->delExamSetting($examid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-exams&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function preview()
    {
        $examid = $this->ev->get('examid');
        $r = $this->exam->getExamSettingById($examid);
        $this->tpl->assign('setting', $r);
        if (2 == $r['examtype']) {
            $questions = [];
            $questionrows = [];
            foreach ($r['examquestions'] as $key => $p) {
                $qids = '';
                $qrids = '';
                if ($p['questions']) {
                    $qids = trim($p['questions'], ' ,');
                }
                if ($qids) {
                    $questions[$key] = $this->exam->getQuestionListByIds($qids);
                }
                if ($p['rowsquestions']) {
                    $qrids = trim($p['rowsquestions'], ' ,');
                }
                if ($qrids) {
                    $qrids = explode(',', $qrids);
                    foreach ($qrids as $t) {
                        $qr = $this->exam->getQuestionRowsById($t);
                        if ($qr) {
                            $questionrows[$key][$t] = $qr;
                        }
                    }
                }
            }
            $args['examsessionquestion'] = ['questions' => $questions, 'questionrows' => $questionrows];
            $args['examsessionsetting'] = $r;
            $args['examsessionstarttime'] = TIME;
            $args['examsession'] = $r['exam'];
            $args['examsessionscore'] = 0;
            $args['examsessiontime'] = $r['examsetting']['examtime'];
            $args['examsessiontype'] = 2;
            $args['examsessionkey'] = $r['examid'];
            $args['examsessionissave'] = 0;
        } else {
            $args['examsessionquestion'] = ['questions' => $r['examquestions']['questions'], 'questionrows' => $r['examquestions']['questionrows']];
            $args['examsessionsetting'] = $r;
            $args['examsessionstarttime'] = TIME;
            $args['examsession'] = $r['exam'];
            $args['examsessiontime'] = $r['examsetting']['examtime'];
            $args['examsessiontype'] = 2;
            $args['examsessionkey'] = $r['examid'];
        }
        $questype = $this->basic->getQuestypeList();
        $this->tpl->assign('questype', $questype);
        $this->tpl->assign('sessionvars', $args);
        $this->tpl->display('exams_paper');
    }

    private function modifypaper()
    {
        $examid = $this->ev->get('examid');
        $questionid = $this->ev->get('questionid');
        $qrid = $this->ev->get('qrid');
        $r = $this->exam->getExamSettingById($examid);
        $questypes = $this->basic->getQuestypeList();
        $this->tpl->assign('questypes', $questypes);
        if ($this->ev->get('modifypaper')) {
            $args = $this->ev->get('args');
            $targs = $this->ev->get('targs');
            $q = null;
            if ($qrid) {
                foreach ($r['examquestions']['questionrows'] as $tkey => $tp) {
                    foreach ($tp as $key => $p) {
                        if ($p['qrid'] == $qrid) {
                            $r['examquestions']['questionrows'][$tkey][$key]['qrquestion'] = $args['qrquestion'];
                            $q = 1;
                            break;
                        }
                        if ($q) {
                            break;
                        }
                    }
                    if ($q) {
                        break;
                    }
                }
            } else {
                foreach ($r['examquestions']['questions'] as $tkey => $tp) {
                    foreach ($tp as $key => $p) {
                        if ($p['questionid'] == $questionid) {
                            $args['questionid'] = $questionid;
                            $questype = $this->basic->getQuestypeById($args['questiontype']);
                            if ($questype['questsort']) {
                                $choice = 0;
                            } else {
                                $choice = $questype['questchoice'];
                            }
                            $args['questionanswer'] = $targs['questionanswer'.$choice];
                            $r['examquestions'][$tkey][$key] = $args;
                            $q = 1;
                            break;
                        }
                    }
                    if ($q) {
                        break;
                    }
                }

                foreach ($r['examquestions']['questionrows'] as $qkey => $tp) {
                    foreach ($tp as $tkey => $ttp) {
                        foreach ($ttp['data'] as $key => $p) {
                            if ($p['questionid'] == $questionid) {
                                $args['questionid'] = $questionid;
                                $questype = $this->basic->getQuestypeById($args['questiontype']);
                                if ($questype['questsort']) {
                                    $choice = 0;
                                } else {
                                    $choice = $questype['questchoice'];
                                }
                                $args['questionanswer'] = $targs['questionanswer'.$choice];
                                $r['examquestions']['questionrows'][$qkey][$tkey]['data'][$key] = $args;
                                $q = 1;
                                break;
                            }
                        }
                        if ($q) {
                            break;
                        }
                    }
                    if ($q) {
                        break;
                    }
                }
            }
            $this->exam->modifyExamSetting($examid, ['examquestions' => $r['examquestions']]);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?exam-master-exams-preview&examid='.$examid,
            ];
            $this->G->R($message);
        } else {
            $question = null;
            if ($qrid) {
                foreach ($r['examquestions']['questionrows'] as $tp) {
                    foreach ($tp as $p) {
                        if ($p['qrid'] == $qrid) {
                            $question = $p;
                            break;
                        }
                        if ($question) {
                            break;
                        }
                    }
                    if ($question) {
                        break;
                    }
                }
            } else {
                foreach ($r['examquestions']['questions'] as $tp) {
                    foreach ($tp as $p) {
                        if ($p['questionid'] == $questionid) {
                            $question = $p;
                            break;
                        }
                    }
                    if ($question) {
                        break;
                    }
                }
                foreach ($r['examquestions']['questionrows'] as $tp) {
                    foreach ($tp as $ttp) {
                        foreach ($ttp['data'] as $p) {
                            if ($p['questionid'] == $questionid) {
                                $question = $p;
                                break;
                            }
                        }
                        if ($question) {
                            break;
                        }
                    }
                    if ($question) {
                        break;
                    }
                }
            }
            $this->tpl->assign('examid', $examid);
            $this->tpl->assign('questionid', $questionid);
            $this->tpl->assign('qrid', $qrid);
            $this->tpl->assign('question', $question);
            $this->tpl->display('exams_modifypaper');
        }
    }

    private function outcsv()
    {
        $this->files = $this->G->make('files');
        $examid = $this->ev->get('examid');
        $exam = $this->exam->getExamSettingById($examid);
        $questypes = $this->basic->getQuestypeList();
        $data = [];
        foreach ($exam['examquestions'] as $tp) {
            foreach ($tp as $p) {
                $data[] = [iconv('UTF-8', 'GBK//IGNORE', $questypes[$p['questiontype']]['questchar']), iconv('UTF-8', 'GBK//IGNORE', html_entity_decode($p['question'])), iconv('UTF-8', 'GBK//IGNORE', html_entity_decode($p['questionselect'])), iconv('UTF-8', 'GBK//IGNORE', $p['questionselectnumber']), iconv('UTF-8', 'GBK//IGNORE', html_entity_decode($p['questionanswer'])), iconv('UTF-8', 'GBK//IGNORE', html_entity_decode($p['questiondescribe']))];
            }
        }
        $fname = 'data/exams/'.TIME.'-'.$examid.'-score.csv';
        if ($this->files->outCsv($fname, $data)) {
            $message = [
                'statusCode'   => 200,
                'message'      => "成绩导出成功，转入下载页面，如果浏览器没有相应，请<a href=\"{$fname}\">点此下载</a>",
                'callbackType' => 'forward',
                'forwardUrl'   => "{$fname}",
            ];
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '成绩导出失败',
            ];
        }
        $this->G->R($message);
    }

    private function ajax()
    {
        switch ($this->ev->url(4)) {
            case 'getsubjectknows':
            $subjectid = $this->ev->get('subjectid');
            $tmpknows = $this->section->getAllKnowsBySubject($subjectid);
            $knows = [];
            $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $subjectid]]);
            foreach ($tmpknows as $p) {
                $knows[$p['knowssectionid']][] = $p;
            }
            $this->tpl->assign('sections', $sections);
            $this->tpl->assign('knows', $knows);
            $this->tpl->display('exam_ajax_getsubjectknows');
            break;

            default:
            $subjectid = $this->ev->get('subjectid');
            $type = $this->ev->get('type');
            if ($subjectid) {
                $basic = $this->basic->getBasicBySubjectId($subjectid);
                $questypes = $this->basic->getQuestypeList();
                $this->tpl->assign('questypes', $questypes);
                $this->tpl->assign('type', $type);
                $this->tpl->assign('subjectid', $subjectid);
                $this->tpl->assign('basic', $basic);
                $this->tpl->display('exams_ajaxsetting');
            }
        }
    }

    private function del()
    {
        $page = $this->ev->get('page');
        $examid = $this->ev->get('examid');
        $this->exam->delExamSetting($examid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-exams&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function autopage()
    {
        if ($this->ev->get('submitsetting')) {
            $args = $this->ev->get('args');
            $args['examsetting'] = $args['examsetting'];
            $args['examauthorid'] = $this->_user['sessionuserid'];
            $args['examauthor'] = $this->_user['sessionusername'];
            $args['examtype'] = 1;

            $totalscore = 0;
            foreach ($args['examsetting']['questype'] as $key => $p) {
                if (!$args['examsetting']['questypelite'][$key]) {
                    unset($args['examsetting']['questype'][$key],$args['examquestions'][$key]);
                }
                $totalscore += $p['number'] * $p['score'];
            }
            if ($args['examsetting']['score'] != $totalscore) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '分数设置不正确，请检查',
                ];
                $this->G->R($message);
            }
            $this->exam->addExamSetting($args);
            $message = [
                'statusCode' => 200,
                'message'    => '操作成功',
                'forwardUrl' => "index.php?exam-master-exams&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $subjects = $this->basic->getSubjectList();
            $questypes = $this->basic->getQuestypeList();
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('exams_auto');
        }
    }

    private function selfpage()
    {
        if ($this->ev->get('submitsetting')) {
            $args = $this->ev->get('args');
            $args['examsetting'] = $args['examsetting'];
            $args['examauthorid'] = $this->_user['sessionuserid'];
            $args['examauthor'] = $this->_user['sessionusername'];
            $args['examtype'] = 2;
            $args['examquestions'] = $args['examquestions'];

            foreach ($args['examsetting']['questype'] as $key => $p) {
                if (!$args['examsetting']['questypelite'][$key]) {
                    unset($args['examsetting']['questype'][$key],$args['examquestions'][$key]);
                }
            }

            $id = $this->exam->addExamSetting($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-exams-examself&examid={$id}&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $subjects = $this->basic->getSubjectList();
            $questypes = $this->basic->getQuestypeList();
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('exams_self');
        }
    }

    private function temppage()
    {
        if ($this->ev->get('submitsetting')) {
            $args = $this->ev->get('args');
            $uploadfile = $this->ev->get('uploadfile');
            if (!$uploadfile) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '请上传即时试卷试题',
                ];
                $this->G->R($message);
            }
            $args['examsetting'] = $args['examsetting'];
            $args['examauthorid'] = $this->_user['sessionuserid'];
            $args['examauthor'] = $this->_user['sessionusername'];
            $args['examtype'] = 3;
            setlocale(LC_ALL, 'zh_CN');
            $handle = fopen($uploadfile, 'r');
            $questions = [];
            $rindex = 0;
            $index = 0;
            while ($data = fgetcsv($handle)) {
                $targs = [];
                $question = $data;
                if (count($question) >= 5) {
                    $isqr = intval(trim($question[6], " \n\t"));
                    if ($isqr) {
                        $istitle = intval(trim($question[7], " \n\t"));
                        if ($istitle) {
                            ++$rindex;
                            $targs['qrid'] = 'qr_'.$rindex;
                            $targs['qrtype'] = $question[0];
                            $targs['qrquestion'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[1]), " \n\t"))));
                            $targs['qrcreatetime'] = TIME;
                            $questionrows[$targs['qrtype']][intval($rindex - 1)] = $targs;
                        } else {
                            ++$index;
                            $targs['questionid'] = 'q_'.$index;
                            $targs['questiontype'] = $question[0];
                            $targs['question'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[1]), " \n\t"))));
                            $targs['questionselect'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[2]), " \n\t"))));
                            if (!$targs['questionselect'] && 3 == $targs['questiontype']) {
                                $targs['questionselect'] = '<p>A、对<p><p>B、错<p>';
                            }
                            $targs['questionselectnumber'] = $question[3];
                            $targs['questionanswer'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[4], " \n\t"))));
                            $targs['questiondescribe'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[5], " \n\t"))));
                            $targs['questioncreatetime'] = TIME;
                            $questionrows[$targs['questiontype']][intval($rindex - 1)]['data'][] = $targs;
                            //$qustionnumber++;
                        }
                    } else {
                        ++$index;
                        $targs['questionid'] = 'q_'.$index;
                        $targs['questiontype'] = $question[0];
                        $targs['question'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[1]), " \n\t"))));
                        $targs['questionselect'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[2]), " \n\t"))));
                        if (!$targs['questionselect'] && 3 == $targs['questiontype']) {
                            $targs['questionselect'] = '<p>A、对<p><p>B、错<p>';
                        }
                        $targs['questionselectnumber'] = intval($question[3]);
                        $targs['questionanswer'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[4], " \n\t"))));
                        $targs['questiondescribe'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[5], " \n\t"))));
                        $targs['questioncreatetime'] = TIME;
                        $questions[$targs['questiontype']][] = $targs;
                        //$qustionnumber++;
                    }
                }
            }
            $args['examquestions'] = ['questions' => $questions, 'questionrows' => $questionrows];
            //$args['examsetting']['questype'][1]['number'] = $qustionnumber;
            //$args['examsetting']['questype'][1]['score'] = intval(100/$qustionnumber);
            $id = $this->exam->addExamSetting($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-exams-examself&examid={$id}&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $subjects = $this->basic->getSubjectList();
            $questypes = $this->basic->getQuestypeList();
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('exams_temp');
        }
    }

    private function selected()
    {
        $show = $this->ev->get('show');
        $questionids = trim($this->ev->get('questionids'), ' ,');
        $rowsquestionids = trim($this->ev->get('rowsquestionids'), ' ,');
        if (!$questionids) {
            $questionids = '0';
        }
        if (!$rowsquestionids) {
            $rowsquestionids = '0';
        }
        $questions = $this->exam->getQuestionListByArgs([['AND', 'questionstatus = 1'], ['AND', 'find_in_set(questionid,:questionid)', 'questionid', $questionids]]);
        $rowsquestions = [];
        $rowsquestionids = explode(',', $rowsquestionids);
        foreach ($rowsquestionids as $p) {
            if ($p) {
                $rowsquestions[$p] = $this->exam->getQuestionRowsByArgs([['AND', 'qrstatus = 1'], ['AND', 'qrid = :qrid', 'qrid', $p]]);
            }
        }
        $this->tpl->assign('rowsquestions', $rowsquestions);
        $this->tpl->assign('questions', $questions);
        $this->tpl->assign('show', $show);
        $this->tpl->display('exams_selected');
    }

    private function selectquestions()
    {
        $search = $this->ev->get('search');
        $useframe = $this->ev->get('useframe');
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $this->pg->setUrlTarget('modal-body" class="ajax');
        if (!$search['questionisrows']) {
            $args = [['AND', 'quest2knows.qkquestionid = questions.questionid'], ['AND', "questions.questionstatus = '1'"], ['AND', 'questions.questionparent = 0'], ['AND', 'quest2knows.qktype = 0']];
            if ($search['keyword']) {
                $args[] = ['AND', 'questions.question LIKE :question', 'question', '%'.$search['keyword'].'%'];
            }
            if ($search['knowsids']) {
                $args[] = ['AND', 'find_in_set(questions.questionknowsid,:questionknowsid)', 'questionknowsid', $search['knowsids']];
            }
            if ($search['stime']) {
                $args[] = ['AND', 'questions.questioncreatetime >= :squestioncreatetime', 'squestioncreatetime', strtotime($search['stime'])];
            }
            if ($search['etime']) {
                $args[] = ['AND', 'questions.questioncreatetime <= :equestioncreatetime', 'equestioncreatetime', strtotime($search['etime'])];
            }
            if ($search['questiontype']) {
                $args[] = ['AND', 'questions.questiontype = :questiontype', 'questiontype', $search['questiontype']];
            }
            if ($search['questionlevel']) {
                $args[] = ['AND', 'questions.questionlevel = :questionlevel', 'questionlevel', $search['questionlevel']];
            }
            if ($search['questionknowsid']) {
                $args[] = ['AND', 'quest2knows.qkknowsid = :qkknowsid', 'qkknowsid', $search['questionknowsid']];
            } else {
                $tmpknows = '0';
                if ($search['questionsectionid']) {
                    $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
                    foreach ($knows as $p) {
                        if ($p['knowsid']) {
                            $tmpknows .= ','.$p['knowsid'];
                        }
                    }
                    $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
                } elseif ($search['questionsubjectid']) {
                    $knows = $this->section->getAllKnowsBySubject($search['questionsubjectid']);
                    foreach ($knows as $p) {
                        if ($p['knowsid']) {
                            $tmpknows .= ','.$p['knowsid'];
                        }
                    }
                    $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
                } else {
                    $knows = $this->section->getAllKnowsBySubjects($this->teachsubjects);
                    foreach ($knows as $p) {
                        if ($p['knowsid']) {
                            $tmpknows .= ','.$p['knowsid'];
                        }
                    }
                    $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
                }
            }

            $questions = $this->exam->getQuestionsList($page, 10, $args);
        } else {
            $args = [['AND', 'quest2knows.qkquestionid = questionrows.qrid'], ['AND', "questionrows.qrstatus = '1'"]];
            if ($search['keyword']) {
                $args[] = ['AND', 'questionrows.qrquestion LIKE :qrquestion', 'qrquestion', '%'.$search['keyword'].'%'];
            }
            if ($search['questiontype']) {
                $args[] = ['AND', 'questionrows.qrtype = :qrtype', 'qrtype', $search['questiontype']];
            }
            if ($search['stime']) {
                $args[] = ['AND', 'questionrows.qrtime >= :sqrtime', 'sqrtime', strtotime($search['stime'])];
            }
            if ($search['etime']) {
                $args[] = ['AND', 'questionrows.qrtime <= :eqrtime', 'eqrtime', strtotime($search['etime'])];
            }
            if ($search['qrlevel']) {
                $args[] = ['AND', 'questionrows.qrlevel = :qrlevel', 'qrlevel', $search['qrlevel']];
            }
            if ($search['questionknowsid']) {
                $args[] = ['AND', 'quest2knows.qkknowsid = :qkknowsid', 'qkknowsid', $search['questionknowsid']];
            } else {
                $tmpknows = '0';
                if ($search['questionsectionid']) {
                    $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
                    foreach ($knows as $p) {
                        if ($p['knowsid']) {
                            $tmpknows .= ','.$p['knowsid'];
                        }
                    }
                    $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
                } elseif ($search['questionsubjectid']) {
                    $knows = $this->section->getAllKnowsBySubject($search['questionsubjectid']);
                    foreach ($knows as $p) {
                        if ($p['knowsid']) {
                            $tmpknows .= ','.$p['knowsid'];
                        }
                    }
                    $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
                } else {
                    $knows = $this->section->getAllKnowsBySubjects($this->teachsubjects);
                    foreach ($knows as $p) {
                        if ($p['knowsid']) {
                            $tmpknows .= ','.$p['knowsid'];
                        }
                    }
                    $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid)', 'qkknowsid', $tmpknows];
                }
            }
            $questions = $this->exam->getQuestionrowsList($page, 10, $args);
        }
        if ($useframe) {
            $questions['pages'] = str_replace('&useframe=1', '', $questions['pages']);
        }
        $questypes = $this->basic->getQuestypeList();
        $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $search['questionsubjectid']]]);
        $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
        //$this->tpl->assign('subjects',$subjects);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('knows', $knows);
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->assign('questiontype', $search['questiontype']);
        $this->tpl->assign('questions', $questions);
        $this->tpl->assign('useframe', $useframe);
        $this->tpl->display('selectquestions');
    }

    private function modify()
    {
        $search = $this->ev->get('search');
        $examid = $this->ev->get('examid');
        $exam = $this->exam->getExamSettingById($examid);
        if ($this->ev->get('submitsetting')) {
            $args = $this->ev->get('args');
            $args['examsetting'] = $args['examsetting'];
            if (3 == $exam['examtype']) {
                $uploadfile = $this->ev->get('uploadfile');
                if ($uploadfile) {
                    setlocale(LC_ALL, 'zh_CN');
                    $handle = fopen($uploadfile, 'r');
                    $questions = [];
                    $index = 0;
                    $rindex = 0;
                    while ($data = fgetcsv($handle)) {
                        $targs = [];
                        $question = $data;
                        if (count($question) >= 5) {
                            $isqr = intval(trim($question[6], " \n\t"));
                            if ($isqr) {
                                $istitle = intval(trim($question[7], " \n\t"));
                                if ($istitle) {
                                    ++$rindex;
                                    $targs['qrid'] = 'qr_'.$rindex;
                                    $targs['qrtype'] = $question[0];
                                    $targs['qrquestion'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[1]), " \n\t"))));
                                    $targs['qrcreatetime'] = TIME;
                                    $questionrows[$targs['qrtype']][intval($rindex - 1)] = $targs;
                                } else {
                                    ++$index;
                                    $targs['questionid'] = 'q_'.$index;
                                    $targs['questiontype'] = $question[0];
                                    $targs['question'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[1]), " \n\t"))));
                                    $targs['questionselect'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[2]), " \n\t"))));
                                    if (!$targs['questionselect'] && 3 == $targs['questiontype']) {
                                        $targs['questionselect'] = '<p>A、对<p><p>B、错<p>';
                                    }
                                    $targs['questionselectnumber'] = intval($question[3]);
                                    $targs['questionanswer'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[4], " \n\t"))));
                                    $targs['questiondescribe'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[5], " \n\t"))));
                                    $targs['questioncreatetime'] = TIME;
                                    $questionrows[$targs['questiontype']][intval($rindex - 1)]['data'][] = $targs;
                                    //$qustionnumber++;
                                }
                            } else {
                                ++$index;
                                $targs['questionid'] = 'q_'.$index;
                                $targs['questiontype'] = $question[0];
                                $targs['question'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[1]), " \n\t"))));
                                /*
                                $ei = md5($targs['question']);
                                if($isexit[$ei])
                                {
                                    $message = array(
                                        'statusCode' => 300,
                                        "message" => "试题重复，该试题是:".$targs['question']
                                    );
                                    $this->G->R($message);
                                }
                                else
                                $isexit[$ei] = 1;
                                **/
                                $targs['questionselect'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim(nl2br($question[2]), " \n\t"))));
                                if (!$targs['questionselect'] && 3 == $targs['questiontype']) {
                                    $targs['questionselect'] = '<p>A、对<p><p>B、错<p>';
                                }
                                $targs['questionselectnumber'] = $question[3];
                                $targs['questionanswer'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[4], " \n\t"))));
                                $targs['questiondescribe'] = $this->ev->addSlashes(htmlspecialchars(iconv('GBK', 'UTF-8//IGNORE', trim($question[5], " \n\t"))));
                                $targs['questioncreatetime'] = TIME;
                                $questions[$targs['questiontype']][] = $targs;
                                //$qustionnumber++;
                            }
                        }
                    }
                    $args['examquestions'] = ['questions' => $questions, 'questionrows' => $questionrows];
                }
            } else {
                $args['examquestions'] = $args['examquestions'];
            }
            foreach ($args['examsetting']['questype'] as $key => $p) {
                if (!$args['examsetting']['questypelite'][$key]) {
                    unset($args['examsetting']['questype'][$key],$args['examquestions'][$key]);
                }
            }

            $this->exam->modifyExamSetting($examid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-exams&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $subjects = $this->basic->getSubjectList();
            $questypes = $this->basic->getQuestypeList();
            foreach ($exam['examquestions'] as $key => $p) {
                $exam['examnumber'][$key] = $this->exam->getExamQuestionNumber($p);
            }
            foreach ($exam['examsetting']['questypelite'] as $key => $p) {
                if (!$subjects[$exam['examsubject']]['subjectsetting']['questypes'][$key]) {
                    $exam['examsetting']['questypelite'][$key] = 0;
                }
            }
            foreach ($subjects[$exam['examsubject']]['subjectsetting']['questypes'] as $key => $p) {
                if (!$exam['examsetting']['questypelite'][$key]) {
                    $exam['examsetting']['questypelite'][$key] = 1;
                }
            }
            $this->tpl->assign('search', $search);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->assign('exam', $exam);
            $this->tpl->assign('questypes', $questypes);
            if (1 == $exam['examtype']) {
                $this->tpl->display('exams_modifyauto');
            } elseif (2 == $exam['examtype']) {
                $this->tpl->display('exams_modifyself');
            } else {
                $this->tpl->display('exams_modifytemp');
            }
        }
    }

    private function index()
    {
        $search = $this->ev->get('search');
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $args = [];
        if ($search) {
            if ($search['examsubject']) {
                $args[] = ['AND', 'examsubject = :examsubject', 'examsubject', $search['examsubject']];
            }
            if ($search['examtype']) {
                $args[] = ['AND', 'examtype = :examtype', 'examtype', $search['examtype']];
            }
        }
        $exams = $this->exam->getExamSettingList($args, $page, 10);
        $subjects = $this->basic->getSubjectList();
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('exams', $exams);
        $this->tpl->display('exams');
    }
}
