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
use OSS\Result\GetLoggingResult;

class GetLoggingResultTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<BucketLoggingStatus>
<LoggingEnabled>
<TargetBucket>TargetBucket</TargetBucket>
<TargetPrefix>TargetPrefix</TargetPrefix>
</LoggingEnabled>
</BucketLoggingStatus>
BBBB;

    public function testParseValidXml()
    {
        $response = new ResponseCore([], $this->validXml, 200);
        $result = new GetLoggingResult($response);
        $this->assertTrue($result->isOK());
        $this->assertNotNull($result->getData());
        $this->assertNotNull($result->getRawResponse());
        $loggingConfig = $result->getData();
        $this->assertSame($this->cleanXml($this->validXml), $this->cleanXml($loggingConfig->serializeToXml()));
        $this->assertSame('TargetBucket', $loggingConfig->getTargetBucket());
        $this->assertSame('TargetPrefix', $loggingConfig->getTargetPrefix());
    }

    private function cleanXml($xml)
    {
        return str_replace("\n", '', str_replace("\r", '', $xml));
    }

    public function testInvalidResponse()
    {
        $response = new ResponseCore([], $this->validXml, 300);

        try {
            new GetLoggingResult($response);
            $this->assertTrue(false);
        } catch (OssException $e) {
        }
    }
}
