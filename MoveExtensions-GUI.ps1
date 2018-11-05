﻿Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#----------------------------------------------------------------------------------------------------------
#FORMULARI
#---------------------------------------------------------------------------------------------------------- 

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '325,390'
$Form.text                       = "COPIA EXTENSIONS"
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
$Label1.location                 = New-Object System.Drawing.Point(26,31)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Destí on copia:"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(26,89)
$Label2.Font                     = 'Microsoft Sans Serif,10'

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Extensió:"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(26,149)
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

#------------- BOTONS BROWSE -------------
$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Cerca"
$Button1.width                   = 60
$Button1.height                  = 18
$Button1.location                = New-Object System.Drawing.Point(236,51)
$Button1.Font                    = 'Microsoft Sans Serif,10'
$Button1.Add_Click({$TextBox1.text = Get-Folderlocation})

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Cerca"
$Button2.width                   = 60
$Button2.height                  = 18
$Button2.location                = New-Object System.Drawing.Point(236,109)
$Button2.Font                    = 'Microsoft Sans Serif,10'
$Button2.Add_Click({$TextBox2.text = Get-Folderlocation})

#------------- BOTO COPIA -------------
$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "COPIA"
$Button3.width                   = 220
$Button3.height                  = 30
$Button3.location                = New-Object System.Drawing.Point(26,346)
$Button3.Font                    = 'Microsoft Sans Serif,10'
$Button3.Add_Click({copiaExtensions})

#------------- BOTO CLEAR -------------
$Button4                         = New-Object system.Windows.Forms.Button
$Button4.text                    = "Clear"
$Button4.width                   = 50
$Button4.height                  = 30
$Button4.location                = New-Object System.Drawing.Point(250,346)
$Button4.Font                    = 'Microsoft Sans Serif,10'
$Button4.Add_Click({Neteja})



$Form.controls.AddRange(@($Label1,$TextBox1,$Button1,$Label2,$TextBox2,$Button2,$Label3,$TextBox3,$TextBox4,$Button3,$Button4))

#----------------------------------------------------------------------------------------------------------
#PS1 CODE
#----------------------------------------------------------------------------------------------------------

function get-Folderlocation([string]$Message, [string]$InitialDirectory, [switch]$NoNewFolderButton)
{
    $browseForFolderOptions = 0
    if ($NoNewFolderButton) { $browseForFolderOptions += 512 }

    $app = New-Object -ComObject Shell.Application
    $folder = $app.BrowseForFolder(0, $Message, $browseForFolderOptions, $InitialDirectory)
    if ($folder) { $selectedDirectory = $folder.Self.Path } else { $selectedDirectory = '' }
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($app) > $null
    return $selectedDirectory
}

function copiaExtensions{
    $origen = $TextBox1.text
    $desti = $TextBox2.text
    $extensio = "*." + $TextBox3.text

    If ($TextBox1.textlength -eq 0 -or $TextBox2.textlength -eq 0 -or $TextBox3.textlength -eq 0){
        [System.Windows.MessageBox]::Show('Algun dels camps està buit','ERROR','OK','Error')
    }else{
        If ((test-path $origen) -and (test-path $desti)){
            $Dir = get-childitem $origen -recurse -Filter $extensio
            Foreach ($arxiu in $Dir){
                Move-Item -Path $arxiu.FullName -Destination $Desti -ErrorAction SilentlyContinue
                $TextBox4.AppendText($arxiu.fullname + "`r`n")
            }
        $TextBox4.AppendText("`r`n" + "----------" + "FINALITZAT" + "----------" + "`r`n")
        }else{
            [System.Windows.MessageBox]::Show('Origen o destí no existeix','ERROR','OK','Error')
        }
    }
}

function Neteja{
    $textBox4.Clear()
}


#----------------------------------------------------------------------------------------------------------
#MOSTRAR FORMULARI
#----------------------------------------------------------------------------------------------------------
[void]$Form.ShowDialog()