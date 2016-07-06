$version = '4.0.3'
$packageName = 'flyway.commandline'
$url = "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$version/flyway-commandline-$version.zip"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage $packageName $url $toolsDir
Install-BinFile "flyway" "$toolsDir\flyway-$version\flyway.cmd"