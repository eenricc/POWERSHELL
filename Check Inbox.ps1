#BUCLE
While ($True){

    $outlook = New-Object -ComObject Outlook.Application
    $session = $outlook.Session
    $session.Logon()

    #BUSTIA D'ENTRADA
    $total = 0
    $inbox = $session.GetDefaultFolder(6)
    $mails = $inbox.items
    $Unread = $mails | where {$_.UnRead -eq "$True"} | Select-Object -Property ReceivedTime, Subject, SenderName

    #CARPETA COSENTINO
    $totalCOS = 0
    $CosentinoFolder = $inbox.Folders | where-object { $_.name -eq "COS IT SUPPORT" }
    $COS_Mails = $CosentinoFolder.items
    $UnreadCos = $COS_Mails | where {$_.UnRead -eq "$True"} | Select-Object -Property ReceivedTime, Subject, SenderName

    #RECOMPTE INBOX
    foreach ($new in $unread){
        #Write-Host "Assumpte: " $new.Subject 
        #Write-Host "Data: " $new.ReceivedTime 
        #Write-Host "De: " $new.SenderName
        #Write-Host "======================="
        $total = $total + 1
    }

    #RECOMPTE COSENTINO FOLDER
    foreach ($newCOS in $unreadCOS){
        #Write-Host "Assumpte: " $newCOS.Subject 
        #Write-Host "Data: " $newCOS.ReceivedTime 
        #Write-Host "De: " $newCOS.SenderName
        #Write-Host "======================="
        $totalCOS = $totalCOS + 1
    }

    clear
    Write-Host "Total Entrada sense llegir: " $total
    Write-Host "Total sense llegir Cosentino: " $totalCOS 
    Start-Sleep 2

}
