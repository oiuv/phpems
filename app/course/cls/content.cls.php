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

class content_course
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
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->module = $this->G->make('module');
        $this->user = $this->G->make('user', 'user');
    }

    public function getCourseContentNumber($courseid)
    {
        $data = ['count(*) AS number', 'course', [['AND', 'coursecsid = :coursecsid', 'coursecsid', $courseid]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['number'];
    }

    public function getCoursesByCsid($csid, $order = 'coursesequence DESC,courseinputtime ASC,courseid ASC')
    {
        $data = [false, 'course', [['AND', 'coursecsid = :coursecsid', 'coursecsid', $csid]], false, $order, false];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql);

        return ['data' => $r];
    }

    public function getCourseList($args = [], $page = 1, $number = 20, $order = 'coursesequence DESC,courseinputtime ASC,courseid ASC')
    {
        $data = [
            'select'  => false,
            'table'   => 'course',
            'query'   => $args,
            'orderby' => $order,
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    public function delCourse($id)
    {
        return $this->db->delElement(['table' => 'course', 'query' => [['AND', 'courseid = :courseid', 'courseid', $id]]]);
    }

    public function modifyCourse($id, $args)
    {
        if (isset($args['coursemoduleid'])) {
            unset($args['coursemoduleid']);
        }
        $data = [
            'table' => 'course',
            'value' => $args,
            'query' => [['AND', 'courseid = :courseid', 'courseid', $id]],
        ];

        return $this->db->updateElement($data);
    }

    public function addCourse($args)
    {
        return $this->db->insertElement(['table' => 'course', 'query' => $args]);
    }

    private function _getBasicCourseById($id)
    {
        $data = [false, 'course', [['AND', 'courseid = :courseid', 'courseid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    private function _modifyBasicCourseById($id, $args)
    {
        $data = ['course', $args, [['AND', 'courseid = :courseid', 'courseid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function modifyBasciCourse($id, $args)
    {
        $this->_modifyBasiccourseById($id, $args);
    }

    public function getBasicCourseById($id)
    {
        return $this->_getBasiccourseById($id);
    }

    public function getCourseById($id)
    {
        $data = [false, 'course', [['AND', 'courseid = :courseid', 'courseid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getNearCourseById($id, $catid)
    {
        $r = [];
        $data = [false, 'course', [['AND', 'courseid < :courseid', 'courseid', $id], ['AND', 'coursecatid = :catid', 'catid', $catid]], false, 'courseid DESC', 5];
        $sql = $this->pdosql->makeSelect($data);
        $r['pre'] = $this->db->fetchAll($sql);
        $data = [false, 'course', [['AND', 'courseid > :courseid', 'courseid', $id], ['AND', 'coursecatid = :catid', 'catid', $catid]], false, 'courseid ASC', 5];
        $sql = $this->pdosql->makeSelect($data);
        $r['next'] = $this->db->fetchAll($sql);

        return $r;
    }
}
