$packageName = 'sqlserver-cmdlineutils'
$installerType = 'msi'
$silentArgs= '/Passive /NoRestart IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES'
$url = 'https://download.microsoft.com/download/4/A/3/4A323490-8EC0-48AE-9F22-638AA6C508C6/EN/x86/MsSqlCmdLnUtils.msi'
$url64 = 'https://download.microsoft.com/download/4/A/3/4A323490-8EC0-48AE-9F22-638AA6C508C6/EN/x64/MsSqlCmdLnUtils.msi'
$checksumType = 'sha256'
$checksum = '5EB72A262700EFDE418BEC2B48F06E4D3CDED442CCA4F5F18EC8865121BB13C9'
$checksum64 = '36D06ECF77DDB75A68F6BF3E0A7CEC1FF5F3DB1432672EB2950301BEC2500BC1'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"
