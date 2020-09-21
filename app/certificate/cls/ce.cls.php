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

class ce_certificate
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

    //获取地名列表
    //参数：无
    //返回值：地区列表
    public function getCeList($args, $page, $number = 20)
    {
        $data = [
            'select' => false,
            'table'  => 'certificate',
            'query'  => $args,
            'index'  => 'ceid',
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    //按页获取地名列表
    //参数：无
    //返回值：地区列表
    public function getCeQueueList($args, $page, $number = 20)
    {
        $args[] = ['AND', 'ceid = ceqceid'];
        $data = [
            'select'  => false,
            'table'   => ['cequeue', 'certificate'],
            'query'   => $args,
            'orderby' => 'ceqid desc',
            'index'   => 'ceqid',
            'serial'  => 'ceqinfo',
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    //根据ID获取地名信息
    //参数：地名ID
    //返回值：该地名信息数组
    public function getCeById($ceid)
    {
        $data = [false, 'certificate', [['AND', 'ceid = :ceid', 'ceid', $ceid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //修改地名信息
    //参数：地名ID,要修改的信息
    //返回值：true
    public function modifyCe($ceid, $args)
    {
        $data = ['certificate', $args, [['AND', 'ceid = :ceid', 'ceid', $ceid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return true;
    }

    public function modifyCeQueue($ceqid, $args)
    {
        $data = ['cequeue', $args, [['AND', 'ceqid = :ceqid', 'ceqid', $ceqid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return true;
    }

    //增加地区
    //参数：要添加的地区的信息数组
    //返回值：地名ID
    public function addCe($args)
    {
        $data = ['certificate', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //删除地区
    //参数：地名ID
    //返回值：受影响的记录数
    public function delCe($ceid)
    {
        $data = ['certificate', [['AND', 'ceid = :ceid', 'ceid', $ceid]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    public function getCeQueueById($ceqid)
    {
        $data = [false, 'cequeue', [['AND', 'ceqid = :ceqid', 'ceqid', $ceqid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'ceqinfo');
    }

    public function getCeQueuesByArgs($args)
    {
        $data = [false, 'cequeue', $args, false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, null, 'ceqinfo');
    }

    public function getCeQueueByArgs($args)
    {
        $args[] = ['AND', 'ceid = ceqceid'];
        $data = [false, ['cequeue', 'certificate'], $args, false, false, 1];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'ceqinfo');
    }

    public function addCeQueue($args)
    {
        $data = ['cequeue', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //删除地区
    //参数：地名ID
    //返回值：受影响的记录数
    public function delCeQueue($ceqid)
    {
        $data = ['cequeue', [['AND', 'ceqid = :ceqid', 'ceqid', $ceqid]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }
}
