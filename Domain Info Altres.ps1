###########################################################################################################################
# SCRIPT:            Domain Info Altres.ps1
# VERSIÓ:            1.0
# DESCRIPCIÓ:        Busca DNS, WSUS i ADFS al domini
# CREADOR:           Enric Ferrer
# MODIFICAT PER:     Enric Ferrer
# DATA MODIFICACIÓ:  03/06/2020
###########################################################################################################################

$Modul = Get-Module -ListAvailable ServerManager
Import-Module -ModuleInfo $Modul
$Servers = Get-ADComputer -Filter 'operatingsystem -like "*server*"' -properties Name

Function LOG {
    param([int]$Dades)
    $Dades 

}

Foreach ($Server in $Servers) {  
    $Connection = Test-WSMan $Server.name -ErrorAction SilentlyContinue
    If ($Connection -ne $Null){
        #Es poden afegir ROLS a buscar aqui
        $Roles = Get-WindowsFeature -ComputerName $Server.name -name DNS, UpdateServices,ADFS-Federation, DHCP, AD-Domain-Services -ErrorAction SilentlyContinue | Where-Object {$_. installstate -eq "installed"} 
        If ($Roles) { 
            $Server.Name + " - "+  $Roles.name | Out-File C:\Users\enric.ferrer\Desktop\1.log -Append 
        } Else { 
            $Server.Name + " - WinRM Open" | Out-File C:\Users\enric.ferrer\Desktop\1.log -Append
        }        
    }Else{
        $Server.Name + " - WinRM Closed" | Out-File C:\Users\enric.ferrer\Desktop\1.log -Append        
    }
}
