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

use OSS\Core\OssException;
use OSS\Model\LoggingConfig;

require_once __DIR__.DIRECTORY_SEPARATOR.'TestOssClientBase.php';

class OssClientBucketLoggingTest extends TestOssClientBase
{
    public function testBucket()
    {
        $loggingConfig = new LoggingConfig($this->bucket, 'prefix');

        try {
            $this->ossClient->putBucketLogging($this->bucket, $this->bucket, 'prefix');
        } catch (OssException $e) {
            var_dump($e->getMessage());
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $loggingConfig2 = $this->ossClient->getBucketLogging($this->bucket);
            $this->assertSame($loggingConfig->serializeToXml(), $loggingConfig2->serializeToXml());
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $this->ossClient->deleteBucketLogging($this->bucket);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $loggingConfig3 = $this->ossClient->getBucketLogging($this->bucket);
            $this->assertNotSame($loggingConfig->serializeToXml(), $loggingConfig3->serializeToXml());
        } catch (OssException $e) {
            $this->assertTrue(false);
        }
    }
}
