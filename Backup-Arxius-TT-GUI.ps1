Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()


$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '620,350'
$Form.text                       = "BACKUP"
$Form.TopMost                    = $false
$Form.MinimizeBox                = $false
$Form.MaximizeBox                = $false
$Form.FormBorderStyle            = 'FixedDialog'
$Form.StartPosition              = "CenterScreen"
$Form.Icon                      = $null

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
$TextBox1.height                 = 200
$TextBox1.location               = New-Object System.Drawing.Point(20,90)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'

$Button6                         = New-Object system.Windows.Forms.Button
$Button6.text                    = "Clear"
$Button6.width                   = 120
$Button6.height                  = 30
$Button6.location                = New-Object System.Drawing.Point(480,304)
$Button6.Font                    = 'Microsoft Sans Serif,10'
$Button6.Add_Click({Neteja})

$Button7                         = New-Object system.Windows.Forms.Button
$Button7.text                    = "Copia tota la setmana"
$Button7.width                   = 280
$Button7.height                  = 30
$Button7.location                = New-Object System.Drawing.Point(20,304)
$Button7.Font                    = 'Microsoft Sans Serif,10'
$Button7.Add_Click({All})

$Button8                         = New-Object system.Windows.Forms.Button
$Button8.text                    = "Refresca dates copia"
$Button8.width                   = 160
$Button8.height                  = 30
$Button8.location                = New-Object System.Drawing.Point(310,304)
$Button8.Font                    = 'Microsoft Sans Serif,10'
$Button8.Add_Click({DataModificacio})

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.AutoSize                 = $true
$Label1.width                    = 100
$Label1.height                   = 30
$Label1.location                 = New-Object System.Drawing.Point(35,60)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.AutoSize                 = $true
$Label2.width                    = 100
$Label2.height                   = 30
$Label2.location                 = New-Object System.Drawing.Point(155,60)
$Label2.Font                     = 'Microsoft Sans Serif,10'

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.AutoSize                 = $true
$Label3.width                    = 100
$Label3.height                   = 30
$Label3.location                 = New-Object System.Drawing.Point(275,60)
$Label3.Font                     = 'Microsoft Sans Serif,10'

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.AutoSize                 = $true
$Label4.width                    = 100
$Label4.height                   = 30
$Label4.location                 = New-Object System.Drawing.Point(395,60)
$Label4.Font                     = 'Microsoft Sans Serif,10'

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.AutoSize                 = $true
$Label5.width                    = 100
$Label5.height                   = 30
$Label5.location                 = New-Object System.Drawing.Point(515,60)
$Label5.Font                     = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($Button1,$Button2,$Button3,$Button4,$Button5,$TextBox1,$Button6,$Button7,$Button8,$Label1,$Label2,$Label3,$Label4,$Label5))

#---------
#FUNCIONS
#---------

function dilluns{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti scepinstall.exe | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
    DataModificacio
}

function dimarts{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti scepinstall.exe | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
    DataModificacio
}

function dimecres{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti scepinstall.exe | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
    DataModificacio
}

function dijous{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti scepinstall.exe | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
    DataModificacio
}

function divendres{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti scepinstall.exe | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText("COPIA FINALITZADA") 
    $desmapeig
    DataModificacio
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
    DataModificacio
}

function Neteja{
    $textBox1.Clear()
}

function DataModificacio{
    $Avui = Get-Date

    $DataModDilluns = Get-Item C:\Backup\arxiu.7z -ErrorAction SilentlyContinue
    $DataModDimarts = Get-Item C:\Backup\arxiu.7z -ErrorAction SilentlyContinue
    $DataModDimecres = Get-Item C:\Backup\arxiu.7z -ErrorAction SilentlyContinue
    $DataModDijous = Get-Item C:\Backup\arxiu.7z -ErrorAction SilentlyContinue
    $DataModDivendres = Get-Item C:\Backup\arxiu.7z -ErrorAction SilentlyContinue

    $label1.Text = $DataModDilluns.LastWriteTime.ToShortDateString() 
    $label2.Text = $DataModDimarts.LastWriteTime.ToShortDateString() 
    $label3.Text = $DataModDimecres.LastWriteTime.ToShortDateString() 
    $label4.Text = $DataModDijous.LastWriteTime.ToShortDateString()
    $label5.Text = $DataModDivendres.LastWriteTime.ToShortDateString()

    $DiferenciaTempsDL = New-TimeSpan -Start $DataModDilluns.LastWriteTime -End $Avui
    If ($DiferenciaTempsDL.Days -ge 7) {
        $Label1.ForeColor = "Red"
    }else{
        $Label1.ForeColor = "Green"
    }

    $DiferenciaTempsDM = New-TimeSpan -Start $DataModDimarts.LastWriteTime -End $Avui
    If ($DiferenciaTempsDM.Days -ge 7) {
        $Label2.ForeColor = "Red"
    }else{
        $Label2.ForeColor = "Green"
    }

    $DiferenciaTempsDX = New-TimeSpan -Start $DataModDimecres.LastWriteTime -End $Avui
    If ($DiferenciaTempsDX.Days -ge 7) {
        $Label3.ForeColor = "Red"
    }else{
        $Label3.ForeColor = "Green"
    }

    $DiferenciaTempsDJ = New-TimeSpan -Start $DataModDijous.LastWriteTime -End $Avui
    If ($DiferenciaTempsDJ.Days -ge 7) {
        $Label4.ForeColor = "Red"
    }else{
        $Label4.ForeColor = "Green"
    }

    $DiferenciaTempsDV = New-TimeSpan -Start $DataModDivendres.LastWriteTime -End $Avui
    If ($DiferenciaTempsDV.Days -ge 7) {
        $Label5.ForeColor = "Red"
    }else{
        $Label5.ForeColor = "Green"
    }
    
}


#----------------------------------------------------------------------------------------------------------
#PS1 CODE
#----------------------------------------------------------------------------------------------------------

#Variables usuari/pass
$User = "DOMAIN\user"
$Pwd = "Pa$$w0rd"

#Variables d'origen i destí
$ruta_origen = "\\Server\c$\folder"
$ruta_desti = "C:\Backup"

#Mapeig destí amb validació / desmapeig
$mapeig = net use \\Server\c$\folder /user:$User $Pwd
$desmapeig = net use \\Server\c$\folder /d

#Creació de destí en cas de no existir
If(!(test-path $ruta_desti)){
    New-Item -ItemType Directory -Force -Path $ruta_desti | Out-Null
}

DataModificacio

#----------------------------------------------------------------------------------------------------------
#MOSTRAR FORMULARI
#----------------------------------------------------------------------------------------------------------
[void]$Form.ShowDialog()
