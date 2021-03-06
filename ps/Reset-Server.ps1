#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
$serverPath = "C:\Server";
cd $serverPath;
New-Item "$serverpath\eula.txt" -Force;
Set-Content "$serverpath\eula.txt" "eula=true";
$serverUrl = "https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar";
Invoke-WebRequest $serverUrl -OutFile "$serverPath\server.jar";
$serverProperties = "C:\Server\server.properties";
$serverPropertiesUrl = "https://raw.githubusercontent.com/kirbycope/minecraft-scripts/main/ps/server.properties";
Invoke-WebRequest $serverPropertiesUrl -OutFile $serverProperties;
$find = "motd=A Minecraft Server";
$replace = "motd=$env:UserName's Server";
(Get-Content $serverProperties).replace($find, $replace) | Set-Content $serverProperties;
#java -Xmx1024M -Xms1024M -jar "$serverPath\server.jar";
