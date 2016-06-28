$packageName = 'sonarcube-scanner'
$url = 'https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-2.6.1.zip'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage $packageName $url $toolsDir
Install-BinFile "sonar-runner" "$toolsDir\sonar-scanner-2.6.1\bin\sonar-runner.bat"
Install-BinFile "sonar-scanner" "$toolsDir\sonar-scanner-2.6.1\bin\sonar-scanner.bat"
