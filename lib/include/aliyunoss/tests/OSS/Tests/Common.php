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

namespace OSS\Tests;

require_once __DIR__.'/../../../autoload.php';

use OSS\Core\OssException;
use OSS\OssClient;

/**
 * Class Common.
 *
 * Sample program [Samples / *. Php] Common class, used to obtain OssClient instance and other public methods
 */
class Common
{
    /**
     * According to the Config configuration, get an OssClient instance.
     *
     * @return OssClient An OssClient instance
     */
    public static function getOssClient()
    {
        try {
            $ossClient = new OssClient(
                getenv('OSS_ACCESS_KEY_ID'),
                getenv('OSS_ACCESS_KEY_SECRET'),
                getenv('OSS_ENDPOINT'), false);
        } catch (OssException $e) {
            printf(__FUNCTION__."creating OssClient instance: FAILED\n");
            printf($e->getMessage()."\n");

            return;
        }

        return $ossClient;
    }

    public static function getBucketName()
    {
        return getenv('OSS_BUCKET');
    }

    /**
     * Tool method, create a bucket.
     */
    public static function createBucket()
    {
        $ossClient = self::getOssClient();
        if (is_null($ossClient)) {
            exit(1);
        }
        $bucket = self::getBucketName();
        $acl = OssClient::OSS_ACL_TYPE_PUBLIC_READ;

        try {
            $ossClient->createBucket($bucket, $acl);
        } catch (OssException $e) {
            printf(__FUNCTION__.": FAILED\n");
            printf($e->getMessage()."\n");

            return;
        }
        echo __FUNCTION__.': OK'."\n";
    }

    /**
     * Wait for bucket meta sync.
     */
    public static function waitMetaSync()
    {
        if (getenv('TRAVIS')) {
            sleep(10);
        }
    }
}
