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

class category
{
    public $G;
    public $tidyCategory;

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
        $this->ev = $this->G->make('ev');
        $this->app = $this->G->app;
    }

    public function addCategory($args)
    {
        if (!$args['catapp']) {
            $args['catapp'] = $this->app;
        }
        if (is_array($args['catmanager'])) {
            $args['catmanager'] = $this->ev->addSlashes(serialize($args['catmanager']));
        }

        return $this->db->insertElement(['table' => 'category', 'query' => $args]);
    }

    public function getCategoryById($id)
    {
        $data = [false, 'category', [['AND', 'catid = :catid', 'catid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'catmanager');
    }

    public function getCategoryList($args, $page, $number = 20)
    {
        if (!is_array($args)) {
            $args = [['AND', 'catapp = :catapp', 'catapp', $this->app]];
        } else {
            $args[] = ['AND', 'catapp = :catapp', 'catapp', $this->app];
        }
        $data = [
            'select'  => false,
            'table'   => 'category',
            'index'   => 'catid',
            'query'   => $args,
            'orderby' => 'catlite DESC,catid DESC',
            'serial'  => 'catmanager',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getCategoriesByArgs($args)
    {
        if (!is_array($args)) {
            $args = [['AND', 'catapp = :catapp', 'catapp', $this->app]];
        }
        $data = [false, 'category', $args, false, 'catlite DESC,catid DESC', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'catid', 'catmanager');
    }

    public function delCategory($id)
    {
        return $this->db->delElement(['table' => 'category', 'query' => [['AND', 'catid = :catid', 'catid', $id], ['AND', 'catapp = :catapp', 'catapp', $this->app]]]);
    }

    public function modifyCategory($id, $args)
    {
        unset($args['catapp']);
        $data = [
            'table'   => 'category',
            'value'   => $args,
            'query'   => [['AND', 'catid = :catid', 'catid', $id]],
            'orderby' => 'catlite DESC,catid DESC',
        ];

        return $this->db->updateElement($data);
    }

    public function getAllCategory($app = false)
    {
        if (!$app) {
            $app = $this->app;
        }
        if (null === $this->categories) {
            $data = [false, 'category', [['AND', 'catapp = :catapp', 'catapp', $app]], false, 'catlite DESC,catid DESC', false];
            $sql = $this->pdosql->makeSelect($data);
            $this->categories = $this->db->fetchAll($sql, 'catid', 'catmanager');
            $this->tidyCategory();
        }

        return $this->categories;
    }

    public function getAllCategoryByApp($app)
    {
        $data = [false, 'category', [['AND', 'catapp = :catapp', 'catapp', $app]], false, 'catlite DESC,catid DESC', false];
        $sql = $this->sql->makeSelect($data);

        return $this->db->fetchAll($sql, 'catid', 'catmanager');
    }

    private function tidyCategory()
    {
        if (null === $this->tidyCategory) {
            $this->getAllCategory();
            $categories = [];
            foreach ($this->categories as $p) {
                $categories[$p['catparent']][] = $p;
            }
            $this->tidycategories = $categories;
        }

        return $this->tidycategories;
    }

    public function getChildCategory($id)
    {
        if (!$id) {
            return false;
        }
        $categories = $this->tidyCategory();
        $child = [];
        $parent = [$id];
        $i = 0;
        while ($parent[$i]) {
            if ($categories[$parent[$i]]) {
                foreach ($categories[$parent[$i]] as $n) {
                    $child[] = $n['catid'];
                    $parent[] = $n['catid'];
                }
            }
            $i++;
        }

        return $child;
    }

    public function getChildCategoryString($id, $withself = 1)
    {
        $s = implode(',', $this->getChildCategory($id));
        if ($withself) {
            if ($s) {
                $s = $id.','.$s;
            } else {
                $s = $id;
            }
        }

        return $s;
    }

    public function getCategoryPos($id)
    {
        $this->tidyCategory();
        if ($this->categories[$id]) {
            $categories = [];
            while ($this->categories[$id]['catparent']) {
                $categories[] = $this->categories[$this->categories[$id]['catparent']];
                $id = $this->categories[$id]['catparent'];
            }
            krsort($categories);

            return $categories;
        }

        return false;
    }

    public function levelCategory(&$t, $index, $allcats)
    {
        if (is_array($allcats[$index])) {
            foreach ($allcats[$index] as $p) {
                if ($this->selected && $this->selected == $p['catid']) {
                    $t[$p['catid']] = ['text' => $p['catname'], 'href' => $this->hrefpre.$p['catid'], 'color' => '#FFFFFF', 'backColor' => '#428bca'];
                } else {
                    $t[$p['catid']] = ['text' => $p['catname'], 'href' => $this->hrefpre.$p['catid']];
                }
                $this->levelCategory($t[$p['catid']]['nodes'], $p['catid'], $allcats);
            }
        }
    }

    public function resetCategoryIndex(&$t)
    {
        $t = array_values($t);
        foreach ($t as $key => $p) {
            if ($p['nodes']) {
                $this->resetCategoryIndex($t[$key]['nodes']);
            }
        }
    }
}
