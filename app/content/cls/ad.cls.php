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

class ad
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->positions = null;
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

    public function getAdById($id)
    {
        $data = [false, 'ad', [['AND', 'adid = :adid', 'adid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'adstyle');
    }

    public function modifyAd($id, $args)
    {
        $data = ['ad', $args, [['AND', 'adid = :adid', 'adid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    public function getAdList($args, $page, $number = 20)
    {
        $data = [
            'select'  => false,
            'table'   => 'ad',
            'query'   => $args,
            'orderby' => 'adid DESC',
        ];

        return $this->db->listElements($page, $number, $data);
    }
}
