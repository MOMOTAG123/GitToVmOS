# 校验 RDP核心端口 3389 TCP连通性 (Tailscale组网链路)
# 在日志中打印当前获取到的Tailscale内网IP，方便排查问题时核对地址是否正确
Write-Host "Tailscale IP: $env:TAILSCALE_IP"

# 核心命令：测试指定IP的指定端口TCP连通性 → 检测Tailscale IP的3389 RDP端口是否能正常访问
# Test-NetConnection：PowerShell原生端口连通性测试命令，替代老旧的telnet，Windows Server 2016内置支持，无需额外安装
# -ComputerName：要测试的目标IP地址（这里用Tailscale内网IP）
# -Port：要测试的目标端口（固定3389=RDP远程桌面端口）
$testResult = Test-NetConnection -ComputerName $env:TAILSCALE_IP -Port 3389

# 核心判断逻辑：如果TCP端口测试未成功（3389不通），则抛出错误并终止整个GitHub Actions流程
# 防止端口不通的情况下，继续执行后续保活步骤，无意义占用服务器资源
if (-not $testResult.TcpTestSucceeded) { throw "TCP connection to 3389 failed" }

# 端口连通性校验通过，打印成功日志，流程继续执行
Write-Host "TCP connectivity successful!"