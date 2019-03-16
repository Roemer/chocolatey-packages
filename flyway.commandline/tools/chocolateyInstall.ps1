$version = '5.2.4'
$packageName = 'flyway.commandline'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$version/flyway-commandline-$version-windows-x64.zip"
$checksumType = 'sha256'
$checksum = '634a202ca73f43cf5f86741405631ada5739d3161ad6618d65973b1478d76e98'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "flyway" "$toolsDir\flyway-$version\flyway.cmd"
