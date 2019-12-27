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
use OSS\Model\LifecycleAction;
use OSS\Model\LifecycleConfig;
use OSS\Model\LifecycleRule;

class LifecycleConfigTest extends \PHPUnit_Framework_TestCase
{
    private $validLifecycle = <<<'BBBB'
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

    private $validLifecycle2 = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<LifecycleConfiguration>
<Rule><ID>delete temporary files</ID>
<Prefix>temporary/</Prefix>
<Status>Enabled</Status>
<Expiration><Date>2022-10-12T00:00:00.000Z</Date></Expiration>
<Expiration2><Date>2022-10-12T00:00:00.000Z</Date></Expiration2>
</Rule>
</LifecycleConfiguration>
BBBB;

    private $nullLifecycle = <<<'BBBB'
<?xml version="1.0" encoding="utf-8"?>
<LifecycleConfiguration/>
BBBB;

    public function testConstructValidConfig()
    {
        $lifecycleConfig = new LifecycleConfig();
        $actions = [];
        $actions[] = new LifecycleAction('Expiration', 'Days', 3);
        $lifecycleRule = new LifecycleRule('delete obsoleted files', 'obsoleted/', 'Enabled', $actions);
        $lifecycleConfig->addRule($lifecycleRule);
        $actions = [];
        $actions[] = new LifecycleAction('Expiration', 'Date', '2022-10-12T00:00:00.000Z');
        $actions[] = new LifecycleAction('Expiration2', 'Date', '2022-10-12T00:00:00.000Z');
        $lifecycleRule = new LifecycleRule('delete temporary files', 'temporary/', 'Enabled', $actions);
        $lifecycleConfig->addRule($lifecycleRule);

        try {
            $lifecycleConfig->addRule(null);
            $this->assertFalse(true);
        } catch (OssException $e) {
            $this->assertSame('lifecycleRule is null', $e->getMessage());
        }
        $this->assertSame($this->cleanXml(strval($lifecycleConfig)), $this->cleanXml($this->validLifecycle));
    }

    public function testParseValidXml()
    {
        $lifecycleConfig = new LifecycleConfig();
        $lifecycleConfig->parseFromXml($this->validLifecycle);
        $this->assertSame($this->cleanXml($lifecycleConfig->serializeToXml()), $this->cleanXml($this->validLifecycle));
        $this->assertSame(2, count($lifecycleConfig->getRules()));
        $rules = $lifecycleConfig->getRules();
        $this->assertSame('delete temporary files', $rules[1]->getId());
    }

    public function testParseValidXml2()
    {
        $lifecycleConfig = new LifecycleConfig();
        $lifecycleConfig->parseFromXml($this->validLifecycle2);
        $this->assertSame($this->cleanXml($lifecycleConfig->serializeToXml()), $this->cleanXml($this->validLifecycle2));
        $this->assertSame(1, count($lifecycleConfig->getRules()));
        $rules = $lifecycleConfig->getRules();
        $this->assertSame('delete temporary files', $rules[0]->getId());
    }

    public function testParseNullXml()
    {
        $lifecycleConfig = new LifecycleConfig();
        $lifecycleConfig->parseFromXml($this->nullLifecycle);
        $this->assertSame($this->cleanXml($lifecycleConfig->serializeToXml()), $this->cleanXml($this->nullLifecycle));
        $this->assertSame(0, count($lifecycleConfig->getRules()));
    }

    public function testLifecycleRule()
    {
        $lifecycleRule = new LifecycleRule('x', 'x', 'x', ['x']);
        $lifecycleRule->setId('id');
        $lifecycleRule->setPrefix('prefix');
        $lifecycleRule->setStatus('Enabled');
        $lifecycleRule->setActions([]);

        $this->assertSame('id', $lifecycleRule->getId());
        $this->assertSame('prefix', $lifecycleRule->getPrefix());
        $this->assertSame('Enabled', $lifecycleRule->getStatus());
        $this->assertEmpty($lifecycleRule->getActions());
    }

    public function testLifecycleAction()
    {
        $action = new LifecycleAction('x', 'x', 'x');
        $this->assertSame($action->getAction(), 'x');
        $this->assertSame($action->getTimeSpec(), 'x');
        $this->assertSame($action->getTimeValue(), 'x');
        $action->setAction('y');
        $action->setTimeSpec('y');
        $action->setTimeValue('y');
        $this->assertSame($action->getAction(), 'y');
        $this->assertSame($action->getTimeSpec(), 'y');
        $this->assertSame($action->getTimeValue(), 'y');
    }

    private function cleanXml($xml)
    {
        return str_replace("\n", '', str_replace("\r", '', $xml));
    }
}
