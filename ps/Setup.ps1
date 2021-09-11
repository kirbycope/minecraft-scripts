#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$downloads = "$HOME\Downloads";
$gameDirectory = "$env:APPDATA\.minecraft";
$shaderpacks = "$gameDirectory\shaderpacks";
$skins = "$gameDirectory\assets\skins";

# Shader Packs - SEUS
Remove-Item "$shaderpacks\SEUS-Renewed-v1.0.1" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/common/SEUS-Renewed-v1.0.1.zip" -OutFile "$downloads\SEUS-Renewed-v1.0.1.zip";
Expand-Archive -LiteralPath "$downloads\SEUS-Renewed-v1.0.1.zip" -DestinationPath "$shaderpacks\SEUS-Renewed-v1.0.1";
Remove-Item "$downloads\SEUS-Renewed-v1.0.1.zip" -Force -ErrorAction SilentlyContinue;

# Skins - Lumberjack
Remove-Item "$skins\2013_08_09_skin_20130809053626142196.png" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/common/2013_08_09_skin_20130809053626142196.png" -OutFile "$skins\2013_08_09_skin_20130809053626142196.png";

# Java Runtime Environment (if needed)
if (!(Get-Command java | Select-Object Version)) {
    Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/common/OpenJDK16U-jre_x64_windows_hotspot_16.0.1_9.msi" -OutFile "$downloads\OpenJDK16U-jre_x64_windows_hotspot_16.0.1_9.msi";
    Start-Process "$downloads\OpenJDK16U-jre_x64_windows_hotspot_16.0.1_9.msi";
    #Remove-Item "$downloads\OpenJDK16U-jre_x64_windows_hotspot_16.0.1_9.msi" -Force -ErrorAction SilentlyContinue;
}