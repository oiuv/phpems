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
use OSS\Result\GetLifecycleResult;

class GetLifecycleResultTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<LifecycleConfiguration>
<Rule>
<ID>delete obsoleted files</ID>
<Prefix>obsoleted/</Prefix>
<Status>Enabled</Status>
<Expiration><Days>3</Days></Expiration>
</Rule>
<Rule>
<ID>delete temporary files</ID>
<Prefix>temporary/</Prefix>
<Status>Enabled</Status>
<Expiration><Date>2022-10-12T00:00:00.000Z</Date></Expiration>
<Expiration2><Date>2022-10-12T00:00:00.000Z</Date></Expiration2>
</Rule>
</LifecycleConfiguration>
BBBB;

    public function testParseValidXml()
    {
        $response = new ResponseCore([], $this->validXml, 200);
        $result = new GetLifecycleResult($response);
        $this->assertTrue($result->isOK());
        $this->assertNotNull($result->getData());
        $this->assertNotNull($result->getRawResponse());
        $lifecycleConfig = $result->getData();
        $this->assertSame($this->cleanXml($this->validXml), $this->cleanXml($lifecycleConfig->serializeToXml()));
    }

    private function cleanXml($xml)
    {
        return str_replace("\n", '', str_replace("\r", '', $xml));
    }

    public function testInvalidResponse()
    {
        $response = new ResponseCore([], $this->validXml, 300);

        try {
            new GetLifecycleResult($response);
            $this->assertTrue(false);
        } catch (OssException $e) {
        }
    }
}
