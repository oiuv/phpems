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
        $askid = $this->ev->get('askid');
        $page = $this->ev->get('page');
        $this->answer->delAsksById($askid);
        $this->G->msg(['url' => 'index.php?exam-master-asks&page='.$page]);
    }

    private function delanswer()
    {
        $answerid = $this->ev->get('answerid');
        $answer = $this->answer->getAnswerById($answerid);
        $page = $this->ev->get('page');
        $this->answer->delAnswerById($answerid);
        $this->G->msg(['url' => 'index.php?exam-master-asks-detail&askid='.$answer['answeraskid'].'&page='.$page]);
    }

    private function done()
    {
        $page = $this->ev->get('page');
        $ids = $this->ev->get('delids');
        foreach ($ids as $key => $id) {
            $this->answer->delAsksById($id);
        }
        $this->G->msg(['url' => 'index.php?exam-master-asks&page='.$page]);
    }

    private function detail()
    {
        $page = $this->ev->get('page');
        $askid = $this->ev->get('askid');
        $ask = $this->answer->getAskById($askid);
        $question = $this->exam->getQuestionByArgs([['AND', 'questionid = :questionid', 'questionid', $ask['askquestionid']]]);
        $answers = $this->answer->getAnswerList($page, 20, [['AND', 'answeraskid = :answeraskid', 'answeraskid', $ask['askid']]]);
        $this->tpl->assign('question', $question);
        $this->tpl->assign('answers', $answers);
        $this->tpl->display('ask_answer');
    }

    private function rely()
    {
        $page = $this->ev->get('page');
        $answerid = $this->ev->get('answerid');
        $args = $this->ev->get('args');
        $args['answertime'] = TIME;
        $args['answerteacher'] = $this->_user['sessionusername'];
        $args['answerteacherid'] = $this->_user['sessionuserid'];
        $id = $this->answer->giveAnswer($answerid, $args);
        $this->G->msg(['url' => 'index.php?exam-master-asks-detail&askid='.$id.'&page='.$page]);
    }

    private function index()
    {
        $sargs = $this->ev->get('args');
        $page = $this->ev->get('page');
        $page = $page > 1 ? $page : 1;
        $args = [['AND', 'asks.askquestionid = questions.questionid']];
        if ($sargs['asksubjectid']) {
            $args[] = ['AND', 'asks.asksubjectid = :asksubjectid', 'asksubjectid', $sargs['asksubjectid']];
        }
        if ($sargs['asklasttime']) {
            $args[] = ['AND', 'asks.asklasttime >= :asklasttime', 'asklasttime', $sargs['asklasttime']];
        }
        if ($sargs['askuserid']) {
            $args[] = ['AND', 'asks.asklastteacherid = :asklastteacherid', 'asklastteacherid', $sargs['askuserid']];
        }
        if ($sargs['askstatus']) {
            if (-1 == $sargs['askstatus']) {
                $args[] = ['AND', "asks.askstatus = '0'"];
            } else {
                $args[] = ['AND', "asks.askstatus = '1'"];
            }
        }
        $subjects = $this->basic->getSubjectList();
        $asks = $this->answer->getAskList($page, 20, $args);
        $this->tpl->assign('args', $sargs);
        $this->tpl->assign('asks', $asks);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->display('asks');
    }
}
