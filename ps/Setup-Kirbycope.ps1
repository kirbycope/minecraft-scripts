#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$downloads = "$HOME\Downloads";

# BEDROCK
$comMojang = "$env:LOCALAPPDATA\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang";
$behaviorPacks = "$comMojang\behavior_packs";
$minecraftWorlds = "$comMojang\minecraftWorlds";
$resourcePacks = "$comMojang\resource_packs";
$worldTemplates = "$comMojang\world_templates";

# Add-On: Cluckshroom
$fileName = "Cluckshroom"
Remove-Item "$behaviorPacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Remove-Item "$resourcePacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mcaddon" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$comMojang\$fileName";
Get-ChildItem -Directory "$comMojang\$fileName" -Filter "*Behavior" | Move-Item -Destination "$behaviorPacks\$fileName"
Get-ChildItem -Directory "$comMojang\$fileName" -Filter "*Resources" | Move-Item -Destination "$resourcePacks\$fileName"
Remove-Item "$comMojang\$fileName" -Recurse -Force -ErrorAction SilentlyContinue;
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# Add-On: Little Buddy
$fileName = "little-buddy"
Remove-Item "$behaviorPacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Remove-Item "$resourcePacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mcaddon" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$comMojang\$fileName";
Get-ChildItem -Directory "$comMojang\$fileName" -Filter "*Behavior" | Move-Item -Destination "$behaviorPacks\$fileName"
Get-ChildItem -Directory "$comMojang\$fileName" -Filter "*Resources" | Move-Item -Destination "$resourcePacks\$fileName"
Remove-Item "$comMojang\$fileName" -Recurse -Force -ErrorAction SilentlyContinue;
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# Add-On: Hearthstone Bedrock
$fileName = "hearthstone-bedrock"
Remove-Item "$behaviorPacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Remove-Item "$resourcePacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mcaddon" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$comMojang\$fileName";
Get-ChildItem -Directory "$comMojang\$fileName" -Filter "*Behavior" | Move-Item -Destination "$behaviorPacks\$fileName"
Get-ChildItem -Directory "$comMojang\$fileName" -Filter "*Resources" | Move-Item -Destination "$resourcePacks\$fileName"
Remove-Item "$comMojang\$fileName" -Recurse -Force -ErrorAction SilentlyContinue;
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# Addon: Mob Spawner Bedrock
$fileName = "mob-spawner-bedrock"
Remove-Item "$behaviorPacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Remove-Item "$resourcePacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mcaddon" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$comMojang\$fileName";
Get-ChildItem -Directory "$comMojang\$fileName" -Filter "*Behavior" | Move-Item -Destination "$behaviorPacks\$fileName"
Get-ChildItem -Directory "$comMojang\$fileName" -Filter "*Resources" | Move-Item -Destination "$resourcePacks\$fileName"
Remove-Item "$comMojang\$fileName" -Recurse -Force -ErrorAction SilentlyContinue;
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# World: Void World Bedrock
$fileName = "void-world-bedrock";
Remove-Item "$minecraftWorlds\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mcworld" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$minecraftWorlds\$fileName";
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# World Template: Bedrock Earth
$fileName = "Bedrock-Earth";
Remove-Item "$worldTemplates\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mctemplate" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$worldTemplates\$fileName";
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# World Template: SkyBlock Bedrock
$fileName = "SkyBlock-Bedrock";
Remove-Item "$worldTemplates\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mctemplate" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$worldTemplates\$fileName";
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# World Template: SkyBlock Stranded Bedrock
$fileName = "skyblock-stranded-bedrock";
Remove-Item "$worldTemplates\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mctemplate" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$worldTemplates\$fileName";
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# JAVA
$gameDirectory = "$env:APPDATA\.minecraft";
$saves = "$gameDirectory\saves";

# Save: CopeCraft
$fileName = "CopeCraft";
Remove-Item "$saves\$fileName-main" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/archive/refs/heads/main.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Save: Expanding World
$fileName = "expanding-world";
Remove-Item "$saves\$fileName-main" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/archive/refs/heads/main.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Save: minecRAFT
$fileName = "minecRAFT";
Remove-Item "$saves\$fileName-main" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/archive/refs/heads/main.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Save: SkyBlock
$fileName = "SkyBlock";
Remove-Item "$saves\$fileName-main" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/archive/refs/heads/main.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;

# Save: World of Minecraft
$fileName = "world-of-minecraft";
Remove-Item "$saves\$fileName-main" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/archive/refs/heads/main.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;
