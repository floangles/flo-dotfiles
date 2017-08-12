echo "Install X-code"
xcode-select --install

echo "Yo ! Installing brew package"

brew install wget
brew install fish
brew install ffmpeg
brew install node
brew install imagemagick
brew install autoconf
brew install git-flow-avh
brew install jpeg
brew install openssl
brew install brew-cask-completion
brew install libyaml
brew install phantomjs
brew install redis
brew install xvid
brew install ffmpegthumbnailer
brew install libpng
brew install memcached
brew install postgresql
brew install ruby-build
brew install htop
brew install libtiff
brew install ngrok2
brew install ssh-copy-id
brew install gettext
brew install imagemagick
brew install libtool
brew install node
brew install rbenv
brew install watch
brew install git

echo "installating cask packages"
# Some cask packages

brew cask install dropbox
brew cask install textexpander
brew cask install sublime-text
brew cask install macvim
brew cask install google-chrome
brew cask install iterm2
brew cask install flux
brew cask install chitchat
brew cask install postman
brew cask install spotify
brew cask install vlc
brew cask install skype
brew cask install molotov

# Install homebrew
echo 'Installing Homebrew'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# ZSH configuration
echo " Installation OH MY ZSH and plugin configuration "
curl -L http://install.ohmyz.sh | sh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# shortcut for navigation
bindkey '^[f' 'forward-word'
bindkey '^[b' 'backward-word'

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=( gitfast brew rbenv last-working-dir common-aliases sublime zsh-syntax-highlighting zsh-history-substring-search rails git git-flow ruby redis-cli)

# Copy all the plugins into the end of the zshrc file
echo plugins >> ~/.zshrc

source $ZSH/oh-my-zsh.sh
export PATH='/usr/local/bin:/usr/local/share:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/X11/bin:/usr/texbin:~/bin'

# Disable zsh correction
unsetopt correct_all

# To use Homebrew's directories rather than ~/.rbenv
export RBENV_ROOT=$HOME/.rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="./bin:${RBENV_ROOT}/shims:${RBENV_ROOT}/bin:${PATH}"

# Gather handy aliases
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Enhance history with substring search and purple highlighting
git clone 'https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search'

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# SUBLIME TEXT PLUGINS
echo 'install sublime text 3 plugins'
rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
cp "Package Control.sublime-settings" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User


# Install Ruby
echo 'Installing rbenv with version 2.1.5'
rvm implode && sudo rm -rf ~/.rvm
sudo rm -rf $HOME/.rbenv /usr/local/rbenv /opt/rbenv /usr/local/opt/rbenv
brew uninstall --force rbenv ruby-build
unset RBENV_ROOT && source ~/.zshrc
brew install rbenv ruby-build && exec zsh
rbenv install 2.1.5
rbenv global 2.1.5

# Install some gems
echo 'Install some gems'
gem install bundler rspec rubocop pry pry-byebug hub colored gist

# Install Postgres
echo 'Installing Postgre'

# Install Postgres
brew install postgresql
brew services start postgresql


