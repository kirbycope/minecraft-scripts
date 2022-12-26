#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
$serverPath = "C:\Server";
Set-Location $serverPath;
New-Item "$serverpath\eula.txt" -Force;
Set-Content "$serverpath\eula.txt" "eula=true";
$serverUrl = "https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar";
Invoke-WebRequest $serverUrl -OutFile "$serverPath\server.jar";
$serverProperties = "C:\Server\server.properties";
$serverPropertiesUrl = "https://raw.githubusercontent.com/kirbycope/minecraft-scripts/main/ps/server.properties";
Invoke-WebRequest $serverPropertiesUrl -OutFile $serverProperties;
$find = "motd=A Minecraft Server";
$replace = "motd=$env:UserName's Server";
(Get-Content $serverProperties).replace($find, $replace) | Set-Content $serverProperties;
#java -Xmx1024M -Xms1024M -jar "$serverPath\server.jar";
