$ErrorActionPreference = 'Stop'
 
$packageName = 'sonarcube-scanner'
$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = "$toolsPath\sonar-scanner-3.2.0.1227-windows"

# Unpack the zip file
$packageArgs = @{
    PackageName  = $packageName
    File         = "$toolsPath\sonar-scanner-cli-3.2.0.1227-windows.zip"
    Destination  = $toolsPath
}
Get-ChocolateyUnzip @packageArgs

# Generate ignoring files to skip automatic generation of shims
$files = Get-ChildItem "$installDir\jre\bin" -include *.exe -recurse
foreach ($file in $files) {
    #generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
}

# Install the wanted shim
Install-BinFile "sonar-scanner" "$installDir\bin\sonar-scanner.bat"

# Remove the zip file
Remove-Item -force "$toolsPath\*.zip" -ea 0
