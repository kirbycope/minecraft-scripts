﻿#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$downloads = "$HOME\Downloads"
$dirBedrock = "$env:LOCALAPPDATA\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang"
$behaviorPacks = "$dirBedrock\behavior_packs"
$resourcePacks = "$dirBedrock\resource_packs"
$worldTemplates = "$dirBedrock\world_templates"
$minecraftWorlds = "$dirBedrock\minecraftWorlds"
$dirJava = "$env:APPDATA\.minecraft"
$skins = "$dirJava\assets\skins"

function Get-McAddon {
    param (
        [string]$fileName 
    )
    Write-Output "Setting up $fileName.mcaddon..."
    Remove-Item "$behaviorPacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item "$resourcePacks\$fileName" -Force -Recurse -ErrorAction SilentlyContinue
    Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mcaddon" -OutFile "$downloads\$fileName.zip"
    Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$dirBedrock\$fileName"
    Get-ChildItem -Directory "$dirBedrock\$fileName" -Filter "*Behavior" | Move-Item -Destination "$behaviorPacks\$fileName"
    Get-ChildItem -Directory "$dirBedrock\$fileName" -Filter "*Resources" | Move-Item -Destination "$resourcePacks\$fileName"
    Remove-Item "$dirBedrock\$fileName" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue
    Write-Output "Done."
}

function Get-McTemplate {
    param (
        [string]$fileName 
    )
    Write-Output "Setting up $fileName.mctemplate..."
    Remove-Item "$worldTemplates\$fileName" -Force -Recurse -ErrorAction SilentlyContinue
    Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mctemplate" -OutFile "$downloads\$fileName.zip"
    Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$worldTemplates\$fileName"
    Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue
    Write-Output "Done."
}

function Get-McWorld {
    param (
        [string]$fileName 
    )
    Write-Output "Setting up $fileName.mcworld..."
    Remove-Item "$minecraftWorlds\$fileName" -Force -Recurse -ErrorAction SilentlyContinue
    Invoke-WebRequest "https://github.com/kirbycope/$fileName/raw/main/$fileName.mcworld" -OutFile "$downloads\$fileName.zip"
    Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$minecraftWorlds\$fileName"
    Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue
    Write-Output "Done."
}

function Get-ResourcePack {
    param (
        [string]$fileName 
    )
    Write-Output "Setting up $fileName resource pack..."
    $resources = "$dirJava\resourcepacks"
    Remove-Item "$resources\$fileName-main" -Force -Recurse -ErrorAction SilentlyContinue
    Invoke-WebRequest "https://github.com/kirbycope/$fileName/archive/refs/heads/main.zip" -OutFile "$downloads\$fileName.zip"
    Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$resources"
    Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue
    Write-Output "Done."
}

function Get-Save {
    param (
        [string]$fileName 
    )
    Write-Output "Setting up $fileName save..."
    $saves = "$dirJava\saves"
    Remove-Item "$saves\$fileName-main" -Force -Recurse -ErrorAction SilentlyContinue
    Invoke-WebRequest "https://github.com/kirbycope/$fileName/archive/refs/heads/main.zip" -OutFile "$downloads\$fileName.zip"
    Expand-Archive -LiteralPath "$downloads\$fileName.zip" -DestinationPath "$saves"
    Remove-Item "$downloads\$fileName.zip" -Force -ErrorAction SilentlyContinue
    Write-Output "Done."
}

function Get-Skin {
    Write-Output "Getting Kirbycope's avatar..."
    Remove-Item "$skins\2013_08_09_skin_20130809053626142196.png" -Force -Recurse -ErrorAction SilentlyContinue
    Invoke-WebRequest "https://github.com/kirbycope/minecraft-scripts/raw/main/common/2013_08_09_skin_20130809053626142196.png" -OutFile "$skins\kirbycope.png"
    Write-Output "Done."
}

# Bedrock
Get-McAddon "cobblemon-bedrock"
Get-McAddon "Cluckshroom"
Get-McAddon "EasterEgg"
Get-McAddon "little-buddy"
Get-McAddon "hearthstone-bedrock"
Get-McAddon "MineKart"
Get-McAddon "Minecraft-Earth-Mobs-Bedrock"
Get-McAddon "Minecraft-Legends-Mobs-Bedrock"
Get-McAddon "mine-pikmin"
Get-McAddon "mob-spawner-bedrock"
Get-McAddon "soccer-bedrock"
Get-McTemplate "animal-crafting-bedrock"
Get-McTemplate "Bedrock-Earth"
Get-McTemplate "crossy-road-bedrock"
Get-McTemplate "item-rush-bedrock"
Get-McTemplate "mysticar-bedrock"
Get-McTemplate "one-block-bedrock"
Get-McTemplate "portal-bedrock"
Get-McTemplate "secret-life-bedrock"
Get-McTemplate "SkyBlock-Bedrock"
Get-McTemplate "skyblock-four-sticks-bedrock"
Get-McTemplate "skyblock-stranded-bedrock"
Get-McTemplate "smb-bedrock"
Get-McWorld "one-chunk-bedrock"
Get-McWorld "void-world-bedrock"

# Java
Get-ResourcePack "flame-of-the-heart" 
Get-Save "build-below-bedrock"
Get-Save "bonus-chest-java"
Get-Save "crossy-road-java"
Get-Save "CopeCraft"
Get-Save "expanding-world"
Get-Save "item-rush-java"
Get-Save "map-markers-java"
Get-Save "Masterpiece-Theatre"
Get-Save "minecRAFT"
Get-Save "mysticar-java"
Get-Save "secret-life-java"
Get-Save "SkyBlock"
Get-Save "skyblock-four-sticks"
Get-Save "smb-java"
Get-Save "void-world-java"
Get-Save "world-of-minecraft"
Get-Skin
