<?php

session_start();
set_time_limit(0);
$t1 = microtime();
define("PE_VERSION", '5.0');
require __DIR__.'/vendor/autoload.php';
require __DIR__.'/lib/init.cls.php';

$ginkgo = new ginkgo;
$ginkgo->run();
//echo $t2[0]- $t1[0];
