///////////////////////////////////////////////////////////////////////////////
// ARGUMENTS
///////////////////////////////////////////////////////////////////////////////

var target = Argument("target", "Default");

var outputDir = Directory("./.nuget");
CleanDirectory(outputDir);
var chocolateyPackSettings = new ChocolateyPackSettings {
   OutputDirectory = outputDir
};
///////////////////////////////////////////////////////////////////////////////
// TASKS
///////////////////////////////////////////////////////////////////////////////

Task("Pack-Flyway")
   .Does(() =>
{
   ChocolateyPack("./flyway.commandline/flyway.commandline.nuspec", chocolateyPackSettings);
   ChocolateyPack("./flyway.commandline.withjre/flyway.commandline.withjre.nuspec", chocolateyPackSettings);
});

Task("Pack-FreeRDP")
   .Does(() =>
{
   ChocolateyPack("./freerdp/freerdp.nuspec", chocolateyPackSettings);
});

Task("Pack-SonarQube-Scanner")
   .Does(() =>
{
   ChocolateyPack("./sonarqube-scanner.portable/sonarqube-scanner.portable.nuspec", chocolateyPackSettings);
});

Task("Pack-SqlServer-ODBC")
   .Does(() =>
{
   var instDir = Directory("sqlserver-odbcdriver") + Directory("installers");
   CleanDirectory(instDir);

   var outputPath = instDir + File("msodbcsql_17.3.1.1_x64.msi");
   DownloadFile("https://download.microsoft.com/download/E/6/B/E6BFDC7A-5BCD-4C51-9912-635646DA801E/en-US/msodbcsql_17.3.1.1_x64.msi", outputPath);

   outputPath = instDir + File("msodbcsql_17.3.1.1_x86.msi");
   DownloadFile("https://download.microsoft.com/download/E/6/B/E6BFDC7A-5BCD-4C51-9912-635646DA801E/en-US/msodbcsql_17.3.1.1_x86.msi", outputPath);
  
   ChocolateyPack("./sqlserver-odbcdriver/sqlserver-odbcdriver.nuspec", chocolateyPackSettings);
});

Task("Default")
   .Does(() => {
   Information("Hello Cake!");
});

RunTarget(target);

