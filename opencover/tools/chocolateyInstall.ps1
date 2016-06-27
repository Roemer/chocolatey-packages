$packageName = 'OpenCover'
$installerType = 'msi'
$silentArgs= '/quiet'
$url = 'https://github.com/OpenCover/opencover/releases/download/4.6.519/opencover.4.6.519.msi'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes @(0)
