$packageName = 'sqlserver-odbcdriver'
$installerType = 'msi'
$silentArgs= '/Passive /NoRestart IACCEPTMSODBCSQLLICENSETERMS=YES'
$url = 'https://download.microsoft.com/download/E/6/B/E6BFDC7A-5BCD-4C51-9912-635646DA801E/en-US/msodbcsql_17.2.0.1_x86.msi'
$url64 = 'https://download.microsoft.com/download/E/6/B/E6BFDC7A-5BCD-4C51-9912-635646DA801E/en-US/msodbcsql_17.2.0.1_x64.msi'
$checksumType = 'sha256'
$checksum = 'F52B68F2700E882D4BFFB47ACB440AF3AF0C82F5584A60242C5D5D69BF1170D1'
$checksum64 = 'A5A315A7B47A17C56FE6E1185AC09C069594C13CF2343D453090D1C066AD2AEF'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"
