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

define('SERIAL_DEVICE_NOTSET', 0);
define('SERIAL_DEVICE_SET', 1);
define('SERIAL_DEVICE_OPENED', 2);

/**
 * Serial port control class.
 *
 * THIS PROGRAM COMES WITH ABSOLUTELY NO WARANTIES !
 * USE IT AT YOUR OWN RISKS !
 *
 * @author Ray Sanchez <thenux@gmail.com>
 * @thanks Auraien Derouineau for finding how to open serial ports with windows
 * @thanks Alec Avedisyan for help and testing with reading
 *
 * @copyright under GPL 2 licence
 */
class phpSerial
{
    public $_device = null;
    public $_windevice = null;
    public $_dHandle = null;
    public $_dState = SERIAL_DEVICE_NOTSET;
    public $_buffer = '';
    public $_os = '';

    /**
     * This var says if buffer should be flushed by sendMessage (true) or manualy (false).
     *
     * @var bool
     */
    public $autoflush = true;

    /**
     * Constructor. Perform some checks about the OS and setserial.
     *
     * @return phpSerial
     */
    public function phpSerial()
    {
        setlocale(LC_ALL, 'en_US');

        $sysname = php_uname();

        if ('Linux' === substr($sysname, 0, 5)) {
            $this->_os = 'linux';

            if (0 === $this->_exec('stty --version')) {
                register_shutdown_function([$this, 'deviceClose']);
            } else {
                trigger_error('No stty availible, unable to run.', E_USER_ERROR);
            }
        } elseif ('Windows' === substr($sysname, 0, 7)) {
            $this->_os = 'windows';
            register_shutdown_function([$this, 'deviceClose']);
        } else {
            trigger_error('Host OS is neither linux nor windows, unable tu run.', E_USER_ERROR);
            exit();
        }
    }

    //
    // OPEN/CLOSE DEVICE SECTION -- {START}
    //

    /**
     * Device set function : used to set the device name/address.
     * -> linux : use the device address, like /dev/ttyS0
     * -> windows : use the COMxx device name, like COM1 (can also be used
     *     with linux).
     *
     * @param string $device the name of the device to be used
     *
     * @return bool
     */
    public function deviceSet($device)
    {
        if (SERIAL_DEVICE_OPENED !== $this->_dState) {
            if ('linux' === $this->_os) {
                if (preg_match("@^COM(\d+):?$@i", $device, $matches)) {
                    $device = '/dev/ttyS'.($matches[1] - 1);
                }

                if (0 === $this->_exec('stty -F '.$device)) {
                    $this->_device = $device;
                    $this->_dState = SERIAL_DEVICE_SET;

                    return true;
                }
            } elseif ('windows' === $this->_os) {
                if (preg_match("@^COM(\d+):?$@i", $device, $matches) and 0 === $this->_exec(exec('mode '.$device))) {
                    $this->_windevice = 'COM'.$matches[1];
                    $this->_device = "\\.\com".$matches[1];
                    $this->_dState = SERIAL_DEVICE_SET;

                    return true;
                }
            }

            trigger_error('Specified serial port is not valid', E_USER_WARNING);

            return false;
        }

        trigger_error('You must close your device before to set an other one', E_USER_WARNING);

        return false;
    }

    /**
     * Opens the device for reading and/or writing.
     *
     * @param string $mode Opening mode : same parameter as fopen()
     *
     * @return bool
     */
    public function deviceOpen($mode = 'r+b')
    {
        if (SERIAL_DEVICE_OPENED === $this->_dState) {
            trigger_error('The device is already opened', E_USER_NOTICE);

            return true;
        }

        if (SERIAL_DEVICE_NOTSET === $this->_dState) {
            trigger_error('The device must be set before to be open', E_USER_WARNING);

            return false;
        }

        if (!preg_match("@^[raw]\+?b?$@", $mode)) {
            trigger_error('Invalid opening mode : '.$mode.'. Use fopen() modes.', E_USER_WARNING);

            return false;
        }

        $this->_dHandle = @fopen($this->_device, $mode);

        if (false !== $this->_dHandle) {
            stream_set_blocking($this->_dHandle, 0);
            $this->_dState = SERIAL_DEVICE_OPENED;

            return true;
        }

        $this->_dHandle = null;
        trigger_error('Unable to open the device', E_USER_WARNING);

        return false;
    }

    /**
     * Closes the device.
     *
     * @return bool
     */
    public function deviceClose()
    {
        if (SERIAL_DEVICE_OPENED !== $this->_dState) {
            return true;
        }

        if (fclose($this->_dHandle)) {
            $this->_dHandle = null;
            $this->_dState = SERIAL_DEVICE_SET;

            return true;
        }

        trigger_error('Unable to close the device', E_USER_ERROR);

        return false;
    }

    //
    // OPEN/CLOSE DEVICE SECTION -- {STOP}
    //

    //
    // CONFIGURE SECTION -- {START}
    //

