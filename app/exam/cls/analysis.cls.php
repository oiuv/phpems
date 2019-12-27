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

class analysis_exam
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->sql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->ev = $this->G->make('ev');
    }

    public function insertAnalysis($args)
    {
        $data = ['answer', $args];
        $sql = $this->sql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    public function getAnalysisList($page, $number, $args)
    {
        $data = [
            'select'  => false,
            'table'   => ['questionanalysis', 'questions'],
            'index'   => false,
            'serial'  => false,
            'query'   => $args,
            'orderby' => 'qaid DESC',
            'groupby' => false,
        ];

        return $this->db->listElements($page, 20, $data);
    }

    public function modifyAnalysis($qaid, $args)
    {
        $data = ['questionanalysis', $args, [['AND', 'qaid = :qaid', 'qaid', $qaid]]];
        $sql = $this->sql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function getAnalysisByArgs($args)
    {
        $data = [false, 'questionanalysis', $args];
        $sql = $this->sql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getAnalysisById($qaid)
    {
        $data = [false, 'questionanalysis', [['AND', 'qaid = :qaid', 'qaid', $qaid]]];
        $sql = $this->sql->makeSelect($data);

        return $this->db->fetch($sql);
    }
}
