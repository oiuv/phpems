<?php

ini_set("display_errors", "on");
error_reporting(E_ALL & ~E_NOTICE);

class ginkgo
{
    public $G = array();
    public $L = array();
    public $I = array('app' => array(), 'core' => array());
    public $app;
    public $defaultApp = 'content';

    //对象工厂
    public function make($G, $app = NULL)
    {
        if ($app) return $this->load($G, $app);
        else {
            if (!isset($this->G[$G])) {
                if (file_exists('lib/' . $G . '.cls.php')) {
                    include 'lib/' . $G . '.cls.php';
                } else return false;
                $this->G[$G] = new $G($this);
                if (method_exists($this->G[$G], '_init')) $this->G[$G]->_init();
            }
            return $this->G[$G];
        }

    }

    //加载对象类文件并生成对象
    public function load($G, $app)
    {
        if (!$app) return false;
        $o = $G . '_' . $app;
        if (!isset($this->L[$app][$o])) {
            $fl = 'app/' . $app . '/cls/' . $G . '.cls.php';
            if (file_exists($fl)) {
                include $fl;
            } else return false;
            $this->L[$app][$o] = new $o($this);
            if (method_exists($this->L[$app][$o], '_init')) $this->L[$app][$o]->_init();
        }
        return $this->L[$app][$o];
    }

    //执行页面
    public function run()
    {
        include 'lib/config.inc.php';
        header('P3P: CP=CAO PSA OUR');
        header('Content-Type: text/html; charset=' . HE);
        ini_set('date.timezone', 'Asia/Shanghai');
        date_default_timezone_set("Etc/GMT-8");
        $ev = $this->make('ev');
        $app = $ev->url(0);
        $this->app = $app;
        $this->module = $module = $ev->url(1);
        $this->method = $method = $ev->url(2);
        if (USEWX && $ev->isWeixin()) {
            if (!$_SESSION['openid']) {
                $wxpay = $this->make('wxpay');
                $openid = $wxpay->getwxopenid();
            }

            $this->user = $this->make('user', 'user');
            $this->session = $this->make('session');
            $_user = $this->session->getSessionUser();
            if (!$_user['sessionuserid']) {
                $r = $this->user->autoLoginWxUser($_SESSION['openid']);
                if ($r) {
                    header("location:index.php?" . $this->defaultApp . '-' . $this->module . '&userhash=' . $ev->get('userhash'));
                    exit;
                }
            }

        }
        if (!$app) {
            $this->app = $app = $this->defaultApp;
        }
        if (!$module) $this->module = $module = 'app';
        if (!$method) $this->method = $method = 'index';
        include 'app/' . $app . '/' . $module . '.php';
        $modulefile = 'app/' . $app . '/controller/' . $method . '.' . $module . '.php';
        if (file_exists($modulefile)) {
            include $modulefile;
            $tpl = $this->make('tpl');
            $tpl->assign('_app', $app);
            $tpl->assign('method', $method);
            $run = new action($this);
            $run->display();
        } else die('error:Unknown app to load, the app is ' . $app);
    }

    //加载语言文件
    public function loadLang()
    {
        if (!$this->lang[$this->app]) {
            include 'app/' . $this->app . '/lang/lang.php';
            if (isset($lang)) $this->lang[$this->app] = $lang;
        }
    }

    public function R($message)
    {
        $ev = $this->make('ev');
        if ($ev->get('userhash'))
            exit(json_encode($message));
        else {
            if ($message['callbackType'] == 'forward') {
                if ($message['forwardUrl'])
                    exit("<script>alert('{$message['message']}');window.location = '{$message['forwardUrl']}';</script>");
                else
                    exit("<script>alert('{$message['message']}');window.location = document.referrer+'&'+Math.random();</script>");
            } else
                exit("<script>alert('{$message['message']}');window.location = document.referrer+'&'+Math.random();</script>");
        }
    }
}

?>