<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * This source file is subject to the MIT license that is bundled.
 */

class app
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->files = $this->G->make('files');
        $this->session = $this->G->make('session');
        $this->tpl = $this->G->make('tpl');
        $this->ev = $this->G->make('ev');
    }
}
