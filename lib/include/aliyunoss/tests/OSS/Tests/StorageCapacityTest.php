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
use OSS\Model\StorageCapacityConfig;
use OSS\Result\GetStorageCapacityResult;

class StorageCapacityTest extends \PHPUnit_Framework_TestCase
{
    private $inValidXml = <<<'BBBB'
<?xml version="1.0" encoding="UTF-8"?>
<BucketUserQos>
   <OssStorageCapacity>1</OssStorageCapacity>
</BucketUserQos>
BBBB;

    private $validXml = <<<'BBBB'
<?xml version="1.0" encoding="UTF-8"?>
<BucketUserQos>
   <StorageCapacity>1</StorageCapacity>
</BucketUserQos>
BBBB;

    public function testParseInValidXml()
    {
        $response = new ResponseCore([], $this->inValidXml, 300);

        try {
            new GetStorageCapacityResult($response);
            $this->assertTrue(false);
        } catch (OssException $e) {
        }
    }

    public function testParseEmptyXml()
    {
        $response = new ResponseCore([], '', 300);

        try {
            new GetStorageCapacityResult($response);
            $this->assertTrue(false);
        } catch (OssException $e) {
        }
    }

    public function testParseValidXml()
    {
        $response = new ResponseCore([], $this->validXml, 200);
        $result = new GetStorageCapacityResult($response);
        $this->assertSame($result->getData(), 1);
    }

    public function testSerializeToXml()
    {
        $xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<BucketUserQos><StorageCapacity>1</StorageCapacity></BucketUserQos>\n";

        $storageCapacityConfig = new StorageCapacityConfig(1);
        $content = $storageCapacityConfig->serializeToXml();
        $this->assertSame($content, $xml);
    }
}
