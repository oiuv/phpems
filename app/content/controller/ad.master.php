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

    private function modify()
    {
        if ($this->ev->get('modifyad')) {
            $args = $this->ev->get('args');
            $args['adstyle'] = $args['adstyle'];
            $adid = $this->ev->get('adid');
            $this->ad->modifyAd($adid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'target'       => '',
                'rel'          => '',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?content-master-ad&page={$page}",
            ];
            exit(json_encode($message));
        }

        $adid = $this->ev->get('adid');
        $ad = $this->ad->getAdById($adid);
        $this->tpl->assign('ad', $ad);
        $this->tpl->display('ad_modify');
    }

    public function index()
    {
        $page = 1;
        $ads = $this->ad->getAdList(1, $page);
        $this->tpl->assign('ads', $ads);
        $this->tpl->display('ad');
    }
}
