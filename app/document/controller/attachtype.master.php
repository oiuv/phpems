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
        $atid = $this->ev->get('atid');
        $this->attach->delAttachtypeById($atid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?document-master-attachtype&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function batdel()
    {
        $page = $this->ev->get('page');
        $delids = $this->ev->get('delids');
        foreach ($delids as $atid) {
            $this->attach->delAttachtypeById($atid);
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?document-master-attachtype&page={$page}{$u}",
        ];
        $this->G->R($message);
    }

    private function modify()
    {
        $page = $this->ev->get('page');
        $atid = $this->ev->get('atid');
        if ($this->ev->get('modifyattachtype')) {
            $args = $this->ev->get('args');
            $this->attach->modifyAttachtypeById($args, $atid);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?document-master-attachtype&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $attachtype = $this->attach->getAttachtypeById($atid);
            $this->tpl->assign('attachtype', $attachtype);
            $this->tpl->display('types_modify');
        }
    }

    private function add()
    {
        if ($this->ev->get('inserttype')) {
            $args = $this->ev->get('args');
            $id = $this->attach->addAttachtype($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?document-master-attachtype{$u}",
            ];
            $this->G->R($message);
        } else {
            $this->tpl->display('types_add');
        }
    }

    private function index()
    {
        $types = $this->attach->getAttachtypeList();
        $this->tpl->assign('types', $types);
        $this->tpl->display('types');
    }
}
