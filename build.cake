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

Task("Default")
   .Does(() => {
   Information("Hello Cake!");
});

RunTarget(target);

