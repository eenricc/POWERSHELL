Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

#----------------------------------------------------------------------------------------------------------
# FORMULARI
#---------------------------------------------------------------------------------------------------------- 
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '471,421'
$Form.text                       = "Creació masiva d`'usuaris"
$Form.TopMost                    = $false 
$Form.MinimizeBox                = $false
$Form.MaximizeBox                = $false
$Form.FormBorderStyle            = 'FixedDialog'
$Form.StartPosition              = "CenterScreen"
$Form.Icon        

# ---------
# ETIQUETES
# ---------
$LabelCSV                        = New-Object system.Windows.Forms.Label
$LabelCSV.text                   = "Arxiu CSV:"
$LabelCSV.AutoSize               = $true
$LabelCSV.width                  = 25
$LabelCSV.height                 = 10
$LabelCSV.location               = New-Object System.Drawing.Point(22,26)
$LabelCSV.Font                   = 'Microsoft Sans Serif,10'

$LabelOU                         = New-Object system.Windows.Forms.Label
$LabelOU.text                    = "OU Destí:"
$LabelOU.AutoSize                = $true
$LabelOU.width                   = 25
$LabelOU.height                  = 10
$LabelOU.location                = New-Object System.Drawing.Point(22,55)
$LabelOU.Font                    = 'Microsoft Sans Serif,10'

$LabelDOM                        = New-Object system.Windows.Forms.Label
$LabelDOM.text                   = "Domini:"
$LabelDOM.AutoSize               = $true
$LabelDOM.width                  = 25
$LabelDOM.height                 = 10
$LabelDOM.location               = New-Object System.Drawing.Point(22,85)
$LabelDOM.Font                   = 'Microsoft Sans Serif,10'

$LabelPASS                       = New-Object system.Windows.Forms.Label
$LabelPASS.text                  = "Password:"
$LabelPASS.AutoSize              = $true
$LabelPASS.width                 = 25
$LabelPASS.height                = 10
$LabelPASS.location              = New-Object System.Drawing.Point(22,115)
$LabelPASS.Font                  = 'Microsoft Sans Serif,10'

# -------
# TEXTBOX
# -------
$TextBoxCSV                      = New-Object system.Windows.Forms.TextBox
$TextBoxCSV.multiline            = $false
$TextBoxCSV.width                = 285
$TextBoxCSV.height               = 20
$TextBoxCSV.location             = New-Object System.Drawing.Point(97,22)
$TextBoxCSV.Font                 = 'Microsoft Sans Serif,10'

$TextBoxOU                       = New-Object system.Windows.Forms.TextBox
$TextBoxOU.multiline             = $false
$TextBoxOU.width                 = 285
$TextBoxOU.height                = 20
$TextBoxOU.location              = New-Object System.Drawing.Point(97,51)
$TextBoxOU.Font                  = 'Microsoft Sans Serif,10'

$TextBoxDOM                      = New-Object system.Windows.Forms.TextBox
$TextBoxDOM.multiline            = $false
$TextBoxDOM.width                = 285
$TextBoxDOM.height               = 20
$TextBoxDOM.location             = New-Object System.Drawing.Point(97,82)
$TextBoxDOM.Font                 = 'Microsoft Sans Serif,10'
$TextBoxDOM.ReadOnly             = $true

$TextBoxPASS                     = New-Object system.Windows.Forms.TextBox
$TextBoxPASS.multiline           = $false
$TextBoxPASS.width               = 285
$TextBoxPASS.height              = 20
$TextBoxPASS.location            = New-Object System.Drawing.Point(97,113)
$TextBoxPASS.Font                = 'Microsoft Sans Serif,10'

$TextBoxRESULT                   = New-Object system.Windows.Forms.TextBox
$TextBoxRESULT.multiline         = $true
$TextBoxRESULT.width             = 430
$TextBoxRESULT.height            = 215
$TextBoxRESULT.location          = New-Object System.Drawing.Point(20,150)
$TextBoxRESULT.Font              = 'Microsoft Sans Serif,10'
$TextBoxRESULT.ScrollBars        = "Both"

# -------
# BOTONS
# -------
$ButtonCSV                       = New-Object system.Windows.Forms.Button
$ButtonCSV.text                  = "Cerca"
$ButtonCSV.width                 = 60
$ButtonCSV.height                = 25
$ButtonCSV.location              = New-Object System.Drawing.Point(390,21)
$ButtonCSV.Font                  = 'Microsoft Sans Serif,10'
$ButtonCSV.Add_Click({seleccionaArxiu})

