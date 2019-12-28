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
use OSS\Model\LifecycleAction;
use OSS\Model\LifecycleConfig;
use OSS\Model\LifecycleRule;

require_once __DIR__.DIRECTORY_SEPARATOR.'TestOssClientBase.php';

class OssClientBucketLifecycleTest extends TestOssClientBase
{
    public function testBucket()
    {
        $lifecycleConfig = new LifecycleConfig();
        $actions = [];
        $actions[] = new LifecycleAction('Expiration', 'Days', 3);
        $lifecycleRule = new LifecycleRule('delete obsoleted files', 'obsoleted/', 'Enabled', $actions);
        $lifecycleConfig->addRule($lifecycleRule);
        $actions = [];
        $actions[] = new LifecycleAction('Expiration', 'Date', '2022-10-12T00:00:00.000Z');
        $lifecycleRule = new LifecycleRule('delete temporary files', 'temporary/', 'Enabled', $actions);
        $lifecycleConfig->addRule($lifecycleRule);

        try {
            $this->ossClient->putBucketLifecycle($this->bucket, $lifecycleConfig);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $lifecycleConfig2 = $this->ossClient->getBucketLifecycle($this->bucket);
            $this->assertSame($lifecycleConfig->serializeToXml(), $lifecycleConfig2->serializeToXml());
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $this->ossClient->deleteBucketLifecycle($this->bucket);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $lifecycleConfig3 = $this->ossClient->getBucketLifecycle($this->bucket);
            $this->assertNotSame($lifecycleConfig->serializeToXml(), $lifecycleConfig3->serializeToXml());
        } catch (OssException $e) {
            $this->assertTrue(false);
        }
    }
}
