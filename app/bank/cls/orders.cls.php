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

class orders_bank
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->ev = $this->G->make('ev');
        $this->files = $this->G->make('files');
    }

    public function getOrderList($args, $page, $number = 20, $order = 'ordercreatetime DESC')
    {
        $data = [
            'select'  => false,
            'table'   => 'orders',
            'query'   => $args,
            'orderby' => $order,
            'serial'  => ['orderitems', 'orderuserinfo'],
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    public function delOrder($id)
    {
        return $this->db->delElement(['table' => 'orders', 'query' => [['AND', 'ordersn = :ordersn', 'ordersn', $id]]]);
    }

    public function modifyOrder($id, $args)
    {
        $data = [
            'table' => 'orders',
            'value' => $args,
            'query' => [['AND', 'ordersn = :ordersn', 'ordersn', $id]],
        ];

        return $this->db->updateElement($data);
    }

    public function addOrder($args)
    {
        return $this->db->insertElement(['table' => 'orders', 'query' => $args]);
    }

    public function getOrderById($id, $userid = null)
    {
        if ($userid) {
            $data = [false, 'orders', [['AND', 'ordersn = :ordersn', 'ordersn', $id], ['AND', 'orderuserid = :orderuserid', 'orderuserid', $userid]]];
        } else {
            $data = [false, 'orders', [['AND', 'ordersn = :ordersn', 'ordersn', $id]]];
        }
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['orderitems', 'orderpost', 'orderuserinfo']);
    }

    public function modifyOrderById($id, $args)
    {
        $data = ['orders', $args, [['AND', 'ordersn = :ordersn', 'ordersn', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function addSaledItem($args)
    {
        return $this->db->insertElement(['table' => 'saleditems', 'query' => $args]);
    }
}
