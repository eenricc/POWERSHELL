[System.Windows.Forms.Application]::EnableVisualStyles()
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

#-----------------------------------------------------------------------------------
# FORMULARI
#-----------------------------------------------------------------------------------
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '538,432'
$Form.text                       = "BACKUP"
$Form.TopMost                    = $false
$Form.MinimizeBox                = $false
$Form.MaximizeBox                = $false
$Form.FormBorderStyle            = 'FixedDialog'
$Form.StartPosition              = "CenterScreen"
$Form.Icon                       = $null

#------------- ETIQUETA ORIGEN -------------
$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Origen:"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(18,21)
$Label1.Font                     = 'Microsoft Sans Serif,10'

#------------- TEXTBOX ORIGEN -------------
$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 236
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(18,43)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'

#------------- ETIQUETA DESTI -------------
$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Destí:"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(18,82)
$Label2.Font                     = 'Microsoft Sans Serif,10'

#------------- TEXTBOX DESTI -------------
$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $false
$TextBox2.width                  = 236
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(18,103)
$TextBox2.Font                   = 'Microsoft Sans Serif,10'

#------------- BOTO BACKUP -------------
$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Backup"
$Button1.width                   = 130
$Button1.height                  = 33
$Button1.location                = New-Object System.Drawing.Point(345,95)
$Button1.Font                    = 'Microsoft Sans Serif,10'
$Button1.Add_Click({validaCarpeta})

#------------- BOTO CLEAR -------------
$Button4                         = New-Object system.Windows.Forms.Button
$Button4.text                    = "Clear"
$Button4.width                   = 40
$Button4.height                  = 33
$Button4.location                = New-Object System.Drawing.Point(478,95)
$Button4.Font                    = 'Microsoft Sans Serif,8'
$Button4.Add_Click({Neteja})

#------------- TEXT OUTPUT -------------
$TextBox3                        = New-Object system.Windows.Forms.TextBox
$TextBox3.multiline              = $true
$TextBox3.width                  = 500
$TextBox3.height                 = 271
$TextBox3.location               = New-Object System.Drawing.Point(18,144)
$TextBox3.Font                   = 'Microsoft Sans Serif,8'
$TextBox3.ScrollBars             = "Both"

#------------- RADIO MIRALL/AFEGIR -------------
$RadioButton1                    = New-Object system.Windows.Forms.RadioButton
$RadioButton1.text               = "COPIA MIRALL"
$RadioButton1.AutoSize           = $true
$RadioButton1.width              = 104
$RadioButton1.height             = 20
$RadioButton1.location           = New-Object System.Drawing.Point(365,22)
$RadioButton1.Font               = 'Microsoft Sans Serif,10'
$RadioButton1.Add_Click({alerta})

$RadioButton2                    = New-Object system.Windows.Forms.RadioButton
$RadioButton2.text               = "COPIA AFEGINT"
$RadioButton2.AutoSize           = $true
$RadioButton2.width              = 104
$RadioButton2.height             = 20
$RadioButton2.location           = New-Object System.Drawing.Point(365,56)
$RadioButton2.Font               = 'Microsoft Sans Serif,10'
$RadioButton2.Add_Click({info})

#------------- BROWSE ORIGEN / DESTI -------------
$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Browse"
$Button2.width                   = 60
$Button2.height                  = 22
$Button2.location                = New-Object System.Drawing.Point(260,43)
$Button2.Font                    = 'Microsoft Sans Serif,10'
$Button2.Add_Click({$TextBox1.text = Get-Folderlocation})

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "Browse"
$Button3.width                   = 60
$Button3.height                  = 22
$Button3.location                = New-Object System.Drawing.Point(260,103)
$Button3.Font                    = 'Microsoft Sans Serif,10'
$Button3.Add_Click({$TextBox2.text = Get-Folderlocation})


$Form.controls.AddRange(@($Label1,$TextBox1,$Label2,$TextBox2,$Button1,$TextBox3,$RadioButton1,$RadioButton2,$Button2,$Button3,$Button4))

#-----------------------------------------------------------------------------------
# FUNCIONS
#-----------------------------------------------------------------------------------
function validaCarpeta{
    If ($TextBox1.textlength -eq 0 -or $TextBox2.textlength -eq 0){
        [System.Windows.MessageBox]::Show('Algun dels camps està buit','ERROR','OK','Error')
    }else{
        If ((test-path $TextBox1.text) -and (test-path $TextBox2.text)){
            If ($RadioButton1.Checked -eq $true){
                backup("mirall")
            }else{
                If ($RadioButton2.Checked -eq $true){ 
                    backup("afegint") 
                }else{
                    [System.Windows.MessageBox]::Show('Selecciona tipus de copia','ERROR','OK','Error')
                }
            }
            
        }else{
            [System.Windows.MessageBox]::Show('Origen o destí no existeix','ERROR','OK','Error')
        }
    }
}

function backup($comanda){
    $origen = $TextBox1.text
    $desti = $TextBox2.text
    If ($comanda -eq "mirall"){robocopy "$origen" "$desti" /MIR /FFT /Z /R:2 /W:5 | foreach {$TextBox3.AppendText($_ + "`r`n")}}
    If ($comanda -eq "afegint"){robocopy "$origen" "$desti" /E /FFT /Z /R:2 /W:5 | foreach {$TextBox3.AppendText($_ + "`r`n")}}       
}

function get-Folderlocation{
    $app = New-Object -ComObject Shell.Application
    $folder = $app.BrowseForFolder(0,"",0,0)
    if ($folder) { $selectedDirectory = $folder.Self.Path } else { $selectedDirectory = "" }
    return $selectedDirectory
}

function Neteja{
    $textBox3.Clear()
}

function alerta{
    [System.Windows.MessageBox]::Show("Copia a la carpeta DESTÍ el contingut a ORIGEN." +"`r`n`r`n"+ "IMPORTANT: La copia mirall deixa la carpeta destí igual que origen. Si existeixen arxius a destí que no són a origen, els eliminarà.",'ALERTA','OK','Warning')
}

function info{
    [System.Windows.MessageBox]::Show("Afegeix a la carpeta DESTÍ el contingut a ORIGEN",'INFO','OK','Information')
}

#-----------------------------------------------------------------------------------
# FORMULARI
#-----------------------------------------------------------------------------------

[void]$Form.ShowDialog()
