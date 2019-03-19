$packageName = 'sqlserver-odbcdriver'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$silentArgs = '/qn /norestart IACCEPTMSODBCSQLLICENSETERMS=YES'
$packageArgs = @{
    packageName   = $packageName
    fileType      = 'msi'
    file          = (Join-Path $toolsDir 'msodbcsql_17.3.1.1_x86.msi')
    file64        = (Join-Path $toolsDir 'msodbcsql_17.3.1.1_x64.msi')
    silentArgs    = $silentArgs
    validExitCodes= @(0, 3010)
}
Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force $packageArgs.file
Remove-Item -Force $packageArgs.file64
