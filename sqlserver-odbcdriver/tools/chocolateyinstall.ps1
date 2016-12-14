$packageName = 'sqlserver-odbcdriver'
$installerType = 'msi'
$silentArgs= '/Passive /NoRestart IACCEPTMSODBCSQLLICENSETERMS=YES'
$url = 'https://download.microsoft.com/download/D/5/E/D5EEF288-A277-45C8-855B-8E2CB7E25B96/13.1.811.168/x86/msodbcsql.msi'
$url64 = 'https://download.microsoft.com/download/D/5/E/D5EEF288-A277-45C8-855B-8E2CB7E25B96/13.1.811.168/amd64/msodbcsql.msi'
$checksumType = 'sha256'
$checksum = 'B9B5E08D0E53D075FC24AD75FFD8EFC0FD0B36248991B2F2EC823E5A7165B1E3'
$checksum64 = '43A0461DA90DE02B795BEDBF5E135857E0229B97F8C014847A1F404497428D94'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"
