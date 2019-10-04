[System.Windows.Forms.Application]::EnableVisualStyles()
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

#----------------------------------------------------------------------------------------------------------
# FORMULARI
#---------------------------------------------------------------------------------------------------------- 
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '325,390'
$Form.text                       = "COPIA/MOU EXTENSIONS"
$Form.TopMost                    = $false
$Form.TopMost                    = $false
$Form.MinimizeBox                = $false
$Form.MaximizeBox                = $false
$Form.FormBorderStyle            = 'FixedDialog'
$Form.StartPosition              = "CenterScreen"
$Form.Icon                       = $null

#------------- ETIQUETES -------------
$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Origen on buscar:"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(26,28)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Destí on copiar:"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(26,86)
$Label2.Font                     = 'Microsoft Sans Serif,10'

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Extensió:"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(26,148)
$Label3.Font                     = 'Microsoft Sans Serif,10'

#------------- TEXTBOX ORIGEN -------------
$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 197
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(26,51)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'

#------------- TEXTBOX DESTI -------------
$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $false
$TextBox2.width                  = 196
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(26,109)
$TextBox2.Font                   = 'Microsoft Sans Serif,10'

#------------- TEXTBOX EXTENSIO -------------
$TextBox3                        = New-Object system.Windows.Forms.TextBox
$TextBox3.multiline              = $false
$TextBox3.width                  = 36
$TextBox3.height                 = 20
$TextBox3.location               = New-Object System.Drawing.Point(93,145)
$TextBox3.Font                   = 'Microsoft Sans Serif,10'

#------------- TEXTBOX PROGRES -------------
$TextBox4                        = New-Object system.Windows.Forms.TextBox
$TextBox4.multiline              = $false
$TextBox4.width                  = 271
$TextBox4.height                 = 150
$TextBox4.location               = New-Object System.Drawing.Point(27,185)
$TextBox4.Multiline              = $true
$TextBox4.Font                   = 'Microsoft Sans Serif,7'
$TextBox4.ScrollBars             = "Both"

#------------- SELECTOR -------------
$RadioButton1                    = New-Object system.Windows.Forms.RadioButton
$RadioButton1.text               = "Copia"
$RadioButton1.AutoSize           = $true
$RadioButton1.width              = 104
$RadioButton1.height             = 20
$RadioButton1.location           = New-Object System.Drawing.Point(160,146)
$RadioButton1.Font               = 'Microsoft Sans Serif,10'

$RadioButton2                    = New-Object system.Windows.Forms.RadioButton
$RadioButton2.text               = "Mou"
$RadioButton2.AutoSize           = $true
$RadioButton2.width              = 104
$RadioButton2.height             = 20
$RadioButton2.location           = New-Object System.Drawing.Point(232,146)
$RadioButton2.Font               = 'Microsoft Sans Serif,10'

#------------- BOTONS BROWSE -------------
$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Cerca"
$Button1.width                   = 60
$Button1.height                  = 25
$Button1.location                = New-Object System.Drawing.Point(236,50)
$Button1.Font                    = 'Microsoft Sans Serif,10'
$Button1.Add_Click({$TextBox1.text = Get-Folderlocation})

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Cerca"
$Button2.width                   = 60
$Button2.height                  = 25
$Button2.location                = New-Object System.Drawing.Point(236,108)
$Button2.Font                    = 'Microsoft Sans Serif,10'
$Button2.Add_Click({$TextBox2.text = Get-Folderlocation})

#------------- BOTO MOU -------------
$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "INICIA"
$Button3.width                   = 190
$Button3.height                  = 30
$Button3.location                = New-Object System.Drawing.Point(26,346)
$Button3.Font                    = 'Microsoft Sans Serif,10'
$Button3.Add_Click({Valida})

#------------- BOTO CLEAR -------------
$Button4                         = New-Object system.Windows.Forms.Button
$Button4.text                    = "NETEJA"
$Button4.width                   = 80
$Button4.height                  = 30
$Button4.location                = New-Object System.Drawing.Point(220,346)
$Button4.Font                    = 'Microsoft Sans Serif,10'
$Button4.Add_Click({Neteja})

$Form.controls.AddRange(@($Label1,$TextBox1,$Button1,$Label2,$TextBox2,$Button2,$Label3,$TextBox3,$TextBox4,$Button3,$Button4,$RadioButton1,$RadioButton2))

#----------------------------------------------------------------------------------------------------------
# FUNCIONS
#----------------------------------------------------------------------------------------------------------
function get-Folderlocation{
    $app = New-Object -ComObject Shell.Application
    $folder = $app.BrowseForFolder(0,"",0,0)
    if ($folder) { $selectedDirectory = $folder.Self.Path } else { $selectedDirectory = "" }
    return $selectedDirectory   
}

function Valida{
    If ($TextBox1.textlength -eq 0 -or $TextBox2.textlength -eq 0 -or $TextBox3.textlength -eq 0){
        [System.Windows.MessageBox]::Show('Algun dels camps està buit','ERROR','OK','Error')
    }else{
        If ((test-path $TextBox1.text) -and (test-path $TextBox2.text)){
            tipusCopia
        }else{
            [System.Windows.MessageBox]::Show('Origen o destí no existeix','ERROR','OK','Error')
        }
    }
}

function tipusCopia{
    If ($RadioButton1.Checked -eq $true){
        inicia("copia")
    }else{
        If ($RadioButton2.Checked -eq $true){
            inicia("mou")
        }else{
            [System.Windows.MessageBox]::Show('Selecciona tipus de copia','TIPUS COPIA','OK','Information')
        }
    }
}

function inicia($comanda){
    $origen = $TextBox1.text
    $desti = $TextBox2.text
    $extensio = "*." + $TextBox3.text
    $Dir = get-childitem $origen -recurse -Filter $extensio
    Foreach ($arxiu in $Dir){
        If ($comanda -eq "copia"){ Copy-Item -Path $arxiu.FullName -Destination $Desti -ErrorAction SilentlyContinue }
        If ($comanda -eq "mou"){ Move-Item -Path $arxiu.FullName -Destination $Desti -ErrorAction SilentlyContinue }
        $TextBox4.AppendText($arxiu.fullname + "`r`n")
    }
    $TextBox4.AppendText("`r`n" + "----------" + "FINALITZAT" + "----------" + "`r`n")      
}

function Neteja{
    $textBox4.Clear()
}

#----------------------------------------------------------------------------------------------------------
# MOSTRAR FORMULARI
#----------------------------------------------------------------------------------------------------------
[void]$Form.ShowDialog()
