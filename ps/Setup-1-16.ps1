#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

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
$fileName = "controllable-0.16.5-1.16.5";
Remove-Item "$mods\$fileName.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/$fileName.jar" -OutFile "$mods\$fileName.jar";

# Mods - Optifine
$fileName = "OptiFine_1.16.5_HD_U_G8";
Remove-Item "$mods\$fileName.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/$fileName.jar" -OutFile "$mods\$fileName.jar";

# Resource Packs - Faithful
$fileName = "Faithful 32x - 1.16.5"
Remove-Item "$resourcepacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/$fileName.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$resourcepacks\$fileName";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Saves - One Block
$fileName = "IJAMinecrafts-OneBlock-1-16-4"
Remove-Item "$saves\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/$fileName.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Saves - SkyBlock
$fileName = "Skyblock 4.08.4"
Remove-Item "$saves\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/$fileName.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Mod Loaders - Forge
$fileName = "forge-1.16.5-36.2.39-installer";
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/$fileName.jar" -OutFile "$downloads\$fileName.jar";
java -jar "$downloads\$fileName.jar";
Remove-Item "$downloads\$fileName.jar" -Force -ErrorAction SilentlyContinue;
