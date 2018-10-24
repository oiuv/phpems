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

class log_course
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
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

    public function getPassedLogsNumberByCsid($csid, $userid)
    {
        $data = ['count(*) as number', ['log', 'course'], [['AND', 'loguserid = :loguserid', 'loguserid', $userid], ['AND', 'logstatus = 1'], ['AND', 'courseid = logcourseid'], ['AND', 'coursecsid = :coursecsid', 'coursecsid', $csid]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['number'];
    }

    public function getLogsByCsid($csid, $userid)
    {
        $data = ['logid,loguserid,logcourseid,logstatus,logtime,logendtime,logprogress,coursetitle', ['log', 'course'], [['AND', 'loguserid = :loguserid', 'loguserid', $userid], ['AND', 'courseid = logcourseid'], ['AND', 'coursecsid = :coursecsid', 'coursecsid', $csid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'logcourseid');
    }

    public function getLogByArgs($args)
    {
        $data = [false, 'log', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function addLog($args)
    {
        $args['logtime'] = TIME;

        return $this->db->insertElement(['table' => 'log', 'query' => $args]);
    }

    public function modifyLog($id, $args)
    {
        $data = ['log', $args, [['and', 'logid = :logid', 'logid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }
}
