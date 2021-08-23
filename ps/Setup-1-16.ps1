#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$downloads = "$HOME\Downloads";
$gameDirectory = "$env:APPDATA\.minecraft";
$mods = "$env:APPDATA\.minecraft\mods";
$resourcepacks = "$env:APPDATA\.minecraft\resourcepacks";
$saves = "$env:APPDATA\.minecraft\saves";
$shaderpacks = "$env:APPDATA\.minecraft\shaderpacks";

Remove-Item $mods -Force -Recurse -ErrorAction SilentlyContinue
New-Item -ItemType directory -Path $mods;
Remove-Item $resourcepacks -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item $saves -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item $shaderpacks -Force -Recurse -ErrorAction SilentlyContinue

# Mods - Controllable
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/controllable-0.13.3-1.16.3.jar" -OutFile "$downloads\controllable-0.13.3-1.16.3.jar";
Copy-Item -Path "$downloads\controllable-0.13.3-1.16.3.jar" -Destination $mods;
Remove-Item "$downloads\controllable-0.13.3-1.16.3.jar" -Force -ErrorAction SilentlyContinue

# Mods - Optifine
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/OptiFine_1.16.5_HD_U_G8.jar" -OutFile "$downloads\OptiFine_1.16.5_HD_U_G8.jar";
Copy-Item -Path "$downloads\OptiFine_1.16.5_HD_U_G8.jar" -Destination $mods;
Remove-Item "$downloads\OptiFine_1.16.5_HD_U_G8.jar" -Force -ErrorAction SilentlyContinue

# Resource Packs - Faithful
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/faithful-1.16.zip" -OutFile "$downloads\faithful-1.16.zip";
Expand-Archive -LiteralPath "$downloads\faithful-1.16.zip" -DestinationPath "$resourcepacks\faithful-1.16";
Remove-Item "$downloads\faithful-1.16.zip" -Force -ErrorAction SilentlyContinue

# Saves - OneBlock
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/IJAMinecrafts-OneBlock-1-16-4.zip" -OutFile "$downloads\IJAMinecrafts-OneBlock-1-16-4.zip";
Expand-Archive -LiteralPath "$downloads\IJAMinecrafts-OneBlock-1-16-4.zip" -DestinationPath "$saves";
Remove-Item "$downloads\IJAMinecrafts-OneBlock-1-16-4.zip" -Force -ErrorAction SilentlyContinue

# Saves - Ultimate Sky Islands
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/Ultimate_Sky_Islands_v1.1.zip" -OutFile "$downloads\Ultimate_Sky_Islands_v1.1.zip";
Expand-Archive -LiteralPath "$downloads\Ultimate_Sky_Islands_v1.1.zip" -DestinationPath "$saves";
Remove-Item "$downloads\Ultimate_Sky_Islands_v1.1.zip" -Force -ErrorAction SilentlyContinue

# Shader Packs - SEUS
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/SEUS-Renewed-v1.0.1.zip" -OutFile "$downloads\SEUS-Renewed-v1.0.1.zip";
Expand-Archive -LiteralPath "$downloads\SEUS-Renewed-v1.0.1.zip" -DestinationPath "$shaderpacks\SEUS-Renewed-v1.0.1";
Remove-Item "$downloads\SEUS-Renewed-v1.0.1.zip" -Force -ErrorAction SilentlyContinue

# Mod Loaders - Forge
Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/1.16/forge-1.16.5-36.2.2-installer.jar" -OutFile "$downloads\forge-1.16.5-36.2.2-installer.jar";
java -jar "$downloads\forge-1.16.5-36.2.2-installer.jar"; # --installServer; # but no client??
#Remove-Item "$downloads\forge-1.16.5-36.2.2-installer.jar" -Force -ErrorAction SilentlyContinue