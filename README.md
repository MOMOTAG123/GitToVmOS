<h1 align="center">Git To VmsOS<br />
<div align="center">
<img src="https://github.com/dockur/windows/raw/master/.github/logo.png" title="Logo" style="max-width:100%;" width="128" />
<img src="https://github.com/dockur/macos/raw/master/.github/logo.png" title="Logo" style="max-width:100%;" width="128" />
<img src="https://raw.github.com/github/explore/eb40fa94e4b686db568094600bb30065acce30c3/topics/linux/linux.png?size=48" title="Logo" style="max-width:100%;" width="128" />
</div>

# 该项目基于GitHub Codespaces余额使用
> [!TIP]
> 使用的是你Codespaces余额，每个都有免费时长，也可进行购买
> 到一定时间/关闭vscode会自动关闭，重新输入指令启动就行了，不会丢失数据

# 在github跑windows/linux/虚拟机!!!

1. 主要思路就是通过 Github Codespaces功能创建一个 blank template 的 codespace，它是一个 Debian或Ubuntu 虚拟机，在这个虚拟机中可以执行 docker-compose -f 配置文件 up 创建一个 Windows/linux 的容器，可以通过端口转发的链接（设置成 public）来访问。

2. 一键启动默认是windows7系统

3. 在指令的"配置文件"可以换成"w10.yml"或者"w11.yml"，或者其他系统配置文件

4. 当然，也可以选择 Win11/win10 之外其他的操作系统或软件的容器。比如，搭建一个网站，一个笔记系统等，只要是docker容器都可以。

5. 在vscode中打开配置文件可进行机器核心和运行内存的更改，也可更改端口。

# 开始教程(使用)
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
  | `debian.yml` | debian       | 未知   |
  | `centos.yml` | centos       | 未知   |
  | `macos.yml` | macos11       | 未知   |
  | `pxe.yml` | Proxmox VE       | 未知   |

# 这么做的好处是：
1. 获得免费限时的 VPS/虚拟 机器
2. 这个 Windows/linux/macos  容器规格比较大
3. 没有臃肿的预置软件
4. 网络访问没有限制
5. 网速特别快/支持境外网络
6. 可以使用 Copilot AI

