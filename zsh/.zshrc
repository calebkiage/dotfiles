# .zshrc
source ~/.profile

# Load all files from .zsh directory
if [ -d $HOME/.zsh ]; then
  for config (~/.zsh/*.zsh) source $config
fi

