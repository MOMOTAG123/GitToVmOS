# 启用RDP远程桌面核心配置 + 防火墙放行3389端口规则
# 【核心注册表修改1】启用远程桌面连接功能：禁用系统层面的RDP连接拒绝策略 (关键必开)
# fDenyTSConnections=0 → 允许远程桌面连接；=1 → 禁止远程桌面连接
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0 -Force

# 【核心注册表修改2】关闭网络级别身份验证(NLA)
# UserAuthentication=0 → 关闭NLA验证，兼容所有远程桌面客户端、无登录限制 (新手友好，不会卡验证)
# UserAuthentication=1 → 开启NLA，安全性更高但部分客户端连接失败
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "UserAuthentication" -Value 0 -Force

# 【核心注册表修改3】设置RDP安全层为兼容模式
# SecurityLayer=0 → RDP兼容安全层，适配所有Windows Server版本+所有远程桌面工具，杜绝连接报错
# 解决Windows Server 2016常见的「安全层不匹配」导致的RDP连接失败问题
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "SecurityLayer" -Value 0 -Force

# 先删除系统中已存在的同名防火墙规则（避免重复创建导致规则冲突、端口放行失效）
netsh advfirewall firewall delete rule name="RDP-Tailscale"

# 【防火墙核心规则】新增入站规则，放行RDP默认的3389 TCP端口
# name=规则名称  dir=in=入站请求  action=allow=允许  protocol=TCP=指定RDP协议  localport=3389=RDP固定端口
netsh advfirewall firewall add rule name="RDP-Tailscale" dir=in action=allow protocol=TCP localport=3389

# 强制重启Windows终端服务（TermService），让上述所有注册表+防火墙配置立即生效，无需重启服务器
# -Force 强制重启，忽略服务依赖，立即生效，是最快捷的配置生效方式
Restart-Service -Name TermService -Force