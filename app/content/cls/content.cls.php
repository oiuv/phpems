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

class content_content
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->categories = null;
        $this->tidycategories = null;
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->module = $this->G->make('module');
        $this->user = $this->G->make('user', 'user');
    }

    public function setViewNumber($contentid)
    {
        $data = [false, 'content', [['AND', 'contentid = :contentid', 'contentid', $contentid]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        $number = $r['contentview'] + 1;
        $data = [
            'table' => 'content',
            'value' => ['contentview' => $number],
            'query' => [['AND', 'contentid = :contentid', 'contentid', $contentid]],
        ];
        $this->db->updateElement($data);
    }

    public function isAllowPub($cat, $user)
    {
        if (!$cat) {
            return false;
        }
        $userid = $user['sessionuserid'];
        $users = ','.$cat['catmanager']['pubusers'].',';
        $groupid = $user['sessiongroupid'];
        $groups = ','.$cat['catmanager']['pubgroups'].',';
        if (false === strpos($users, ','.$userid.',')) {
            return false;
        }
        if (false === strpos($groups, ','.$groupid.',')) {
            return false;
        }

        return true;
    }

    public function getContentList($args, $page, $number = 20, $order = 'contentsequence DESC,contentinputtime DESC,contentid DESC')
    {
        $data = [
            'select'  => false,
            'table'   => 'content',
            'query'   => $args,
            'orderby' => $order,
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    public function delContent($id)
    {
        return $this->db->delElement(['table' => 'content', 'query' => [['AND', 'contentid = :contentid', 'contentid', $id]]]);
    }

    public function modifyContent($id, $args)
    {
        if (isset($args['contentmoduleid'])) {
            unset($args['contentmoduleid']);
        }
        $data = [
            'table' => 'content',
            'value' => $args,
            'query' => [['AND', 'contentid = :contentid', 'contentid', $id]],
        ];

        return $this->db->updateElement($data);
    }

    public function addContent($args)
    {
        return $this->db->insertElement(['table' => 'content', 'query' => $args]);
    }

    private function _getBasicContentById($id)
    {
        $data = [false, 'content', [['AND', 'contentid = :contentid', 'contentid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    private function _modifyBasicContentById($id, $args)
    {
        $data = ['content', $args, [['AND', 'contentid = :contentid', 'contentid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function modifyBasciContent($id, $args)
    {
        $this->_modifyBasicContentById($id, $args);
    }

    public function getBasicContentById($id)
    {
        return $this->_getBasicContentById($id);
    }

    public function getContentById($id)
    {
        $data = [false, 'content', [['AND', 'contentid = :contentid', 'contentid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getNearContentById($id, $catid)
    {
        $r = [];
        $data = [false, 'content', [['AND', 'contentid < :contentid', 'contentid', $id], ['AND', 'contentcatid = :catid', 'catid', $catid]], false, 'contentid DESC', 5];
        $sql = $this->pdosql->makeSelect($data);
        $r['pre'] = $this->db->fetchAll($sql);
        $data = [false, 'content', [['AND', 'contentid > :contentid', 'contentid', $id], ['AND', 'contentcatid = :catid', 'catid', $catid]], false, 'contentid ASC', 5];
        $sql = $this->pdosql->makeSelect($data);
        $r['next'] = $this->db->fetchAll($sql);

        return $r;
    }
}
