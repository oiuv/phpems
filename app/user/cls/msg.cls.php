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

class msg_user
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->sql = $this->G->make('sql');
        $this->db = $this->G->make('db');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->user = $this->G->make('user', 'office');
    }

    public function getMessageList($page, $userid)
    {
        $data = [false, 'message', "messageposter = '{$userid}' OR messagereciver = '{$userid}'", false, 'messageid DESC', false];
        $sql = $this->sql->makeSelect($data);
        $data = [
            'select'  => false,
            'table'   => '('.$sql.')',
            'index'   => false,
            'serial'  => false,
            'query'   => 1,
            'orderby' => 'messageid DESC',
            'groupby' => 'messagerelative',
        ];

        return $this->db->listElements($page, 20, $data, 0);
    }

    public function getMessageListContents($page, $relative)
    {
        $data = [
            'select'  => false,
            'table'   => 'message',
            'index'   => false,
            'serial'  => false,
            'query'   => "messagerelative = '{$relative}'",
            'orderby' => 'messageid DESC',
            'groupby' => false,
        ];

        return $this->db->listElements($page, 20, $data);
    }

    public function getNewMessageByUserid($userid)
    {
        $data = [false, 'message', ["messagereciver = '{$userid}'", 'messagestatus = 0']];
        $sql = $this->sql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function readMessage($messagerelative, $userid)
    {
        $data = ['message', ['messagestatus' => 1], "messagereciver = '{$userid}'"];
        $sql = $this->sql->makeUpdate($data);
        $this->db->exec($sql);

        return $this->db->affectedRows();
    }

    public function sendMessage($poster, $reciver, $content)
    {
        $users = $this->user->getUsersByArgs('userid IN ('.$reciver.','.$poster.')');
        $args = ['messagetime' => TIME, 'messageposter' => $poster, 'messagepostername' => $users[$poster]['username'], 'messagereciver' => $reciver, 'messagerecivername' => $users[$reciver]['username']];
        $args['messagecontent'] = $content;
        if ($poster > $reciver) {
            $args['messagerelative'] = $reciver.'-'.$poster;
        } else {
            $args['messagerelative'] = $poster.'-'.$reciver;
        }
        $data = ['message', $args];
        $sql = $this->sql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }
}
