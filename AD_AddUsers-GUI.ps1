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

$LabelTIPUS                       = New-Object system.Windows.Forms.Label
$LabelTIPUS.text                  = "Tipus de Password:"
$LabelTIPUS.AutoSize              = $true
$LabelTIPUS.width                 = 25
$LabelTIPUS.height                = 10
$LabelTIPUS.location              = New-Object System.Drawing.Point(22,145)
$LabelTIPUS.Font                  = 'Microsoft Sans Serif,10'

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
$TextBoxOU.ReadOnly              = $true

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
$TextBoxRESULT.height            = 190
$TextBoxRESULT.location          = New-Object System.Drawing.Point(20,175)
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

$ButtonEXPORT                     = New-Object system.Windows.Forms.Button
$ButtonEXPORT.text                = "Export"
$ButtonEXPORT.width               = 70
$ButtonEXPORT.height              = 30
$ButtonEXPORT.location            = New-Object System.Drawing.Point(318,378)
$ButtonEXPORT.Font                = 'Microsoft Sans Serif,10'
$ButtonEXPORT.Add_Click({export})

$ButtonCLEAN                     = New-Object system.Windows.Forms.Button
$ButtonCLEAN.text                = "Neteja"
$ButtonCLEAN.width               = 60
$ButtonCLEAN.height              = 30
$ButtonCLEAN.location            = New-Object System.Drawing.Point(391,378)
$ButtonCLEAN.Font                = 'Microsoft Sans Serif,10'
$ButtonCLEAN.Add_Click({$TextBoxRESULT.clear()})

# ------------
# RADIOBUTTONS
# ------------
$RadioButtonMATEIX                    = New-Object system.Windows.Forms.RadioButton
$RadioButtonMATEIX.text               = "Tots igual"
$RadioButtonMATEIX.AutoSize           = $true
$RadioButtonMATEIX.width              = 104
$RadioButtonMATEIX.height             = 20
$RadioButtonMATEIX.location           = New-Object System.Drawing.Point(160,144)
$RadioButtonMATEIX.Font               = 'Microsoft Sans Serif,10'
$RadioButtonMATEIX.Checked            = $True
$RadioButtonMATEIX.Add_Click({passIgual})

$RadioButtonINDV                    = New-Object system.Windows.Forms.RadioButton
$RadioButtonINDV.text               = "Tots diferent"
$RadioButtonINDV.AutoSize           = $true
$RadioButtonINDV.width              = 104
$RadioButtonINDV.height             = 20
$RadioButtonINDV.location           = New-Object System.Drawing.Point(260,144)
$RadioButtonINDV.Font               = 'Microsoft Sans Serif,10'
$RadioButtonINDV.Add_Click({passDiferent})

$Form.controls.AddRange(@($TextBoxCSV,$LabelCSV,$ButtonCSV,$LabelOU,$TextBoxOU,$ButtonOU,$TextBoxDOM,$LabelDOM,$TextBoxRESULT,$TextBoxPASS,$ButtonINICI,$ButtonCLEAN,$LabelPASS,$ButtonDOM,$ButtonPASS,$RadioButtonMATEIX,$RadioButtonINDV,$LabelTIPUS,$ButtonEXPORT))

#----------------------------------------------------------------------------------------------------------
# FUNCIONS
#----------------------------------------------------------------------------------------------------------

function seleccionaArxiu{   
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{Filter = 'Arxiu (AD_AddUsers.csv) | AD_AddUsers.csv'}
    $FileBrowser.ShowDialog() | Out-Null
    $Seleccio = $FileBrowser.FileName
    $TextBoxCSV.text = $Seleccio 
}

