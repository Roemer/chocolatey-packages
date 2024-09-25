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
    var version = "10.18.1";

    // Handle the file without jre
    {
        var packageName = "flyway.commandline";
        var hash = GetOnlineFileHash($"https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/{version}/flyway-commandline-{version}.zip");
        ReplaceInFiles(packageName, new Dictionary<string, string> {
            ["{version}"] = version,
            ["{checksum}"] = hash,
            ["{year}"] = $"{DateTime.Now.Year}",
        });
        ChocolateyPack($"./{packageName}/{packageName}.nuspec", chocolateyPackSettings);
    }

    // Handle the file with JRE
    {
        var packageName = "flyway.commandline.withjre";
        var hash = GetOnlineFileHash($"https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/{version}/flyway-commandline-{version}-windows-x64.zip");
        ReplaceInFiles(packageName, new Dictionary<string, string> {
            ["{version}"] = version,
            ["{checksum}"] = hash,
            ["{year}"] = $"{DateTime.Now.Year}",
        });
        ChocolateyPack($"./{packageName}/{packageName}.nuspec", chocolateyPackSettings);
    }
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
    var version = "6.1.0.4477";

    var packageName = "sonarqube-scanner.portable";
    var hash = GetOnlineFileHash($"https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-{version}-windows-x64.zip");
    ReplaceInFiles(packageName, new Dictionary<string, string> {
        ["{version}"] = version,
        ["{checksum}"] = hash,
        ["{year}"] = $"{DateTime.Now.Year}",
    });
    ChocolateyPack($"./{packageName}/{packageName}.nuspec", chocolateyPackSettings);
});

Task("Pack-SqlServer-ODBC")
    .IsDependentOn("Clean-Output")
    .Does(() =>
{
    // V17
    var version_17 = "17.10.6.1";
    var link32_17 = $"https://download.microsoft.com/download/6/f/f/6ffefc73-39ab-4cc0-bb7c-4093d64c2669/en-US/{version_17}/x86/msodbcsql.msi";
    var link64_17 = $"https://download.microsoft.com/download/6/f/f/6ffefc73-39ab-4cc0-bb7c-4093d64c2669/en-US/{version_17}/x64/msodbcsql.msi";
    var hash32_17 = GetOnlineFileHash(link32_17);
    var hash64_17 = GetOnlineFileHash(link64_17);
    var packageName_17 = "sqlserver-odbcdriver-17";
    ReplaceInFiles(packageName_17, new Dictionary<string, string> {
        ["{version}"] = version_17,
        ["{link32}"] = link32_17,
        ["{link64}"] = link64_17,
        ["{checksum32}"] = hash32_17,
        ["{checksum64}"] = hash64_17
    });
    ChocolateyPack($"./{packageName_17}/{packageName_17}.nuspec", chocolateyPackSettings);

    // V18
    var version_18 = "18.4.1.1";
    var link32_18 = "https://download.microsoft.com/download/1/7/4/17423b83-b75d-42e1-b5b9-eaa266561c5e/Windows/x86/1031/msodbcsql.msi";
    var link64_18 = "https://download.microsoft.com/download/1/7/4/17423b83-b75d-42e1-b5b9-eaa266561c5e/Windows/amd64/1031/msodbcsql.msi";
    var hash32_18 = GetOnlineFileHash(link32_18);
    var hash64_18 = GetOnlineFileHash(link64_18);
    var packageName_18 = "sqlserver-odbcdriver-18";
    ReplaceInFiles(packageName_18, new Dictionary<string, string> {
        ["{version}"] = version_18,
        ["{link32}"] = link32_18,
        ["{link64}"] = link64_18,
        ["{checksum32}"] = hash32_18,
        ["{checksum64}"] = hash64_18
    });
    ChocolateyPack($"./{packageName_18}/{packageName_18}.nuspec", chocolateyPackSettings);

    // Meta Package
    var version = version_18;
    var packageName = "sqlserver-odbcdriver";
    ReplaceInFiles(packageName, new Dictionary<string, string> {
        ["{version}"] = version
    });
    ChocolateyPack($"./{packageName}/{packageName}.nuspec", chocolateyPackSettings);
});

Task("Pack-SqlServer-Sqlcmd")
    .IsDependentOn("Clean-Output")
    .Does(() =>
{
    var version = "15.0.4298.1";
    var link32 = "https://download.microsoft.com/download/a/a/4/aa47b3b0-9f67-441d-8b00-e74cd845ea9f/EN/x86/MsSqlCmdLnUtils.msi";
    var link64 = "https://download.microsoft.com/download/a/a/4/aa47b3b0-9f67-441d-8b00-e74cd845ea9f/EN/x64/MsSqlCmdLnUtils.msi";
    var hash32 = GetOnlineFileHash(link32);
    var hash64 = GetOnlineFileHash(link64);

    var packageName = "sqlserver-cmdlineutils";
    ReplaceInFiles(packageName, new Dictionary<string, string> {
        ["{version}"] = version,
        ["{link32}"] = link32,
        ["{link64}"] = link64,
        ["{checksum32}"] = hash32,
        ["{checksum64}"] = hash64
    });
    ChocolateyPack($"./{packageName}/{packageName}.nuspec", chocolateyPackSettings);
});

Task("Push-Packages")
    .Does(() =>
{
    var apiKey = System.IO.File.ReadAllText(".chocoapikey");

    var files = GetFiles($"{nugetDir}/*.nupkg");
    foreach (var package in files) {
        Information($"Pushing {package}");
        ChocolateyPush(package, new ChocolateyPushSettings {
            Source ="https://push.chocolatey.org/",
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
/// Downloads the given file and calculates the SHA265 hash of it.
/// </summary>
private string GetOnlineFileHash(string fileUrl) {
    var file = DownloadFile(fileUrl);
    var hash = CalculateFileHash(file, HashAlgorithm.SHA256).ToHex();
    return hash;
}

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
