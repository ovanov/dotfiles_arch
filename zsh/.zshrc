#           | |             
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|
#                           

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jova/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#
ZSH_THEME="Soliah"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    sudo    
    zsh-interactive-cd
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

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

#--------Alias-------

##.......Ranger......

ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

##.......Reload......
alias reload='source ~/.zshrc'
alias reloadtmux='tmux source ~/.tmux.conf'
alias reloadbash='source ~/.bashrc'


##.......Unix........
alias lsl='exa -l --color=always --group-directories-first'
alias lsll="exa -al --color=always --group-directories-first"
alias r='ranger'
alias c='clear'
alias p3='python3'
alias wincl='~/Tresors/organic/Uni/Computerlinguistik'
alias organic='~/Tresors/organic/'
alias ..='cd ..'
alias winal='~/Tresors/organic/Uni/Almanistik'

##......System CMD...
alias bat='acpi'
alias b+='sudo brightnessctl set +10%'
alias b-='sudo brightnessctl set 10%-'
alias ssn='sudo shutdown now'
alias sre='sudo reboot'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles_deb/ --work-tree=$HOME'
alias vnim='nvim'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
#(cat ~/.cache/wal/sequences &)

#cat ~/.cache/wal/sequences

#source ~/.cache/wal/colors-tty.sh

alias walchange='wal -i /home/jova/Tresors/privat/Bilder/backgrounds'
alias wallight='wal -i /home/jova/Tresors/privat/Bilder/backgrounds/beach_with_palm.png'
alias waldark='wal -i /home/jova/Tresors/privat/Bilder/backgrounds/village_in_alps.jpg'
alias walyellow='wal -i /home/jova/Tresors/privat/Bilder/backgrounds/yellow_dark_theater.png'
alias walkking='wal -i /home/jova/Tresors/privat/Bilder/backgrounds/yellow_dark_theater.png'
# BEST THEMES for wal:
# -- ashes (dark vibey color scheme with green red blue balance, good for python)
# -- base16-gruvbox-medium (balanced gruvbox theme for vibey backgrounds)
# -- materlaler (blue toned balanced palette, good for me and my eyes)
# -- base16-materia (great dull neon type theme)
# -- base16-material (very good for daily use)
# -- base16-harmonic (vibe baby, also nice for dark eveninv daily use)
# -- base16-material-palenight.json. (calm dark theme)
# -- base16-seti
# -- vscode.json (great coding theme)
# -- sexy-neon
#
# -- tempus_dawn -l (very calm light theme, not in your face)
# -- base16-cuptertino (solid light theme)
# -- base16-github -l (very balanced light theme with dark pumpy colors)
