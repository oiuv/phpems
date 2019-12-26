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

namespace OSS\Model;

use OSS\Core\OssException;

/**
 * Class CorsConfig.
 *
 * @see http://help.aliyun.com/document_detail/oss/api-reference/cors/PutBucketcors.html
 */
class CorsConfig implements XmlConfig
{
    /**
     * CorsConfig constructor.
     */
    public function __construct()
    {
        $this->rules = [];
    }

    /**
     * Get CorsRule list.
     *
     * @return CorsRule[]
     */
    public function getRules()
    {
        return $this->rules;
    }

    /**
     * Add a new CorsRule.
     *
     * @param CorsRule $rule
     *
     * @throws OssException
     */
    public function addRule($rule)
    {
        if (count($this->rules) >= self::OSS_MAX_RULES) {
            throw new OssException('num of rules in the config exceeds self::OSS_MAX_RULES: '.strval(self::OSS_MAX_RULES));
        }
        $this->rules[] = $rule;
    }

    /**
     * Parse CorsConfig from the xml.
     *
     * @param string $strXml
     *
     * @throws OssException
     *
     * @return null
     */
    public function parseFromXml($strXml)
    {
        $xml = simplexml_load_string($strXml);
        if (!isset($xml->CORSRule)) {
            return;
        }
        foreach ($xml->CORSRule as $rule) {
            $corsRule = new CorsRule();
            foreach ($rule as $key => $value) {
                if (self::OSS_CORS_ALLOWED_HEADER === $key) {
                    $corsRule->addAllowedHeader(strval($value));
                } elseif (self::OSS_CORS_ALLOWED_METHOD === $key) {
                    $corsRule->addAllowedMethod(strval($value));
                } elseif (self::OSS_CORS_ALLOWED_ORIGIN === $key) {
                    $corsRule->addAllowedOrigin(strval($value));
                } elseif (self::OSS_CORS_EXPOSE_HEADER === $key) {
                    $corsRule->addExposeHeader(strval($value));
                } elseif (self::OSS_CORS_MAX_AGE_SECONDS === $key) {
                    $corsRule->setMaxAgeSeconds(strval($value));
                }
            }
            $this->addRule($corsRule);
        }
    }

    /**
     * Serialize the object into xml string.
     *
     * @return string
     */
    public function serializeToXml()
    {
        $xml = new \SimpleXMLElement('<?xml version="1.0" encoding="utf-8"?><CORSConfiguration></CORSConfiguration>');
        foreach ($this->rules as $rule) {
            $xmlRule = $xml->addChild('CORSRule');
            $rule->appendToXml($xmlRule);
        }

        return $xml->asXML();
    }

    public function __toString()
    {
        return $this->serializeToXml();
    }

    const OSS_CORS_ALLOWED_ORIGIN = 'AllowedOrigin';
    const OSS_CORS_ALLOWED_METHOD = 'AllowedMethod';
    const OSS_CORS_ALLOWED_HEADER = 'AllowedHeader';
    const OSS_CORS_EXPOSE_HEADER = 'ExposeHeader';
    const OSS_CORS_MAX_AGE_SECONDS = 'MaxAgeSeconds';
    const OSS_MAX_RULES = 10;

    /**
     * CorsRule list.
     *
     * @var CorsRule[]
     */
    private $rules = [];
}
