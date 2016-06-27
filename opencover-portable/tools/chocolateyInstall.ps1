$packageName = 'freerdp'
$url = 'https://github.com/OpenCover/opencover/releases/download/4.6.519/opencover.4.6.519.zip'
$url64 = $url
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage $packageName $url $toolsDir $url64