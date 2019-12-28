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
        $this->exer = $this->G->make('exercise', 'exam');
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function reporterror()
    {
        if ($this->ev->get('reporterror')) {
            $args = $this->ev->get('args');
            if ($args['fbquestionid'] && $args['fbtype']) {
                $this->feedback = $this->G->make('feedback', 'exam');
                $args['fbuserid'] = $this->_user['sessionuserid'];
                $this->feedback->addFeedBack($args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '提交成功，请等待管理员处理',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'back',
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '缺少参数',
                ];
            }
            $this->G->R($message);
        } else {
            $questionid = $this->ev->get('questionid');
            $this->tpl->assign('questionid', $questionid);
            $this->tpl->display('lesson_feedback');
        }
    }

    private function ajax()
    {
        switch ($this->ev->url(4)) {
            case 'questions':
                $number = $this->ev->get('number');
                $questid = $this->ev->get('questid');
                $knowsid = $this->ev->get('knowsid');
                if (!$knowsid) {
                    $message = [
                        'statusCode'   => 200,
                        'message'      => '操作超时，请重新开始练习',
                        'callbackType' => 'forward',
                        'forwardUrl'   => 'index.php?exam-phone-lesson',
                    ];
                    $this->G->R($message);
                }
                if (!$number) {
                    $exer = $this->exer->getExerciseProcessByUser($this->_user['sessionuserid'], $this->data['currentbasic']['basicid'], $knowsid);
                    if ($exer['exernumber']) {
                        $number = $exer['exernumber'];
                    } else {
                        $number = 1;
                    }
                } else {
                    $args = ['exeruserid' => $this->_user['sessionuserid'], 'exerbasicid' => $this->data['currentbasic']['basicid'], 'exerknowsid' => $knowsid, 'exernumber' => $number, 'exerqutype' => $questid];
                }
                $this->exer->setExercise($args);
                $knows = $this->section->getQuestionsByKnows($knowsid);
                if ($questid) {
                    $allnumber = $knows['knowsnumber'][$questid];
                    $questions = $knows['knowsquestions'][$questid];
                } else {
                    $allnumber = array_sum($knows['knowsnumber']);
                    $questions = [];
                    foreach ($knows['knowsquestions'] as $p) {
                        $questions = array_merge($questions, $p);
                    }
                }
                unset($knows['knowsquestions'],$knows['knowsnumber']);
                if (($number > $allnumber) && $allnumber) {
                    $number = $allnumber;
                }
                $qunumber = count($questions);
                $question = $this->exam->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $questions[intval($number - 1)]]]);
                if ($question['questionparent']) {
                    $parent = $this->exam->getQuestionRowsById($question['questionparent'], false, false);
                    $this->tpl->assign('parent', $parent);
                }
                $questypes = $this->basic->getQuestypeList();
                $this->tpl->assign('question', $question);
                $this->tpl->assign('questype', $questypes[$question['questiontype']]);
                $this->tpl->assign('knows', $knows);
                $this->tpl->assign('allnumber', $allnumber);
                $this->tpl->assign('number', $number);
                $this->tpl->display('lesson_ajaxquestion');
                break;
        }
    }

    private function paper()
    {
        $questid = $this->ev->get('questype');
        $knowsid = $this->ev->get('knowsid');
        if ($questid) {
            $questype = $this->basic->getQuestypeById($questid);
        }
        $knows = $this->section->getKnowsById($knowsid);
        $this->tpl->assign('knows', $knows);
        $this->tpl->assign('questype', $questype);
        $this->tpl->display('lesson_paper');
    }

    private function index()
    {
        $basic = $this->data['currentbasic'];
        $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $basic['basicsubjectid']]]);
        $knows = [];
        foreach ($basic['basicknows'] as $knowsids) {
            foreach ($knowsids as $knowsid) {
                $knows[$knowsid] = $this->section->getQuestionsByKnows($knowsid);
            }
        }
        $record = $this->exer->getExerciseProcessByUser($this->_user['sessionuserid'], $basic['basicid']);
        $this->tpl->assign('record', $record);
        $this->tpl->assign('basic', $basic);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('knows', $knows);
        $this->tpl->display('lesson');
    }
}
