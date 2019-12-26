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
use OSS\Result\CopyObjectResult;

class CopyObjectResultTest extends \PHPUnit_Framework_TestCase
{
    private $body = <<<BBBB
<?xml version="1.0" encoding="utf-8"?>
<CopyObjectResult>
  <LastModified>Fri, 24 Feb 2012 07:18:48 GMT</LastModified>
  <ETag>"5B3C1A2E053D763E1B002CC607C5A0FE"</ETag>
</CopyObjectResult>
BBBB;

    public function testNullResponse()
    {
        $response = null;
        try {
            new CopyObjectResult($response);
            $this->assertFalse(true);
        } catch (OssException $e) {
            $this->assertSame('raw response is null', $e->getMessage());
        }
    }

    public function testOkResponse()
    {
        $header = [];
        $response = new ResponseCore($header, $this->body, 200);
        $result = new CopyObjectResult($response);
        $data = $result->getData();
        $this->assertTrue($result->isOK());
        $this->assertSame('Fri, 24 Feb 2012 07:18:48 GMT', $data[0]);
        $this->assertSame('"5B3C1A2E053D763E1B002CC607C5A0FE"', $data[1]);
    }

    public function testFailResponse()
    {
        $response = new ResponseCore([], '', 404);
        try {
            new CopyObjectResult($response);
            $this->assertFalse(true);
        } catch (OssException $e) {
        }
    }
}
