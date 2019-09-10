

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/alexander/.oh-my-zsh

# The next line updates PATH for the Google Cloud SDK.
source /Users/alexander/google-cloud-sdk/path.zsh.inc

# The next line enables zsh completion for gcloud.
source /Users/alexander/google-cloud-sdk/completion.zsh.inc

# export PATH=/usr/local/bin:$HOME/bin:$PATH
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  yarn 
  web-search 
  jsontools
  macports
  node
  osx 
  sudo
  thor
  docker
  virtualenv
)

source $ZSH/oh-my-zsh.sh

# funciones alex

function listen {
    chrome http://192.168.41.227:9000/$1y}

function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

m() { meteor --settings settings.json }
hosts() {
	sudo nano /private/etc/hosts
}

function ccloud {
	cd ~/Creative\ Cloud\ Files/Clients/$1
}

function gop {
    cd ~/Projects/$1
}
mcd() { mkdir $1 && cd $1 }
chrome() {
	open -a "Google Chrome" $1
}

mcd() { mkdir $1 && cd $1 }

################## VMs MITROL #####################

166() { ssh root@192.168.43.166 -p 2543 }
167() { ssh mituser@192.168.43.167 -p 2543 }
42() { ssh mituser@192.168.43.42 }

################# FUNCTIONS SERABEY ##############

sg() { ssh alexa176@146.66.99.39 -p18765 }

################## FUNCTIONS RIO REVUELTO #########

rio() { cd ~/Documents/Clients/Riorevuelto }
encrypt() { openssl aes-256-cbc -a -salt -in $1 -out $1.r && rm $1 && echo 'FILE ENCRYPTED AND ORIGINAL DELETED, YOU ARE SAFE NOW!' }
decrypt() { openssl aes-256-cbc -d -a -salt -in $1 -out delete.$1 && echo 'THIS FILE HAS BEEN DELETED'  && cat delete.$1 && rm delete.$1 }


################## VMs GM ##########################

ogres() { ssh root@192.168.0.54 }
omni-server() { ssh omni@192.168.0.9 }

upx() { curl -k -F "model=@20190722-181249.tar.gz" http://192.168.43.167/api/projects/default/models?api_token=fa2da4f37cd3911bb60e57a0cfc4956d42c1fae3 }
############################## MONGODB #################

# mongo "mongodb+srv://omnicluster0-r62zo.mongodb.net/test" --username <username>
getomni() {
     mongoexport \
        --host ds153566.mlab.com \
        --port 53566 \
        --username heroku_gxp1f63x \
        --password 927c0oii04l0afoc8gq3514bn0 \
        --db heroku_gxp1f63x \
        --collection $1 \
        --out $1.json
}
#cars emails sales users families
get_mlab() {
    mongoexport \
        --host ds113749.mlab.com \
        --port 13749 \
        --username heroku_qzq9v9xs \
        --password bqhug185pciqi3liqf398lmi35 \
        --db heroku_qzq9v9xs \
        --collection $1 \
        --out $1.json
}
getgtsblanco() {
    mongoexport \
        --host ds155252.mlab.com \
        --port 55252 \
        --username heroku_26cpwsfq \
        --password bu0ngkn90ctp34bikh23hfk19m \
        --db heroku_26cpwsfq \
        --collection $1 \
        --out $1.json
}

local2file() {
    mongoexport \
        --host localhost \
        --port 3001 \
        --db meteor \
        --collection $1 \
        --out $1.json
}

file2local() {
    mongo`import` -vvvv --host localhost --port 3001 --db meteor --collection cars --type json --file cars.json --drop \
    && \
    mongoimport -vvvv --host localhost --port 3001 --db meteor --collection emails --type json --file emails.json --drop \
    && \
    mongoimport -vvvv --host localhost --port 3001 --db meteor --collection families --type json --file families.json --drop \
    
    mongoimport -vvvv --host localhost --port 3001 --db meteor --collection sales --type json --file sales.json --drop \

    mongoimport -vvvv --host localhost --port 3001 --db meteor --collection users --type json --file users.json --drop \

}

file2gts3() {
    mongoimport \
    -vvvv \
    --host ds137812.mlab.com \
    --port 37812 \
    --username heroku_bd3gpqf8 \
    --password mqsctjinsoqoi8fkur7sq5kma8 \
    --db heroku_bd3gpqf8 \
    --collection $1 \
    --type json \
    --file $1.json \
    --drop
}
#mongodb://heroku_26cpwsfq:bu0ngkn90ctp34bikh23hfk19m@ds155252.mlab.com:55252/heroku_26cpwsfq
file2gtsblanco() {
    mongoimport \
    -vvvv \
    --host ds155252.mlab.com \
    --port 55252 \
    --username heroku_26cpwsfq \
    --password bu0ngkn90ctp34bikh23hfk19m \
    --db heroku_26cpwsfq \
    --collection $1 \
    --type json \
    --file $1.json \
    --drop
}

start-redis() {
    redis-server /usr/local/etc/redis.conf
}



# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Reload the plugin to highlight the commands each time Iterm2 starts 
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


### VISUAL CUSTOMISATION ### 

# Elements options of left prompt (remove the @username context)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs status virtualenv)
# Elements options of right prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)



# Add a second prompt line for the command
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Add a space in the first prompt 
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"

# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"


# Change the git status to red when something isn't committed and pushed
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'

# Add a new line after the global prompt 
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true


# Colorise the top Tabs of Iterm2 with the same color as background
# Just change the 18/26/33 wich are the rgb values 
echo -e "\033]6;1;bg;red;brightness;18\a"
echo -e "\033]6;1;bg;green;brightness;26\a"
echo -e "\033]6;1;bg;blue;brightness;33\a"export PATH=/usr/local/bin:$PATH
