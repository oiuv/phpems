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

require_once __DIR__.DIRECTORY_SEPARATOR.'TestOssClientBase.php';

class OssClientBucketStorageCapacityTest extends TestOssClientBase
{
    public function testBucket()
    {
        try {
            $storageCapacity = $this->ossClient->getBucketStorageCapacity($this->bucket);
            $this->assertSame($storageCapacity, -1);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            $this->ossClient->putBucketStorageCapacity($this->bucket, 1000);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            Common::waitMetaSync();
            $storageCapacity = $this->ossClient->getBucketStorageCapacity($this->bucket);
            $this->assertSame($storageCapacity, 1000);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        try {
            $this->ossClient->putBucketStorageCapacity($this->bucket, 0);

            Common::waitMetaSync();

            $storageCapacity = $this->ossClient->getBucketStorageCapacity($this->bucket);
            $this->assertSame($storageCapacity, 0);

            $this->ossClient->putObject($this->bucket, 'test-storage-capacity', 'test-content');
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('Bucket storage exceed max storage capacity.', $e->getErrorMessage());
        }

        try {
            $this->ossClient->putBucketStorageCapacity($this->bucket, -2);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame(400, $e->getHTTPStatus());
            $this->assertSame('InvalidArgument', $e->getErrorCode());
        }
    }
}
