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

class action extends app
{
    public function display()
    {
        $this->wxpay = $this->G->make('wxpay');
        $this->login = $this->G->make('login', 'weixin');
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function pclogin()
    {
        if (!$_SESSION['autosessionid']) {
            $sessionid = $this->ev->get('sessionid');
            $_SESSION['autosessionid'] = $sessionid;
        } else {
            $sessionid = $_SESSION['autosessionid'];
        }
        $openid = $this->wxpay->getwxopenid(true);
        $user = $this->user->getUserByOpenId($openid);
        if ($user) {
            $args = [
                'wxsid'   => $sessionid,
                'wxinfo'  => $user,
                'wxtime'  => TIME,
                'wxtoken' => md5($sessionid.CS),
            ];
            $this->login->addLogin($args);
        } else {
            if (WXAUTOREG) {
                $wxuser = $this->wxpay->getUserInfo();
                $username = 'wx_'.uniqid();
                $defaultgroup = $this->user->getDefaultGroup();
                $args = [
                    'useropenid'   => $openid,
                    'usertruename' => $wxuser['nickname'],
                    'username'     => $username,
                    'useremail'    => $username.EP,
                    'usergroupid'  => $defaultgroup['groupid'],
                    'userpassword' => md5($username),
                    'userphoto'    => $wxuser['headimgurl'],
                ];
                $this->user->insertUser($args);
                $user = $this->user->getUserByOpenId($openid);
                $args = [
                    'wxsid'   => $sessionid,
                    'wxinfo'  => $user,
                    'wxtime'  => TIME,
                    'wxtoken' => md5($sessionid.CS),
                ];
                $this->login->addLogin($args);
            } else {
                $_SESSION['bindopenid'] = $openid;
                $_SESSION['bindtype'] = 'pc';
                header('location:index.php?weixin-phone-index-bindlogin');
                exit;
            }
        }
        $_SESSION['autosessionid'] = null;
        $this->tpl->assign('user', $user);
        $this->tpl->display('pclogin');
    }

    private function bindlogin()
    {
        if ($this->ev->get('userlogin')) {
            $tmp = $this->session->getSessionValue();
            if (TIME - $tmp['sessionlasttime'] < 1) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败',
                ];
                exit(json_encode($message));
            }
            $args = $this->ev->get('args');
            $user = $this->user->getUserByUserName($args['username']);
            if ($user['userid']) {
                if ($user['userpassword'] == md5($args['userpassword'])) {
                    $this->user->modifyUserInfo($user['userid'], ['useropenid' => $_SESSION['bindopenid']]);
                    if ('pc' == $_SESSION['bindtype']) {
                        $args = [
                            'wxsid'   => $_SESSION['autosessionid'],
                            'wxinfo'  => $user,
                            'wxtime'  => TIME,
                            'wxtoken' => md5($_SESSION['autosessionid'].CS),
                        ];
                        $this->login->addLogin($args);
                        $_SESSION['bindopenid'] = null;
                        $_SESSION['bindtype'] = null;
                        $_SESSION['autosessionid'] = null;
                        $this->tpl->assign('user', $user);
                        $this->tpl->display('pclogin');
                    } else {
                        $this->session->setSessionUser(['sessionuserid' => $user['userid'], 'sessionpassword' => $user['userpassword'], 'sessionip' => $this->ev->getClientIp(), 'sessiongroupid' => $user['usergroupid'], 'sessionlogintime' => TIME, 'sessionusername' => $user['username']]);
                        $_SESSION['bindopenid'] = null;
                        $_SESSION['bindtype'] = null;
                        $message = [
                            'statusCode'   => 201,
                            'message'      => '操作成功',
                            'callbackType' => 'forward',
                            'forwardUrl'   => 'index.php?core-phone',
                        ];
                        $this->G->R($message);
                    }
                } else {
                    $message = [
                        'statusCode' => 300,
                        'errorinput' => 'args[username]',
                        'message'    => '操作失败',
                    ];
                    exit(json_encode($message));
                }
            } else {
                $message = [
                    'statusCode' => 300,
                    'errorinput' => 'args[username]',
                    'message'    => '操作失败',
                ];
                exit(json_encode($message));
            }
        } else {
            $this->tpl->display('login');
        }
    }

    private function bindregister()
    {
        $appid = 'user';
        $app = $this->G->make('apps', 'core')->getApp($appid);
        $this->tpl->assign('app', $app);
        $fields = [];
        $tpfields = explode(',', $app['appsetting']['regfields']);
        foreach ($tpfields as $f) {
            $tf = $this->G->make('module')->getFieldByNameAndModuleid($f);
            if ($tf && 'user' == $tf['fieldappid']) {
                $fields[$tf['fieldid']] = $tf;
            }
        }
        if ($this->ev->get('userregister')) {
            if ($app['appsetting']['closeregist']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '管理员禁止了用户注册',
                ];
                $this->G->R($message);
            }
            $fob = ['admin', '管理员', '站长'];
            $args = $this->ev->get('args');
            $defaultgroup = $this->user->getDefaultGroup();
            if (!$defaultgroup['groupid'] || !trim($args['username'])) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '用户不能注册',
                ];
                exit(json_encode($message));
            }
            if ($app['appsetting']['emailverify']) {
                $randcode = $this->ev->get('randcode');
                if ((!$randcode) || ($randcode != $_SESSION['phonerandcode']['reg'])) {
                    $message = [
                        'statusCode' => 300,
                        'message'    => '验证码错误',
                    ];
                    exit(json_encode($message));
                }

                $_SESSION['phonerandcode']['reg'] = 0;
            }
            $username = $args['username'];
            foreach ($fob as $f) {
                if (false !== strpos($username, $f)) {
                    $message = [
                        'statusCode' => 300,
                        'message'    => '用户已经存在',
                    ];
                    exit(json_encode($message));
                }
            }
            $user = $this->user->getUserByUserName($username);
            if ($user) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '用户已经存在',
                ];
                exit(json_encode($message));
            }
            $email = $args['useremail'];
            $user = $this->user->getUserByEmail($email);
            if ($user) {
                $message = [
                    'statusCode' => 300,
                    'errorinput' => 'args[username]',
                    'message'    => '邮箱已经被注册',
                ];
                exit(json_encode($message));
            }
            $fargs = ['username' => $username, 'usergroupid' => $defaultgroup['groupid'], 'userpassword' => md5($args['userpassword']), 'useremail' => $email];
            foreach ($fields as $key => $p) {
                $fargs[$p['field']] = $args[$p['field']];
            }
            $fargs['useropenid'] = $_SESSION['bindopenid'];
            $id = $this->user->insertUser($fargs);
            $user = $this->user->getUserById($id);
            if ('pc' == $_SESSION['bindtype']) {
                $args = [
                    'wxsid'   => $_SESSION['autosessionid'],
                    'wxinfo'  => $user,
                    'wxtime'  => TIME,
                    'wxtoken' => md5($_SESSION['autosessionid'].CS),
                ];
                $this->login->addLogin($args);
                $_SESSION['bindopenid'] = null;
                $_SESSION['bindtype'] = null;
                $_SESSION['autosessionid'] = null;
                $this->tpl->assign('user', $user);
                $this->tpl->display('pclogin');
            } else {
                $this->session->setSessionUser(['sessionuserid' => $user['userid'], 'sessionpassword' => $user['userpassword'], 'sessionip' => $this->ev->getClientIp(), 'sessiongroupid' => $user['usergroupid'], 'sessionlogintime' => TIME, 'sessionusername' => $user['username']]);
                $_SESSION['bindopenid'] = null;
                $_SESSION['bindtype'] = null;
                $message = [
                    'statusCode'   => 201,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?core-phone',
                ];
                $this->G->R($message);
            }
        } else {
            $this->html = $this->G->make('html');
            $forms = $this->html->buildHtml($fields);
            $this->tpl->assign('forms', $forms);
            $this->tpl->display('register');
        }
    }

    private function getopenid()
    {
        if ($this->_user['sessionuserid']) {
            header('location:index.php');
            exit;
        }
        $openid = $this->wxpay->getwxopenid();
        $user = $this->user->autoLoginWxUser($openid);
        if (!$user) {
            if (WXAUTOREG) {
                $wxuser = $this->wxpay->getUserInfo();
                $username = 'wx_'.uniqid();
                $defaultgroup = $this->user->getDefaultGroup();
                $args = [
                    'useropenid'   => $openid,
                    'usertruename' => $wxuser['nickname'],
                    'username'     => $username,
                    'useremail'    => $username.EP,
                    'usergroupid'  => $defaultgroup['groupid'],
                    'userpassword' => md5($username),
                    'userphoto'    => $wxuser['headimgurl'],
                ];
                $this->user->insertUser($args);
                $user = $this->user->autoLoginWxUser($openid);
            } else {
                $_SESSION['bindopenid'] = $openid;
                header('location:index.php?weixin-phone-index-bindlogin');
                exit;
            }
        }
        header('location:index.php');
        exit;
    }

    private function index()
    {
    }
}
