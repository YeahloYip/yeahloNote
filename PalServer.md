# Palworld Server Setup

### 安装

#### Linux系统选择推荐
Ubuntu Server 22.04 LTS 64bit

#### 安装steamcmd
使用非root账户执行安装

可以考虑自建一个steam账户
```
sudo useradd -m steam
sudo passwd steam
sudo -u steam -s
cd /home/steam
```

```
sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo apt update
sudo apt install steamcmd
```

#### 安装PalWorld Server

```
steamcmd +login anonymous +app_update 2394010 validate +quit
```

下载完成后，更改到下载目录。通常在用户的主目录下，但如果您已经为SteamCMD设置了安装目录，请自行切换。
```
cd ~/Steam/steamapps/common/PalServer
```

执行sh启动
```
./PalServer.sh
```


如果启动时出现以下消息，则可以通过执行以下步骤更正错误。

如果在服务器运行后执行此过程，则游戏将从角色重新创建开始。我们建议您不要在已经运行的服务器上执行此操作。
```
.steam/sdk64/steamclient.so: cannot open shared object file: No such file or directory
```

要解决此问题
```
mkdir -p ~/.steam/sdk64/
steamcmd +login anonymous +app_update 1007 +quit
cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/
```

错误在启动时显示一次。如果显示[.steam/sdk64/streamclient.so OK。（First tryd local'stemclient.so'）]，则没有问题。
```
$ ./PalServer.sh
Shutdown handler: initalize.
Increasing per-process limit of core file size to infinity.
dlopen failed trying to load:
steamclient.so
with error:
steamclient.so: cannot open shared object file: No such file or directory
[S_API] SteamAPI_Init(): Loaded '/home/ubuntu/.steam/sdk64/steamclient.so' OK.  (First tried local 'steamclient.so')
```

#### 创建systemctl
创建systemctl文件
```
vi pal-server.service
```

编辑以下内容
```
[Unit]
Description=pal-server.service

[Service]
Type=simple
User=自行修改为执行用户名
Restart=on-failure
RestartSec=30s
ExecStart=/home/自行修改为执行用户名/Steam/steamapps/common/PalServer/PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS

[Install]
WantedBy=multi-user.target
```

> 官方建议启用命令高级配置  
> port=8211	Change the port number used to listen to the server.  
> players=32	Change the maximum number of participants on the server.  
> -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS	Improves performance in multi-threaded CPU environments.  
> It is effective up to a maximum of about 4 threads, and allocating more than this number of threads does not make much sense.  


移动到系统文件夹
```
sudo mv pal-server.service /usr/lib/systemd/system/
```

启用服务，重启服务，查看服务的命令
```
sudo systemctl enable pal-server.service
sudo systemctl restart pal-server.service
sudo systemctl -l --no-pager status pal-server.service
```

### 内存优化
#### 配置定时重启服务

#### 增加swap
> 建议将swap的大小设置为与系统内存一致

- 执行命令，没有配置swap将不会有返回
```
swapon --show
```

- 创建swap
```
sudo fallocate -l 16G /swapfile
```

设置文件权限
```
sudo chmod 600 /swapfile
```

将文件格式化为swap格式
```
sudo mkswap /swapfile
```

启用swap文件
```
sudo swapon /swapfile
```

设置永久使用swap文件（系统在启动时自动启用swap文件）
```
sudo vim /etc/fstab
```

将以下内容写入到文件中
```
/swapfile   none    swap    sw    0   0
```

重新加载fstab文件
```
sudo swapon --all
```

验证swap设置是否成功
```
swapon --show
```

### 各参数说明

Difficulty=None  
预设为None。即使使用Difficult或是Easy也不影响下列调整的参数。

DayTimeSpeedRate=1.000000  
【0.1~5】日夜流逝的速度，参数预设为1，白天晚上各30分钟。若增加数字则流逝更快，白天或晚上会更短。

NightTimeSpeedRate=1.000000  
【0.1~5】野外BOSS体感重生时间是30分钟，如果把数字增加，BOSS重生会更快。

ExpRate=1.000000  
【0.1~无上限】经验倍率，预设为1，经测试没有上限。

PalCaptureRate=1.000000  
【0.5~2】帕鲁捕获机率调整。预设为1，这个参数调整非常敏感请谨慎调整。困难模式为0.8，简单模式为2。

PalSpawnNumRate=2.000000  
【0.5~无上限】帕鲁的重生数量，预设为1，王固定1隻，野生帕鲁群1-2隻。若调整为2，王固定变2隻，野生帕鲁群2-4隻。超过3会经常导致帕鲁重叠或掉出地图，请谨慎调整。

