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
Remove-Item "$mods\controllable-0.13.3-1.16.3.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/controllable-0.13.3-1.16.3.jar" -OutFile "$mods\controllable-0.13.3-1.16.3.jar";

# Mods - Journey Map
Remove-Item "$mods\journeymap-1.16.5-5.7.3.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/journeymap-1.16.5-5.7.3.jar" -OutFile "$mods\journeymap-1.16.5-5.7.3.jar";

# Mods - Optifine
Remove-Item "$mods\OptiFine_1.16.5_HD_U_G8.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/OptiFine_1.16.5_HD_U_G8.jar" -OutFile "$mods\OptiFine_1.16.5_HD_U_G8.jar";

# Resource Packs - Faithful
Remove-Item "$resourcepacks\faithful-1.16" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/faithful-1.16.zip" -OutFile "$downloads\faithful-1.16.zip";
Expand-Archive -LiteralPath "$downloads\faithful-1.16.zip" -DestinationPath "$resourcepacks\faithful-1.16";
Remove-Item "$downloads\faithful-1.16.zip" -Force -ErrorAction SilentlyContinue;

# Resource Pack - Mine Brick
Remove-Item "$resourcepacks\MineBricks-V5-128x" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/MineBricks-V5-128x.zip" -OutFile "$downloads\MineBricks-V5-128x.zip";
Expand-Archive -LiteralPath "$downloads\MineBricks-V5-128x.zip" -DestinationPath "$resourcepacks\MineBricks-V5-128x";
Remove-Item "$downloads\MineBricks-V5-128x.zip" -Force -ErrorAction SilentlyContinue;

# Resource Pack - Patrix
Remove-Item "$resourcepacks\Patrix_1.16_32x_addon" -Force -Recurse -ErrorAction SilentlyContinue;
Remove-Item "$resourcepacks\Patrix_1.16_32x_basic" -Force -Recurse -ErrorAction SilentlyContinue;
Remove-Item "$resourcepacks\Patrix_1.16_32x_bonus" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/Patrix_1.16_32x_addon.zip" -OutFile "$downloads\Patrix_1.16_32x_addon.zip";
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/Patrix_1.16_32x_basic.zip" -OutFile "$downloads\Patrix_1.16_32x_basic.zip";
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/Patrix_1.16_32x_bonus.zip" -OutFile "$downloads\Patrix_1.16_32x_bonus.zip";
Expand-Archive -LiteralPath "$downloads\Patrix_1.16_32x_addon.zip" -DestinationPath "$resourcepacks\Patrix_1.16_32x_addon";
Expand-Archive -LiteralPath "$downloads\Patrix_1.16_32x_basic.zip" -DestinationPath "$resourcepacks\Patrix_1.16_32x_basic";
Expand-Archive -LiteralPath "$downloads\Patrix_1.16_32x_bonus.zip" -DestinationPath "$resourcepacks\Patrix_1.16_32x_bonus";
Remove-Item "$downloads\Patrix_1.16_32x_addon.zip" -Force -ErrorAction SilentlyContinue;
Remove-Item "$downloads\Patrix_1.16_32x_basic.zip" -Force -ErrorAction SilentlyContinue;
Remove-Item "$downloads\Patrix_1.16_32x_bonus.zip" -Force -ErrorAction SilentlyContinue;
(Get-Content $gameDirectory\optionsof.txt).replace('ofConnectedTextures:0', 'ofConnectedTextures:2') | Set-Content $gameDirectory\optionsof.txt
(Get-Content $gameDirectory\optionsof.txt).replace('ofConnectedTextures:1', 'ofConnectedTextures:2') | Set-Content $gameDirectory\optionsof.txt
(Get-Content $gameDirectory\optionsof.txt).replace('ofNaturalTextures:false', 'ofNaturalTextures:false') | Set-Content $gameDirectory\optionsof.txt
(Get-Content $gameDirectory\optionsof.txt).replace('ofCustomColors:false', 'ofCustomColors:true') | Set-Content $gameDirectory\optionsof.txt
(Get-Content $gameDirectory\optionsof.txt).replace('ofAlternateBlocks:false', 'ofAlternateBlocks:true') | Set-Content $gameDirectory\optionsof.txt
(Get-Content $gameDirectory\optionsof.txt).replace('ofTrees:0', 'ofTrees:2') | Set-Content $gameDirectory\optionsof.txt
(Get-Content $gameDirectory\optionsof.txt).replace('ofTrees:1', 'ofTrees:2') | Set-Content $gameDirectory\optionsof.txt
(Get-Content $gameDirectory\optionsof.txt).replace('ofSmartAnimations:false', 'ofSmartAnimations:true') | Set-Content $gameDirectory\optionsof.txt

# Resource Pack - Xray
Remove-Item "$resourcepacks\Xray_Ultimate_1.16_v4.1.0" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/Xray_Ultimate_1.16_v4.1.0.zip" -OutFile "$downloads\Xray_Ultimate_1.16_v4.1.0.zip";
Expand-Archive -LiteralPath "$downloads\Xray_Ultimate_1.16_v4.1.0.zip" -DestinationPath "$resourcepacks\Xray_Ultimate_1.16_v4.1.0";
Remove-Item "$downloads\Xray_Ultimate_1.16_v4.1.0.zip" -Force -ErrorAction SilentlyContinue;

# Saves - OneBlock
Remove-Item "$saves\OneBlock by IJAMinecraft (1.16.4)" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/IJAMinecrafts-OneBlock-1-16-4.zip" -OutFile "$downloads\IJAMinecrafts-OneBlock-1-16-4.zip";
Expand-Archive -LiteralPath "$downloads\IJAMinecrafts-OneBlock-1-16-4.zip" -DestinationPath "$saves";
Remove-Item "$downloads\IJAMinecrafts-OneBlock-1-16-4.zip" -Force -ErrorAction SilentlyContinue;

# Saves - Ultimate Sky Islands
Remove-Item "$saves\Ultimate Sky Islands" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/Ultimate_Sky_Islands_v1.1.zip" -OutFile "$downloads\Ultimate_Sky_Islands_v1.1.zip";
Expand-Archive -LiteralPath "$downloads\Ultimate_Sky_Islands_v1.1.zip" -DestinationPath "$saves";
Remove-Item "$downloads\Ultimate_Sky_Islands_v1.1.zip" -Force -ErrorAction SilentlyContinue;

# Mod Loaders - Forge
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/forge-1.16.5-36.2.2-installer.jar" -OutFile "$downloads\forge-1.16.5-36.2.2-installer.jar";
java -jar "$downloads\forge-1.16.5-36.2.2-installer.jar";
Remove-Item "$downloads\forge-1.16.5-36.2.2-installer.jar" -Force -ErrorAction SilentlyContinue;