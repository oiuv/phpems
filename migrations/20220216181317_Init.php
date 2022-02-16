<?php

use Phpmig\Migration\Migration;
use Thamaraiselvam\MysqlImport\Import;

class Init extends Migration
{
    /**
     * Do the migration
     */
    public function up()
    {
        $filename = __DIR__ . '/phpems.sql';
        $username = DU;
        $password = DP;
        $database = DB;
        $host = DH;
        new Import($filename, $username, $password, $database, $host);
    }

    /**
     * Undo the migration
     */
    public function down()
    {
    }
}
