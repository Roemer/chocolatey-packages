$packageName = 'sqlserver-odbcdriver-17'
$installerType = 'msi'
$silentArgs= '/qn /norestart IACCEPTMSODBCSQLLICENSETERMS=YES'
$url = '{link32}'
$url64 = '{link64}'
$checksumType = 'sha256'
$checksum = '{checksum32}'
$checksum64 = '{checksum64}'

$32DllPath = Join-Path -Path $Env:SystemRoot -ChildPath (Join-Path -Path 'system32' -ChildPath 'msodbcsql17.dll')
$64DllPath = Join-Path -Path $Env:SystemRoot -ChildPath (Join-Path -Path 'syswow64' -ChildPath 'msodbcsql17.dll')
$32BitNeeded = ([Version]$(Get-ItemProperty -Path $32DllPath -ErrorAction:Ignore).VersionInfo.ProductVersion) -lt [Version]$Env:ChocolateyPackageVersion  
$64BitNeeded = ([Version]$(Get-ItemProperty -Path $64DllPath -ErrorAction:Ignore).VersionInfo.ProductVersion) -lt [Version]$Env:ChocolateyPackageVersion

$UpdateNeeded = ($32BitNeeded -or $64BitNeeded -or $Env:ChocolateyForce)
if ($UpdateNeeded)
{
    Install-ChocolateyPackageCmdlet "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType" -UseOriginalLocation
}
