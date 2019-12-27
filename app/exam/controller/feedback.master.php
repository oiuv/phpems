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
        $this->feedback = $this->G->make('feedback', 'exam');
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function del()
    {
        $fbid = $this->ev->get('fbid');
        $this->feedback->delFeedBack($fbid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function donefeedback()
    {
        $fbid = $this->ev->get('fbid');
        $status = $this->ev->get('status');
        $this->feedback->modifyFeedBackById($fbid, ['fbstatus' => $status, 'fbdoneuserid' => $this->_user['sessionuserid'], 'fbdonetime' => TIME]);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $page = $page > 0 ? $page : 1;
        $feedback = $this->feedback->getFeedBackList(1, $page);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('feedback', $feedback);
        $this->tpl->assign('status', ['待处理', '已处理']);
        $this->tpl->display('feedback');
    }
}
