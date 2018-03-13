<?php


session_start();
set_time_limit(0);
$t1 = microtime();
define("PE_VERSION", '4.2');
require "lib/init.cls.php";
require "vendor/autoload.php";

$ginkgo = new ginkgo;
$ginkgo->run();
//echo $t2[0]- $t1[0];
?>