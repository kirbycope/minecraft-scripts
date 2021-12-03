#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$version = "1.18";

$downloads = "$HOME\Downloads";
$gameDirectory = "$env:APPDATA\.minecraft";
$mods = "$gameDirectory\mods";
$resourcepacks = "$gameDirectory\resourcepacks";
$saves = "$gameDirectory\saves";
$shaderpacks = "$gameDirectory\shaderpacks";

if (!(test-path $mods)) { New-Item -ItemType Directory -Force -Path $mods }
if (!(test-path $resourcepacks)) { New-Item -ItemType Directory -Force -Path $resourcepacks }
if (!(test-path $saves)) { New-Item -ItemType Directory -Force -Path $saves }
if (!(test-path $shaderpacks)) { New-Item -ItemType Directory -Force -Path $shaderpacks }

# Mods - Controllable
$fileName = "controllable-0.15.1-1.18";
Remove-Item "$mods\$fileName.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/$version/$fileName.jar" -OutFile "$mods\$fileName.jar";

# Resource Packs - Faithful
$fileName = "faithful-1.18";
Remove-Item "$resourcepacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/$version/$fileName.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$resourcepacks\$fileName";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Mod Loaders - Forge
$fileName = "forge-1.18-38.0.1-installer";
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/$version/$fileName.jar" -OutFile "$downloads\$fileName.jar";
java -jar "$downloads\$fileName.jar";
Remove-Item "$downloads\$fileName.jar" -Force -ErrorAction SilentlyContinue;
