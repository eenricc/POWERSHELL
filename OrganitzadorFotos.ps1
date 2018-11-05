[void][reflection.assembly]::LoadWithPartialName("System.Drawing")

##### CARPETA AMB FOTOS A ENDREÇAR #####
$Carpeta = "D:\Sogeking\ENRIC\Xiaomi\Backup Mi5\Fotos\"

##### CARPETA DESTÍ ON ES COPIARAN FOTOS #####
$Desti = "D:\Sogeking\ENRIC\Xiaomi\Backup Mi5\Camera\"

$DestiOther = $Desti + "Altres"
$DestiOtherVideo = $DestiOther + "\Video"
$DestiJPGissue = $DestiOther + "\JPG"
$Global:Contador = 0
$Global:ContadorAltres = 0


##### FUNCIONS #####

Function clear_variable {
    Clear-Variable -name Carpeta, Desti, DestiOther, foo, date, arYear, arMonth, strYear, strMonth, mes, TargetPath, Files, File, titol, color, log, videos, MP4 -ErrorAction SilentlyContinue   
}

Function mostra_titol($titol,$color){
    Write-Host `r
    Write-Host $titol -ForegroundColor $color
    Write-Host "---------------------"
}

Function mostra_info($log,$color){
    Write-Host $log -ForegroundColor $color
}

Function check_origen {
    mostra_titol "CHECK CARPETA ORIGEN" "white" 
    If ((Test-Path $Carpeta) -eq $false){ 
        mostra_info "FAILED" "red"
        exit
    }Else{
        mostra_info "CHECK OK" "green"
    }
}

Function others {
    $Dir = get-childitem $Carpeta -recurse | Where-Object{!($_.PSIsContainer)}
    $List = $Dir | where {$_.extension -ne ".jpg" -and $_.extension -ne ".mp4" -and $_.extension -ne ".avi"} 
    $MP4 = $Dir | where {$_.extension -eq ".mp4" -or $_.extension -eq ".avi"}
    mostra_titol "ARXIUS NO .JPG" "white"
    Foreach ($altres in $List){
        If (Test-Path $DestiOther){
            Copy-Item -Path $altres.FullName -Destination $DestiOther
        }Else{
            $null = New-Item $DestiOther -Type Directory
            Copy-Item -Path $altres.FullName -Destination $DestiOther
        }
    mostra_info "$DestiOther\$altres" "magenta"
    $Global:ContadorAltres = $Global:ContadorAltres + 1
    }
    ForEach ($videos in $MP4){
        If (Test-Path $DestiOtherVideo){
            Copy-Item -Path $videos.FullName -Destination $DestiOtherVideo
        }Else{
            $null = New-Item $DestiOtherVideo -Type Directory
            Copy-Item -Path $videos.FullName -Destination $DestiOtherVideo
        }
    mostra_info "$DestiOtherVideo\$videos" "magenta"
    $Global:ContadorAltres = $Global:ContadorAltres + 1
    }
}

Function copy_jpg {
    $Files = Get-ChildItem -path $Carpeta -recurse -filter *.jpg
    mostra_titol "ARXIUS FORMAT JPG" "white"
    Foreach ($File in $Files){
        $iserror = $false
        $foo = New-Object -TypeName system.drawing.bitmap -ArgumentList $file.fullname
        try {[void]$foo.GetPropertyItem(36867).value[0..9]}
        catch {$iserror = $true}
        If ($iserror -eq $true){ 
            $null = New-Item $DestiJPGissue -Type Directory
            Copy-Item -Path $File.FullName -Destination $DestiJPGissue 
            mostra_info "$DestiJPGissue\$file" "magenta"
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
            $TargetPath = $Desti + $strYear + "\" + $mes
            mostra_info "$TargetPath\$file" "gray"
            If (Test-Path $TargetPath){
                Copy-Item -Path $file.FullName -Destination $TargetPath
            }Else{
                $null = New-Item $TargetPath -Type Directory
                Copy-Item -Path $file.FullName -Destination $TargetPath
            }
            $Global:Contador = $Global:Contador + 1
        }
    }
}

Function total_arxius{
    Write-Host `r
    Write-Host "TOTAL ARXIUS" -ForegroundColor white
    Write-Host "---------------------"
    Write-Host "Arxius JPG Correctes: " $Global:Contador -ForegroundColor "gray"
    Write-host "Carpeta Altres: " $Global:ContadorAltres -ForegroundColor "magenta"
    $total = $Global:Contador + $Global:ContadorAltres
    Write-host "Total: " $total -ForegroundColor "green"
}


##### EXECUCIÓ #####

clear_variable
check_origen
others
copy_jpg
total_arxius