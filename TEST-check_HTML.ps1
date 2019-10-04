#----------------------------------------------
# BACKDOOR                  
#----------------------------------------------

param([string]$magicword)

#----------------------------------------------
# FUNCIONS
#----------------------------------------------

function check_web{
    #Introduir URL de check
    $URL = "www.google.es"
    $existeix = $true

    #Comprova si la URL es operativa
    try {$null = Invoke-WebRequest -Uri $URL}
    catch {$existeix = $false}

    #Condicionals amb "magicword"
    If (($existeix -eq $false) -and ($magicword -eq "pinas")){fescoses}
    If (($existeix -eq $false) -and ($magicword -ne "pinas")){noentra}               
    If ($existeix -eq $true){fescoses}
}

function fescoses {Write-Host "FES COSES" -ForegroundColor green}
function noentra {Write-Host "UNEXPECTED ERROR" -ForegroundColor red}

#----------------------------------------------
# INICI
#----------------------------------------------

check_web
