<?php
/*
 * Created on 2013-9-9
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

class smtp
{
	var $host;          //主机
	var $port;          //端口 一般为25
	var $user;          //SMTP认证的帐号
	var $pass;          //认证密码
	var $debug = true;   //是否显示和服务器会话信息？
	var $conn;
	var $result_str;      //结果
	var $in;          //客户机发送的命令
	var $from_r;          //真实的源信箱,一般与smtp服务器的用户名一样，否则可能由于smtp服务器的设置而发送不成功
	var $mailformat=1; //邮件格式 0=普通文本 1=html邮件

	function smtp_mail($host,$port,$user,$pass,$debug=false)
	{
		$this->host   = $host;
		$this->port   = $port;
		$this->user   = base64_encode($user);
		$this->pass   = base64_encode($pass);
		$this->debug = $debug;
		$this->socket = socket_create (AF_INET, SOCK_STREAM, SOL_TCP); //具体用法请参考手册
		if($this->socket)
		{
			$this->result_str = "创建SOCKET:".socket_strerror(socket_last_error());
			$this->debug_show($this->result_str);
		}
		else
		{
			exit("初始化失败，请检查您的网络连接和参数");
		}
		$this->conn = socket_connect($this->socket,$this->host,$this->port);
		if($this->conn)
		{
			$this->result_str = "创建SOCKET连接:".socket_strerror(socket_last_error());
			$this->debug_show($this->result_str);
		}
		else
		{
			exit("初始化失败，请检查您的网络连接和参数");
		}
		$this->result_str = "服务器应答：<font color=#cc0000>".socket_read ($this->socket, 1024)."</font>";
		$this->debug_show($this->result_str);
	}

	function debug_show($str)
	{
		if($this->debug)
		{
			echo $str."<p>\r\n";
		}
	}

	function send($from,$to,$subject,$body)
	{
		if($from == "" || $to == "")
		{
			exit("请输入信箱地址");
		}
		if($subject == "") $sebject = "无标题";
		if($body    == "") $body    = "无内容";

		$All          = "From:".$from."\r\n";
		$All          .= "To:".$to."\r\n";
		$All          .= "Subject:".$subject."\r\n";
		if($this->mailformat==1) $All.= "Content-Type: text/html;\r\n";
		else $All .= "Content-Type: text/plain;\r\n";
		$All          .= "charset=\r\n\r\n";
		$All          .= $body;
		/*
		如果把$All的内容再加处理，就可以实现发送MIME邮件了
		不过还需要加很多程序
		*/


		//以下是和服务器会话
		$this->in       = "EHLO HELO\r\n";
		$this->docommand();

		$this->in       = "AUTH LOGIN\r\n";
		$this->docommand();

		$this->in       = $this->user."\r\n";
		$this->docommand();

		$this->in       = $this->pass."\r\n";
		$this->docommand();

		if(!preg_match("/235/",$this->result_str)){
		    $this->result_str = "smtp 认证失败";
		    $this->debug_show($this->result_str);
		    return 0;
		 }

		$this->in       = "MAIL FROM:".$from."\r\n";
		$this->docommand();

		$this->in       = "RCPT TO:".$to."\r\n";
		$this->docommand();

		$this->in       = "DATA\r\n";
		$this->docommand();

		$this->in       = $All."\r\n.\r\n";
		$this->docommand();

		if(!preg_match("/250/",$this->result_str)){
		    $this->result_str = "邮件发送失败";
		    $this->debug_show($this->result_str);
		    return 0;
		 }

		$this->in       = "QUIT\r\n";
		$this->docommand();

		//结束，关闭连接
		return 1;
	}

	function docommand()
	{
		socket_write ($this->socket, $this->in, strlen ($this->in));
		$this->debug_show("客户机命令：".$this->in);
		$this->result_str = "服务器应答：<span color=#cc0000>".socket_read ($this->socket, 1024)."</span>";
		$this->debug_show($this->result_str);
	}

} //end class


?>
