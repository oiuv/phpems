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

class coupon_bank
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

    public function getCouponList($args, $page, $number = 10)
    {
        $data = [
            'select'  => false,
            'table'   => 'coupon',
            'query'   => $args,
            'orderby' => 'couponaddtime DESC',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function clearOutTimeCoupon()
    {
        return $this->db->delElement(['table' => 'coupon', 'query' => [['AND', 'couponendtime <= :couponendtime', 'couponendtime', TIME]]]);
    }

    public function delCoupon($id)
    {
        return $this->db->delElement(['table' => 'coupon', 'query' => [['AND', 'couponsn = :couponsn', 'couponsn', $id]]]);
    }

    public function addCoupon($args)
    {
        return $this->db->insertElement(['table' => 'coupon', 'query' => $args]);
    }

    public function getCouponById($id)
    {
        $data = [false, 'coupon', [['AND', 'couponsn = :couponsn', 'couponsn', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getAllOKCoupon($stime, $etime)
    {
        $data = ['couponsn,couponvalue', 'coupon', [['AND', 'couponaddtime >= :couponaddstime', 'couponaddstime', $stime], ['AND', 'couponaddtime <= :couponaddetime', 'couponaddetime', $etime], ['AND', 'couponstatus = 0']], false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    public function useCouponById($id, $userid)
    {
        $r = $this->getCouponById($id);
        if (!$r) {
            return false;
        }
        if ($r['couponstatus']) {
            return 301;
        } elseif ($r['couponendtime'] < TIME) {
            return 302;
        }

        $user = $this->G->make('user', 'user');
        if ($r['couponvalue'] < 0) {
            $r['couponvalue'] = 0;
        }
        $u = $user->getUserById($userid);
        $coin = $u['usercoin'] + $r['couponvalue'];
        $args = ['usercoin' => $coin];
        $user->modifyUserInfo($userid, $args);
        $args = ['couponstatus' => 1];
        $data = ['coupon', $args, [['AND', 'couponsn = :couponsn', 'couponsn', $id]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return 200;
    }

    public function randCoupon($value, $endtime = null)
    {
        if (!$value) {
            return 0;
        }
        if (!$endtime) {
            $endtime = TIME + 3600 * 24 * 365;
        }
        $t = microtime().rand(1000, 9999).CS;
        $sn = strtoupper(substr(md5($t), 0, 16));
        $r = $this->getCouponById($sn);
        if ($r) {
            $this->randCoupon($value);
        } else {
            $args = ['couponsn' => $sn, 'couponvalue' => $value, 'couponstatus' => 0, 'couponaddtime' => TIME, 'couponendtime' => $endtime];
            $this->addCoupon($args);
        }

        return true;
    }
}
