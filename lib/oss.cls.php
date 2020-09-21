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

use OSS\Core\OssException;
use OSS\OssClient;

class oss
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function upload($filepath)
    {
        $accessKeyId = 'LTAI1gDYPJhtZlIh';
        $accessKeySecret = 'bmLtFONC9OVSfS9NAWYtelVsWMzCEp';
        $endpoint = 'http://oss-cn-beijing.aliyuncs.com';
        $bucket = 'ossforphpems';
        $object = date('Ymd').'/'.basename($filepath);
        $filePath = $filepath;

        try {
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);

            $rs = $ossClient->uploadFile($bucket, $object, $filePath);
            $path = $rs['oss-request-url'];
            $path = str_ireplace('����1', '����2', $path);
        } catch (OssException $e) {
            //printf(__FUNCTION__ . ": FAILED\n");
            //printf($e->getMessage() . "\n");
            return;
        }

        return $path;
    }
}
