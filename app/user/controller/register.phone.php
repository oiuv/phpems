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
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function findpassword()
    {
        $appid = 'user';
        $app = $this->G->make('apps', 'core')->getApp($appid);
        $this->tpl->assign('app', $app);
        if (!$app['appsetting']['emailverify']) {
            $message = [
                'statusCode' => 300,
                'message'    => '开通邮箱验证才能找回密码',
            ];
            exit(json_encode($message));
        }
        if ($this->ev->get('findpassword')) {
            $randcode = $this->ev->get('randcode');
            if ((!$randcode) || ($randcode != $_SESSION['phonerandcode']['findpassword'])) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '验证码错误',
                ];
                exit(json_encode($message));
            }

            $_SESSION['phonerandcode']['findpassword'] = 0;

            $args = $this->ev->get('args');
            $username = $args['username'];
            $user = $this->user->getUserByUserName($username);
            if (!$user) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '此用户未注册',
                ];
                exit(json_encode($message));
            }
            if (($user['useremail'] != $args['useremail']) || ($user['useremail'] != $_SESSION['phonerandcode']['email'])) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '邮箱与用户不对应',
                ];
                exit(json_encode($message));
            }
            $this->user->modifyUserPassword($user['userid'], ['password' => $args['userpassword']]);
            $message = [
                'statusCode'   => 200,
                'message'      => '密码修改成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?user-phone-login',
            ];
            exit(json_encode($message));
        }

        $this->tpl->display('findpassword');
    }

    private function index()
    {
        $appid = 'user';
        $app = $this->G->make('apps', 'core')->getApp($appid);
        $this->tpl->assign('app', $app);
        $fields = [];
        $tpfields = explode(',', $app['appsetting']['regfields']);
        foreach ($tpfields as $f) {
            $tf = $this->module->getFieldByNameAndModuleid($f);
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
            $id = $this->user->insertUser($fargs);
            $this->session->setSessionUser(['sessionuserid' => $id, 'sessionpassword' => md5($args['userpassword']), 'sessionip' => $this->ev->getClientIp(), 'sessiongroupid' => $defaultgroup['groupid'], 'sessionlogintime' => TIME, 'sessionusername' => $username]);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?core-phone',
            ];
            exit(json_encode($message));
        }

        $forms = $this->html->buildHtml($fields);
        $this->tpl->assign('forms', $forms);
        $this->tpl->display('register');
    }
}
