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

    private function index()
    {
        $appid = 'user';
        if ($this->ev->get('appconfig')) {
            $args = $this->ev->get('args');
            $args['appsetting'] = $args['appsetting'];
            $app = $this->apps->getApp($appid);
            if ($app) {
                $this->apps->modifyApp($appid, $args);
            } else {
                $this->apps->addApp($appid, $args);
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功，正在转入目标页面',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            exit(json_encode($message));
        }

        $app = $this->apps->getApp($appid);
        $this->tpl->assign('appid', $appid);
        $this->tpl->assign('app', $app);
        $this->tpl->display('config');
    }
}