PalDamageRateAttack=8.000000  
【0.1~无上限】帕鲁造成的伤害倍率，预设为1，数字越高帕鲁越强。包含自己和野生的帕鲁。

PalDamageRateDefense=0.200000  
【0.1~无上限】帕鲁受到的伤害倍率，预设为1，数字越低帕鲁越硬。包含自己和野生的帕鲁。

PlayerDamageRateAttack=1.000000  
【0.1~无上限】玩家造成的伤害倍率，预设为1，数字越高玩家越强。

PlayerDamageRateDefense=0.300000  
【0.1~无上限】玩家受到的伤害倍率，预设为1，数字越低玩家越硬。

PlayerStomachDecreaceRate=1.000000  
【0.1~5】玩家的饱足感下降速度，预设为1。数字越低下降越慢，越不容易空腹的意思。

PalStomachDecreaceRate=1.000000  
【0.1~5】帕鲁的饱足感下降速度，预设为1。数字越低下降越慢，越不容易空腹的意思。

PlayerStaminaDecreaceRate=0.600000  
【0.1~5】玩家与帕鲁的耐力条下降速度，预设为1。数字越低下降越慢，耐力越多的意思。玩家耐力会影响採集、移动和战斗翻滚的次数；

PalStaminaDecreaceRate=0.300000  
【0.1~5】帕鲁耐力会影响大世界移动、技能施放次数。

PlayerAutoHPRegeneRate=4.000000  
【0.1~无上限】玩家的自动生命回复速率。预设为1，非常无感。影响战斗结束后及帕鲁在帕鲁球内的续战力。

PlayerAutoHpRegeneRateInSleep=4.000000  
【0.1~无上限】玩家的睡眠时自动生命回复速率

PalAutoHPRegeneRate=4.000000  
【0.1~无上限】帕鲁的自动生命回复速率。预设为1，非常无感。影响战斗结束后及帕鲁在帕鲁球内的续战力。

PalAutoHpRegeneRateInSleep=4.000000  
【0.1~无上限】帕鲁的睡眠时自动生命回复速率

BuildObjectDamageRate=1.000000  
【0.5~3】建筑受伤害倍率，预设为1。不需要特别调整，建筑模式中有拆解模式不需要手动慢慢敲(经验谈)。

BuildObjectDeteriorationDamageRate=1.000000  
【0~10】建筑劣化速率，预设为1，越高劣化越快。

CollectionDropRate=1.500000  
【0.5~无上限】採集资源倍率，预设为1。例 : 拿石稿敲小帕鲁矿取得1个帕鲁碎片预设要6下平均19点伤害，若调为3则要敲2下平均19点伤害。

CollectionObjectHpRate=1.000000  
【0.5~3】採集资源生命倍率。

CollectionObjectRespawnSpeedRate=0.500000  
【0.5~3】採集资源重生间格，预设为1(树木大矿石为1小时)，若为0立即重生。如果发现固定点的矿不重生了，建议重启伺服器确认看看。

EnemyDropItemRate=2.000000  
【0.5~无上限】敌人掉落倍率，预设为1，经测试没有上限。

DeathPenalty=ItemAndEquipment  
【None，Item，ItemAndEquipment， All 】死亡掉落惩罚类型。None甚麽都不掉；Item仅掉落道具(不含帕鲁及身上穿的装备武器)；ItemAndEquipment除了帕鲁其他全掉；All帕鲁、装备、道具全部掉落(不包含无法掉落的帕鲁专属装备，如马鞍)。

DropItemMaxNum=3000  
世界内的掉落物上限。

DropItemMaxNum_UNKO=100  
UNKO(大便)上限。

BaseCampMaxNum=128  
基地最大数量。

BaseCampWorkerMaxNum=20  
基地内奴隶的最大数量。数字超过15目前不生效。若想生效可以参考6楼作法。

DropItemAliveMaxHours=0.200000  
掉落物品的保留时间，预设为1(1小时)，建议设为0.5以保证掉落物不会太多造成卡顿。

AutoResetGuildTimeNoOnlinePlayers=72.000000  
自动帮玩家退出公会的时间，预设为72(72小时)。

GuildPlayerMaxNum=20  
公会人数上限。

PalEggDefaultHatchingTime=1.000000  
巨大蛋的孵化时间，预设为1(1小时)。

WorkSpeedRate=1.500000  
工作效率，预设为1。

---

#### 若想尝试PVP伺服器，建议将
【PVP】标籤的参数全部开启。

bAutoResetGuildNoOnlinePlayers=False  
【True or False】自动帮玩家退出公会，预设为关。

