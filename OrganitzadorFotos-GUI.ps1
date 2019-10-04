Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#-------------------------------------------------------------------------------------------------------------
# FORMULARI
#-------------------------------------------------------------------------------------------------------------
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '600,420'
$Form.text                       = "Organitzador de Fotos"
$Form.TopMost                    = $false
$Form.MinimizeBox                = $true
$Form.MaximizeBox                = $false
$Form.FormBorderStyle            = "FixedDialog"
$Form.StartPosition              = "CenterScreen"
$Form.Icon                       = $null

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 375
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(85,35)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Cerca"
$Button1.width                   = 80
$Button1.height                  = 25
$Button1.location                = New-Object System.Drawing.Point(480,34)
$Button1.Font                    = 'Microsoft Sans Serif,10'
$Button1.Add_Click({$TextBox1.text = Get-Folderlocation})

$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $false
$TextBox2.width                  = 375
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(85,75)
$TextBox2.Font                   = 'Microsoft Sans Serif,10'

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Cerca"
$Button2.width                   = 80
$Button2.height                  = 25
$Button2.location                = New-Object System.Drawing.Point(480,74)
$Button2.Font                    = 'Microsoft Sans Serif,10'
$Button2.Add_Click({$TextBox2.text = Get-Folderlocation})

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Origen"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(34,36)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Destí"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(39,77)
$Label2.Font                     = 'Microsoft Sans Serif,10'

$TextBox3                        = New-Object system.Windows.Forms.TextBox
$TextBox3.multiline              = $true
$TextBox3.width                  = 530
$TextBox3.height                 = 228
$TextBox3.location               = New-Object System.Drawing.Point(34,131)
$TextBox3.Font                   = 'Microsoft Sans Serif,8'
$TextBox3.ReadOnly               = $true
$TextBox3.Scrollbars             = "Vertical" 

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "Endreça"
$Button3.width                   = 400
$Button3.height                  = 30
$Button3.location                = New-Object System.Drawing.Point(34,374)
$Button3.Font                    = 'Microsoft Sans Serif,10'
$Button3.Add_Click({principal})

$Button4                         = New-Object system.Windows.Forms.Button
$Button4.text                    = "Neteja"
$Button4.width                   = 120
$Button4.height                  = 30
$Button4.location                = New-Object System.Drawing.Point(445,374)
$Button4.Font                    = 'Microsoft Sans Serif,10'
$Button4.Add_Click({neteja})

$Form.controls.AddRange(@($TextBox1,$Button1,$TextBox2,$Button2,$Label1,$Label2,$TextBox3,$Button3,$Button4))

#-------------------------------------------------------------------------------------------------------------
# FUNCIONS
#-------------------------------------------------------------------------------------------------------------

function get-Folderlocation{
    $app = New-Object -ComObject Shell.Application
    $folder = $app.BrowseForFolder(0,"",0,0)
    if ($folder) { $selectedDirectory = $folder.Self.Path } else { $selectedDirectory = "" }
    return $selectedDirectory   
}

Function clear_variable{
    Clear-Variable -name Origen, Desti, DestiOther, foo, date, arYear, arMonth, strYear, strMonth, mes, TargetPath, Files, File, titol, color, log, videos, MP4 -ErrorAction SilentlyContinue   
}

