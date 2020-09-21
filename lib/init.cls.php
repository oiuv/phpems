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

if (DEBUG) {
    ini_set('display_errors', 1);
    error_reporting(E_ALL ^ E_NOTICE);
} else {
    ini_set('display_errors', 0);
    error_reporting(0);
}

class ginkgo
{
    public $G = [];
    public $L = [];
    public $I = ['app' => [], 'core' => []];
    public $app;
    public $defaultApp = 'core';

    //对象工厂

    public function __construct()
    {
        include PEPATH.'/lib/config.inc.php';
        header('P3P: CP=CAO PSA OUR');
        header('Content-Type: text/html; charset='.HE);
        ini_set('date.timezone', 'Asia/Shanghai');
        date_default_timezone_set('Etc/GMT-8');
    }

    /**
     * @param $G
     * @param null $app
     *
     * @return static
     */
    public function make($G, $app = null)
    {
        if ($app) {
            return $this->load($G, $app);
        }

        if (!isset($this->G[$G])) {
            if (file_exists(PEPATH.'/lib/'.$G.'.cls.php')) {
                include_once PEPATH.'/lib/'.$G.'.cls.php';
            } else {
                return false;
            }
            $this->G[$G] = new $G($this);
            if (method_exists($this->G[$G], '_init')) {
                $this->G[$G]->_init();
            }
        }

        return $this->G[$G];
    }

    //加载对象类文件并生成对象

    /**
     * @param $G
     * @param null $app
     *
     * @return static
     */
    public function load($G, $app)
    {
        if (!$app) {
            return false;
        }
        $o = $G.'_'.$app;
        if (!isset($this->L[$app][$o])) {
            $fl = PEPATH.'/app/'.$app.'/cls/'.$G.'.cls.php';
            if (file_exists($fl)) {
                include $fl;
            } else {
                return false;
            }
            $this->L[$app][$o] = new $o($this);
            if (method_exists($this->L[$app][$o], '_init')) {
                $this->L[$app][$o]->_init();
            }
        }

        return $this->L[$app][$o];
    }

    //执行页面
    public function run()
    {
        $ev = $this->make('ev');
        $app = $ev->url(0);
        $this->app = $app;
        $this->module = $module = $ev->url(1);
        $this->method = $method = $ev->url(2);
        /*
        if (USEWX && $ev->isWeixin()) {
            if (!$_SESSION['openid']) {
                $wxpay = $this->make('wxpay');
                $openid = $wxpay->getwxopenid();
            }

            $this->user = $this->make('user','user');
            $this->session = $this->make('session');
            $_user = $this->session->getSessionUser();
            if(!$_user['sessionuserid'])
            {
                $r = $this->user->autoLoginWxUser($_SESSION['openid']);
                if($r)
                {
                    header("location:index.php?".$this->defaultApp.'-'.$this->module.'&userhash='.$ev->get('userhash'));
                    exit;
                }
            }
        }
        */
        if (!$app) {
            $this->app = $app = $this->defaultApp;
        }
        if (!$module) {
            $this->module = $module = 'app';
        }
        if (!$method) {
            $this->method = $method = 'index';
        }
        include PEPATH.'/app/'.$app.'/'.$module.'.php';

        $modulefile = PEPATH.'/app/'.$app.'/controller/'.$method.'.'.$module.'.php';
        if (file_exists($modulefile)) {
            include $modulefile;
            $tpl = $this->make('tpl');
            $tpl->assign('_app', $app);
            $tpl->assign('method', $method);
            $run = new action($this);
            $run->display();
        } else {
            exit('error:Unknown app to load, the app is '.$app);
        }
    }

    //加载语言文件
    public function loadLang()
    {
        if (!$this->lang[$this->app]) {
            include PEPATH.'/app/'.$this->app.'/lang/lang.php';
            if (isset($lang)) {
                $this->lang[$this->app] = $lang;
            }
        }
    }

    public function R($message)
    {
        $ev = $this->make('ev');
        if ($ev->get('userhash')) {
            exit(json_encode($message));
        }

        if ('forward' == $message['callbackType']) {
            if ($message['forwardUrl']) {
                exit("<script>window.location = '{$message['forwardUrl']}';</script>");
            }

            exit("<script>window.location = document.referrer+'&'+Math.random();</script>");
        }

        exit("<script>window.location = document.referrer+'&'+Math.random();</script>");
    }
}