$ButtonOU                        = New-Object system.Windows.Forms.Button
$ButtonOU.text                   = "Cerca"
$ButtonOU.width                  = 60
$ButtonOU.height                 = 25
$ButtonOU.location               = New-Object System.Drawing.Point(390,50)
$ButtonOU.Font                   = 'Microsoft Sans Serif,10'
$ButtonOU.Add_Click({Cerca-ActiveDirectory})

$ButtonDOM                      = New-Object system.Windows.Forms.Button
$ButtonDOM.text                 = "Edita"
$ButtonDOM.width                = 60
$ButtonDOM.height               = 25
$ButtonDOM.location             = New-Object System.Drawing.Point(390,81)
$ButtonDOM.Font                 = 'Microsoft Sans Serif,10'
$ButtonDOM.Add_Click({canviaDomini})

$ButtonPASS                      = New-Object system.Windows.Forms.Button
$ButtonPASS.text                 = "Genera"
$ButtonPASS.width                = 60
$ButtonPASS.height               = 25
$ButtonPASS.location             = New-Object System.Drawing.Point(390,112)
$ButtonPASS.Font                 = 'Microsoft Sans Serif,10'
$ButtonPASS.Add_Click({generaPass})

$ButtonINICI                     = New-Object system.Windows.Forms.Button
$ButtonINICI.text                = "Inicia la creació d'usuaris"
$ButtonINICI.width               = 295
$ButtonINICI.height              = 30
$ButtonINICI.location            = New-Object System.Drawing.Point(20,378)
$ButtonINICI.Font                = 'Microsoft Sans Serif,10'
$ButtonINICI.Add_Click({inicia})

$ButtonCLEAN                     = New-Object system.Windows.Forms.Button
$ButtonCLEAN.text                = "Neteja"
$ButtonCLEAN.width               = 130
$ButtonCLEAN.height              = 30
$ButtonCLEAN.location            = New-Object System.Drawing.Point(321,378)
$ButtonCLEAN.Font                = 'Microsoft Sans Serif,10'
$ButtonCLEAN.Add_Click({$TextBoxRESULT.clear()})

$Form.controls.AddRange(@($TextBoxCSV,$LabelCSV,$ButtonCSV,$LabelOU,$TextBoxOU,$ButtonOU,$TextBoxDOM,$LabelDOM,$TextBoxRESULT,$TextBoxPASS,$ButtonINICI,$ButtonCLEAN,$LabelPASS,$ButtonDOM,$ButtonPASS))


#----------------------------------------------------------------------------------------------------------
# FUNCIONS
#----------------------------------------------------------------------------------------------------------

function seleccionaArxiu{   
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{Filter = 'Arxiu (AD_AddUsers.csv) | AD_AddUsers.csv'}
    $FileBrowser.ShowDialog() | Out-Null
    $seleccio = $FileBrowser.FileName
    $TextBoxCSV.text = $seleccio 
}

Function Cerca-ActiveDirectory { 
	#FORMULARI  
    $FormAD                      = New-Object Windows.Forms.form 
    $FormAD.ClientSize           = '600,400'
    $FormAD.text                 = "Selecciona OU on crear els usuaris" 
    $FormAD.TopMost              = $false 
    $FormAD.MinimizeBox          = $false
    $FormAD.MaximizeBox          = $false
    $FormAD.FormBorderStyle      = 'FixedDialog'
    $FormAD.StartPosition        = "CenterScreen"    
    
    #TREEVIEW
    $TV                          = New-Object Windows.Forms.TreeView 
    $TV.Location                 = New-Object System.Drawing.Size(10,10) 
    $TV.size                     = New-Object System.Drawing.Size(580,350)    
    
    #BOTÓ
    $btnSelect                   = New-Object System.Windows.Forms.Button 
    $btnSelect.text              = "Selecciona" 
    $btnSelect.Location          = New-Object System.Drawing.Size(250,365) 
    $btnSelect.size              = New-Object System.Drawing.Size(100,30) 
    $btnSelect.add_Click({ 
        $Script:Return           = New-Object system.directoryservices.directoryEntry("LDAP://$($TV.SelectedNode.text)") 
        $FormAD.close() 
    }) 
    
    #TREENODE ROOT
    $root=[ADSI]''
    $TNRoot                      = New-Object System.Windows.Forms.TreeNode("Root") 
    $TNRoot.Name                 = $root.name 
    $TNRoot.Text                 = $root.distinguishedName 
    $TNRoot.tag                  = "NotEnumerated" 
    
    #DESPLEGABLE OUs
    $TV.add_AfterSelect({ 
        if ($this.SelectedNode.tag -eq "NotEnumerated") { 
            $de = [ADSI]"LDAP://$($this.SelectedNode.text)"
            $de.psBase.get_Children() |
                foreach { 
                    $TN = new-object System.Windows.Forms.TreeNode 
                    $TN.Name = $_.name 
                    $TN.Text = $_.distinguishedName 
                    $TN.tag = "NotEnumerated" 
                    $this.SelectedNode.Nodes.Add($TN) 
                } 
            $this.SelectedNode.tag = "Enumerated" 
        } 
    }) 
    
    #AFEGIR OBJECTES A FORMULARI
    [void]$TV.Nodes.Add($TNRoot) 
    $FormAD.Controls.Add($TV) 
    $FormAD.Controls.Add($btnSelect) 
    $FormAD.Add_Shown({$FormAD.Activate()}) 
    [void]$FormAD.showdialog() 

    #RETORNA OU SELECCIONADA
    $TextBoxOU.text = $Script:Return.distinguishedName
    
} 

