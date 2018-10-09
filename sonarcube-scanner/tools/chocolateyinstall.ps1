$packageName = 'sonarcube-scanner'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-windows.zip'
$checksumType = 'sha256'
$checksum = '5CC23EE0CB8E8B09793EEF05CFB1B091EE05265E275A89846E476E630E087E05'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "sonar-scanner" "$toolsDir\sonar-scanner-3.2.0.1227-windows\bin\sonar-scanner.bat"
