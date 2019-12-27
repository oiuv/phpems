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

set_time_limit(0);
class action extends app
{
    public function display()
    {
        $this->pdo = $this->G->make('pepdo');
        $this->pdo2 = clone $this->pdo;
        $this->pdo2->connect();
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function t()
    {
        $this->sql = $this->G->make('pdosql');
        $this->apps = $this->G->make('apps', 'core');
        $userid = 1;
        $args = [];
        $args[] = ['AND', 'userid = :userid', 'userid', $userid];
        $data = [false, 'user', $args];
        $sql = $this->sql->makeSelect($data);
        print_r($sql);
        $r = $this->pdo->fetch($sql, 'manager_apps');
        print_r($r);
    }

    public function zhw()
    {
        $bs = [
            109 => [1, 1],
            101 => [1, 3],
            102 => [1, 4],
            111 => [1, 5],
            119 => [1, 6],
            105 => [1, 7],
            136 => [1, 8],
            117 => [2, 6],
            115 => [2, 4],
            113 => [2, 7],
            103 => [2, 10],
            121 => [2, 8],
            122 => [2, 9],
            104 => [2, 11],
            135 => [2, 12],
        ];
        $db = $this->G->make('pepdo');
        $pdosql = $this->G->make('pdosql');
        $data = [false, 'openbasics', [], false, false, false];
        $sql = $pdosql->makeSelect($data);
        $rs = $db->fetchAll($sql);
        foreach ($rs as $r) {
            if ($bs[$r['obbasicid']]) {
                $data = ['username', 'users', [['AND', "userid = {$r['obuserid']}"]]];
                $sql = $pdosql->makeSelect($data);
                $u = $db->fetch($sql);
                if ($u) {
                    if (1 == $bs[$r['obbasicid']][0]) {
                        $table = 'openbasics_copy';
                    } else {
                        $table = 'openbasics_copy2';
                    }
                    $args = [];
                    $args['obusername'] = $u['username'];
                    $args['obbasicid'] = $bs[$r['obbasicid']][1];
                    $args['obtime'] = $r['obtime'];
                    $args['obendtime'] = $r['obendtime'];
                    $data = [$table, $args];
                    $sql = $pdosql->makeInsert($data);
                    $db->exec($sql);
                }
            }
        }
        echo 'OK3';
    }

    public function outre()
    {
    }

    public function smtp()
    {
        $smtp = $this->G->make('sendmail');
        $smtp->setServer('smtp.qq.com', '278768688@qq.com', 'thjmltwesfcgcbef', '465', true);
        $smtp->setFrom('278768688@qq.com');
        $smtp->setReceiver('2241223009@qq.com');
        $smtp->setMail('验证码邮件', '您的验证码是2241');
        $smtp->sendMails();
        exit('ok');
    }

    public function sendmail()
    {
        $this->user = $this->G->make('user', 'user');
        $email = $this->ev->get('email');
        if (!$this->G->make('strings')->isEmail($email)) {
            $message = [
                'statusCode' => 300,
                'message'    => '错误的邮箱',
            ];
            exit(json_encode($message));
        }
        $action = $this->ev->get('action');
        $user = $this->user->getUserByEmail($email);
        if (!$user && 'reg' != $action) {
            $message = [
                'statusCode' => 300,
                'message'    => '该邮箱未注册',
            ];
            exit(json_encode($message));
        }
        if ($user && 'reg' == $action) {
            $message = [
                'statusCode' => 300,
                'message'    => '该邮箱已注册',
            ];
            exit(json_encode($message));
        }
        if (!$action) {
            $action = 'findpassword';
        }
        $randcode = rand(1000, 9999);
        $_SESSION['phonerandcode'] = [
            $action => $randcode,
        ];
        $app = $this->G->make('apps', 'core')->getApp('user');
        if (!$app['appsetting']['emailverify']) {
            $message = [
                'statusCode' => 300,
                'message'    => '管理员未开启邮箱验证',
            ];
            exit(json_encode($message));
        }
        if ($app['appsetting']['emailaccount'] && $app['appsetting']['emailpassword']) {
            $smtp = $this->G->make('sendmail');
            //$smtp->setServer('smtp.qq.com','278768688@qq.com','thjmltwesfcgcbef','465',true);
            $smtp->setServer('smtp.qq.com', $app['appsetting']['emailaccount'], $app['appsetting']['emailpassword'], '465', true);
            $smtp->setFrom($app['appsetting']['emailaccount']);
            $smtp->setReceiver($email);
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '管理邮箱设置错误，请联系管理员',
            ];
            exit(json_encode($message));
        }
        if ($user) {
            if ('findpassword' == $action) {
                $smtp->setMail('找回密码验证码', '您的找回密码验证码是'.$randcode);
                $smtp->sendMails();
            }
            $message = [
                'statusCode' => 200,
            ];
        } else {
            if ('reg' == $action) {
                $smtp->setMail('注册验证码', '您的注册验证码是'.$randcode);
                $smtp->sendMails();
            }
            $message = [
                'statusCode' => 200,
            ];
        }
        exit(json_encode($message));
    }

