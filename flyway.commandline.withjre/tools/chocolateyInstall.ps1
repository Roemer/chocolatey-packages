$version = '{version}'
$packageName = 'flyway.commandline.withjre'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$version/flyway-commandline-$version-windows-x64.zip"        
$checksumType = 'sha256'
$checksum = '{checksum}'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "flyway" "$toolsDir\flyway-$version\flyway.cmd"