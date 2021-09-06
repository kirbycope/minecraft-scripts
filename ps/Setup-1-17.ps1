#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$downloads = "$HOME\Downloads";
$gameDirectory = "$env:APPDATA\.minecraft";
$mods = "$gameDirectory\mods";
$resourcepacks = "$gameDirectory\resourcepacks";
$saves = "$gameDirectory\saves";
$shaderpacks = "$gameDirectory\shaderpacks";

if(!(test-path $mods)) { New-Item -ItemType Directory -Force -Path $mods }
if(!(test-path $resourcepacks)) { New-Item -ItemType Directory -Force -Path $resourcepacks }
if(!(test-path $saves)) { New-Item -ItemType Directory -Force -Path $saves }
if(!(test-path $shaderpacks)) { New-Item -ItemType Directory -Force -Path $shaderpacks }

# Resource Packs - Faithful
Remove-Item "$resourcepacks\faithful-1.17" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/faithful-1.17.zip" -OutFile "$downloads\faithful-1.17.zip";
Expand-Archive -LiteralPath "$downloads\faithful-1.17.zip" -DestinationPath "$resourcepacks\faithful-1.17";
Remove-Item "$downloads\faithful-1.17.zip" -Force -ErrorAction SilentlyContinue

# Saves - SkyBlock
Remove-Item "$saves\Skyblock 4.09.1" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/Skyblock 4.09.1.zip" -OutFile "$downloads\Skyblock 4.09.1.zip";
Expand-Archive -LiteralPath "$downloads\Skyblock 4.09.1.zip" -DestinationPath "$saves";
Remove-Item "$downloads\Skyblock 4.09.1.zip" -Force -ErrorAction SilentlyContinue

# Mod - Optifine
Remove-Item "$mods\OptiFine_1.17.1_HD_U_G9.jar" -Force -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.17/OptiFine_1.17.1_HD_U_G9.jar" -OutFile "$downloads\OptiFine_1.17.1_HD_U_G9.jar";
java -jar "$downloads\OptiFine_1.17.1_HD_U_G9.jar";
Remove-Item "$downloads\OptiFine_1.17.1_HD_U_G9.jar" -Force -ErrorAction SilentlyContinue;