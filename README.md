# setting_up_new_windows_pc
Stuff for setting up a new Windows developer computer

# Install applications
I recommend installing tools using either scoop, chocolatey or winget. Here I have examples from scoop and chocolatey

## Scoop
```powershell
#Install scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

#Make it possible do install programs from "extras"
scoop bucket add extras 

#Install everything
scoop install 7zip git obsidian greenshot spotify notepadplusplus postman keepass putty aws aws-session-manager-plugin python winscp vscode
```

## Chocolatey
```powershell
#Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Install everything
choco install 7zip git obsidian greenshot spotify notepadplusplus postman keepass putty awscli awscli-session-manager python winscp vscode
```

## Windows Terminal and PowerToys
- Windows Terminal - [An overview on Windows Terminal | Microsoft Docs](https://docs.microsoft.com/en-us/windows/terminal/)
- Windows PowerToys - [Microsoft PowerToys | Microsoft Docs](https://docs.microsoft.com/en-us/windows/powertoys/)

Those can be installed using either WinGet, Scoop or Chocolatey. 
>! Warning  
>I've seen it recommended to use winget and will check up on why that is. 

### WinGet
```powershell
winget install Microsoft.PowerToys --source winget
winget install --exact --id=Microsoft.WindowsTerminal --source msstore --accept-source-agreements --accept-package-agreements 
```

### Scoop
```powershell
scoop install windows-terminal powertoys
```

### Chocolatey
```powershell
choco install microsoft-windows-terminal powertoys
```

# Disable web search across Windows
1.  To open the Group Policy Editor, tap on the Windows-key, type `gpedit.msc` and hit enter. Note that the editor is (likely) only included in Pro and Enterprise versions and not in Windows 10 Home. If you run home, check out the other methods listed below instead.
2.  Browse to the following path using the left sidebar: `Local Computer Policy` > `Computer Configuration` > `Administrative Templates` > `Windows Components` > `Search`
3.  Locate `Do not allow web search` and double-click it. Switch the preference to enabled.
4.  Locate `Don't search the web or display web results in Search` and double-click it. Switch the preference to enabled.
5.  Locate `Don't search the web or display web results in Search over metered connections` and double-click it. Switch the preference to enabled.

See also [How to disable web search in Windows 10's start menu - gHacks Tech News](https://www.ghacks.net/2015/06/23/how-to-disable-web-search-in-windows-10s-start-menu/)

# Setup WSL
```powershell
#Locate available distributions
wsl --list --online

#Install your preferred distribution.
# E.g.:
wsl --install -d ubuntu

#Update to latest version
wsl --update

#Stop distribution, if it is running.
wsl --shutdown

#Check again whether it is now updated
# It should say "No updates are available"
wsl --status

#Start wsl
wsl #start as default user
wsl -u root #start as root
```

# Setup Git
## Create and set a new ssh key
1) Open git bash
2) Create key
```bash
ssh-keygen -t ed25519 -C "some comment - can be email or whatever"
```
Give it the key the default name unless you have a reason not do to so.
Give it a password you can remember.
3) Add the new SSH key to the ssh-agent
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
4) Locate your new public key within ~\.ssh\ud:ed_25519.pub and copy its contents.
5) Go to github.com
6) Go to ProfileImage -> Settings -> SSH and GPG keys
7) Click on "New SSH Key"
8) Give it a title, and paste the key to the "Key" field. 
9) Done

## Setup git
1) Open git bash
2) Run the following commands, which will create .gitconfig file within the home folder
```bash
git config --global user.name "your-github-username"
git config --global user.email "either-personal-or-company@email.com"
```

3) Open the ~/.gitconfig with an editor of your choice and add the following block:
```
[user]
	email = either-personal-or-company@email.com
	name = your-github-username
[core]
	editor = nano
[pull]
	rebase = false
[push]
	default = current
[fetch]
	prune = false
[rebase]
	autoStash = false
[color]
	ui = true
[alias]
	ls = log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate
	co = checkout
	br = branch
	ci = commit
	st = status
	last = log -1 HEAD
	ll = log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat
	logtree = log --graph --oneline --decorate --all
```