    private function qrcode()
    {
        header('Content-type: image/png');
        require_once 'lib/include/phpqrcode.php';
        $data = urldecode($this->ev->get('data'));
        QRcode::png($data);
    }

    private function basic()
    {
        exit;
        $this->ev = $this->G->make('ev');
        $page = $this->ev->get('page');
        if ($page < 1) {
            $page = 1;
        }
        $start = 1000 * ($page - 1);
        $this->db = $this->G->make('pepdo');
        $this->sql = $this->G->make('pdosql');
        $data = [false, 'user_subject', [], false, false, [$start, 1000]];
        $sql = $this->sql->makeSelect($data);
        $rs = $this->db->fetchAll($sql);
        $garr = [4 => 4, 5 => 1, 8 => 7, 9 => 5, 10 => 6, 11 => 13, 12 => 17, 13 => 16, 14 => 18, 15 => 15, 16 => 12, 17 => 11, 18 => 10, 19 => 9, 20 => 8, 22 => 14];
        $subjects = [
            1 => [
                'id'   => 1,
                'name' => '初级会计实务',
            ],
            4 => [
                'id'   => 2,
                'name' => '初级经济法',
            ],
            5 => [
                'id'   => 3,
                'name' => '中级会计实务',
            ],
            6 => [
                'id'   => 4,
                'name' => '中级经济法',
            ],
            7 => [
                'id'   => 5,
                'name' => '中级财务管理',
            ],
            13 => [
                'id'   => 11,
                'name' => '会计',
            ],
            14 => [
                'id'   => 12,
                'name' => '经济法',
            ],
            15 => [
                'id'   => 13,
                'name' => '税法',
            ],
            16 => [
                'id'   => 14,
                'name' => '财务成本管理',
            ],
            17 => [
                'id'   => 15,
                'name' => '审计',
            ],
            18 => [
                'id'   => 16,
                'name' => '公司战略与风险管理',
            ],
        ];
        foreach ($rs as $r) {
            if ($r['sub_status']) {
                $args = [];
                $mdata = [false, 'user', [['AND', 'userid = :userid', 'userid', $r['userid']]]];
                $sql = $this->sql->makeSelect($mdata);
                $u = $this->db->fetch($sql);
                $args['obusername'] = $u['userphone'];
                $args['obbasicid'] = $garr[$r['subjectid']];
                $args['obtime'] = $r['activation_time'];
                $args['obendtime'] = $r['expiry_date'];
                $ddata = ['openbasics', $args];
                $sql = $this->sql->makeInsert($ddata);
                $this->db->exec($sql);
            } else {
                $args = [];
                $mdata = [false, 'user', [['AND', 'userid = :userid', 'userid', $r['userid']]]];
                $sql = $this->sql->makeSelect($mdata);
                $u = $this->db->fetch($sql);
                $args['activeusername'] = $u['userphone'];
                $args['activebasicid'] = $garr[$r['subjectid']];
                $args['activesubjectid'] = $subjects[$args['activebasicid']]['id'];
                $args['activename'] = $subjects[$args['activebasicid']]['name'];
                $args['activetime'] = $r['expiry_day'];
                $args['activestatus'] = 0;
                $ddata = ['actives', $args];
                $sql = $this->sql->makeInsert($ddata);
                $this->db->exec($sql);
            }
        }
        $page++;
        echo 'ok';
        if (count($rs) > 0) {
            echo '<script>window.location = "index.php?core-api-index-basic&page='.$page.'"</script>';
        }
    }

    private function index()
    {
        exit;
        $this->db = $this->G->make('pepdo');
        $this->sql = $this->G->make('pdosql');
        $data = [false, 'user', [], false, false, false];
        $sql = $this->sql->makeSelect($data);
        $rs = $this->db->fetchAll($sql);
        $garr = [1 => 'webmaster', 8 => 'customer', 9 => 'teacher', 13 => 'agent', 15 => 'regional'];
        foreach ($rs as $r) {
            $args = [];
            if ($r['userphone']) {
                $args['username'] = $r['userphone'];
                $args['usernick'] = $r['username'];
                $args['userphone'] = $r['userphone'];
                if ($r['useremail']) {
                    $args['useremail'] = $r['useremail'];
                } else {
                    $args['useremail'] = $r['userphone'].'@139.com';
                }
                $args['userpassword'] = $r['userpassword'];
                $args['userrealname'] = $r['usertruename'];
                $args['usergroupcode'] = $garr[$r['usergroupid']];
                $args['userregtime'] = $r['userregtime'];
                if (13 == $r['usergroupid']) {
                    $args['usercoin'] = $r['money'];
                    $args['userrate'] = $r['split_ratio'];
                    if ($r['agent_userid']) {
                        $mdata = [false, 'user', [['AND', 'userid = :userid', 'userid', $r['agent_userid']]]];
                        $sql = $this->sql->makeSelect($mdata);
                        $u = $this->db->fetch($sql);
                        $args['useragent'] = $u['userphone'];
                    }
                }
                $ddata = ['users', $args];
                $sql = $this->sql->makeInsert($ddata);
                $this->db->exec($sql);
            }
        }
        echo 'ok';
    }
}
