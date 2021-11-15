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
Remove-Item "$mods\controllable-0.14.0-mc1.17.1.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/controllable-0.14.0-mc1.17.1.jar" -OutFile "$mods\controllable-0.14.0-mc1.17.1.jar";

# Mods - Journey Map
Remove-Item "$mods\journeymap-1.17.1-5.7.3.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/journeymap-1.17.1-5.7.3.jar" -OutFile "$mods\journeymap-1.17.1-5.7.3.jar";

# Mods - Optifine
Remove-Item "$mods\OptiFine_1.17.1_HD_U_H1.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/OptiFine_1.17.1_HD_U_H1.jar" -OutFile "$mods\OptiFine_1.17.1_HD_U_H1.jar";

# Resource Packs - Faithful
Remove-Item "$resourcepacks\faithful-1.17" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/faithful-1.17.zip" -OutFile "$downloads\faithful-1.17.zip";
Expand-Archive -LiteralPath "$downloads\faithful-1.17.zip" -DestinationPath "$resourcepacks\faithful-1.17";
Remove-Item "$downloads\faithful-1.17.zip" -Force -ErrorAction SilentlyContinue;

# Resource Pack - Mine Brick
Remove-Item "$resourcepacks\MineBricks-V7-128x" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/MineBricks V7 128x (1.17).zip" -OutFile "$downloads\MineBricks V7 128x (1.17).zip";
Expand-Archive -LiteralPath "$downloads\MineBricks V7 128x (1.17).zip" -DestinationPath "$resourcepacks\MineBricks-V7-128x";
Remove-Item "$downloads\MineBricks V7 128x (1.17).zip" -Force -ErrorAction SilentlyContinue;

# Resource Pack - Xray
Remove-Item "$resourcepacks\Xray_Ultimate_1.17_v4.1.2" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/Xray_Ultimate_1.17_v4.1.2.zip" -OutFile "$downloads\Xray_Ultimate_1.17_v4.1.2.zip";
Expand-Archive -LiteralPath "$downloads\Xray_Ultimate_1.17_v4.1.2.zip" -DestinationPath "$resourcepacks\Xray_Ultimate_1.17_v4.1.2";
Remove-Item "$downloads\Xray_Ultimate_1.17_v4.1.2.zip" -Force -ErrorAction SilentlyContinue;

# Saves - SkyBlock
Remove-Item "$saves\Skyblock 4.09.1" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/Skyblock 4.09.1.zip" -OutFile "$downloads\Skyblock 4.09.1.zip";
Expand-Archive -LiteralPath "$downloads\Skyblock 4.09.1.zip" -DestinationPath "$saves";
Remove-Item "$downloads\Skyblock 4.09.1.zip" -Force -ErrorAction SilentlyContinue;

# Saves - SkyBlock Hardcore
Remove-Item "$saves\Skyblock 4.09.1 (Hardcore)" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/Skyblock 4.09.1 (Hardcore).zip" -OutFile "$downloads\Skyblock 4.09.1 (Hardcore).zip";
Expand-Archive -LiteralPath "$downloads\Skyblock 4.09.1 (Hardcore).zip" -DestinationPath "$saves";
Remove-Item "$downloads\Skyblock 4.09.1 (Hardcore).zip" -Force -ErrorAction SilentlyContinue;

# Mod Loaders - Forge
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/forge-1.17.1-37.0.109-installer.jar" -OutFile "$downloads\forge-1.17.1-37.0.109-installer.jar";
java -jar "$downloads\forge-1.17.1-37.0.109-installer.jar";
Remove-Item "$downloads\forge-1.17.1-37.0.109-installer.jar" -Force -ErrorAction SilentlyContinue;
