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

require_once __DIR__.'/Common.php';

use OSS\Core\OssException;
use OSS\OssClient;

$bucket = Common::getBucketName();
$ossClient = Common::getOssClient();
if (is_null($ossClient)) {
    exit(1);
}

//*******************************Simple Usage ***************************************************************

// Set bucket access logging rules. Access logs are stored under the same bucket with a 'access.log' prefix.
$ossClient->putBucketLogging($bucket, $bucket, 'access.log', []);
Common::println("bucket $bucket lifecycleConfig created");

// Get bucket access logging rules
$loggingConfig = $ossClient->getBucketLogging($bucket, []);
Common::println("bucket $bucket lifecycleConfig fetched:".$loggingConfig->serializeToXml());

// Delete bucket access logging rules
$loggingConfig = $ossClient->getBucketLogging($bucket, []);
Common::println("bucket $bucket lifecycleConfig deleted");

//******************************* For complete usage, see the following functions ****************************************************

putBucketLogging($ossClient, $bucket);
getBucketLogging($ossClient, $bucket);
deleteBucketLogging($ossClient, $bucket);
getBucketLogging($ossClient, $bucket);

/**
 * Set bucket logging configuration.
 *
 * @param OssClient $ossClient OssClient instance
 * @param string    $bucket    bucket name
 *
 * @return null
 */
function putBucketLogging($ossClient, $bucket)
{
    $option = [];
    // Access logs are stored in the same bucket.
    $targetBucket = $bucket;
    $targetPrefix = 'access.log';

    try {
        $ossClient->putBucketLogging($bucket, $targetBucket, $targetPrefix, $option);
    } catch (OssException $e) {
        printf(__FUNCTION__.": FAILED\n");
        printf($e->getMessage()."\n");

        return;
    }
    echo __FUNCTION__.': OK'."\n";
}

/**
 * Get bucket logging configuration.
 *
 * @param OssClient $ossClient OssClient instance
 * @param string    $bucket    bucket name
 *
 * @return null
 */
function getBucketLogging($ossClient, $bucket)
{
    $loggingConfig = null;
    $options = [];

    try {
        $loggingConfig = $ossClient->getBucketLogging($bucket, $options);
    } catch (OssException $e) {
        printf(__FUNCTION__.": FAILED\n");
        printf($e->getMessage()."\n");

        return;
    }
    echo __FUNCTION__.': OK'."\n";
    echo $loggingConfig->serializeToXml()."\n";
}

/**
 * Delete bucket logging configuration.
 *
 * @param OssClient $ossClient OssClient instance
 * @param string    $bucket    bucket name
 *
 * @return null
 */
function deleteBucketLogging($ossClient, $bucket)
{
    try {
        $ossClient->deleteBucketLogging($bucket);
    } catch (OssException $e) {
        printf(__FUNCTION__.": FAILED\n");
        printf($e->getMessage()."\n");

        return;
    }
    echo __FUNCTION__.': OK'."\n";
}
