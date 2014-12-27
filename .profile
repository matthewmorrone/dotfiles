
# unalias *
# unalias -a

PS1="-- "
PS2="-- "
PS3="-- "
PS4="-- "

# caffeinate -t 3600
# defaults -currentHost write com.apple.screensaver askForPasswordDelay -int 1800
# defaults write -g WebAutomaticDashSubstitutionEnabled -bool true
# defaults write -g WebAutomaticTextReplacementEnabled -bool true
# defaults write -g WebContinuousSpellCheckingEnabled -bool true
# defaults write com.apple.AddressBook ABShowDebugMenu -bool true
# defaults write com.apple.Dictionary ProhibitNewWindowForRequest -bool TRUE
# defaults write com.apple.Dock autohide-delay -float 0 && killall Dock
# defaults write com.apple.dock mouse-over-hilite-stack -boolean YES
# defaults write com.apple.dock mouse-over-hilite-stack -boolean yes
# defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}';
# defaults write com.apple.dock single-app -bool true; killall Dock
# defaults write com.apple.dock use-new-list-stack -bool YES
# defaults write com.apple.finder FXShowPosixPathInTitle -bool YES
# defaults write com.apple.finder QLEnableTextSelection -bool true
# defaults write com.apple.finder QLEnableTextSelection -bool true; killall Finder
# defaults write com.apple.finder QLEnableXRayFolders 1
# defaults write com.apple.iTunes zoom-to-window -bool YES
# defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false
# defaults write com.apple.QuickTimePlayerX MGCinematicWindowDebugForceNoRoundedCorners 1
# defaults write com.apple.QuickTimePlayerX MGEnableCCAndSubtitlesOnOpen 1
# defaults write com.apple.QuickTimePlayerX MGFullScreenExitOnAppSwitch 0
# defaults write com.apple.QuickTimePlayerX MGUIVisibilityNeverAutohide 1
# defaults write com.apple.QuickTimePlayerX MGUIVisibilityNeverAutoshow 1
# defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false
# defaults write com.apple.Safari DebugUsePieProgressIndicator 1
# defaults write com.apple.Terminal FocusFollowsMouse -string YES
# defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist killall NotificationCenter
# sudo nvram SystemAudioVolume=%80


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

function orient()
{
pwd
ls
}




# function git-master()
# {
# # for x in *.png;
# # 	do mv $x test/${x%.png} test.png;
# # done
# # find . -depth -name "*from_stuff*" -execdir sh -c 'mv {} $(echo {} | sed "s/from_stuff/to_stuff/")' \;
# # #!/bin/sh
# # for file in *-master
# # do
# # 	new=${*}
# # 	mv $file $new
# # done
# echo $1;
# }
function gitstart() {
# if [$1]
# then
# repo_name=$1
# else
echo "Repo name?"
read repo_name
# fi

curl -u 'matthewmorrone1:1b3795a12b756b363f6def638723c360abdf6649' https://api.github.com/user/repos -d '{"name":"'$repo_name'"}'
mkdir $repo_name
cd $repo_name
git init
git remote add origin https://github.com/matthewmorrone1/$repo_name.git
# git push -u origin master
}
function gitclone()
{
git clone https://github.com/matthewmorrone1/$1.git
cd $1

# git clone https://github.com/$1/$2.git
# cd $2
}


alias gitremote="git remote add origin https://github.com/matthewmorrone1/$1"
alias gitinit="git init"
alias gits="git status -s"
alias gitadd="git add --all"
alias gitcom="git commit -m $1"
alias gitpush="git push -u origin master"


function gitr()
{
gits
gitadd
echo "commit message?"
read commit_message
gitcom commit_message
gitpush
echo "done"
}


alias mk="touch"
alias rmdir="rm; orient"
alias rmdir="rmdir $1; orient"
alias mv="mv; orient"
alias cp="cp; orient"
cd="cd; orient"
pwd='orient'
dirs='orient'
ls="orient"

# function ls () { if [[ $@ == "-la" ]]; then command ls -la | more; else command ls "$@"; fi; }
# alias ls="ls -al"

# alias showdns="sudo killall -INFO mDNSResponder; sublime /var/log/system.log"
# alias cleardns="sudo killall -HUP mDNSResponder; sublime /var/log/system.log"

alias empty="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
alias trash="empty"

# export PATH=$PATH:~/bin

export HISTSIZE=100000
# Don't store duplicates

export HISTCONTROL=erasedups
# Append to history file
# shopt -s histappend

ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl ~/bin/subl
export EDITOR='subl -w'

# alias js="osascript -l JavaScript -i"
alias js="node"

function npm-clear() {
sudo npm ls -gp | awk -F/ '/node_modules/ && !/node_modules.*node_modules/ {print $NF}' | xargs npm -g rm
}

alias npmlist="npm -g --depth=0 list"
alias npmls="npm -g --depth=0 ls"
alias npminfo="package-info"
# alias npmi="npm install -g"
function npmi() {
	package-info $1;
	npm install -g $1;
}


alias py="python"

alias mm="ssh matmor58@matthewmorrone.com"

alias sublime="subl"
alias reload="source ~/.profile"
alias profile="sublime ~/.profile"
alias desktop="cd ~/desktop"
alias cdsublime="cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/"


alias downloads="cd ~/downloads"
alias documents="cd ~/documents"
alias htdocs="cd /Applications/MAMP/htdocs"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

alias map="xargs -n1"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

function dots()
{
STATUS=`defaults read com.apple.finder AppleShowAllFiles`
if [ $STATUS == YES ]; then defaults write com.apple.finder AppleShowAllFiles NO; else defaults write com.apple.finder AppleShowAllFiles YES; fi;
killall Finder
}

function spotlight()
{
STATUS=`defaults read sudo mdutil -a -i`
if [ $STATUS == on ]; then alias spotoff="sudo mdutil -a -i off"; else alias spoton="sudo mdutil -a -i on"; fi;
killall Finder
}

# function configure()
# {
# 	export PATH="$HOME/.rbenv/bin:$PATH"
# 	eval "$(rbenv init -)"
# 	export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# 	# defaults write com.apple.finder QLEnableXRayFolders 1
# 	# defaults write com.apple.Safari DebugUsePieProgressIndicator 1
# 	# defaults write com.apple.finder FXShowPosixPathInTitle -bool YES
# 	# defaults write com.apple.dock mouse-over-hilite-stack -boolean yes
# 	killall Dock
# }

alias killdock="killall Dock"

function spacedock() {
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}';
killall Dock
}

# __OLD_PATH=$PATH
# function updatePATHForNPM() {
# 	export PATH=$(npm bin):$__OLD_PATH
# }
# function node-mode() {
# 	PROMPT_COMMAND=updatePATHForNPM
# }
# function node-mode-off() {
# 	unset PROMPT_COMMAND
# 	PATH=$__OLD_PATH
# }
# node-mode  # Uncomment to enable node-mode by default



# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


clear
orient



