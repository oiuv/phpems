<?php

class sphinx
{
	public $G;
	public $serial;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->_initGms();
	}

	private function _initGms()
	{
		if(!$this->serial)
		{
			include "lib/include/php_serial.php";
			$this->sphinxapi = new php_serial;
		}
	}

	public function connectSocket($port = "COM1")
	{
		$ports = array('com1'=>'COM1','com2'=>'COM2','com3'=>'COM3','usb1'=>"/dev/ttyUSB0",'usb2'=>"/dev/ttyUSB1");
		$port = strtolower($port);
		$this->serial->deviceSet($ports[$port]);
		$this->serial->deviceOpen();
	}

	private function hex2str($str)
	{
		$hexstring=iconv("UTF-8", "UCS-2BE", $str);
		$str = '';
		for($i=0; $i<strlen($hexstring)/2; $i++)
		{
			$str .= sprintf("%02X",ord(substr($hexstring,$i*2+1,1)));
			$str .= sprintf("%02X",ord(substr($hexstring,$i*2,1)));
		}
		$t = array();
		$number = strlen($str);
		for($i = 0;$i< $number;$i++)
		{
			$m = intval($i / 4);
			if($i%4 == 0)
			{
				$l = $m * 4 + 2;
				$t[$l] = $str[$i];
			}
			elseif($i%4 == 1)
			{
				$l = $m * 4 + 3;
				$t[$l] = $str[$i];
			}
			elseif($i%4 == 2)
			{
				$l = $m * 4 ;
				$t[$l] = $str[$i];
			}
			else
			{
				$l = $m * 4 + 1;
				$t[$l] = $str[$i];
			}
		}
		ksort($t);
		reset($t);
		return implode('',$t);
	}

	private function _invertNumbers($msisdn)
	{
		$len = strlen($msisdn);
		if ( 0 != fmod($len, 2) )
		{
			$msisdn .= "F";
			$len = $len + 1;
		}

		for ($i=0; $i<$len; $i+=2)
		{
			$t = $msisdn[$i];
			$msisdn[$i] = $msisdn[$i+1];
			$msisdn[$i+1] = $t;
		}
		return $msisdn;
	}

	public function sendGmsMessage($number,$message)
	{
		$phone_sendto = $this->invertNumbers('86'.$number);
		//瑕佸彂閫佺殑鐭俊:I am rainbird,i love 涓浗
		$message = $this->hex2str($message);
		$mess = "11000D91".$phone_sendto."000800".sprintf("%02X",strlen($message)/2).$message;
		$this->serial->sendMessage("at+cmgf=0".chr(13));
		$this->serial->sendMessage("at+cmgs=".sprintf("%d",strlen($mess)/2).chr(13));
		//涓嶅姞鐭俊涓績鍙风爜
		$this->serial->sendMessage('00'.$mess.chr(26));
		//鍔犵煭淇′腑蹇冨彿鐮�
		//$phone_center = InvertNumbers('8613800100500');
		//$mess_ll = "0891".$phone_center.$mess;
		//$serial->sendMessage($mess_ll.chr(26));
	}

	public function __destruct()
	{
		$this->serial->deviceClose();
	}
}

?>
