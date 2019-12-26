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

namespace OSS\Result;

use OSS\Core\OssException;

/**
 * Class UploadPartResult.
 */
class UploadPartResult extends Result
{
    /**
     * 结果中part的ETag.
     *
     * @return string
     *
     * @throws OssException
     */
    protected function parseDataFromResponse()
    {
        $header = $this->rawResponse->header;
        if (isset($header['etag'])) {
            return $header['etag'];
        }
        throw new OssException('cannot get ETag');
    }
}
