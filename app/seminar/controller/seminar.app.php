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

    private function elem()
    {
        $this->position = $this->G->make('position', 'content');
        $page = $this->ev->get('page');
        $elemid = $this->ev->get('elemid');
        $elem = $this->seminar->getSeminarElemById($elemid);
        $args = [];
        $args[] = ['AND', 'sctelid = :sctelid', 'sctelid', $elemid];
        $contents = $this->seminar->getSeminarContentList($args, $page, 20);
        $topseminars = $this->position->getPosSeminarList([['AND', 'pcposid = 3']], 1, 10);
        $this->tpl->assign('topseminars', $topseminars);
        $this->tpl->assign('elem', $elem);
        $this->tpl->assign('contents', $contents);
        $this->tpl->display('seminar_elem');
    }

    private function index()
    {
        $seminarid = $this->ev->get('seminarid');
        $seminarid = intval($this->ev->get('seminarid'));
        $stpl = $this->seminar->parseSeminar($seminarid);
        if ($stpl) {
            $content = $this->tpl->fetchExeSource($stpl);
            echo $content;
        } else {
            header('location:index.php?seminar');
            exit;
        }
    }
}
