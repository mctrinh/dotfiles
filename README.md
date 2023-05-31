# dotfiles

## Install Vim in macOS
```bash
brew update
brew install vim
```

## Install Vim in Ubuntu 18.04 LTS

Remove the Vim package and related dependencies
```bash
sudo apt remove --auto-remove vim
```
Remove the Vim package and local configuration files
```bash
sudo apt purge --auto-remove vim
```
Install Vim
```bash
sudo apt-get update
sudo apt-get install vim
```
Install Vundle (as pip for Vim) manage Vim plugins/extensions
```bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
## Clone and install Vim plugins
```bash
cd ~
git clone https://github.com/mctrinh/dotfiles
cp ~./dotfiles/.vimrc ./
vim .vimrc
:PluginInstall
:q
source ~/.vimrc     # optional
```
