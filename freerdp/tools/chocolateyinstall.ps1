$packageName = 'freerdp'
$url = 'https://www.cloudbase.it/downloads/wfreerdp-1.1.zip'
$url64 = $url
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage $packageName $url $toolsDir $url64