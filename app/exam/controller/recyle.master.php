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

    private function clearquestions()
    {
        if ($this->ev->get('clearall')) {
            $this->exam->clearDeletedQuestions();
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function clearquestionrows()
    {
        if ($this->ev->get('clearall')) {
            $this->exam->clearDeletedQuestionrows();
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function backknows()
    {
        $knowsid = $this->ev->get('knowsid');
        $page = $this->ev->get('page');
        $nknow = $this->section->getKnowsByArgs([['AND', 'knowsid = :knowsid', 'knowsid', $knowsid]]);
        $know = $this->section->getKnowsByArgs([['AND', 'knowsstatus = 1', ['AND', 'knows = :knows', 'knows', $nknow['knows']], ['AND', 'knowssectionid = :knowssectionid', 'knowssectionid', $nknow['knowssectionid']]]]);
        if ($know) {
            $message = [
                'statusCode' => 300,
                'message'    => '操作失败，所在章节下存在同名且未删除的知识点',
            ];
            $this->G->R($message);
        }
        $this->section->backKnows($knowsid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-recyle-knows&page={$page}",
        ];
        $this->G->R($message);
    }

    private function delknows()
    {
        $knowsid = $this->ev->get('knowsid');
        $page = $this->ev->get('page');
        $this->section->delKnows($knowsid, true);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-recyle-knows&page={$page}",
        ];
        $this->G->R($message);
    }

    private function knows()
    {
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $args = ["knowsstatus = '0'"];
        $knows = $this->section->getKnowsList($page, 10, [['AND', 'knowsstatus = 0']]);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('knows', $knows);
        $this->tpl->display('recyle_knows');
    }

    private function rows()
    {
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $args = [['AND', "questionrows.qrstatus = '0'"], ['AND', 'questionrows.qrid = quest2knows.qkquestionid'], ['AND', 'quest2knows.qktype = 1']];
        $questypes = $this->basic->getQuestypeList();
        $questions = $this->exam->getQuestionrowsList($page, 20, $args);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->assign('questions', $questions);
        $this->tpl->display('recyle_rowsquestions');
    }

    private function finaldelquestion()
    {
        $page = $this->ev->get('page');
        $questionid = $this->ev->get('questionid');
        $this->exam->fanalDelQuestions($questionid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-recyle&page={$page}",
        ];
        $this->G->R($message);
    }

    private function finaldelrowsquestion()
    {
        $page = $this->ev->get('page');
        $questionid = $this->ev->get('questionid');
        $this->exam->finalDelQuestionRows($questionid);
        $this->exam->fanalDelQuestionsByArgs([['AND', 'questionparent = :questionparent', 'questionparent', $questionid]]);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?exam-master-recyle-rows&page={$page}",
        ];
        $this->G->R($message);
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $args = [['AND', 'quest2knows.qkquestionid = questions.questionid'], ['AND', "questions.questionstatus = '0'"], ['AND', 'questions.questionparent = 0'], ['AND', 'quest2knows.qktype = 0']];
        $questypes = $this->basic->getQuestypeList();
        $questions = $this->exam->getQuestionsList($page, 20, $args);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('questypes', $questypes);
        $this->tpl->assign('questions', $questions);
        $this->tpl->display('recyle_questions');
    }
}
