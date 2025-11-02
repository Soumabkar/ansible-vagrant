# Activer WinRM
Enable-PSRemoting -Force

# Configurer WinRM pour écouter sur HTTP (port 5985)
Set-Item WSMan:\localhost\Listener\Listener*\Transport -Value HTTP

# Autoriser les connexions non chiffrées (pour les tests uniquement)
Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $true

# Autoriser l'authentification Basic
Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true

# Redémarrer le service WinRM
Restart-Service WinRM

# Vérifiez que WinRM écoute sur le port 5985 
Get-ChildItem WSMan:\localhost\Listener

# Vérifiez que le pare-feu Windows autorise les connexions entrantes sur le port 5985
New-NetFirewallRule -DisplayName "WinRM HTTP" -Direction Inbound -LocalPort 5985 -Protocol TCP -Action Allow

