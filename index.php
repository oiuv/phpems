<?php

session_start();
set_time_limit(0);
define("PE_VERSION", '5.0');
require __DIR__.'/vendor/autoload.php';
require __DIR__.'/lib/init.cls.php';

$ginkgo = new ginkgo;
$ginkgo->run();
