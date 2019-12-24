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

class doc_docs
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

    public function getDocNumber($args)
    {
        $data = ['count(*) as number', 'docs', $args];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['number'];
    }

    public function getDocList($args, $page, $number = 20, $order = 'docsequence desc,docid DESC')
    {
        $data = [
            'select'  => false,
            'table'   => 'docs',
            'query'   => $args,
            'orderby' => $order,
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    public function delDoc($id)
    {
        $this->db->delElement(['table' => 'docs', 'query' => [['AND', 'docid = :docid', 'docid', $id]]]);
        $this->db->delElement(['table' => 'dochistory', 'query' => [['AND', 'dhdocid = :dhdocid', 'dhdocid', $id]]]);

        return true;
    }

    public function modifyDoc($id, $args)
    {
        $data = [
            'table' => 'docs',
            'value' => $args,
            'query' => [['AND', 'docid = :docid', 'docid', $id]],
        ];

        return $this->db->updateElement($data);
    }

    public function addDoc($args)
    {
        return $this->db->insertElement(['table' => 'docs', 'query' => $args]);
    }

    public function getDocById($id, $withcontent = true)
    {
        $data = [false, 'docs', [['AND', 'docid = :docid', 'docid', $id]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        if ($r['doccontentid'] && $withcontent) {
            $data = [false, 'dochistory', [['AND', 'dhid = :dhid', 'dhid', $r['doccontentid']]]];
            $sql = $this->pdosql->makeSelect($data);
            $rs = $this->db->fetch($sql);
            $r['content'] = $rs;
        }

        return $r;
    }

    public function getDocHistroyById($dhid)
    {
        $data = [false, 'dochistory', [['AND', 'dhid = :dhid', 'dhid', $dhid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getDocHistoryByArgs($args)
    {
        $data = [false, 'dochistory', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getDocHistoryListByDocid($id, $page, $number = 20, $order = 'dhid DESC')
    {
        $data = [
            'select'  => false,
            'table'   => 'dochistory',
            'query'   => [['AND', 'dhdocid = :dhdocid', 'dhdocid', $id]],
            'orderby' => $order,
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    public function getDocHistoryListByArgs($args, $page, $number = 20, $order = 'dhid DESC')
    {
        $data = [
            'select'  => false,
            'table'   => 'dochistory',
            'query'   => $args,
            'orderby' => $order,
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    public function delDocHistory($id)
    {
        $this->db->delElement(['table' => 'dochistory', 'query' => [['AND', 'dhid = :dhid', 'dhid', $id], ['AND', 'dhstatus = 2']]]);

        return true;
    }

    public function modifyDocHistory($id, $args)
    {
        $data = [
            'table' => 'dochistory',
            'value' => $args,
            'query' => [['AND', 'dhid = :dhid', 'dhid', $id]],
        ];

        return $this->db->updateElement($data);
    }

    public function addDocHistory($args)
    {
        return $this->db->insertElement(['table' => 'dochistory', 'query' => $args]);
    }
}
