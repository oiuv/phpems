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

class area_exam
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->pdosql = $this->G->make('pdosql');
        $this->sql = $this->G->make('sql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

    //获取地名列表
    //参数：无
    //返回值：地区列表
    public function getAreaList()
    {
        $data = [false, 'area', '1', false, 'areaid ASC'];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'areaid');
    }

    //按页获取地名列表
    //参数：无
    //返回值：地区列表
    public function getAreaListByPage($page, $number = 20)
    {
        $data = [
            'select' => false,
            'table'  => 'area',
            'query'  => 1,
            'index'  => 'areaid',
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    //根据地名查询
    //参数：地名字符串
    //返回值：该地名信息数组
    public function getAreaByName($area)
    {
        $data = [false, 'area', [['AND', 'area = :area', 'area', $area]], false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //根据ID获取地名信息
    //参数：地名ID
    //返回值：该地名信息数组
    public function getAreaById($areaid)
    {
        $data = [false, 'area', [['AND', 'areaid = :areaid', 'areaid', $areaid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //修改地名信息
    //参数：地名ID,要修改的信息
    //返回值：true
    public function modifyArea($areaid, $args)
    {
        $data = ['area', $args, [['AND', 'areaid = :areaid', 'areaid', $areaid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return true;
    }

    //增加地区
    //参数：要添加的地区的信息数组
    //返回值：地名ID
    public function addArea($args)
    {
        $data = [false, 'area', [['AND', 'areaid = :areaid', 'areaid', $args['areacode']]]];
        $sql = $this->pdosql->makeSelect($data);
        if ($this->db->fetch($sql)) {
            return false;
        }
        $data = ['area', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //删除地区
    //参数：地名ID
    //返回值：受影响的记录数
    public function delArea($id)
    {
        $data = ['area', [['AND', 'areaid = :areaid', 'areaid', $id]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }
}
