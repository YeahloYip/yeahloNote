各参数说明
Difficulty=None
预设为None。即使使用Difficult或是Easy也不影响下列调整的参数。

DayTimeSpeedRate=1.000000【0.1~5】
NightTimeSpeedRate=1.000000【0.1~5】
日夜流逝的速度，参数预设为1，白天晚上各30分钟。若增加数字则流逝更快，白天或晚上会更短。
野外BOSS体感重生时间是30分钟，如果把数字增加，BOSS重生会更快。

ExpRate=1.000000【0.1~无上限】
经验倍率，预设为1，经测试没有上限。

PalCaptureRate=1.000000【0.5~2】
帕鲁捕获机率调整。预设为1，这个参数调整非常敏感请谨慎调整。困难模式为0.8，简单模式为2。

PalSpawnNumRate=2.000000【0.5~无上限】
帕鲁的重生数量，预设为1，王固定1隻，野生帕鲁群1~2隻。
若调整为2，王固定变2隻，野生帕鲁群2~4隻。
超过3会经常导致帕鲁重叠或掉出地图，请谨慎调整。

PalDamageRateAttack=8.000000【0.1~无上限】
帕鲁造成的伤害倍率，预设为1，数字越高帕鲁越强。包含自己和野生的帕鲁。
PalDamageRateDefense=0.200000【0.1~无上限】
帕鲁受到的伤害倍率，预设为1，数字越低帕鲁越硬。包含自己和野生的帕鲁。
PlayerDamageRateAttack=1.000000【0.1~无上限】
玩家造成的伤害倍率，预设为1，数字越高玩家越强。
PlayerDamageRateDefense=0.300000【0.1~无上限】
玩家受到的伤害倍率，预设为1，数字越低玩家越硬。

PlayerStomachDecreaceRate=1.000000【0.1~5】
PalStomachDecreaceRate=1.000000【0.1~5】
玩家与帕鲁的饱足感下降速度，预设为1。数字越低下降越慢，越不容易空腹的意思。
PlayerStaminaDecreaceRate=0.600000【0.1~5】
PalStaminaDecreaceRate=0.300000【0.1~5】
玩家与帕鲁的耐力条下降速度，预设为1。数字越低下降越慢，耐力越多的意思。
玩家耐力会影响採集、移动和战斗翻滚的次数；
帕鲁耐力会影响大世界移动、技能施放次数。

PlayerAutoHPRegeneRate=4.000000【0.1~无上限】
PlayerAutoHpRegeneRateInSleep=4.000000【0.1~无上限】
PalAutoHPRegeneRate=4.000000【0.1~无上限】
PalAutoHpRegeneRateInSleep=4.000000【0.1~无上限】
玩家及帕鲁的自动生命回复速率。预设为1，非常无感。
影响战斗结束后及帕鲁在帕鲁球内的续战力。

BuildObjectDamageRate=1.000000【0.5~3】
建筑受伤害倍率，预设为1。不需要特别调整，
建筑模式中有拆解模式不需要手动慢慢敲(经验谈)。
BuildObjectDeteriorationDamageRate=1.000000【0~10】
建筑劣化速率，预设为1，越高劣化越快。

CollectionDropRate=2.000000【0.5~无上限】
採集资源倍率，预设为1。
例 : 拿石稿敲小帕鲁矿取得1个帕鲁碎片预设要6下平均19点伤害，若调为3则要敲2下平均19点伤害。
CollectionObjectHpRate=1.000000【0.5~3】
採集资源生命倍率。
CollectionObjectRespawnSpeedRate=0.500000【0；0.5~3】
採集资源重生间格，预设为1(树木大矿石为1小时)，若为0立即重生。
如果发现固定点的矿不重生了，建议重启伺服器确认看看。
EnemyDropItemRate=2.000000【0.5~无上限】
敌人掉落倍率，预设为1，经测试没有上限。

DeathPenalty=ItemAndEquipment【None，Item，ItemAndEquipment， All 】
死亡掉落惩罚类型。
None甚麽都不掉；
Item仅掉落道具(不含帕鲁及身上穿的装备武器)；
ItemAndEquipment除了帕鲁其他全掉；
All帕鲁、装备、道具全部掉落(不包含无法掉落的帕鲁专属装备，如马鞍)。

若想尝试PVP伺服器，建议将【PVP】标籤的参数全部开启。
bEnablePlayerToPlayerDamage=False【True or False】
【PVP】玩家对玩家伤害，预设为关。
bEnableFriendlyFire=False【True or False】
【PVP】玩家对自己帕鲁跟同公会玩家的伤害，预设为关。

