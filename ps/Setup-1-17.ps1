#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$downloads = "$HOME\Downloads";
$gameDirectory = "$env:APPDATA\.minecraft";
$mods = "$env:APPDATA\.minecraft\mods";
$resourcepacks = "$env:APPDATA\.minecraft\resourcepacks";
$saves = "$env:APPDATA\.minecraft\saves";
$shaderpacks = "$env:APPDATA\.minecraft\shaderpacks";

if(!(test-path $mods)) { New-Item -ItemType Directory -Force -Path $mods }
if(!(test-path $resourcepacks)) { New-Item -ItemType Directory -Force -Path $resourcepacks }
if(!(test-path $saves)) { New-Item -ItemType Directory -Force -Path $saves }
if(!(test-path $shaderpacks)) { New-Item -ItemType Directory -Force -Path $shaderpacks }

# Resource Packs - Faithful
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/faithful-1.17.zip" -OutFile "$downloads\faithful-1.17.zip";
Expand-Archive -LiteralPath "$downloads\faithful-1.17.zip" -DestinationPath "$resourcepacks\faithful-1.17";
Remove-Item "$downloads\faithful-1.17.zip" -Force -ErrorAction SilentlyContinue

# Saves - SkyBlock
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/Skyblock 4.09.1.zip" -OutFile "$downloads\Skyblock 4.09.1.zip";
Expand-Archive -LiteralPath "$downloads\Skyblock 4.09.1.zip" -DestinationPath "$saves";
Remove-Item "$downloads\Skyblock 4.09.1.zip" -Force -ErrorAction SilentlyContinue

# Shader Packs - SEUS
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/SEUS-Renewed-v1.0.1.zip" -OutFile "$downloads\SEUS-Renewed-v1.0.1.zip";
Expand-Archive -LiteralPath "$downloads\SEUS-Renewed-v1.0.1.zip" -DestinationPath "$shaderpacks\SEUS-Renewed-v1.0.1";
Remove-Item "$downloads\SEUS-Renewed-v1.0.1.zip" -Force -ErrorAction SilentlyContinue

# Mod - Optifine
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/preview_OptiFine_1.17.1_HD_U_G9_pre34.jar" -OutFile "$downloads\preview_OptiFine_1.17.1_HD_U_G9_pre34.jar";
java -jar "$downloads\preview_OptiFine_1.17.1_HD_U_G9_pre34.jar";
#Remove-Item "$downloads\preview_OptiFine_1.17.1_HD_U_G9_pre34" -Force -ErrorAction SilentlyContinue