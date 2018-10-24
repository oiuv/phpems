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
        $this->progress = $this->G->make('progress', 'user');
        $this->basic = $this->G->make('basic', 'exam');
        $this->course = $this->G->make('course', 'course');
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $args = [['AND', 'prsuserid = :prsuserid', 'prsuserid', $this->_user['sessionuserid']]];
        $progresses = $this->progress->getUserProgressesListByArgs($args, $page);
        $courses = [];
        $basics = [];
        foreach ($progresses['data'] as $p) {
            if (!$courses[$p['prscourseid']]) {
                $courses[$p['prscourseid']] = $this->course->getCourseById($p['prscourseid']);
            }
            if (!$basics[$p['prsexamid']]) {
                $basics[$p['prsexamid']] = $this->basic->getBasicById($p['prsexamid']);
            }
        }
        $this->tpl->assign('status', ['未完成', '已完成']);
        $this->tpl->assign('basics', $basics);
        $this->tpl->assign('courses', $courses);
        $this->tpl->assign('progresses', $progresses);
        $this->tpl->display('progress');
    }
}
