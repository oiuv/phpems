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

class progress_user
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->ev = $this->G->make('ev');
    }

    public function addProgress($args)
    {
        $data = ['progress', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    public function modifyProgress($prsid, $args)
    {
        $data = ['progress', $args, [['AND', 'prsid = :prsid', 'prsid', $prsid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function modifyProgressByArgs($sargs, $args)
    {
        $data = ['progress', $args, $sargs];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function delProgress($prsid)
    {
        $data = ['progress', [['AND', 'prsid = :prsid', 'prsid', $prsid]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
    }

    public function getProgressById($prsid)
    {
        $data = [false, 'progress', [['AND', 'prsid = :prsid', 'prsid', $prsid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getProgressByArgs($args)
    {
        $data = [false, 'progress', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getProgressesByArgs($args)
    {
        $data = [false, 'progress', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    public function getUserProgressesListByArgs($args, $page, $number = 10)
    {
        $args[] = ['AND', 'prsuserid = userid'];
        $args = [
            'table' => ['user', 'progress'],
            'query' => $args,
            'index' => 'prsid',
        ];

        return $this->db->listElements($page, $number, $args);
    }
}
