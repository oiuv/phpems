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
use OSS\OssClient;

require_once __DIR__.DIRECTORY_SEPARATOR.'TestOssClientBase.php';

class CallbackTest extends TestOssClientBase
{
    public function testMultipartUploadCallbackNormal()
    {
        $object = 'multipart-callback-test.txt';
        $copiedObject = 'multipart-callback-test.txt.copied';
        $this->ossClient->putObject($this->bucket, $copiedObject, file_get_contents(__FILE__));

        /*
         *  step 1. Initialize a block upload event, which is initialized to upload Multipart, get the upload id
         */
        try {
            $upload_id = $this->ossClient->initiateMultipartUpload($this->bucket, $object);
        } catch (OssException $e) {
            $this->assertFalse(true);
        }
        /*
         * step 2. uploadPartCopy
         */
        $copyId = 1;
        $eTag = $this->ossClient->uploadPartCopy($this->bucket, $copiedObject, $this->bucket, $object, $copyId, $upload_id);
        $upload_parts[] = [
            'PartNumber' => $copyId,
            'ETag' => $eTag,
        ];

        try {
            $listPartsInfo = $this->ossClient->listParts($this->bucket, $object, $upload_id);
            $this->assertNotNull($listPartsInfo);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        /**
         * step 3.
         */
        $json =
        '{
            "callbackUrl":"oss-demo.aliyuncs.com:23450",
            "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
            "callbackBody":"{\"mimeType\":${mimeType},\"size\":${size},\"x:var1\":${x:var1},\"x:var2\":${x:var2}}",
            "callbackBodyType":"application/json"
        }';

        $var =
       '{
           "x:var1":"value1",
           "x:var2":"值2"
       }';
        $options = [OssClient::OSS_CALLBACK => $json,
                        OssClient::OSS_CALLBACK_VAR => $var,
                       ];

