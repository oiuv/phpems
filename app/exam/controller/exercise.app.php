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

    private function view()
    {
        $sessionvars = $this->exam->getExamSessionBySessionid();
        if ($sessionvars['examsessiontype']) {
            if (1 == $sessionvars['examsessiontype']) {
                header('location:index.php?exam-app-exampaper-view');
            } else {
                header('location:index.php?exam-app-exam-view');
            }
            exit;
        }
        $this->tpl->assign('questype', $this->basic->getQuestypeList());
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->display('exercise_view');
    }

    private function reload()
    {
        $args = ['examsessionkey' => 0];
        $this->exam->modifyExamSession($args);
        header('location:index.php?exam-app-exercise');
        exit;
    }

    private function ajax()
    {
        switch ($this->ev->url(4)) {
            //获取剩余考试时间
            case 'getexamlefttime':
            $sessionvars = $this->exam->getExamSessionBySessionid();
            $lefttime = 0;
            if (0 == $sessionvars['examsessionstatus'] && 1 == $sessionvars['examsessiontype']) {
                if (TIME > ($sessionvars['examsessionstarttime'] + $sessionvars['examsessiontime'] * 60)) {
                    $lefttime = $sessionvars['examsessiontime'] * 60;
                } else {
                    $lefttime = TIME - $sessionvars['examsessionstarttime'];
                }
            }
            echo $lefttime;
            exit();
            break;

            case 'getQuestionNumber':
            $questype = $this->basic->getQuestypeList();
            $sectionid = $this->ev->get('sectionid');
            $knowids = $this->ev->get('knowsid');
            if (!$knowids) {
                if (!$sectionid) {
                    $knows = $this->section->getAllKnowsBySubject($this->data['currentsubject']['subjectid']);
                } else {
                    $knows = $this->section->getKnowsListByArgs([['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $sectionid], ['AND', 'knowsstatus = 1']]);
                }
                foreach ($knows as $key => $p) {
                    $knowids .= "{$key},";
                }
                $knowids = trim($knowids, ' ,');
            }
            $numbers = [];
            $numbers = [];
            foreach ($questype as $p) {
                $numbers[$p['questid']] = intval(ceil($this->exam->getQuestionNumberByQuestypeAndKnowsid($p['questid'], $knowids)));
            }
            $this->tpl->assign('numbers', $numbers);
            $this->tpl->assign('questype', $questype);
            $this->tpl->display('exercise_number');
            break;

            case 'saveUserAnswer':
            $question = $this->ev->post('question');
            foreach ($question as $key => $t) {
                if ('' == $t) {
                    unset($question[$key]);
                }
            }
            $this->exam->modifyExamSession(['examsessionuseranswer' => $question]);
            echo is_array($question) ? count($question) : 0;
            exit;
            break;

            default:
        }
    }

    private function score()
    {
        $questype = $this->basic->getQuestypeList();
        if ($this->ev->get('insertscore')) {
            $sessionvars = $this->exam->getExamSessionBySessionid();
            if (!$sessionvars['examsessionid']) {
                $message = [
                    'statusCode'   => 300,
                    'message'      => '非法参数',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?exam-app-exercise',
                ];
                $this->G->R($message);
            }
            $question = $this->ev->get('question');
            $sessionvars['examsessionuseranswer'] = $question;
            $result = $this->exam->markscore($sessionvars, $questype);
            if ($result['needhand']) {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '交卷成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-app-history-makescore&ehid={$result['ehid']}",
                ];
            } else {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '交卷成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-app-history-stats&ehid={$result['ehid']}",
                ];
            }
            $this->G->R($message);
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '非法参数',
            ];
            $this->G->R($message);
        }
    }

    private function paper()
    {
        $sessionvars = $this->exam->getExamSessionBySessionid();
        if (!$sessionvars['examsessionid']) {
            header('location:index.php?exam-app-exercise');
            exit;
        }
        $lefttime = 0;
        $questype = $this->basic->getQuestypeList();
        $this->tpl->assign('questype', $questype);
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->assign('lefttime', $lefttime);
        $this->tpl->assign('donumber', is_array($sessionvars['examsessionuseranswer']) ? count($sessionvars['examsessionuseranswer']) : 0);
        $this->tpl->display('exercise_paper');
    }

    private function index()
    {
        $questype = $this->basic->getQuestypeList();
        if ($this->ev->get('setExecriseConfig')) {
            $args = $this->ev->get('args');
            if (!$args['sectionid']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '请选择章节',
                ];
                $this->G->R($message);
            }
            if (!$args['knowsid']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '请选择知识点',
                ];
                $this->G->R($message);
            }
            $sessionvars = $this->exam->getExamSessionBySessionid();
            if (!$args['knowsid']) {
                $args['knowsid'] = '';
                if ($args['sectionid']) {
                    $knowsids = $this->section->getKnowsListByArgs([['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $args['sectionid']], ['AND', 'knowsstatus = 1']]);
                } else {
                    $knowsids = $this->section->getAllKnowsBySubject($this->data['currentsubject']['subjectid']);
                }
                foreach ($knowsids as $key => $p) {
                    $args['knowsid'] .= intval($key).',';
                }
                $args['knowsid'] = trim($args['knowsid'], ' ,');
            }
            arsort($args['number']);
            $snumber = 0;
            foreach ($args['number'] as $key => $v) {
                $snumber += $v;
                if ($snumber > 100) {
                    $message = [
                        'statusCode' => 300,
                        'message'    => '强化练习最多一次只能抽取100道题',
                    ];
                    $this->G->R($message);
                }
            }
            if (!$snumber) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '请填写抽题数量',
                ];
                $this->G->R($message);
            }
            $dt = key($args['number']);
            $questionids = $this->question->selectQuestionsByKnows($args['knowsid'], $args['number'], $dt);
            $questions = [];
            $questionrows = [];
            foreach ($questionids['question'] as $key => $p) {
                $ids = '';
                if (count($p)) {
                    foreach ($p as $t) {
                        $ids .= $t.',';
                    }
                    $ids = trim($ids, ' ,');
                    if (!$ids) {
                        $ids = 0;
                    }
                    $questions[$key] = $this->exam->getQuestionListByIds($ids);
                }
            }
            foreach ($questionids['questionrow'] as $key => $p) {
                $ids = '';
                if (is_array($p)) {
                    if (count($p)) {
                        foreach ($p as $t) {
                            $questionrows[$key][$t] = $this->exam->getQuestionRowsById($t);
                        }
                    }
                } else {
                    $questionrows[$key][$p] = $this->exam->getQuestionRowsByArgs("qrid = '{$p}'");
                }
            }
            $sargs['examsessionquestion'] = ['questionids' => $questionids, 'questions' => $questions, 'questionrows' => $questionrows];
            $sargs['examsessionsetting'] = $args;
            $sargs['examsessionstarttime'] = TIME;
            $sargs['examsessionuseranswer'] = null;
            $sargs['examsession'] = $args['title'];
            $sargs['examsessiontime'] = $args['time'] > 0 ? $args['time'] : 60;
            $sargs['examsessionstatus'] = 0;
            $sargs['examsessiontype'] = 0;
            $sargs['examsessionbasic'] = $this->data['currentbasic']['basicid'];
            $sargs['examsessionkey'] = $args['knowsid'];
            $sargs['examsessionissave'] = 0;
            $sargs['examsessionsign'] = null;
            $sargs['examsessionsign'] = '';
            $sargs['examsessionuserid'] = $this->_user['sessionuserid'];
            if ($sessionvars['examsessionid']) {
                $this->exam->modifyExamSession($sargs);
            } else {
                $this->exam->insertExamSession($sargs);
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '抽题成功，正在转入试题页面',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?exam-app-exercise-paper',
            ];
            $this->G->R($message);
        } else {
            $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $this->data['currentbasic']['basicsubjectid']]]);
            $subject = $this->basic->getSubjectById($this->data['currentbasic']['basicsubjectid']);
            $questiontypes = [];
            foreach ($subject['subjectsetting']['questypes'] as $key => $p) {
                $questiontypes[$key] = $questiontype[$key];
            }
            $this->tpl->assign('basicnow', $this->data['currentbasic']);
            $this->tpl->assign('sections', $sections);
            $this->tpl->assign('questype', $questypes);
            $this->tpl->display('exercise');
        }
    }
}
