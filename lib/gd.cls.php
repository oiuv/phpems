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

class ggd
{
    public $bd;

    public function __construct(&$bd)
    {
        $this->bd = $bd;
    }

    public function thumb($source, $target, $width, $height, $isresize = 1, $isstream = false)
    {
        $fl = &$this->bd->make('fl');
        list($swidth, $sheight) = getimagesize($source);
        if (!$width) {
            $width = $swidth;
        }
        if (!$height) {
            $height = $sheight;
        }
        if ($isresize) {
            $w = $swidth / $width;
            $h = $sheight / $height;
            if ($w > $h) {
                $height = $sheight / $w;
            } else {
                $width = $swidth / $h;
            }
        }
        $tmp_pic = imagecreatetruecolor($width, $height);
        $ext = $fl->getFileExtName($source);
        $s_pic = $this->createImage($source, $ext);
        if (!$s_pic) {
            return false;
        }
        if (function_exists('imagecopyresampled')) {
            imagecopyresampled($tmp_pic, $s_pic, 0, 0, 0, 0, $width, $height, $swidth, $sheight);
        } else {
            imagecopyresized($tmp_pic, $s_pic, 0, 0, 0, 0, $width, $height, $swidth, $sheight);
        }
        if ($isstream) {
            $target = null;
        }
        if ($this->writeImage($tmp_pic, $target, 100, 'png')) {
            return true;
        }

        return false;
    }

    public function waterMark($source, $logo, $alpha = 50, $isstream = false)
    {
        list($swidth, $sheight) = getimagesize($source);
        list($width, $height) = getimagesize($logo);
        $fl = &$this->bd->make('fl');
        $ext = $fl->getFileExtName($source, false);
        $ext2 = $fl->getFileExtName($logo, false);
        $s_pic = $this->createImage($source, $ext);
        imagealphablending($s_pic, true);
        $l_pic = $this->createImage($logo, $ext2);
        imagecopymergegray($s_pic, $l_pic, intval($swidth - $width), intval($sheight - $height), 0, 0, $width, $height, $alpha);
        if ($this->writeImage($s_pic, $source, 100, $ext)) {
            return true;
        }

        return false;
    }

    public function createImage($source, $ext)
    {
        switch ($ext) {
            case 'jpg':
            if (function_exists('imagecreatefromjpeg')) {
                return imagecreatefromjpeg($source);
            }

             return false;
            break;

            case 'gif':
            if (function_exists('imagecreatefromgif')) {
                return imagecreatefromgif($source);
            }

             return false;
            break;

            case 'png':
            if (function_exists('imagecreatefrompng')) {
                return imagecreatefrompng($source);
            }

             return false;
            break;

            default:
            return false;
            break;
        }
    }

    public function writeImage($source, $target, $alpha, $ext)
    {
        switch ($ext) {
            case 'jpg':
            if (imagejpeg($source, $target, $alpha)) {
                return true;
            }

             return false;
            break;

            case 'gif':
            if (imagejpeg($source, $target, $alpha)) {
                return true;
            }

             return false;
            break;

            case 'png':
            if (imagejpeg($source, $target, $alpha)) {
                return true;
            }

             return false;
            break;

            default:
            return false;
            break;
        }
    }

    public function createRandImage($randCode = null, $width = 60, $height = 24, $mix = 50)
    {
        if (!$randCode) {
            $randCode = rand(1000, 9999);
        }
        $randCode = strval($randCode);
        $ml = intval(rand(2, 6));
        $image = imagecreatetruecolor($width, $height);
        for ($i = 0; $i < 4; $i++) {
            $text_color = imagecolorallocate($image, rand(128, 255), rand(128, 255), rand(128, 255));
            if (intval(rand(0, 1))) {
                imagechar($image, 5, $ml + intval($i * 12), intval(rand(1, 10)), $randCode[$i], $text_color);
            } else {
                imagecharup($image, 5, $ml + intval($i * 12), intval(rand(8, $height - 8)), $randCode[$i], $text_color);
            }
        }
        imagepng($image);
        imagedestroy($image);

        return $randCode;
    }
}
