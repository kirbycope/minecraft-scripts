#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$version = "1.21";
$remote = "https://github.com/kirbycope/minecraft-scripts/raw/main/$version";

$downloads = "$HOME\Downloads";
$gameDirectory = "$env:APPDATA\.minecraft";
$mods = "$gameDirectory\mods";
$resourcepacks = "$gameDirectory\resourcepacks";
$saves = "$gameDirectory\saves";

if (!(test-path $mods)) { New-Item -ItemType Directory -Force -Path $mods }
if (!(test-path $resourcepacks)) { New-Item -ItemType Directory -Force -Path $resourcepacks }
if (!(test-path $saves)) { New-Item -ItemType Directory -Force -Path $saves }

# Mods - MidnightControls (https://modrinth.com/mod/midnightcontrols/)
$fileName = "midnightcontrols-neoforge-1.10.3";
Remove-Item "$mods\$fileName.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "$remote/$fileName.jar" -OutFile "$mods\$fileName.jar";

# Mods - Sodium (https://modrinth.com/mod/sodium/)
$fileName = "sodium-neoforge-0.6.5+mc1.21.4";
Remove-Item "$mods\$fileName.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "$remote/$fileName.jar" -OutFile "$mods\$fileName.jar";

# Mod Loaders - NeoForge (https://neoforged.net/)
$fileName = "neoforge-21.4.38-beta-installer";
Invoke-WebRequest "$remote/$fileName.jar" -OutFile "$downloads\$fileName.jar";
java -jar "$downloads\$fileName.jar";
Remove-Item "$downloads\$fileName.jar" -Force -ErrorAction SilentlyContinue;

# Resource Packs - Faithful (https://faithfulpack.net/faithful32x/latest)
$fileName = "Faithful 32x - 1.21.3Faithful 32x - 1.21.3";
Remove-Item "$resourcepacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "$remote/$fileName.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$resourcepacks\$fileName";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;
