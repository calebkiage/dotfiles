# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    echo "Installing zplug..."
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update
fi

# Essential
source ~/.zplug/init.zsh

# Let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Load oh-my-zsh plugins
zplug "plugins/archlinux", from:oh-my-zsh

zplug "plugins/systemd", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh

# Needed by pure theme
zplug mafredri/zsh-async, from:github

# Load completion library for those sweet [tab] squares
#zplug "lib/completion", from:oh-my-zsh

# A zsh plugin to help remembering those aliases you defined once
zplug "djui/alias-tips"

# Updated fork of oh-my-zsh gitfast plugin.
zplug "tevren/gitfast-zsh-plugin"

# Gradle tab completion for bash and zsh
#zplug "gradle/gradle-completion"

# Better completion for npm
zplug "lukechilds/zsh-better-npm-completion"

# Additional completion definitions for Zsh.
zplug "zsh-users/zsh-completions"

# Load NVM plugin
export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Load theme file
#zplug "agnoster/agnoster-zsh-theme", as:theme, use:agnoster.zsh-theme
#zplug "bhilburn/powerlevel9k", as:theme, use:powerlevel9k.zsh-theme
#zplug "denysdovhan/spaceship-zsh-theme", as:theme, defer:2
#zplug "themes/blinks", as:theme, from:oh-my-zsh
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load


# Set keystrokes for substring searching
if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

if zplug check "bhilburn/powerlevel9k"; then
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status root_indicator background_jobs time)
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
    POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="$ "
    POWERLEVEL9K_MODE='nerdfont-fontconfig'
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
fi

if zplug check "sindresorhus/pure"; then
    PURE_GIT_PULL=0
    PURE_GIT_UNTRACKED_DIRTY=0
fi

if zplug check "denysdovhan/spaceship-zsh-theme"; then
    # PROMPT
    SPACESHIP_PROMPT_SYMBOL='$ '
    SPACESHIP_PROMPT_ADD_NEWLINE=true
    SPACESHIP_PROMPT_SEPARATE_LINE=true
    SPACESHIP_PROMPT_TRUNC=3

    # PREFIXES
    SPACESHIP_PREFIX_SHOW=true
    SPACESHIP_PREFIX_HOST=' at '
    SPACESHIP_PREFIX_DIR=' in '
    SPACESHIP_PREFIX_GIT=' on '
    SPACESHIP_PREFIX_ENV_DEFAULT=' via '
    SPACESHIP_PREFIX_NVM=$SPACESHIP_PREFIX_ENV_DEFAULT
    SPACESHIP_PREFIX_RUBY=$SPACESHIP_PREFIX_ENV_DEFAULT
    SPACESHIP_PREFIX_XCODE=$SPACESHIP_PREFIX_ENV_DEFAULT
    SPACESHIP_PREFIX_SWIFT=$SPACESHIP_PREFIX_ENV_DEFAULT
    SPACESHIP_PREFIX_VENV=$SPACESHIP_PREFIX_ENV_DEFAULT
    SPACESHIP_PREFIX_PYENV=$SPACESHIP_PREFIX_ENV_DEFAULT

    # GIT
    SPACESHIP_GIT_SHOW=true
    SPACESHIP_GIT_UNCOMMITTED='+'
    SPACESHIP_GIT_UNSTAGED='!'
    SPACESHIP_GIT_UNTRACKED='?'
    SPACESHIP_GIT_STASHED='$'
    SPACESHIP_GIT_UNPULLED='⇣'
    SPACESHIP_GIT_UNPUSHED='⇡'

    # TIME
    SPACESHIP_TIME_SHOW=true
    SPACESHIP_TIME_12HR=true
    SPACESHIP_TIME_FORMAT=false

    # NVM
    SPACESHIP_NVM_SHOW=false
    SPACESHIP_NVM_SYMBOL='⬢'
    SPACESHIP_NVM_SHOW_ON_PROJECT_ONLY=false

    # RUBY
    SPACESHIP_RUBY_SHOW=false
    SPACESHIP_RUBY_SYMBOL='💎'

    # SWIFT
    SPACESHIP_SWIFT_SHOW_LOCAL=false
    SPACESHIP_SWIFT_SHOW_GLOBAL=false
    SPACESHIP_SWIFT_SYMBOL='🐦'

    # XCODE
    SPACESHIP_XCODE_SHOW_LOCAL=false
    SPACESHIP_XCODE_SHOW_GLOBAL=false
    SPACESHIP_XCODE_SYMBOL='🛠'

    # GO
    SPACESHIP_GOLANG_SHOW=false
    SPACESHIP_GOLANG_SYMBOL='🐹'

    # DOCKER
    SPACESHIP_DOCKER_SHOW=false
    SPACESHIP_DOCKER_SYMBOL='🐳'

    # VENV
    SPACESHIP_VENV_SHOW=false

    # PYENV
    SPACESHIP_PYENV_SHOW=false
    SPACESHIP_PYENV_SYMBOL='🐍'

    # VI_MODE
    SPACESHIP_VI_MODE_SHOW=false
    SPACESHIP_VI_MODE_INSERT="[I]"
    SPACESHIP_VI_MODE_NORMAL="[N]"
fi
