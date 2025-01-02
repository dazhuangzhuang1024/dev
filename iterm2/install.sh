echo "install iterm2 ..."
brew install --cask iterm2

echo "install nerd fonts ..."
# https://github.com/ryanoasis/nerd-fonts
brew install font-hack-nerd-font

echo "install fzf ..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