        try {
            $result = $this->ossClient->completeMultipartUpload($this->bucket, $object, $upload_id, $upload_parts, $options);
            $this->assertSame('200', $result['info']['http_code']);
            $this->assertSame('{"Status":"OK"}', $result['body']);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }
    }

    public function testMultipartUploadCallbackFailed()
    {
        $object = 'multipart-callback-test.txt';
        $copiedObject = 'multipart-callback-test.txt.copied';
        $this->ossClient->putObject($this->bucket, $copiedObject, file_get_contents(__FILE__));

        /*
         *  step 1. Initialize a block upload event, which is initialized to upload Multipart, get the upload id
         */
        try {
            $upload_id = $this->ossClient->initiateMultipartUpload($this->bucket, $object);
        } catch (OssException $e) {
            $this->assertFalse(true);
        }
        /*
         * step 2. uploadPartCopy
         */
        $copyId = 1;
        $eTag = $this->ossClient->uploadPartCopy($this->bucket, $copiedObject, $this->bucket, $object, $copyId, $upload_id);
        $upload_parts[] = [
            'PartNumber' => $copyId,
            'ETag' => $eTag,
        ];

        try {
            $listPartsInfo = $this->ossClient->listParts($this->bucket, $object, $upload_id);
            $this->assertNotNull($listPartsInfo);
        } catch (OssException $e) {
            $this->assertTrue(false);
        }

        /**
         * step 3.
         */
        $json =
        '{
            "callbackUrl":"www.baidu.com",
            "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
            "callbackBody":"{\"mimeType\":${mimeType},\"size\":${size},\"x:var1\":${x:var1},\"x:var2\":${x:var2}}",
            "callbackBodyType":"application/json"
        }';

        $var =
       '{
       "x:var1":"value1",
       "x:var2":"值2"
       }';
        $options = [OssClient::OSS_CALLBACK => $json,
                        OssClient::OSS_CALLBACK_VAR => $var,
                       ];

        try {
            $result = $this->ossClient->completeMultipartUpload($this->bucket, $object, $upload_id, $upload_parts, $options);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertTrue(true);
            $this->assertSame('203', $e->getHTTPStatus());
        }
    }

    public function testPutObjectCallbackNormal()
    {
        //json

        $json =
            '{
                "callbackUrl":"oss-demo.aliyuncs.com:23450",
                "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
                "callbackBody":"{\"mimeType\":${mimeType},\"size\":${size}}",
                "callbackBodyType":"application/json"
            }';
        $options = [OssClient::OSS_CALLBACK => $json];
        $this->putObjectCallbackOk($options, '200');

        //url

        $url =
            '{
                "callbackUrl":"oss-demo.aliyuncs.com:23450",
                "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
                "callbackBody":"bucket=${bucket}&object=${object}&etag=${etag}&size=${size}&mimeType=${mimeType}&imageInfo.height=${imageInfo.height}&imageInfo.width=${imageInfo.width}&imageInfo.format=${imageInfo.format}",
                "callbackBodyType":"application/x-www-form-urlencoded"
            }';
        $options = [OssClient::OSS_CALLBACK => $url];
        $this->putObjectCallbackOk($options, '200');

        // Unspecified typre

        $url =
            '{
                "callbackUrl":"oss-demo.aliyuncs.com:23450",
                "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
                "callbackBody":"bucket=${bucket}&object=${object}&etag=${etag}&size=${size}&mimeType=${mimeType}&imageInfo.height=${imageInfo.height}&imageInfo.width=${imageInfo.width}&imageInfo.format=${imageInfo.format}"
            }';
        $options = [OssClient::OSS_CALLBACK => $url];
        $this->putObjectCallbackOk($options, '200');

        //json and body is chinese

        $json =
            '{
                "callbackUrl":"oss-demo.aliyuncs.com:23450",
                "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
                "callbackBody":"{\" 春水碧于天，画船听雨眠。\":\"垆边人似月，皓腕凝霜雪。\"}",
                "callbackBodyType":"application/json"
            }';
        $options = [OssClient::OSS_CALLBACK => $json];
        $this->putObjectCallbackOk($options, '200');

        //url and body is chinese

        $url =
            '{
                "callbackUrl":"oss-demo.aliyuncs.com:23450",
                "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
                "callbackBody":"春水碧于天，画船听雨眠。垆边人似月，皓腕凝霜雪",
                "callbackBodyType":"application/x-www-form-urlencoded"
            }';
        $options = [OssClient::OSS_CALLBACK => $url];
        $this->putObjectCallbackOk($options, '200');

        //json and add callback_var

        $json =
            '{
                "callbackUrl":"oss-demo.aliyuncs.com:23450",
                "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
                "callbackBody":"{\"mimeType\":${mimeType},\"size\":${size},\"x:var1\":${x:var1},\"x:var2\":${x:var2}}",
                "callbackBodyType":"application/json"
            }';

        $var =
            '{
                "x:var1":"value1",
                "x:var2":"aliyun.com"
            }';
        $options = [OssClient::OSS_CALLBACK => $json,
                             OssClient::OSS_CALLBACK_VAR => $var,
                             ];
        $this->putObjectCallbackOk($options, '200');

        //url and add callback_var

        $url =
            '{
                "callbackUrl":"oss-demo.aliyuncs.com:23450",
                "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
                "callbackBody":"bucket=${bucket}&object=${object}&etag=${etag}&size=${size}&mimeType=${mimeType}&imageInfo.height=${imageInfo.height}&imageInfo.width=${imageInfo.width}&imageInfo.format=${imageInfo.format}&my_var1=${x:var1}&my_var2=${x:var2}",
                "callbackBodyType":"application/x-www-form-urlencoded"
            }';
        $var =
            '{
                "x:var1":"value1凌波不过横塘路，但目送，芳",
                "x:var2":"值2"
            }';
        $options = [OssClient::OSS_CALLBACK => $url,
                             OssClient::OSS_CALLBACK_VAR => $var,
                            ];
        $this->putObjectCallbackOk($options, '200');
    }

    public function testPutCallbackWithCallbackFailed()
    {
        $json =
            '{
                "callbackUrl":"http://www.baidu.com",
                "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
                "callbackBody":"{\"mimeType\":${mimeType},\"size\":${size}}",
                "callbackBodyType":"application/json"
            }';
        $options = [OssClient::OSS_CALLBACK => $json];
        $this->putObjectCallbackFailed($options, '203');

        $url =
            '{
                "callbackUrl":"http://www.baidu.com",
                "callbackHost":"oss-cn-hangzhou.aliyuncs.com",
                "callbackBody":"bucket=${bucket}&object=${object}&etag=${etag}&size=${size}&mimeType=${mimeType}&imageInfo.height=${imageInfo.height}&imageInfo.width=${imageInfo.width}&imageInfo.format=${imageInfo.format}&my_var1=${x:var1}&my_var2=${x:var2}",
                "callbackBodyType":"application/x-www-form-urlencoded"
            }';
        $options = [OssClient::OSS_CALLBACK => $url];
        $this->putObjectCallbackFailed($options, '203');
    }

    private function putObjectCallbackOk($options, $status)
    {
        $object = 'oss-php-sdk-callback-test.txt';
        $content = file_get_contents(__FILE__);
        try {
            $result = $this->ossClient->putObject($this->bucket, $object, $content, $options);
            $this->assertSame($status, $result['info']['http_code']);
            $this->assertSame('{"Status":"OK"}', $result['body']);
        } catch (OssException $e) {
            $this->assertFalse(true);
        }
    }

    private function putObjectCallbackFailed($options, $status)
    {
        $object = 'oss-php-sdk-callback-test.txt';
        $content = file_get_contents(__FILE__);
        try {
            $result = $this->ossClient->putObject($this->bucket, $object, $content, $options);
            $this->assertTrue(false);
        } catch (OssException $e) {
            $this->assertSame($status, $e->getHTTPStatus());
            $this->assertTrue(true);
        }
    }

    public function setUp()
    {
        parent::setUp();
    }
}
