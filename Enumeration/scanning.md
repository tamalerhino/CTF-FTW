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
