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
 * Class CallbackResult.
 */
class CallbackResult extends PutSetDeleteResult
{
    protected function isResponseOk()
    {
        $status = $this->rawResponse->status;
        if (2 == (int) (intval($status) / 100) && 203 !== (int) (intval($status))) {
            return true;
        }

        return false;
    }
}
