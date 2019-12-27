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
use OSS\Result\UploadPartResult;

class UploadPartResultTest extends \PHPUnit_Framework_TestCase
{
    private $validHeader = ['etag' => '7265F4D211B56873A381D321F586E4A9'];
    private $invalidHeader = [];

    public function testParseValidHeader()
    {
        $response = new ResponseCore($this->validHeader, '', 200);
        $result = new UploadPartResult($response);
        $eTag = $result->getData();
        $this->assertSame('7265F4D211B56873A381D321F586E4A9', $eTag);
    }

    public function testParseInvalidHeader()
    {
        $response = new ResponseCore($this->invalidHeader, '', 200);

        try {
            new UploadPartResult($response);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame('cannot get ETag', $e->getMessage());
        }
    }
}
