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
        $accessKeyId = OSSKEYID;
        $accessKeySecret = OSSKEYSECRET;
        $endpoint = OSSENDPOINT;
        $bucket = OSSBUCKET;
        $object = date('Ymd').'/'.basename($filepath);
        $filePath = $filepath;

        try {
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);

            $rs = $ossClient->uploadFile($bucket, $object, $filePath);
            $path = $rs['oss-request-url'];
            $path = str_ireplace('url1', 'url2', $path);
        } catch (OssException $e) {
            //printf(__FUNCTION__ . ": FAILED\n");
            //printf($e->getMessage() . "\n");
            return;
        }

        return $path;
    }
}
