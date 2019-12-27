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

class position_content
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

    public function getPosList()
    {
        $data = [false, 'position'];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'posid');
    }

    public function addPos($args)
    {
        $data = ['position', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    public function delPos($id)
    {
        return $this->db->delElement(['table' => 'position', 'query' => [['AND', 'posid = :posid', 'posid', $id]]]);
    }

    public function getPosById($id)
    {
        $data = [false, 'position', [['AND', 'posid = :posid', 'posid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function modifyPos($id, $args)
    {
        $data = ['position', $args, [['AND', 'posid = :posid', 'posid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function getPosContentList($args, $page, $number = 20)
    {
        $data = [
            'select'  => false,
            'table'   => 'poscontent',
            'query'   => $args,
            'orderby' => 'pcsequence DESC, pcid DESC',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getPosNewsList($args, $page, $number = 20)
    {
        $args[] = ['AND', 'pccontentid = contentid'];
        $data = [
            'select'  => false,
            'table'   => ['poscontent', 'content'],
            'query'   => $args,
            'orderby' => 'pcsequence DESC, pcid DESC',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getPosSeminarList($args, $page, $number = 20)
    {
        $args[] = ['AND', 'pccontentid = seminarid'];
        $data = [
            'select'  => false,
            'table'   => ['poscontent', 'seminar'],
            'query'   => $args,
            'orderby' => 'pcsequence DESC, pcid DESC',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getPosContentById($id)
    {
        $data = [false, 'poscontent', [['AND', 'pcid = :pcid', 'pcid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getPosContentByArgs($args)
    {
        $data = [false, 'poscontent', $args, false, 'pcid DESC'];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getPosContentNumber($posid)
    {
        $data = ['count(*) as number', 'poscontent', [['AND', 'pcposid = :pcposid', 'pcposid', $posid]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['number'];
    }

    public function addPosContent($args)
    {
        $data = ['poscontent', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    public function modifyPosContentByContentId($id, $args, $app = null)
    {
        if (!$app) {
            $app = $this->G->app;
        }
        $data = ['poscontent', $args, [['AND', 'pccontentid = :pccontentid', 'pccontentid', $id], ['AND', 'pcposapp = :pcposapp', 'pcposapp', $app]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    public function modifyPosContent($id, $args)
    {
        $data = ['poscontent', $args, [['AND', 'pcid = :pcid', 'pcid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function delPosContent($id)
    {
        return $this->db->delElement(['table' => 'poscontent', 'query' => [['AND', 'pcid = :pcid', 'pcid', $id]]]);
    }
}
