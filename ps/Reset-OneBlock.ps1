#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
$mcFolder = "$env:APPDATA\.minecraft";
$fileName = "IJAMinecrafts-OneBlock-1-16-4.zip";
$filePath = "$HOME\Downloads\$fileName";
$downloadURL = "https://ijaminecraft.com/download/map/oneblock/$fileName";

# 1. Download archive (if not already downloaded)
if (-not(Test-Path -Path $filePath -PathType Leaf)) {
    Invoke-WebRequest $downloadURL -OutFile $filePath;
}
# 2. Delete old save
Remove-Item "$mcFolder\saves\OneBlock by IJAMinecraft (1.16.4)" -Force -Recurse
# 3. Unarchive downloaded save
Expand-Archive -LiteralPath $filePath -DestinationPath "$mcFolder\saves" -Force
