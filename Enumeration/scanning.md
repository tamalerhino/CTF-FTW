# Scanning
nmap
```
nmap -T4 -A -p- <IP>
```

Quick script
```
#!/bin/bash

if [ "$1" == ""]
then
echo "You forgot an IP Address!"
echo "Syntax: ./ipsweep.sh 10.0.0"
else
for ip in `seq 1 254`; do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
fi
```
Run it like `./ipsweep.sh > ips.txt`

Then use nmap to do a nmap scan of those IP's: 
```
for ip in $(cat ips.txt); do nmap $ip; done
```


# Scanning with Metasploit
You can use auxilary modules to do some scanning.
Start metasploit
```
msconsole
```
```
search smb
```
look for auxilary

```
use auxiliary/scanner/smb/smb_version
or
use 60
```
use info to get info on module and usage
```
msf5 auxiliary(scanner/smb/smb_version) > info
msf5 auxiliary(scanner/smb/smb_version) > options
```
set options wanted
```
set RHOSTS 192.68.4.3
```
run the scanner
```
run
or
exploit
```
