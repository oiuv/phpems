<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * This source file is subject to the MIT license that is bundled.
 */

class WxPayException extends Exception
{
    public function errorMessage()
    {
        return $this->getMessage();
    }
}
