$packageName = 'sqlserver-cmdlineutils'
$installerType = 'msi'
$silentArgs= '/Passive /NoRestart IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES'
$url = 'https://download.microsoft.com/download/C/8/8/C88C2E51-8D23-4301-9F4B-64C8E2F163C5/Command%20Line%20Utilities%20MSI%20files/x86/MsSqlCmdLnUtils.msi'
$url64 = 'https://download.microsoft.com/download/C/8/8/C88C2E51-8D23-4301-9F4B-64C8E2F163C5/Command%20Line%20Utilities%20MSI%20files/amd64/MsSqlCmdLnUtils.msi'
$checksumType = 'sha256'
$checksum = 'D7A45665A868172FB332522379165FBFAD04E43428FDA8ED57F77AB8790F66B7'
$checksum64 = 'DB4A189DEA2734BB0DF3049AFA6A818FEDD6B862CBD2A54C955814411A31C88C'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"
