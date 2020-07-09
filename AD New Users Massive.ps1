# ------ Variables a modificar ------
$OU = "OU=test,DC=cosentinogroup,DC=net"
$ArxiuCSV = "C:\Users\enric.ferrer\Desktop\Scripts\AD New Users Massive.csv" #DESAR EN UTF-8
$Domain = "@cosentino.com"
#------------------------------------

#----------------------------------------------------------------------------------------------------------
# PS1 COSE
#---------------------------------------------------------------------------------------------------------- 
$Users = Import-Csv -Delimiter ";" -Path "$ArxiuCSV"


foreach ($User in $Users) {   
    
    $hash = @{
        Name = $user.givenname + " " + $user.Surname 
        Displayname = $user.givenname + " " + $user.Surname 
        Path = $OU
        Surname = $user.Surname
        GivenName = $user.givenName
        Samaccountname = $user.sAMAccountName
        UserPrincipalName = $user.sAMAccountName + $Domain
        AccountPassword = ConvertTo-SecureString -String $user.password -AsPlainText -Force 
        Enabled = $True
        ChangePasswordAtLogon = $False
        #Title = $user.title
	    #Company = $user.company
	    #City = $user.city
	    #MobilePhone = $user.mobile
        #Department = $user.Department    
        Description = $user.description            
    } 
    Try{
        New-ADUser @hash -PassThru -PasswordNeverExpires $True | Out-Null
        Write-Host "Creat usuari" $user.GivenName $user.Surname -ForegroundColor "Green"
    }Catch{
        Write-Host "Error al crear usuari" $user.GivenName $user.Surname -ForegroundColor "Red"
    }
    
} 

#Crear arxiu AD New Users Massive.csv amb contingut:
#Samaccountname;GivenName;Surname;description;password
#Samanamer;Nombre;Ape Llidos;Test Algta;WWKMkksr04
