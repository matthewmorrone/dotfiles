

function reset() {
	unalias *
	unalias -a
}
reset

PS1="-- "
PS2="-- "
PS3="-- "
PS4="-- "

export HISTSIZE=100000
export HISTCONTROL=erasedups

ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl ~/bin/subl
export EDITOR='subl -w'

function orient()
{
pwd
ls
}

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias mk="touch"
alias rmdir="rmdir $1; orient"
alias mv="mv; orient"
alias cp="cp; orient"
alias empty="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
alias trash="empty"
alias sublime="subl"
alias reload="source ~/.profile"
alias profile="sublime ~/.profile"
alias desktop="cd ~/desktop"
alias packages="cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User"
alias downloads="cd ~/downloads"
alias documents="cd ~/documents"
alias htdocs="cd /Applications/MAMP/htdocs"
alias js="node"
alias phantom="phantomjs"
alias http-server="http-server -a localhost -p 8000 --cors -o"
alias py="python"
alias mm="ssh matmor58@matthewmorrone.com"
alias whois="whois -h whois-servers.net"
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"
alias map="xargs -n1"
alias c="tr -d '\n' | pbcopy"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

function chrome() {
if [ "$#" = "1" ]
then
/usr/bin/open -a "/Applications/Google Chrome.app" http://$1
else
/usr/bin/open -a "/Applications/Google Chrome.app" 'http://google.com'
fi
}

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
alias killdock="killall Dock"

function spacedock() {
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}';
killall Dock
}

# Normal Colors
Black='\e[0;30m'# Black
Red='\e[0;31m'# Red
Green='\e[0;32m'# Green
Yellow='\e[0;33m' # Yellow
Blue='\e[0;34m' # Blue
Purple='\e[0;35m' # Purple
Cyan='\e[0;36m' # Cyan
White='\e[0;37m'# White

# Bold
BBlack='\e[1;30m' # Black
BRed='\e[1;31m' # Red
BGreen='\e[1;32m' # Green
BYellow='\e[1;33m'# Yellow
BBlue='\e[1;34m'# Blue
BPurple='\e[1;35m'# Purple
BCyan='\e[1;36m'# Cyan
BWhite='\e[1;37m' # White

# Background
On_Black='\e[40m' # Black
On_Red='\e[41m' # Red
On_Green='\e[42m' # Green
On_Yellow='\e[43m'# Yellow
On_Blue='\e[44m'# Blue
On_Purple='\e[45m'# Purple
On_Cyan='\e[46m'# Cyan
On_White='\e[47m' # White

NC="\e[m" # Color Reset


alias gitinit="git init"
alias gits="git status -s"
alias gitadd="git add --all"
alias gitpush="git push -u origin master"
alias gitdiff="git diff --ignore-blank-lines --minimal --diff-filter=D"

# creates the directory via curl, init, and adds remote origin
function gitstart() {
if [ "$#" = "1" ]
then
$repo_name = $1
else
echo "Repo name?"
read $repo_name
fi
curl -u 'matthewmorrone1:1b3795a12b756b363f6def638723c360abdf6649' https://api.github.com/user/repos -d '{"name":"'$repo_name'"}'
mkdir -p $repo_name
cd $repo_name
git init
git remote add origin https://github.com/matthewmorrone1/$repo_name.git
}

# I'm too lazy to type out my github name
function gitclone()
{
if [ "$#" = "1" ]
then
git clone "https://github.com/matthewmorrone1/$1.git"
cd "$1"
else
if [ "$#" = "2" ]
then
git clone "https://github.com/$1/$2.git"
cd "$2"
fi
fi
}

# I'm too lazy to type out my github name
function gitremote()
{
if [ "$#" = "1" ]
then
git remote add origin "https://github.com/matthewmorrone1/$1.git"
else
if [ "$#" = "2" ]
then
git remote add origin "https://github.com/$1/$2.git"
fi
fi
}

# not 100% sure why this displays extra stuff
function gitcom()
{
if [ "$#" = "1" ]
then
$commit_message = $1
else
echo "commit message?"
read $commit_message
fi
git commit -m "\"$commit_message\""
}

# doesn't quite work the way I wish it did
function gitr()
{
gits
gitadd
if [ "$#" = "1" ]
then
$commit_message = $1
else
echo "commit message?"
read $commit_message
fi
git commit -m "\"$commit_message\""
gitpush
echo "done"
}

# removes -master from folders and filenames
function gitmaster()
{
for file in *-master
do
new=${*}
mv $file $new
done
echo $1;
}


function npm-clear() {
sudo npm ls -gp | awk -F/ '/node_modules/ && !/node_modules.*node_modules/ {print $NF}' | xargs npm -g rm
}

alias npmlist="npm -g --depth=0 list"
alias npmls="npm -g --depth=0 ls"
alias npminfo="package-info"
alias npmi="npm install -g"
function npmi() {
package-info $1;
npm install -g $1;
}


clear
orient



