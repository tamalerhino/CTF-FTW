# Powerview

## Get Powerview
github
https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerView
https://github.com/PowerShellMafia/PowerSploit/tree/master/Recon

Dowload the file, also in the files folder on this repo
```
wget -o PowerView.ps1 https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1
```

## Run Powerview on windows box
Open cmd or powershell
Turn off bypass
```
powershell -ep bypass
```
```
. .\PoweView.ps1
```

## Commands
Get domain info
```
Get-NetDomain
Get-NetDomainController
Get-DomainPolicy
(Get-DomainPolicy)."system access"
Get-NetUser 
            | select cn
            | select samaccountname
            | select description
Get-UserProperty -Properties pwdlastset
                 -Properties logoncount
                 -Properties badpwdcount
Get-NetComputer -FullData 
                          | select OperatingSystem
Get-NetGroup
             -GroupName "Domain Admins"
             -GroupName "*admin*"
Get-NetGroupMember 
                   -GroupName "Domain Admins"
Invoke-ShareFinder
Get-NetGPO
           | select displayname, whenchanged
```

# Bloodhound
## Install Bloodhound
```
apt install bloodhound
```
setup neo4j
```
neo4j console
```
username:neo4j
password:neo4j

## Use Bloodhound
```
Bloodhound
```

## Ingesters
You will need ingesters to grab data
Get [SharpHound](https://github.com/BloodHoundAD/BloodHound/blob/master/Collectors/SharpHound.ps1)
More info: https://bloodhound.readthedocs.io/en/latest/data-collection/sharphound.html

```
wget -o SharpHound.ps1 https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.ps1
```
## Run ingester on windows machine
```
. .\SharpHound.ps1
Invoke-BloodHound -CollectionMethod All -Domain Marvel.local -ZipFileName file.zip
```
Take that file and move it over to your kali box

## Review
Open/upload file up to bloodhound web ui
Go to Quiries
- Select "Find all Domain Admins"
- Select "shorest path * " 
