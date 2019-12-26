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
 * Class CorsRule.
 *
 * @see http://help.aliyun.com/document_detail/oss/api-reference/cors/PutBucketcors.html
 */
class CorsRule
{
    /**
     * Add an allowedOrigin rule.
     *
     * @param string $allowedOrigin
     */
    public function addAllowedOrigin($allowedOrigin)
    {
        if (!empty($allowedOrigin)) {
            $this->allowedOrigins[] = $allowedOrigin;
        }
    }

    /**
     * Add an allowedMethod rule.
     *
     * @param string $allowedMethod
     */
    public function addAllowedMethod($allowedMethod)
    {
        if (!empty($allowedMethod)) {
            $this->allowedMethods[] = $allowedMethod;
        }
    }

    /**
     * Add an allowedHeader rule.
     *
     * @param string $allowedHeader
     */
    public function addAllowedHeader($allowedHeader)
    {
        if (!empty($allowedHeader)) {
            $this->allowedHeaders[] = $allowedHeader;
        }
    }

    /**
     * Add an exposeHeader rule.
     *
     * @param string $exposeHeader
     */
    public function addExposeHeader($exposeHeader)
    {
        if (!empty($exposeHeader)) {
            $this->exposeHeaders[] = $exposeHeader;
        }
    }

    /**
     * @return int
     */
    public function getMaxAgeSeconds()
    {
        return $this->maxAgeSeconds;
    }

    /**
     * @param int $maxAgeSeconds
     */
    public function setMaxAgeSeconds($maxAgeSeconds)
    {
        $this->maxAgeSeconds = $maxAgeSeconds;
    }

    /**
     * Get the AllowedHeaders list.
     *
     * @return string[]
     */
    public function getAllowedHeaders()
    {
        return $this->allowedHeaders;
    }

    /**
     * Get the AllowedOrigins list.
     *
     * @return string[]
     */
    public function getAllowedOrigins()
    {
        return $this->allowedOrigins;
    }

    /**
     * Get the AllowedMethods list.
     *
     * @return string[]
     */
    public function getAllowedMethods()
    {
        return $this->allowedMethods;
    }

    /**
     * Get the ExposeHeaders list.
     *
     * @return string[]
     */
    public function getExposeHeaders()
    {
        return $this->exposeHeaders;
    }

    /**
     * Serialize all the rules into the xml represented by parameter $xmlRule.
     *
     * @param \SimpleXMLElement $xmlRule
     *
     * @throws OssException
     */
    public function appendToXml(&$xmlRule)
    {
        if (!isset($this->maxAgeSeconds)) {
            throw new OssException('maxAgeSeconds is not set in the Rule');
        }
        foreach ($this->allowedOrigins as $allowedOrigin) {
            $xmlRule->addChild(CorsConfig::OSS_CORS_ALLOWED_ORIGIN, $allowedOrigin);
        }
        foreach ($this->allowedMethods as $allowedMethod) {
            $xmlRule->addChild(CorsConfig::OSS_CORS_ALLOWED_METHOD, $allowedMethod);
        }
        foreach ($this->allowedHeaders as $allowedHeader) {
            $xmlRule->addChild(CorsConfig::OSS_CORS_ALLOWED_HEADER, $allowedHeader);
        }
        foreach ($this->exposeHeaders as $exposeHeader) {
            $xmlRule->addChild(CorsConfig::OSS_CORS_EXPOSE_HEADER, $exposeHeader);
        }
        $xmlRule->addChild(CorsConfig::OSS_CORS_MAX_AGE_SECONDS, strval($this->maxAgeSeconds));
    }

    private $allowedHeaders = [];
    private $allowedOrigins = [];
    private $allowedMethods = [];
    private $exposeHeaders = [];
    private $maxAgeSeconds = null;
}