function Inicia{
    If ($TextBoxCSV.textlength -eq 0 -or $TextBoxOU.textlength -eq 0 -or $TextBoxDOM.textlength -eq 0 -or $TextBoxPASS.textlength -eq 0){
        [System.Windows.MessageBox]::Show('Cal omplenar tots els camps','ERROR','OK','Error')
    }else{
        $OU = $TextBoxOU.text
        $ArxiuCSV = $TextBoxCSV.text
        $Domain = $TextBoxDOM.text
        $Password = $TextBoxPASS.text

        $Users = Import-Csv -Delimiter ";" -Path "$ArxiuCSV"
        $pass = ConvertTo-SecureString -String $password -AsPlainText -Force  

        foreach ($User in $Users) {          
            $hash = @{
                Name = $user.givenname + " " + $user.Surname 
                Displayname = $user.givenname + " " + $user.Surname 
                Path = $OU
                Surname = $user.Surname
                GivenName = $user.givenName
                Samaccountname = $user.sAMAccountName
                UserPrincipalName = $user.sAMAccountName + $Domain
                AccountPassword = $pass
                Enabled = $True
                ChangePasswordAtLogon = $False
                Title = $user.title
	            Company = $user.company
	            City = $user.city
	            MobilePhone = $user.mobile
                Department = $user.Department    
                Description = $user.description            
            } 
            Try{
                New-ADUser @hash -PassThru -PasswordNeverExpires $False | Out-Null
                $TextBoxRESULT.AppendText("Usuari: " + $user.GivenName + " " + $user.Surname + "`r`n")
                $TextBoxRESULT.AppendText("Estat: OK`r`n") 
                $TextBoxRESULT.appendText("---------------------------`r`n") 
            }Catch{
                $TextBoxRESULT.AppendText("Usuari: " + $user.GivenName + " " + $user.Surname + "`r`n")   
                $TextBoxRESULT.AppendText("Estat: ERROR`r`n") 
                $TextBoxRESULT.appendText("Error: " + $error + "`r`n")   
                $TextBoxRESULT.appendText("---------------------------`r`n") 
                $error.Clear()     
            }
    
        }
    } 
}

function canviaDomini{

    $TextBoxDOM.ReadOnly = $False

}

function generaPass{
    $LletresMIN = Get-Random -InputObject "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" -count 3
    $LletresMAJ = Get-Random -InputObject "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z" -count 3
    $Numeros = Get-Random -InputObject "1","2","3","4","5","6","7","8","9","0" -count 3 
    $Simbols = Get-Random -InputObject ",",";",".",":","-","_","!","?","$","%","&","/","(",")","="  -count 3 
    $Password = ($LletresMIN + $LletresMAJ + $Numeros + $Simbols | Get-Random -Count 12) -join ""
    $TextBoxPASS.Text = $Password
}

#----------------------------------------------------------------------------------------------------------
# PS1 CODE
#----------------------------------------------------------------------------------------------------------

Try{
    $Domini = Get-ADDomain
    $DominiUser = "@" + $Domini.DNSRoot
    $TextBoxDOM.Text = $DominiUser
}catch{
    $TextBoxRESULT.AppendText("ERROR: Sense acces al AD des d'aquest equip`r`n")
    $ButtonCSV.Enabled = $False
    $ButtonOU.Enabled = $False
    $ButtonDOM.Enabled = $False
    $ButtonINICI.Enabled = $False 
    $ButtonCLEAN.Enabled = $False
    $ButtonPASS.Enabled = $False
}



#----------------------------------------------------------------------------------------------------------
# MOSTRAR FORMULARI
#---------------------------------------------------------------------------------------------------------
[void]$Form.ShowDialog()
