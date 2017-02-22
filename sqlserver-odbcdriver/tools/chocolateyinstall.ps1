$packageName = 'sqlserver-odbcdriver'
$installerType = 'msi'
$silentArgs= '/Passive /NoRestart IACCEPTMSODBCSQLLICENSETERMS=YES'
$url = 'https://download.microsoft.com/download/D/5/E/D5EEF288-A277-45C8-855B-8E2CB7E25B96/x86/msodbcsql.msi'
$url64 = 'https://download.microsoft.com/download/D/5/E/D5EEF288-A277-45C8-855B-8E2CB7E25B96/x64/msodbcsql.msi'
$checksumType = 'sha256'
$checksum = '3A3B3B83594A28CDA3ED9F19918AA53D6866073AEAC4E25D8069CBD058732C68'
$checksum64 = '14C3C64468F75AF7EBEE2B9CF4F34A1E87365E973C379F33022E27683A837BCD'
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -validExitCodes @(0) "$checksum" "$checksumType" "$checksum64" "$checksumType"
