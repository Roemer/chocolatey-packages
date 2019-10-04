///////////////////////////////////////////////////////////////////////////////
// ARGUMENTS
///////////////////////////////////////////////////////////////////////////////

var target = Argument("target", "Default");

var nugetDir = Directory("./.nuget");
var chocolateyPackSettings = new ChocolateyPackSettings {
    OutputDirectory = nugetDir
};

///////////////////////////////////////////////////////////////////////////////
// TASKS
///////////////////////////////////////////////////////////////////////////////

Setup(context =>
{
    CleanDirectory(nugetDir);
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

Task("Push-Packages")
    .Does(() =>
{
    var apiKey = System.IO.File.ReadAllText(".chocoapikey");

    var files = GetFiles($"{nugetDir}/*.nupkg");
    foreach (var package in files) {
        Information($"Pushing {package}");
        ChocolateyPush(package, new ChocolateyPushSettings {
            ApiKey = apiKey
        });
    }
});

Task("Default")
    .Does(() =>
{
    Information("Hello Cake!");
});

RunTarget(target);
