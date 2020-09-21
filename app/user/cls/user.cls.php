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

class user_user
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
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->module = $this->G->make('module');
        $this->session = $this->G->make('session');
    }

    public function autoLoginWxUser($openid)
    {
        $user = $this->getUserByOpenId($openid);
        if (!$user) {
            return false;
        }
        $this->session->setSessionUser(['sessionuserid' => $user['userid'], 'sessionpassword' => $user['userpassword'], 'sessionip' => $this->ev->getClientIp(), 'sessiongroupid' => $user['usergroupid'], 'sessionlogintime' => TIME, 'sessionusername' => $user['username']]);

        return true;
    }

    public function getUserByOpenId($openid)
    {
        $user = $this->getUserByArgs([['AND', 'useropenid = :useropenid', 'useropenid', $openid]]);

        return $user;
    }

    public function insertUser($args)
    {
        $args['userregip'] = $this->ev->getClientIp();
        $args['userregtime'] = TIME;

        return $this->db->insertElement(['table' => 'user', 'query' => $args]);
    }

    public function delUserById($userid)
    {
        return $this->db->delElement(['table' => 'user', 'query' => [['AND', 'userid = :userid', 'userid', $userid]]]);
    }

    public function getUserById($id)
    {
        $data = [false, ['user', 'user_group'], [['AND', 'user.userid = :id', 'id', $id], ['AND', 'user.usergroupid = user_group.groupid']]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['userinfo', 'groupright']);
    }

    public function getUserByArgs($args)
    {
        $data = [false, ['user', 'user_group'], $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['userinfo', 'groupright']);
    }

    public function getUsersByArgs($args)
    {
        $data = [false, ['user', 'user_group'], $args, false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'userid', ['userinfo', 'groupright']);
    }

    public function getUserList($args, $page, $number = 10, $orderby = 'userid desc')
    {
        $args[] = ['AND', 'groupid = usergroupid'];
        $data = [
            'table'   => ['user', 'user_group'],
            'query'   => $args,
            'serial'  => 'groupright',
            'index'   => 'userid',
            'orderby' => $orderby,
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function modifyUserGroup($userid, $groupid)
    {
        $user = $this->getUserById($userid);
        if ($groupid == $user['usergroupid']) {
            return true;
        }
        $group = $this->getGroupById($groupid);
        if ($group['groupmoduleid'] == $user['groupmoduleid']) {
            $data = ['user', ['usergroupid' => $groupid], [['AND', 'userid = :userid', 'userid', $userid]]];
            $sql = $this->pdosql->makeUpdate($data);
            $this->db->exec($sql);

            return true;
        }

        $args = ['usergroupid' => $groupid];
        $fields = $this->module->getPrivateMoudleFields($user['groupmoduleid']);
        foreach ($fields as $p) {
            $args[$p['field']] = null;
        }
        $data = ['user', $args, [['AND', 'userid = :userid', 'userid', $userid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return true;
    }

    public function modifyUserPassword($userid, $args)
    {
        $data = ['user', ['userpassword' => md5($args['password'])], [['AND', 'userid = :userid', 'userid', $userid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return true;
    }

    public function modifyUserInfo($userid, $args)
    {
        if (!$args) {
            return false;
        }
        $data = ['user', $args, [['AND', 'userid = :userid', 'userid', $userid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function delActorById($groupid)
    {
        $data = ['count(*) as number', 'user', [['AND', 'usergroupid = :usergroupid', 'usergroupid', $groupid]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        if ($r['number']) {
            return false;
        }

        $args = [
            'table' => 'user_group',
            'query' => [['AND', 'groupid = :groupid', 'groupid', $groupid]],
        ];

        return $this->db->delElement($args);
    }

    public function getUserByUserName($username)
    {
        $data = [false, ['user', 'user_group'], [['AND', 'user.username = :username', 'username', $username], ['AND', 'user.usergroupid = user_group.groupid']]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['userinfo', 'groupright']);
    }

    public function getUserByEmail($email)
    {
        $data = [false, ['user', 'user_group'], [['AND', 'user.useremail = :email', 'email', $email], ['AND', 'user.usergroupid = user_group.groupid']]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, ['userinfo', 'groupright']);
    }

    public function getGroupById($groupid)
    {
        $data = [false, 'user_group', [['AND', 'groupid = :groupid', 'groupid', $groupid]], false, 'groupid DESC', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'groupright');
    }

    public function getGroupByArgs($args)
    {
        $data = [false, 'user_group', $args];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql, 'groupright');
    }

    public function getUserGroups()
    {
        $data = [false, 'user_group', 1, false, 'groupid DESC', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'groupid', 'groupright');
    }

    public function getUserGroupList($args, $page = 1, $number = 10)
    {
        $data = [
            'table'  => 'user_group',
            'query'  => $args,
            'index'  => 'groupid',
            'serial' => 'groupright',
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function getGroupsByModuleid($moduleid)
    {
        $data = [false, 'user_group', [['AND', 'groupmoduleid = :groupmoduleid', 'groupmoduleid', $moduleid]], false, false, false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchAll($sql, 'groupid', 'groupright');
    }

    public function getDefaultGroupByModuleid($moduleid)
    {
        $data = [false, 'user_group', [['AND', 'groupmoduledefault = 1'], ['AND', 'groupmoduleid = :groupmoduleid', 'groupmoduleid', $moduleid]], false, 'groupid DESC', false];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    public function insertActor($args)
    {
        unset($args['groupmoduledefault']);
        $data = ['user_group', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->db->lastInsertId();
    }

    public function modifyActor($groupid, $args)
    {
        $r = $this->getGroupByArgs([['AND', 'groupname = :groupname', 'groupname', $args['groupname']], ['AND', 'groupid != :groupid', 'groupid', $groupid]]);
        if ($r) {
            return false;
        }
        $data = ['user_group', $args, [['AND', 'groupid = :groupid', 'groupid', $groupid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function selectDefaultActor($groupid)
    {
        $args = ['groupdefault' => 0];
        $data = ['user_group', $args];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);
        $args = ['groupdefault' => 1];
        $data = ['user_group', $args, [['AND', 'groupid = :groupid', 'groupid', $groupid]]];
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function getDefaultGroup()
    {
        $data = [false, 'user_group', [['AND', 'groupdefault = 1']]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }
}
