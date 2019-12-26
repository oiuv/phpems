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
use OSS\Model\WebsiteConfig;

require_once __DIR__.DIRECTORY_SEPARATOR.'TestOssClientBase.php';

class OssClientBucketWebsiteTest extends TestOssClientBase
{
    public function testBucket()
    {
        $websiteConfig = new WebsiteConfig('index.html', 'error.html');

        try {
            $this->ossClient->putBucketWebsite($this->bucket, $websiteConfig);
        } catch (OssException $e) {
            var_dump($e->getMessage());
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $websiteConfig2 = $this->ossClient->getBucketWebsite($this->bucket);
            $this->assertSame($websiteConfig->serializeToXml(), $websiteConfig2->serializeToXml());
        } catch (OssException $e) {
            $this->assertTrue(false);
        }
        try {
            Common::waitMetaSync();
            $this->ossClient->deleteBucketWebsite($this->bucket);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }
        try {
            Common::waitMetaSync();
            $websiteConfig3 = $this->ossClient->getBucketLogging($this->bucket);
            $this->assertNotSame($websiteConfig->serializeToXml(), $websiteConfig3->serializeToXml());
        } catch (OssException $e) {
            $this->assertTrue(false);
        }
    }
}
