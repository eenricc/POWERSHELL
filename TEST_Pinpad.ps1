[System.Windows.Forms.Application]::EnableVisualStyles()
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

#----------------------------------------------------------------------------------------------------------
# VARIABLES
#----------------------------------------------------------------------------------------------------------
$global:enric = $null
#Random per colocar de forma aleatoria els botons a la pantalla
$random = Get-Random -InputObject '023,033','129,033','234,033','024,116','129,116','238,116','024,195','129,195','235,194','023,271','129,271','235,271' -count 12

#----------------------------------------------------------------------------------------------------------
# FORMULARI PINPAD
#----------------------------------------------------------------------------------------------------------
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '360,380'
$Form.text                       = "PINPAD"
$Form.TopMost                    = $false
$Form.MinimizeBox                = $false
$Form.MaximizeBox                = $false
$Form.FormBorderStyle            = 'FixedDialog'
$Form.StartPosition              = "CenterScreen"
$Form.Icon                       = $null

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "1"
$Button1.width                   = 96
$Button1.height                  = 68
$Button1.location                = New-Object System.Drawing.Point($random[0].Substring(0,3),$random[0].Substring(4,3))
$Button1.Font                    = 'Calibri,11'
$Button1.Add_Click({numero(1)})

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "2"
$Button2.width                   = 96
$Button2.height                  = 68
$Button2.location                = New-Object System.Drawing.Point($random[1].Substring(0,3),$random[1].Substring(4,3))
$Button2.Font                    = 'Calibri,11'
$Button2.Add_Click({numero(2)})

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "3"
$Button3.width                   = 96
$Button3.height                  = 68
$Button3.location                = New-Object System.Drawing.Point($random[2].Substring(0,3),$random[2].Substring(4,3))
$Button3.Font                    = 'Calibri,11'
$Button3.Add_Click({numero(3)})

$Button4                         = New-Object system.Windows.Forms.Button
$Button4.text                    = "4"
$Button4.width                   = 96
$Button4.height                  = 68
$Button4.location                = New-Object System.Drawing.Point($random[3].Substring(0,3),$random[3].Substring(4,3))
$Button4.Font                    = 'Calibri,11'
$Button4.Add_Click({numero(4)})

$Button5                         = New-Object system.Windows.Forms.Button
$Button5.text                    = "5"
$Button5.width                   = 96
$Button5.height                  = 68
$Button5.location                = New-Object System.Drawing.Point($random[4].Substring(0,3),$random[4].Substring(4,3))
$Button5.Font                    = 'Calibri,11'
$Button5.Add_Click({numero(5)})

$Button6                         = New-Object system.Windows.Forms.Button
$Button6.text                    = "6"
$Button6.width                   = 96
$Button6.height                  = 68
$Button6.location                = New-Object System.Drawing.Point($random[5].Substring(0,3),$random[5].Substring(4,3))
$Button6.Font                    = 'Calibri,11'
$Button6.Add_Click({numero(6)})

$Button7                         = New-Object system.Windows.Forms.Button
$Button7.text                    = "7"
$Button7.width                   = 96
$Button7.height                  = 68
$Button7.location                = New-Object System.Drawing.Point($random[6].Substring(0,3),$random[6].Substring(4,3))
$Button7.Font                    = 'Calibri,11'
$Button7.Add_Click({numero(7)})

$Button8                         = New-Object system.Windows.Forms.Button
$Button8.text                    = "8"
$Button8.width                   = 96
$Button8.height                  = 68
$Button8.location                = New-Object System.Drawing.Point($random[7].Substring(0,3),$random[7].Substring(4,3))
$Button8.Font                    = 'Calibri,11'
$Button8.Add_Click({numero(8)})

$Button9                         = New-Object system.Windows.Forms.Button
$Button9.text                    = "9"
$Button9.width                   = 96
$Button9.height                  = 68
$Button9.location                = New-Object System.Drawing.Point($random[8].Substring(0,3),$random[8].Substring(4,3))
$Button9.Font                    = 'Calibri,11'
$Button9.Add_Click({numero(9)})

$Button10                        = New-Object system.Windows.Forms.Button
$Button10.text                   = "*"
$Button10.width                  = 96
$Button10.height                 = 68
$Button10.location               = New-Object System.Drawing.Point($random[9].Substring(0,3),$random[9].Substring(4,3))
$Button10.Font                   = 'Calibri,11'
$Button10.add_click({clean})

$Button11                        = New-Object system.Windows.Forms.Button
$Button11.text                   = "0"
$Button11.width                  = 96
$Button11.height                 = 68
$Button11.location               = New-Object System.Drawing.Point($random[10].Substring(0,3),$random[10].Substring(4,3))
$Button11.Font                   = 'Calibri,11'
$Button11.Add_Click({numero(0)})

$Button12                        = New-Object system.Windows.Forms.Button
$Button12.text                   = "#"
$Button12.width                  = 96
$Button12.height                 = 68
$Button12.location               = New-Object System.Drawing.Point($random[11].Substring(0,3),$random[11].Substring(4,3))
$Button12.Font                   = 'Calibri,11'
$Button12.Add_Click({enter})


$Form.controls.AddRange(@($Button1,$Button2,$Button3,$Button4,$Button5,$Button6,$Button7,$Button8,$Button9,$Button10,$Button11,$Button12))

#----------------------------------------------------------------------------------------------------------
# FUNCIONS
#----------------------------------------------------------------------------------------------------------

#Funcio per esborrar valor de la variable
function clean {$global:enric = $null}

#Valor dels numeros del PinPad
function numero($numero) { $Global:enric = $Global:enric + "$numero"}

# Funcio deshabilitada. Serveix per mostrar valor actual de la variable
#function mostra {[System.Windows.MessageBox]::Show($global:enric)}

#Confirmació PIN
function enter {
    if ($global:enric -eq "260218"){
        [System.Windows.MessageBox]::Show('SUCCESS','PINPAD','ok','information')
        $global:enric = $null
        SegonFormulari
    }else{
        [System.Windows.MessageBox]::Show('PINPAD ERROR','PINPAD','ok','error')
    }
}

#----------------------------------------------------------------------------------------------------------
# SEGON FORMULARI
#----------------------------------------------------------------------------------------------------------
function SegonFormulari{

#Amaga PINPAD
$form.Hide()

$Form2                            = New-Object system.Windows.Forms.Form
$Form2.ClientSize                 = '360,380'
$Form2.text                       = "APLICACIO"
$Form2.TopMost                    = $false
$Form2.MinimizeBox                = $false
$Form2.MaximizeBox                = $false
$Form2.FormBorderStyle            = 'FixedDialog'
$Form2.StartPosition              = "CenterScreen"
$Form2.Icon                       = $null

#----------------------------------------------------------------------------------------------------------
# MOSTRA FORMULARI 2
#----------------------------------------------------------------------------------------------------------
[void]$Form2.ShowDialog()

}

#----------------------------------------------------------------------------------------------------------
# MOSTRA FORMULARI 1
#----------------------------------------------------------------------------------------------------------
[void]$Form.ShowDialog()