    /**
     * Configure the Baud Rate
     * Possible rates : 110, 150, 300, 600, 1200, 2400, 4800, 9600, 38400,
     * 57600 and 115200.
     *
     * @param int $rate the rate to set the port in
     *
     * @return bool
     */
    public function confBaudRate($rate)
    {
        if (SERIAL_DEVICE_SET !== $this->_dState) {
            trigger_error('Unable to set the baud rate : the device is either not set or opened', E_USER_WARNING);

            return false;
        }

        $validBauds = [
            110    => 11,
            150    => 15,
            300    => 30,
            600    => 60,
            1200   => 12,
            2400   => 24,
            4800   => 48,
            9600   => 96,
            19200  => 19,
            38400  => 38400,
            57600  => 57600,
            115200 => 115200,
        ];

        if (isset($validBauds[$rate])) {
            $out = '';
            if ('linux' === $this->_os) {
                $ret = $this->_exec('stty -F '.$this->_device.' '.(int) $rate, $out);
            } elseif ('windows' === $this->_os) {
                $ret = $this->_exec('mode '.$this->_windevice.' BAUD='.$validBauds[$rate], $out);
            } else {
                return false;
            }

            if (0 !== $ret) {
                trigger_error('Unable to set baud rate: '.$out[1], E_USER_WARNING);

                return false;
            }
        }
    }

    /**
     * Configure parity.
     * Modes : odd, even, none.
     *
     * @param string $parity one of the modes
     *
     * @return bool
     */
    public function confParity($parity)
    {
        if (SERIAL_DEVICE_SET !== $this->_dState) {
            trigger_error('Unable to set parity : the device is either not set or opened', E_USER_WARNING);

            return false;
        }

        $args = [
            'none' => '-parenb',
            'odd'  => 'parenb parodd',
            'even' => 'parenb -parodd',
        ];

        if (!isset($args[$parity])) {
            trigger_error('Parity mode not supported', E_USER_WARNING);

            return false;
        }

        $out = '';
        if ('linux' === $this->_os) {
            $ret = $this->_exec('stty -F '.$this->_device.' '.$args[$parity], $out);
        } else {
            $ret = $this->_exec('mode '.$this->_windevice.' PARITY='.$parity[0], $out);
        }

        if (0 === $ret) {
            return true;
        }

        trigger_error('Unable to set parity : '.$out[1], E_USER_WARNING);

        return false;
    }

    /**
     * Sets the length of a character.
     *
     * @param int $int length of a character (5 <= length <= 8)
     *
     * @return bool
     */
    public function confCharacterLength($int)
    {
        if (SERIAL_DEVICE_SET !== $this->_dState) {
            trigger_error('Unable to set length of a character : the device is either not set or opened', E_USER_WARNING);

            return false;
        }

        $int = (int) $int;
        if ($int < 5) {
            $int = 5;
        } elseif ($int > 8) {
            $int = 8;
        }

        $out = '';
        if ('linux' === $this->_os) {
            $ret = $this->_exec('stty -F '.$this->_device.' cs'.$int, $out);
        } else {
            $ret = $this->_exec('mode '.$this->_windevice.' DATA='.$int, $out);
        }

        if (0 === $ret) {
            return true;
        }

        trigger_error('Unable to set character length : '.$out[1], E_USER_WARNING);

        return false;
    }

    /**
     * Sets the length of stop bits.
     *
     * @param float $length the length of a stop bit. It must be either 1,
     *                      1.5 or 2. 1.5 is not supported under linux and on some computers.
     *
     * @return bool
     */
    public function confStopBits($length)
    {
        if (SERIAL_DEVICE_SET !== $this->_dState) {
            trigger_error('Unable to set the length of a stop bit : the device is either not set or opened', E_USER_WARNING);

            return false;
        }

        if (1 != $length and 2 != $length and 1.5 != $length and !(1.5 == $length and 'linux' === $this->_os)) {
            trigger_error('Specified stop bit length is invalid', E_USER_WARNING);

            return false;
        }

        $out = '';
        if ('linux' === $this->_os) {
            $ret = $this->_exec('stty -F '.$this->_device.' '.((1 == $length) ? '-' : '').'cstopb', $out);
        } else {
            $ret = $this->_exec('mode '.$this->_windevice.' STOP='.$length, $out);
        }

        if (0 === $ret) {
            return true;
        }

        trigger_error('Unable to set stop bit length : '.$out[1], E_USER_WARNING);

        return false;
    }