Function principal{
    $origen = $TextBox1.text
    $desti = $TextBox2.text
    $DestiOther = $Desti + "\Altres"
    $DestiOtherVideo = $DestiOther + "\Video"
    $DestiJPGissue = $DestiOther + "\JPG"

    If ($TextBox1.textlength -eq 0 -or $TextBox2.textlength -eq 0){
        [System.Windows.MessageBox]::Show('Algun dels camps està buit','ERROR','OK','Error')
    }else{
        If ((test-path $origen) -and (test-path $desti)){ 
            $Dir = get-childitem $origen -recurse | Where-Object{!($_.PSIsContainer)}
            $List = $Dir | where {$_.extension -ne ".jpg" -and $_.extension -ne ".mp4" -and $_.extension -ne ".avi"} 
            $MP4 = $Dir | where {$_.extension -eq ".mp4" -or $_.extension -eq ".avi"}
            $TextBox3.AppendText("ARXIUS NO .JPG`r`n")
            $TextBox3.AppendText("----------------------------`r`n")
            Foreach ($altres in $List){
                If (Test-Path $DestiOther){
                    Copy-Item -Path $altres.FullName -Destination $DestiOther
                }Else{
                    New-Item $DestiOther -Type Directory | Out-Null
                    Copy-Item -Path $altres.FullName -Destination $DestiOther
                }
                $TextBox3.AppendText("$DestiOther\$altres`r`n")
                $Global:ContadorAltres = $Global:ContadorAltres + 1
            }
            ForEach ($videos in $MP4){
                If (Test-Path $DestiOtherVideo){
                    Copy-Item -Path $videos.FullName -Destination $DestiOtherVideo
                }Else{
                    New-Item $DestiOtherVideo -Type Directory | Out-Null
                    Copy-Item -Path $videos.FullName -Destination $DestiOtherVideo
                }
                $TextBox3.AppendText("$DestiOtherVideo\$videos`r`n")
                $Global:ContadorAltres = $Global:ContadorAltres + 1
            }
          
            $Files = Get-ChildItem -path $origen -recurse -filter *.jpg
            $TextBox3.AppendText("`r`nARXIUS FORMAT .JPG`r`n")
            $TextBox3.AppendText("--------------------------------------`r`n")
            Foreach ($File in $Files){
                $iserror = $false
                $foo = New-Object -TypeName system.drawing.bitmap -ArgumentList $file.fullname
                try {[void]$foo.GetPropertyItem(36867).value[0..9]}
                catch {$iserror = $true}
                If ($iserror -eq $true){ 
                    New-Item $DestiJPGissue -Type Directory | Out-Null
                    Copy-Item -Path $File.FullName -Destination $DestiJPGissue 
                    $TextBox3.AppendText("$DestiJPGissue\$file`r`n")
                    $Global:ContadorAltres = $Global:ContadorAltres + 1
                }Else{
                    $date = $foo.GetPropertyItem(36867).value[0..9]
                    $arYear = [Char]$date[0],[Char]$date[1],[Char]$date[2],[Char]$date[3]
                    $arMonth = [Char]$date[5],[Char]$date[6]
                    $strYear = [String]::Join("",$arYear)
                    $strMonth = [String]::Join("",$arMonth) 
                    if ($strMonth -eq "01"){ $mes = "01 Gener" }
                    if ($strMonth -eq "02"){ $mes = "02 Febrer" }
                    if ($strMonth -eq "03"){ $mes = "03 Març" }
                    if ($strMonth -eq "04"){ $mes = "04 Abril" }
                    if ($strMonth -eq "05"){ $mes = "05 Maig" }
                    if ($strMonth -eq "06"){ $mes = "06 Juny" }
                    if ($strMonth -eq "07"){ $mes = "07 Juliol" }
                    if ($strMonth -eq "08"){ $mes = "08 Agost" }
                    if ($strMonth -eq "09"){ $mes = "09 Setembre" }
                    if ($strMonth -eq "10"){ $mes = "10 Octubre" }
                    if ($strMonth -eq "11"){ $mes = "11 Novembre" }
                    if ($strMonth -eq "12"){ $mes = "12 Desembre" }
                    $TargetPath = $Desti + "\" + $strYear + "\" + $mes
                    $TextBox3.AppendText("$TargetPath\$file`r`n")
                    If (Test-Path $TargetPath){
                        Copy-Item -Path $file.FullName -Destination $TargetPath
                    }Else{
                        New-Item $TargetPath -Type Directory | Out-Null
                        Copy-Item -Path $file.FullName -Destination $TargetPath
                    }
                    $Global:Contador = $Global:Contador + 1
            
                }
            }
            $TextBox3.AppendText("`r`n")
            $TextBox3.AppendText("TOTAL ARXIUS`r`n")
            $TextBox3.AppendText("--------------------------`r`n")
            $TextBox3.AppendText("Arxius JPG Correctes: $Global:Contador`r`n")
            $TextBox3.AppendText("Carpeta Altres: $Global:ContadorAltres`r`n")
            $total = $Global:Contador + $Global:ContadorAltres
            $TextBox3.AppendText("Total: $total`n")   
        }
    }           
}

Function neteja{
    $TextBox3.Clear()
}

#-------------------------------------------------------------------------------------------------------------
# CODI
#-------------------------------------------------------------------------------------------------------------
$Global:Contador = 0
$Global:ContadorAltres = 0

clear_variable

#-------------------------------------------------------------------------------------------------------------
# MOSTRAR FORMULARI
#-------------------------------------------------------------------------------------------------------------
[void]$Form.ShowDialog()
