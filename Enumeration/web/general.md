# How is a Web site/app built?
https://builtwith.com/ <-- will tell us how the site is built using what tech
https://www.wappalyzer.com/ <-- firefox add-on that tells us a bit of the website
WhatWEB
In Kali
```
whatweb https://thesite.com
```

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

```

## ffuf
```
ffuf -w /usr/share/wordlists/dirbuster/directory-lists-2.3-medium.txt:FUZZ -u http://<IP>/FUZZ
```