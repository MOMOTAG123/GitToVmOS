# Bring up Tailscale and get IP

& "$env:ProgramFiles\Tailscale\tailscale.exe" up --authkey=$env:TAILSCALE_AUTH_KEY --hostname=gh-runner-$env:GITHUB_RUN_ID


$tsIP = $null
$retries = 0
while (-not $tsIP -and $retries -lt 10) {
  $tsIP = & "$env:ProgramFiles\Tailscale\tailscale.exe" ip -4
  Start-Sleep -Seconds 5
  $retries++
}
if (-not $tsIP) { throw "Tailscale IP not assigned." }
echo "TAILSCALE_IP=$tsIP" >> $env:GITHUB_ENV
