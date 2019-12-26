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
use OSS\OssClient;

require_once __DIR__.DIRECTORY_SEPARATOR.'TestOssClientBase.php';

class OssClientRestoreObjectTest extends TestOssClientBase
{
    private $iaBucket;
    private $archiveBucket;

    public function testIARestoreObject()
    {
        $object = 'storage-object';

        $this->ossClient->putObject($this->iaBucket, $object, 'testcontent');
        try {
            $this->ossClient->restoreObject($this->iaBucket, $object);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('400', $e->getHTTPStatus());
            $this->assertSame('OperationNotSupported', $e->getErrorCode());
        }
    }

    public function testNullObjectRestoreObject()
    {
        $object = 'null-object';

        try {
            $this->ossClient->restoreObject($this->bucket, $object);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('404', $e->getHTTPStatus());
        }
    }

    public function testArchiveRestoreObject()
    {
        $object = 'storage-object';

        $this->ossClient->putObject($this->archiveBucket, $object, 'testcontent');
        try {
            $this->ossClient->getObject($this->archiveBucket, $object);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('403', $e->getHTTPStatus());
            $this->assertSame('InvalidObjectState', $e->getErrorCode());
        }
        $result = $this->ossClient->restoreObject($this->archiveBucket, $object);
        common::waitMetaSync();
        $this->assertSame('202', $result['info']['http_code']);

        try {
            $this->ossClient->restoreObject($this->archiveBucket, $object);
        } catch (OssException $e) {
            $this->assertSame('409', $e->getHTTPStatus());
            $this->assertSame('RestoreAlreadyInProgress', $e->getErrorCode());
        }
    }

    public function setUp()
    {
        parent::setUp();

        $this->iaBucket = 'ia-'.$this->bucket;
        $this->archiveBucket = 'archive-'.$this->bucket;
        $options = [
            OssClient::OSS_STORAGE => OssClient::OSS_STORAGE_IA,
        ];

        $this->ossClient->createBucket($this->iaBucket, OssClient::OSS_ACL_TYPE_PRIVATE, $options);

        $options = [
            OssClient::OSS_STORAGE => OssClient::OSS_STORAGE_ARCHIVE,
        ];

        $this->ossClient->createBucket($this->archiveBucket, OssClient::OSS_ACL_TYPE_PRIVATE, $options);
    }

    public function tearDown()
    {
        parent::tearDown();

        $object = 'storage-object';

        $this->ossClient->deleteObject($this->iaBucket, $object);
        $this->ossClient->deleteObject($this->archiveBucket, $object);
        $this->ossClient->deleteBucket($this->iaBucket);
        $this->ossClient->deleteBucket($this->archiveBucket);
    }
}
