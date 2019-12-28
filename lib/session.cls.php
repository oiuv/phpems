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

class session
{
    public $G;
    public $sessionname = 'currentuser';
    public $sessionuser = false;
    public $sessionid;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->db = $this->G->make('pepdo');
        $this->ev = $this->G->make('ev');
        $this->pdosql = $this->G->make('pdosql');
        $this->strings = $this->G->make('strings');
        $this->sessionid = $this->getSessionId();
    }

    //获取会话ID
    public function getSessionId2()
    {
        if (!$this->sessionid) {
            if ($_SESSION['currentuser']) {
                $this->sessionid = $_SESSION['currentuser']['sessionid'];
                $this->ev->setCookie('psid', $this->sessionid, 3600 * 24);
            } else {
                $cookie = $this->strings->decode($this->ev->getCookie($this->sessionname));
                if ($cookie) {
                    $this->sessionid = $cookie['sessionid'];
                    $this->ev->setCookie('psid', $this->sessionid, 3600 * 24);
                } else {
                    $this->sessionid = $this->ev->getCookie('psid');
                }
            }
        }
        if (!$this->sessionid) {
            $this->sessionid = session_id();
            $this->ev->setCookie('psid', $this->sessionid, 3600 * 24);
        }
        if (!$this->sessionid) {
            $this->sessionid = md5(TIME.rand(1000, 9999));
            $this->ev->setCookie('psid', $this->sessionid, 3600 * 24);
        }
        if (!$this->getSessionValue($this->sessionid)) {
            $data = ['session', ['sessionid' => $this->sessionid, 'sessionuserid' => 0, 'sessionip' => $this->ev->getClientIp()]];
            $sql = $this->pdosql->makeInsert($data);
            $this->db->exec($sql);
        }

        return $this->sessionid;
    }

    private function _getOnlySessionid()
    {
        $code = uniqid($this->ev->getClientIp().print_r($_SERVER, true).microtime()).rand(100000, 999999);
        $this->sessionid = md5($code);
        if ($this->getSessionValue($this->sessionid)) {
            $this->_getOnlySessionid();
        }
    }

    public function getSessionId()
    {
        if (!$this->sessionid) {
            $cookie = $this->strings->decode($this->ev->getCookie($this->sessionname));
            if ($cookie) {
                $this->sessionid = $cookie['sessionid'];
            }
        }
        if (!$this->sessionid) {
            $this->_getOnlySessionid();
            $this->setSessionUser(['sessionid' => $this->sessionid, 'sessionip' => $this->ev->getClientIp()]);
        }
        if (!$this->getSessionValue()) {
            $this->setSessionUser(['sessionid' => $this->sessionid, 'sessionip' => $this->ev->getClientIp()]);
        }

        return $this->sessionid;
    }

    //设置随机参数
    public function setRandCode($randCode)
    {
        if (!$randCode) {
            $array = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
            $randCode = '';
            for ($i = 0; $i < 4; $i++) {
                $randCode .= $array[intval(rand(0, 35))];
            }
        }
        if (!$this->sessionid) {
            $this->getSessionId();
        }
        $data = ['session', ['sessionrandcode' => $randCode], [['AND', 'sessionid = :sessionid', 'sessionid', $this->sessionid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $r = $this->db->exec($sql);
        if ($r) {
            return $randCode;
        }

        $data = ['session', ['sessionid' => $this->sessionid, 'sessionuserid' => 0, 'sessionip' => $this->ev->getClientIp()]];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);

        return $this->setRandCode($randCode);
    }

    //获取随机参数
    public function getRandCode()
    {
        if (!$this->sessionid) {
            $this->getSessionId();
        }
        $data = ['sessionrandcode', 'session', [['AND', 'sessionid = :sessionid', 'sessionid', $this->sessionid]]];
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);

        return $r['randcode'];
    }

    //获取会话内容
    public function getSessionValue($sessionid = null)
    {
        if (!$sessionid) {
            if (!$this->sessionid) {
                $this->getSessionId();
            }
            $sessionid = $this->sessionid;
        }
        $data = [false, 'session', [['AND', 'sessionid = :sessionid', 'sessionid', $this->sessionid]]];
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetch($sql);
    }

    //设置会话用户信息
    public function setSessionUser($args = null)
    {
        if (!$args) {
            return false;
        }

        if (!$args['sessiontimelimit']) {
            $args['sessiontimelimit'] = TIME;
        }
        if (!$this->sessionid) {
            $this->getSessionId();
        }
        $args['sessionid'] = $this->sessionid;
        $args['sessiontimelimit'] = TIME;
        $data = ['session', [['AND', 'sessionid = :sessionid', 'sessionid', $this->sessionid]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);
        $data = ['session', $args];
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        $ck = ['sessionid' => $this->sessionid, 'sessionuserid' => $args['sessionuserid'], 'sessionpassword' => $args['sessionpassword'], 'sessionip' => $args['sessionip']];
        $this->ev->setCookie($this->sessionname, $this->strings->encode($args), 3600 * 24);

        return true;
    }

    //设置会话中其他信息
    public function setSessionValue($args = null)
    {
        if (!$args) {
            return false;
        }

        if (!$this->sessionid) {
            $this->getSessionId();
        }
        $data = ['session', $args, [['AND', 'sessionid = :sessionid', 'sessionid', $this->sessionid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);

        return true;
    }

    //获取会话用户
    public function getSessionUser()
    {
        if ($this->sessionuser) {
            return $this->sessionuser;
        }
        $cookie = $this->strings->decode($this->ev->getCookie($this->sessionname));
        if ($cookie['sessionuserid']) {
            $user = $this->getSessionValue();
            if ($cookie['sessionuserid'] == $user['sessionuserid'] && $cookie['sessionpassword'] == $user['sessionpassword'] && $cookie['sessionip'] == $user['sessionip']) {
                $this->sessionuser = $user;

                return $user;
            }
        }

        return false;
    }

    //清除会话用户
    public function clearSessionUser()
    {
        if (!$this->sessionid) {
            $this->getSessionId();
        }
        $this->ev->setCookie($this->sessionname, null);
        $data = ['session', [['AND', 'sessionid = :sessionid', 'sessionid', $this->sessionid]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    public function offOnlineUser($userid)
    {
        $data = ['session', [['AND', 'sessionuserid = :sessionuserid', 'sessionuserid', $userid]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //清除所有会话
    public function clearSession()
    {
        $data = ['session', [['AND', 1]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //清除超时用户
    public function clearOutTimeUser($time)
    {
        if ($time) {
            $date = $time;
        } else {
            $date = TIME - 24 * 3600;
        }
        $data = ['session', [['AND', 'sessionlogintime < :sessionlogintime', 'sessionlogintime', $date]]];
        $sql = $this->pdosql->makeDelete($data);
        $this->db->exec($sql);

        return true;
    }

    //获取所有会话用户列表
    public function getSessionUserList($page, $number = 20)
    {
        $data = [
            'select'  => false,
            'table'   => 'session',
            'index'   => false,
            'serial'  => false,
            'query'   => [['AND', 'sessionuserid > 0']],
            'orderby' => 'sessionlogintime DESC',
            'groupby' => false,
        ];

        return $this->db->listElements($page, $number, $data);
    }

    public function __destruct()
    {
        $data = ['session', ['sessionlasttime' => TIME], [['AND', 'sessionid = :sessionid', 'sessionid', $this->sessionid]]];
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);
        if (rand(0, 5) > 4) {
            $data = ['session', [['AND', 'sessionlasttime <= :sessionlasttime', 'sessionlasttime', intval((TIME - 3600 * 24 * 3))]]];
            $sql = $this->pdosql->makeDelete($data);
            $this->db->exec($sql);
        }
    }
}
