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
 * Class GetLocationResult getBucketLocation interface returns the result class, encapsulated
 * The returned xml data is parsed.
 */
class GetLocationResult extends Result
{
    /**
     * Parse data from response.
     *
     * @return string
     *
     * @throws OssException
     */
    protected function parseDataFromResponse()
    {
        $content = $this->rawResponse->body;
        if (empty($content)) {
            throw new OssException('body is null');
        }
        $xml = simplexml_load_string($content);

        return $xml;
    }
}
