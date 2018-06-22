$packageName = 'sonarcube-scanner'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227.zip'
$checksumType = 'sha256'
$checksum = 'f0e05102a3e98aceb141577c08896c49e3bff9520d1e2f75a688a0ce0d099bc0'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "sonar-runner" "$toolsDir\sonar-scanner-3.2.0.1227\bin\sonar-runner.bat"
Install-BinFile "sonar-scanner" "$toolsDir\sonar-scanner-3.2.0.1227\bin\sonar-scanner.bat"
