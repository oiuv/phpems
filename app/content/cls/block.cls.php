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

class block_content
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
    }

    public function getBlockList($args, $page, $number = 20)
    {
        $data = [
            'select'  => false,
            'table'   => 'block',
            'query'   => $args,
            'orderby' => 'blockid DESC',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function addBlock($args)
    {
        $data = ['block', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    public function delBlock($id)
    {
        return $this->db->delElement(['table' => 'block', 'query' => [['AND', 'blockid = :blockid', 'blockid', $id]]]);
    }

    public function getBlockById($id)
    {
        $data = [false, 'block', [['AND', 'blockid = :blockid', 'blockid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'blockcontent');
    }

    public function modifyBlock($id, $args)
    {
        $data = ['block', $args, [['AND', 'blockid = :blockid', 'blockid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }
}
