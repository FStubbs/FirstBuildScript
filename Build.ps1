param (
    [string]$BuildEnv = "Debug",
    [string]$BuildLocation,
    [string]$RunTime = "win10-x64"
)

Get-ChildItem -Path $BuildLocation -Recurse -Force . | Remove-Item -Recurse -Force

dotnet publish .\MyFirstApp.Console.csproj -c $buildEnv -o $buildLocation -f netcoreapp2.1 --self-contained --runtime $RunTime

$Global:AppSettingsDestination = Join-Path $buildLocation "appsettings.json"
Copy-Item "appsettings.$($buildEnv).json" -Destination $Global:AppSettingsDestination