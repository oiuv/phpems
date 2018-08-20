<?php

class app
{
	public $G;
	//联系密钥
	private $sc = '';

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->tpl = $this->G->make('tpl');
		$this->sql = $this->G->make('sql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->html = $this->G->make('html');
		$this->session = $this->G->make('session');
		$this->exam = $this->G->make('exam','exam');
		$this->user = $this->G->make('user','user');
	}
}

?>