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
use OSS\Model\RefererConfig;

require_once __DIR__.DIRECTORY_SEPARATOR.'TestOssClientBase.php';

class OssClientBucketRefererTest extends TestOssClientBase
{
    public function testBucket()
    {
        $refererConfig = new RefererConfig();
        $refererConfig->addReferer('http://www.aliyun.com');

        try {
            $this->ossClient->putBucketReferer($this->bucket, $refererConfig);
        } catch (OssException $e) {
            var_dump($e->getMessage());
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $refererConfig2 = $this->ossClient->getBucketReferer($this->bucket);
            $this->assertSame($refererConfig->serializeToXml(), $refererConfig2->serializeToXml());
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $nullRefererConfig = new RefererConfig();
            $nullRefererConfig->setAllowEmptyReferer(false);
            $this->ossClient->putBucketReferer($this->bucket, $nullRefererConfig);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $refererConfig3 = $this->ossClient->getBucketLogging($this->bucket);
            $this->assertNotSame($refererConfig->serializeToXml(), $refererConfig3->serializeToXml());
        } catch (OssException $e) {
            $this->assertTrue(false);
        }
    }
}
