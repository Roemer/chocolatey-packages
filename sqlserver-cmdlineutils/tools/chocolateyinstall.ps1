$packageName = 'sqlserver-cmdlineutils'
$installerType = 'msi'
$silentArgs= '/Passive /NoRestart IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES'
$url = 'https://download.microsoft.com/download/C/8/8/C88C2E51-8D23-4301-9F4B-64C8E2F163C5/x86/MsSqlCmdLnUtils.msi'
$url64 = 'https://download.microsoft.com/download/C/8/8/C88C2E51-8D23-4301-9F4B-64C8E2F163C5/x64/MsSqlCmdLnUtils.msi'
$checksumType = 'sha256'
$checksum = 'E871080C929036C528133C56BA4CEF7C35617F31812F877012BE9189B60D11BE'
$checksum64 = '9479810A2EA8954E0CACD3D47FE0BCB81647B9CFB5EFD6AB79B76A6CCADCEFE7'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"
