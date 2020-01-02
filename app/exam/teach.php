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

class app
{
    public $G;

    //初始化信息
    public function __construct(&$G)
    {
        $this->G = $G;
        $this->ev = $this->G->make('ev');
        $this->session = $this->G->make('session');
        $this->files = $this->G->make('files');
        $this->user = $this->G->make('user', 'user');
        $_user = $this->session->getSessionUser();

        $this->_user = $this->user->getUserById($_user['sessionuserid']);
        $this->_user['teacher_subjects'] = unserialize($this->_user['teacher_subjects']);
        $group = $this->user->getGroupById($_user['sessiongroupid']);
        if (!$this->_user['teacher_subjects']) {
            if ($this->ev->get('userhash')) {
                exit(json_encode([
                    'statusCode'   => 300,
                    'message'      => '您不具备管理权限',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?exam-app',
                ]));
            }

            header('location:index.php?exam-app');
            exit;
        }
        //生产一个对象
        $this->teachsubjects = implode(',', $this->_user['teacher_subjects']);
        $this->tpl = $this->G->make('tpl');
        $this->db = $this->G->make('pepdo');

        $this->pg = $this->G->make('pg');
        $this->html = $this->G->make('html');
        $this->apps = $this->G->make('apps', 'core');
        $this->basic = $this->G->make('basic', 'exam');
        $this->area = $this->G->make('area', 'exam');

        $this->section = $this->G->make('section', 'exam');
        $this->favor = $this->G->make('favor', 'exam');
        $this->exam = $this->G->make('exam', 'exam');

        $this->tpl->assign('ols', [1 => '一', '二', '三', '四', '五', '六', '七', '八', '九', '十', '十一', '十二', '十三', '十四', '十五', '十六', '十七', '十八', '十九', '二十']);
        $this->tpl->assign('action', $this->ev->url(2) ? $this->ev->url(2) : 'exams');
        $this->tpl->assign('_user', $this->_user);
        $this->tpl->assign('userhash', $this->ev->get('userhash'));
        $apps = $this->apps->getAppList();
        $this->tpl->assign('apps', $apps);
    }
}
