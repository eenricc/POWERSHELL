[System.Windows.Forms.Application]::EnableVisualStyles()
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.drawing

#----------------------------------------------------------------------------------------------------------
#FORMULARI
#----------------------------------------------------------------------------------------------------------

#PROPIETATS DEL FORMULARI
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '620,350'
$Form.text                       = "ADMINISTRACIÓ DE BACKUPS"
$Form.TopMost                    = $true
$Form.MinimizeBox                = $true
$Form.MaximizeBox                = $false
$Form.FormBorderStyle            = 'FixedDialog'
$Form.StartPosition              = "CenterScreen"
$Form.Icon                       = $null

#PROPIETATS DE LES PESTANYES
$tabControl                      = New-object System.Windows.Forms.TabControl
$tabControl.Size                 = '620,350'

##PESTANYA 1
$Tab1                            = New-Object System.Windows.Forms.TabPage
$Tab1.Text                       = "Backup”

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
$TextBox1.location               = New-Object System.Drawing.Point(20,70)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'

$Button6                         = New-Object system.Windows.Forms.Button
$Button6.text                    = "Neteja"
$Button6.width                   = 160
$Button6.height                  = 30
$Button6.location                = New-Object System.Drawing.Point(440,285)
$Button6.Font                    = 'Microsoft Sans Serif,10'
$Button6.Add_Click({Neteja})

$Button7                         = New-Object system.Windows.Forms.Button
$Button7.text                    = "Copia tota la setmana"
$Button7.width                   = 400
$Button7.height                  = 30
$Button7.location                = New-Object System.Drawing.Point(20,285)
$Button7.Font                    = 'Microsoft Sans Serif,10'
$Button7.Add_Click({All})

##PESTANYA2
$Tab2                            = New-Object System.Windows.Forms.TabPage
$Tab2.Text                       = "Estat copia”

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Dilluns"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(100,60)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Dimarts"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(100,100)
$Label2.Font                     = 'Microsoft Sans Serif,10'

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Dimecres"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(100,140)
$Label3.Font                     = 'Microsoft Sans Serif,10'

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "Dijous"
$Label4.AutoSize                 = $true
$Label4.width                    = 25
$Label4.height                   = 10
$Label4.location                 = New-Object System.Drawing.Point(100,180)
$Label4.Font                     = 'Microsoft Sans Serif,10'

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = "Divendres"
$Label5.AutoSize                 = $true
$Label5.width                    = 25
$Label5.height                   = 10
$Label5.location                 = New-Object System.Drawing.Point(100,220)
$Label5.Font                     = 'Microsoft Sans Serif,10'

$Label6                          = New-Object system.Windows.Forms.Label
$Label6.text                     = "Backup Local"
$Label6.AutoSize                 = $true
$Label6.width                    = 25
$Label6.height                   = 10
$Label6.location                 = New-Object System.Drawing.Point(225,25)
$Label6.Font                     = 'Microsoft Sans Serif,10'

$Label7                          = New-Object system.Windows.Forms.Label
$Label7.text                     = "Backup Servidor"
$Label7.AutoSize                 = $true
$Label7.width                    = 25
$Label7.height                   = 10
$Label7.location                 = New-Object System.Drawing.Point(345,25)
$Label7.Font                     = 'Microsoft Sans Serif,10'

$LabelDL_Local                   = New-Object system.Windows.Forms.Label
$LabelDL_Local.AutoSize          = $true
$LabelDL_Local.width             = 25
$LabelDL_Local.height            = 10
$LabelDL_Local.location          = New-Object System.Drawing.Point(230,60)
$LabelDL_Local.Font              = 'Microsoft Sans Serif,10'

$LabelDL_Server                  = New-Object system.Windows.Forms.Label
$LabelDL_Server.AutoSize         = $true
$LabelDL_Server.width            = 25
$LabelDL_Server.height           = 10
$LabelDL_Server.location         = New-Object System.Drawing.Point(358,60)
$LabelDL_Server.Font             = 'Microsoft Sans Serif,10'

$LabelDM_Local                   = New-Object system.Windows.Forms.Label
$LabelDM_Local.AutoSize          = $true
$LabelDM_Local.width             = 25
$LabelDM_Local.height            = 10
$LabelDM_Local.location          = New-Object System.Drawing.Point(230,100)
$LabelDM_Local.Font              = 'Microsoft Sans Serif,10'

$LabelDM_Server                  = New-Object system.Windows.Forms.Label
$LabelDM_Server.AutoSize         = $true
$LabelDM_Server.width            = 25
$LabelDM_Server.height           = 10
$LabelDM_Server.location         = New-Object System.Drawing.Point(358,100)
$LabelDM_Server.Font             = 'Microsoft Sans Serif,10'

$LabelDX_Local                   = New-Object system.Windows.Forms.Label
$LabelDX_Local.AutoSize          = $true
$LabelDX_Local.width             = 25
$LabelDX_Local.height            = 10
$LabelDX_Local.location          = New-Object System.Drawing.Point(230,140)
$LabelDX_Local.Font              = 'Microsoft Sans Serif,10'

