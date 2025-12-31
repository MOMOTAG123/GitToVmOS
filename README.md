<h1 align="center">Git To VmsOS<br />
<div align="center">
<img src="https://github.com/dockur/windows/raw/master/.github/logo.png" title="Logo" style="max-width:100%;" width="128" />
<img src="https://github.com/dockur/macos/raw/master/.github/logo.png" title="Logo" style="max-width:100%;" width="128" />
<img src="https://raw.github.com/github/explore/eb40fa94e4b686db568094600bb30065acce30c3/topics/linux/linux.png?size=48" title="Logo" style="max-width:100%;" width="128" />
<img src="https://pve.proxmox.com/favicon.ico" title="Logo" style="max-width:100%;" width="128" />
</div>

# 该项目基于GitHub Codespaces/GitHub Actions 余额使用
> [!TIP]
> 使用的是你Codespaces/GitHub Actions 余额，每个月都有免费时长，也可进行购买
> 到一定时间/关闭vscode会自动关闭，重新输入指令启动就行了，不会丢失数据

# 在github跑windows/linux/虚拟机!!!

1. 1思路就是通过 Github Codespaces功能创建一个 blank template 的 codespace，它是一个 Debian或Ubuntu 虚拟机，在这个虚拟机中可以执行 docker-compose -f 配置文件 up 创建一个 Windows/linux 的容器，可以通过端口转发的链接（设置成 public）来访问。
2. 2思路为基于GitHub Actions的工作模式，在GitHub Actions里的容器跑系统，通过本项目网页一键拉取。

3. 一键启动默认是windows7系统

4. 在指令的"配置文件"可以换成"w10.yml"或者"w11.yml"，或者其他系统配置文件

5. 当然，也可以选择 Win11/win10 之外其他的操作系统或软件的容器。比如，搭建一个网站，一个笔记系统等，只要是docker容器都可以。

6. 在vscode中打开配置文件可进行机器核心和运行内存的更改，也可更改端口。

