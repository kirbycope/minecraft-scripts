#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$version = "1.19";
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
$fileName = "controllable-0.17.0-1.19.3";
Remove-Item "$mods\$fileName.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "$remote/$fileName.jar" -OutFile "$mods\$fileName.jar";

# Mods - Optifine
$fileName = "preview_OptiFine_1.19.3_HD_U_I2_pre5";
Remove-Item "$mods\$fileName.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "$remote/$fileName.jar" -OutFile "$mods\$fileName.jar";

# Resource Packs - Faithful
$fileName = "Faithful 32x - 1.19.3";
Remove-Item "$resourcepacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "$remote/$fileName.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$resourcepacks\$fileName";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Saves - SkyBlock
$fileName = "Skyblock 4.11.2";
Remove-Item "$saves\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "$remote/$fileName.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Mod Loaders - Forge
$fileName = "forge-1.19.3-44.1.17-installer";
Invoke-WebRequest "$remote/$fileName.jar" -OutFile "$downloads\$fileName.jar";
java -jar "$downloads\$fileName.jar";
Remove-Item "$downloads\$fileName.jar" -Force -ErrorAction SilentlyContinue;
