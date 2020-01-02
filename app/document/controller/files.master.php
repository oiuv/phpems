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

    private function del()
    {
        $page = $this->ev->get('page');
        $attid = $this->ev->get('attid');
        $this->attach->delAttach($attid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function batdel()
    {
        $page = $this->ev->get('page');
        $delids = $this->ev->get('delids');
        foreach ($delids as $attid => $p) {
            $this->attach->delAttach($attid);
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function modifyquestion()
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
            if ($args['questionparent']) {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-questions&page={$page}{$u}",
                ];
            } else {
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?exam-master-questions&page={$page}{$u}",
                ];
            }
            $this->G->R($message);
        } else {
            $page = $this->ev->get('page');
            $questionparent = $this->ev->get('questionparent');
            $knowsid = $this->ev->get('knowsid');
            $questionid = $this->ev->get('questionid');
            $questypes = $this->basic->getQuestypeList();
            $question = $this->exam->getQuestionByArgs("questionid = '{$questionid}'");
            $subjects = $this->basic->getSubjectList();
            foreach ($question['questionknowsid'] as $key => $p) {
                $knows = $this->section->getKnowsByArgs("knowsid = '{$p['knowsid']}'");
                $question['questionknowsid'][$key]['knows'] = $knows['knows'];
            }
            $this->tpl->assign('subjects', $subjects);
            $this->tpl->assign('questionparent', $questionparent);
            $this->tpl->assign('questypes', $questypes);
            $this->tpl->assign('page', $page);
            $this->tpl->assign('knowsid', $knowsid);
            $this->tpl->assign('question', $question);
            if ($questionparent) {
                $this->tpl->display('questionchildrows_modify');
            } else {
                $this->tpl->display('questions_modify');
            }
        }
    }

    private function detail()
    {
        $questionid = $this->ev->get('questionid');
        $questionparent = $this->ev->get('questionparent');
        if ($questionparent) {
            $questions = $this->exam->getQuestionByArgs("questionparent = '{$questionparent}'");
        } else {
            $question = $this->exam->getQuestionByArgs("questionid = '{$questionid}'");
            $sections = [];
            foreach ($question['questionknowsid'] as $key => $p) {
                $knows = $this->section->getKnowsByArgs("knowsid = '{$p['knowsid']}'");
                $question['questionknowsid'][$key]['knows'] = $knows['knows'];
                $sections[] = $this->section->getSectionByArgs("sectionid = '{$knows['knowssectionid']}'");
            }
            $subject = $this->basic->getSubjectById($sections[0]['sectionsubjectid']);
        }
        $this->tpl->assign('subject', $subject);
        $this->tpl->assign('sections', $sections);
        $this->tpl->assign('question', $question);
        $this->tpl->assign('questions', $questions);
        $this->tpl->display('question_detail');
    }

    private function index()
    {
        $search = $this->ev->get('search');
        $u = '';
        if ($search) {
            $this->tpl->assign('search', $search);
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        $this->tpl->assign('u', $u);
        $page = $this->ev->get('page');
        $this->tpl->assign('page', $page);
        $page = $page > 0 ? $page : 1;
        $types = $this->attach->getAttachtypeList();
        $args = [];
        if ($search['attid']) {
            $args[] = ['AND', 'attid = :attid', 'attid', $search['attid']];
        }
        if ($search['stime']) {
            $args[] = ['AND', 'attinputtime >= :attinputtime', 'attinputtime', strtotime($search['stime'])];
        }
        if ($search['etime']) {
            $args[] = ['AND', 'attinputtime <= :attinputtime', 'attinputtime', strtotime($search['etime'])];
        }
        if ($search['atttype']) {
            $exts = implode(',', explode(',', $types[$search['atttype']]['attachexts']));
            if ($exts) {
                $args[] = ['AND', 'find_in_set(attext,:attext)', 'attext', $exts];
            }
        }
        if ($search['username']) {
            $user = $this->user->getUserByUserName($search['username']);
            if ($user) {
                $args[] = ['AND', 'attuserid = :attuserid', 'attuserid', $user['userid']];
            }
        }
        $attach = $this->attach->getAttachList($args, $page);
        $this->tpl->assign('attachtypes', $types);
        $this->tpl->assign('attach', $attach);
        $this->tpl->display('attachs');
    }
}
