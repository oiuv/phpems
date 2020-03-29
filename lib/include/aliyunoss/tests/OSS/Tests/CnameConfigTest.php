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
use OSS\Model\CnameConfig;

class CnameConfigTest extends \PHPUnit_Framework_TestCase
{
    private $xml1 = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<BucketCnameConfiguration>
  <Cname>
    <Domain>www.foo.com</Domain>
    <Status>enabled</Status>
    <LastModified>20150101</LastModified>
  </Cname>
  <Cname>
    <Domain>bar.com</Domain>
    <Status>disabled</Status>
    <LastModified>20160101</LastModified>
  </Cname>
</BucketCnameConfiguration>
BBBB;

    public function testFromXml()
    {
        $cnameConfig = new CnameConfig();
        $cnameConfig->parseFromXml($this->xml1);

        $cnames = $cnameConfig->getCnames();
        $this->assertSame(2, count($cnames));
        $this->assertSame('www.foo.com', $cnames[0]['Domain']);
        $this->assertSame('enabled', $cnames[0]['Status']);
        $this->assertSame('20150101', $cnames[0]['LastModified']);

        $this->assertSame('bar.com', $cnames[1]['Domain']);
        $this->assertSame('disabled', $cnames[1]['Status']);
        $this->assertSame('20160101', $cnames[1]['LastModified']);
    }

    public function testToXml()
    {
        $cnameConfig = new CnameConfig();
        $cnameConfig->addCname('www.foo.com');
        $cnameConfig->addCname('bar.com');

        $xml = $cnameConfig->serializeToXml();
        $comp = new CnameConfig();
        $comp->parseFromXml($xml);

        $cnames1 = $cnameConfig->getCnames();
        $cnames2 = $comp->getCnames();

        $this->assertSame(count($cnames1), count($cnames2));
        $this->assertSame(count($cnames1[0]), count($cnames2[0]));
        $this->assertSame(1, count($cnames1[0]));
        $this->assertSame($cnames1[0]['Domain'], $cnames2[0]['Domain']);
    }

    public function testCnameNumberLimit()
    {
        $cnameConfig = new CnameConfig();
        for ($i = 0; $i < CnameConfig::OSS_MAX_RULES; $i++) {
            $cnameConfig->addCname(strval($i).'.foo.com');
        }

        try {
            $cnameConfig->addCname('www.foo.com');
            $this->assertFalse(true);
        } catch (OssException $e) {
            $this->assertSame(
                $e->getMessage(),
                'num of cname in the config exceeds self::OSS_MAX_RULES: '.strval(CnameConfig::OSS_MAX_RULES)
            );
        }
    }
}
