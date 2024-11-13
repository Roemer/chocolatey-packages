$packageName = 'sqlserver-cmdlineutils'
$installerType = 'msi'
$silentArgs= '/qn /norestart IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES'
$url = '{link32}'
$url64 = '{link64}'
$checksumType = 'sha256'
$checksum = '{checksum32}'
$checksum64 = '{checksum64}'

Install-ChocolateyPackage -PackageName "$packageName" `
    -FileType "$installerType" `
    -SilentArgs "$silentArgs" `
    -Url "$url" `
    -Url64bit "$url64" `
    -Checksum "$checksum" `
    -ChecksumType "$checksumType" `
    -Checksum64 "$checksum64" `
    -ChecksumType64 "$checksumType" `
    -validExitCodes @(0)