bEnableInvaderEnemy=True【True or False】
袭击事件关闭开启，预设开启。
bActiveUNKO=False【True or False】
UNKO(大便)关闭开启，预设关闭。

bEnableAimAssistPad=True【True or False】
手把辅助瞄准，预设开启。
bEnableAimAssistKeyboard=False【True or False】
键鼠辅助瞄准，预设关闭。

DropItemMaxNum=3000
世界内的掉落物上限。
DropItemMaxNum_UNKO=100
UNKO(大便)上限。

BaseCampMaxNum=128
基地最大数量。
BaseCampWorkerMaxNum=20
基地内奴隶的最大数量。数字超过15目前不生效。若想生效可以参考6楼作法。

DropItemAliveMaxHours=0.500000
掉落物品的保留时间，预设为1(1小时)，建议设为0.5以保证掉落物不会太多造成卡顿。

bAutoResetGuildNoOnlinePlayers=False【True or False】
自动帮玩家退出公会，预设为关。
AutoResetGuildTimeNoOnlinePlayers=72.000000
自动帮玩家退出公会的时间，预设为72(72小时)。

GuildPlayerMaxNum=20
公会人数上限。

PalEggDefaultHatchingTime=1.000000
巨大蛋的孵化时间，预设为1(1小时)。

WorkSpeedRate=1.500000
工作效率，预设为1。

bIsMultiplay=False【True or False】,
bIsPvP=False【True or False】
【PVP】多人游戏与PVP模式，预设为False。

bCanPickupOtherGuildDeathPenaltyDrop=False【True or False】
【PVP】是否捡取其他公会的死亡掉落物，预设为False。

bEnableNonLoginPenalty=True【True or False】
【PVP】登入惩罚，预设为False。测不出来这是甚麽鬼。

bEnableFastTravel=True【True or False】
是否开启快速旅行，预设为开。

bIsStartLocationSelectByMap=True【True or False】
是否创角后选择出生点，预设为开。若为关则出生在初始台地，死亡后依旧可以选择其他出生点。

bExistPlayerAfterLogout=False【True or False】
是否玩家全部登出自动关服，预设为False。

bEnableDefenseOtherGuildPlayer=False【True or False】
【PVP】是否受到其他公会伤害，预设为False。

```
OptionSettings=(Difficulty=None,DayTimeSpeedRate=0.500000,NightTimeSpeedRate=2.000000,ExpRate=1.500000,PalCaptureRate=2.000000,PalSpawnNumRate=1.000000,PalDamageRateAttack=1.000000,PalDamageRateDefense=1.000000,PlayerDamageRateAttack=1.500000,PlayerDamageRateDefense=0.500000,PlayerStomachDecreaceRate=0.100000,PlayerStaminaDecreaceRate=0.100000,PlayerAutoHPRegeneRate=2.000000,PlayerAutoHpRegeneRateInSleep=5.000000,PalStomachDecreaceRate=0.100000,PalStaminaDecreaceRate=0.100000,PalAutoHPRegeneRate=2.000000,PalAutoHpRegeneRateInSleep=5.000000,BuildObjectDamageRate=1.000000,BuildObjectDeteriorationDamageRate=1.000000,CollectionDropRate=2.000000,CollectionObjectHpRate=0.500000,CollectionObjectRespawnSpeedRate=0.500000,EnemyDropItemRate=2.000000,DeathPenalty=None,bEnablePlayerToPlayerDamage=False,bEnableFriendlyFire=False,bEnableInvaderEnemy=True,bActiveUNKO=False,bEnableAimAssistPad=True,bEnableAimAssistKeyboard=False,DropItemMaxNum=2000,DropItemMaxNum_UNKO=100,BaseCampMaxNum=128,BaseCampWorkerMaxNum=20,DropItemAliveMaxHours=0.200000,bAutoResetGuildNoOnlinePlayers=False,AutoResetGuildTimeNoOnlinePlayers=72.000000,GuildPlayerMaxNum=20,PalEggDefaultHatchingTime=0.100000,WorkSpeedRate=1.500000,bIsMultiplay=False,bIsPvP=False,bCanPickupOtherGuildDeathPenaltyDrop=False,bEnableNonLoginPenalty=True,bEnableFastTravel=True,bIsStartLocationSelectByMap=True,bExistPlayerAfterLogout=False,bEnableDefenseOtherGuildPlayer=False,CoopPlayerMaxNum=4,ServerPlayerMaxNum=16,ServerName="SW Palworld Server",ServerDescription="",AdminPassword="shmily7314",ServerPassword="",PublicPort=8211,PublicIP="",RCONEnabled=False,RCONPort=25575,Region="",bUseAuth=True,BanListURL="https://api.palworldgame.com/api/banlist.txt")
```