bEnablePlayerToPlayerDamage=False  
【True or False】【PVP】玩家对玩家伤害，预设为关。

bEnableFriendlyFire=False  
【True or False】【PVP】玩家对自己帕鲁跟同公会玩家的伤害，预设为关。

bEnableInvaderEnemy=True  
【True or False】袭击事件关闭开启，预设开启。

bActiveUNKO=False  
【True or False】UNKO(大便)关闭开启，预设关闭。

bEnableAimAssistPad=True  
【True or False】手把辅助瞄准，预设开启。

bEnableAimAssistKeyboard=False  
【True or False】键鼠辅助瞄准，预设关闭。

bIsMultiplay=False  
【True or False】,

bIsPvP=False  
【True or False】【PVP】多人游戏与PVP模式，预设为False。

bCanPickupOtherGuildDeathPenaltyDrop=False  
【True or False】【PVP】是否捡取其他公会的死亡掉落物，预设为False。

bEnableNonLoginPenalty=True  
【True or False】【PVP】登入惩罚，预设为False。测不出来这是甚麽鬼。

bEnableFastTravel=True  
【True or False】是否开启快速旅行，预设为开。

bIsStartLocationSelectByMap=True  
【True or False】是否创角后选择出生点，预设为开。若为关则出生在初始台地，死亡后依旧可以选择其他出生点。

bExistPlayerAfterLogout=False  
【True or False】是否玩家全部登出自动关服，预设为False。

bEnableDefenseOtherGuildPlayer=False  
【True or False】【PVP】是否受到其他公会伤害，预设为False。


---


### PalWorldSettings.ini设定：
```
; This configuration file is a sample of the default server settings.
; Changes to this file will NOT be reflected on the server.
; To change the server settings, modify Pal/Saved/Config/LinuxServer/PalWorldSettings.ini.
[/Script/Pal.PalGameWorldSettings]
OptionSettings=(Difficulty=None,DayTimeSpeedRate=0.500000,NightTimeSpeedRate=2.000000,ExpRate=1.500000,PalCaptureRate=2.000000,PalSpawnNumRate=1.000000,PalDamageRateAttack=1.000000,PalDamageRateDefense=1.000000,PlayerDamageRateAttack=1.500000,PlayerDamageRateDefense=0.500000,PlayerStomachDecreaceRate=0.100000,PlayerStaminaDecreaceRate=0.100000,PlayerAutoHPRegeneRate=2.000000,PlayerAutoHpRegeneRateInSleep=5.000000,PalStomachDecreaceRate=0.100000,PalStaminaDecreaceRate=0.100000,PalAutoHPRegeneRate=2.000000,PalAutoHpRegeneRateInSleep=5.000000,BuildObjectDamageRate=1.000000,BuildObjectDeteriorationDamageRate=1.000000,CollectionDropRate=2.000000,CollectionObjectHpRate=0.500000,CollectionObjectRespawnSpeedRate=0.500000,EnemyDropItemRate=2.000000,DeathPenalty=None,bEnablePlayerToPlayerDamage=False,bEnableFriendlyFire=False,bEnableInvaderEnemy=True,bActiveUNKO=False,bEnableAimAssistPad=True,bEnableAimAssistKeyboard=False,DropItemMaxNum=2000,DropItemMaxNum_UNKO=100,BaseCampMaxNum=128,BaseCampWorkerMaxNum=20,DropItemAliveMaxHours=0.200000,bAutoResetGuildNoOnlinePlayers=False,AutoResetGuildTimeNoOnlinePlayers=72.000000,GuildPlayerMaxNum=20,PalEggDefaultHatchingTime=0.100000,WorkSpeedRate=2.000000,bIsMultiplay=False,bIsPvP=False,bCanPickupOtherGuildDeathPenaltyDrop=False,bEnableNonLoginPenalty=True,bEnableFastTravel=True,bIsStartLocationSelectByMap=True,bExistPlayerAfterLogout=False,bEnableDefenseOtherGuildPlayer=False,CoopPlayerMaxNum=4,ServerPlayerMaxNum=16,ServerName="SW Palworld Server",ServerDescription="",AdminPassword="",ServerPassword="",PublicPort=8211,PublicIP="",RCONEnabled=False,RCONPort=25575,Region="",bUseAuth=True,BanListURL="https://api.palworldgame.com/api/banlist.txt")
```

> 如果想让自己的服务器能在社群服务器中被搜索到，可以在括号里加上 EpicApp=PalServer
> 普通服务器加入ServerPassword的，使用IP地址联系将不会弹出密码输入框，需等待官方修复
