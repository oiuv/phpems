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

class seminar_seminar
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

    public function getSeminarList($args, $page, $number = 10, $orderby = 'seminarorder desc,seminarid desc')
    {
        $data = [
            'select'  => false,
            'table'   => 'seminar',
            'query'   => $args,
            'orderby' => $orderby,
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getSeminarsByArgs($args, $orderby = 'seminarorder desc,seminarid desc')
    {
        $data = [false, 'seminar', $args, false, $orderby, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    public function addSeminar($args)
    {
        return $this->db->insertElement(['table' => 'seminar', 'query' => $args]);
    }

    public function delSeminar($seminarid)
    {
        $args = [
            ['AND', 'seminarid = :seminarid', 'seminarid', $seminarid],
        ];

        return $this->db->delElement(['table' => 'seminar', 'query' => $args]);
    }

    public function modifySeminar($seminarid, $args)
    {
        $data = [
            'table' => 'seminar',
            'value' => $args,
            'query' => [['AND', 'seminarid = :seminarid', 'seminarid', $seminarid]],
        ];

        return $this->db->updateElement($data);
    }

    public function getSeminarById($seminarid)
    {
        $args = [
            ['AND', 'seminarid = :seminarid', 'seminarid', $seminarid],
        ];
        $data = [false, 'seminar', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getSeminarLayoutList($args, $page, $number = 10, $orderby = 'slayoutorder desc,slayoutid desc')
    {
        $data = [
            'select'  => false,
            'table'   => 'seminar_layout',
            'query'   => $args,
            'orderby' => $orderby,
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getSeminarLayoutsByArgs($args, $orderby = 'slayoutorder desc,slayoutid desc')
    {
        $data = [false, 'seminar_layout', $args, false, $orderby, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    public function addSeminarLayout($args)
    {
        return $this->db->insertElement(['table' => 'seminar_layout', 'query' => $args]);
    }

    public function modifySeminarLayout($slayoutid, $args)
    {
        $data = [
            'table' => 'seminar_layout',
            'value' => $args,
            'query' => [['AND', 'slayoutid = :slayoutid', 'slayoutid', $slayoutid]],
        ];

        return $this->db->updateElement($data);
    }

    public function delSeminarLayout($slayoutid)
    {
        $args = [
            ['AND', 'slayoutid = :slayoutid', 'slayoutid', $slayoutid],
        ];

        return $this->db->delElement(['table' => 'seminar_layout', 'query' => $args]);
    }

    public function getSeminarLayoutById($slayoutid)
    {
        $args = [
            ['AND', 'slayoutid = :slayoutid', 'slayoutid', $slayoutid],
        ];
        $data = [false, 'seminar_layout', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getSeminarElemList($args, $page, $number = 10, $orderby = 'selorder desc,selid desc')
    {
        $data = [
            'select'  => false,
            'table'   => 'seminar_elem',
            'query'   => $args,
            'orderby' => $orderby,
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getSeminarElemsByArgs($args, $orderby = 'selorder desc,selid desc')
    {
        $data = [false, 'seminar_elem', $args, false, $orderby, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql);
    }

    public function addSeminarElem($args)
    {
        return $this->db->insertElement(['table' => 'seminar_elem', 'query' => $args]);
    }

    public function modifySeminarElem($selid, $args)
    {
        $data = [
            'table' => 'seminar_elem',
            'value' => $args,
            'query' => [['AND', 'selid = :selid', 'selid', $selid]],
        ];

        return $this->db->updateElement($data);
    }

    public function delSeminarElem($selid)
    {
        $args = [
            ['AND', 'selid = :selid', 'selid', $selid],
        ];

        return $this->db->delElement(['table' => 'seminar_elem', 'query' => $args]);
    }

    public function getSeminarElemById($selid)
    {
        $args = [
            ['AND', 'selid = :selid', 'selid', $selid],
        ];
        $data = [false, 'seminar_elem', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'seldata');
    }

    public function parseSeminar($seminarid)
    {
        $seminar = $this->getSeminarById($seminarid);
        if (!$seminar) {
            return false;
        }
        $args = [];
        $args[] = ['AND', 'slayoutseminar = :slayoutseminar', 'slayoutseminar', $seminarid];
        $layouts = $this->getSeminarLayoutsByArgs($args);
        $alltpl = '';
        foreach ($layouts as $layout) {
            $ltpl = stripslashes(htmlspecialchars_decode($layout['slayoutcode']));
            $args = [];
            $args[] = ['AND', 'selseminar = :selseminar', 'selseminar', $seminarid];
            $args[] = ['AND', 'sellayout = :sellayout', 'sellayout', $layout['slayoutid']];
            $elems = $this->getSeminarElemsByArgs($args);
            $eltpl = '';
            $leltpl = '';
            $reltpl = '';
            foreach ($elems as $elem) {
                $tpl = stripslashes(htmlspecialchars_decode($elem['selcode']));
                $tpl = str_replace('<!--{{datasource}}-->', '{x2;seminar:'.$elem['selid'].'}', $tpl);
                if ($elem['selpos']) {
                    if (1 == $elem['selpos']) {
                        $leltpl .= $tpl;
                    } else {
                        $reltpl .= $tpl;
                    }
                } else {
                    $eltpl .= $tpl;
                }
            }
            $ltpl = str_replace('<!--{{childrentpls}-->', $eltpl, $ltpl);
            $ltpl = str_replace('<!--{{middlechildrentpls}-->', $eltpl, $ltpl);
            $ltpl = str_replace('<!--{{leftchildrentpls}-->', $leltpl, $ltpl);
            $ltpl = str_replace('<!--{{rightchildrentpls}-->', $reltpl, $ltpl);
            $alltpl .= $ltpl;
        }
        $stpl = str_replace('<!--{{childrentpls}-->', $alltpl, stripslashes(htmlspecialchars_decode($seminar['seminarcode'])));

        return $stpl;
    }

    public function getSeminarContentList($args, $page, $number = 10, $orderby = 'sctorder desc,contentid desc')
    {
        $args[] = ['AND', 'contentid = sctcontentid'];
        $data = [
            'select'  => false,
            'table'   => ['seminar_content', 'content'],
            'query'   => $args,
            'orderby' => $orderby,
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function addSeminarContent($args)
    {
        return $this->db->insertElement(['table' => 'seminar_content', 'query' => $args]);
    }

    public function delSeminarContent($sctid)
    {
        $args = [
            ['AND', 'sctid = :sctid', 'sctid', $sctid],
        ];

        return $this->db->delElement(['table' => 'seminar_content', 'query' => $args]);
    }

    public function modifySeminarContent($sctid, $args)
    {
        $data = [
            'table' => 'seminar_content',
            'value' => $args,
            'query' => [['AND', 'sctid = :sctid', 'sctid', $sctid]],
        ];

        return $this->db->updateElement($data);
    }
}
