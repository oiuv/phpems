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

class feedback_exam
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

    //获取试题反馈列表
    //参数：
    //返回值：地区列表
    public function getFeedBackList($args, $page, $number = 20)
    {
        $data = [
            'select'  => false,
            'table'   => 'feedback',
            'query'   => $args,
            'orderby' => 'fbid desc',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function addFeedBack($args)
    {
        $args['fbtime'] = TIME;
        $data = ['feedback', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //根据地名查询
    //参数：地名字符串
    //返回值：该地名信息数组
    public function getFeedBackById($id)
    {
        $data = [false, 'feedback', [['AND', 'fbid = :fbid', 'fbid', $id]], false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //根据ID获取地名信息
    //参数：地名ID
    //返回值：该地名信息数组
    public function modifyFeedBackById($id, $args)
    {
        $data = ['feedback', $args, [['AND', 'fbid = :fbid', 'fbid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    //修改地名信息
    //参数：地名ID,要修改的信息
    //返回值：true
    public function delFeedBack($id)
    {
        $data = ['feedback', [['AND', 'fbid = :fbid', 'fbid', $id]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
    }
}
