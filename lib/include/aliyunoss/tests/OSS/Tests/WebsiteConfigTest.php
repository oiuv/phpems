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

use OSS\Model\WebsiteConfig;

class WebsiteConfigTest extends \PHPUnit_Framework_TestCase
{
    private $validXml = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<WebsiteConfiguration>
<IndexDocument>
<Suffix>index.html</Suffix>
</IndexDocument>
<ErrorDocument>
<Key>errorDocument.html</Key>
</ErrorDocument>
</WebsiteConfiguration>
BBBB;

    private $nullXml = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?><WebsiteConfiguration><IndexDocument><Suffix/></IndexDocument><ErrorDocument><Key/></ErrorDocument></WebsiteConfiguration>
BBBB;
    private $nullXml2 = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?><WebsiteConfiguration><IndexDocument><Suffix></Suffix></IndexDocument><ErrorDocument><Key></Key></ErrorDocument></WebsiteConfiguration>
BBBB;

    public function testParseValidXml()
    {
        $websiteConfig = new WebsiteConfig('index');
        $websiteConfig->parseFromXml($this->validXml);
        $this->assertSame($this->cleanXml($this->validXml), $this->cleanXml($websiteConfig->serializeToXml()));
    }

    public function testParsenullXml()
    {
        $websiteConfig = new WebsiteConfig();
        $websiteConfig->parseFromXml($this->nullXml);
        $this->assertTrue($this->cleanXml($this->nullXml) === $this->cleanXml($websiteConfig->serializeToXml()) ||
            $this->cleanXml($this->nullXml2) === $this->cleanXml($websiteConfig->serializeToXml()));
    }

    public function testWebsiteConstruct()
    {
        $websiteConfig = new WebsiteConfig('index.html', 'errorDocument.html');
        $this->assertSame('index.html', $websiteConfig->getIndexDocument());
        $this->assertSame('errorDocument.html', $websiteConfig->getErrorDocument());
        $this->assertSame($this->cleanXml($this->validXml), $this->cleanXml($websiteConfig->serializeToXml()));
    }

    private function cleanXml($xml)
    {
        return str_replace("\n", '', str_replace("\r", '', $xml));
    }
}
