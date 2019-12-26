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
 * Class AppendResult.
 */
class AppendResult extends Result
{
    /**
     * Get the value of next-append-position from append's response headers.
     *
     * @return int
     *
     * @throws OssException
     */
    protected function parseDataFromResponse()
    {
        $header = $this->rawResponse->header;
        if (isset($header['x-oss-next-append-position'])) {
            return intval($header['x-oss-next-append-position']);
        }
        throw new OssException('cannot get next-append-position');
    }
}
