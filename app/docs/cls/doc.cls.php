<?php


class doc_docs
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
	}

	public function getDocNumber($args)
	{
        $data = array('count(*) as number','docs',$args);
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r['number'];
	}

	public function getDocList($args,$page,$number = 20,$order = 'docsequence desc,docid DESC')
	{
		$data = array(
			'select' => false,
			'table' => 'docs',
			'query' => $args,
			'orderby' => $order
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	public function delDoc($id)
	{
        $this->db->delElement(array('table' => 'docs','query' => array(array('AND',"docid = :docid",'docid',$id))));
        $this->db->delElement(array('table' => 'dochistory','query' => array(array('AND',"dhdocid = :dhdocid",'dhdocid',$id))));
		return true;
	}

	public function modifyDoc($id,$args)
	{
		$data = array(
			'table' => 'docs',
			'value' => $args,
			'query' => array(array('AND',"docid = :docid",'docid',$id))
		);
		return $this->db->updateElement($data);
	}

	public function addDoc($args)
	{
		return $this->db->insertElement(array('table' => 'docs','query' => $args));
	}

	public function getDocById($id,$withcontent = true)
	{
		$data = array(false,'docs',array(array('AND',"docid = :docid",'docid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		if($r['doccontentid'] && $withcontent)
		{
			$data = array(false,'dochistory',array(array('AND',"dhid = :dhid",'dhid',$r['doccontentid'])));
			$sql = $this->pdosql->makeSelect($data);
			$rs = $this->db->fetch($sql);
			$r['content'] = $rs;
        }
		return $r;
	}

    public function getDocHistroyById($dhid)
    {
        $data = array(false,'dochistory',array(array('AND',"dhid = :dhid",'dhid',$dhid)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function getDocHistoryByArgs($args)
	{
        $data = array(false,'dochistory',$args);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}

	public function getDocHistoryListByDocid($id,$page,$number = 20,$order = 'dhid DESC')
	{
        $data = array(
            'select' => false,
            'table' => 'dochistory',
            'query' => array(array("AND","dhdocid = :dhdocid","dhdocid",$id)),
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}

    public function getDocHistoryListByArgs($args,$page,$number = 20,$order = 'dhid DESC')
    {
        $data = array(
            'select' => false,
            'table' => 'dochistory',
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    public function delDocHistory($id)
    {
        $this->db->delElement(array('table' => 'dochistory','query' => array(array('AND',"dhid = :dhid",'dhid',$id),array('AND',"dhstatus = 2"))));
        return true;
    }

    public function modifyDocHistory($id,$args)
    {
        $data = array(
            'table' => 'dochistory',
            'value' => $args,
            'query' => array(array('AND',"dhid = :dhid",'dhid',$id))
        );
        return $this->db->updateElement($data);
    }

    public function addDocHistory($args)
    {
        return $this->db->insertElement(array('table' => 'dochistory','query' => $args));
    }
}

?>
