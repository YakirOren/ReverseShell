# Windows Persistent Reverse Shell for Bash Bunny

# The orignal repo
* https://github.com/hak5/bashbunny-payloads/tree/master/payloads/library/remote_access/WindowsPersistentReverseShell

## Description
* This new version uses privilege escalation to store the NetCat file in the windows folder. 
Opens a persistent reverse shell through NetCat on victim's Windows machine and connects it back to host attacker.
* Targets Windows 10 (working on support for older versions)
* Connection can be closed and reconnected at any time
* Deploys in roughly 15-20 sec
* Works with NetCat