$LabelDX_Server                  = New-Object system.Windows.Forms.Label
$LabelDX_Server.AutoSize         = $true
$LabelDX_Server.width            = 25
$LabelDX_Server.height           = 10
$LabelDX_Server.location         = New-Object System.Drawing.Point(358,140)
$LabelDX_Server.Font             = 'Microsoft Sans Serif,10'

$LabelDJ_Local                   = New-Object system.Windows.Forms.Label
$LabelDJ_Local.AutoSize          = $true
$LabelDJ_Local.width             = 25
$LabelDJ_Local.height            = 10
$LabelDJ_Local.location          = New-Object System.Drawing.Point(230,180)
$LabelDJ_Local.Font              = 'Microsoft Sans Serif,10'

$LabelDJ_Server                  = New-Object system.Windows.Forms.Label
$LabelDJ_Server.AutoSize         = $true
$LabelDJ_Server.width            = 25
$LabelDJ_Server.height           = 10
$LabelDJ_Server.location         = New-Object System.Drawing.Point(358,180)
$LabelDJ_Server.Font             = 'Microsoft Sans Serif,10'

$LabelDV_Local                   = New-Object system.Windows.Forms.Label
$LabelDV_Local.AutoSize          = $true
$LabelDV_Local.width             = 25
$LabelDV_Local.height            = 10
$LabelDV_Local.location          = New-Object System.Drawing.Point(230,220)
$LabelDV_Local.Font              = 'Microsoft Sans Serif,10'

$LabelDV_Server                  = New-Object system.Windows.Forms.Label
$LabelDV_Server.AutoSize         = $true
$LabelDV_Server.width            = 25
$LabelDV_Server.height           = 10
$LabelDV_Server.location         = New-Object System.Drawing.Point(358,220)
$LabelDV_Server.Font             = 'Microsoft Sans Serif,10'

$Button8                         = New-Object system.Windows.Forms.Button
$Button8.text                    = "Refrescar"
$Button8.width                   = 350
$Button8.height                  = 30
$Button8.location                = New-Object System.Drawing.Point(135,280)
$Button8.Font                    = 'Microsoft Sans Serif,10'
$Button8.Add_Click({Refresh})

#----------------------------------------------------------------------------------------------------------
#FUNCIONS
#----------------------------------------------------------------------------------------------------------

function dilluns{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti $backup_dilluns | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText($textRobo) 
    $desmapeig
    Refresh
}

function dimarts{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti $backup_dimarts | foreach {$TextBox1.AppendText($_ + "`r`n")}  
    $textbox1.AppendText($textRobo)
    $desmapeig
    Refresh
}

function dimecres{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti $backup_dimecres | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText($textRobo)
    $desmapeig
    Refresh
}

function dijous{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti $backup_dijous | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    $textbox1.AppendText($textRobo)
    $desmapeig
    Refresh
}

function divendres{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti $backup_divendres | foreach {$TextBox1.AppendText($_ + "`r`n")}  
    $textbox1.AppendText($textRobo)
    $desmapeig
    Refresh
}

function all{
    $mapeig
    robocopy.exe $ruta_origen $ruta_desti $backup_dilluns | foreach {$TextBox1.AppendText($_ + "`r`n")}  
    robocopy.exe $ruta_origen $ruta_desti $backup_dimarts | foreach {$TextBox1.AppendText($_ + "`r`n")}  
    robocopy.exe $ruta_origen $ruta_desti $backup_dimecres | foreach {$TextBox1.AppendText($_ + "`r`n")} 
    robocopy.exe $ruta_origen $ruta_desti $backup_dijous | foreach {$TextBox1.AppendText($_ + "`r`n")}  
    robocopy.exe $ruta_origen $ruta_desti $backup_divendres | foreach {$TextBox1.AppendText($_ + "`r`n")}
    $textbox1.AppendText($textRobo)
    $desmapeig
    Refresh
}

function Neteja{
    $textBox1.Clear()
}


