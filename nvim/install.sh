echo "install neovim ..."
brew install neovim

echo "install golang ..."
brew install go

echo "install python ..."
brew install python

echo "install npm ..."
brew install npm

echo "install ripgrep ..."
# It is required by telescope live grep
brew install ripgrep

echo "install packer ..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "install config ..."
cp -r ./nvim ~/.config/

echo "install plugins ..."
nvim -c 'PackerSync' -c 'PackerInstall'
