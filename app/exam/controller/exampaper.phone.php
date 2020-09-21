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

    private function reload()
    {
        $args = ['examsessionkey' => 0];
        $this->exam->modifyExamSession($args);
        header('location:index.php?exam-phone-exampaper');
    }

    private function sign()
    {
        $sessionvars = $this->exam->getExamSessionBySessionid();
        $questype = $this->basic->getQuestypeList();
        $this->tpl->assign('questype', $questype);
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->display('exampaper_sign');
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
                    'forwardUrl'   => 'index.php?exam-phone-exampaper',
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
                    'forwardUrl'   => "index.php?exam-phone-history-makescore&ehid={$result['ehid']}",
                ];
            } else {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '交卷成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-phone-history-stats&ehid={$result['ehid']}",
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
        if (!$sessionvars) {
            $message = [
                'statusCode'   => 200,
                'callbackType' => 'forward',
                'forwardUrl'   => 'back',
            ];
            $this->G->R($message);
        }
        $lefttime = 0;
        $questype = $this->basic->getQuestypeList();
        $this->tpl->assign('questype', $questype);
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->assign('lefttime', $lefttime);
        $this->tpl->assign('donumber', is_array($sessionvars['examsessionuseranswer']) ? count($sessionvars['examsessionuseranswer']) : 0);
        $this->tpl->display('exampaper_paper');
    }

    private function selectquestions()
    {
        $this->exam->delExamSession();
        $examid = $this->ev->get('examid');
        $r = $this->exam->getExamSettingById($examid);
        if (!$r['examid']) {
            $message = [
                'statusCode' => 300,
                'message'    => '参数错误，尝试退出后重新进入',
            ];
            $this->G->R($message);
        } else {
            if (1 == $r['examtype']) {
                $questionids = $this->question->selectQuestions($examid, $this->data['currentbasic']);
                $questions = [];
                $questionrows = [];
                $str = '';
                foreach ($questionids['question'] as $key => $p) {
                    $ids = '';
                    if (count($p)) {
                        foreach ($p as $t) {
                            $ids .= $t.',';
                        }
                        $ids = trim($ids, ' ,');
                        $str .= $ids."\n";
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
                        $questionrows[$key][$p] = $this->exam->getQuestionRowsById($p);
                    }
                }
                $sargs['examsessionquestion'] = ['questionids' => $questionids, 'questions' => $questions, 'questionrows' => $questionrows];
                $sargs['examsessionsetting'] = $r;
                $sargs['examsessionstarttime'] = TIME;
                $sargs['examsession'] = $r['exam'];
                $sargs['examsessiontime'] = $r['examsetting']['examtime'] > 0 ? $r['examsetting']['examtime'] : 60;
                $sargs['examsessionstatus'] = 0;
                $sargs['examsessiontype'] = 1;
                $sargs['examsessionsign'] = null;
                $sargs['examsessionuseranswer'] = null;
                $sargs['examsessionbasic'] = $this->data['currentbasic']['basicid'];
                $sargs['examsessionkey'] = $examid;
                $sargs['examsessionissave'] = 0;
                $sargs['examsessionsign'] = '';
                $sargs['examsessionuserid'] = $this->_user['sessionuserid'];
                $this->exam->insertExamSession($sargs);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '抽题完毕，转入试卷页面',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?exam-phone-exampaper-paper',
                ];
                $this->G->R($message);
            } elseif (2 == $r['examtype']) {
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
                $args['examsessionuseranswer'] = null;
                $args['examsessionscorelist'] = null;
                $args['examsessionsign'] = null;
                $args['examsessiontime'] = $r['examsetting']['examtime'];
                $args['examsessionstatus'] = 0;
                $args['examsessiontype'] = 1;
                $args['examsessionkey'] = $r['examid'];
                $args['examsessionissave'] = 0;
                $args['examsessionbasic'] = $this->data['currentbasic']['basicid'];
                $args['examsessionuserid'] = $this->_user['sessionuserid'];
                $this->exam->insertExamSession($args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '抽题完毕，转入试卷页面',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?exam-phone-exampaper-paper',
                ];
                $this->G->R($message);
            } else {
                $args['examsessionquestion'] = $r['examquestions'];
                $args['examsessionsetting'] = $r;
                $args['examsessionstarttime'] = TIME;
                $args['examsession'] = $r['exam'];
                $args['examsessionscore'] = 0;
                $args['examsessionuseranswer'] = '';
                $args['examsessionscorelist'] = '';
                $args['examsessionsign'] = '';
                $args['examsessiontime'] = $r['examsetting']['examtime'];
                $args['examsessionstatus'] = 0;
                $args['examsessiontype'] = 1;
                $args['examsessionkey'] = $r['examid'];
                $args['examsessionissave'] = 0;
                $args['examsessionbasic'] = $this->data['currentbasic']['basicid'];
                $args['examsessionuserid'] = $this->_user['sessionuserid'];
                $this->exam->insertExamSession($args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '抽题完毕，转入试卷页面',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?exam-phone-exampaper-paper',
                ];
                $this->G->R($message);
            }
        }
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $ids = trim($this->data['currentbasic']['basicexam']['auto'].','.$this->data['currentbasic']['basicexam']['train'], ', ');
        if (!$ids) {
            $ids = 0;
        }
        $exams = $this->exam->getExamSettingList([['AND', 'find_in_set(examid,:examid)', 'examid', $ids]], $page, 20);
        $this->tpl->assign('exams', $exams);
        $this->tpl->display('exampaper');
    }
}
