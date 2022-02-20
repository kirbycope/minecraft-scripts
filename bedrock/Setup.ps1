#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$downloads = "$HOME\Downloads";
$comMojang = "$env:LOCALAPPDATA\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang";
$worldTemplates = "$comMojang\world_templates";

# World Templates - Earth
$fileName = "Earth";
Remove-Item "$worldTemplates\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/Bedrock-Earth/raw/main/Bedrock-Earth.mctemplate" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$worldTemplates\$fileName";
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;

# World Templates - SkyBlock
$fileName = "SkyBlock";
Remove-Item "$worldTemplates\$fileName" -Force -Recurse -ErrorAction SilentlyContinue;
Invoke-WebRequest "https://github.com/kirbycope/SkyBlock-Bedrock/raw/main/SkyBlock.mctemplate" -OutFile "$downloads\$fileName.zip";
Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$worldTemplates\$fileName";
Remove-Item "$downloads\$fileName" -Force -ErrorAction SilentlyContinue;