    /**
     * Configures the flow control.
     *
     * @param string $mode Set the flow control mode. Availible modes :
     *                     -> "none" : no flow control
     *                     -> "rts/cts" : use RTS/CTS handshaking
     *                     -> "xon/xoff" : use XON/XOFF protocol
     *
     * @return bool
     */
    public function confFlowControl($mode)
    {
        if (SERIAL_DEVICE_SET !== $this->_dState) {
            trigger_error('Unable to set flow control mode : the device is either not set or opened', E_USER_WARNING);

            return false;
        }

        $linuxModes = [
            'none'     => 'clocal -crtscts -ixon -ixoff',
            'rts/cts'  => '-clocal crtscts -ixon -ixoff',
            'xon/xoff' => '-clocal -crtscts ixon ixoff',
        ];
        $windowsModes = [
            'none'     => 'xon=off octs=off rts=on',
            'rts/cts'  => 'xon=off octs=on rts=hs',
            'xon/xoff' => 'xon=on octs=off rts=on',
        ];

        if ('none' !== $mode and 'rts/cts' !== $mode and 'xon/xoff' !== $mode) {
            trigger_error('Invalid flow control mode specified', E_USER_ERROR);

            return false;
        }

        $out = '';
        if ('linux' === $this->_os) {
            $ret = $this->_exec('stty -F '.$this->_device.' '.$linuxModes[$mode], $out);
        } else {
            $ret = $this->_exec('mode '.$this->_windevice.' '.$windowsModes[$mode], $out);
        }

        if (0 === $ret) {
            return true;
        }

        trigger_error('Unable to set flow control : '.$out[1], E_USER_ERROR);

        return false;
    }

    /**
     * Sets a setserial parameter (cf man setserial)
     * NO MORE USEFUL !
     * 	-> No longer supported
     * 	-> Only use it if you need it.
     *
     * @param string $param parameter name
     * @param string $arg   parameter value
     *
     * @return bool
     */
    public function setSetserialFlag($param, $arg = '')
    {
        if (!$this->_ckOpened()) {
            return false;
        }

        $return = exec('setserial '.$this->_device.' '.$param.' '.$arg.' 2>&1');

        if ('I' === $return[0]) {
            trigger_error('setserial: Invalid flag', E_USER_WARNING);

            return false;
        } elseif ('/' === $return[0]) {
            trigger_error('setserial: Error with device file', E_USER_WARNING);

            return false;
        }

        return true;
    }

    //
    // CONFIGURE SECTION -- {STOP}
    //

    //
    // I/O SECTION -- {START}
    //

    /**
     * Sends a string to the device.
     *
     * @param string $str          string to be sent to the device
     * @param float  $waitForReply time to wait for the reply (in seconds)
     */
    public function sendMessage($str, $waitForReply = 0.1)
    {
        $this->_buffer .= $str;

        if (true === $this->autoflush) {
            $this->flush();
        }

        usleep((int) ($waitForReply * 1000000));
    }

    /**
     * Reads the port until no new datas are availible, then return the content.
     *
     * @pararm int $count number of characters to be read (will stop before
     * 	if less characters are in the buffer)
     *
     * @return string
     */
    public function readPort($count = 0)
    {
        if (SERIAL_DEVICE_OPENED !== $this->_dState) {
            trigger_error('Device must be opened to read it', E_USER_WARNING);

            return false;
        }

        if ('linux' === $this->_os) {
            $content = '';
            $i = 0;

            if (0 !== $count) {
                do {
                    if ($i > $count) {
                        $content .= fread($this->_dHandle, ($count - $i));
                    } else {
                        $content .= fread($this->_dHandle, 128);
                    }
                } while (($i += 128) === strlen($content));
            } else {
                do {
                    $content .= fread($this->_dHandle, 128);
                } while (($i += 128) === strlen($content));
            }

            return $content;
        } elseif ('windows' === $this->_os) {
            /* Do nohting : not implented yet */
        }

        trigger_error('Reading serial port is not implemented for Windows', E_USER_WARNING);

        return false;
    }

    /**
     * Flushes the output buffer.
     *
     * @return bool
     */
    public function flush()
    {
        if (!$this->_ckOpened()) {
            return false;
        }

        if (false !== fwrite($this->_dHandle, $this->_buffer)) {
            $this->_buffer = '';

            return true;
        }

        $this->_buffer = '';
        trigger_error('Error while sending message', E_USER_WARNING);

        return false;
    }

    //
    // I/O SECTION -- {STOP}
    //

    //
    // INTERNAL TOOLKIT -- {START}
    //

    public function _ckOpened()
    {
        if (SERIAL_DEVICE_OPENED !== $this->_dState) {
            trigger_error('Device must be opened', E_USER_WARNING);

            return false;
        }

        return true;
    }

    public function _ckClosed()
    {
        if (SERIAL_DEVICE_CLOSED !== $this->_dState) {
            trigger_error('Device must be closed', E_USER_WARNING);

            return false;
        }

        return true;
    }

    public function _exec($cmd, &$out = null)
    {
        $desc = [
            1 => ['pipe', 'w'],
            2 => ['pipe', 'w'],
        ];

        $pipes = null;
        $proc = proc_open($cmd, $desc, $pipes);

        $ret = stream_get_contents($pipes[1]);
        $err = stream_get_contents($pipes[2]);

        fclose($pipes[1]);
        fclose($pipes[2]);

        $retVal = proc_close($proc);

        if (2 == func_num_args()) {
            $out = [$ret, $err];
        }

        return $retVal;
    }

    //
    // INTERNAL TOOLKIT -- {STOP}
    //
}
