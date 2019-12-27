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

use OSS\Model\CorsConfig;

class GetCorsResult extends Result
{
    /**
     * @return CorsConfig
     */
    protected function parseDataFromResponse()
    {
        $content = $this->rawResponse->body;
        $config = new CorsConfig();
        $config->parseFromXml($content);

        return $config;
    }

    /**
     * Check if the response is OK, according to the http status. [200-299]:OK, the Cors config could be got; [404]: not found--no Cors config.
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
