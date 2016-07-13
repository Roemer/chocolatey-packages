$packageName = 'sqlserver-odbcdriver'
$installerType = 'msi'
$silentArgs= '/Passive /NoRestart IACCEPTMSODBCSQLLICENSETERMS=YES'
$url = 'https://download.microsoft.com/download/5/7/2/57249A3A-19D6-4901-ACCE-80924ABEB267/1033/x86/msodbcsql.msi'
$url64 = 'https://download.microsoft.com/download/5/7/2/57249A3A-19D6-4901-ACCE-80924ABEB267/1033/amd64/msodbcsql.msi'
$checksumType = 'sha256'
$checksum = 'CE9B9DDD8F38926DF374C1B947DD8A312495E8D81BE985109347E432257BA53E'
$checksum64 = 'CC7FD7CBB9840DE239DCC0C8AB12D2CC2BCF411AF4B0B8BD5AB0730805F2F4B3'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"