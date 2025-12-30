# Install Tailscale MSI
$tsUrl = "https://pkgs.tailscale.com/stable/tailscale-setup-1.82.0-amd64.msi"
$installerPath = "$env:TEMP\tailscale.msi"
Invoke-WebRequest -Uri $tsUrl -OutFile $installerPath
Start-Process msiexec.exe -ArgumentList "/i","`"$installerPath`"","/quiet","/norestart" -Wait
Remove-Item $installerPath -Force
