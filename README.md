```
 vim            > vim config
 zsh            > zshell settings and aliases
```
## table of contents

 - [introduction](#dotfiles)
 - [managing](#managing)
 - [installing](#installing)
 - [how it works](#how-it-works)
 - [tl;dr](#tldr)

# managing
To manage the dotfiles, I use [gnu stow](http://www.gnu.org/software/stow/), a free, portable, lightweight symlink farm manager. this allows me to keep a versioned directory of all my config files that are virtually linked into place via a single command. this makes sharing these files among many users (root) and computers super simple. and does not clutter my home directory with version control files.

# installing

Install `stow` via your package manager

You may also need to install `zsh` or `vim` via your package manager to use their settings.

# how it works
By default the stow command will create symlinks for files in the parent directory of where you execute the command. This setup assumes this repo is located in the root of your home directory `~/dotfiles`. All stow commands should be executed in that directory. otherwise you'll need to use the `-d` flag with the repo directory location.

To install most the configs you execute the stow command with the folder name as the only argument. 

To install the zsh config, use the command:

`stow zsh`

This will symlink files to `~/.zsh` and `~` but you can override the default behavior and symlink files to another location with the `-t` (target) argument flag.

**note:** stow can only create a symlink if a config file does not already exist. if a default file was created upon program installation you must delete it first before you can install a new one with stow. this does not apply to directories, only files.

# tldr

Ensure you have installed `stow`.

Install either `zsh` or `vim` or both.

Navigate to your home directory.

`cd ~`

Backup your existing .zshrc and .vimrc files if any.

`mv .zshrc .zshrc.backup`
`mv .zsh/ .zsh.backup/`
`mv .vimrc .vimrc.backup`
`mv .vim .vim.backup`

Clone the repo:

`git clone https://github.com/calebkiage/dotfiles.git`

Enter the dotfiles directory.

`cd dotfiles`

Backup your existing .zshrc files if any.

`mv ~/.zshrc ~/.zshrc.backup`
`mv ~/.zsh/ ~/.zsh.backup/`

Install the zsh settings.

`stow zsh`

Install zsh settings for the root user if you so desire.

`sudo stow zsh -t /root`

After installing the zsh settings, you may need to change your login shell

`chsh -s /bin/zsh`

Backup your existing .vimrc files if any.

`mv ~/.vimrc ~/.vimrc.backup`
`mv ~/.vim ~/.vim.backup`

Install the vim settings.

`stow vim`

After installing the vim settings, you may also need to install vim.

You can set the terminal theme using zplug. Simply change the `# Load theme file` section in `~/.zsh`.
