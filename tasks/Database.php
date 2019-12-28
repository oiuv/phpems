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

require __DIR__.'/../vendor/autoload.php';

use Illuminate\Database\Capsule\Manager as DB;

class Database
{
    // 运行迁移
    public static function migrate()
    {
        $table = 'test_table';
        // 判断数据表是否存在
        if (DB::schema()->hasTable($table)) {
            // 在已有数据表上创建字段
            DB::schema()->table($table, function ($table) {
                $table->string('mobile')->after('email');
            });
        } else {
            // 创建数据表
            DB::schema()->create($table, function ($table) {
                $table->increments('id');
                $table->string('email')->unique();
                $table->timestamps();
            });
        }
    }

    // 回滚迁移
    public static function rollback()
    {
        $table = 'test_table';
        // 删除数据表
        DB::schema()->dropIfExists($table);
        // 删除数据表中的字段
        if (DB::schema()->hasTable($table)) {
            DB::schema()->table($table, function ($table) {
                $table->dropColumn(['mobile']);
            });
        }
    }

    // 重命名数据表
    public static function rename()
    {
        $table = 'test_table';
        if (DB::schema()->hasTable($table)) {
            DB::schema()->rename($table, 'test_demo');
        }
    }

    // 升级数据库
    public static function up()
    {
        // todo
    }

    // 降级数据库
    public static function down()
    {
        // todo
    }
}

if (isset($_GET['action'])) {
    switch ($_GET['action']) {
        case 'migrate':
            try {
                Database::migrate();
                echo '数据库迁移成功';
            } catch (PDOException $exception) {
                echo $exception->getMessage();
            }
            break;
        case 'rollback':
            try {
                Database::rollback();
                echo '数据库滚回成功';
            } catch (PDOException $exception) {
                echo $exception->getMessage();
            }
            break;
        default:
            echo '没有数据库迁移操作';
    }
} else {
    echo "<a href='https://learnku.com/docs/laravel/6.x/migrations/5173#tables' target='_blank'>数据库迁移操作指南</a>";
}
