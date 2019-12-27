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

class answer_exam
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->sql = $this->G->make('sql');
        $this->db = $this->G->make('db');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

    //添加追问问题
    //参数：追问问题的字段形成的数组
    //返回值：插入的ID
    public function insertAnswer($args)
    {
        $data = ['answer', $args];
        $sql = $this->sql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //获取提问问题的列表
    //参数：页码，每页显示数量，其他参数形成的数组
    //返回值：数组，包括页数地址、问题列表、总数目
    public function getAskList($page, $number, $args)
    {
        $data = [
            'select'  => 'asks.*, questions.question',
            'table'   => ['asks', 'questions'],
            'index'   => false,
            'serial'  => false,
            'query'   => $args,
            'orderby' => 'asks.askid DESC',
            'groupby' => false,
        ];

        return $this->db->listElements($page, 20, $data);
    }

    //获取追问问题及答案的列表
    //参数：页码，每页显示数量，其他参数形成的数组
    //返回值：数组，包括页数地址、问题列表、总数目
    public function getAnswerList($page, $number, $args)
    {
        $data = [
            'select'  => false,
            'table'   => 'answer',
            'index'   => false,
            'serial'  => false,
            'query'   => $args,
            'orderby' => 'answerid DESC',
            'groupby' => false,
        ];

        return $this->db->listElements($page, 20, $data);
    }

    //编辑问题
    //参数：问题ID，要修改的字段参数形成的数组
    //返回值：影响到的记录列数
    public function modifyAsk($askid, $args)
    {
        $data = ['asks', $args, "askid = '{$askid}'"];
        $sql = $this->sql->makeUpdate($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    //回复问题
    //参数：追问问题ID，追问问题的答案
    //返回值：该追问问题的ID
    public function giveAnswer($answerid, $args)
    {
        $this->modifyAnswer($answerid, $args);
        $answer = $this->getAnswerById($answerid);
        $sargs = ['asklasttime' => TIME, 'askstatus' => 1, 'asklastteacher' => $args['answerteacher'], 'asklastteacherid' => $args['answerteacherid']];
        $this->modifyAsk($answer['answeraskid'], $sargs);

        return $answer['answeraskid'];
    }

    //获取一个追问问题的信息
    //参数：追问问题ID
    //返回值：追问问题信息的数组
    public function getAnswerById($answerid)
    {
        $data = [false, 'answer', "answerid = '{$answerid}'"];
        $sql = $this->sql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //编辑一个问题
    //参数：追问问题ID，要修改的字段参数形成的数组
    //返回值：更改后的问题ID
    public function modifyAnswer($answerid, $args)
    {
        $args['answertime'] = TIME;
        $data = ['answer', $args, "answerid = '{$answerid}'"];
        $sql = $this->sql->makeUpdate($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    //添加一个问题
    //参数：问题的字段形成的数组
    //返回值：插入的ID
    public function insertAsks($args)
    {
        $data = ['asks', $args];
        $sql = $this->sql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    //删除一个问题列表 （假删，只更改问题的状态）
    //参数：要删除问题的ID
    //返回值：受影响的记录数
    public function delAsksById($askid)
    {
        $data = ['asks', ['askdel' => 1], "askid = '{$askid}'", false, 'askid DESC', 1];
        $sql = $this->sql->makeUpdate($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    //删除一个追问问题
    //参数：要删除追问问题的ID
    //返回值：受影响的记录数
    public function delAnswerById($answerid)
    {
        $data = ['answer', "answerid = '{$answerid}'"];
        $sql = $this->sql->makeDelete($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    //根据ID获取一个问题内容
    //参数：问题的ID
    //返回值：问题的内容形成的数组
    public function getAskById($askid)
    {
        $data = [false, 'asks', "askid = '{$askid}'"];
        $sql = $this->sql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //根据参数获取一个答疑内容
    //参数：判断参数形成的数组
    //返回值：问题的内容形成的数组
    public function getAskByArgs($args = 1)
    {
        $data = [false, 'asks', $args];
        $sql = $this->sql->makeSelect($data);

        return $this->db->fetch($sql);
    }
}
