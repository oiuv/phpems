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

    private function delquestion()
    {
        $page = $this->ev->get('page');
        $questionid = $this->ev->get('questionid');
        $question = $this->exam->getQuestionRowsByArgs([['AND', 'qrid = :qrid', 'qrid', $questionid]]);
        if ($question['data']) {
            $message = [
                'statusCode' => 300,
                'message'    => '操作失败，请先删除子试题',
            ];
            $this->G->R($message);
        }
        $this->exam->delQuestionRows($questionid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-rowsquestions&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function batdel()
    {
        $page = $this->ev->get('page');
        $delids = $this->ev->get('delids');
        foreach ($delids as $questionid => $p) {
            $this->exam->delQuestionRows($questionid);
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-rowsquestions&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function delchildquestion()
    {
        $page = $this->ev->get('page');
        $questionid = $this->ev->get('questionid');
        $questionparent = $this->ev->get('questionparent');
        $this->exam->delQuestions($questionid);
        $this->exam->resetRowsQuestionNumber($questionparent);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function backquestion()
    {
        $page = $this->ev->get('page');
        $questionid = $this->ev->get('questionid');
        $questions = $this->exam->backQuestionRows($questionid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-recyle-rows&page={$page}",
        ];
        $this->G->R($message);
    }

    private function modifyquestion()
    {
        if ($this->ev->get('modifyquestion')) {
            $page = $this->ev->get('page');
            $args = $this->ev->get('args');
            $questionid = $this->ev->get('questionid');
            $this->exam->modifyQuestionRows($questionid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-rowsquestions&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $page = $this->ev->get('page');
            $questionid = $this->ev->get('questionid');
            $question = $this->exam->getQuestionRowsByArgs([['AND', 'qrid = :qrid', 'qrid', $questionid]]);
            $subjects = $this->basic->getSubjectList();
            $questypes = $this->basic->getQuestypeList();
            foreach ($question['qrknowsid'] as $key => $p) {
                $knows = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $p['knowsid']]]);
                $question['qrknowsid'][$key]['knows'] = $knows['knows'];
            }
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->assign('page', $page);
            $this->tpl->assign('question', $question);
            $this->tpl->display('questionrows_modify');
        }
    }

    private function modifychildquestion()
    {
        if ($this->ev->get('modifyquestion')) {
            $page = $this->ev->get('page');
            $args = $this->ev->get('args');
            $questionid = $this->ev->get('questionid');
            $targs = $this->ev->get('targs');
            $questype = $this->basic->getQuestypeById($args['questiontype']);
            if ($questype['questsort']) {
                $choice = 0;
            } else {
                $choice = $questype['questchoice'];
            }
            $args['questionanswer'] = $targs['questionanswer'.$choice];
            if (is_array($args['questionanswer'])) {
                $args['questionanswer'] = implode('', $args['questionanswer']);
            }
            $this->exam->modifyQuestions($questionid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-rowsquestions-rowsdetail&questionid={$args['questionparent']}&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $page = $this->ev->get('page');
            $questionparent = $this->ev->get('questionparent');
            $knowsid = $this->ev->get('knowsid');
            $questionid = $this->ev->get('questionid');
            $questypes = $this->basic->getQuestypeList();
            $question = $this->exam->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $questionid]]);
            $subjects = $this->basic->getSubjectList();
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->assign('questionparent', $questionparent);
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('page', $page);
            $this->tpl->assign('knowsid', $knowsid);
            $this->tpl->assign('question', $question);
            $this->tpl->display('questionchildrows_modify');
        }
    }

    private function detail()
    {
        $questionid = $this->ev->get('questionid');
        $question = $this->exam->getQuestionRowsByArgs([['AND', 'qrid = :qrid', 'qrid', $questionid]]);
        $sections = [];
        foreach ($question['qrknowsid'] as $key => $p) {
            $knows = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $p['knowsid']]]);
            $question['qrknowsid'][$key]['knows'] = $knows['knows'];
            $sections[] = $this->section->getSectionByArgs([['AND', 'sectionid = :sectionid', 'sectionid', $knows['knowssectionid']]]);
        }
        $subject = $this->basic->getSubjectById($sections[0]['sectionsubjectid']);
        $this->tpl->assign('subject', $subject);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('question', $question);
        $this->tpl->display('questionrows_detail');
    }

    private function rowsdetail()
    {
        $questionid = $this->ev->get('questionid');
        $question = $this->exam->getQuestionRowsByArgs([['AND', 'qrid = :qrid', 'qrid', $questionid]]);
        $questypes = $this->basic->getQuestypeList();
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->assign('question', $question);
        $this->tpl->assign('questionparent', $questionid);
        $this->tpl->display('questionrows_list');
    }

    private function addchildquestion()
    {
        if ($this->ev->get('insertquestion')) {
            $questionparent = $this->ev->get('questionparent');
            $args = $this->ev->get('args');
            $targs = $this->ev->get('targs');
            if (!$questionparent) {
                $questionparent = $args['questionparent'];
            }
            $questype = $this->basic->getQuestypeById($args['questiontype']);
            $args['questionuserid'] = $this->_user['sessionuserid'];
            if ($questype['questsort']) {
                $choice = 0;
            } else {
                $choice = $questype['questchoice'];
            }
            $args['questionanswer'] = $targs['questionanswer'.$choice];
            if (is_array($args['questionanswer'])) {
                $args['questionanswer'] = implode('', $args['questionanswer']);
            }
            $page = $this->ev->get('page');
            $args['questioncreatetime'] = TIME;
            $args['questionusername'] = $this->_user['sessionusername'];
            $this->exam->addQuestions($args);
            $this->exam->resetRowsQuestionNumber($questionparent);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $questionid = $this->ev->get('questionid');
            $question = $this->exam->getQuestionRowsByArgs([['AND', 'qrid = :qrid', 'qrid', $questionid]]);
            $questypes = $this->basic->getQuestypeList();
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('question', $question);
            $this->tpl->assign('questionparent', $questionid);
            $this->tpl->display('questionrows_addchild');
        }
    }

    private function bataddchildquestion()
    {
        if ($this->ev->get('insertquestion')) {
            $questionparent = $this->ev->get('questionparent');
            $page = $this->ev->get('page');
            $content = $this->ev->get('content');
            $this->exam->insertQuestionBat($content, $questionparent);
            $this->exam->resetRowsQuestionNumber($questionparent);
            $message = [
                'statusCode' => 200,
                'message'    => '操作成功',
                'forwardUrl' => "index.php?exam-master-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $questionid = $this->ev->get('questionid');
            $question = $this->exam->getQuestionRowsByArgs([['AND', 'qrid = :qrid', 'qrid', $questionid]]);
            $questypes = $this->basic->getQuestypeList();
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('question', $question);
            $this->tpl->assign('questionparent', $questionid);
            $this->tpl->display('questionrows_bataddchild');
        }
    }

    private function done()
    {
        $sequence = $this->ev->get('sequence');
        $questionparent = $this->ev->get('questionparent');
        foreach ($sequence as $key => $l) {
            $this->exam->modifyQuestionSequence($key, ['questionsequence' => $l]);
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function bataddquestionrows()
    {
        if ($this->ev->get('insertquestion')) {
            $page = $this->ev->get('page');
            $content = $this->ev->get('content');
            $this->exam->insertQuestionRowsBat($content);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-rowsquestions&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $subjects = $this->basic->getSubjectList();
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('questionrows_batadd');
        }
    }

    private function addquestionrows()
    {
        $questypes = $this->basic->getQuestypeList();
        if ($this->ev->get('insertquestion')) {
            $args = $this->ev->get('args');
            $args['qrtime'] = TIME;
            $args['qruserid'] = $this->_user['sessionuserid'];
            $args['qrusername'] = $this->_user['sessionusername'];
            $this->exam->addQuestionRows($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-rowsquestions&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $subjects = $this->basic->getSubjectList();
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->display('questionrows_add');
        }
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $questypes = $this->basic->getQuestypeList();
        $search = $this->ev->get('search');
        $args = [['AND', 'quest2knows.qkquestionid = questionrows.qrid'], ['AND', 'quest2knows.qktype = 1'], ['AND', "questionrows.qrstatus = '1'"]];
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
            $args[] = ['AND', 'questionrows.qrtime >= :qrtime', 'qrtime', strtotime($search['stime'])];
        }
        if ($search['etime']) {
            $args[] = ['AND', 'questionrows.qrtime <= :qretime', 'qretime', strtotime($search['etime'])];
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
        $questions = $this->exam->getQuestionrowsList($page, 10, $args);
        $subjects = $this->basic->getSubjectList();
        $sections = $this->section->getSectionListByArgs([['AND', 'sectionsubjectid = :sectionsubjectid', 'sectionsubjectid', $search['questionsubjectid']]]);
        $knows = $this->section->getKnowsListByArgs([['AND', 'knowsstatus = 1'], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $search['questionsectionid']]]);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('knows', $knows);
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->assign('questions', $questions);
        $this->tpl->display('questionrows');
    }
}
