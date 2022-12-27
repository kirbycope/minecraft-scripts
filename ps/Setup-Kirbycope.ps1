#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$downloads = "$HOME\Downloads";

# BEDROCK
$comMojang = "$env:LOCALAPPDATA\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang";
$worldTemplates = "$comMojang\world_templates";

# World Template: Bedrock-Earth
$fileName = "Bedrock-Earth";
Remove-Item "$worldTemplates\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/Bedrock-Earth.mctemplate" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$worldTemplates\$fileName";
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# World Template: SkyBlock-Bedrock
$fileName = "SkyBlock-Bedrock";
Remove-Item "$worldTemplates\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/SkyBlock.mctemplate" -OutFile "$downloads\$fileName.zip";
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

# Save: world-of-minecraft
$fileName = "world-of-minecraft";
Remove-Item "$saves\$fileName-main" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/$fileName/archive/refs/heads/main.zip" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves";
Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue;
