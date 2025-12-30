# Verify RDP port 3389
Write-Host "Tailscale IP: $env:TAILSCALE_IP"
$testResult = Test-NetConnection -ComputerName $env:TAILSCALE_IP -Port 3389
if (-not $testResult.TcpTestSucceeded) { throw "TCP connection to 3389 failed" }
Write-Host "TCP connectivity successful!"
