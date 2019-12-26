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

use OSS\Model\RefererConfig;

/**
 * Class GetRefererResult.
 */
class GetRefererResult extends Result
{
    /**
     * Parse RefererConfig data.
     *
     * @return RefererConfig
     */
    protected function parseDataFromResponse()
    {
        $content = $this->rawResponse->body;
        $config = new RefererConfig();
        $config->parseFromXml($content);

        return $config;
    }

    /**
     * Judged according to the return HTTP status code, [200-299] that is OK, get the bucket configuration interface,
     * 404 is also considered a valid response.
     *
     * @return bool
     */
    protected function isResponseOk()
    {
        $status = $this->rawResponse->status;
        if (2 == (int) (intval($status) / 100) || 404 === (int) (intval($status))) {
            return true;
        }

        return false;
    }
}