function Cerca-ActiveDirectory {
	#FORMULARI ADSEARCH
    $FormADSearch                    = New-Object 'System.Windows.Forms.Form'
    $FormADSearch.ClientSize         = '300, 450'
    $FormADSearch.Text               = "Selecciona OU destí"
    $FormADSearch.MaximizeBox        = $False
	$FormADSearch.MinimizeBox        = $False
    $FormADSearch.StartPosition      = 'CenterScreen'
    $FormADSearch.FormBorderStyle    = 'FixedDialog'
	
    #BOTO OK
    $buttonOK                        = New-Object 'System.Windows.Forms.Button'	
    $buttonOK.Location               = '9, 415'
	$buttonOK.Size                   = '282, 30'
	$buttonOK.Text                   = "Selecciona OU"
    $ButtonOK.Add_click({
        $TextBoxOU.text = $Script:OUSelected
        $FormADSearch.Close()})
	
    #TREEVIEW
	$TreeView                        = New-Object 'System.Windows.Forms.TreeView'
    $TreeView.Location               = '10, 10'
	$TreeView.Size                   = '280, 400'
	$TreeView.add_NodeMouseClick([System.Windows.Forms.TreeNodeMouseClickEventHandler]{
		$thisOU=[adsi]$_.Node.Name
		if( -not $_.Node.Nodes){
            $searcher=[adsisearcher]'objectClass=organizationalunit'
			$searcher.SearchRoot=$_.Node.Name
			$searcher.SearchScope='OneLevel'
			$searcher.PropertiesToLoad.Add('name')
			$OUs=$searcher.Findall()
			foreach($ou in $OUs){
				$_.Node.Nodes.Add($ou.Path,$ou.Properties['name'])
			} 
		}
		$_.Node.Expand()
        $Script:OUSelected = $thisOU.DistinguishedName
	})
    
    #AFEGIR AL FORMULARI
	$FormADSearch.add_Load({
		$rootCN=[ADSI]''
		$nodeName=$rootCN.Name
		$key="LDAP://$($rootCN.DistinguishedName)"
		$TreeView.Nodes.Add($key,$nodeName)	
    })

    $FormADSearch.Controls.AddRange(@($TreeView,$buttonOK))
	
    #MOSTRA FORMULARI
    [void]$FormADSearch.ShowDialog()  
} 

function Inicia{
    If ($TextBoxCSV.textlength -eq 0 -or $TextBoxOU.textlength -eq 0 -or $TextBoxDOM.textlength -eq 0 -or ($TextBoxPASS.ReadOnly -eq $False -and $TextBoxPASS.textlength -eq 0)){
        [System.Windows.MessageBox]::Show('Cal omplenar tots els camps','ERROR','OK','Error')
    }else{
        $OU = $TextBoxOU.text
        $ArxiuCSV = $TextBoxCSV.text
        $Domain = $TextBoxDOM.text
        $Users = Import-Csv -Delimiter ";" -Path "$ArxiuCSV"
        foreach ($User in $Users) {
            If ($RadioButtonMATEIX.Checked -eq $true){
                $Password = $TextBoxPASS.text
                $pass = ConvertTo-SecureString -String $password -AsPlainText -Force  
            }else{
                generaPass
                $Password = $TextBoxPASS.text
                $pass = ConvertTo-SecureString -String $password -AsPlainText -Force  
            } 
                    
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
                $TextBoxRESULT.AppendText("User: " + $user.sAMAccountName + "`r`n") 
                $TextBoxRESULT.AppendText("Password: " + $Password + "`r`n")
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

function passDiferent{
    $TextBoxPASS.text = ""
    $TextBoxPASS.ReadOnly = $True
    $ButtonPASS.Enabled = $False
}

function passIgual{
    $TextBoxPASS.ReadOnly = $False
    $ButtonPASS.Enabled = $True
}

function export{
    $filename = [System.IO.Path]::GetTempFileName()
    $TextBoxRESULT.text | Out-File $filename
	Start-Process notepad $filename		
}

#----------------------------------------------------------------------------------------------------------
# PS1 CODE
#----------------------------------------------------------------------------------------------------------

Try{
    $Domini = Get-ADDomain
    $DominiUser = "@" + $Domini.DNSRoot
    $TextBoxDOM.Text = $DominiUser
}Catch{
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
