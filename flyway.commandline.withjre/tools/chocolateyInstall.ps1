$version = '6.0.0-beta'
$packageName = 'flyway.commandline.withjre'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$version/flyway-commandline-$version-windows-x64.zip"        
$checksumType = 'sha256'
$checksum = '2521588ef2af3b93394fef88c9c3a382d43c9a25a8db3f7a7ad935add6032bd9'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "flyway" "$toolsDir\flyway-$version\flyway.cmd"