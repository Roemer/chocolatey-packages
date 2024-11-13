$packageName = 'sonarqube-scanner.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-{version}-windows-x64.zip'
$checksumType = 'sha256'
$checksum = '{checksum}'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType

# Generate ignoring files to skip automatic generation of shims
$installDir = "$toolsDir\sonar-scanner-{version}-windows-x64"
$files = Get-ChildItem "$installDir\jre\bin" -include *.exe -recurse
foreach ($file in $files) {
    # Generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
}

# Install the wanted shim
Install-BinFile "sonar-scanner" "$installDir\bin\sonar-scanner.bat"
