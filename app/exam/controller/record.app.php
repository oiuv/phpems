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

    private function wrongs()
    {
        $ehid = $this->ev->get('ehid');
        $eh = $this->favor->getExamHistoryById($ehid);
        $questype = $this->basic->getQuestypeList();
        $sessionvars = ['examsession' => $eh['ehexam'], 'examsessionscorelist' => $eh['ehscorelist'], 'examsessionsetting' => $eh['ehsetting'], 'examsessionquestion' => $eh['ehquestion'], 'examsessionuseranswer' => $eh['ehuseranswer']];
        $this->tpl->assign('sessionvars', $sessionvars);
        $this->tpl->assign('questype', $questype);
        if (2 == $eh['ehtype']) {
            $this->tpl->display('history_examwrongs');
        } elseif (1 == $eh['ehtype']) {
            $this->tpl->display('history_exampaperwrongs');
        } else {
            $this->tpl->display('history_exercisewrongs');
        }
    }

    private function ajax()
    {
        switch ($this->ev->url(4)) {
            //删除一个错题记录
            case 'delrecord':
            $recordid = $this->ev->get('questionid');
            $this->favor->delRecord($recordid);
            exit('1');
            break;

            default:
            break;
        }
    }

    private function index()
    {
        header('location:index.php?exam-app-history');
    }
}
