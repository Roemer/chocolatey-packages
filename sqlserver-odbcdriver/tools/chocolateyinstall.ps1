$packageName = 'sqlserver-odbcdriver'
$installerType = 'msi'
$silentArgs= '/Passive /NoRestart IACCEPTMSODBCSQLLICENSETERMS=YES'
$url = 'https://download.microsoft.com/download/E/6/B/E6BFDC7A-5BCD-4C51-9912-635646DA801E/en-US/msodbcsql_17.3.1.1_x86.msi'
$url64 = 'https://download.microsoft.com/download/E/6/B/E6BFDC7A-5BCD-4C51-9912-635646DA801E/en-US/msodbcsql_17.3.1.1_x64.msi'
$checksumType = 'sha256'
$checksum = 'B494D393CF4ADF6EBC9C317146208331CC5773DC772D47463DD4C2B49DB3EA32'
$checksum64 = 'CDFF489DB121CEAD78F87BC33F9FDB072432D637FB9C2905D0CBDA2310F87086'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"
