# ------------- App hashtables ("dictionaries") -----------------

# Modify this to you linking. Just un-comment or comment (#) software you want to have / don't want to have.
# For further instructions see: https://github.com/vii33/ChocoVanillaPackage

$packagesBasic = @{
# --- Basics ---
    '7zip'='';
    notepadplusplus=''; 
    vlc=''; 
    irfanview='';
    irfanviewplugins='';
    adobereader='--params="/UpdateMode:4"';
    #foxitreader='--ia="/MERGETASKS=!desktopicon,!displayinbrowser /COMPONENTS=*pdfviewer,*ffse,*installprint,!ffaddin,*ffspellcheck,!connectedpdf.!installprint\wordaddin,!installprint\pptaddin,!installprint\exceladdin /DIR=D:\Programme\choco\foxitreader"';

# --- Browsers ---
    googlechrome='';
    #firefox='--params="/l:de /NoDesktopShortcut /RemoveDistributionDir"';
    #opera='--params="/NoDesktopShortcut /NoTaskbarShortcut"';

# --- File Sync Tools ---
    #dropbox='';
    #googledrive='';

# --- Collaboration Tools ---
    zoom='';    
    'microsoft-teams'='';
    #discord='';

# --- System administration ---
    chocolateygui='';    
    windirstat='';
    teamviewer='';
    'cpu-z.install'='';
    'freecommander-xe.install'='';

# --- Crypto ---
    keepass='';
    #veracrypt='';
} 



$packagesDev = @{
# --- General ---
    vscode='--params="/NoDesktopIcon /NoQuicklaunchIcon"';
    git='';
    'github-desktop'='';
    sourcetree='';

# --- API Clients ---
    postman='';
    'insomnia-rest-api-client'='';

# --- Cloud ---
    #'azure-cli'='';
    #'aws-vault'='';

# --- Languages ---
    miniconda3='--params="/InstallationType:JustMe /AddToPath:1 /RegisterPython:1"'; 
    #'nodejs.install'='';
    #'dotnetcore-sdk'='';   
}
# --------------------------------------------------------------




# --------------------- Script start ---------------------------
Write-Host "`n --- The CHOCO VANILLA PACKAGE --- " -ForegroundColor black -BackgroundColor white
Write-Host "https://github.com/vii33/ChocoVanillaPackage `n" -ForegroundColor green

$Break = $False
Do{
    switch (Read-Host "Which apps should be installed? Enter 'b' for basic apps, 'v' for developer apps. If you want both, then run the
script two times."){
    
    b { $packToInstall = $packagesBasic; $Break = $True}
    v { $packToInstall = $packagesDev; $Break = $True}
    e { exit }

    default {  Write-Host "Wrong input. Plase provide the character 'b' or 'v'. Select 'e' for exit." -ForegroundColor red  }
    }
} While ($Break -eq $False)


ForEach($key in $packToInstall.Keys){
    if ($packToInstall[$key]) {
        choco install $key -y $packToInstall[$key]   
    } 
    else {
        # Default installer
        choco install $key -y  
    }
}