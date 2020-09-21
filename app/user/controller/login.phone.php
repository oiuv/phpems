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

    private function index()
    {
        if ($this->_user['sessionuserid']) {
            $message = [
                'statusCode'   => 200,
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?core-phone',
            ];
            $this->G->R($message);
        }
        $appid = 'user';
        $app = $this->G->make('apps', 'core')->getApp($appid);
        $this->tpl->assign('app', $app);
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
                    if (1 == $app['appsetting']['loginmodel']) {
                        $this->session->offOnlineUser($user['userid']);
                    }
                    $this->session->setSessionUser(['sessionuserid' => $user['userid'], 'sessionpassword' => $user['userpassword'], 'sessionip' => $this->ev->getClientIp(), 'sessiongroupid' => $user['usergroupid'], 'sessionlogintime' => TIME, 'sessionusername' => $user['username']]);
                    $message = [
                        'statusCode'   => 201,
                        'message'      => '操作成功',
                        'callbackType' => 'forward',
                        'forwardUrl'   => 'index.php?core-phone',
                    ];
                    $this->G->R($message);
                }

                $message = [
                    'statusCode' => 300,
                    'errorinput' => 'args[username]',
                    'message'    => '操作失败',
                ];
                exit(json_encode($message));
            }

            $message = [
                'statusCode' => 300,
                'errorinput' => 'args[username]',
                'message'    => '操作失败',
            ];
            exit(json_encode($message));
        }

        $this->tpl->display('login');
    }
}
