$fsLogixArchiveZip = "fslogix_$(get-date -Format yyddMMhhmmss).zip"
$fslogixArchivePath = Join-Path $env:Temp $fsLogixArchiveZip

Invoke-WebRequest -Uri "https://aka.ms/fslogix_download" -OutFile $fslogixArchivePath

$fsLogixDir = Join-Path $env:Temp $fsLogixArchiveZip.replace('.zip', '')
Expand-Archive -Path $fslogixArchivePath -DestinationPath $fsLogixDir

$fsLogixInstaller = Join-Path $fsLogixDir "x64\Release\FSLogixAppsSetup.exe"
$fsLogixInstallLog = Join-Path $env:Temp $fsLogixArchiveZip.Replace(".zip", ".log")

Start-Process -Wait -FilePath $fsLogixInstaller -ArgumentList "/install /quiet /norestart /log $fsLogixInstallLog"