# 开始教程
## ***思路1***
1. 先登录你的github账号
2. 并拉取本项目
3. 然后点击本项目一个绿色按钮(Code)
4. 右边的Codepaces
5. 然后点击下面的小加号(+)
6. 也可以点击这个一键使用
[![立即使用](https://github.com/codespaces/badge.svg)](https://codespaces.new/MOMOTAG123/GitToLindows?quickstart=1)
7. 等待进入(这个是进入github的linux环境)
8. 然后在终端这一行输入指令
```yaml
docker-compose -f "配置文件" up
```
9. 然后等待，有个端口转发(如没有请点击端口一栏进行映射8006端口)
10. 点击8006端口对应的链接网址
11. 恭喜你完成本次操作了
12. 等待即可食用windows/linux/macos

 ## ***思路2***
一、前置准备
1.打开本项目网站

2. 准备一个GitHub账号
拥有自己的GitHub账号，没有的话去 GitHub官网 注册即可，完全免费。

3. 创建一个空的GitHub仓库
在GitHub上新建一个公开/私有仓库（推荐私有），仓库名称随意，无需初始化任何文件，复制仓库的完整地址（如：https://github.com/用户名/仓库名.git）备用。

4. 准备Tailscale账号
去 Tailscale官网 注册账号，用于云电脑的远程连接，免费额度完全够用。

二、核心操作步骤
第一步：获取并填写 GitHub 个人访问令牌
点击表单中的【如何获取 GitHub 令牌】链接，跳转到GitHub令牌生成页，勾选权限：repo、workflow，生成令牌后复制粘贴到对应输入框，令牌只会显示一次，请妥善保管。

第二步：填写GitHub用户名与仓库地址
用户名：填写你的GitHub账号昵称；仓库地址：填写刚才新建仓库的完整git地址（必填）。

第三步：获取并填写 Tailscale 秘钥
点击表单中的【如何获取 Tailscale 秘钥】链接，生成一个 Auth key（授权密钥），复制粘贴到对应输入框，此密钥用于云电脑的内网穿透连接。

第四步：提交任务
确认所有信息填写无误后，点击【开始打工】按钮，页面会在按钮下方显示进度和日志，耐心等待任务执行完成（约1-3分钟）。

三、连接云电脑（任务完成后必看）
1. 本地安装 Tailscale 客户端
在自己的电脑/手机上安装 Tailscale客户端，并使用你刚才注册的Tailscale账号登录。

2. 查看云电脑设备
登录Tailscale后台，在【设备】列表中会看到一个新的设备（GitHub云电脑），状态显示为在线，复制该设备的IP地址。

3. 远程连接云电脑
✅ Windows用户：使用系统自带的「远程桌面连接」(mstsc)，输入云电脑IP即可连接；
✅ Mac/Linux用户：使用RDP客户端（如Microsoft Remote Desktop）连接；
✅ 初始账号密码：系统默认账号为 moti，密码为 随机密码，建议连接后立即修改。

💡 小贴士：云电脑的系统资源由GitHub Actions提供，CPU/内存/硬盘均为免费额度，支持运行轻量程序、挂机、办公等场景。

重要注意事项
⚠️ 免费额度限制
GitHub Actions 每月提供 2000分钟 免费运行时长（Windows系统耗时翻倍），用完后当月无法使用，次月自动重置，请勿滥用。

⚠️ 隐私与安全
1. 本页面不会保存你的任何Token/秘钥/账号信息，所有数据仅用于本次任务提交；
2. 建议将GitHub仓库设置为私有，避免泄露个人信息；
3. 令牌/秘钥如果泄露，请立即在对应平台作废并重新生成。

⚠️ 云电脑有效期
GitHub云电脑的运行时长为单次任务时长（最长6小时），任务结束后会自动销毁，数据不会保留。如需长期使用，可在云电脑内挂载云盘/网盘保存数据。

⚠️ 禁止违规使用
请勿将云电脑用于挖矿、爬虫、攻击、违法违规等用途，否则会被GitHub封禁账号，后果自负。

# linux系统启动方法（连接）
1. 部署好后，新建终端
2. 输入bash start系统.sh
- 比如：
- debian：bash startdeb.sh
- centos：bash startcen.sh

# windows/macos如何连接
- 只需要点端口找到特定的8006端口

# macos连接
- 只需要点端口找到特定的8006端口

# Proxmox VE连接
- 只需要点端口找到特定的docker端口
- 进行网页操作

# 支持的系统：
  
  | **配置文件** | **系统/版本**            | **大小** |
  |---|---|---|
  | ``   | Windows            |    |
  | `w11.yml`   | Windows 11 Pro            | 5.4 GB   |
  ||||
  | `w10.yml`   | Windows 10 Pro            | 5.7 GB   |
  ||||
  | `w8.yml`   | Windows 8.1 Enterprise    | 3.7 GB   |
  | `w7.yml`   | Windows 7 Ultimate        | 3.1 GB   |
  | `wvista.yml`   | Windows Vista Ultimate    | 3.0 GB   |
  | `wxp.yml`   | Windows XP Professional   | 0.6 GB   |
  | `w2k.yml`   | Windows 2000 Professional | 0.4 GB   | 
  ||||  
  | `w2022.yml` | Windows Server 2022       | 4.7 GB   |
  | `w2019.yml` | Windows Server 2019       | 5.3 GB   |
  | `w2016.yml` | Windows Server 2016       | 6.5 GB   |
  | `w2012.yml` | Windows Server 2012       | 4.3 GB   |
  |||| 
  | ``   | linux            |    |
  | `debian.yml` | debian       | 未知   |
  | `centos.yml` | centos       | 未知   |
  | ``   | macos            |    |
  | `macos.yml` | macos11       | 未知   |
  | ``   | other(linux)            |    |
  | `pve.yml` | Proxmox VE       | 未知   |

# 这么做的好处是：
1. 获得免费限时的 VPS/虚拟 机器
2. 这个 Windows/linux/macos  容器规格比较大
3. 没有臃肿的预置软件
4. 网络访问没有限制
5. 网速特别快/支持境外网络
6. 可以使用 Copilot AI

