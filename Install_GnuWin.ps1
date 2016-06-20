$downloadUrl = "http://internode.dl.sourceforge.net/project/gnuwin32/make/3.81/make-3.81.exe"
$dest = $env:Temp + "\make-3.81.exe"

Write-Host "Downloading make to" $dest

$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($downloadUrl, $dest)

Set-ExecutionPolicy RemoteSigned -Force -Scope Process
(Start-Process -FilePath $dest -ArgumentList "/VERYSILENT /SUPPRESSMSGBOXES" -Wait -Passthru).ExitCode
Write-Host "Successfully installed"

# Add GnuWin to system path
[Environment]::SetEnvironmentVariable("PATH","$env:path;$env:systemdrive\Program Files (x86)\GnuWin32\bin","MACHINE")
