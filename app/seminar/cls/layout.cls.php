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

class layout_seminar
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
    }

    public function getSeminarTplsList($args, $page, $number = 10, $orderby = 'stplid desc')
    {
        $data = [
            'select'  => false,
            'table'   => 'seminar_tpls',
            'query'   => $args,
            'orderby' => $orderby,
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getSeminarTplsByArgs($args, $orderby = 'stplid desc')
    {
        $data = [false, 'seminar_tpls', $args, false, $orderby, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    public function addSeminarTpl($args)
    {
        return $this->db->insertElement(['table' => 'seminar_tpls', 'query' => $args]);
    }

    public function delSeminarTpl($stplid)
    {
        $args = [
            ['AND', 'stplid = :stplid', 'stplid', $stplid],
        ];

        return $this->db->delElement(['table' => 'seminar_tpls', 'query' => $args]);
    }

    public function modifySeminarTpl($stplid, $args)
    {
        $data = [
            'table' => 'seminar_tpls',
            'value' => $args,
            'query' => [['AND', 'stplid = :stplid', 'stplid', $stplid]],
        ];

        return $this->db->updateElement($data);
    }

    public function getSeminarTplById($stplid)
    {
        $args = [
            ['AND', 'stplid = :stplid', 'stplid', $stplid],
        ];
        $data = [false, 'seminar_tpls', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }
}
