# 启动Tailscale组网服务 + 获取IPv4地址并写入环境变量
# 执行Tailscale核心登录命令，完成组网授权+注册节点
& "$env:ProgramFiles\Tailscale\tailscale.exe" up `
--authkey=$env:TAILSCALE_AUTH_KEY `
--hostname=gh-runner-$env:GITHUB_RUN_ID

# 初始化变量：用于存储Tailscale分配的IPv4地址，初始值为空
$tsIP = $null
# 初始化重试计数器：防止网络延迟导致IP获取失败，设置重试机制
$retries = 0

# 循环获取Tailscale IP，核心容错逻辑：地址为空 且 重试次数小于10次时，继续重试
# 原因：Tailscale组网成功后，IP分配会有1-3秒延迟，立即获取大概率为空，必须加重试
while (-not $tsIP -and $retries -lt 10) {
  # 执行命令获取Tailscale的IPv4地址（只取纯IP，过滤无关信息）
  $tsIP = & "$env:ProgramFiles\Tailscale\tailscale.exe" ip -4
  # 每次重试间隔5秒，给Tailscale足够的IP分配时间
  Start-Sleep -Seconds 5
  # 重试计数器+1
  $retries++
}

# 最终校验：如果循环结束后仍未获取到IP，抛出错误终止整个流程，避免后续无意义执行
if (-not $tsIP) { throw "Tailscale IP not assigned." }

# 把获取到的Tailscale内网IP写入GitHub环境变量，供yaml最后一步打印到日志中
# 这个变量名 $env:TAILSCALE_IP 与yaml中的打印字段完全对应，无需修改
echo "TAILSCALE_IP=$tsIP" >> $env:GITHUB_ENV