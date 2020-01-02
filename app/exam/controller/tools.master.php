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

    private function clearouttimeexamsession()
    {
        $search = $this->ev->get('search');
        if ($search['argsmodel']) {
            if ($search['stime']) {
                $time = strtotime($search['stime']);
            }
            $this->exam->clearOutTimeExamSession($time);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '请先选择查询条件',
            ];
        }
        $this->G->R($message);
    }

    private function clearouttimesession()
    {
        $search = $this->ev->get('search');
        if ($search['argsmodel']) {
            if ($search['stime']) {
                $time = strtotime($search['stime']);
            }
            $this->session->clearOutTimeUser($time);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '请先选择查询条件',
            ];
        }
        $this->G->R($message);
    }

    private function clearsession()
    {
        $this->tpl->display('tools_session');
    }

    private function clearquestionrows()
    {
        $search = $this->ev->get('search');
        if ($search['argsmodel']) {
            $args = [['AND', 'quest2knows.qkquestionid = questionrows.qrid']];
            if ($search['questionid']) {
                $args[] = ['AND', 'questionrows.qrid = :qrid', 'qrid', $search['questionid']];
            }
            if ($search['questiontype']) {
                $args[] = ['AND', 'questionrows.qrtype = :qrtype', 'qrtype', $search['questiontype']];
            }
            if ($search['keyword']) {
                $args[] = ['AND', 'questionrows.qrquestion LIKE :qrquestion', 'qrquestion', '%'.$search['keyword'].'%'];
            }
            if ($search['stime']) {
                $args[] = ['AND', 'questionrows.qrtime >= :stime', 'stime', strtotime($search['stime'])];
            }
            if ($search['etime']) {
                $args[] = ['AND', 'questionrows.qrtime <= :etime', 'etime', strtotime($search['etime'])];
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
                }
            }
            $questions = $this->exam->getQuestionRowsByArgs($args, 'qrid');
            foreach ($questions as $n) {
                $this->exam->finalDelQuestionRows($n['qrid']);
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            $this->G->R($message);
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '请先选择查询条件',
            ];
            $this->G->R($message);
        }
    }

    private function clearhistory()
    {
        $search = $this->ev->get('search');
        if ($search['argsmodel']) {
            if ($search['stime'] || $search['etime']) {
                $args = [];
                if ($search['stime']) {
                    $args[] = ['AND', 'ehstarttime >= :ehstarttime', 'ehstarttime', strtotime($search['stime'])];
                }
                if ($search['etime']) {
                    $args[] = ['AND', 'ehstarttime <= :ehendtime', 'ehendtime', strtotime($search['etime'])];
                }
                $this->favor->clearExamHistory($args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'reload',
                ];
                $this->G->R($message);
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '请先选择起止时间',
                ];
                $this->G->R($message);
            }
        } else {
            $this->tpl->display('tools_history');
        }
    }

    private function clearquestions()
    {
        $search = $this->ev->get('search');
        if ($search['argsmodel']) {
            $args = [['AND', 'quest2knows.qkquestionid = questions.questionid'], ['AND', 'questions.questionparent = 0'], ['AND', 'quest2knows.qktype = 0']];
            if ($search['knowsids']) {
                $args[] = ['AND', 'find_in_set(questions.questionknowsid,:questionknowsid)', 'questionknowsid', $search['knowsids']];
            }
            if ($search['stime']) {
                $args[] = ['AND', 'questions.questioncreatetime >= :stime', 'stime', strtotime($search['stime'])];
            }
            if ($search['etime']) {
                $args[] = ['AND', 'questions.questioncreatetime <= :etime', 'etime', strtotime($search['etime'])];
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
                    $args[] = ['AND', 'find_in_set(quest2knows.qkknowsid,:qkknowsid', 'qkknowsid', $tmpknows];
                }
            }
            $questions = $this->exam->getQuestionListByArgs($args, 'questionid');
            foreach ($questions as $n) {
                $this->exam->fanalDelQuestions($n['questionid']);
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            $this->G->R($message);
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '请先选择查询条件',
            ];
            $this->G->R($message);
        }
    }

    private function index()
    {
        $search = $this->ev->get('search');
        $questypes = $this->basic->getQuestypeList();
        $subjects = $this->basic->getSubjectList();
        $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $search['questionsubjectid']]]);
        $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('knows', $knows);
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->display('tools');
    }
}
