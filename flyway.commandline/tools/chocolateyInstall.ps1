$version = '5.2.1'
$packageName = 'flyway.commandline'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$version/flyway-commandline-$version.zip"
$checksumType = 'sha256'
$checksum = 'FA83263AFB1309477F5A6B064A29E039C19092CE713F9332E72C5017308E9CEA'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "flyway" "$toolsDir\flyway-$version\flyway.cmd"
