$packageName = 'sonarqube-scanner.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-windows.zip'
$checksumType = 'sha256'
$checksum = '9dddacd79ae5c6ac7805a309e1cfb753f59ed4bc2a09c761e61e472d2fce747d'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType

# Generate ignoring files to skip automatic generation of shims
$installDir = "$toolsDir\sonar-scanner-3.3.0.1492-windows"
$files = Get-ChildItem "$installDir\jre\bin" -include *.exe -recurse
foreach ($file in $files) {
    #generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
}

# Install the wanted shim
Install-BinFile "sonar-scanner" "$toolsDir\sonar-scanner-3.3.0.1492-windows\bin\sonar-scanner.bat"
