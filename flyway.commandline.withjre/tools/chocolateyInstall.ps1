$version = '6.0.2'
$packageName = 'flyway.commandline.withjre'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$version/flyway-commandline-$version-windows-x64.zip"        
$checksumType = 'sha256'
$checksum = '0f63bd695c1714b1812995d8ee9b56cc669213c6baba74817baadd3c050b4afe'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "flyway" "$toolsDir\flyway-$version\flyway.cmd"