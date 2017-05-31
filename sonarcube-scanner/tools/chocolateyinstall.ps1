$packageName = 'sonarcube-scanner'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778.zip'
$checksumType = 'sha256'
$checksum = '4E3035F208548621433C8713DE5E536AA81AE1AB4DF2998E041B9236B3BA3170'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "sonar-runner" "$toolsDir\sonar-scanner-3.0.3.778\bin\sonar-runner.bat"
Install-BinFile "sonar-scanner" "$toolsDir\sonar-scanner-3.0.3.778\bin\sonar-scanner.bat"
