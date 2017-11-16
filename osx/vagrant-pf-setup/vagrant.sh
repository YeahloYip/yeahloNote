#!/bin/sh
#Author  Liky
#Date    2017-01-15
#Info    Anlewo - Vagrant自动化部署

function Manage(){
cat <<EOF
Anlewo - Vagrant自动化部署
==============================================
<1> 启动虚拟机
<2> 关闭虚拟机
<3> 重启虚拟机
<4> 删除虚拟机
<q> 退出
==============================================
EOF
read -p "输入命令序号: " cmd

case $cmd in
	q)
	break
	exit
	;;
	1)
	vagrant up --provision
	./pfctlEnable.sh
	;;
	2)
	vagrant halt
	./pfctlDisable.sh
	;;
	3)
	vagrant reload --provision
	;;
	4)
	vagrant halt
	vagrant destroy
	;;
	*)
	clear
	Manage
esac
}

Manage
