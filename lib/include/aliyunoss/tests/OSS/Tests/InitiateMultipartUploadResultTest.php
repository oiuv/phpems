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
use OSS\Http\ResponseCore;
use OSS\Result\InitiateMultipartUploadResult;

class InitiateMultipartUploadResultTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<BBBB
<?xml version="1.0" encoding="UTF-8"?>
<InitiateMultipartUploadResult xmlns="http://doc.oss-cn-hangzhou.aliyuncs.com">
    <Bucket> multipart_upload</Bucket>
    <Key>multipart.data</Key>
    <UploadId>0004B9894A22E5B1888A1E29F8236E2D</UploadId>
</InitiateMultipartUploadResult>
BBBB;

    private $invalidXml = <<<BBBB
<?xml version="1.0" encoding="UTF-8"?>
<InitiateMultipartUploadResult xmlns="http://doc.oss-cn-hangzhou.aliyuncs.com">
    <Bucket> multipart_upload</Bucket>
    <Key>multipart.data</Key>
</InitiateMultipartUploadResult>
BBBB;

    public function testParseValidXml()
    {
        $response = new ResponseCore([], $this->validXml, 200);
        $result = new InitiateMultipartUploadResult($response);
        $this->assertSame('0004B9894A22E5B1888A1E29F8236E2D', $result->getData());
    }

    public function testParseInvalidXml()
    {
        $response = new ResponseCore([], $this->invalidXml, 200);
        try {
            $result = new InitiateMultipartUploadResult($response);
            $this->assertTrue(false);
        } catch (OssException $e) {
        }
    }
}
