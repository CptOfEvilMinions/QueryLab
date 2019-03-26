---
layout: page
title: 'Test cases'
---
# Windows 
## Ransomware test case
1. [Download WannaCry](https://github.com/ytisf/theZoo/blob/68817f0afd70dbdc94e81372162e5bfce062c5da/malwares/Binaries/Ransomware.WannaCry/Ransomware.WannaCry.zip)
1. Unzip Ransomware.WannaCry.zip
1. Disable Windows Defender
1. WAIT TEN MINUTES
    1. OSquery is setup to take snapshots of the current system state. Snapshosts record list of current services, list of listening network sockets, and, etc.
1. Detonate `ed01ebfbc9eb5bbea545af4d01bf5f1071661840480439c6e5babe8e080e41aa.exe`



## APT28 test case
https://github.com/ytisf/theZoo/tree/master/malwares/Binaries/Win32.APT28.SekoiaRootkit

## Emotet test case
https://github.com/ytisf/theZoo/blob/68817f0afd70dbdc94e81372162e5bfce062c5da/malwares/Binaries/Win32.Emotet/Win32.Emotet.sha256

## Empire test case


# Linux
## Linux rootkit - Reptile
https://github.com/f0rb1dd3n/Reptile

# macOS
## Shlayer
https://objective-see.com/malware.html