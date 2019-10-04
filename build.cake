///////////////////////////////////////////////////////////////////////////////
// ARGUMENTS
///////////////////////////////////////////////////////////////////////////////

var target = Argument("target", "Default");

var nugetDir = Directory("./.nuget");
var chocolateyPackSettings = new ChocolateyPackSettings {
    OutputDirectory = nugetDir
};

var revertFolderList = new List<string>();
///////////////////////////////////////////////////////////////////////////////
// TASKS
///////////////////////////////////////////////////////////////////////////////

Teardown(context =>
{
    // Revert the backup directories to the previous version without replacements
    foreach (var folder in revertFolderList) {
        var origName = folder.Remove(folder.Length - 4);
        DeleteDirectory(origName, new DeleteDirectorySettings { Recursive = true, Force = true });
        MoveDirectory(folder, origName);
    }
});

Task("Clean-Output")
    .Does(() =>
{
    CleanDirectory(nugetDir);
});

Task("Pack-Flyway")
    .IsDependentOn("Clean-Output")
    .Does(() =>
{
    var version = "6.0.4";

    // Handle the file without jre
    {
        var file = DownloadFile($"https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/{version}/flyway-commandline-{version}.zip");
        var hash = CalculateFileHash(file, HashAlgorithm.SHA256).ToHex();
        ReplaceInFiles(@"flyway.commandline", new Dictionary<string, string> {
            ["{version}"] = version,
            ["{checksum}"] = hash,
            ["{year}"] = $"{DateTime.Now.Year}",
        });
    }

    // Handle the file with JRE
    {
        var file = DownloadFile($"https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/{version}/flyway-commandline-{version}-windows-x64.zip");
        var hash = CalculateFileHash(file, HashAlgorithm.SHA256).ToHex();
        ReplaceInFiles(@"flyway.commandline.withjre", new Dictionary<string, string> {
            ["{version}"] = version,
            ["{checksum}"] = hash,
            ["{year}"] = $"{DateTime.Now.Year}",
        });
    }

    // Pack the files
    ChocolateyPack("./flyway.commandline/flyway.commandline.nuspec", chocolateyPackSettings);
    ChocolateyPack("./flyway.commandline.withjre/flyway.commandline.withjre.nuspec", chocolateyPackSettings);
});

Task("Pack-FreeRDP")
    .IsDependentOn("Clean-Output")
    .Does(() =>
{
    ChocolateyPack("./freerdp/freerdp.nuspec", chocolateyPackSettings);
});

Task("Pack-SonarQube-Scanner")
    .IsDependentOn("Clean-Output")
    .Does(() =>
{
    ChocolateyPack("./sonarqube-scanner.portable/sonarqube-scanner.portable.nuspec", chocolateyPackSettings);
});

Task("Pack-SqlServer-ODBC")
    .IsDependentOn("Clean-Output")
    .Does(() =>
{
    ChocolateyPack("./sqlserver-odbcdriver/sqlserver-odbcdriver.nuspec", chocolateyPackSettings);
});

Task("Pack-SqlServer-Sqlcmd")
    .IsDependentOn("Clean-Output")
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

/// <summary>
/// Method that replaces all files in a folder with the given key/value placehoders.
/// Creates a backup of the folder before the modifications.
/// On Teardown, this backup is restored.
/// </summary>
private void ReplaceInFiles(string baseDirectory, Dictionary<string, string> replacements) {
    // Copy the original directory
    var backupFolderName = $"{baseDirectory}_bak";
    CleanDirectory(backupFolderName);
    CopyDirectory(baseDirectory, backupFolderName);
    revertFolderList.Add(backupFolderName);

    // Perform all the replacements
    string[] files = System.IO.Directory.GetFiles(baseDirectory, "*.*", SearchOption.AllDirectories);
    foreach (var file in files) {
        // Replace the content
        string contents = System.IO.File.ReadAllText(file);
        contents = contents.Replace(@"Text to find", @"Replacement text");
        foreach(var replacement in replacements)
        {
            contents = contents.Replace(replacement.Key, replacement.Value);
        }
        System.IO.File.WriteAllText(file, contents);
    }
}
