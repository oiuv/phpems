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

use OSS\Model\LoggingConfig;

class LoggingConfigTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<BBBB
<?xml version="1.0" encoding="utf-8"?>
<BucketLoggingStatus>
<LoggingEnabled>
<TargetBucket>TargetBucket</TargetBucket>
<TargetPrefix>TargetPrefix</TargetPrefix>
</LoggingEnabled>
</BucketLoggingStatus>
BBBB;

    private $nullXml = <<<BBBB
<?xml version="1.0" encoding="utf-8"?>
<BucketLoggingStatus/>
BBBB;

    public function testParseValidXml()
    {
        $loggingConfig = new LoggingConfig();
        $loggingConfig->parseFromXml($this->validXml);
        $this->assertSame($this->cleanXml($this->validXml), $this->cleanXml(strval($loggingConfig)));
    }

    public function testConstruct()
    {
        $loggingConfig = new LoggingConfig('TargetBucket', 'TargetPrefix');
        $this->assertSame($this->cleanXml($this->validXml), $this->cleanXml($loggingConfig->serializeToXml()));
    }

    public function testFailedConstruct()
    {
        $loggingConfig = new LoggingConfig('TargetBucket', null);
        $this->assertSame($this->cleanXml($this->nullXml), $this->cleanXml($loggingConfig->serializeToXml()));
    }

    private function cleanXml($xml)
    {
        return str_replace("\n", '', str_replace("\r", '', $xml));
    }
}
