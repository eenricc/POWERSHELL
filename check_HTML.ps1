#----------------------------------------------
# BACKDOOR                  
#----------------------------------------------

param([string]$magicword)

#----------------------------------------------
# FUNCIONS
#----------------------------------------------

function check_web{
    #Introduir URL de check
    $URL = "www.google.egs"
    $existeix = $true
    try {$null = Invoke-WebRequest -Uri $URL}
    catch {$existeix = $false}
    if ($existeix -eq $false){
        if ($magicword -eq "pinas"){
            fescoses
        }else{
            Write-Host "UNEXPECTED ERROR" -ForegroundColor red
        }
    }else{
        fescoses
    }
}

function fescoses{
    Write-Host "FES COSES" -ForegroundColor green
}

#----------------------------------------------
# INICI
#----------------------------------------------

check_web