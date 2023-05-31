#!/bin/bash
ARC=$(uname -a)
CPU=$(lscpu | grep '^Socket(s)' | awk '{print $2}')
vCPU=$(lscpu | grep '^CPU(s)' | awk '{print $2}')
MEM=$(free -m | grep '^Mem' | awk '{print $2}')
MEM_USED=$(free -m | grep '^Mem' | awk '{print $3}')
MEM_USED_PERCENT=$(free -m | grep '^Mem' | awk '{printf "%.2f", $3/$2*100}')
DISK=$(df -m | grep '^/dev' | grep -v '/boot' | awk '{sum += $2} END {print sum}')
DISK_USED=$(df -m | grep '^/dev' | grep -v '/boot' | awk '{sum += $3} END {print sum}')
DISK_USED_PERCENT=$(echo "scale=2; $DISK_USED/$DISK*100" | bc)
CPU_USAGE=$(top -b -n1 | grep '^%Cpu' | awk '{printf "%.2f", $2+$4}')
UPTIME=$(uptime -s)
lvm_count=$(lsblk -o TYPE | grep -c 'lvm')
if [ "$lvm_count" -eq 0 ]; then
    LVM_USE="no"
else
    LVM_USE="yes"
fi
TCP_CONN=$(netstat -an | grep 'tcp' | grep -c 'ESTABLISHED')
USERS=$(who | wc -l)
IP=$(hostname -I | head -1 | awk '{print $1}')
MAC=$(ip a | grep 'link/ether' | head -1 | awk '{print $2}')
SUDO=$(grep -c COMMAND /var/log/sudo/sudo.log)

echo "
    #Architecture: $ARC
    #CPU physical: $CPU
    #vCPU: $vCPU
    #Memory Usage: $MEM_USED/${MEM}MB ($MEM_USED_PERCENT%)
    #Disk Usage: $DISK_USED/${DISK}MB ($DISK_USED_PERCENT%)
    #CPU load: $CPU_USAGE%
    #Last boot: $UPTIME
    #LVM use: $LVM_USE
    #Connexions TCP: $TCP_CONN ESTABLISHED
    #User log: $USERS
    #Network: IP $IP ($MAC)
    #Sudo: $SUDO cmd
"
