<?php

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

?>