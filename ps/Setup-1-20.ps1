#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$version = "1.20";
$remote = "https://github.com/kirbycope/minecraft-scripts/raw/main/$version";

$downloads = "$HOME\Downloads";
$gameDirectory = "$env:APPDATA\.minecraft";
$mods = "$gameDirectory\mods";
$resourcepacks = "$gameDirectory\resourcepacks";
$saves = "$gameDirectory\saves";

if (!(test-path $mods)) { New-Item -ItemType Directory -Force -Path $mods }
if (!(test-path $resourcepacks)) { New-Item -ItemType Directory -Force -Path $resourcepacks }
if (!(test-path $saves)) { New-Item -ItemType Directory -Force -Path $saves }

# Mods - Controllable
$fileName = "controllable-forge-1.20.1-0.20.3";
Remove-Item "$mods\$fileName.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "$remote/$fileName.jar" -OutFile "$mods\$fileName.jar";

# Mods - Optifine
$fileName = "preview_OptiFine_1.20.1_HD_U_I5_pre9";
Remove-Item "$mods\$fileName.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "$remote/$fileName.jar" -OutFile "$mods\$fileName.jar";

# Mod Loaders - Forge
$fileName = "forge-1.20.1-47.0.35-installer";
Invoke-WebRequest "$remote/$fileName.jar" -OutFile "$downloads\$fileName.jar";
java -jar "$downloads\$fileName.jar";
Remove-Item "$downloads\$fileName.jar" -Force -ErrorAction SilentlyContinue;
