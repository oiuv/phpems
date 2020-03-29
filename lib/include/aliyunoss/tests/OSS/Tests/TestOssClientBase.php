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

use OSS\OssClient;

require_once __DIR__.DIRECTORY_SEPARATOR.'Common.php';

class TestOssClientBase extends \PHPUnit_Framework_TestCase
{
    /**
     * @var OssClient
     */
    protected $ossClient;

    /**
     * @var string
     */
    protected $bucket;

    public function setUp()
    {
        $this->bucket = Common::getBucketName().rand(100000, 999999);
        $this->ossClient = Common::getOssClient();
        $this->ossClient->createBucket($this->bucket);
        Common::waitMetaSync();
    }

    public function tearDown()
    {
        if (!$this->ossClient->doesBucketExist($this->bucket)) {
            return;
        }

        $objects = $this->ossClient->listObjects(
            $this->bucket,
            ['max-keys' => 1000, 'delimiter' => '']
        )->getObjectList();
        $keys = [];
        foreach ($objects as $obj) {
            $keys[] = $obj->getKey();
        }
        if (count($keys) > 0) {
            $this->ossClient->deleteObjects($this->bucket, $keys);
        }
        $uploads = $this->ossClient->listMultipartUploads($this->bucket)->getUploads();
        foreach ($uploads as $up) {
            $this->ossClient->abortMultipartUpload($this->bucket, $up->getKey(), $up->getUploadId());
        }

        $this->ossClient->deleteBucket($this->bucket);
    }
}
