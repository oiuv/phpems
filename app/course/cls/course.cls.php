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

class course_course
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
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

    public function getCourseList($args, $page, $number = 20, $order = 'cssequence desc,cstime DESC,csid DESC')
    {
        $data = [
            'select'  => false,
            'table'   => 'coursesubject',
            'query'   => $args,
            'orderby' => $order,
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    public function getCourseNumberByCsid($csid)
    {
        $data = ['count(*) as number', 'course', [['AND', 'coursecsid = :coursecsid', 'coursecsid', $csid]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['number'];
    }

    public function getCourseContentStatus($courseid, $userid)
    {
        $cdata = ['course' => [], 'content' => [], 'index' => [], 'lock' => []];
        $course = $this->getCourseById($courseid);
        $data = ['courseid', 'course', [['AND', 'coursecsid = :coursecsid', 'coursecsid', $course['csid']]], false, 'coursesequence DESC,courseinputtime ASC,courseid ASC'];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql);
        $i = 0;
        foreach ($r as $p) {
            $cdata['course'][$i] = $p['courseid'];
            $cdata['index'][$p['courseid']] = $i;
            $this->log = $this->G->make('log', 'course');
            $largs = [];
            $largs[] = ['AND', 'loguserid = :loguserid', 'loguserid', $userid];
            $largs[] = ['AND', 'logcourseid = :logcourseid', 'logcourseid', $p['courseid']];
            $rs = $this->log->getLogByArgs($largs);
            if ($rs['logstatus']) {
                $cdata['content'][$i] = $rs['logid'];
            }
            $i++;
        }
        foreach ($cdata['course'] as $key => $p) {
            if ($key) {
                if ($cdata['content'][intval($key - 1)]) {
                    $cdata['lock'][$p] = 0;
                } else {
                    $cdata['lock'][$p] = 1;
                }
            } else {
                $cdata['lock'][$p] = 0;
            }
        }

        return $cdata;
    }

    public function delCourse($id)
    {
        return $this->db->delElement(['table' => 'coursesubject', 'query' => [['AND', 'csid = :csid', 'csid', $id]]]);
    }

    public function modifyCourse($id, $args)
    {
        $data = [
            'table' => 'coursesubject',
            'value' => $args,
            'query' => [['AND', 'csid = :oldcsid', 'oldcsid', $id]],
        ];

        return $this->db->updateElement($data);
    }

    public function addCourse($args)
    {
        return $this->db->insertElement(['table' => 'coursesubject', 'query' => $args]);
    }

    private function _getBasicCourseById($id)
    {
        $data = [false, 'coursesubject', [['AND', 'csid = :csid', 'csid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    private function _modifyBasicCourseById($id, $args)
    {
        $data = ['coursesubject', $args, [['AND', 'csid = :csid', 'csid', $id]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function modifyBasciCourse($id, $args)
    {
        $this->_modifyBasicCourseById($id, $args);
    }

    public function getBasicCourseById($id)
    {
        return $this->_getBasicCourseById($id);
    }

    public function getCourseById($id)
    {
        $data = [false, 'coursesubject', [['AND', 'csid = :csid', 'csid', $id]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getNearCourseById($id, $catid)
    {
        $r = [];
        $data = [false, 'coursesubject', [['AND', 'csid < :csid', 'csid', $id], ['AND', 'cscatid = :catid', 'catid', $catid]], false, 'csid DESC', 5];
        $sql = $this->pdosql->makeSelect($data);
        $r['pre'] = $this->db->fetchAll($sql);
        $data = [false, 'coursesubject', [['AND', 'csid > :csid', 'csid', $id], ['AND', 'cscatid = :catid', 'catid', $catid]], false, 'csid ASC', 5];
        $sql = $this->pdosql->makeSelect($data);
        $r['next'] = $this->db->fetchAll($sql);

        return $r;
    }

    public function getOpenCourseByUserid($userid)
    {
        $data = [false, ['opencourse', 'course'], [['AND', 'opencourse.ocuserid = :userid', 'userid', $userid], ['AND', 'opencourse.occourseid = course.csid'], ['AND', 'opencourse.ocendtime > :ocendtime', 'ocendtime', TIME]], false, 'opencourse.ocendtime DESC,ocid DESC', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'occourseid');
    }

    public function getOpenCourseMember($args, $page, $number = 20, $order = 'octime DESC,ocid DESC')
    {
        $args[] = ['AND', 'opencourse.ocuserid = user.userid'];
        $data = [
            'select'  => false,
            'table'   => ['opencourse', 'user'],
            'query'   => $args,
            'orderby' => $order,
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }

    public function openCourse($args)
    {
        $data = ['opencourse', [['AND', 'ocuserid = :ocuserid', 'ocuserid', $args['ocuserid']], ['AND', 'occourseid = :occourseid', 'occourseid', $args['occourseid']]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);
        $args['octime'] = TIME;
        $data = ['opencourse', $args];
        $sql = $this->pdosql->makeInsert($data);

        return $this->db->exec($sql);
    }

    public function delOpenCourse($ocid)
    {
        $data = ['opencourse', [['AND', 'ocid = :ocid', 'ocid', $ocid]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
    }

    public function delOpenPassCourse($userid)
    {
        $data = ['opencourse', [['AND', 'ocuserid = :ocuserid', 'ocuserid', $userid], ['AND', 'ocendtime <= :ocendtime', 'ocendtime', TIME]]];
        $sql = $this->pdosql->makeDelete($data);

        return $this->db->exec($sql);
    }

    public function getOpenCourseNumber($csid)
    {
        $data = ['count(*) as number', 'opencourse', [['AND', 'occourseid = :occourseid', 'occourseid', $csid], ['AND', 'ocendtime >= :ocendtime', 'ocendtime', TIME]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['number'];
    }

    public function getOpenCourseById($ocid)
    {
        $data = [false, 'opencourse', [['AND', 'ocid = :ocid', 'ocid', $ocid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getOpenCourseByUseridAndCsid($userid, $csid)
    {
        $data = [false, 'opencourse', [['AND', 'ocuserid = :ocuserid', 'ocuserid', $userid], ['AND', 'occourseid = :occourseid', 'occourseid', $csid], ['AND', 'ocendtime > :ocendtime', 'ocendtime', TIME]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function getOpenCourseListByUserid($userid, $page, $number = 20)
    {
        $data = [
            'select'  => false,
            'table'   => ['opencourse', 'coursesubject'],
            'query'   => [['AND', 'opencourse.ocuserid = :userid', 'userid', $userid], ['AND', 'opencourse.occourseid = coursesubject.csid'], ['AND', 'opencourse.ocendtime > :ocendtime', 'ocendtime', TIME]],
            'orderby' => 'opencourse.ocendtime DESC,ocid DESC',
        ];
        $r = $this->db->listElements($page, $number, $data);

        return $r;
    }
}
