$packageName = 'sqlserver-cmdlineutils'
$installerType = 'msi'
$silentArgs= '/Passive /NoRestart IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES'
$url = 'https://download.microsoft.com/download/5/5/B/55BEFD44-B899-4B54-ACD7-506E03142B34/1033/x86/MsSqlCmdLnUtils.msi'
$url64 = 'https://download.microsoft.com/download/5/5/B/55BEFD44-B899-4B54-ACD7-506E03142B34/1033/x64/MsSqlCmdLnUtils.msi'
$checksumType = 'sha256'
$checksum = '91430BA2CD4AE04260895B1080AE7965F64AEFA46C92CE64B26BDC59602B5F4F'
$checksum64 = '33B136C49105CCBEA415038520EFBB2370F7B4A80B20BFF47F8AE5D155BB1C5D'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"