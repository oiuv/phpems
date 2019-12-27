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

namespace OSS\Http;

/**
 * Container for all response-related methods.
 */
class ResponseCore
{
    /**
     * Store the HTTP header information.
     */
    public $header;

    /**
     * Store the SimpleXML response.
     */
    public $body;

    /**
     * Store the HTTP response code.
     */
    public $status;

    /**
     * Construct a new instance of this class.
     *
     * @param array  $header (Required) Associative array of HTTP headers (typically returned by <RequestCore::get_response_header()>)
     * @param string $body   (Required) XML-formatted response from AWS
     * @param int    $status (Optional) HTTP response status code from the request
     *
     * @return mixed contains an <php:array> `header` property (HTTP headers as an associative array), a <php:SimpleXMLElement> or <php:string> `body` property, and an <php:integer> `status` code
     */
    public function __construct($header, $body, $status = null)
    {
        $this->header = $header;
        $this->body = $body;
        $this->status = $status;

        return $this;
    }

    /**
     * Did we receive the status code we expected?
     *
     * @param int|array $codes (Optional) The status code(s) to expect. Pass an <php:integer> for a single acceptable value, or an <php:array> of integers for multiple acceptable values.
     *
     * @return bool whether we received the expected status code or not
     */
    public function isOK($codes = [200, 201, 204, 206])
    {
        if (is_array($codes)) {
            return in_array($this->status, $codes);
        }

        return $this->status === $codes;
    }
}
