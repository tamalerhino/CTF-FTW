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