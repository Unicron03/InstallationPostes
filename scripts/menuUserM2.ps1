Clear-Host
do {
    Write-Host "---Menu Utilisateur---------------------------"
    Write-Host "1: Afficher le nom d'utilisateur"
    Write-Host "2: Afficher le nom de la machine"
    Write-Host "3: Afficher le DNS cache"
    Write-Host "4: Vider le DNS cache"
    Write-Host "0: Sortie"
    $choix = Read-Host "---Choix"
    Clear-Host
    switch ($choix) {
        '0' {
            Write-Host "Au revoir !"
            Write-Host ""
            exit
        }
        '1' {
            Write-Host "Votre nom d'utilisateur est : $env:USERNAME"
        }
        '2' {
            Write-Host "Le nom de votre machine est : $env:COMPUTERNAME"
        }
        '3' {
            ipconfig /displaydns
        }
        '4' {
            ipconfig /flushdns
            Write-Host "Votre DNS cache a ete vide avec succes"
        }
        default {
            Write-Host "Choix non propose"
        }
    }
    pause
} while ($true)