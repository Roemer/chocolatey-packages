$packageName = 'nunit-console.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/nunit/nunit-console/releases/download/3.6.1/NUnit.Console-3.6.1.zip'
$checksumType = 'sha256'
$checksum = '3A177506699282D5C9E720BE8BAB8F9C0CB925E0E78ACD335FBF6798B7095648'
Install-ChocolateyZipPackage $packageName $url $toolsDir -Checksum $checksum -ChecksumType $checksumType
