$packageName = 'opencover.portable'
$url = 'https://github.com/OpenCover/opencover/releases/download/4.6.519/opencover.4.6.519.zip'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage $packageName $url $toolsDir