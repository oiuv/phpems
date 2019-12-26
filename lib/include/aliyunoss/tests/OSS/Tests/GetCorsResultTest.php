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
use OSS\Result\GetCorsResult;

class GetCorsResultTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<BBBB
<?xml version="1.0" encoding="utf-8"?>
<CORSConfiguration>
<CORSRule>
<AllowedOrigin>http://www.b.com</AllowedOrigin>
<AllowedOrigin>http://www.a.com</AllowedOrigin>
<AllowedOrigin>http://www.a.com</AllowedOrigin>
<AllowedMethod>GET</AllowedMethod>
<AllowedMethod>PUT</AllowedMethod>
<AllowedMethod>POST</AllowedMethod>
<AllowedHeader>x-oss-test</AllowedHeader>
<AllowedHeader>x-oss-test2</AllowedHeader>
<AllowedHeader>x-oss-test2</AllowedHeader>
<AllowedHeader>x-oss-test3</AllowedHeader>
<ExposeHeader>x-oss-test1</ExposeHeader>
<ExposeHeader>x-oss-test1</ExposeHeader>
<ExposeHeader>x-oss-test2</ExposeHeader>
<MaxAgeSeconds>10</MaxAgeSeconds>
</CORSRule>
<CORSRule>
<AllowedOrigin>http://www.b.com</AllowedOrigin>
<AllowedMethod>GET</AllowedMethod>
<AllowedHeader>x-oss-test</AllowedHeader>
<ExposeHeader>x-oss-test1</ExposeHeader>
<MaxAgeSeconds>110</MaxAgeSeconds>
</CORSRule>
</CORSConfiguration>
BBBB;

    public function testParseValidXml()
    {
        $response = new ResponseCore([], $this->validXml, 200);
        $result = new GetCorsResult($response);
        $this->assertTrue($result->isOK());
        $this->assertNotNull($result->getData());
        $this->assertNotNull($result->getRawResponse());
        $corsConfig = $result->getData();
        $this->assertSame($this->cleanXml($this->validXml), $this->cleanXml($corsConfig->serializeToXml()));
    }

    private function cleanXml($xml)
    {
        return str_replace("\n", '', str_replace("\r", '', $xml));
    }

    public function testInvalidResponse()
    {
        $response = new ResponseCore([], $this->validXml, 300);
        try {
            new GetCorsResult($response);
            $this->assertTrue(false);
        } catch (OssException $e) {
        }
    }
}
