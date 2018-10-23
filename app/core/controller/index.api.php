<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
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
                'message' => '错误的邮箱',
            ];
            exit(json_encode($message));
        }
        $action = $this->ev->get('action');
        $user = $this->user->getUserByEmail($email);
        if (!$user && 'reg' != $action) {
            $message = [
                'statusCode' => 300,
                'message' => '该邮箱未注册',
            ];
            exit(json_encode($message));
        }
        if ($user && 'reg' == $action) {
            $message = [
                'statusCode' => 300,
                'message' => '该邮箱已注册',
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
                'message' => '管理员未开启邮箱验证',
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
                'message' => '管理邮箱设置错误，请联系管理员',
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

    private function index()
    {
    }
}
