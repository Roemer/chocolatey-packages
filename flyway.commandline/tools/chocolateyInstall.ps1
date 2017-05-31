$version = '4.2.0'
$packageName = 'flyway.commandline'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$version/flyway-commandline-$version.zip"
$checksumType = 'sha256'
$checksum = 'B7F3AB0FFC7AB366F01AC42A518A3E56F96B3228B7B3C7ED31C9515DD5B7242F'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "flyway" "$toolsDir\flyway-$version\flyway.cmd"
