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

error_reporting(E_ALL | E_NOTICE);

require_once __DIR__.'/Bucket.php';
require_once __DIR__.'/BucketCors.php';
require_once __DIR__.'/BucketLifecycle.php';
require_once __DIR__.'/BucketReferer.php';
require_once __DIR__.'/BucketLogging.php';
require_once __DIR__.'/BucketWebsite.php';
require_once __DIR__.'/Signature.php';
require_once __DIR__.'/Object1.php';
require_once __DIR__.'/MultipartUpload.php';
