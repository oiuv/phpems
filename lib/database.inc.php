<?php
/**
 * Created by PhpStorm.
 * User: wuxiaomin
 * Date: 2018/3/14
 * Time: 23:28
 */

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;

$capsule->addConnection([
    'driver'    => 'mysql',
    'host'      => 'localhost',
    'database'  => 'phpems',
    'username'  => 'root',
    'password'  => '',
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => 'x2_',
]);
// Make this Capsule instance available globally via static methods
$capsule->setAsGlobal();
// Setup the Eloquent ORM
$capsule->bootEloquent();


//$users = \Model\User::all();
//$name = Capsule::table('user')->value('username');
//dd($users);