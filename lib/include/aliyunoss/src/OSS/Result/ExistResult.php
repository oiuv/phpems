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

/**
 * Class ExistResult checks if bucket or object exists, according to the http status in response headers.
 */
class ExistResult extends Result
{
    /**
     * @return bool
     */
    protected function parseDataFromResponse()
    {
        return 200 === intval($this->rawResponse->status) ? true : false;
    }

    /**
     * Check if the response status is OK according to the http status code.
     * [200-299]: OK; [404]: Not found. It means the object or bucket is not found--it's a valid response too.
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
