#  静默安装 Tailscale 1.82.0 稳定版(64位MSI安装包) 无弹窗、无交互、自动清理安装文件
# 定义Tailscale固定版本的官方下载地址 (1.82.0是稳定版，兼容性极强，适配所有Windows Server版本)
$tsUrl = "https://pkgs.tailscale.com/stable/tailscale-setup-1.82.0-amd64.msi"

# 定义安装包的本地保存路径：Windows系统临时目录 + tailscale.msi
# $env:TEMP 是系统内置环境变量，指向 C:\Users\runneradmin\AppData\Local\Temp ，读写权限充足，不会报权限错误
$installerPath = "$env:TEMP\tailscale.msi"

# 从官方地址下载Tailscale安装包到临时目录，无进度条静默下载
Invoke-WebRequest -Uri $tsUrl -OutFile $installerPath

# 核心：调用Windows系统的MSI安装程序，静默安装Tailscale，无任何弹窗/提示/交互
# Start-Process 启动外部程序 | -Wait 等待安装完成后再执行后续命令 | -ArgumentList 传递安装参数
Start-Process msiexec.exe -ArgumentList "/i","`"$installerPath`"","/quiet","/norestart" -Wait

# 安装完成后，强制删除临时目录中的安装包，释放磁盘空间，无残留垃圾文件
Remove-Item $installerPath -Force