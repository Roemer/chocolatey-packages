$version = '5.2.1'
$packageName = 'flyway.commandline.withjre'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$version/flyway-commandline-$version-windows-x64.zip"        
$checksumType = 'sha256'
$checksum = 'EB49E2941062F72165EFA07E39610E0A14B1C9766D0C6C08A843F9831B8EA8C7'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
Install-BinFile "flyway" "$toolsDir\flyway-$version\flyway.cmd"