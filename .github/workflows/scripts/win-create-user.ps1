# 加载系统安全程序集（原脚本保留，兼容系统环境，无实际执行影响）
Add-Type -AssemblyName System.Security

# 定义密码生成的字符集，按类型分类，ASCII码精准取值，保证字符有效
$charSet = @{
  Upper   = [char[]](65..90)    # 大写英文字母 A-Z 的ASCII码区间
  Lower   = [char[]](97..122)   # 小写英文字母 a-z 的ASCII码区间
  Number  = [char[]](48..57)    # 数字 0-9 的ASCII码区间
  Special = ([char[]](33..47) + [char[]](58..64) + [char[]](91..96) + [char[]](123..126)) # 所有合法特殊符号集合
}

# 初始化空数组，用于存放随机生成的密码字符
$rawPassword = @()

# 核心密码生成规则【原逻辑完全保留】：固定16位密码，四类字符各强制取4位，杜绝弱密码
$rawPassword += $charSet.Upper | Get-Random -Count 4    # 随机取4个大写字母
$rawPassword += $charSet.Lower | Get-Random -Count 4    # 随机取4个小写字母
$rawPassword += $charSet.Number | Get-Random -Count 4   # 随机取4个数字
$rawPassword += $charSet.Special | Get-Random -Count 4  # 随机取4个特殊符号

# 将抽取的16个字符随机打乱排序，然后拼接成最终的密码字符串
$password = -join ($rawPassword | Sort-Object { Get-Random })

# 将明文密码转换为Windows系统的安全加密格式，创建用户必须用该格式
$securePass = ConvertTo-SecureString $password -AsPlainText -Force

# ========== 新增关键容错逻辑 ==========
# 如果系统中已存在 moti 用户，则先强制删除，避免创建用户时报「用户已存在」错误
if (Get-LocalUser -Name "moti" -ErrorAction SilentlyContinue) {
    Remove-LocalUser -Name "moti" -Force
}

# 创建本地系统用户，用户名修改为【moti】，密码为加密后的随机密码，账号永久不过期
New-LocalUser -Name "moti" -Password $securePass -AccountNeverExpires

# 将 moti 用户添加到【管理员组】，获取系统最高操作权限（必加，否则部分功能受限）
Add-LocalGroupMember -Group "Administrators" -Member "moti"

# 将 moti 用户添加到【远程桌面用户组】，授予远程RDP登录权限（Windows强制要求，无此权限无法远程登录）
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "moti"

# 将 用户名+密码 写入GitHub环境变量，供yaml文件的最后一步打印到日志中，方便用户查看连接凭证
echo "RDP_CREDS=User: moti | Password: $password" >> $env:GITHUB_ENV

# 校验用户是否创建成功，如果创建失败则抛出错误，终止整个GitHub Actions流程，防止无意义执行
if (-not (Get-LocalUser -Name "moti")) { throw "User creation failed: moti 用户创建失败" }