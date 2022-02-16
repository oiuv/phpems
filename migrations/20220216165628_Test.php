<?php

use Phpmig\Migration\Migration;
use Illuminate\Database\Capsule\Manager as DB;

class Test extends Migration
{
    /**
     * Do the migration
     */
    public function up()
    {
        $table = 'test';
        // 创建数据表
        DB::schema()->create($table, function ($table) {
            $table->increments('id');
            $table->string('email')->unique();
            $table->timestamps();
        });
    }

    /**
     * Undo the migration
     */
    public function down()
    {
        $table = 'test';
        // 删除数据表
        DB::schema()->dropIfExists($table);
    }
}