function Refresh{
   
    $DataModDillunsLocal = Get-Item ("$ruta_desti\$backup_dilluns") 
    $DataModDimartsLocal = Get-Item ("$ruta_desti\$backup_dimarts") 
    $DataModDimecresLocal = Get-Item ("$ruta_desti\$backup_dimecres") 
    $DataModDijousLocal = Get-Item ("$ruta_desti\$backup_dijous") 
    $DataModDivendresLocal = Get-Item ("$ruta_desti\$backup_divendres") 

    $DataModDillunsServer = Get-item ("$ruta_origen\$backup_dilluns") 
    $DataModDimartsServer = Get-Item ("$ruta_origen\$backup_dimarts") 
    $DataModDimecresServer = Get-Item ("$ruta_origen\$backup_dimarts") 
    $DataModDijousServer = Get-Item ("$ruta_origen\$backup_dimarts") 
    $DataModDivendresServer = Get-Item ("$ruta_origen\$backup_dimarts")

    $LabelDL_Local.Text = $DataModDillunsLocal.LastWriteTime.ToShortDateString() 
    $LabelDM_Local.Text = $DataModDimartsLocal.LastWriteTime.ToShortDateString() 
    $LabelDX_Local.Text = $DataModDimecresLocal.LastWriteTime.ToShortDateString() 
    $LabelDJ_Local.Text = $DataModDijousLocal.LastWriteTime.ToShortDateString()
    $LabelDV_Local.Text = $DataModDivendresLocal.LastWriteTime.ToShortDateString()

    $LabelDL_Server.Text = $DataModDillunsServer.LastWriteTime.ToShortDateString()
    $LabelDM_Server.Text = $DataModDimartsServer.LastWriteTime.ToShortDateString() 
    $LabelDX_Server.Text = $DataModDimecresServer.LastWriteTime.ToShortDateString() 
    $LabelDJ_Server.Text = $DataModDijousServer.LastWriteTime.ToShortDateString() 
    $LabelDV_Server.Text = $DataModDivendresServer.LastWriteTime.ToShortDateString() 

   
    If ($DataModDillunsLocal.LastWriteTime.ToShortDateString() -ne $DataModDillunsServer.LastWriteTime.ToShortDateString()){ 
        $LabelDL_Local.ForeColor = "Red"
    } else {
        $LabelDL_Local.ForeColor = "Green"       
    }

    If ($DataModDimartsLocal.LastWriteTime.ToShortDateString() -ne $DataModDimartsServer.LastWriteTime.ToShortDateString() ){ 
        $LabelDM_Local.ForeColor = "Red"
    } else {
        $LabelDM_Local.ForeColor = "Green"
    }

    If ($DataModDimecresLocal.LastWriteTime.ToShortDateString() -ne $DataModDimecresLocal.LastWriteTime.ToShortDateString() ){ 
        $LabelDX_Local.ForeColor = "Red"
    } else {
        $LabelDX_Local.ForeColor = "Green"
    }

    If ($DataModDijousLocal.LastWriteTime.ToShortDateString() -ne $DataModDijousLocal.LastWriteTime.ToShortDateString() ){ 
        $LabelDJ_Local.ForeColor = "Red"
    } else {
        $LabelDJ_Local.ForeColor = "Green"
    }

    If ($DataModDivendresLocal.LastWriteTime.ToShortDateString() -ne $DataModDivendresLocal.LastWriteTime.ToShortDateString() ){ 
        $LabelDV_Local.ForeColor = "Red"
    } else {
        $LabelDV_Local.ForeColor = "Green"
    }

}

#----------------------------------------------------------------------------------------------------------
#PS1 CODE
#----------------------------------------------------------------------------------------------------------

#Omet errors (per si no existeix copia en local)
$ErrorActionPreference= "silentlyContinue"

#Variables usuari/pass
$User = "TSE\eferrer"
$Pwd = "Primera13"

#Variables d'origen i destí
$ruta_origen = "\\10.49.1.175\Client"
$ruta_desti = "C:\Backup"
$backup_dilluns = "scepinstall.exe"
$backup_dimarts = "scepinstall.exe"
$backup_dimecres = "scepinstall.exe"
$backup_dijous = "scepinstall.exe"
$backup_divendres = "scepinstall.exe"

#Mapeig destí amb validació / desmapeig
$mapeig = net use $ruta_origen /user:$User $Pwd
$desmapeig = net use $ruta_origen /d

#Creació de destí en cas de no existir
If(!(test-path $ruta_desti)){
    New-Item -ItemType Directory -Force -Path $ruta_desti | Out-Null
}

#Missatge final de Robocopy
$textRobo = "----------`r`n FINAL DE ROBOCOPY `r`n----------"

Refresh

#----------------------------------------------------------------------------------------------------------
#AFEGIR AL FORMULARI
#----------------------------------------------------------------------------------------------------------
$Form.Controls.Add($tabControl)
$TabControl.Controls.AddRange(@($Tab1,$Tab2)) 
$Tab1.Controls.AddRange(@($Button1,$Button2,$Button3,$Button4,$Button5,$TextBox1,$Button6,$Button7))
$Tab2.Controls.AddRange(@($Label1,$Label2,$Label3,$Label4,$Label5,$Label6,$Label7,$Button8,$LabelDL_Local,$LabelDL_Server,$LabelDM_Local,$LabelDM_Server,$LabelDX_Local,$LabelDX_Server,$LabelDJ_Local,$LabelDJ_Server,$LabelDV_Local,$LabelDV_Server))

#----------------------------------------------------------------------------------------------------------
#MOSTRAR FORMULARI
#----------------------------------------------------------------------------------------------------------
[void]$Form.ShowDialog()
