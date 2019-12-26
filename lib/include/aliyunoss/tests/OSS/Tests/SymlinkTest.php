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

class SymlinkTest extends TestOssClientBase
{
    public function testPutSymlink()
    {
        $bucket = getenv('OSS_BUCKET');
        $symlink = 'test-link';
        $special_object = 'exist_object^$#!~';
        $object = 'exist_object';

        $this->ossClient->putObject($bucket, $object, 'test_content');
        $this->ossClient->putSymlink($bucket, $symlink, $object);
        $result = $this->ossClient->getObject($bucket, $symlink);
        $this->assertSame('test_content', $result);

        $this->ossClient->putObject($bucket, $special_object, 'test_content');
        $this->ossClient->putSymlink($bucket, $symlink, $special_object);
        $result = $this->ossClient->getObject($bucket, $symlink);
        $this->assertSame('test_content', $result);
    }

    public function testGetSymlink()
    {
        $bucket = getenv('OSS_BUCKET');
        $symlink = 'test-link';
        $object = 'exist_object^$#!~';

        $result = $this->ossClient->getSymlink($bucket, $symlink);
        $this->assertSame($result[OssClient::OSS_SYMLINK_TARGET], $object);
        $this->assertSame('200', $result[OssClient::OSS_INFO][OssClient::OSS_HTTP_CODE]);
        $this->assertTrue(isset($result[OssClient::OSS_ETAG]));
        $this->assertTrue(isset($result[OssClient::OSS_REQUEST_ID]));
    }

    public function testPutNullSymlink()
    {
        $bucket = getenv('OSS_BUCKET');
        $symlink = 'null-link';
        $object_not_exist = 'not_exist_object+$#!b不';
        $this->ossClient->putSymlink($bucket, $symlink, $object_not_exist);

        try {
            $this->ossClient->getObject($bucket, $symlink);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('The symlink target object does not exist', $e->getErrorMessage());
        }
    }

    public function testGetNullSymlink()
    {
        $bucket = getenv('OSS_BUCKET');
        $symlink = 'null-link-new';

        try {
            $result = $this->ossClient->getSymlink($bucket, $symlink);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('The specified key does not exist.', $e->getErrorMessage());
        }
    }
}
