
# get the name of the branch we are on
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " [%{\e[35m%}${ref#refs/heads/}%{\e[39m%}]"
}

# Disable beeps
#xset b off

setopt prompt_subst

# Nicer prompt
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
PS1=$'[%{\e[35m%}%m%{\e[39m%}:%{\e[39m%}%n%{\e[39m%}:%{\e[32m%}%?%{\e[39m%}] '
RPS1=$'[%{\e[32m%}%~%{\e[39m%}]$(git_prompt_info)'
PS2=$'%_> '

# Set some shell options
setopt                 \
	RM_STAR_SILENT      \
	APPEND_HISTORY      \
	INC_APPEND_HISTORY  \
	EXTENDED_HISTORY    \
	HIST_IGNORE_DUPS    \
	HIST_FIND_NO_DUPS   \
	HIST_IGNORE_SPACE   \
	AUTO_NAME_DIRS      \
	CDABLEVARS          \
	EXTENDED_GLOB       \
	AUTO_LIST           \
	AUTO_MENU           \
	AUTO_CD

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search up-line-or-beginning-search
zle -N down-line-or-beginning-search down-line-or-beginning-search
bindkey -v
#bindkey "^[[A" up-line-or-beginning-search
#bindkey "^[[B" down-line-or-beginning-search
bindkey "${key[Up]}" up-line-or-beginning-search
bindkey "${key[Down]}" down-line-or-beginning-search

# Auto completion
autoload -U compinit
compinit -u

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%BNo match:%b %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:*:kill*:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:kill*:*' menu yes select

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=3000
SAVEHIST=3000

# CDPATH
CDPATH=/usr/src

# Named directories
#hash -d linux=/usr/src/linux

# Alias
alias ls='/bin/ls --color=auto -F'
alias killall='killall -v'

# Env variables
export CVS_RSH=ssh
export EDITOR=vim
export SHELL=/bin/zsh
