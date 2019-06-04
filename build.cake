///////////////////////////////////////////////////////////////////////////////
// ARGUMENTS
///////////////////////////////////////////////////////////////////////////////

var target = Argument("target", "Default");

var outputDir = Directory("./.nuget");
EnsureDirectoryExists(outputDir);
var chocolateyPackSettings = new ChocolateyPackSettings {
   OutputDirectory = outputDir
};
///////////////////////////////////////////////////////////////////////////////
// TASKS
///////////////////////////////////////////////////////////////////////////////

Task("Clean-Output")
   .Does(() =>
{
   CleanDirectory(outputDir);
});

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
   ChocolateyPack("./sqlserver-odbcdriver/sqlserver-odbcdriver.nuspec", chocolateyPackSettings);
});

Task("Pack-SqlServer-Sqlcmd")
   .Does(() =>
{
   ChocolateyPack("./sqlserver-cmdlineutils/sqlserver-cmdlineutils.nuspec", chocolateyPackSettings);
});

Task("Default")
   .Does(() => {
   Information("Hello Cake!");
});


Task("Push-Packages")
   .Does(() => {
   var apiKey = System.IO.File.ReadAllText(".chocoapikey");

   var files = GetFiles($"{outputDir}/*.nupkg");
   foreach (var package in files) {
      Information($"Pushing {package}");
      ChocolateyPush(package, new ChocolateyPushSettings {
         ApiKey = apiKey
      });
   }
 });

RunTarget(target);

