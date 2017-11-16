# OSX vagrant 自动启并修改防火墙接口配置

## 文件
pf-vagrant.conf pf规则启动vagrant规则  
vagrant pf的vagrant规则  
pfctlEnable.sh 启动pf规则  
pfctlDisable.sh 禁用pf规则  
vagrant.sh 里面加入了pfctlEnable.sh和pfctlDisable.sh的启动  


## 执行
正常情况下只需要执行 vagrant.sh 即可。正常vagrant.sh里面的执行完毕就会跟着执行pf的sh  
如需手动重启pf，则使用 pfctlDisable.sh 和 pfctlEnable.sh
