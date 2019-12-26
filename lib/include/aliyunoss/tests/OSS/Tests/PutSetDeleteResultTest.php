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
use OSS\Result\PutSetDeleteResult;

class ResultTest extends \PHPUnit_Framework_TestCase
{
    public function testNullResponse()
    {
        $response = null;
        try {
            new PutSetDeleteResult($response);
            $this->assertFalse(true);
        } catch (OssException $e) {
            $this->assertSame('raw response is null', $e->getMessage());
        }
    }

    public function testOkResponse()
    {
        $header = [
            'x-oss-request-id' => '582AA51E004C4550BD27E0E4',
            'etag' => '595FA1EA77945233921DF12427F9C7CE',
            'content-md5' => 'WV+h6neUUjOSHfEkJ/nHzg==',
            'info' => [
                'http_code' => '200',
                'method' => 'PUT',
            ],
        ];
        $response = new ResponseCore($header, 'this is a mock body, just for test', 200);
        $result = new PutSetDeleteResult($response);
        $data = $result->getData();
        $this->assertTrue($result->isOK());
        $this->assertSame('this is a mock body, just for test', $data['body']);
        $this->assertSame('582AA51E004C4550BD27E0E4', $data['x-oss-request-id']);
        $this->assertSame('595FA1EA77945233921DF12427F9C7CE', $data['etag']);
        $this->assertSame('WV+h6neUUjOSHfEkJ/nHzg==', $data['content-md5']);
        $this->assertSame('200', $data['info']['http_code']);
        $this->assertSame('PUT', $data['info']['method']);
    }

    public function testFailResponse()
    {
        $response = new ResponseCore([], '', 301);
        try {
            new PutSetDeleteResult($response);
            $this->assertFalse(true);
        } catch (OssException $e) {
        }
    }

    public function setUp()
    {
    }

    public function tearDown()
    {
    }
}
