$packageName = 'sqlserver-odbcdriver'
$installerType = 'msi'
$silentArgs= '/qn /norestart IACCEPTMSODBCSQLLICENSETERMS=YES'
$url = '{link32}'
$url64 = '{link64}'
$checksumType = 'sha256'
$checksum = '{checksum32}'
$checksum64 = '{checksum64}'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"
