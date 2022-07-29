# How is a Web site/app built?
https://builtwith.com/ <-- will tell us how the site is built using what tech
https://www.wappalyzer.com/ <-- firefox add-on that tells us a bit of the website
WhatWEB
In Kali
```
whatweb https://thesite.com
```
# scripts
theres a `webrecon.sh` file, run it!


# Nikto - Web Vlnerability Scanner

```
nikto -h http <IP> > nikto-scan.txt
```

# Directory enumartion
WORDLISTS: /usr/share/wordlists/dirbuster
## DirBuster
GUI
```
dirbuster&
```
extentions: 
`php`,`txt`,`asp`,`aspx`,`zip`

## Dirb
```
dirb http://<IP>
```

## GoBuster
```
sudo gobuster dir -u http://10.129.156.21/ -w /usr/share/wordlists/dirb/common.txt
```
`-x` to tell it what specific file extensions to use

## ffuf
```
ffuf -w /usr/share/wordlists/dirbuster/directory-lists-2.3-medium.txt:FUZZ -u http://<IP>/FUZZ
```

## LFI
```
curl 'http://{target_IP}/?file=../../../../etc/passwd'
```

## apache/nginx
dont forget about the `.htpasswd` file!

## Asset Finder
Install assetfinder
```
go get -u github.com/tomnomnom/assetfinder
```
Run assetfinder
```
assetfinder tesla.com >> tesla-subs.txt
assetfinder --subs-only tesla.com >> tesla-subs.txt
```

## Amass
Install Amass
```
go install -v github.com/OWASP/Amass/v3/...@master
```
Use
```
amass enum -d tesla.com
```

## httprobe
Check if stuff is alive
Install 
```
go install github.com/tomnomnom/httprobe@latest
```
run
```
cat recon/domains.txt | httprobe
```
just 443
```
cat recon/domains.txt | httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ':443'
```
## Gowitness
Takes a screenshot of a site
Install
```
go get -u gorm.io/gorm
go install github.com/sensepost/gowitness@latest
```
```
gowitness single https://tesla.com
```
