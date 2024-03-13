$packageName = 'sqlserver-odbcdriver-17'
$installerType = 'msi'
$silentArgs = '/qn /norestart IACCEPTMSODBCSQLLICENSETERMS=YES'
$url = '{link32}'
$url64 = '{link64}'
$checksumType = 'sha256'
$checksum = '{checksum32}'
$checksum64 = '{checksum64}'

$32DllPath = Join-Path -Path $Env:SystemRoot -ChildPath (Join-Path -Path 'system32' -ChildPath 'msodbcsql17.dll')
$64DllPath = Join-Path -Path $Env:SystemRoot -ChildPath (Join-Path -Path 'syswow64' -ChildPath 'msodbcsql17.dll')
# Check if the file is missing or the version number is older
$32BitNeeded = -not(Test-path $32DllPath) -or (([Version]$(Get-ItemProperty -Path $32DllPath).VersionInfo.ProductVersion) -lt [Version]$Env:ChocolateyPackageVersion)
$64BitNeeded = -not(Test-path $64DllPath) -or (([Version]$(Get-ItemProperty -Path $64DllPath).VersionInfo.ProductVersion) -lt [Version]$Env:ChocolateyPackageVersion)

$updateNeeded = ($32BitNeeded -or $64BitNeeded -or $Env:ChocolateyForce)
if ($updateNeeded) {
    Install-ChocolateyPackage -PackageName $packageName `
        -FileType $installerType `
        -SilentArgs $silentArgs `
        -Url $url `
        -Url64bit $url64 `
        -ValidExitCodes @(0) `
        -Checksum $checksum `
        -ChecksumType $checksumType `
        -Checksum64 $checksum64 `
        -ChecksumType64 $checksumType
} else {
    Write-Warning "Package not installed as the odbc driver is already present. Use --force to force the a re-installation."
}
