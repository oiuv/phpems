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

class consume_bank
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
        $this->files = $this->G->make('files');
    }

    public function getConsumeList($args, $page, $number = 10)
    {
        $args[] = ['AND', 'conluserid = userid'];
        $data = [
            'select'  => false,
            'table'   => ['consumelog', 'user'],
            'query'   => $args,
            'orderby' => 'conltime DESC',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getConsumeStats($args)
    {
        $args[] = ['AND', 'conluserid = userid'];
        $data = ['sum(conlcost) as consume', ['consumelog', 'user'], $args];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['consume'];
    }

    public function getConsumesByArgs($args, $fields)
    {
        $args[] = ['AND', 'conluserid = userid'];
    }

    public function addConsumeLog($args)
    {
        return $this->db->insertElement(['table' => 'consumelog', 'query' => $args]);
    }

    public function statsConsume($args, $fields = false)
    {
        $args[] = ['AND', 'conluserid = userid'];
        $data = [$fields, ['consumelog', 'user'], $args, false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }
}
