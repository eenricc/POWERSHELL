Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()


$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '620,285'
$Form.text                       = "BACKUP"
$Form.TopMost                    = $false
$Form.MinimizeBox                = $false
$Form.MaximizeBox                = $false
$Form.FormBorderStyle            = 'FixedDialog'
$Form.StartPosition              = "CenterScreen"
$Form.Icon                       = $null

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Dilluns"
$Button1.width                   = 100
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(20,20)
$Button1.Font                    = 'Microsoft Sans Serif,10'
$Button1.Add_Click({dilluns})

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Dimarts"
$Button2.width                   = 100
$Button2.height                  = 30
$Button2.location                = New-Object System.Drawing.Point(140,20)
$Button2.Font                    = 'Microsoft Sans Serif,10'
$Button2.Add_Click({dimarts})

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "Dimecres"
$Button3.width                   = 100
$Button3.height                  = 30
$Button3.location                = New-Object System.Drawing.Point(260,20)
$Button3.Font                    = 'Microsoft Sans Serif,10'
$Button3.Add_Click({dimecres})

$Button4                         = New-Object system.Windows.Forms.Button
$Button4.text                    = "Dijous"
$Button4.width                   = 100
$Button4.height                  = 30
$Button4.location                = New-Object System.Drawing.Point(380,20)
$Button4.Font                    = 'Microsoft Sans Serif,10'
$Button4.Add_Click({dijous})

$Button5                         = New-Object system.Windows.Forms.Button
$Button5.text                    = "Divendres"
$Button5.width                   = 100
$Button5.height                  = 30
$Button5.location                = New-Object System.Drawing.Point(500,20)
$Button5.Font                    = 'Microsoft Sans Serif,10'
$Button5.Add_Click({divendres})

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $true
$TextBox1.Scrollbars             = "Vertical" 
$TextBox1.width                  = 580
$TextBox1.height                 = 169
$TextBox1.location               = New-Object System.Drawing.Point(20,62)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'

$Button6                         = New-Object system.Windows.Forms.Button
$Button6.text                    = "Clear"
$Button6.width                   = 120
$Button6.height                  = 30
$Button6.location                = New-Object System.Drawing.Point(480,244)
$Button6.Font                    = 'Microsoft Sans Serif,10'
$Button6.Add_Click({Neteja})

$Button7                         = New-Object system.Windows.Forms.Button
$Button7.text                    = "Copia tota la setmana"
$Button7.width                   = 440
$Button7.height                  = 30
$Button7.location                = New-Object System.Drawing.Point(20,244)
$Button7.Font                    = 'Microsoft Sans Serif,10'
$Button7.Add_Click({All})

$Form.controls.AddRange(@($Button1,$Button2,$Button3,$Button4,$Button5,$TextBox1,$Button6, $Button7))

#----------------------------------------------------------------------------------------------------------
#PS1 CODE
#----------------------------------------------------------------------------------------------------------

#Variables usuari/pass
$User = "DOMAIN\user"
$Pwd = "Pa55w0rd"

#Mapeig destí amb validació / desmapeig
$mapeig = net use \\Server\carpeta /user:$User $Pwd
$desmapeig = net use \\Server\carpeta /d

#Variables d'origen i destí
$ruta_origen = "\\Server\carpeta"
$ruta_desti = "C:\Backup"

#Creació de destí en cas de no existir
If(!(test-path $ruta_desti)){
    New-Item -ItemType Directory -Force -Path $ruta_desti | Out-Null
}


#---------
#FUNCIONS
#---------

function dilluns{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
}

function dimarts{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
}

function dimecres{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
}

function dijous{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
}

function divendres{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
}

function all{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    robocopy.exe $ruta_origen $ruta_desti arxiu.7z | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
}

function Neteja{
    $textBox1.Clear()
}


#----------------------------------------------------------------------------------------------------------
#MOSTRAR FORMULARI
#----------------------------------------------------------------------------------------------------------
[void]$Form.ShowDialog()
