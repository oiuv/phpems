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

class exercise_exam
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

    //根据参数查询
    public function getExerciseProcessByUser($userid, $basicid)
    {
        $data = [false, 'exercise', [['AND', 'exeruserid = :exeruserid', 'exeruserid', $userid], ['AND', 'exerbasicid = :exerbasicid', 'exerbasicid', $basicid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function setExercise($args)
    {
        $userid = $args['exeruserid'];
        $basicid = $args['exerbasicid'];
        $r = $this->getExerciseProcessByUser($userid, $basicid);
        if ($r) {
            $data = ['exercise', $args, [['AND', 'exerid = :exerid', 'exerid', $r['exerid']]]];
            $sql = $this->pdosql->makeUpdate($data);
            $this->db->exec($sql);
        } else {
            $data = ['exercise', $args];
            $sql = $this->pdosql->makeInsert($data);
            $this->db->exec($sql);
        }

        return true;
    }
}
